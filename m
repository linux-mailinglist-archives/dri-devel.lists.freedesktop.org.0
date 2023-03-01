Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EDD6A7632
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 22:32:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4FB10E281;
	Wed,  1 Mar 2023 21:32:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641B310E09C;
 Wed,  1 Mar 2023 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677706333; x=1709242333;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tLpcgPZArEVBpFulTbQASqQNn4WoLMoRm47ts7iFNr0=;
 b=fV2qcqbfWuU12x/MIBqFUmFLCiclJ+0aoBod7Y+G6sq+2U6cBNhzgs13
 6X9/x8wYtoDnbywnSItcN0qcv5Jde3BPLJQ7/9wVxCCL4mp2x+3xf/iyV
 pvybncg3S08hpRwGUmfX5fe871C90XlIx507+fzSYttwHRGbEOvl1GC7b
 njmbay3MhuqX9c0IdDP2Klv+/GDULg4lDZ2pD3DjWtb0RfPd/aH3T+dWF
 O176IuobRmUc4TqOUsYkLsanYj5tq8SNFq+qJXn9NgFqaL24qcuAjHOrW
 VsmADtBQH3swvVbC2ZJENcHK1R7BbSKQ7aA67CDdPGn90VzoMxb4Ops6s w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="318329603"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="318329603"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2023 13:32:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="705002891"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; d="scan'208";a="705002891"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga008.jf.intel.com with ESMTP; 01 Mar 2023 13:32:12 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 1 Mar 2023 13:32:12 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 1 Mar 2023 13:32:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Mar 2023 13:32:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kybOE/yj4zVd+YGVgKpnWd/mk7/Puc/EkX4uyC+7YIVufZzOD3MlILms5cEu8v7oQeb9yVX50yGC9Y/zNDsGERF1Kg4WiuKXJAsDxB2Qr80msvy2TR+hd4P+yrjWdsW0QCmGst3K0kXYBBlUN/WEA/CaiZXSK3fhAZFpyPS80TbE1uZk9VBMWA9r6WtOh6ioTaG15sNuI5ufs8853MStUCwqpsLMAb5gieXAGdDrDGkB3d6W4Bxj9kcd0QT7mOEBvXwGfUdiSqDBLv0uPFZaigkVRN+KSbyhdYJk4kRWTDhf7ovKLiQ/BsFQJ0THzHUov6zDGekRdsmvgq+wpFhN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLpcgPZArEVBpFulTbQASqQNn4WoLMoRm47ts7iFNr0=;
 b=JDxg91mQcW2VcwGmBgiIrusBbtaHb9qBguwBsf9m5SZ2b0U9/iaJg8A9BGuA55ehqiL1ysSHQF/91Fj+iTa5EFgYpORNHKjcObXh2f/EMGZzvlxHCJnZ1MyVFjCiK+Zb3pkT4kRTxzXu81Vg0Pnb26q7cBzZEZ8Eg7p357r7a3srrNAGwI5RJlrIOdPeDhdZ9ItofYTP/TCGrvesqs5+7e06w10QnShK4SIxndw5ORVsDCZmEOGSjvXapP9A0TWtaxqIwPkX8SDlvSvLdveBnnuGM3r/Xp/iF+ESfhCXYnnnHk9Nypn5yPbTZx9PRlIgxV95Pp71Uzvm0kb+/aRO0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5971.namprd11.prod.outlook.com (2603:10b6:8:5e::7) by
 PH7PR11MB6401.namprd11.prod.outlook.com (2603:10b6:510:1fb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Wed, 1 Mar
 2023 21:32:09 +0000
Received: from DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::37fb:4480:3ea:b4f]) by DM4PR11MB5971.namprd11.prod.outlook.com
 ([fe80::37fb:4480:3ea:b4f%8]) with mapi id 15.20.6134.030; Wed, 1 Mar 2023
 21:32:09 +0000
