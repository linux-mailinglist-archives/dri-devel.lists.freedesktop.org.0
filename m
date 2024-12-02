Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D29E09E2
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 18:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0994210E048;
	Mon,  2 Dec 2024 17:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="an2Meycw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD6D10E048
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 17:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733160549; x=1764696549;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VvlzCQLGYgx4d7F3X668BnkmEV1OfLXVlp/oswXea44=;
 b=an2MeycwrZ4NHriKPCyQP5US0WawJ1hnqr6rY+yOFI9QGozcjz4PEn6A
 0Mtqqp3hxV3TgEy5sVl34jdpQXbvzlYP+XVZK/OG70U+x0qWhaqFBksM1
 9z8FBklGo6TfRbFNOwt7TXHT5OjBg3YZG79/vE7rLu0bleO/+ucR2qS0D
 3aiaYl3t+7cM3c4ouIa6cZED+ejceKMuX7rG01ibKZolmJkVqgPHJHui/
 Lrac/shoWQwwFN4utz4MPMWhklY7AzRm3AnrCH7vFMcZFsmOZDBGCJase
 Fh/9CSKkYn3NBMkKmv8B1O9sTCw3bwHkxc5XjqzRxNgUkr8m9jlxWJfXm A==;
X-CSE-ConnectionGUID: 9s1ZaVtSRJa4rvsorWXe6Q==
X-CSE-MsgGUID: 7AnK/qnTS2yYBueiNhgOmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="33269443"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="33269443"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 09:29:05 -0800
X-CSE-ConnectionGUID: lOd6LthURXiwaMDvBBgEjA==
X-CSE-MsgGUID: O1N9nppORwqjsrcD1qSMaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; d="scan'208";a="93342403"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 09:29:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 09:29:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 09:29:04 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 09:29:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDztWhiCT6WteU+4KLHWXKT7/HQDJMRuqLBu+ej6VSF8NrDI/pc7yi+e4WI/sYxabcfe5yO70GF9wiKUaPtLN9K2gtSvgvDqBd8k0PfK/T94+sIsEzEETdXND6KfBsa5ElVzLqHw2ZcATq8VSZacnIv4KO0EEzVM2eR8xgobpB6VVRAfyjIb316intRj/r2GEAGK04SSczmr209Mx/b76rjaE8VDeozj388w+Tt7yG/kgsfczRofzhbCQL+6j8x4nhy/PRCh4i/wkGfGQF+9eN34cEKiB7R/vz7RJOwn4iWPx7gG4Gs+cxOwDgiWWI7IMHLn49DQpjsx3W5iYFUyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKt1zclHhs3uyvsefavluoCCIjX3xJ9gbPBOerM4udQ=;
 b=o8+4zVFwXzR/EKQk1QRKytvwUmDGTfN2TWXBVOxzKbIY1EPsBvWDjrsWV24Vm3Q2To9PJWlDBFhbRdEprvKCSOIoro+vbzfX5gyPS39o5EPpDUqtTcmD+/uKYiz9RHVZAxtwID7fGP2jWfUWB5HJPf7FGeI3XL4vnox4vjCPQeT+HQCd0X4rQUNrZC/izz9mGI51sUsDu0roNOOjWxcCddN3gRZpBXVM984g5QHwr7s0j3BAe3HyZzxVOJ8ndHikDM5KVhgbBg27zZ9tUps5aeFwqgrP2BP4ovC2aRulWFYjwzKG02UYGZOYAb5yhf3fFggS5F7uza1caZPJZSV4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Mon, 2 Dec
 2024 17:29:01 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 17:29:01 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>
