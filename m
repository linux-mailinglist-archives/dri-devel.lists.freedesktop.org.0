Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC986B7E20
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 17:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4916C10E5BE;
	Mon, 13 Mar 2023 16:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C290210E5BD;
 Mon, 13 Mar 2023 16:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678726301; x=1710262301;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yK0hd1FJbllC1TllhVPshYpDlAChe2cXwsooCtmdW+8=;
 b=lZ9Ppf/809Daqlx7lIieQotaUtGpbI9t1QMgMZRjloIw3Kl+jkMUbYku
 m/Tbo1NSCaeIWxu7/7idSMvCwmNElZQ7/a8W5dM9DPBHR2/5VTm3gP2fv
 ATVPdOqomXtMQPBgvX0IzbmeW1ExJSK8i0TNkEmd5N8hldJeKyRv/li/v
 SH1Ogob+3mBTgHDBscuV+ugG+v0yL5LTlk1jiwV26e4A1h8kklsjw6KVG
 9KzyU7nx1Nif9vdwPt3YQRI+KxTUUzQ3nrFN25OfeXGhsjrjzLP60cXk7
 jJfPFI16xLZnUzvfhtKYu+RR2kA/+/3dFXRrPmBeVfjjurYNio/K5U5Xk Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="321052948"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="321052948"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 09:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="822033192"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; d="scan'208";a="822033192"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga001.fm.intel.com with ESMTP; 13 Mar 2023 09:51:39 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 09:51:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 09:51:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 09:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=moxAH9583h1zlGFRcOIiTKeid137gS1KyiVSVgRlm0dL2LacotJjC2t6Fb3GoOxtln1GkAfzEzJoxi0mI+NDUyZG3SzxSXJHD+zt5Q2/H69tirzENRMVN2s6be8/ILobmEi0D5y2UqwbTg4PwSV6qHjbyz8TrZy4BF4JSU35YbbQG1G462EQOXqpJJjYV1EmeE/32BAnr8xrklkXDH2g27WAuRrwYOyVhGWQimzK+cbOXepPActmLuMNTDXLJx1CSuHBlBXrFLkhINWQXniAS9CLM8an/ewj6MX2xENN80I0R8D3w3la1Dsqo11Q914+hnSFb4yzO//fQ9EMFLf39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFZU7cp0tMe4kcTyVcyhQTbNQR9JMoXlLd5xrcD8RH0=;
 b=LljB4H6TYykSlXHGR1K1pvd4PXC3ojEm7nCFIUwNovDlUWDu1iUDbnqrJjvIi2M/xFZMUIjC+vVUHsMG3VSerWyN3ofURqoM7VWtj8gnfywoXWg7DxaEh2jfvtMoj6VP5UhZPLwPiHiAebTJGUzv6UnwzbMzoSqyqGaZzjc+76Fvfcv5XyHg4eHPbpOPZD19CP29TLL1J4fAXp8ag/hTspZnFDjCneKdVnwFTaD/g/WiZIH6r0IkX34J60CDnevG7VLCnL7NWIsoY2CMx1jxAtORA+MB3wtOkEVUwUe8PR2ms5XQlWibHjmxiGCTyDhchhUnNc5j8Jy1DAx5b3EbqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:51:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Mon, 13 Mar 2023
 16:51:36 +0000
