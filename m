Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE8AC12E38
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 05:59:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B5710E2FD;
	Tue, 28 Oct 2025 04:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LN3XoYM5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B65010E1DC;
 Tue, 28 Oct 2025 04:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761627578; x=1793163578;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CU4LazllibrQ8uJccduLhhKwsDNBG/R/h3AT0H6iFqk=;
 b=LN3XoYM5fflmXurGyFiavjCbUonoPzFGp1SRRuWyhqKGbPYTMJ5STaIm
 dA9d1tjMJ+ugJ93v6zufUpHEHY79xm8+4o3jJD2yblinsPXOtN5AAPwcq
 KHn6gnj/JPlaIpHF2rjbpL+e2AFsCAue4anSnDwcpFbU6qiiW44bb5GZ+
 4ZKx9NDOmmfKinWM5huorUZJ9p4U9A3tcl8vTrC0JbCwIygT7HHiQsbpF
 NBISBjIL76FaqzFLRYi20LvhdklBHjqZC/9H1bdp4rv+wMuUUq1TZLl/O
 EBOw+qkiAog2t5ZWJz0x/TxJuDq0cj+CGlmiOUDsRhwDYxLhTyuIha1q0 Q==;
X-CSE-ConnectionGUID: 7ml9MflgTeivrxGlnR2W2A==
X-CSE-MsgGUID: YszF2BwGS/ev85+GTxApcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67584033"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="67584033"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 21:59:37 -0700
X-CSE-ConnectionGUID: 8XbB4minRTOkUCNZ9O2mnA==
X-CSE-MsgGUID: EtI9CzJvTK2MDggvAH2zkA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 21:59:37 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 21:59:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 21:59:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 21:59:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lEk14AfZypqIJivJL94uwnFdpxDsEGh+87HZSbrDocwyG3dR3ooHlDQQXa0WINntjHd/2XaL+5E+KVxmyVrwyc6ZCB9d/ngd5OaGXZ1VxSM1xP3BVaeeRCu4RNPF+dcgbGX09Fk6lppo2jVIr4gKjx/8S1mAex92Jn8p7DqiqIhkua6OvPpwSjgeA7ZxTr+1wNGdhC5X3W4+0WxmcfVqVtObNOftmfpGD7nIMm9JFg2G/cRQmCJ30qvy/yrjeY4DBjegL5c17QHR/QJobKHuMb5IPXvehtyGzt1101lTJ/k30KWQ9HbOs/1zUEMjKVNT3Gy+Rn6R7yzAy/ct6bq3fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NR8uwVxDTCVpJ2ByJp6KgmwDQW3Oa3E2acfR/SY/ULY=;
 b=mdLv2Cn9qmbefIv+UnPkpZBS8F0IuWcozDm3RcRDhxEIzaYArpjfZGRuiXL6dTMAtIntOZh0ku1i+fiaLQ5cMpBgMCZA/DkI/I5eL6JWeNFC6JMbfeWyPrdcP2bRprLHRJd9L4uSjsdFNCj7gteKFCAp91Un0mih9cl91eR71C0MCHZ7ZFM1db+yM5ACMXHzcqlfAH0htL/5zJ7KFeIqO4dB7e7ya3oLPzK6wF+gI6VOd85wAlx+1jbU1PyVP+eI6KsVGBqSiIp3zPrvSNKS+1ZWm6cjdiNX05+y6d42xPA+lsK8juAPFNhOkeMzRcwEOH2vBcnCkDr8YMBbLKtJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB8524.namprd11.prod.outlook.com
 (2603:10b6:806:3a9::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 04:59:29 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 04:59:29 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 10/24] drm/i915/color: Create a transfer function color
 pipeline
Thread-Topic: [v5 10/24] drm/i915/color: Create a transfer function color
 pipeline