CC: Rob Clark <robdclark@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel@collabora.com" <kernel@collabora.com>
Subject: RE: [PATCH v1] drm/virtio: Set missing bo->attached flag
Thread-Topic: [PATCH v1] drm/virtio: Set missing bo->attached flag
Thread-Index: AQHbQndPYmuifTJ8Y0u9pOvK/gygD7LTOgTA
Date: Mon, 2 Dec 2024 17:29:01 +0000
Message-ID: <CH3PR11MB7177A6227543D9DE28564403F8352@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20241129155357.2265357-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20241129155357.2265357-1-dmitry.osipenko@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|IA0PR11MB7404:EE_
x-ms-office365-filtering-correlation-id: fc045a5c-ad44-4e2f-8d34-08dd12f6cfb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?I+jvg7mrPCWzHKTS6AJVfUGyFcQs/olOqCf+qvqBqq0EWWa9wH2ZRGSaOqA0?=
 =?us-ascii?Q?x7DXX8BJ3OYC3pToJ9vtyevPLn3NjzQR9ijqu5DCYD8aPj/IfRgMhVHFj47G?=
 =?us-ascii?Q?r/YPS9AnuqEqooTfhDHPWyv5oDHepoTlsauybA9p4E7cRuGRrkk6FSeV03Lk?=
 =?us-ascii?Q?pYznabU3+QVDWVcHokplsOmyUaxvgWLI+d98qDYbwqCOUXoZ3Blf+Lq1lKk/?=
 =?us-ascii?Q?l2Xn251N/Rn0fGQHAXiMzKyEV+CnHn0jb1HlrI4YGUh11hXQ6mmBFz4kvZSI?=
 =?us-ascii?Q?t7i1CWyG1XxPWbRZEDdvmUBBkvTlzANlwh5XZB9xMg4MpiZWLgiMsTDDaRyF?=
 =?us-ascii?Q?0OmWAv6gCHcoYZjDy45m8zjeYs6CWtKXCNs11LZfrMupQMzVF5NHSoVwhv6s?=
 =?us-ascii?Q?ju2sU7/ICMT1hSX5Ch85JKBqDnX3BKWYDYONZWjzSkKij3me1KZiw3a1X24y?=
 =?us-ascii?Q?M3JMi0Iye1tuQhfliZ7rDpvSTuYYNPug2ke6La/ZnTLQWg5xQcwg04gnxmp+?=
 =?us-ascii?Q?CB2m5p/qVR5Y9rrlffPT1NfdcchZLgIw92O567GQmoyk/7T2bq3B2Eps9hi8?=
 =?us-ascii?Q?nSzgl/PCG1M2RrXcBS3fJCoNNkFcUGR017l5w7BRPyiIgCWaDnSEdgNbs4pO?=
 =?us-ascii?Q?1zMD4bh98+5K5hYMQJli5Xw7AbdhLrXDMFh2E3+2h784roMoCtGHTqbZfpjp?=
 =?us-ascii?Q?1jwLcR6mC+mRE+0gvlWFMaqsM8oiYkZFYQuRTPpSQuw6Zqpmn0aPLNCuxmha?=
 =?us-ascii?Q?sXfsn36yshIB+eaf16VdDKawkTEI61yt/5OIhCd7AFs4dcuMNf/9BJfVT23d?=
 =?us-ascii?Q?/C1V2NXwrCZrpH7ysB3WQ1yGpkM5lcpePkXxXTp4UQ/DPiiTsHH6rM4eGBZy?=
 =?us-ascii?Q?u9Jp+3k1vI6OIc3/mTrCs12CO+DIce4V0kiXlPvx25iwz0kjp3f8S7l2qFV8?=
 =?us-ascii?Q?QbEngFO/uinX/20m5Cm6FZEqK1jhXF1JSyhA29q41HowdZiSVQL2ZLBi5dK7?=
 =?us-ascii?Q?5hE/J+XNOJzedYjgO9Cp9iYWl6d8l+jC8tVWsE4E3jhmVFCj4CdYR9SSEqGp?=
 =?us-ascii?Q?Z/1ZF9NO6FZr57GrJaNDs2rHRgFqVGAJTx6+1b4o1C/dNUThdqgjajzH7fjl?=
 =?us-ascii?Q?nFvAlYcGgnjMKXLBASUT3KT92Id77yhRuAJtBghiNpCUhIk+U6RiZ2XgaOmU?=
 =?us-ascii?Q?uzRTgcVqcXbukhfoBXzgn+DXvYJjJG7AT+Y24trao9G85fuCGCgyQT+ttTIR?=
 =?us-ascii?Q?QeZsV29H+bslWM4iSMmDkvVboMoxAKx3R0GKtk4YiMvMVB9pgFHLWnbobbKH?=
 =?us-ascii?Q?EuJMo0StO+Bi4sWYQB1WK0qao+gCNB+GlbU+9XXxOH5s1UaG2alJKzjfHqzs?=
 =?us-ascii?Q?KjWgM6ihxcDGqo56HLlmXtJpBiQjfmQ1Gbo4ZOw3wSatHm1P9Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nzh1a4+u7jCIxmT+ZnqX1EodCKitD19TKDuVNpEP42kv9pYeJRdRwh+fRVBp?=
 =?us-ascii?Q?7STS8/ml0jYAg9tUpW3jWBXaW7szmHZ6mXQ3bUz8eRd2ibckC2RhifSGfdJS?=
 =?us-ascii?Q?6sBnJY1y2yR3VfEsydHCShgz9jSDtqHUiwhm9hs3dz9UgpKO2SjM/4rwh++x?=
 =?us-ascii?Q?vOADTTDCR3j3/l8S/yjSJb3jEF9ozzvAP2zkmlHrlCdp+Xa8HDLxRbPmcof+?=
 =?us-ascii?Q?wcztDm3YOvBzu72hKVAduFvKnLkf/3sMwuzAIfN7kQidQJRr7IabcSOgsb5i?=
 =?us-ascii?Q?Mwg10dAIMxkcwqgpeg1EVFn2exS502MfcDutP1wurmJgEmdOV5YjHxQp7Tyk?=
 =?us-ascii?Q?edr5ooEYsnZE4GiDxVSlaUuvMcJI+FWCL3GZKtFX7schI+01RW4fjD0ifUUN?=
 =?us-ascii?Q?tqDRUmnTxV0RDs0SJKwwZEcaBKGdOvl1fEcIakOlZRQL7z6D8F2LAzkJ7BnJ?=
 =?us-ascii?Q?UK2LXNKjg6ULGcPMniTkwdWYWQ8ujjaz+fQTnbWqLqX5yl0SlIpWsZLlPdpZ?=
 =?us-ascii?Q?OiVUr5FmpHzo/tlpP6+qRveiWLs8IvhHll9aAfLQo9qqIPURgdaCB+p0VjNo?=
 =?us-ascii?Q?kGhKTrEgMLkpD4BVrd+6JPmE7qIZwc2MxNWAP/8tvHRgIq5kzwBWHXlRCzWH?=
 =?us-ascii?Q?ggOcTHJiMYAcZUcOi5I2Kj4L9/KwkMMgmR0V7xDqFQz94D31AjllJRfTOCxl?=
 =?us-ascii?Q?oRomf4KJM/y9wORJcrU3aHFgx/klyV3apMXgk5KiI/neAg+LjGNrPixgDiX8?=
 =?us-ascii?Q?2axvPdC/0N85aTbJU+HNZ/MW7V45jfQtthu8Ygi/d2fJBEa/zzpR7JOz8xpB?=
 =?us-ascii?Q?UC5iLV/n0Yq2RBErDe4/Wu7d8jrjkcrP0M1vAjyTG1sc/2tOxerrZH5dxGYm?=
 =?us-ascii?Q?uXCHZ5FeQzea6Yj7s37tZuWRyoOC5ZadVmwgWEXoQ1n3JfvzZ0VBxxX5+CuE?=
 =?us-ascii?Q?9/P2BwICSGpByx1RX1h0XIPcQfiBhTn4s2eRYq+kBUUMBSAPFn3tgLRmR0RO?=
 =?us-ascii?Q?nkWYLBtVUiCzyrOhiRkDggbKp/c56l5gdjuIRaTHaQePgrecexWjMZr1pWw0?=
 =?us-ascii?Q?e3KQtVyJjdVgWfnni5iHjRTms3DGUD1QjRGLfyVnvCjCjWfZNvN3N7CQZsDu?=
 =?us-ascii?Q?ftvP7FlxI+PX/pp8RoyIl2s/UOUjRzmVu9n7G0d6TIHxU+NEO3XoD9BNxbKc?=
 =?us-ascii?Q?1ThNCqR0P831efCG76R7pWoStwPVaD180jIGoezv++PQrYd+QlhJI+jLvO6Y?=
 =?us-ascii?Q?83SNeetcaeKBzdBm904LzeM00T3u4bmeUQ8A5L8GGFMp6CMdyeYRDYBef/OX?=
 =?us-ascii?Q?kp9ci4rhBy6wHvgBDzqTWB7hysDtVgutzaQn2OKUEO4/vMAWiBxdfZrXk5io?=
 =?us-ascii?Q?cmE9+bfqGwsFR/JOBk9zu3k+YC6HbgShij9KL4P2LHo9axZw9P/UYPpSWCAz?=
 =?us-ascii?Q?RvUqYDSbx6yvyQFGze3uxwNVcJKCl7gn5J4GuxFFT0/+7VBz0sLVDwBJqMe2?=
 =?us-ascii?Q?PXCl7ABpwyhauJe0C9yC12fMgBd+5U/eSLIerQPFrnroJ1WOaSa9Du/MLefB?=
 =?us-ascii?Q?7d//c3ijFaEOb/E2Ww2mFASaX4TJoOJDYwBOrqBE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc045a5c-ad44-4e2f-8d34-08dd12f6cfb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 17:29:01.2335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MXlgtcK4hNRFREnyjePNXaw4Ujx45C2kKB0dqQsxi0w5HRs1gVa+gjYWNc5/SSuiaCqLk8vX/fBGqBycqzVaK0PGH6lXJpuDk5jiPQ+yuHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
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

