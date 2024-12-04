Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D79E32CA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 05:53:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1E910EBC4;
	Wed,  4 Dec 2024 04:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4mLlzt0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFD310E1A6;
 Wed,  4 Dec 2024 04:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733288007; x=1764824007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M5/nrvq2Rkpa8/3CbPOY4hezkJajtwiMk7PZonlWBnI=;
 b=e4mLlzt0sIVHwg/YQ949qGgcM2+ZB0sTzpecGo6pog79Qk4Covle/ypG
 Gft1vNXm0etOG4xuvc2e3NOM7d3on7ULxmq3agmH1rc9I6K7fyg9Qzbgi
 hckHJBvq8HmLHG8xX9/x6rwhuIfJohCQAx5hYqZMJjU/G2j8Hk/vStqLj
 x1R1h5RKPzXADNeRuicQWgg+PSUDiXr1AGGDz4eQvGtnAywh9G7lgZP/4
 DVYD9keDaZs0Qdx7q4ZT8DnrO4bKC191l/eBkGj8BOYHr72M9qNwQvYUX
 UEpgkG5pWYk4Kkx9FjgtKR7NehzljjoEXPZHlzOTH1bFF+INq8mjPJZ9G g==;
X-CSE-ConnectionGUID: cWWLmsfOTD6B1mC6Op0o9A==
X-CSE-MsgGUID: e5yfjtAnRPOoOqie3F5Cjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44146802"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44146802"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 20:53:26 -0800
X-CSE-ConnectionGUID: LQLGI+dzSg6K/kcXAX+XxA==
X-CSE-MsgGUID: bHHrLukUSJebAapwTcc47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94079196"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Dec 2024 20:53:26 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 20:53:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 20:53:25 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 20:53:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3imnTAcfPtBU7eKIMyoJufJ+9WC+q60CoH7fd1TTSJyYkhmbBkRTQrahjfmpaK/DhY3hru6TKAGnx24fOoXjTyOlA6qcLawMvVeMx9Bi0SVqCu6mF/3V7spTe77TbW1kr3ABsgJLoxJplluMgJp31nHxcS7X2Prm6NmSeJEYeAugLTleRauxEo6sSV4+3QFUnucgBsDDLhCu7Nf77686S+DyyPMIiPTYLG6tayn/CsNg4O4B6Ywpk17HxbnNnGRGQuUHJPebWUgGLAr4AGQn//dA+Jkzd77VwNwE/xnyK7TTndu6tddmGecBwazNdWS7temWttGFM0PI3lD4RWTPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/Q/rIa0RxfP6kBBNhI2zquWfCxDTTQjp/b/2h8BZjo=;
 b=vCOWFgEpiCdLSY91MFxr6tzHjcjJAKRZoP17ol8kwobH2ia3zH9o1yibzd5POctwEE/mdrdJAWgRpHjODSaZSLDwX5wWqTaQkESlxOeGRxxyx8Q28GQcS3vztciGhb5rJR/hjZi5/EbgWZnU+8AUXJKtJh3MqKIBT6t6r0ZVQRkUJKL1/gzO7O5QDax7T2+lo1qjPagNSkbWlv9AnEGnQ+LMSSA4vnKpf7OM7FrH5e2tgbcf+IH1AT6Oaqaeay2rc9mQrCqwzrkwWPz/IV8cs8O0auTP6KV7KUravVYtMLNwnxbcwb4ZyaPIiUv66KNVpm1PsxWEI2XsXDuqGCzGDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB7203.namprd11.prod.outlook.com (2603:10b6:610:148::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 04:53:17 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 04:53:17 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCHv3 08/10] drm/i915/histogram: histogram delay counter
 doesnt reset
Thread-Topic: [PATCHv3 08/10] drm/i915/histogram: histogram delay counter
 doesnt reset
Thread-Index: AQHbRUlgRiRUJKyN2EOI1DQ+MM6qhLLVhinA
Date: Wed, 4 Dec 2024 04:53:17 +0000
Message-ID: <SN7PR11MB675007061A7E2B6787CEA0A5E3372@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20241203055520.1704661-1-arun.r.murthy@intel.com>
 <20241203055520.1704661-9-arun.r.murthy@intel.com>
