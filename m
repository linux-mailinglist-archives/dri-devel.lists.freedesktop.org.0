Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0068C78AE
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 16:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B1D10ED4E;
	Thu, 16 May 2024 14:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1wBFg2S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08B7C10ED4B;
 Thu, 16 May 2024 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715871054; x=1747407054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xJiP1lSucc6Ypqr+QEuuI/zr13tcm3Z+9jAY2+NqPBo=;
 b=X1wBFg2STIuQrrNY6DtbMd2+qxzfPwe+jqThelZkL3nqr37mVQ9FqXxO
 Tf03eQQYFBtH9QByKZu+QA6a9sUuJgLtx6tSYTvP8qK4NMv76YtED+77D
 DN2hEDSzRegODYNyaCbFPZs9BaWrqeySMcUansj8JxIbWbqFMRQDfOiz1
 MSmpEK/gHaX0yx6wb+RaXr/8HDriSQF+v3Dgw1K8QKO3/EsnB9woxXnAz
 u4af1r9o8BXr2xyGcFtw1TEwSIxmbQnyQYAIl4n8DOUw2oBgyiTkb0hdK
 ih+6O7j1xebnb5eU5fv7AbqpyW/hrFyHGpKj/wi4gT22j6rg4RtjHuxZ+ g==;
X-CSE-ConnectionGUID: EpAE6ZfZRG6rfVWkwWp9jA==
X-CSE-MsgGUID: MnsTrBJMS5ehbqIi6eXfvw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="12171666"
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="12171666"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 07:50:54 -0700
X-CSE-ConnectionGUID: QQRqTd2rT1iv1jQjCaDVRg==
X-CSE-MsgGUID: r/O57bbySYy3dCi6iNErhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,164,1712646000"; d="scan'208";a="31447292"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 07:50:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 07:50:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 07:50:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 07:50:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JmauLHnd0NSHOqIFOITtgbIjgdzoZLR39YudsoXZJAgvoaARu7LaEuCZ7aWfBuIndQkK4DbZiYxhMfWe50te/b7rOgKNIiAFCAie66g8rasenwRsyHojhd4lULqqRxiDZwkHz7IXcCZKgV8tqioWJG0A0uukB+kTwF6p87cm/izHn1rI5OitRT+16eNhBwvwteYS7g0O+dFPNy9ibSLwrqSh45G7vsXdETC2mtv8NPlg3LNEa+MQUrMkS0TF/4Byu2sE/dln6f0juijZvlXpYvBsBvdHPN7OsLV/9DhXbZEto3C5h6g3fN1xhpyPBV9OznX5rsKhXgjzFJXev8invA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9TtkDn0OO+Wd31q5PCFwtdaXsQraipiF1/ur35L6IdU=;
 b=cYuBIMlUee3Lippy1a/wCOZyPdGnMJ4b9YOGS0IJII9pbjdUjePa73nykhtLNvatNnLhZ4f5LS9ldSmz4eKxJP35n5bv0da8MYpsnhbl1yllxyo/bub8nnpTLxDdoJFNXSntV/sqlDbJ/eZN7TnkUEvKlvgANCXobeU4Kt7Am3g4uBeIVN2jFMDTHWD2dHzBOg6x6DRGlgKT+i5/pSXkn9vhjOcW5enHHx1HbfKiC3n9ZG5o3iMkXuYiKc4gmiGh9X99z3qIf72KbWr917RVre3jT/r71APTaTcLKRICFd2grq3/YucB+giG2VtUWIhFh3wpRKWW6BxkUHqtAM0tpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB5296.namprd11.prod.outlook.com (2603:10b6:5:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Thu, 16 May
 2024 14:50:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::f061:a0b9:4a91:b27c%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 14:50:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
Thread-Topic: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
Thread-Index: AQHapxDrz6Ggc+M7HE634QnaAmNpObGZ7hjA
Date: Thu, 16 May 2024 14:50:50 +0000
Message-ID: <CH0PR11MB5444388E0A465510CCA85FCBE5ED2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-7-lucas.demarchi@intel.com>
In-Reply-To: <20240515214258.59209-7-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB5296:EE_
x-ms-office365-filtering-correlation-id: 6b696c1e-778c-4e96-40a7-08dc75b79422
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?rS/H/WGFNhKrJUVBhpdCu+x2DBrBKvkJpQyVO6583HrvbYseT+uGSMai7Y/l?=
 =?us-ascii?Q?AaUOD3CRzi0pfIZeTQz/FPfE94QP4D1muAQ4ZLyMj+514H/DkoJriz+SQ/73?=
 =?us-ascii?Q?I05DxKBV6coQziPdbgDseeTNxQbTDwYUNyvoHJg7HchvCshXYU141Yg14bDm?=
 =?us-ascii?Q?StDRP1VWa/3mjC3izwv0Dr3/+UgQ+1INAaWj+md6xkKy1qdV3h4ES2lndp6w?=
 =?us-ascii?Q?UNXTiAAzwrSuwBqqH1Wo4XLyeW0BbaX+y6xiBlIJKlIAzJe7W71qRRe83/Xs?=
 =?us-ascii?Q?6YshhSlgnUedlt4yIEdIoOZfxYHHTyNRo/sF9sRFBEYxc37PA+jS0gcj6dPE?=
 =?us-ascii?Q?zkfQqII4Z1VHnuYIoPdp7GdL7JhwDRGn0XZbsHoDZkzUhD2oC3xcPhOIGM8d?=
 =?us-ascii?Q?I/X7T3SYB39YKkcq5MCfixsF9xmRieF/1ThKMf5drYvkyo5UjxolHAd9IUob?=
 =?us-ascii?Q?n55op66+3x/3i/HEAGNmfrVxV/AUdQ9rMDVwHZNtgXma2RPwLwX/OdQV1hhH?=
 =?us-ascii?Q?9dmvRm/vtUTywBUZLfNhZOw9tdSFW6VFBEhB5EIiPZ7mKyRlE03hRRUSQHrr?=
 =?us-ascii?Q?C4FbbXZL/Pp4WfOm/NhjwWzpZF+Da6Vymbnfth0XKX5+HnzYxJgUE1s2VJLa?=
 =?us-ascii?Q?MIthAGfJfnBxPpUFt24zvQlQrTgHpnCxMqG2bw9xdECFc/CN68hAXGlPU2yg?=
 =?us-ascii?Q?HZMR8fTPQCEwVM1pC+vwN/3C9WAMRJ26CNerT3DgJwLHiW2UNL9+XF/bcmoa?=
 =?us-ascii?Q?hPEqarO9LGayjvn3Ga9LmqPnKUfo0s7IPScWhsaNqtlokcLI7Q2kPRgLNPm3?=
 =?us-ascii?Q?BkGODaj7q4u4iul5QyusE4PiO+GRlNkYJLLmIFZLJaLaHxmi8R1fbSU5wMsi?=
 =?us-ascii?Q?mfKOh0TXeoQ9UQwz0AQAD+JAyc2CacC7imeFahQaoo0ZB+6tubO7V2e/uxvV?=
 =?us-ascii?Q?trDIHinNDJN3lkX9sgRghG+EN+FVmldNkuD1j0byRhMkWgiGdnmqMNcDjMCO?=
 =?us-ascii?Q?nI3G4dXyaOorStIO31o7+yw37AuV061Iz2yLpkvIkCHhHMq0RT8ibWX70wMk?=
 =?us-ascii?Q?OpH5o3EiWOzQGeropLfuQTL1lIAgu0JSiW6n6D82Yz7gOSwCbGCpWy8bzOor?=
 =?us-ascii?Q?/1pVcZuo/Se3WFP8pIZEOiO8K6dhidU/p5WcebKXIaq4bIciooJ2RT3ThtVJ?=
 =?us-ascii?Q?Owf0GR5hIJloT4pBrUJLjcGqe51Slo+HqCFE4QHFDpOLZic1CknV7dHolfr3?=
 =?us-ascii?Q?hpxKzoFCjE9g6/2fMZ5laD1Yn8GIFRI+YEu40xgYs/pJh500euyMWyempBqb?=
 =?us-ascii?Q?MYdEQUC3ejphxnQjCR+9IvQkHJjJpLLKNQgoRUn3t5UCag=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?slxwX4bVLBsrwesirbk/yYdBB3arDGI92UYCN5vA/tEJdFNc/3bRujFqbpWB?=
 =?us-ascii?Q?xvVopbk4fnAsruKjWlF8l6hufeztZT7RyHNSb/G5VUAOny1nk3MQ7DNe3qGt?=
 =?us-ascii?Q?vwejxkFQ1hfuTbMNM5ySiM9Y0vDDrzCVVjbvONIe3T1ev2B5Xr6It+5SEEfx?=
 =?us-ascii?Q?PfUU9LjhyRsEp+Du2DaLWrljvRZdWVsmNIt6ixN7i53im4PNe4cJOJrh55+b?=
 =?us-ascii?Q?RXifMAwOcrNX4qYSKXQ5Ptv5G73j+u52TpLe2OKSM3x+qBneCKdlBdXePmCI?=
 =?us-ascii?Q?KfO6SFDKgJb8DTrwmOrXpWoeyLrOFKBBCmKL2JGuzi7GQRRKxTiwbm/bT6qI?=
 =?us-ascii?Q?Al1z2DhZzthMtS+sJ0tGxaRfRWOm+6LFIkRqBnUd/5j4L5u8QXJ98fa4fY71?=
 =?us-ascii?Q?MjE1dnyPtfo7Eyv6RaI0lWNk/PLiw86Cfab0O/dQtmrKh9OblIx6UXqrXj7B?=
 =?us-ascii?Q?gyQw8bnrJPawWPQnNGLwng92x4iH1c4mmb1+3PhRAsD2twY7eNEn4+9IAsWa?=
 =?us-ascii?Q?ZmXa2kP1NsVCYm1Mkv5zIPIXl2ezDn+gedapvZEr519gutgks7R1PvbFq11t?=
 =?us-ascii?Q?S45cYTcmpOC7ihGZkUEYTEGQ3X7d6wK3FduNGSpVWc8/gx2wuAR9iCsjycTU?=
 =?us-ascii?Q?sdTlnKJpRA5obEp285ZLOcg+g8CGf/SqcD73dR++fkuF3cspERMXEEh67+cM?=
 =?us-ascii?Q?+HEQmjluu4ncDI7FTF6eBYI83J1awOWyTdv3WBCS/aryMIkxuLKDJk3hIvCR?=
 =?us-ascii?Q?YNdXVy5vGri3BwWIVG3l90nPZaAU41PIlrr4InS4cRxS511w695aHfLjQOCZ?=
 =?us-ascii?Q?UTfeSnyQTtoubOre2BCnCcUEHcSbdpbtp/J1i1OOZCJkmpsYOr+s8S65xvK+?=
 =?us-ascii?Q?rJ0wCWeIlkBTZdjAQIXZTj1rXzJ/j4Ur9ePMXUV0r1jp1z3uc2Vran0N9kXn?=
 =?us-ascii?Q?xQnzplw3m4iadTAL+eP/Y9VxIICpItjMS/5qs1JP+Y/E2I018rMthl2KlYgj?=
 =?us-ascii?Q?gaG/76Wl1R/9MlqMctKEsnMwLOfhuR+4NzcRbK4YG00JAjTjEYf2YqhwFbuV?=
 =?us-ascii?Q?UHBi2DMbc1GaHNUf8cQDyEM9hO1CsN55Pe+c48TYyKE2biMx81eKoI/832rG?=
 =?us-ascii?Q?Nog4KdQN+tI+yjJWqtt+4NJQkrqRhSqBPPgfAlrbGBuZQ5NnY5HMNDAhCy/8?=
 =?us-ascii?Q?r4MpjeVgsrE+9j2WvFcwzEYatUZyyn7SRcR+f1nMQy9TPlwiG62qySG7gbrt?=
 =?us-ascii?Q?8a6PwsE6Kh6mtWDQJMlOpYgRoKalChdQqC9SLlx4lIzsiO6jROCAUo+kH1Vq?=
 =?us-ascii?Q?5WzI2vmtf93abroeWmHJHIqL5aMeRpasHFcMVqmXd9S5322hoFSRRslIfkBh?=
 =?us-ascii?Q?RoRc6YewP1JOsSJ/1mLTNiV0dFvkg2/nq3ZaD47kOWnQfCzPRKD1lV+lK0H/?=
 =?us-ascii?Q?E92qeSlJbWswfFwvgXcW8PWQhH6kBdAf0Rd0dghvDcXw1J1KN4PfoCpAyu/k?=
 =?us-ascii?Q?/Mpkg2IwpxB7MVYjKXx+rQt/8priSuH4DMS8KTkFQ6wWuy+AYWHeQoOID2Nf?=
 =?us-ascii?Q?pqDhGKFBtff22c8Zt8gJSBApoQZqPhQWtqypHRZs?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b696c1e-778c-4e96-40a7-08dc75b79422
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2024 14:50:50.4239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: anTqxUYOLQ//aMEcO8JRCXaF8PzWWgtISoIFnIOs9BuFBtpa48b3di2tyPSRYxS6CslgYCNzMVPTRTzjuGD0Ik6n0r5Il+FdcweAi/wI+ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5296
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

-----Original Message-----
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Wednesday, May 15, 2024 2:43 PM
To: intel-xe@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>; Nerlige Ramappa, Umesh <umesh.ne=
rlige.ramappa@intel.com>; dri-devel@lists.freedesktop.org; De Marchi, Lucas=
 <lucas.demarchi@intel.com>
Subject: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
>=20
> gt->info.engine_mask used to indicate the available engines, but that
> is not always true anymore: some engines are reserved to kernel and some
> may be exposed as a single engine (e.g. with ccs_mode).
>=20
> Runtime changes only happen when no clients exist, so it's safe to cache
> the list of engines in the gt and update that when it's needed. This
> will help implementing per client engine utilization so this (mostly
> constant) information doesn't need to be re-calculated on every query.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I have a minor nit lower down, but nothing worth blocking over:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c          | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt.h          | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  1 +
>  drivers/gpu/drm/xe/xe_gt_types.h    | 21 ++++++++++++++++++++-
>  4 files changed, 57 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index e69a03ddd255..5194a3d38e76 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -560,9 +560,32 @@ int xe_gt_init(struct xe_gt *gt)
>  	if (err)
>  		return err;
> =20
> +	xe_gt_record_user_engines(gt);
> +
>  	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
>  }
> =20
> +void xe_gt_record_user_engines(struct xe_gt *gt)