Thread-Index: AQHb6zD3Uk8xKjVRXESoERuQAUr3/rTXuDNA
Date: Tue, 28 Oct 2025 04:59:29 +0000
Message-ID: <DM3PPF208195D8DD7A09147A05658A676F4E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-11-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-11-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB8524:EE_
x-ms-office365-filtering-correlation-id: db5d7e63-9436-4756-c113-08de15dec6ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ohtrlBiw4xHmcidxvY+6FmSdjYYCPbeGzJUK8JPqK/9b2V/EcgEVaeIZGkar?=
 =?us-ascii?Q?W/X7NFzHGzzaa37iMWPyXOiqeoaLEklyTOXWpyQDLaI/FzrnqEaHAziKaz2o?=
 =?us-ascii?Q?2j3fSBjhS/OEVdOfhGhYMbYHBL/GJrefea34pTXzLcWDR7sK2GjKklfdfKGU?=
 =?us-ascii?Q?Q1myW5Yrfwukd//+yFiIAza2otEH0DzLnxsIWfjBQOAtA11MZtL4vtnYTmCm?=
 =?us-ascii?Q?C5KeOSQURll1n7uUouxr8d1uAb8K2RxR/A8cyeFTbu0WscStPz1HSIB+kdiu?=
 =?us-ascii?Q?v7Zzf5Jh6NsYRFh9Mz+9XvjO1H0dQMclK2DtPHNkJh/BOro2c9y5YZG1g2VY?=
 =?us-ascii?Q?f+P0nzVxdwz71cxTUCZnRYApvBRcL5Q5259j8/DTU4vS/ofsEVtJfiulkPhp?=
 =?us-ascii?Q?s8N+5ciBfwJLKtEdNMeJJYOqWJI+39LttCWjK+R5bLpglrgfiH25Z2wS+u9I?=
 =?us-ascii?Q?CL+PmufNdbr98d7v3kekrEAVmdzKZAAATPsYTDvy5YhdeHgSwV3PMfOjWAAX?=
 =?us-ascii?Q?xTbs8YXS01rCui6rF0bMHfNT+UbgEJlsGYFZ5iLXlv7ETzFrpXojjPfQ56xq?=
 =?us-ascii?Q?LH0F+NCDeUsBQPWHTWF8c8qi22IIS4bgIe/ZUjh13RufuXw8++RNhQR0kf6s?=
 =?us-ascii?Q?52D4+RbYc0XeUHdRKbYkNA1D+Ih6AZMmbpPIhrkZO997zuSG3nYOnM8n+xt1?=
 =?us-ascii?Q?p1G8klVkz/GR0W8HqEnZXfdjLP1JYqlw21acvQx9oWzVcgpSAfzDNjxSlSt0?=
 =?us-ascii?Q?49jgOfg1/TVlan9dZYPPRh8K1qE8N7kPYQqcrmmxjL99uHIvQAJV4iQ2JZoD?=
 =?us-ascii?Q?fvtyrePmNbdVOnlxyND1deJ8ovklgf7VKIBqdsnsInSHaPZxk6puBLkcmbTa?=
 =?us-ascii?Q?Joa0WNb4pYlLMbjhp5bEEn8P327B99MCT0hQMUX9zqm3ypADHculEzlUOZQx?=
 =?us-ascii?Q?YeuPp/kOzyRg0aKSt4hce4YIKEu8VfXXMYHMoLCqrpUiWafmRd6cfqBqLPaC?=
 =?us-ascii?Q?6NVvr1lkz6dam7WWIvCalneyiDAUELezUPQhQlrxeP82SR0cwOHG0yLhVTdZ?=
 =?us-ascii?Q?3jv7N9Kjg48HqB4F6FbhlCOTYRjd8YUsw4frw+i1UBVQjG25QWGRgSJkFPTF?=
 =?us-ascii?Q?PJ0c7rnxb/zkXFIqmI5BxKcpAMS5Tfl9U8ljs2Xvvej2fDGOazMuf13nrIwz?=
 =?us-ascii?Q?0+yYZYCXjF4/dYW6RF5s3FZ/B7D43/7VQGem5P9KAeQhtsW3MgPoavXNbcyO?=
 =?us-ascii?Q?TM+nvTrfJLFnb3fuNr8zWZB9tIkheFs7+irez5HgX+Dl/j6yv11xuFjr+nJ3?=
 =?us-ascii?Q?IUcPiPPpxOul/C1fSX3dzOzkXsNZl9nILdse1f6imGL7ObiM8RPrxeCM2pN2?=
 =?us-ascii?Q?h1ZBq8FvBSOpEz7cj15780kNWe+j5LjZqPzoPE/Bfy8mqlMbTe12RwKHdRr4?=
 =?us-ascii?Q?H26/gyN5+8STXtTVNzX1Lct8DQdD++vp3DHc0AlpEt8A8URN4A2H5BkcGtTm?=
 =?us-ascii?Q?iORB+KdwgHO+p8N8kERbRavon7MHYbjrxqoO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?88+LdSVr0twstBCegCg/HERx/MbWzVPiQkjoRxqlk4O1AE3Pa6BtzvzF3Gz5?=
 =?us-ascii?Q?wGiRBH2kqyHyyu+Z/8rSXTBL9FPo6G9zFH/l2L/g5aePSFhHvHjgh3LVbPsd?=
 =?us-ascii?Q?Aj5CqJ0d5dZIyKxK8jGj0veatlJoAGD7PS2eU/0ZpfMQ5hVQaRt3xrxc71BM?=
 =?us-ascii?Q?JZr3/gaDL3crX8X/PQAMy8FMfRkcMqJQdovSpa7a1xOK3CeGWmpWoCCiHMOo?=
 =?us-ascii?Q?JCDboB6V+qfy9H8wsu9kbL0j5Yo13BeHRC2WO2TgNosToFNWzv4Jcwf1A4hV?=
 =?us-ascii?Q?Qy55VONBK7F9fFJbQLgqd0P8ltESnmaYliZJNJdgQEV7jfD7/J8SzWPRU2kA?=
 =?us-ascii?Q?wpps1lphHR0ucdYb7wAQjljs9Y/xqynzkIXjjz6OoQ7g2lvJLMezfrLkqDc7?=
 =?us-ascii?Q?W5tJWcbOX+0jFowLiFTH2Sceur7HK2ESOb5meeehM4iAP/5ZM55Xz5b7tFfv?=
 =?us-ascii?Q?GP4DiLFCI/wYa+p3/oa2QehPJ8nIeI/4SWc70n9urh4p1uADOwykHLZdu8Yg?=
 =?us-ascii?Q?HkHIapHn2ngmtg2SNnFTVn3uaLuQ5vwIjAigp0GtxFGtyTEsN8MbdfIlOY1+?=
 =?us-ascii?Q?ZaXJOM18or9+b2pp1HIRBkKr/TZIGiSeccuZYcWwb04Cr+wMZECbpNZKdYYv?=
 =?us-ascii?Q?+N+VLZ4DGxec7gFNvSDXi8Ar56G3Ky0ioVlXoQAKJLFS94bqUECSXzpCyEO2?=
 =?us-ascii?Q?KtEcqNGZJ0IcIhggJdLsOoEqHGvDb3jm8cpCPT9HeibM5g+77lXigCKguXrE?=
 =?us-ascii?Q?9VQbK0REFSomVGXey7nCl+Sh8dSk+S7p60r7ts8D8wRllxJUKzuZngjDBjou?=
 =?us-ascii?Q?kDfilywwHSsMZelHcYA/V/zbqEkvZspAUf/+Ff762VOWbM1eAbQVVTE5OQWL?=
 =?us-ascii?Q?D9h6aYeEXwU/RWP9Py1Andh2zSvjEJIwIm06aiFjKyUGeN0myqgNQ3TzkOfa?=
 =?us-ascii?Q?Zpu2+Jb6LvjFe4dJ5xESmZPNa1ns0Ga05CKvoNyBK2ZOAFywNY4ZmcuN1jPq?=
 =?us-ascii?Q?vmalLT36Agia7682lfC2zBdwg0DjN03OWjBi7FUzQwkKUKxBn0XfQeuXgJpB?=
 =?us-ascii?Q?LrNaByJkkm+F1b87bbaNXv4KbLDJyCOhoyepvLUgig+Kv1Kn30o9synXLUiX?=
 =?us-ascii?Q?ES+g0fpM03DC1Z/LZENxmFfL/TRoXaHGbioGNZ3/pVfp2R1IoJ5Dko8POQ09?=
 =?us-ascii?Q?06STf3rvdC+nEQ2MYDty9jnhIF5QwsDdqZP+KC9+B+ESZCT9HtAvNTyZ35AM?=
 =?us-ascii?Q?guzPq+cmGy+d9EzgSf8lL0U4G4keyFO8+DKtdn8gXOMYKu4f9fTOifZGaaMP?=
 =?us-ascii?Q?hYcdxM8mcKbPyyjkR5qHWO8EjaBr4prsOupdc6YHNJrdkwIF2tcSAh+VQeAv?=
 =?us-ascii?Q?cyrbBi8jVazHiCSWfwyIaPF/aZHEYPBzzq7Uth3j7YKqgawUqLPb3TpcsAKI?=
 =?us-ascii?Q?Zcs4XbyoBheiyLdB7IuAF3A/RDstn3pnwC0iLkn/QdY4H8oJnVEZV+t7Dzcx?=
 =?us-ascii?Q?LQuD0UdzH2GidD3rsDm+r7TealgM3W2koxYgob9gxr07aWTFxc08fGbMIw8c?=
 =?us-ascii?Q?xCP12N1YHzqx60A4I/VPsDwicgoIZlFGOQenW1X9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db5d7e63-9436-4756-c113-08de15dec6ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 04:59:29.3951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0BmN+MQFmsAsL4mdgVuy1y8f8wH2WThzc+mR493BwVYRY2g+13Pct9t5DV0KsNwTkEBL5MfItRNmf0hpjEYFbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8524
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

