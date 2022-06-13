Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 741FB54851B
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 14:22:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C362510E44C;
	Mon, 13 Jun 2022 12:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23FC010E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 12:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655122962; x=1686658962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=TXgWZYuKHeGpDwLZ2PSZdKrkXDBTRzMYM+0uc4QWFq8=;
 b=hqGSL0NID/JulJoB2552NQB2CorsOkGeM1MVQ5TA5+44EbsESmbOJLuy
 +eI5s3n54b/rea7pkUS2jSHYS5QQDyAJC+/h6NZneH8whsL7r9VIDcNUA
 zfBdEKSvrdYXXPFXFUpdWkQYZLVJC0kr7IwaWNEGVqCo1FX2y5m1lZhLQ
 Fka/l0YThm/bCd+5C3/rQQ7VleI/Exz6s6I1zX8lHqOwz1vBfq5GdelSg
 UFWw1zln841FKEI3RzDXed/ZYQgclEdbz6ELNNRT8lOAM7REhpodoE5O+
 /kfrJGOqXLdhnxB1A/FArD1fD2Kt6pJRuP2VCUu6M8bFKuAVAU9GXvaTE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10376"; a="275798759"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="275798759"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2022 05:22:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; d="scan'208";a="587766510"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jun 2022 05:22:41 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 05:22:41 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 13 Jun 2022 05:22:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 13 Jun 2022 05:22:40 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 13 Jun 2022 05:22:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NP08sW/tkTQ/6MLMxvNSrCG2M3/RHv/Pqb9Q+PUqD+zfVt72UYgfTj/6Gck8ILH1qqm6BtrfoDyKmDm2x8rBEtvbjjow2iGfXcKMS6istjSrt3s43NHj+AV3nsQC8qbpUtO5Km7g9H2tHrbTQHbPys/dw8XPmP7ziAdDCWlav+7pMTaGF6ThaSF5+r8v9VeJN0UXBetOX6sWN/zxqVgcQ8tnV8l2vqlObcBmSnAwgNXRCqDFpRtW5w+vfyazLAPRdNswXu1QVAqss/+OxAxhYEGA7TJw3oPL35prr5Z6U48jRqhj+evrvgZFrY0jlBjS3daVIpeLRNgcxnpzDUB18w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWR+vEjZ+GWPy+ZDcPAG2m/YW4iU5+sBY+0AzqRFgfE=;
 b=FIL5++9T5Z3M3wPBIBtgYefmPvxdqIZEDCVLmVmMz5CKQJee6RbfM/QZpDF0w9lWPFPZx6+6Ll77tBb6Zcn61B3RiMAzYuJ1DOWDFIGBAp7BT1CcgZhIVEUUyu+noUkE7uxlwY/SNLMbz5Iwkpjny3Agfp/n3PqKBdj1lQL61PgewDFJijPFcxlsiwNNVe5DrnrIX/MIC3bugBr4Al5nEY0rAOuc3pizqE8gorrgyYyvOyiminchpgce8SuxYd8gzvCqNWqgDQB3L+HrveCwdQypAs4uJ4eek84EX5zVfSvhdprbKiFhEuy/Fv9gtIQJ4JQjg7YaetjzKD2TDC+F8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com (2603:10b6:a03:42a::19)
 by CY5PR11MB6090.namprd11.prod.outlook.com (2603:10b6:930:2e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.19; Mon, 13 Jun
 2022 12:22:39 +0000
Received: from SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b]) by SJ0PR11MB5894.namprd11.prod.outlook.com
 ([fe80::9151:e836:1a4c:a04b%7]) with mapi id 15.20.5314.019; Mon, 13 Jun 2022
 12:22:38 +0000
From: "Tseng, William" <william.tseng@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2] drm/edid: ignore the CEA modes not defined in CEA-861-D
Thread-Topic: [PATCH v2] drm/edid: ignore the CEA modes not defined in
 CEA-861-D