In-Reply-To: <20241203055520.1704661-9-arun.r.murthy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB7203:EE_
x-ms-office365-filtering-correlation-id: 8a2e47f9-c6b8-4a41-e866-08dd141f9189
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?h6PXOovKofnJxreevePC20p+lq24njsFh3Lchx/MCuOZG9P7cxKv9RnxKZgH?=
 =?us-ascii?Q?MOkHS0FHUW/9q2qEctvpZyDUPVtGRNIbxV1aMxdKzJO3dslT99ypHXYq0xXx?=
 =?us-ascii?Q?PTnmBvL+8dSolEFYGnoBEQebeiNGyMx54joIiDGpntg8/HCmhjdh3aVu2WS6?=
 =?us-ascii?Q?YaVBB8a2gWYltxiTAyFYVVgrQ2byzsSP0itnX+1KVpTm+7opdsibHYMWamqO?=
 =?us-ascii?Q?i7LrxfxaqaHXmftj/O2dUwq/4nqfrKCvASK0ZOLg9bC7e31xbTE2Lr1mpoFI?=
 =?us-ascii?Q?FTiMHcOKH4vLNUcS4n8Qa8h1/7StkglBvSgCjpu0dGRUm6DmYD9Fn7tqV3hu?=
 =?us-ascii?Q?0q+f537fFdPG7btK8vqmWXhFDJfBZq104CNpjPcPmLhsXfw+4LXGpCWOqTJ5?=
 =?us-ascii?Q?ljC0grF2EY9bErW/LS8TfhSKfj77/MwOYKdexbk3MW+cpsI1eTLLvBikGeto?=
 =?us-ascii?Q?TmcnrEGL8prnhO0BZn/P+xoWHkPJVaYglPNCH8UuCAtzOc/1jfVOtogP1IsT?=
 =?us-ascii?Q?gaPukHFRyMPcuvzX1lIBYB4rlosjXBefRBTyXE8wLV05BQ3o/4d3R3obD70N?=
 =?us-ascii?Q?kBk4n93q6limLPyXSH99R1KFWxCecnItD00G52rclDer6ZMbbpkvtdJywOtq?=
 =?us-ascii?Q?moiNnu5QDh/HjlGVL8TvUhG9SzvvH095GXrK1BBf/8mdXuUPFyNcofkOLQB3?=
 =?us-ascii?Q?s8jirg6UwD02B791qzz+It57Yv45qxaIEm6d1YRWDsIQaFmAyg7AF3iRs/Ng?=
 =?us-ascii?Q?ahqTuc++4EXSMqHBkn2b9OPopjs8zGFlR1nALvyMcn7wkuJd5GOGIG8nQuon?=
 =?us-ascii?Q?CKQrxLbMO6rZV7z+76sVTcDD9sGzbLflBVnKkXDGUDR7/GDI7vqLKSMPzg9L?=
 =?us-ascii?Q?XW6appFbbkguK96Gmc2OqncOdvCn5JkE2QId5cVGfquIPN2k41SmAA20pGki?=
 =?us-ascii?Q?F8aIh1Ve1OPuwUEu1LUVl0koUEfrm3wuEJpcyAdc67eAdi9dysH3VYsnnqse?=
 =?us-ascii?Q?+PgFLI9OyM1LBFQlhsbKJNDvgMyU/1irRh9exgngzbpj8Kn17HRV+VMwugik?=
 =?us-ascii?Q?eituazKfNIH115OM4AN1YBSji7j7ciIYsdortNtGbqekhNYEL+YyETpQUMpn?=
 =?us-ascii?Q?DJmndgY1EnjNjK8kvyRbZ7HdjTT9zkgpvB614bWwS9nKgH3DxEqk2vUKtQfK?=
 =?us-ascii?Q?V+tvEd+chcbSXt96VrPJdhkVBj8KLKwno9qSHCPZtyrf/olHNdRf3Gq1r/Pt?=
 =?us-ascii?Q?7Rhm/pWM1iEOSQVwAJCwG8mcT+6Tel1cKOjKzwO2sDz5ui0VGu5ze7osS8S6?=
 =?us-ascii?Q?gYfyy7U9JMNBw5l279H3eRtsNXVO5eevRpM9T2gHgGATrbZygcFLqNJs192D?=
 =?us-ascii?Q?H/T8ORn3furGMWHNnjGP9LZFwS/Dpmvww0z+IfUKT+4MWs7YwQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fYuOakESQ7XRHz1rHQjlxEZTrRGpqtdpsibqZkaVc2wDpEN6t8g90KO+2cpX?=
 =?us-ascii?Q?bs8FiaD7G/jK6jmCx3JjPWCn+iki77xgjhCXqM6wzVemEjgnpLrS5vsirWL5?=
 =?us-ascii?Q?9oSDUjbDH3CkDaKPjwlTePs8/rv9DpDMUldrOn+g5+NN/MV9p/VBI+7jZHmz?=
 =?us-ascii?Q?za0mFvJ15Tb9ouuuZszoxNJ6U2Q8Qtsci73iugHvNtDJvJIrcDp/2tdP5sIb?=
 =?us-ascii?Q?BRKGPry+k/tbpk5c0to/U/8Ntsap3hUGpSABsPNlFN+8Z3QBWvLneSQkGW2C?=
 =?us-ascii?Q?w4TjSd41jWJl7jF4Jeig+fjvRW8uVNtA3vVxaoVNoNKwO+6/yZttB5LSd8uy?=
 =?us-ascii?Q?TUJcg3IcsVYoF/lgzCzHKKKO8LSZYoN1CFxovNHgn44sToKnPB7oMw2oQ5TK?=
 =?us-ascii?Q?HOmlDKf0hy3V16/I1KqqRlM4pmlNDgaLmwUssQKSyUUBwm27TPr0lYy3nOnv?=
 =?us-ascii?Q?tKCgX9ES8xQDFZCRkU7bnZ//0vNzql3zreWI9ciTyEikWOUeCPaV3q4r0QhR?=
 =?us-ascii?Q?a2lFBxlghoB33/MXaS6UIsz8YPWjlLp1WM8CqmKs9n4TS7qjFN4bnEUmYaL5?=
 =?us-ascii?Q?QPAmetXUR5GkehEiTUq4QhWdnc3aUyGZ5MJa7HaAj4kdortUIuqmdKNWE7XB?=
 =?us-ascii?Q?U65qeJDrig16cOkIU6zL9+fSEXHHvRNL0clFQ3iNKzuaU6p8d6yGErPTKDX/?=
 =?us-ascii?Q?G/fZo3448SHpp91rcrhQHbgd3XAFg3pBbmFyd7ozcaRFeF+MseBUPmhwdofc?=
 =?us-ascii?Q?cvmjp1e/sYd5CruYVLbYv3xBCyMOcjmlUcBabm4pijPxJrWVz8u5LZ8g1hPx?=
 =?us-ascii?Q?cFSrZZ9lZ/deWr+bF02o0j+zHsjzNQpUvCKgp8nHmvD4AwRmtGfameO5E4YG?=
 =?us-ascii?Q?/D4ekGtEXa2/zy5z3WPuqrbqGSeitC3MVjAl3V9l62kBen2Pa1aD/Dpt5xsN?=
 =?us-ascii?Q?2GM5YcLHqw9WqGCovn4w9Tz3k2nY/ne1uruKMrxD12DVmagfDeSpkSWgTeI9?=
 =?us-ascii?Q?7HxTKFRNIPFY5EAreymlDg3FFRDhWH58D1vJcIQeYVu+6sTdR/36++1PXJSs?=
 =?us-ascii?Q?B2wtNYG6sHjK6R5gXZKh4wTshJO8OEAsVpbNT1Y2P4zAMje1JHhNT5IQipOM?=
 =?us-ascii?Q?a0zucznsdjEkUvLZxYUc1uKblC97SfRgT3J0tfHCghI8NI66WkmfPm/jesEE?=
 =?us-ascii?Q?X9tgea6J65R+4ZaDaKjGMmqBeM9RLwWvnaklnpyOx8RyeiJIxD8FZHDEu7VY?=
 =?us-ascii?Q?YN7JRue+p+zz+aBF6XimP2YHoaInwZXFtzqKoercNywyQtaPv4tPHzkluBeX?=
 =?us-ascii?Q?nmcRNyJk7vTNAg2Evi+o8O0neOyi5FxvSZBrcc5tbN1qXf0d9KPsKsGS53ZK?=
 =?us-ascii?Q?esvPpoCyaYjSRAshUaxJ/7ITmua5ZrwWUs/NsNjFf3Ga96Aw/SusPUW2Efyy?=
 =?us-ascii?Q?3gQmV8USS7uOTfJx7VqBRCsiAe+pRphv5mv57kOaMin0pOcsRdNuQrHiRRqE?=
 =?us-ascii?Q?93fMBvvlshzxb1y30tt8Whxa74KCHrMIujlNLcBXqUDBXECYceWZmSCuO7u9?=
 =?us-ascii?Q?fiHB169J4+m+wHq3BUX1wthPGXqg17Hxoajyb6ue?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a2e47f9-c6b8-4a41-e866-08dd141f9189
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2024 04:53:17.4360 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Q7KA7IqEV01JBMeS0HvZhrAUd0noNErDW5ENVFUd1CW2dpuOUFSfMhS/ENPW/UMkiBOJIQS7IHttkKu+fcEsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7203
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> Arun R Murthy
> Sent: Tuesday, December 3, 2024 11:25 AM
> To: intel-xe@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>
> Subject: [PATCHv3 08/10] drm/i915/histogram: histogram delay counter
> doesnt reset
>=20
> The delay counter for histogram does not reset and as a result the histog=
ram
> bin never gets updated. Workaround would be to use save and restore
> histogram register.
>=20
> v2: Follow the seq in interrupt handler
> 	Restore DPST bit 0
> 	read/write dpst ctl rg
> 	Restore DPST bit 1 and Guardband Delay Interrupt counter =3D 0
> 	(Suraj)
> v3: updated wa version for display 13 and 14
>=20
> Wa: 14014889975

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_histogram.c     | 14 ++++++++++++++
>  .../gpu/drm/i915/display/intel_histogram_regs.h    |  2 ++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c
> b/drivers/gpu/drm/i915/display/intel_histogram.c
> index 8f25cfe00ba5..66006b75efaa 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram.c
> +++ b/drivers/gpu/drm/i915/display/intel_histogram.c
> @@ -59,6 +59,11 @@ static void intel_histogram_handle_int_work(struct
> work_struct *work)
>  	snprintf(pipe_id, sizeof(pipe_id),
>  		 "PIPE=3D%u", intel_crtc->base.base.id);
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 13, 14))
> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_RESTORE, 0);
> +
>  	/*
>  	 * TODO: PSR to be exited while reading the Histogram data
>  	 * Set DPST_CTL Bin Reg function select to TC @@ -101,6 +106,15 @@
> static void intel_histogram_handle_int_work(struct work_struct *work)
>  		return;
>  	}
>=20
> +	/* Wa: 14014889975 */
> +	if (IS_DISPLAY_VER(display, 13, 14))
> +		/* Write the value read from DPST_CTL to DPST_CTL.Interrupt
> Delay Counter(bit 23:16) */
> +		intel_de_rmw(display, DPST_CTL(intel_crtc->pipe),
> +			     DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT |
> +			     DPST_CTL_RESTORE,
> +			     DPST_CTL_GUARDBAND_INTERRUPT_DELAY(0x0) |
> +			     DPST_CTL_RESTORE);
> +
>  	/* Enable histogram interrupt */
>  	intel_de_rmw(display, DPST_GUARD(intel_crtc->pipe),
> DPST_GUARD_HIST_INT_EN,
>  		     DPST_GUARD_HIST_INT_EN);
> diff --git a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> index 1252b4f339a6..213c9f483567 100644
> --- a/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_histogram_regs.h
> @@ -16,6 +16,8 @@
>  #define  DPST_CTL_RESTORE				REG_BIT(28)
>  #define  DPST_CTL_IE_MODI_TABLE_EN			REG_BIT(27)
>  #define  DPST_CTL_HIST_MODE				REG_BIT(24)
> +#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT
> 	REG_GENMASK(23, 16)
> +#define  DPST_CTL_GUARDBAND_INTERRUPT_DELAY(val)
> 	REG_FIELD_PREP(DPST_CTL_GUARDBAND_INTERRUPT_DELAY_CNT,
> val)
>  #define  DPST_CTL_ENHANCEMENT_MODE_MASK
> 	REG_GENMASK(14, 13)
>  #define  DPST_CTL_EN_MULTIPLICATIVE
> 	REG_FIELD_PREP(DPST_CTL_ENHANCEMENT_MODE_MASK, 2)
>  #define  DPST_CTL_IE_TABLE_VALUE_FORMAT			REG_BIT(15)
> --
> 2.25.1

