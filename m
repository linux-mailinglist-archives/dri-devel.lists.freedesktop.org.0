Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40487A26D76
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9354A10E2A2;
	Tue,  4 Feb 2025 08:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5I3rYsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B74310E2DD;
 Tue,  4 Feb 2025 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738658664; x=1770194664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eIMpyg5wp+6czAdFsur0s9Pw3J1A2q0sykrA6Tc2uio=;
 b=E5I3rYsGhbWqyXHQUQMal2kPgqU/za+0Gi6nUGScdRJKk4JQHxgzbiqR
 OjugL+LrFeMLXAmDL7vPuywQXX7AxusUl1qwtueGFUuJjuFUyB3jQpN2a
 IEv8Dz/NU4pUq8sHScJ2C+lUqWftUYlsWi6n0z306IZ9T9V+rZ/EXHsmS
 X7fOnLqH2j/IfVNjtsnrdMr7iORZ34/OkFJj3wGN9HqmcUxzoF2eh7Wfq
 TZoGE3Niwf+MsRhd14in2QAbFEZpNUYwTXnHr+uWcR1UFl/tU3avpCLWJ
 LewIAWnioXHZ1uQUVt6TewiV++ogVlgJ87XZgbSYlXXq5x8fGhF72nivO A==;
X-CSE-ConnectionGUID: aDl7q76jRfuJgu5yk5zs/g==
X-CSE-MsgGUID: PPJXXisySIayXVMPOidrog==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="49824991"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="49824991"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 00:44:24 -0800
X-CSE-ConnectionGUID: IA7O2/U6RhKfvFSOdQWjdw==
X-CSE-MsgGUID: QvWGHDBVS3a7rT2apweWJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133781169"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 00:44:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 00:44:23 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 00:44:23 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 00:44:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0+GijQRh8P2RWFt8/f21nIrQaNFElv6py3UKqelQzPZnfiw2AEhweSgnmljAeNvnK1pbe3N58hUnhSilmmb0Hi7kmyQcLfkTLpnuXBQiQ3hkSstSDh/UwtEcHPMdEYh2Fvry5WOocCmkOB7AW0vmGi0UbuAXPfwO1g6CCIsambIo8dO0akuc0fEtZbvB6G9UVBAR5BS/I3eVKB36Wi7pZglEYzz+yf5SwYjC7ggbAIT+WQvwuyGkTPpC5SRIMjZC8KjBxkr71SQi1hvIG8HHFsiL1GqLH3OApbSBJvEpYHiT/+DIF88CXhh7osXWWRo6C7MRBPx5PEmvH8WafVbiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E+bvJo+oY3IFJ7cuSE8ZHEM8hIUcPn+198M9mYB9tkU=;
 b=Ujm/+lpCnMTd+Zl9xQ6XfvbdCFsKC4yBQR7i4VKwBuvJwTdiQ3eTWXHQMrywL3ou635U+AhNx78nIozfZ4PddnEUH61QM7ov7+/M/0v0onDqEXmWfx5NAhfiMvJJp7pe+gampS2MkwVovsLcLsb3pMk2nkfpK4cg14aAbQmgY3ydhAc9j3Z8OWPmbWoCvcvl+b7xUrqoGBAaIWAQRbp62b+asWIAJRWbea/oRTUBpN2I2+ORLx/m6/QPecg8I8GeDmlrnApYy38heUxGty+53g+K13Xkb0hTWBkhIjDAMorufQiV0cZL5LOeYvJhTvt1pZI9aE1xZy9I/nBR7N/mtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 08:44:21 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 08:44:20 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 1/7] drm/dp: Add eDP 1.5 bit definition
Thread-Topic: [PATCH 1/7] drm/dp: Add eDP 1.5 bit definition
Thread-Index: AQHbbiN1RGNfum53AkK8vZjzdUGgVrM24Khw
Date: Tue, 4 Feb 2025 08:44:20 +0000
Message-ID: <IA0PR11MB7307302D3C058788A4879F0ABAF42@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250124054631.1796456-1-suraj.kandpal@intel.com>
 <20250124054631.1796456-2-suraj.kandpal@intel.com>