> Subject: [v5 10/24] drm/i915/color: Create a transfer function color pipe=
line
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add a color pipeline with three colorops in the sequence
>=20
> 	1D LUT - 3x4 CTM - 1D LUT
>=20
> This pipeline can be used to do any color space conversion or HDR tone
> mapping
>=20
> v2: Change namespace to drm_plane_colorop*
> v3: Use simpler/pre-existing colorops for first iteration
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 49 ++++++++++++++++++++++
> drivers/gpu/drm/i915/display/intel_color.h |  3 ++
>  2 files changed, 52 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 5f38a5ff541c..90ac6530d1a5 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -32,6 +32,10 @@
>  #include "intel_display_types.h"
>  #include "intel_dsb.h"
>  #include "intel_vrr.h"
> +#include "skl_universal_plane.h"
> +
> +#define PLANE_DEGAMMA_SIZE 128
> +#define PLANE_GAMMA_SIZE 32
>=20
>  struct intel_color_funcs {
>  	int (*color_check)(struct intel_atomic_state *state, @@ -4001,6
> +4005,51 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum
> intel_color_block id
>  	return colorop;
>  }
>=20
> +int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct

Either this needs to be moved to intel_plane or the name needs to be change=
d

> +drm_prop_enum_list *list) {
> +	struct intel_plane_colorop *colorop;
> +	struct drm_device *dev =3D plane->dev;
> +	int ret;
> +	struct drm_colorop *prev_op;
> +
> +	colorop =3D intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
> +
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +						  PLANE_DEGAMMA_SIZE,
> +
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +
> +	if (ret)
> +		return ret;
> +
> +	list->type =3D colorop->base.base.id;
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> +colorop->base.base.id);
> +
> +	/* TODO: handle failures and clean up*/

