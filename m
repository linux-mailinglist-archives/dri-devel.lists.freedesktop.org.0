Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B33548146
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 10:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4687A10E29A;
	Mon, 13 Jun 2022 08:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B0710E29A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 08:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655107532; x=1686643532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=o5M9+qm1ld5ovc3GGMsy1YHQiyFf+f69Lzpfc0HjxiM=;
 b=XsQmxNoF0vzKJp2rGBdg5uLsURrFx0E269A0Z67oS8sTtW/fTiUVUU7V
 WnSy1gihggpkFJoiC8Cl8LFXpj/zQASFUSO6QLk4OP4DLxCVLlGhnzyKq
 jI4Ke5Pl6/BIKOiNb42dw4hpMnuDw6BXZnr8gAWQDaIhiQcP/N0cmvAus
 0wkEv+PABUVgawDt+dwvim3300f3gXUSBtdNzA/edTNTOFH4xzGZ3oJHl
 mBpCkaQXm3D7Z4YpvjY/8q1TL/VdnHjEX2Da5yeE/474qcwAGyBd9oMtw
 b0IQuoEMMiul2VeTnuyY+fnrKN9MZd/pzwywOPTszhv0L/UpEoAiO7qWJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="276982594"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="276982594"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 01:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="673147496"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2022 01:05:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 01:05:31 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 01:05:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 13 Jun 2022 01:05:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 13 Jun 2022 01:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFMi0XMfhzKr+vUKFPotFg6fW/3g982lN/zyGdeXrmwjhY0x4QJS0YIwaS55c3Z8+S0eQz1nTvvaIN6E4V9TnwHEZYvKF3miHhoFl9BvFyF1bu5CjQa/kj1Jh0U1XNqWZE/Z8TKwfs625kHd7/jj2mdtQIqasle/lMo0rZxFZ/laweHkD/AroMPAqTDthb76R0mEwk5GSSBK/WCvsoC0jhhZIyvb6TaKxSXR7Iq2jDrzqrLi5YpFZFeYD9vEQlApOhbmy0Qz8BvLd+u3Akhi6FJwHaBHJ8J7xhXB+eZuKIemLk1dOPHCBmwvIUXPdoyQyY8n+fSY8xTYyj5NpsqCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kof9c/M/wa8zhN4kua1BSA+D1/7iP0HQD7rL8a7ACGU=;
 b=FHs3v7c/jOnz/EwccLPVfHeMBqR06VgZSTE2yC5FcqveifWycHyu+KokfEgn9vZe4t+ETyYeEGJaTcWAMLwyD5/Lek89Kjcb3ehvgUDhOcOVtLtUX7C8g1atobhEZOvxhqcJt56768U+bwIOhZJzpoajYVn6HpGzGasC6xsiBk6+fJwWOOKWD4l1PyM33uUCz40+gHSnt7PkY+5gJ6xjtE0/1EXG2vLtgx5U+T4XyeY00BCzmGo+VEt1+snddXwiKv8FWE6gvun/spsWUQiQ17Kl6QH5xMi3hUuD6inVqtkcbbasQ36kE8jw1q5o7TGb/39NlNdfulgwWgb/tJDuaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by BN9PR11MB5419.namprd11.prod.outlook.com (2603:10b6:408:100::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Mon, 13 Jun
 2022 08:05:28 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b%7]) with mapi id 15.20.5314.019; Mon, 13 Jun 2022
 08:05:28 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH v2] drm/edid: ignore the CEA modes not defined in
 CEA-861-D
Thread-Index: AQHYft3nzf/FBoKV60SCgsfoBOGz+K1M78OAgAAJwUA=
Date: Mon, 13 Jun 2022 08:05:28 +0000
Message-ID: <SJ0PR11MB58945B1FED80408B829D6D06F1AB9@SJ0PR11MB5894.namprd11.prod.outlook.com>
References: <20220531103421.11363-1-william.tseng@intel.com>
 <20220613042707.8525-1-william.tseng@intel.com>
 <CO6PR12MB5489D1366E44E62AFE5A104AFCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