Thread-Index: AQHYft3nzf/FBoKV60SCgsfoBOGz+K1M78OAgABR5+A=
Date: Mon, 13 Jun 2022 12:22:38 +0000
Message-ID: <SJ0PR11MB5894B7FD0621531B552E9593F1AB9@SJ0PR11MB5894.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: ba92b763-a297-4eb9-bbde-08da4d3767f3
x-ms-traffictypediagnostic: CY5PR11MB6090:EE_
x-microsoft-antispam-prvs: <CY5PR11MB609056E5A02CAA84C9CD9C74F1AB9@CY5PR11MB6090.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CD6Ugw/BPYhqD0uEjcGcH1gZGO8hrVDb/083PZ5yyhv4RWkJ4xfNfO4g01W/vmSgvqFdCp/8xAPOIvjMIwzvcFIRcGWeF6IATTyLZC0v7SpLVFuOPhhKy91aDDUlhzztd46mRDP7MnYkFZdEgrqK1skvJHVhY6H0u0+f66HtmApgI0ZZ9qbkCyMYgKHn4kCtlJxf85OYxBwe5q2nVjLDU3RcqyRCRDfhWvyOhh9EHnHYeh8Qv0t5UXhbpZCqV+23bP6a1DjLRr/ALXc+d3QvObISIk09oWX9XlM+1VP9kBkPMlwCy0s+5oBwPoTQwvWNA3ofx6kiU0h0W6rwj4LAi+G+L2siumOxa+KetC+2QJgcXEHvNVe4BTe5ZzdB50W1DPcT08Vcj6sL616SuFtK2e8HZhkNrMg6WjlyvmuTijUh15+EzmmFJshPOf8PVzgSPVzM2amhCsU4lX/3z8i1n5t8DJHxXdPCiBmqqwNIzhDCMnRFgAphQwmrNP8iU0IlGC3aYytaEUvkqY+LSWy2Fanex9zGbEbf+sVc4gObYNO1ft8DDqd9gsROV+5pw3XMtpcS6r63VSESCIq2jrVkHg76phaMx8wbQXUPyBowFGHXW+WQCTIT/mPqTpZXinz+RdypYyhHsH/zbimiToH45m+i+Id9h2TRBSd7Gn0OhEuoHltZpphBPKfLIrhnxN0C4YhdlxPTExrKwEniJYdQ9w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(83380400001)(8936002)(2906002)(186003)(66946007)(66556008)(6506007)(26005)(508600001)(76116006)(122000001)(7696005)(33656002)(5660300002)(38070700005)(71200400001)(55016003)(82960400001)(38100700002)(66476007)(66446008)(52536014)(8796002)(4326008)(64756008)(8676002)(53546011)(66574015)(54906003)(9686003)(316002)(110136005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xbUzRGL4osUtgBb0Dk1uKwx/EEn6aFnVlMa8+e0detAmEkTNgJbOk8RK+H?=
 =?iso-8859-1?Q?TTvDSC1j7k1NfEWiMSyNWLlj1jOSke6beIHkb8HhKqcwZYFzgXI7i84HP8?=
 =?iso-8859-1?Q?CpnLCiSFPHYLZzZ44/KX+Em7kOMVjyRWbYBfTjx0Jx+3Us3wV25XPJgn9m?=
 =?iso-8859-1?Q?OR+/9skS5JCq4T7DaLi1UwdGFtMdB1fT6+md8aBUG3FIRc6KOlAo/xkmJJ?=
 =?iso-8859-1?Q?9NIxQvMMMrKWU9sfDbK2HoQLEGzcg56mi5zHQck0n1t2WTUYUT8v7rVgna?=
 =?iso-8859-1?Q?16SywZ+FDhTyW/EXesiIqZeuENXcfziOqjc27R+3uAcggPphvBzcjQxKPk?=
 =?iso-8859-1?Q?Cq4v1CrJrp2fIVTSAkyjEtp1i0eB4q7Y4+aTLIhBEosKqaZQeWaciC0bqE?=
 =?iso-8859-1?Q?SE3+IgtkowT/Cny93OBMHSANmY0CLRbVVgbWAaO5FIbxW+bGa9715T7fwV?=
 =?iso-8859-1?Q?QhBMygVnLtxApgRAYlrJHG9GyLaGMGw1Ti1PEY+098G2pMwPqBQQg+l4RW?=
 =?iso-8859-1?Q?Z6+oOSApG88JKlgI0tYqZduzBIdDq24ptktx3UweS36gjobn3co/nQym7q?=
 =?iso-8859-1?Q?vFHHRuPT81s3ujpdRMtc1cRpE2JtthYavQb7IpajuM9VlChH9KPNsSK3oA?=
 =?iso-8859-1?Q?ES0vhgxXcDX6Oeppv/HdbqdoS5Y6miAAh1uap5BDXZ9ghrTc3zd6khzLDc?=
 =?iso-8859-1?Q?kgXLzBH4bSZu7bDuDIrwzlV57mTkhghevKOK9Sw3MbI9bNzFqTzLkCpip2?=
 =?iso-8859-1?Q?cd+atH57rQi6S227I49xXWumJMWfwuFFsu6PQed2dHa45k1HLJEsANgtOG?=
 =?iso-8859-1?Q?aB+hoDP11Ed21sqcxVw8GlwNrGZOZmA8ECuma8ZcmdWRc29U8sXZGtorAp?=
 =?iso-8859-1?Q?tYUg5zHtwfCEelIh0g2g6kx83GlvAMvOukc2LK3OpGKE/ygDBELdO++8Nh?=
 =?iso-8859-1?Q?jHtekgZjTh08XrM5XegI5rZ0rmY97bOYxgz6nG9zgbAbqRFWztVpNLvJtc?=
 =?iso-8859-1?Q?ACBw0Hw079yK3YBH1HpNuPi+iV6FRu4aJkJt276fbDd4pr4q+WGaZAqWP6?=
 =?iso-8859-1?Q?RcHCNGWweEh0/SPYx0GkSyZqWikyO2u/MlfIOnrqBxv+/52kjrfvbHYyG8?=
 =?iso-8859-1?Q?ZiwvjeLqyFsw1TVCwqcZjcQBxeWTDSOtF3LdW3NPNTjjse6e562+GXw8CC?=
 =?iso-8859-1?Q?GF5OHZRR/EvhpDv0G/IQPxNiCP7Ldgq+dcBK9zIEanOkZxfaPc1EHpyLF6?=
 =?iso-8859-1?Q?4PdtDWk9/KVf1Q1NQowW5I+CUoBjLX8CvZjhIhilRgt6p8b3yph11phsNK?=
 =?iso-8859-1?Q?rzqc0KikHTa45LQDmrcULevblVS8YBMTAfCqlVaJscKGuef7TjT+MwCHhR?=
 =?iso-8859-1?Q?wG6bTp20zbJ/jhLvy7RL+2h3KP43PLrLD38B2r2OpLy9o8WQ0nfI5GSrFP?=
 =?iso-8859-1?Q?H1zhxu5NUjq72bhxw30bnSm/OZQM2Zi4sGJ8yrUP5towQwc5Qqr5TiCLH0?=
 =?iso-8859-1?Q?Vlu1g+hMdCT4i9R29KiIz3aRi43JLUFB6AhnQpej8PMIxWkjcptZCishvd?=
 =?iso-8859-1?Q?lYeYDMogPFnyEXC/AN+45CCpvzeSX2qCRpzYbNsaW2eKEJpm1ESWhO2KTN?=
 =?iso-8859-1?Q?wfZtmgEZsmo3f4NIaUxBrrg+zkctQgSZYikRJBhuQpV7fPVY5heotrbiYJ?=
 =?iso-8859-1?Q?OW36yyOzuQWUTG/Ly3nX/SVeNCvariNgmYIzj8evBG1fzjT06TCemHIodi?=
 =?iso-8859-1?Q?4pTLATwHmcBJw05GqNO1iNhOOYGtd/ROoyW6qcjS1RhyTtn1NaUsFCVULo?=
 =?iso-8859-1?Q?hu0Dl1gJ5g=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba92b763-a297-4eb9-bbde-08da4d3767f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 12:22:38.8444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SBzZFJKMHBrnYjWcFPGwYwPgvh1yOoFjbLEoA7QaqV/t6oGVOLS/A7OaaO+52td6nLSe8EJO/aY6UJ468ahsIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6090
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

Thanks Wayne for clarifying.
I will correct the typos and submit the patch again.


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