Missed a blank space here.

Regards,
Suraj Kandpal

> +	prev_op =3D &colorop->base;
> +
> +	colorop =3D intel_plane_colorop_create(CB_PLANE_CSC);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +	prev_op =3D &colorop->base;
> +
> +	colorop =3D intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +						  PLANE_GAMMA_SIZE,
> +
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +
> +	return 0;
> +}
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)  {
>  	struct intel_display *display =3D to_intel_display(crtc); diff --git
> a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index f3c7cd694b99..ce9db761c6e2 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -14,6 +14,8 @@ struct intel_crtc;
>  struct intel_display;
>  struct intel_dsb;
>  struct drm_property_blob;
> +struct drm_plane;
> +struct drm_prop_enum_list;
>  enum intel_color_block;
>=20
>  void intel_color_init_hooks(struct intel_display *display); @@ -43,5 +45=
,6 @@
> bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,  vo=
id
> intel_color_assert_luts(const struct intel_crtc_state *crtc_state);  stru=
ct
> intel_plane_colorop *intel_colorop_alloc(void);  struct intel_plane_color=
op
> *intel_plane_colorop_create(enum intel_color_block id);
> +int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct
> +drm_prop_enum_list *list);
>=20
>  #endif /* __INTEL_COLOR_H__ */
> --
> 2.42.0