In-Reply-To: <CO6PR12MB5489D1366E44E62AFE5A104AFCAB9@CO6PR12MB5489.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-13T07:25:22Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=bfe34404-cdb8-474a-9659-739ac2272273;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7c68b7a-51be-41bf-337a-08da4d137ac5
x-ms-traffictypediagnostic: BN9PR11MB5419:EE_
x-microsoft-antispam-prvs: <BN9PR11MB54195220C3E2F217CB8CA0B7F1AB9@BN9PR11MB5419.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gxxvp+ZenFvgMch9rh5C5gtIDiTjIdlOpDyM1Im7rpY/U9E43vLMV7HpebMpweqCkrZwXVJ6se8aWJ4QHFiLEVzDowB2R+SPJ2rPr7pg87rHXOieSzt9zP2Kd3WDI/c6+KjHPDYNwMtpsVflWaaZBogPgU8UIsSZzLLU3nEW3cR+KNdDmKpg42X2u3H9OSpTWFrma4rvFOTjsp8OoXf1qLLF90YbBms4c6/XL85U2wC0iouYyfH3fmeUofoKB3XcLgDrkyyXYWW1Mpp1/r1/2+9PCJmcKo5QiSNeyA0zY4KOdVZgaSbntHTUa3u+RVq20/2r8XdSGR408ow+1yBeK7BtvyU2AW93TeJV+QHdsEbMHDr99ZMTWSeJoLFvIxQHk4mJP9YpWZs+ulg8t7o+YI29gDffG7Vn+guznaxxZANMYgh/ylDNXiddOzUtZq0vxFxGeat8wVVqNXBxtezfPzQ0Tq17EAHKPCLjVNUoH/Ai7Dyl4WFTa43fXIIr3BKcLsy5rW0psz95/3wiGJ6DSx7lqREJzfUKAVgIdsP3C0WnWghz5feW7TEf9HkC69NHNh8jUn9o5j2v7kmrb8sVOaPjD1Q8PmAoL6iF/1bKGkCwQMm9QyoMOfqZp3fIO5rL1vXdt6beeTcEz5kqUcL75YIvHNJe2I8MaR2hk1HpUuFQdcGAkGWXeMIwBFyx3j+y2aGvEXF/sqfNl6k3uTOAWw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(83380400001)(55016003)(110136005)(2906002)(66574015)(86362001)(82960400001)(186003)(8936002)(33656002)(38100700002)(52536014)(122000001)(38070700005)(508600001)(8796002)(316002)(5660300002)(76116006)(66446008)(66946007)(66556008)(8676002)(66476007)(64756008)(71200400001)(4326008)(26005)(53546011)(6506007)(7696005)(9686003)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?INeVvnZ4buzXOjSLwGGv7SuyRudjrZAIQ8v9HKkm4gFgyIEKuVbsBzsX47?=
 =?iso-8859-1?Q?gsBkI5xY6FcWO+j2RA/p+TiEGJs+O/7M7Q+vsGsQktl6iUBf6ELlRQ9UNp?=
 =?iso-8859-1?Q?6aiX7wjlmVHZJzLnKNNqCFVw3/yrJSxK3YaqGnO6U5Id1oGC5OxC7OyRfr?=
 =?iso-8859-1?Q?4nPBkRa4/yWf5jvo9v9aMUWPcgsY4v2oQAShI7zy8gi5lQ7ls/z2K9exf/?=
 =?iso-8859-1?Q?UF4Ge22djnEube23TV+OdPBy6UPWUswmAA8ehu+bq6/pg9+8k97m1mCvfZ?=
 =?iso-8859-1?Q?HDE5Jbsjo4/Lg4BD1L4dG52jgot5L4vJE5EQM5pTArJciZ5sgnISAgAxlH?=
 =?iso-8859-1?Q?p7+2ZF99Jg3bJwAtwjs8x2/XsLCFKUjkspbbC5TOQec9nlk5lomYwSoc4d?=
 =?iso-8859-1?Q?3PVPQFw66X+2rHAcuGbsyU6MbXwYIUomIMOc9djX/7x66+h+3xRyOKsVyv?=
 =?iso-8859-1?Q?2lYDZEUf5xE5FaB1RxIg9oq2Sw1jhra3SOz1Kh8zvqyLQlJSBGPTCOvir0?=
 =?iso-8859-1?Q?pkxj9z91SayqKoJs3BppX4T4IcudUNm54UCpMy+KI1f0orTlgjlH3SgnKW?=
 =?iso-8859-1?Q?JDOClE/RgZwHibmXglUSNNU2JALbWTrlzFUMk0/aDXiCM1MIxD7ltOMRzZ?=
 =?iso-8859-1?Q?OAzAOOWnnpjnJpJcKou9/eezk9zbZ5WqwWX4SlqgEr4kCHwmvxdpXC0P6H?=
 =?iso-8859-1?Q?oLEgRbadg3YCt7UDUOUHdjo0rVCNI/dXkaQmkU3SESxHhbLepH5KrT0DKW?=
 =?iso-8859-1?Q?v39Zjlr2+S8SNtt/mrrvyXNjbIqtlNaNYb+dgydrGuw82yyzJ1AsKceub5?=
 =?iso-8859-1?Q?hg/u65CqMs/EgrUXGbCZdMG3/WGTytsRnQRVhhwYAPr1KV23/7AxB0vrDW?=
 =?iso-8859-1?Q?u22jkOClYZfQYjrmiJzw4GN0r5Jk2n+DYJwq4/j0YGqnHRIJ57CeOF8cQm?=
 =?iso-8859-1?Q?3aRPFNcWtOa/CMVE0WTtxHBcJx9QPjp81G7YBc663TWt8GCq2vKgguLUKM?=
 =?iso-8859-1?Q?I92dzF80devfJSiueiz1WSSM/pk9Ee/xv7m3jRWrX5T4Gt3N8JMzwNc54O?=
 =?iso-8859-1?Q?LS1phCqr0selgn/zLMwDPfUEWIEdm83nzMe+8NUcU+nyEg6wgPy1JdOgvh?=
 =?iso-8859-1?Q?NkZFQp7+7f4kItB7t9/GrKrKs2f5n2nGFlStN466Z6FnNFXabBbg3PB24J?=
 =?iso-8859-1?Q?ShhML0g5nvPCBLzY4wCBVvRIqAIUGBaW2yE8QN1OBK4VIerKoRry2d9/Qz?=
 =?iso-8859-1?Q?hdAyOekY4DRqrtxYSgtEfnTzuuYVabb/KOq2I3tGV8HnBx21rqrhhBhQBI?=
 =?iso-8859-1?Q?dwSZNuOkqMFXVcmzob74MlLBT5upbT4cjmfA+YeSHCpm1OBJuDCKnx2ptX?=
 =?iso-8859-1?Q?vkQb5lACBtMhG6+Tm3v52sMOXbZ74hu+fatSk+aOg9kWq9YUD3+DE8lWCS?=
 =?iso-8859-1?Q?YReovgIoglnq9aJL5qHT+TA5FYB9kB760dZnOM6XVVf6fGGGa19CfADVF3?=
 =?iso-8859-1?Q?ZL4aL5hpA/CWBbryH9EqjqbLILnd3ANoURRRnQF1hCJQd+9/UWyKx6Zi+O?=
 =?iso-8859-1?Q?4qbG7veVL5/XAFtwiLad1YDF3MFpa5G2E4n/sqKKN60zL1S50LxpfsEk6X?=
 =?iso-8859-1?Q?rQPlio4EWUWRvkTf2tWAgAASxc/bTuCEU4QBxCevVQjDSHzHDjqAKrlnII?=
 =?iso-8859-1?Q?WSMHF14WfarKJq2/SyjInsI7PVqlxCndl0A+QA8pA6oKeyjdGU5yJp8/Ye?=
 =?iso-8859-1?Q?vlg18M2CN4LSp/7YyYgL8qMbdyNTX00wcPXZ6g7CbB8D90Qx82/18oLQR6?=
 =?iso-8859-1?Q?5hXt/sI2aA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c68b7a-51be-41bf-337a-08da4d137ac5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 08:05:28.5495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KPLdE4V3QTriNjb4OsuScX00oU5BkEtuDtWB2T79Ach76BJEagDlgMyv5f+ZHaMkEL8oVVHvm63DUXrHCAhguQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5419
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
Reply-To: "20220613042707.8525-1-william.tseng@intel.com"
 <20220613042707.8525-1-william.tseng@intel.com>
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Wayne for the comment.
I don't quite understand what the typos are.
Could you elaborate on them?
Thank you.