On one hand, I think it might look better to put
xe_gt_record_user_engines above xe_gt_init.  On the
other hand, I recognize that it's not strictly necessary to
make this change because xe_gt_record_user_engines
is declared in xe_gt.h, so this request would just be for
style reasons.

Feel free to disregard, this is just a suggestion.
-Jonathan Cavitt

> +{
> +	struct xe_hw_engine *hwe;
> +	enum xe_hw_engine_id id;
> +
> +	gt->user_engines.mask =3D 0;
> +	memset(gt->user_engines.instances_per_class, 0,
> +	       sizeof(gt->user_engines.instances_per_class));
> +
> +	for_each_hw_engine(hwe, gt, id) {
> +		if (xe_hw_engine_is_reserved(hwe))
> +			continue;
> +
> +		gt->user_engines.mask |=3D BIT_ULL(id);
> +		gt->user_engines.instances_per_class[hwe->class]++;
> +	}
> +
> +	xe_gt_assert(gt, (gt->user_engines.mask | gt->info.engine_mask)
> +		     =3D=3D gt->info.engine_mask);
> +}
> +
>  static int do_gt_reset(struct xe_gt *gt)
>  {
>  	int err;
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 8474c50b1b30..ad3fd31e0a41 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -38,6 +38,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt);
>  int xe_gt_init_early(struct xe_gt *gt);
>  int xe_gt_init(struct xe_gt *gt);
>  int xe_gt_record_default_lrcs(struct xe_gt *gt);
> +
> +/**
> + * @xe_gt_record_user_engines - save data related to engines available t=
o
> + * usersapce
> + * @gt: GT structure
> + *
> + * Walk the available HW engines from gt->info.engine_mask and calculate=
 data
> + * related to those engines that may be used by userspace. To be used wh=
enever
> + * available engines change in runtime (e.g. with ccs_mode) or during
> + * initialization
> + */
> +void xe_gt_record_user_engines(struct xe_gt *gt);
> +
>  void xe_gt_suspend_prepare(struct xe_gt *gt);
>  int xe_gt_suspend(struct xe_gt *gt);
>  int xe_gt_resume(struct xe_gt *gt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_=
gt_ccs_mode.c
> index a34c9a24dafc..c36218f4f6c8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -134,6 +134,7 @@ ccs_mode_store(struct device *kdev, struct device_att=
ribute *attr,
>  	if (gt->ccs_mode !=3D num_engines) {
>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode =3D num_engines;
> +		xe_gt_record_user_engines(gt);
>  		xe_gt_reset_async(gt);
>  	}
> =20
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_=
types.h
> index 5a114fc9dde7..aaf2951749a6 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -112,7 +112,11 @@ struct xe_gt {
>  		enum xe_gt_type type;
>  		/** @info.reference_clock: clock frequency */
>  		u32 reference_clock;
> -		/** @info.engine_mask: mask of engines present on GT */
> +		/**
> +		 * @info.engine_mask: mask of engines present on GT. Some of
> +		 * them may be reserved in runtime and not available for user.
> +		 * See @user_engines.mask
> +		 */
>  		u64 engine_mask;
>  		/** @info.gmdid: raw GMD_ID value from hardware */
>  		u32 gmdid;
> @@ -365,6 +369,21 @@ struct xe_gt {
>  		/** @wa_active.oob: bitmap with active OOB workaroudns */
>  		unsigned long *oob;
>  	} wa_active;
> +
> +	/** @user_engines: engines present in GT and available to userspace */
> +	struct {
> +		/**
> +		 * @mask: like @info->engine_mask, but take in consideration
> +		 * only engines available to userspace
> +		 */
> +		u64 mask;
> +
> +		/**
> +		 * @instances_per_class: aggregate per class the number of
> +		 * engines available to userspace
> +		 */
> +		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
> +	} user_engines;
>  };
> =20
>  #endif
> --=20
> 2.43.0
>=20
>=20