From: "Sripada, Radhakrishna" <radhakrishna.sripada@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Thread-Topic: [PATCH v2 1/2] drm/i915/gt: Create per-tile debugfs files
Thread-Index: AQHZTC1/WnLqn6sXAU+dslUEAfQ7j67mcbag
Date: Wed, 1 Mar 2023 21:32:08 +0000
Message-ID: <DM4PR11MB59711D42555A3693D1CAEDF387AD9@DM4PR11MB5971.namprd11.prod.outlook.com>
References: <20230301110258.2140955-1-andi.shyti@linux.intel.com>
 <20230301110258.2140955-2-andi.shyti@linux.intel.com>
In-Reply-To: <20230301110258.2140955-2-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5971:EE_|PH7PR11MB6401:EE_
x-ms-office365-filtering-correlation-id: 09e4d080-43a8-4dd7-2c5b-08db1a9c6963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jjWBVIBu9hShKxyb3fMs66K/EtdKvsFQ3pGlqMUlCTV4oPvs2UWiYlnnIuRj7is1hNbNPiMjqhpnSXsG3ngnkhiURJ2sGWn/5Brpbj3eNZ+7cPQD9TsKu/HCyU9sg2KekZSnk82FQL7YyVX342Vp4Qm2nyJWNw6xuJAk6AtYfyu98SilK8FvzexxKJp3Et9zfip2zy1CrB2OAm9rsSyoJhO3PnnfNeZYsFYmVV+1BKjMofT9QGK00VZ3njlGnxuLO250AtyF08nbL1lzBlzbTCjG0yRPnkjh6NYRLvB5Od7cR+FlAnin70vNMoZp4PmkafS3T5M4DeL4fMdbAf4g/q/M64Abhyn5cBl2T1dNBNd9+wzmQr9GMbYEpXSLivnMf21PCFVvt3k/sWtfH/X0/wWDj5SHn0cIzUucUls6JUpgvNgMUr5IoN4QnaCbJD3luDKYOj20ktMPvY8omhxlKM0cb7ACaPqOkTVQmwQ4kEguBOuXaGPPeTLKLMYmdLuiZ1WuWNEGiCt9avbFFavUhrktd2h9Y1kiG6pktjxalMYtz9WhFswhp28wEwAdw07U1zzGf6WkmvcFgNNqy4UcUQLRejacaG2JaCZSmm4HyWIK4cu26aEEpNo1/+V4ykh/17JlXOpiAgse4oe44IObFnJywbobcYKiRbys+5s+H9MODyevXAQEvAoLESHg7MuC0tNTgbDeGzCpBZAIG4R2ww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5971.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199018)(83380400001)(33656002)(38100700002)(122000001)(8936002)(5660300002)(52536014)(82960400001)(478600001)(66556008)(55016003)(71200400001)(86362001)(38070700005)(9686003)(186003)(26005)(53546011)(6506007)(76116006)(66946007)(64756008)(66446008)(66476007)(7696005)(2906002)(8676002)(316002)(4326008)(41300700001)(110136005)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MStZbFFXcjk1MTFTeHByR2VjbXBmS1dwUjZ4dTNLTHZRSzI2N2V5RTFoZEZs?=
 =?utf-8?B?Q09UMHpOZEV6ejZKbEdaVG5vQVJtQTNvK0FsYkpwVk5RNmhuUXBYQzRXZXlC?=
 =?utf-8?B?eVV3ZjJ5ci9ESkJXZzlrak02V3p3MzRCM1EvL1BJKy9FRFgxbUJmRFJEdlFY?=
 =?utf-8?B?SC9PaHU3WlpacFM3TlVCdWJjRUdkTnN6QklJd3FCL3I3NmtmYVBIMklTallF?=
 =?utf-8?B?Y2hOVENBL3hYOFBTVlNIdDRaQXNuTXBRMHFoalUwYUtiMUMvQWFGdVdSMzIy?=
 =?utf-8?B?SWxpL0Y3bUppNTRlNU9aMjZCUFdidWxERFJ2U0tRUVovei9wcEtLY3VTZXht?=
 =?utf-8?B?Sm56SUdPYmRHUFkxcG9oZTlWdC85NXUzQ01UTEk5RGE3cFJoTjU5emxqRkdn?=
 =?utf-8?B?VU84cTgvZVBJb3VaRTVzWXRaZ2l3dm0xYUdQUG9CZFJldTNGN2NlOUY3UnFs?=
 =?utf-8?B?U29LR2s0VmhKYzU2M0drM2puSXI3ZjRhZlp1eHdTdTNMK0ZQcmIvTUFKeUpM?=
 =?utf-8?B?emNHVzZvOXM3b0F3QVVwaVppd09ieWRqMEdjUUl1eUs1Q2l1V3JMN2U1MFRE?=
 =?utf-8?B?TiswYWx1ejVScTJOd1NhTFJERXVXc1NiZnZuUkRhZml6S3lQbmJmUWE0V3NS?=
 =?utf-8?B?aVUyTThYU3pXeDkrWkFUTnY1SzFsNmtqUkZydlJJRHJGSEJsWFc3UW9WWjFB?=
 =?utf-8?B?aXNkU2orMGVFcjVuRUdhSkpyQkpiWWt2VEtydkIwcVNlZ2hBaXZPQVhYK29p?=
 =?utf-8?B?RXlHNkZBdDh6SUV0MTEwbnlLaUZMT2pJbzVLSjU4VTVZRW5JQ3BSdlRHODUy?=
 =?utf-8?B?RlZxT2dtUkRhU2Q5T1JzeHhUaVZpbVpnNXpvejdpOUJ4UkhaWjQvR2RDSjFq?=
 =?utf-8?B?VmdybzNSdExwYm8xSDhWWUxJendFRlUvbXlkcUlPM2tQODNlRUVWNS9XQXNI?=
 =?utf-8?B?VFBHR1MwWE41Rk1uZSttY0NXNTZDWUd1dTN3V25WUDl2YTUweGdVQXFMbWh4?=
 =?utf-8?B?dHVrYlZUSVlsR2pJdkd5dkVEYVY3Y2xyT2VmRDJvaWJlZXh1Y0lkUWQvcEsy?=
 =?utf-8?B?Z0VRZ0c3YnhDVVlDREhGendMOXpzd05SYTIxS2xwVDJVcWg0aUlldzVXWjdn?=
 =?utf-8?B?M2orcjhQL3ZVMnVUVVRQdGZjTnlGVmRVYldmblFIYkd3Mm85RlZWZU0zNDlP?=
 =?utf-8?B?VzRCL2lLdkx4MHo5Ylpkcm5SbzkwK08yVWRKT1FRVFg1WDkzSko5N1IvZFlY?=
 =?utf-8?B?Q3pQTWlxeE5kemNXT1paanZ5UUtJUUlJVXZmNlBvYTFGakxJbHV2RlZ4SE41?=
 =?utf-8?B?WXZjWWYxSlpIWCtsVlBTSVUyRHhQN2pLdzBuRnkwVVJBamdETDh0V0tjWGNp?=
 =?utf-8?B?V3VadG9iN0h5N0JxWC80VWQ2V2dTdmY3SzVacnNkL2NaQTlCQ2FFWEhvMzFj?=
 =?utf-8?B?ZFV3MUl4Nzl1ZWhzV2NKU1VHRHIweEhLZkNzODYzYXZMdmpvWVFvVVFvSG1R?=
 =?utf-8?B?aTNhTi9hWGVHRzF2c3l3Q2dOYjVXdXdQbzY3VU8vYi9vVTFHMTNKVDdMY3RC?=
 =?utf-8?B?OXhRR1lEZ3JKS1N5ZHhOUHRYQjlpTnpBaTJYUmM3ZGlWc1JtSDJ1cUlSMGhJ?=
 =?utf-8?B?cFF0UHYyUWJOMzZCOU1ycVdqR2ttVXJWZWU3YXE1UHJ1U0pCU1czNDN6UFo5?=
 =?utf-8?B?em9NZDEzanNxbFRucTBNSjA0ZHpPK2J1OWtHbkkrTlMwU0h0VDF5cThzY3FW?=
 =?utf-8?B?Z0RjeTFxZjUxWElIQWE2QnQxNXZGK3Z4Z1A4bHpxTytyb21nNitISTMyN1dq?=
 =?utf-8?B?bTduMVRtYzViUHlvZ3lvL25yTEVmcUpVaXBhcUNwOEFTRWtUSWlmVGtPeHp5?=
 =?utf-8?B?QWRaOTVhc1dOWEl1NUM4SGN0MVlaOTVOV1BiRHVQS25UcW9hU01Gd2w3NU82?=
 =?utf-8?B?Sml1WVRtNTZRZEdBNUVlUXJ4dUNWLzlBVmdpanI5eVBkZ1k2Y0ZxUE91SElq?=
 =?utf-8?B?THpQbFU0NkFsNkptOTlqWnJKbG9jN0QxUkwyZWhiWTBSYTk4ZUtOMUovRWxs?=
 =?utf-8?B?d3RnM2V0WEM5dVQvaGtkc21XM1pldmZjZU41QUJoM09vUCtFcVNONVdEVkhz?=
 =?utf-8?B?dVo5S3c5WXVHY09PWjAzY2xGeC84WlJDeDFmdlprWERodW5zMFZxeTQ0QzYy?=
 =?utf-8?B?b2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5971.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09e4d080-43a8-4dd7-2c5b-08db1a9c6963
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2023 21:32:08.8228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ss7anIhL7PIivBpCsBoMcxhF9hkCL1pXm2+vGxKO+MoDpY4CcWHHM0vGEIFrrmhEZed5tPurt0G2xhSNNSWJco4dD2vIIYGFyd+6giNG4nk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6401
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, "Patelczyk,
 Maciej" <maciej.patelczyk@intel.com>, Andi Shyti <andi@etezian.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIDxkcmkt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbmRpDQo+
