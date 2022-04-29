Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCF514D11
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 16:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42A10EDBE;
	Fri, 29 Apr 2022 14:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FCC10EDBD;
 Fri, 29 Apr 2022 14:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651242734; x=1682778734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WgvqC28vIMwAFoLEoc7q8/23v56zquQfurXUZrRlu80=;
 b=Bj4lI+maiXHrrc3Byx/MW5ixo8um/miaRNGIk9pnJwZQLSJbrnECDEVx
 t5dEJAmUIsGiMXmp9+1FNd9ix2Lks3aK+MgUI5vLE7SNGXrHWhVXyFpdc
 4DNU8fHYM4rUYnZnqzHhxS17prXb45v6JXSO6vmcfLa8ZTodceuVx617Z
 Sj/QBHcEWFMB/1qZiQPDwVVuZsr6UAInxd4amX90dbO/fsl6hBN50lJJL
 CwSWVHdn+xjTC20EcyEbCT/QQ6TayIHx6eo326ynASFrOXuV+LS1KuPaF
 uKsYXSDFDyBNdERBBEcmnoYI3wiwAFImAmRAp5jAK8TYpnzwJsNaw/jrS g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="265505075"
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="265505075"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2022 07:32:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,185,1647327600"; d="scan'208";a="732088277"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 29 Apr 2022 07:32:13 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 29 Apr 2022 07:32:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 29 Apr 2022 07:32:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 29 Apr 2022 07:32:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kPxMdu2imAifijV2xOa9d8mbYuxqzY0xi0RWibyItzNgHPREAwKyH3Ut37j/7rDkPEtism6P0lfzOBtPvtJWpd1A5LOCRxa8e1JsVktuVdYR6O61tSwNMDFJ5nSvzOYVTLJYvpr1RqzWNVrjD5WDT5bTIWo7cL0cJCRBc3XFFEgoubvmLQpBSspeRhux3pxWHR1Y7cay+jbtN7YtNTIatgBx7XHJGD127/OoAmhwB5Aa/b6h9wMqNgLBatsWcRlk1OMRDASDq6X3pQHRlxO9ETPXH0YqopmGwQDqYF+fF4flTDbpH7xyQWBPb/bCAEyaIs9u7u3UXP53HCSG/jTe1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgvqC28vIMwAFoLEoc7q8/23v56zquQfurXUZrRlu80=;
 b=QIW4zcWsRo6GmBoASgwnfYwpRATAa0Ri19GlLEVfpJAeE0MjucwlqHXa/4V7IruvonWxMvNGntK2QyzTILhiTVur1LjQcZBEeqM7ktdRWmq7Bk+4nJJb0r4eTmKEPjz6WKo/hDV2T6NgLlcGtigkhFG1Wch9Z+SLJC4x3mJqxxshyPJiTp0qmhQOw8C9p4fEKBPji637+vdggbMxr2t7t2fJWOzpvLs5vs9lBXm1F26BWcAzEGix2eSJ6c/gs1+EpCMaGlPjFVqbqdXdhwhdS7V2K7cCm9tLojfQIhQeT6CxKvUwfv6YQTjiqcwnsKWY8E0P2keazRqbtNqHSHLNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3177.namprd11.prod.outlook.com (2603:10b6:5:c::28) by
 DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Fri, 29 Apr 2022 14:32:12 +0000
Received: from DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::dc18:9af3:5549:4d3d]) by DM6PR11MB3177.namprd11.prod.outlook.com
 ([fe80::dc18:9af3:5549:4d3d%7]) with mapi id 15.20.5186.023; Fri, 29 Apr 2022
 14:32:12 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>
Subject: RE: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Thread-Topic: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
 drm