Date: Mon, 13 Mar 2023 09:51:34 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Introduce GT oriented log messages
Message-ID: <20230313165134.q5zvcriqd6p6i7vo@ldmartin-desk2.lan>
References: <20230313080357.2364-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230313080357.2364-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR01CA0013.prod.exchangelabs.com (2603:10b6:a02:80::26)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: e616c2b8-7a70-4e62-922e-08db23e33517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +rwtQoG+HuIkp2CUj3MCCRP06HkEaCDcpmaCp7R9QEwif7wULQapJoo3z0LMaE9rn1kvdJzMK9W8Uk3iThsIxXCM5+fexzeaRmZL+RZhsXKWunImiFrT4/XMIORO2g6EN/9PdPtLE0Nck5rMy93uMajc9+t0qbRtFUNWdSdTQ11/aQNAV9YPB0DSCwBfKtVJODKdD1sjXNNTZ8RQNvUdG/0B5t4Xfd05aDOUN554QYVPxussFqkM/6D3lZREMLYzp522ukknrHGdQfQhIj9C6pjWwp/CYgclonZ5C94ZILJjtlk7HJnAzFy3QBNCUb+EjKT8Dd69N439/ICghipXUWWUhsfxGsB7gnadRpbkY2OpsEg9249gcm2o2v2Y/gd5o0yWQmkvfeQGPPJCd3rOEmtxjx5oLB46/C8tAqkSOEAJtJloUDYEEXe0EAYAdQctn30Jrtq/RjNkKpcPfijk1wHpBCwh3h9b0FsPb8WR8TlGnkZQxDFSwR5Fm2JWZ247mQQd5cGLGN7sM6GPMIaRc9QLG5wk5TTVaGk/Y2VLDh+gVo5m5CZNrqsnyPtGXoe2T3n2nnqln5ZPUrVkjjK+Hr4gDbsZLYBwBR66lTG/hZ1Ki5yKPczrT7ZRitpXec39vPwbmWnEAQIEX/xh5c+mlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199018)(6486002)(2906002)(15650500001)(83380400001)(82960400001)(36756003)(1076003)(26005)(6506007)(5660300002)(8936002)(186003)(86362001)(450100002)(41300700001)(66556008)(4326008)(8676002)(66946007)(66476007)(6862004)(6512007)(478600001)(9686003)(38100700002)(316002)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7FohDk4/ED+arZhHLo2P/0GRzl2Qc/GIUG89Ew5mNlKtZu9S/YXEWNdO6u?=
 =?iso-8859-1?Q?ekquI4j2ZD2IVB1GeTdUPt7MtD+oSXGdgdbE5Mpi71cHAUsJd56fiMTRYg?=
 =?iso-8859-1?Q?vPzhzIXkXxBJqa7iTZ0qOjjhK88+i8hJHBxykoYJVxj9/3vMNHQ0/pM3CO?=
 =?iso-8859-1?Q?sAjGHgTaBIJZqzp3y+39J0VHkFp+ILdaDEphZ0BKhQdN6iwN2pY+AnGlWo?=
 =?iso-8859-1?Q?/1DnRhzX932U+SiFZI1aWjsAHcQQr/E6S1l94tcOF2ryS0Dp/wl4uYDcXT?=
 =?iso-8859-1?Q?sxl9+YHO75HUuPtGq1YX76eSHBqvvNGgEbStbR8afQbecsSlSPSGdNSnLu?=
 =?iso-8859-1?Q?+VXErC1gIbB3TGSsr+SS18z7WPlldIw/kDxQvEE8BSWgtCZfQwSCA8jzzA?=
 =?iso-8859-1?Q?jG5lXFiCqqH6UGsFk4iKD26apMUqQPZClkcIlXgTy2nO95Pa78ChMiAJxT?=
 =?iso-8859-1?Q?tHTYg+XUakAGsVTSKus5H9vE0DBTHwJDoGkiz+tQhxUAPHrNSFHqh7dtPQ?=
 =?iso-8859-1?Q?hO+1UzqNVAsVw3S3ZerpQtzuTSQZjawjeEdfZoqYcVe5P+x+8dIosxBT9a?=
 =?iso-8859-1?Q?tj6FbXaDJXklzdT0eqhn6PLqBBK/EcvEKrqWArPFZcZyEY9iGgzUZXDUIv?=
 =?iso-8859-1?Q?Jyp8bW+RvuzeKkGODwYftLeFXDQNdw8bBmYN7Sle3WebrUf/U4PbqmaAOW?=
 =?iso-8859-1?Q?oqmie5kqR3hwQhspxTaWtHMT9Ey/F3E0exwTEicWAxxNCxl7BrGBXJ5TT5?=
 =?iso-8859-1?Q?bWiO0iVFG0jj1fZpVKaPqI6qabgyXYfpOqLQjGIBZg1czRJC7S9KpwMsM9?=
 =?iso-8859-1?Q?fsqdVLwjO6RO2J5R/r91LmxyhG238r+oQNcTQzZzavXXWHxVBKAbKTCKea?=
 =?iso-8859-1?Q?tPaQvZxEZsBqMPjcbikE6SaatJHkaFFA5ugT5qPTfUyNgZbwdkDmuLb/Aa?=
 =?iso-8859-1?Q?JJi56UF6tpx2f7OuYd6feHzVB+s6wEiirXZtwQpKIZSGYY7wVCo5EAi5v8?=
 =?iso-8859-1?Q?iZXJPquz7wsPVkPBqDq21vglyRO1f2sGm16KJbP2MTxLgewH1Ic+CyQqTp?=
 =?iso-8859-1?Q?dfo4jzLFGYIwCbLRaasMkKnIkZXaI67SPyEpRAtOTMoqCkBOjVHRMVql2v?=
 =?iso-8859-1?Q?f4JVr7II9S9VT0dP4H4CN47ksoCYbyb/ZCEDHwiWBDCH9ru4AKRFecnvBB?=
 =?iso-8859-1?Q?oAUx45ZA4+woFopEzeark1RdQsYDXZImNhq1UNmvDVqsQ5NDc1b6CiMbg9?=
 =?iso-8859-1?Q?+9Xz9mfUsSKWGIq0ecHjJ1yCWDC0ozUBkv7XkZlO5pwl4KzYQDimz+8eFp?=
 =?iso-8859-1?Q?3eN4hHRzmBX/4F0BPuBeBoYlx1cvf6v9l91lSX1lgvXCtIpEOEOgb+pxZq?=
 =?iso-8859-1?Q?/2/YgxbTATgDuhvDbOKpOIdHgfp8llsNHgXrtJA5LORXt2hgtmP2wToAet?=
 =?iso-8859-1?Q?G2xq7rfqC7b0AU/HipZOqPUQuGCpQTgWV9GvMhKC86TpphEo7AD/VpGtCf?=
 =?iso-8859-1?Q?HXQCOX7gN/sR47gSZNLAZRfZmgJM3ekc9kFBwcqjTRGFmq5QtbJ+LFQ7uG?=
 =?iso-8859-1?Q?10GQCxE9gE4Wc84CQEC7ZjAxxdzKdjs+mTdcixBOLeSISu5pXciZeeCq32?=
 =?iso-8859-1?Q?Lo8XLVfxu6cl4x+ueuGECmtkNigwkE+TOfdbYaychABJga7pgu7CF/8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e616c2b8-7a70-4e62-922e-08db23e33517
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:51:36.1466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHPso7Jxn8gxQkxZ5S2qoeco4wThF3Wr19p3x4ns5czF53cBBkMXQUJIQMcDThoZb39eV6uzmnwT6jON8h1UKXb2KUZo+qdPnMMCnlh0N3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+dri-devel