IFNoeXRpDQo+IFNlbnQ6IFdlZG5lc2RheSwgTWFyY2ggMSwgMjAyMyAzOjAzIEFNDQo+IFRvOiBp
bnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+IENjOiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AbGludXguaW50ZWwu
Y29tPjsgQW5kaSBTaHl0aQ0KPiA8YW5kaUBldGV6aWFuLm9yZz47IFBhdGVsY3p5aywgTWFjaWVq
IDxtYWNpZWoucGF0ZWxjenlrQGludGVsLmNvbT47IEFuZGkNCj4gU2h5dGkgPGFuZGkuc2h5dGlA
bGludXguaW50ZWwuY29tPjsgV2FqZGVjemtvLCBNaWNoYWwNCj4gPE1pY2hhbC5XYWpkZWN6a29A
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMS8yXSBkcm0vaTkxNS9ndDogQ3JlYXRl
IHBlci10aWxlIGRlYnVnZnMgZmlsZXMNCj4gDQo+IFRvIHN1cHBvcnQgbXVsdGktR1QgY29uZmln
dXJhdGlvbnMsIHdlIG5lZWQgdG8gZ2VuZXJhdGUNCj4gaW5kZXBlbmRlbnQgZGVidWcgZmlsZXMg
Zm9yIGVhY2ggR1QuDQo+IA0KPiBUbyBhY2hpZXZlIHRoaXMgY3JlYXRlIGEgc2VwYXJhdGUgZGly
ZWN0b3J5IGZvciBlYWNoIEdUIHVuZGVyIHRoZQ0KPiBkZWJ1Z2ZzIGRpcmVjdG9yeS4gRm9yIGlu
c3RhbmNlLCBpbiBhIHN5c3RlbSB3aXRoIHR3byB0aWxlcywgdGhlDQo+IGRlYnVnZnMgc3RydWN0
dXJlIHdvdWxkIGxvb2sgbGlrZSB0aGlzOg0KPiANCj4gL3N5cy9rZXJuZWwvZGVidWcvZHJpDQo+
ICAgICAgICAgICAgICAgICAgIOKUlOKUgOKUgCAwDQo+ICAgICAgICAgICAgICAgICAgICDCoMKg
IOKUnOKUgOKUgCBndDANCj4gICAgICAgICAgICAgICAgICAgIMKgwqAg4pSCwqDCoCDilJzilIDi
lIAgZHJwYw0KPiAgICAgICAgICAgICAgICAgICAgwqDCoCDilILCoMKgIOKUnOKUgOKUgCBlbmdp
bmVzDQo+ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUgsKgwqAg4pSc4pSA4pSAIGZvcmNld2Fr
ZQ0KPiAgICAgICAgICAgICAgICAgICAgwqDCoCDilILCoMKgIOKUnOKUgOKUgCBmcmVxdWVuY3kN
Cj4gICAgICAgICAgICAgICAgICAgIMKgwqAg4pSCwqDCoCDilJTilIDilIAgcnBzX2Jvb3N0DQo+
ICAgICAgICAgICAgICAgICAgICDCoMKgIOKUlOKUgOKUgCBndDENCj4gICAgICAgICAgICAgICAg
ICAgIMKgwqAgOsKgwqAg4pSc4pSA4pSAIGRycGMNCj4gICAgICAgICAgICAgICAgICAgIMKgwqAg
OsKgwqAg4pSc4pSA4pSAIGVuZ2luZXMNCj4gICAgICAgICAgICAgICAgICAgIMKgwqAgOsKgwqAg
4pSc4pSA4pSAIGZvcmNld2FrZQ0KPiAgICAgICAgICAgICAgICAgICAgwqDCoCAgwqDCoCDilJzi
lIDilIAgZnJlcXVlbmN5DQo+ICAgICAgICAgICAgICAgICAgICDCoMKgICDCoMKgIOKUlOKUgOKU
gCBycHNfYm9vc3QNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlA
bGludXguaW50ZWwuY29tPg0KPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlu
dGVsLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBSYWRoYWtyaXNobmEgU3JpcGFkYSA8cmFk
aGFrcmlzaG5hLnNyaXBhZGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYyAgICB8IDQgKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvdWMvaW50ZWxfZ3VjLmggICAgICAgIHwgMiArKw0KPiAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5jICAgIHwgNSArKysrLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZGVidWdmcy5jIHwgMiArKw0KPiAgNCBmaWxlcyBjaGFu
Z2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X2RlYnVnZnMuYw0KPiBpbmRleCA1ZmMyZGYwMWFhMGRm
Li40ZGMyM2I4ZDNhYTJkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9p
bnRlbF9ndF9kZWJ1Z2ZzLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxf
Z3RfZGVidWdmcy5jDQo+IEBAIC04MywxMSArODMsMTMgQEAgc3RhdGljIHZvaWQgZ3RfZGVidWdm
c19yZWdpc3RlcihzdHJ1Y3QgaW50ZWxfZ3QgKmd0LA0KPiBzdHJ1Y3QgZGVudHJ5ICpyb290KQ0K
PiAgdm9pZCBpbnRlbF9ndF9kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCBpbnRlbF9ndCAqZ3QpDQo+
ICB7DQo+ICAJc3RydWN0IGRlbnRyeSAqcm9vdDsNCj4gKwljaGFyIGd0bmFtZVs0XTsNCj4gDQo+
ICAJaWYgKCFndC0+aTkxNS0+ZHJtLnByaW1hcnktPmRlYnVnZnNfcm9vdCkNCj4gIAkJcmV0dXJu
Ow0KPiANCj4gLQlyb290ID0gZGVidWdmc19jcmVhdGVfZGlyKCJndCIsIGd0LT5pOTE1LT5kcm0u
cHJpbWFyeS0+ZGVidWdmc19yb290KTsNCj4gKwlzbnByaW50ZihndG5hbWUsIHNpemVvZihndG5h
bWUpLCAiZ3QldSIsIGd0LT5pbmZvLmlkKTsNCj4gKwlyb290ID0gZGVidWdmc19jcmVhdGVfZGly
KGd0bmFtZSwgZ3QtPmk5MTUtPmRybS5wcmltYXJ5LQ0KPiA+ZGVidWdmc19yb290KTsNCj4gIAlp
ZiAoSVNfRVJSKHJvb3QpKQ0KPiAgCQlyZXR1cm47DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9ndC91Yy9pbnRlbF9ndWMuaA0KPiBpbmRleCBiYjRkZmU3MDdhN2QwLi5lNDZhYWMxYTQxZTZk
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWMuaA0KPiBAQCAtNDIs
NiArNDIsOCBAQCBzdHJ1Y3QgaW50ZWxfZ3VjIHsNCj4gIAkvKiogQGNhcHR1cmU6IHRoZSBlcnJv
ci1zdGF0ZS1jYXB0dXJlIG1vZHVsZSdzIGRhdGEgYW5kIG9iamVjdHMgKi8NCj4gIAlzdHJ1Y3Qg
aW50ZWxfZ3VjX3N0YXRlX2NhcHR1cmUgKmNhcHR1cmU7DQo+IA0KPiArCXN0cnVjdCBkZW50cnkg
KmRiZ2ZzX25vZGU7DQo+ICsNCj4gIAkvKiogQHNjaGVkX2VuZ2luZTogR2xvYmFsIGVuZ2luZSB1
c2VkIHRvIHN1Ym1pdCByZXF1ZXN0cyB0byBHdUMgKi8NCj4gIAlzdHJ1Y3QgaTkxNV9zY2hlZF9l
bmdpbmUgKnNjaGVkX2VuZ2luZTsNCj4gIAkvKioNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19sb2cuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2d0L3VjL2ludGVsX2d1Y19sb2cuYw0KPiBpbmRleCAxOTVkYjhjOWQ0MjAwLi41NWJjOGI1NWZi
YzA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNf
bG9nLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2xvZy5j
DQo+IEBAIC01NDIsOCArNTQyLDExIEBAIHN0YXRpYyBpbnQgZ3VjX2xvZ19yZWxheV9jcmVhdGUo
c3RydWN0IGludGVsX2d1Y19sb2cNCj4gKmxvZykNCj4gIAkgKi8NCj4gIAluX3N1YmJ1ZnMgPSA4
Ow0KPiANCj4gKwlpZiAoIWd1Yy0+ZGJnZnNfbm9kZSkNCj4gKwkJcmV0dXJuIC1FTk9FTlQ7DQo+
ICsNCj4gIAlndWNfbG9nX3JlbGF5X2NoYW4gPSByZWxheV9vcGVuKCJndWNfbG9nIiwNCj4gLQkJ
CQkJaTkxNS0+ZHJtLnByaW1hcnktPmRlYnVnZnNfcm9vdCwNCj4gKwkJCQkJZ3VjLT5kYmdmc19u
b2RlLA0KPiAgCQkJCQlzdWJidWZfc2l6ZSwgbl9zdWJidWZzLA0KPiAgCQkJCQkmcmVsYXlfY2Fs
bGJhY2tzLCBpOTE1KTsNCj4gIAlpZiAoIWd1Y19sb2dfcmVsYXlfY2hhbikgew0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZGVidWdmcy5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfdWNfZGVidWdmcy5jDQo+IGluZGV4IDI4
NGQ2ZmJjMmQwOGMuLjJmOTNjYzRlNDA4YTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L3VjL2ludGVsX3VjX2RlYnVnZnMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9ndC91Yy9pbnRlbF91Y19kZWJ1Z2ZzLmMNCj4gQEAgLTU0LDYgKzU0LDggQEAgdm9pZCBp
bnRlbF91Y19kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCBpbnRlbF91YyAqdWMsIHN0cnVjdA0KPiBk
ZW50cnkgKmd0X3Jvb3QpDQo+ICAJaWYgKElTX0VSUihyb290KSkNCj4gIAkJcmV0dXJuOw0KPiAN
Cj4gKwl1Yy0+Z3VjLmRiZ2ZzX25vZGUgPSByb290Ow0KPiArDQo+ICAJaW50ZWxfZ3RfZGVidWdm
c19yZWdpc3Rlcl9maWxlcyhyb290LCBmaWxlcywgQVJSQVlfU0laRShmaWxlcyksIHVjKTsNCj4g
DQo+ICAJaW50ZWxfZ3VjX2RlYnVnZnNfcmVnaXN0ZXIoJnVjLT5ndWMsIHJvb3QpOw0KPiAtLQ0K
PiAyLjM5LjENCg0K