Thread-Index: AQHYTYoTwTlgF0pYfEKS/WLfzEM9Bq0HEBfA
Date: Fri, 29 Apr 2022 14:32:11 +0000
Message-ID: <DM6PR11MB31778321FCA58010AE44D867BAFC9@DM6PR11MB3177.namprd11.prod.outlook.com>
References: <20220411095129.1652096-1-bhanuprakash.modem@intel.com>
 <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220411095129.1652096-4-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42688b03-dfaf-4487-1300-08da29ed0c81
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_
x-microsoft-antispam-prvs: <DM8PR11MB5653FE58BAB1935955C26A5BBAFC9@DM8PR11MB5653.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XsiI+OOzB5+UOrnfjHPtdG/zEzan+WLNECZok2SdRzQ1Az/ACgiNlilYVASjGrdru1hUEB0PqH7ldyIBVbObTjUOCrp04rqRasdlylapSP4BrPmmceUxohUH6GnMRM7XCFjAJlrscQ4+4fXSMM8ZrlSe1rtZOd2oBFPD/3h95ndJlwVI6Dk+zn1TT6fjMMQQfWb/NhDcYNho2Cj1BIhSS6DYGI/rYwlvJSbORojFMskFFRBYUGnfLG/uVDWVlfZlO9b81s69UQdP1ZGDRiZsWfezHw4HBgD3HPkNaNvhJj6kePfrT7SsPGgFqt67EgFs5tchWeYOmf367nLkvOEkdorHPjkWiqdZKTeofW34TpfuG/guDJtEDISaYqpJYQ1DtkT9KXRiSs5XSvZV/dEIdUU2jZMTVaH0GHPWHrNFm4le+WaOTKSOFvS11GWuHH2rieWh1tJlhPzvXuks8uynFNbCAJqTiBvLPaMeAkFXd+71f59OqyAe1IsWRWmWSjF004jaNRzneDT6XsHUdUJzfqFqnq+wTl6Q26amCGD2J67kWyT0yZ+CTzYj/xPAY0x2r8F2VTD1JIp0paM2AsS4mer5b1K2a3WVAYk8fbLBcgvYM1YQo4GGZASKJu4TIWKildswwAtDupxYr2DWXnOC6i45l3JRiT4kAy7yqqSDsTL1XuehB86sqFbX4JluZwZMHFX9H4lwLwNUwpmu7oFPilcOJTmBi88y2ehZEA9kLwo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(53546011)(6636002)(110136005)(508600001)(9686003)(83380400001)(6506007)(55236004)(26005)(316002)(86362001)(2906002)(7696005)(122000001)(921005)(82960400001)(38070700005)(38100700002)(66446008)(66476007)(64756008)(66946007)(66556008)(76116006)(186003)(8676002)(4326008)(8936002)(33656002)(52536014)(5660300002)(4744005)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b23JMCAeThwB1r3ipP/6/wtoqsNP2aUULLEyj/wATmlbSm/Nn48TtXsCJO+k?=
 =?us-ascii?Q?2QHm5pseW4JQMy5q0eE0AFkmXl6dAzq4IPmLp03qu9qi3qkMAtGoKm72m2EY?=
 =?us-ascii?Q?Mh5h8SUV4jbJTR+4ittJFmJX9sicUF4MhO5FKRA/i8DIWaNhihbJT4N6f7ov?=
 =?us-ascii?Q?xad14mAr04h1NKa7vZVGbm1FZ5/81xJTpOhKld3nRXpkpNAwxwlxL3FZ+1dY?=
 =?us-ascii?Q?6ZiM0lp9iXL8tLmxWWF+qBVeJ64QEwAQ2x+HQXXQpJ1uk8med7J4UhSZVB2x?=
 =?us-ascii?Q?eXmIr8H+Ac6Ht9jE3D0zxCmIoz2oyzPxMjFI9p/FcBv9I5LV01ox7qHiQ5cF?=
 =?us-ascii?Q?Jk2NXUMaxQA9i46dhsJaFoy4Cyu67uOHbzJOtVgQxQkjvxfBKreNwUSs7Dpo?=
 =?us-ascii?Q?9h8+1dp9spc0qlVBY8Gy6Cy6mTnDWzDp/ueXlf8/vTLLgh/gasqDjEIzpxRt?=
 =?us-ascii?Q?CxY9TCHRMfoI1s1Qm1DqHQdsdusVAfEx56zla9D7gQ+iTVbqxtEj35n4SCOx?=
 =?us-ascii?Q?NAFATHccph658vzvCPS1sIEqbyoKbBnyWdfUr6poJvYB1QLui2jxp78qM2BZ?=
 =?us-ascii?Q?o7ofyBpxWyP+MV1sxh/Fdy/jMjjdR+exUCNQoOU7n00NUStZl3VldeZstUIj?=
 =?us-ascii?Q?iLf+1uL7jvECYmT60J/UuWfQCcMyZRFz0QOGBg3LtOBCo0vMxEfWK6n6gmcC?=
 =?us-ascii?Q?Hb4o6M2svAkMkfJasRhgGjoGeMTA61ZCvD3XThrWMMus6EPhYCJlF3PIOCRn?=
 =?us-ascii?Q?AdekBZ03NbaAjXPASsNDkZjQnYTs8A/pChmU0hDfDTOXtRN2ArN1LkL/Eli5?=
 =?us-ascii?Q?usrLUrbiQzQxI8lsVhQmegQjgR/gZMDAx83N7yak1uA3iJpc/PoPMY4DVi8k?=
 =?us-ascii?Q?LchotxHpV9T7dbggitmUd8ELZ9L0oxZfSaFyGthKhxwur8eji+xNcqG3XYgB?=
 =?us-ascii?Q?c6X2pye8yRlzkQg3hrurlMZ2AozRGyoMNT84/WBMaLoxsjZotIuM6/5RQx0S?=
 =?us-ascii?Q?dGw3pBY+aOM+8VX+0P0EKrDMKkPasRangEafQcEXvjdrbFqxGoizUqZBYced?=
 =?us-ascii?Q?QxBslCOyVyrVZoY0zyMpNntnHF2ffvVEbJMNF+RgJG8BiASyOVk813f1VdjH?=
 =?us-ascii?Q?T5XirIXKn/bFKPFNbvGs0q/vstvmrgcv2gOdqbs8M3l32WkMxRUj/FPXhP83?=
 =?us-ascii?Q?XjcipkZqAHHe1345OH4CAgF7obmU6k5QeU1d9Xfd88BVfos4CCl48xzyD8/o?=
 =?us-ascii?Q?WoYkqs/DD6TshT7U/Fl/apzwIOi6YiJ9skOwpUB+AKeRffn8AcO73qkhHw7H?=
 =?us-ascii?Q?SRiZoL9qmzon75LfloVgb3yZqkUzVt4ZHYeHCbFEIDRghNzRsoy5zyDr4U2y?=
 =?us-ascii?Q?sLJxYT7xKhKanOMccNFYiSl7sVM/4gy1vnjGSSBbY5f5FDaSbF1ZibHjvj84?=
 =?us-ascii?Q?xIdfa4QTPJ3YAbMIIcdfZD1Q832cjV/n08BIWU23WJTM8pkBp5S2VUMuNfPo?=
 =?us-ascii?Q?cgwM/lrvuMGnPlWLzoDh3qZ62pnKfxgMoEiYluwB6DlW6znGE7Vt235Tusk4?=
 =?us-ascii?Q?xdgZPkbjtvTUTiBvpTOKc4hI5cz4gpIKaCjOQ7QY2HY9wuo/AdAwq4MFRTh/?=
 =?us-ascii?Q?M6qIKpR4yI8TZAKUU/I+jC0fZJ/2Z1h85gFQkonPq//WQFaBYhmkQoY2f0lU?=
 =?us-ascii?Q?VzwPDdTZOr+P33/dHF6yFfkZh55585OKjWl3mm5zlQDybKeouo9iNrIbvUay?=
 =?us-ascii?Q?TMoeQkc4ZA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42688b03-dfaf-4487-1300-08da29ed0c81
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 14:32:11.9963 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXRq9q6uLmDe8MH18h3Vs6FOlwpiT4wpTfrxw8WfxLDJ2U2H+taLONjuXz/TtXDH54g8s07baGe/Gj+4Qt0s9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5653
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Monday, April 11, 2022 3:21 PM
> To: intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; amd=
-
> gfx@lists.freedesktop.org; jani.nikula@linux.intel.com;
> ville.syrjala@linux.intel.com; harry.wentland@amd.com; Sharma, Swati2
> <swati2.sharma@intel.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Subject: [Intel-gfx] [V2 3/3] drm/amd/display: Move connector debugfs to
> drm
>=20
> As drm_connector already have the display_info, instead of creating
> "output_bpc" debugfs in vendor specific driver, move the logic to the drm
> layer.
>=20
> This patch will also move "Current" bpc to the crtc debugfs from connecto=
r
> debugfs, since we are getting this info from crtc_state.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------