In-Reply-To: <20250124054631.1796456-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|SJ0PR11MB6814:EE_
x-ms-office365-filtering-correlation-id: 683782d6-83ba-4929-a1bc-08dd44f81e6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ayihwOP8mXJLdL/jlmj5cv4CwRIXhBXoFe3qqUyZpL/pyyAbpEWlSFA6s4AV?=
 =?us-ascii?Q?/KG2U25l4bn063lbxNWQC3BK+acR06xTjuW+CXDqzZx2hYs/aZe1EWf8fZEA?=
 =?us-ascii?Q?i6/eNZBfubN5ieZeZt9EOyOOoyYoi2URaJnH6SJKuO7rYuaIPz4SXOvWFkTD?=
 =?us-ascii?Q?jSz7S6m8hphNVMFuJhJcl5f7kX2X3CeCXJkvf/luCiQE6zhC+r5jaTf+4ypA?=
 =?us-ascii?Q?/JaDAnLpGZGla80+Dc/UkNMs9nSeZ7kgNRq/4lD64LGWAKWlhL/84ghhSKIE?=
 =?us-ascii?Q?xXzQZDmTp8ECqIssbsrWQ5GEK4cH15d7X33Ee+l/OpCEGKYGm54eEeINzzlH?=
 =?us-ascii?Q?81HAM71fv0qRzYZJR1kpB1wTkcDOQiVZgtc5uklDWZr87L+UlU9loOqvRegt?=
 =?us-ascii?Q?yJMWSWtGLjLWsND4N18j5PFq88KMWUHnn3v5rowb/hT5wWUNZZh3s7cSBwSv?=
 =?us-ascii?Q?TcpVxBOXqICwvxt3ZpdATzANkeBjRXfUvRgpnoA4D5ft2/O62tSRY/9Mmq/L?=
 =?us-ascii?Q?EUU1xLNTEeKMvKnq4ZJD/PxWTAEawoNa+BJughKSgB4uR/ZTDs+1YZvD88+o?=
 =?us-ascii?Q?ntQ6Se+3TT166Di1k3vRzs0R0IIOEOyygcsknksys158pVfBu6U6Zabmnsq7?=
 =?us-ascii?Q?y2zouy7xcXqPcNAojuffIdJKm2J6FKjz6ocY3Gwrw/1PGcS0xm3k6maPfoI9?=
 =?us-ascii?Q?N/E9tPLI7nbTe2s52LIvPHruXTK3KCP1Zwgz2g7GdQSXVg+MkkSTPrEdjNHo?=
 =?us-ascii?Q?1MMvYgw6pyraPI4Q9NwOWu+MtEeIHZuIKItlx1hisKbXBA9JlVL7QpLmThLQ?=
 =?us-ascii?Q?fuykw4Xn6PWQUAuUwLAzkQHC2Se20IDG1i901ee7ih0UMmwpJZjSRdY2ixvB?=
 =?us-ascii?Q?PEMH7r9Cr832MuNwageHEyRAjerNy8k9sePrwBRDwgWVAN3kgYUqYKYpM2EK?=
 =?us-ascii?Q?wn3TgtfrhCGG2K69sYIB9LvP/Woifo7C9vwINvE/VOgqyxtr5EdEJzVCEQHw?=
 =?us-ascii?Q?fiL1854FcwQw430O8s1qSMGODPnyBxAJXzI9DXOI9XdmePq2u+brS52i+NMh?=
 =?us-ascii?Q?l4X5J7ZxcaTshmztHJ6s9QZyy06SeQ0WkyKeSusPENlFeT47AjcGPQyL4Zjo?=
 =?us-ascii?Q?7pZ6IH1kMEhYvPGv2zV65vSkwB2NXX8GZQXRuqhcrcOvTnPiK0oIlDzC6756?=
 =?us-ascii?Q?p/EH9c+L2Cr45p62s6swVRp+bnGJAuazdJG8j9vJkyaBjFFv+5dcCqHGF85Q?=
 =?us-ascii?Q?AIrAqyoPfEdt/rTilX8jqGhqvTf6tpfxhKf15I5ynerYc+5Ae9SNyDiQzf/R?=
 =?us-ascii?Q?OcKL0ktpw+BwLN5KSITBEXz02ZdpuxRA/sll4g+RpUJ5Mxw4SmRujQ26KqOr?=
 =?us-ascii?Q?wFMB0CQjLIa4tZb+Ti748UBYS7c5zC82h+wyRBw/mmmdRqGEHDg9JbTfGZMS?=
 =?us-ascii?Q?ZP3GyCAm1UIHQ0z33p0+SMed7nCgNfYG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B30+gxcdPwIg5GAEIjPe8ic8N59fkYGF+ff1fnRIJFwWuYZfojq3Z4ZyXi/d?=
 =?us-ascii?Q?qyCqExDfoAh4SZpz0b4kpSEHEJ082lBsKBQJBqlGjeHzow9W0+f12KqY8Aic?=
 =?us-ascii?Q?6JLilDImNp+TGAW7scsz8ni1lKWaHGhfqNbp8RF1lids1JIxDgBjs7+mlubo?=
 =?us-ascii?Q?/dk1+fXdTa8/mDTtYKkEAg/lriHFw8z77cVgc+5pA8U/svYg4JseKkQHGDL6?=
 =?us-ascii?Q?8Whq1c301Mo9am8IvjxGPW++YeHMCLOrV0Tdalc5zcgFit8JjBjB5clH+uxG?=
 =?us-ascii?Q?y9+J34GX257Z2pPrcVXxCFM79+57EMho6IL+/KbzMWYfBCXHUlzrBiSRYJEf?=
 =?us-ascii?Q?YVTMT6lgJXHW4q1h7eLAwP+SbSGM0PXmlgMLJNE9j9bxcqtdX/z7y9L5UYMp?=
 =?us-ascii?Q?up7SEb4noYxwulzgolnZZ8rcz5zweBYrHUvev+0mSv2Xye7BogY/NacrTFgV?=
 =?us-ascii?Q?XUouOel3WQYpWBSLynZrGfoe5wi22jiv5v1u9PDelIAEI5yvRHDWOZV43Gli?=
 =?us-ascii?Q?8MdtUH++bCx0da5qjuB+Ui62joPiSRvhqpbNTH4CBJTln1NWNuJ/GrMZA1Hf?=
 =?us-ascii?Q?ID1TtjVavyfl7lpn2rr3ElW3FjLt69IJJZ2WP77yOG/2Egch8yTpAehDk/36?=
 =?us-ascii?Q?otFLSQfxh9p/glwzB7ASeh07Uo9jW4tvyok1rpa9C/YKg9KxkgYjq32UJLQD?=
 =?us-ascii?Q?YPZncOdt9z6yugGcemLOOgs5FJt6vPWrQdgr/XmWIrkHmhidExRg7LPJ/Yw+?=
 =?us-ascii?Q?3JCGotTfRmdl/P9IO+x6Dxp6BvED+blQP7TJWlCORvVKZdA6+5aE5BiYinOx?=
 =?us-ascii?Q?z9R3FXSlBgh5efVTbKCPDU+FBhdIVwtpbsguw7itkRLCn+qBxlZBqADy+7K4?=
 =?us-ascii?Q?BGswgoI4k3dBNYqStfezAqLCcbtXhzQkJJVv3+q7UeCWup7ITWwUq8o0aGPR?=
 =?us-ascii?Q?80fObnzSNU8GAECxX1/KpG42Z2CMTeMmfrlLE39TkHrZQw3tvcDMhlqLBGDG?=
 =?us-ascii?Q?FRS/ox+68mdwd/EZv8qc6QjWnnvmr8bbUHaSpoj6Bo3AebDVcOzc15Z6H/0L?=
 =?us-ascii?Q?O2oYzeZTla6CNkfjV5JIbActvUPDVOYdhkoBmSqGs560xHB2ApxVn/2jhtrh?=
 =?us-ascii?Q?Q8fteJTxXSi/yeJe89cqfmu/+s70ieqmjM2sbiqC8J0wvoj2HeRWzxS9y7F0?=
 =?us-ascii?Q?VaRfMh2Wf7ylKQw1cq0/UDc0x8Qi1l4w/Hs0w/pyRLRQGgGBPDYgZNyfr0n/?=
 =?us-ascii?Q?JLCnaScGw8wTknBMI9crgPalTbtOE4WKCS/ANs2IResQRswd4u56GXTzjJJT?=
 =?us-ascii?Q?hphxurL3JT/NdW8gjPVmRvD0GyPhBns992S+phXsKKOl6Ewvqa2uF5Prk3Sq?=
 =?us-ascii?Q?i2v+IeW7jDCrBgf2yLZgHzCEY4HmKPEuykAamzYmlJivfrnPbfet4b2fHBtC?=
 =?us-ascii?Q?MKOM+PaTp1Hl/VE1E+tTux0yc8c7jnTBnduOTbKZgpPfRrMULjgTEdQICHLy?=
 =?us-ascii?Q?DCKPrTzfk/t4VFzA1CNFBhyKm8gSMroVO9AAcK2Fqjq5WPzXOYNOohZkaK9d?=
 =?us-ascii?Q?k5Suz2+mi0xBwg+3Zcph5Mz4uiCFQJsPDPRtPcGbb06xo9dRQPzq+xi6D5Uv?=
 =?us-ascii?Q?CcmGBzWiyrgqdRpgo9eDuwf6LZNyDM/i+uCw0hdbRTkh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683782d6-83ba-4929-a1bc-08dd44f81e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 08:44:20.9450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b2QOJajkB4iYOWl9tHlv4QaX5gPaNl3kN70ty7zFJHZCPBxVTlmmPctrfr7zkvF+0RKwBX5Bg748PjVpkOgL4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Friday, January 24, 2025 11:16 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Kao, Ben <ben.kao@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH 1/7] drm/dp: Add eDP 1.5 bit definition
>=20
> Add the eDP revision bit value for 1.5.
>=20
> Spec: eDPv1.5 Table 16-5
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  include/drm/display/drm_dp.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index a6f8b098c56f..76162ad3b152 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -996,6 +996,7 @@
>  # define DP_EDP_14			    0x03
>  # define DP_EDP_14a                         0x04    /* eDP 1.4a */
>  # define DP_EDP_14b                         0x05    /* eDP 1.4b */
> +# define DP_EDP_15			    0x06    /* eDP 1.5 */
>=20
>  #define DP_EDP_GENERAL_CAP_1		    0x701
>  # define DP_EDP_TCON_BACKLIGHT_ADJUSTMENT_CAP		(1 << 0)
> --
> 2.34.1