On Mon, Mar 13, 2023 at 09:03:56AM +0100, Michal Wajdeczko wrote:
>While debugging GT related problems, it's good to know which GT was
>reporting problems. Introduce helper macros to allow prefix GT logs
>with GT idetifier. We will use them in upcoming patches.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>---
> drivers/gpu/drm/xe/xe_gt_printk.h | 45 +++++++++++++++++++++++++++++++
> 1 file changed, 45 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_gt_printk.h
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_printk.h b/drivers/gpu/drm/xe/xe_gt_printk.h
>new file mode 100644
>index 000000000000..b12a92024126
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_gt_printk.h
>@@ -0,0 +1,45 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef _XE_GT_PRINTK_H_
>+#define _XE_GT_PRINTK_H_
>+
>+#include <drm/drm_print.h>

missing blank line

>+#include "xe_gt_types.h"
>+
>+#define gt_printk(_gt, _level, _fmt, ...) \

any exposed interface in headers should have xe_
prefix.

I myself find it odd to have these macros that are wrappers over
wrappers and create a silo with xe-speficic debugging macros.
The DRM ones at least are shared across drivers.  The pr_dbg(), just
reusing a local define is nice as it's still the same call used
everywhere... but it wouldn't work very well here as we need the extra
parm.

I won't oppose them though since a lot of people seem to like the
approach to help their debug and i915 went through similar discussion.

Lucas De Marchi

>+	drm_##_level(&(_gt)->xe->drm, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>+
>+#define gt_err(_gt, _fmt, ...) \
>+	gt_printk((_gt), err, _fmt, ##__VA_ARGS__)
>+
>+#define gt_warn(_gt, _fmt, ...) \
>+	gt_printk((_gt), warn, _fmt, ##__VA_ARGS__)
>+
>+#define gt_notice(_gt, _fmt, ...) \
>+	gt_printk((_gt), notice, _fmt, ##__VA_ARGS__)
>+
>+#define gt_info(_gt, _fmt, ...) \
>+	gt_printk((_gt), info, _fmt, ##__VA_ARGS__)
>+
>+#define gt_dbg(_gt, _fmt, ...) \
>+	gt_printk((_gt), dbg, _fmt, ##__VA_ARGS__)
>+
>+#define gt_err_ratelimited(_gt, _fmt, ...) \
>+	gt_printk((_gt), err_ratelimited, _fmt, ##__VA_ARGS__)
>+
>+#define gt_WARN(_gt, _condition, _fmt, ...) \
>+	drm_WARN(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>+
>+#define gt_WARN_ONCE(_gt, _condition, _fmt, ...) \
>+	drm_WARN_ONCE(&(_gt)->xe->drm, _condition, "GT%u: " _fmt, (_gt)->info.id, ##__VA_ARGS__)
>+
>+#define gt_WARN_ON(_gt, _condition) \
>+	gt_WARN((_gt), _condition, "%s(%s)", "gt_WARN_ON", __stringify(_condition))
>+
>+#define gt_WARN_ON_ONCE(_gt, _condition) \
>+	gt_WARN_ONCE((_gt), _condition, "%s(%s)", "gt_WARN_ON_ONCE", __stringify(_condition))
>+
>+#endif
>-- 
>2.25.1
>