-----Original Message-----
From: Lin, Wayne <Wayne.Lin@amd.com>=20
Sent: Monday, June 13, 2022 3:25 PM
To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop.o=
rg
Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>; Jani Nikula <jani.ni=
kula@linux.intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>
Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-8=
61-D

[AMD Official Use Only - General]

Thanks William!

After fixing few typos below, feel free to add:

Acked-by: Wayne Lin <Wayne.Lin@amd.com>

> -----Original Message-----
> From: William Tseng <william.tseng@intel.com>
> Sent: Monday, June 13, 2022 12:27 PM
> To: dri-devel@lists.freedesktop.org
> Cc: William Tseng <william.tseng@intel.com>; Ville Syrj=E4l=E4=20
> <ville.syrjala@linux.intel.com>; Jani Nikula=20
> <jani.nikula@linux.intel.com>; Lin, Wayne <Wayne.Lin@amd.com>; Lee=20
> Shawn C <shawn.c.lee@intel.com>
> Subject: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-=20
> 861-D
>=20
> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
> higher vic than what is defined in CEA-861-D.
>=20
> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
> displayed and the video format is indicated by both SVD (with vic 90=20
> and pictuure aspect ratio 64:27) and DTD.  When connecting to such=20
> sink, source

Typo - picture
> can't output the video format in SVD because an error is returned by=20
> drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the=20
> infoframe with pictuure aspect ratio 64:27 and the vic, which is=20
> originally 90

