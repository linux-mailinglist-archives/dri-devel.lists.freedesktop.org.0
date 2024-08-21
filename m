Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D92E959FAC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 16:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AA3710E619;
	Wed, 21 Aug 2024 14:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m71eBJW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5B10E619;
 Wed, 21 Aug 2024 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724250253; x=1755786253;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JoPBltWT8DxAS7mIFQvQjPz1hGsApaZ6oPt6SIJ4pwQ=;
 b=m71eBJW2d+77u0zzIQWvC80aoO+Hv9KCsHvwH4CcuEx0f4f50CIkvsPr
 9xlxhxtGuaiRd+ASdDoFLhCZQ91OXj8V298TgIsbF1gVIgKuj4V0qCsGN
 Y96EOMl3oNJEjRJG1K1L9oQJLNoh+OFfRvV2Zu4E7r39B2rOsoA6LwvSS
 ZR56xf0pzrtEsICjTR3l+L3KQA8IDTyk2u2WRT4ArwWkrF/cGiidZllT3
 6/0QHsA3LcwbXmGTEw03KrXe4yIEUxGUMpHayTCf+FaP0WvWuKFl3uSmw
 ifYMvNjbr1iqA0hXyYz4vOBovZhL+TDAw4DeH+dC6LIipBvf1vVG1XyL2 A==;