> Subject: [PATCH v1] drm/virtio: Set missing bo->attached flag
>=20
> VirtIO-GPU driver now supports detachment of shmem BOs from host, but
> doing it only for imported dma-bufs. Mark all shmem BOs as attached, not
> just dma-bufs. This is a minor correction since detachment of a non-dmabu=
f
> BOs not supported today.
>=20
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 1 -
>  drivers/gpu/drm/virtio/virtgpu_vq.c    | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c
> b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 688810d1b611..33084ce1d01d 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -249,7 +249,6 @@ static int virtgpu_dma_buf_init_obj(struct
> drm_device *dev,
>  	virtio_gpu_cmd_resource_create_blob(vgdev, bo, &params,
>  					    ents, nents);
>  	bo->guest_blob =3D true;
> -	bo->attached =3D true;
>=20
>  	dma_buf_unpin(attach);
>  	dma_resv_unlock(resv);
> diff --git a/drivers/gpu/drm/virtio/virtgpu_vq.c
> b/drivers/gpu/drm/virtio/virtgpu_vq.c
> index ad91624df42d..062639250a4e 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_vq.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_vq.c
> @@ -1300,6 +1300,9 @@ virtio_gpu_cmd_resource_create_blob(struct
> virtio_gpu_device *vgdev,
>=20
>  	virtio_gpu_queue_ctrl_buffer(vgdev, vbuf);
>  	bo->created =3D true;
> +
> +	if (nents)
> +		bo->attached =3D true;
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  }
>=20
>  void virtio_gpu_cmd_set_scanout_blob(struct virtio_gpu_device *vgdev,
> --
> 2.47.0