Typo - picture
> and is changed to 0 by drm_mode_cea_vic().
>=20
> To work around it, do not set the vic 0 so the corresponding mode may=20
> be accepted in drm_hdmi_avi_infoframe_from_display_mode() and be=20
> dispalyed.
>=20
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Wayne Lin <waynelin@amd.com>
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: William Tseng <william.tseng@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
> index bc43e1b32092..a4582627ec9d 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5876,7 +5876,8 @@ static u8 drm_mode_hdmi_vic(const struct=20
> drm_connector *connector,  }
>=20
>  static u8 drm_mode_cea_vic(const struct drm_connector *connector,
> -			   const struct drm_display_mode *mode)
> +			   const struct drm_display_mode *mode,
> +			   bool is_hdmi2_sink)
>  {
>  	u8 vic;
>=20
> @@ -5896,7 +5897,7 @@ static u8 drm_mode_cea_vic(const struct=20
> drm_connector *connector,
>  	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>  	 * have to make sure we dont break HDMI 1.4 sinks.
>  	 */
> -	if (!is_hdmi2_sink(connector) && vic > 64)
> +	if (!is_hdmi2_sink && vic > 64)
>  		return 0;
>=20
>  	return vic;
> @@ -5927,7 +5928,7 @@
> drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe=20
> *frame,
>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>  		frame->pixel_repeat =3D 1;
>=20
> -	vic =3D drm_mode_cea_vic(connector, mode);
> +	vic =3D drm_mode_cea_vic(connector, mode, true);
>  	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
>=20
>  	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE; @@ -
> 5971,7 +5972,8 @@ drm_hdmi_avi_infoframe_from_display_mode(struct
> hdmi_avi_infoframe *frame,
>  		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
>  	}
>=20
> -	frame->video_code =3D vic;
> +	frame->video_code =3D drm_mode_cea_vic(connector, mode,
> +						is_hdmi2_sink(connector));
>  	frame->picture_aspect =3D picture_aspect;
>  	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
>  	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;
> --
> 2.17.1