X-CSE-ConnectionGUID: 37bFNTgUQOi3HYuZy9TgVg==
X-CSE-MsgGUID: 7+gkIILPRaOGRJYy1nHXzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22762627"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22762627"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 07:24:13 -0700
X-CSE-ConnectionGUID: pqX2p9SkT02V4Ax53M8nJQ==
X-CSE-MsgGUID: o27UWfqKSDeRnhzARP0ncw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61088144"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 07:24:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 07:24:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 07:24:11 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 07:24:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEbQEr8AlwQzcbwmSUEuv0uGuh6FwN8hxtEkUNanGUK1OBICfzxvCMAtlJ6Q1fXamxvNxe90xLjxy4uTBoQ+OvViHdiQIsclPNzPYlVXJgV2Xg6HpZYuD2Wv7IsVZzjtSz+9kHX5oOG8y0va+7ji3F+aTTpzxKjWmUBR8qTk2/gzgsVAQ7/MsALP+d3l7kTqrvCcm6+Abq5vsPHQM+N4NieTla/PHj4U3pw9rEeklTvNdIbPb++e4BlQ1nexasXUv+GymIEx5Eiz55mWAbuMUbHn7qIa6glvhdvv37LxEHa5IMQh6xa/+EYuxyU0ODfeAmoVWH1w0CspzExOP1Ci/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s+xTScwwNbtZg4DxBTDT8zTlahzP7gCkxvqV6WpZEaM=;
 b=i1E2qOHRxq4/dKIDHbFcppScCRxsOt60Jc/8RJ3L8jdT7eVcW2aqcSzdccKgmrSnHrY8JOHWu1QJmagKdyENl1usRciuGC0xVTFRhG977E2MpVZjadmbimou5DY5cOj4pziBD9PhX3xzaDkmvZaKiJp6dFFQ/RIHlK6Edfo1/O4CxFUrOes+ZVUgU58cIBPm3qRv9ciZUw9z8DrFzfBBrVrAp+LlpPq51lIrlZTDD+R37EqT7JQ/TJiZ9GEVOHnURObK3LUiYUDehm+a726aru1Cf71FrgDzlzU0R8ss2/5yAW7BNbCW8shl5iGbCawi/CKSvWJ87VpIvg3zamIqlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6879.namprd11.prod.outlook.com (2603:10b6:510:229::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 14:24:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Wed, 21 Aug 2024
 14:24:08 +0000
Date: Wed, 21 Aug 2024 09:24:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: <thomas.hellstrom@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Support 'nomodeset' kernel command-line option
Message-ID: <62hvxo7qppsitmpdu4vvkk6raafd5a744hagwskhedeyc2euqe@xme24eje5a2m>
References: <20240821135750.102117-1-tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240821135750.102117-1-tzimmermann@suse.de>
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6879:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dca15a7-cdcc-4cdc-8e44-08dcc1eceb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XNn4OjnJy6LiqIxewLUfMJLnIjsi7XT1dEAYbFmSJEyNJaPIm9EiVWAnATFB?=
 =?us-ascii?Q?lUaV3mWNF+qtq3nWNB1AMgpuPFkfofZvveIAO2fVxlfS3IHVHqr1mefyKPDZ?=
 =?us-ascii?Q?vhZoq73ZfNjawiiypOifDemPOQSE7RsxIKopN/Qa5YIRtJ6lMXdWhZ35o7le?=
 =?us-ascii?Q?KpQBlxEOiWjUM90iY5ZPzPcn4P3iTy37UcLBVn3QPBFXMUhwM0c2mFTW4HXV?=
 =?us-ascii?Q?atAypVbxKg+mdMyioKn2PbX/j8T5uV51DGrpHS9xrtVT4yjaFZgg8SZNOQHR?=
 =?us-ascii?Q?NsOwye8OzVvbUxKbV3HEksj1x/LHLAfq/3cPHZgMvpyEh91WaLIhvs6KHaxU?=
 =?us-ascii?Q?/G3DodcK+4iqhkTs1GyUjT9+y7GqpYflF396S4yKWhs8CujnoJUCzqmXQPrx?=
 =?us-ascii?Q?Mv6Zyf9SK6SXhY+68mtx/KYJYRDwQgT2KcTPC9oxcgPrv91JRpMZAYuJMZAk?=
 =?us-ascii?Q?aVib+k3uQyestlDkl1hsNKgkx4wAfguR0kmmnoYOiXRYDTw4mxMG4M04Z37L?=
 =?us-ascii?Q?C8x6mb/gVM1yFiGBN5m79put0kg3k7rdaxz6UVWV8ZHl7L86o/8mfVxb5dqL?=
 =?us-ascii?Q?/VyYuHtqGnTwCIR2sQbrOvP2rn7vJrda0vSGtNcFCvde+JY5rbwsg36jdVB0?=
 =?us-ascii?Q?O/E81LMDLcwIvQ+TuV7ySHNJ6fopNbQaT9lOPmtu79Ch3PqMCqKypCQBK6z2?=
 =?us-ascii?Q?8dTdYxGMqD+sj44c6J8abHHITXukzfqUsO1NzEfbeXtc5V1aFDzM5vG214/C?=
 =?us-ascii?Q?cM/uncYjzrfqstZQ1b7eCPA+pQRsOelqcucNPGGywkf55kdM+X0/+0R8H3Fv?=
 =?us-ascii?Q?aedxEN1y6DA1SR59nlvAix8kTvJGum39LMdxSUiyo4PfhTn3hgUcuFctkLIh?=
 =?us-ascii?Q?spSHj//PMYeDWbrYvWlLhMiEYnoD9XPpnrkXs0BKZ6i4+SvoLVIgoeE7tph5?=
 =?us-ascii?Q?6LwUYu/11+a7RUXGRGOrJ/R8rFt1YdfutqM5ptoF4i43lfMOkinSzowbXTci?=
 =?us-ascii?Q?7fvv159+kRSaTulzHeoVD8Tf3js0igYPgigFa8KqrtL99HAx8GXH9HO2qcB4?=
 =?us-ascii?Q?kswCTooPpqrnUJ2UqpATqOCcuVpGD+akYyT+hi4p9KCuZyv+FP6mKlLU0wgZ?=
 =?us-ascii?Q?t8MxiexEai/fDoM1LCZchPipjN8RdKTAVpQCQeqnFXJJlenc90e0n5UBCak7?=
 =?us-ascii?Q?0g5AetFlwZEZfoGQPGOSPxQmezix+QAlpYYgoeUgL3gvWeCfn/hTqVPYfsdC?=
 =?us-ascii?Q?mRv0mUZCrdpkAQIzB9mLQnjbguaNXstSmYSdd/Fgr2j9xUTBwjzShybqYWFi?=
 =?us-ascii?Q?J0S6rhLvJ+AKJJj7hikYGpqExcZZHoBMRpqMeoOTS39z5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hUZa1N8cw6nx/HR0FVAsKnopANL+S5mmVDyBhIzkmi+2BFoVL+Mr3yC2l+Yo?=
 =?us-ascii?Q?g+0d4JkMmDecbBu5L88v/Z4D84TI5JDrgdRfQpNQ6bKR9xGxU6ZvQGd9c3Qi?=
 =?us-ascii?Q?4W5rmK6r5X32zZ9l1YnjVo99QRlUkWv8XRzPgHOZRa1LRKvXUTNAbOnvBAUL?=
 =?us-ascii?Q?mB5SHWvyC4YDnSsdupNlsHVM0TntM7h7oO67UXfAFIEx88XMJ3d6obVhgNAI?=
 =?us-ascii?Q?KoXKFBjLs/XKHV42VdaBFiG5UYwGWt90zGkwGIpxpaWI3pOURGPaz5PkPp3m?=
 =?us-ascii?Q?ZwB5z0xKc2JUgfxJi5D2LWxPLM7y5MOkg+ZVmo/J1CUdXbVIesUdKHW+7/9d?=
 =?us-ascii?Q?UzjPC7wfqXFS0OiD6buEDOq8oSZW2iq2YwzftpHI+Jvew5ovAv9yIoi72rek?=
 =?us-ascii?Q?er1lOk0Act9kpZH6nUUqUyBoYQPCesQMXX64TP5NOkVKSUIPG1v9RfCbzCmy?=
 =?us-ascii?Q?+dWpjhVnrzaTGdGcRulEaYwbcyq9fqYpjPvvbzlgdMdy4i27MVsmA3lkkNwV?=
 =?us-ascii?Q?HjC2IBWdkRi9ylKfRjfr8qH7S73a8FNEVxBw1JGQLoMbYOq/bTIVsNwFb59o?=
 =?us-ascii?Q?qPgqYurvtR2JGv+yZg4kZd8ch3OpcWgQWXUDGtENrUmkDyKncbU6N7qpRFAB?=
 =?us-ascii?Q?T3bGE5W+adpRuBxFfbaIMB9Qy0i44j5+dht6H6v4mJrkroP4ybbon9BfkURs?=
 =?us-ascii?Q?gftNzIVufZtWsJ9FwY56VxWCfKgsVfg2ppS2rJTEh/n3EEnJNL/d5NC0dORy?=
 =?us-ascii?Q?lOSXktYVCri0zU5iYnEDKG+GEyOn6B3wSEwyiQi+8ZzOGKwwpsLwzkvOSMyI?=
 =?us-ascii?Q?Yad4wcXfnrj6r//MBiclmgXfnI5RZAeYdLFqQv83lRXotlHqeVASMRIG/nVO?=
 =?us-ascii?Q?y/HdvTlDnLIwncWyXrViOAfB4/fyFPPBG4b0qB4Z91/82uO3+64wVug5tSn1?=
 =?us-ascii?Q?F6iunBMe12eicJ7yLBhD4Jzip9PqcAL8MX45CT4InAbINVwQuz+fl0b/C76v?=
 =?us-ascii?Q?+fDBO2FLhzrmDw5oGf0HHVMuTvm4aElpvz2m5Mc0XrYPeY+PWwsaMI1TSKl2?=
 =?us-ascii?Q?09zfytteFzj2qdagSVzHYx3wSN6fJNXo536OeYgJRlhN3auagkJQeAC9atlH?=
 =?us-ascii?Q?LqE6FFnYzNSqyK/ZkH8Tq4G9sfnv6Bia25WvFuP1HS4WN8JpmK/mSUK0eFtL?=
 =?us-ascii?Q?7RdCWiF1n5FdFJ6jdwCT5EikwrRvYeoift/Q3DGDMe+VD011SjuyAY2moUGz?=
 =?us-ascii?Q?Ah/jQfTNB6qG3AaObp+Mbp8PdHnxyKafTwnA+fXxoLgoG/HhZ0/p9LvmqdGr?=
 =?us-ascii?Q?ab7EseaCnBd22F8rZU69xvHD/mzHzKy1fwsyEZFYPgKkNDdTFVCw0q6nrpey?=
 =?us-ascii?Q?Syax5HqMYi8UqUWBGePVBRKY4bX8ww+udsl6Rdqh511ITCwnY1O8DsGmOO1m?=
 =?us-ascii?Q?1vCufd+7BQxiYnaAz/yd6P/aRlNazN83CKRQOojtt9cRNVocAWWPgMTsOfWY?=
 =?us-ascii?Q?AlVcnnIPx675wSdSgWO8GUxFLxFy0Fulh59w5NqX1Q6rwWjBGduol6N8pkRA?=
 =?us-ascii?Q?bYiUc9D9mLNHQNOGYJfp51fuA9noLjvL/JdWl9qv32MO4m3jkkSR2tRM9EX3?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dca15a7-cdcc-4cdc-8e44-08dcc1eceb4a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 14:24:08.5564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +w7ogzCx2teNLK+8ZEQORLbzYSBJWHJtsMOzM65ZLkjL32GIU3PUAJWMZwACJazDk1uWeMVi9/nBq/PZeRBKXnYMWJ21i3UHwE073vHIegc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6879
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

On Wed, Aug 21, 2024 at 03:56:59PM GMT, Thomas Zimmermann wrote:
>Setting 'nomodeset' on the kernel command line disables all graphics
>drivers with modesetting capabilities; leaving only firmware drivers,
>such as simpledrm or efifb.
>
>Most DRM drivers automatically support 'nomodeset' via DRM's module
>helper macros. In xe, which uses regular module_init(), manually call
>drm_firmware_drivers_only() to test for 'nomodeset'. Do not register
>the driver if set.

I see some drivers like i915 and radeon using an additional 'modeset'
parameter... probably to be able to avoid modeset for that specific
driver while still allowing for others?

>
>Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>---
> drivers/gpu/drm/xe/xe_module.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>index 923460119cec..60fb7dd26903 100644
>--- a/drivers/gpu/drm/xe/xe_module.c
>+++ b/drivers/gpu/drm/xe/xe_module.c
>@@ -8,6 +8,8 @@
> #include <linux/init.h>
> #include <linux/module.h>
>
>+#include <drm/drm_module.h>
>+
> #include "xe_drv.h"
> #include "xe_hw_fence.h"
> #include "xe_pci.h"
>@@ -92,6 +94,9 @@ static int __init xe_init(void)
> {
> 	int err, i;
>
>+	if (drm_firmware_drivers_only())
>+		return -ENODEV;

nit: being the first, without an .exit may be equivalent, but probably
better for parity with i915 to use a xe_check_modeset() and add it as
the first one in the table. We'd need to check for exit != NULL, though.

Anyway,

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>+
> 	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> 		err = init_funcs[i].init();
> 		if (err) {
>-- 
>2.46.0
>
