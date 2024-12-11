Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679749EDB22
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 00:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2243710EC6F;
	Wed, 11 Dec 2024 23:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLVkfZRV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5986810EC63;
 Wed, 11 Dec 2024 23:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733959676; x=1765495676;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=xZRupLihwCpuOfsxbPca2qZedXnCHPBPa/oehqwQoSw=;
 b=KLVkfZRV2rE70eQgwlmfPbh9tZZwe0CGTwW0WwvsdxTOumUhQGDDSbMS
 Ksa7PiFm6Gry+dfIOHMEwYXRE1G9ui0Kx5/itnA1BAI2fRCJ2l10vS9pH
 uv5AXQauZo4UojQy5jA9FUu7knzuK5QdQsIYtbYmmbcGZXCV9brmh9V6b
 XZLPDSTm8fT3NPtMql32HDZi+RzHKzP+XyFhvUK8DO+b88+rLS5pkOvX2
 OownTfBNRunTWxaeB29bQhPSwA9zc/nAIqYq0WL6K73aKPAIunizdgfCV
 tu+k6o6C7ELVYCJC+UHhZmDe066/oPEKKGSEnc1DWh0r4WsJcC7QyKPXa Q==;
X-CSE-ConnectionGUID: RBoFrqqkT9SGAm3KP4Ta/w==
X-CSE-MsgGUID: Z/ytMGNeTleYoEfoQDVIqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38293176"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38293176"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 15:27:54 -0800
X-CSE-ConnectionGUID: O7lfhaUbRSaU/XHwDgKB6g==
X-CSE-MsgGUID: xHnJoC90SoaIfF3/CscX8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="100839852"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2024 15:27:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Dec 2024 15:27:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Dec 2024 15:27:52 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Dec 2024 15:27:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qwe/sGhTXz/rlU+9O/odo05vTI4BKcSiCdZja6jV2+HlK/34aPudG8QRuyrYb8kwXJheZ64Z8PVpHFVARh53mFDXZwPXiF1dAQc81dVrRoa5McXZm1/V1vGVpVYjg04VjQAVVInW1g6642P0jWP9WYysdpYKsaFUeFka3vunJik7/WVF+wFQvWZEOYhKiBxSmJUcJcHHe3+HFPjBYDZmcOkxus9EPlhHjbDdYNFD5mAVU2KAzuH/VBj0bSt+10lxcDdjP8wlHtVAn9cuazCfgHGxDMBSbbaBp+uAog9iF5qMYx5vsJP/O4ycu/7mD7XX1ZX4Tfd0RHqzYMv8J/vnHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5Io0PYnRI2kpZxpflvhLyAUHYmFoWm4vSVXA+ARcPU=;
 b=vvReFHGquHUqsad7JHVSAeK9wh/D/7sYFXPpNF2VDQ2cl1JkiXqWGGlX5SnlgVP8pbSqjeFuJPQ4PpH36hpAkX0BCsRQ8Lm7SuB64Igz3vY1UUXmWEWCRXn6JAhGobkbs2ILp8hDuZ7eoNCqExGM0sQtdfk74hYD1b8JkurWNiIx58eNhij+4o6jKIygF70TIpzQFvMEvnUryYwLDbN0i8TtCXORbGa5//gNhplnDAMmHT4Wpwfg1oYPn5IYIeis4K2ZSZJcppSTnnk2Vz3oitzD8gY0B7YJGcV/jtJSI6x+4wZ9GlFo3s2iFXnQSXY/pxUhk8diFUqebS0S2wpN6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 23:27:08 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 23:27:08 +0000
Date: Wed, 11 Dec 2024 18:27:03 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Oded Gabbay <ogabbay@kernel.org>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dim-tools@lists.freedesktop.org>
Subject: [PULL] drm-xe-next
Message-ID: <Z1ofx-fExLQKV_e4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0239.namprd03.prod.outlook.com
 (2603:10b6:303:b9::34) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a9f77ca-03a0-4ae7-cdd2-08dd1a3b547e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AowFHDfxYnWC92IwyXyTPhmw6yfS/wIeJu2nZUDEu6+fEb3Uvg4vFhBDnx?=
 =?iso-8859-1?Q?DsK3DfI9+dznKoxej97Ak5SWh8Vn9FsNK+Qnpeyh3Msrbqzy7FDlLEIlCb?=
 =?iso-8859-1?Q?2V0+2t1E2OfLm5OxaLECXW285Ub17xdTX43yND6z/7UzRCnh3G0AZxcSxc?=
 =?iso-8859-1?Q?NGNH965FZFeFnJT0G9jBPKvK+vHxTEWSbOyMf7Mz8Y3JoxCObWkQynsxuw?=
 =?iso-8859-1?Q?FJHyn9huxPp2E+DUd8bhh577DvSs9xIVgxxrIGQZzlEYH0t+uSZZxs3WSA?=
 =?iso-8859-1?Q?tYMUI+FLJBan/8jgVI6p3TB7CINgch4Sf0AOEvFSZdgFQXRmKvA+ISNh5R?=
 =?iso-8859-1?Q?lD1KYU6Msg3eSPsFseiDDqaj3frP1sf5HRNAkguhzc/EWn2NI5tIGuMtPj?=
 =?iso-8859-1?Q?v4QNuPzGZ4S0LP3mzT7ryoTWEX9L+xlOtb3KmitZhw+IBcxKHba1CtKB4l?=
 =?iso-8859-1?Q?blpUj2kYCCP35k0xzz4CI3s0z3sAY4bV2RHBQV2hLU/Nq73IRqD2kZzswp?=
 =?iso-8859-1?Q?S9nw6KMwjIwTKZASiL7VOMI4HXGygDWKSWBHbSclemrYLk9sZVXayiI/sz?=
 =?iso-8859-1?Q?nAeRX1wOSzme7ZLoMBt/aDRTi9BeCYU7S7LI4ck2w+wfI34sxuc6If8aEC?=
 =?iso-8859-1?Q?dCDh6n5U7t4s5zVedhFSEr+kCnKhntKd5mKIQW/008uyqev16F+HfsDfyb?=
 =?iso-8859-1?Q?Tl+2kxJnGqPriWQ8iTfp6akekq86cMZvSfi1KxQa/a2S1YmiEbc944HAcd?=
 =?iso-8859-1?Q?RFfLEAsXPe5No7CtjJoDDqJ2t46u7dBUEZoxGX5SLIH27qVwrq6n7j5Pt+?=
 =?iso-8859-1?Q?GDm4FyAYzZT95lwsrwyoV2D8gqdY3kNznttVlXMFBuoj11mAZKM9h+xPll?=
 =?iso-8859-1?Q?k2289pJ87b2rqQxnhCprFgap1lzaSfrxPOHo8N+sSFIK4ek2DaFfmFsuX6?=
 =?iso-8859-1?Q?5Lre9w3IgS36H/0RXxTJYeTt6utHytiQRyRBax39W96tumFKAf1VA7hA7W?=
 =?iso-8859-1?Q?tOwkBnTEDw3Q5T2Wcf2fzIJKloo9w2ukYicLD6qOYfR5a88JGKUCkEuu9I?=
 =?iso-8859-1?Q?5YoNMd+8YVS1QoxO6+fh5VtB6h4MCsMYLoHYaQ0re2/qcvhN/2bn6BTy6x?=
 =?iso-8859-1?Q?Zoeg0o5J5FuueGfk8eqEgIYbqcJ0E0uHgxGWmSBP0jH1StmHAoKHyVF4QY?=
 =?iso-8859-1?Q?UKgB9FxTclb1mSpVr3vG3By8aAoh6SO/femDK72bdaljOLVa/GyrbtRWC7?=
 =?iso-8859-1?Q?4I6Y1zMYJGbcoDIYy/5lQr6Ty48Lqi5ae5hL5gb90qe2t1A8pz226HCd9K?=
 =?iso-8859-1?Q?YoRCuvyVhUN9f6n7yGg8T+5/eWMNmPuQO1/EnQ5SyzbhiTw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?JornahECFs1pjMo9bwqWb4dlyQG1Q95qiK1qdxO5xEGSZaiuiwuM5+T5tZ?=
 =?iso-8859-1?Q?zHhWBVYrMslVYDhjaKia+f6nzIOZ0N9HrObKy7SxMdX92QuBpLic+PDgIC?=
 =?iso-8859-1?Q?b0bKPK1/kVdc6m1WSsrphVA4JCKSWkq+T9KvYPAhIYp0aBXhyA+uX8Dp9e?=
 =?iso-8859-1?Q?6jIEfpF6yVLn6aOZakq90RqppyRkKvEdCoUm/mFbc4gKCtE+9FTrbpkLKX?=
 =?iso-8859-1?Q?SEzxPxGPUlsL3Tlg9SLYw9exXcuH3q8K0KsElc+0YPggIGGtfnZGj4iIPF?=
 =?iso-8859-1?Q?zcW9+JbCipoIf1VXD6Tn7bDKEGA80Xx7Qe9ZJHzitWDKPQbWqGlW5eqwEQ?=
 =?iso-8859-1?Q?S4zoz8LwYUdyqH7ZnNZhQpChHnkvg7MQTA6p2hjLTVdjHuOk1S5m/6gtlG?=
 =?iso-8859-1?Q?J/s15uizeEQY3HkAnYK1uthaqdl+GauS48bAZxhbyjvzKcrZZ/MEKgGrUj?=
 =?iso-8859-1?Q?aueReflyuX6NLVi5nT2KcAnL8OCdCigrraTow/8Krwti7uYJ8qisXfZsF6?=
 =?iso-8859-1?Q?pMpaidXO3kENMyKjs1yZ5T0f7pJ8YtyXpxceiMN52RI5TMCSlo2f6A3Q2+?=
 =?iso-8859-1?Q?LvUND/cx7kdLRpopw1ZhGFMMXwk1DyIyScK/SYroL/Hy3zayath4HkKeDL?=
 =?iso-8859-1?Q?Ha/q174A8S5jxK4ijktnpsb7YwvTLwhLyQvaz3TfKbHSebpWUQHU/fwUpk?=
 =?iso-8859-1?Q?NkyLfzj4yg6e3OQ1jYmHeR2ow5sbaUaWBqc3ugPdD+jp1bP+jhj2M2gPF1?=
 =?iso-8859-1?Q?QuCtrmKdJKl4uMtC5Noj+4PYQbCJuyWNTy1JZaD/oM+nfuwNm4IZEl6dX2?=
 =?iso-8859-1?Q?v/02edkVCrKAA5KI2NLxYbdH6zTOcp60GYfYjiElAK/LmBO+nLCeoivf3w?=
 =?iso-8859-1?Q?suoHeFmKY1+wmXIMeLTR/7f1qLUk6yhTQFgYJjb9TPcSjuFlc8MbHDiM54?=
 =?iso-8859-1?Q?d3ydrah9r5yYEjVvgSP22+iPjatiSsma7gXw2HhsFuMVHl/BIfmkm2srSx?=
 =?iso-8859-1?Q?NPqGt44UJTplHTtyfcf5Gu8HcsZp81Ap6Hbx55mwsATflvmjAUwZ6xqHOH?=
 =?iso-8859-1?Q?1IkNKzdCyIvzgn+9FcB7v41NKMKDXwzczg0p+vwhxtGI3SRzKUEjptXgSC?=
 =?iso-8859-1?Q?59rX5Vhnyt8KA7CigCu9fntCcD9kLnI7Wu/UDwvOPwuTlaOpVxOKzTGJhh?=
 =?iso-8859-1?Q?IBPIE+PyyGcn8hn/VqwOwJc72wqb085ZJMidZ/Y1C7LKuzD0fdyDJ6yE78?=
 =?iso-8859-1?Q?SQ5LyQZDx2X5O+xVbMQXyLcOEQVm8YLecUbgEksw1grvQikOCnV6tG3SS8?=
 =?iso-8859-1?Q?iOedvcaeKB6AC1KPwzM1VceglhLdVgvYsOSpHG7p6qn0rFMc9/poujPAdO?=
 =?iso-8859-1?Q?xqGF6h4nIjXgs3+HR9yn53V5l3fRTD/5NIyCebvTtqog77nfFiKv4NUJx3?=
 =?iso-8859-1?Q?Rn3J9Bvdr0zSrD07yXy0kmkDDHtf3rX/HNwyJVnPJhMAro44jEMuG2uW/S?=
 =?iso-8859-1?Q?xmSHXD+T/65Nefp/HdfIy7A8DPo+9ggh6cxJbpHCtWO2e4xENe6H7WfVdQ?=
 =?iso-8859-1?Q?RgFrpEdPwvWOwzrwGE5i9kB0XE3lFoy9awzydaY08RS+BQ2TlKGPUtrnHx?=
 =?iso-8859-1?Q?usugbe9AXpPE/0wfGhpy43XkL2zYTYWjijjDABIznZrQdshXZpTw3/cw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9f77ca-03a0-4ae7-cdd2-08dd1a3b547e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 23:27:08.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YDd05/K7+gp8shkIPmx+jbF0lh+NprwNPGkBClqBgOn2LjFqH4GwKQH1JKl4EGvcTL6VAEmq41Pv8OWKg1hgEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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

Hi Dave and Sima,

Here goes our first Xe PR towards 6.14.

It's important to highlight that in couple backmerges we had to
manually solve some silent conflicts:

1. Namespace conflict issue caused by
commit cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
and commit 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices"):

- MODULE_IMPORT_NS(INTEL_VSEC);
+ MODULE_IMPORT_NS("INTEL_VSEC");

2. Duplication of a flush work chunk. In this case here the solution
was taken as an extra patch on top of the merge:
commit be15f0bc4a95 ("drm/xe: Fix drm-next merge")

I hope this is okay and that those are transparent to you when merging.
Otherwise please let me know if we need to change some of the history here.

Thanks,
Rodrigo.

drm-xe-next-2024-12-11:
UAPI Changes:
 - Make OA buffer size configurable (Sai)

Display Changes (including i915):
 - Fix ttm_bo_access() usage (Auld)
 - Power request asserting/deasserting for Xe3lpd (Mika)
 - One Type-C conversion towards struct intel_display (Mika)

Driver Changes:
 - GuC capture related fixes (Everest, Zhanjun)
 - Move old workaround to OOB infra (Lucas)
 - Compute mode change refactoring (Bala)
 - Add ufence and g2h flushes for LNL Hybrid timeouts (Nirmoy)
 - Avoid unnecessary OOM kills (Thomas)
 - Restore system memory GGTT mappings (Brost)
 - Fix build error for XE_IOCTL_DBG macro (Gyeyoung)
 - Documentation updates and fixes (Lucas, Randy)
 - A few exec IOCTL fixes (Brost)
 - Fix potential GGTT allocation leak (Michal)
 - Fix races on fdinfo (Lucas)
 - SRIOV VF: Post-migration recovery worker basis (Tomasz)
 - GuC Communication fixes and improvements (Michal, John, Tomasz, Auld, Jonathan)
 - SRIOV PF: Add support for VF scheduling priority
 - Trace improvements (Lucas, Auld, Oak)
 - Hibernation on igpu fixes and improvements (Auld)
 - GT oriented logs/asserts improvements (Michal)
 - Take job list lock in xe_sched_first_pending_job (Nirmoy)
 - GSC: Improve SW proxy error checking and logging (Daniele)
 - GuC crash notifications & drop default log verbosity (John)
 - Fix races on fdinfo (Lucas)
 - Fix runtime_pm handling in OA (Ashutosh)
 - Allow fault injection in vm create and vm bind IOCTLs (Francois)
 - TLB invalidation fixes (Nirmoy, Daniele)
 - Devcoredump Improvements, doc and fixes (Brost, Lucas, Zhanjun, John)
 - Wake up waiters after setting ufence->signalled (Nirmoy)
 - Mark preempt fence workqueue as reclaim (Brost)
 - Trivial header/flags cleanups (Lucas)
 - VRAM drop 2G block restriction (Auld)
 - Drop useless d3cold allowed message (Brost)
 - SRIOV PF: Drop 2GiB limit of fair LMEM allocation (Michal)
 - Add another PTL PCI ID (Atwood)
 - Allow bo mapping on multiple ggtts (Niranjana)
 - Add support for GuC-to-GuC communication (John)
 - Update xe2_graphics name string (Roper)
 - VRAM: fix lpfn check (Auld)
 - Ad Xe3 workaround (Apoorva)
 - Migrate fixes (Auld)
 - Fix non-contiguous VRAM BO access (Brost)
 - Log throttle reasons (Raag)
 - Enable PMT support for BMG (Michael)
 - IRQ related fixes and improvements (Ilia)
 - Avoid evicting object of the same vm in none fault mode (Oak)
 - Fix in tests (Nirmoy)
 - Fix ERR_PTR handling (Mirsad)
 - Some reg_sr/whitelist fixes and refactors (Lucas)
The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/xe/kernel.git tags/drm-xe-next-2024-12-11

for you to fetch changes up to 4d79a1266d4cc3c967bc8823502466cad1ac8514:

  drm/xe: Make irq enabled flag atomic (2024-12-11 13:20:53 -0500)

----------------------------------------------------------------
UAPI Changes:
 - Make OA buffer size configurable (Sai)

Display Changes (including i915):
 - Fix ttm_bo_access() usage (Auld)
 - Power request asserting/deasserting for Xe3lpd (Mika)
 - One Type-C conversion towards struct intel_display (Mika)

Driver Changes:
 - GuC capture related fixes (Everest, Zhanjun)
 - Move old workaround to OOB infra (Lucas)
 - Compute mode change refactoring (Bala)
 - Add ufence and g2h flushes for LNL Hybrid timeouts (Nirmoy)
 - Avoid unnecessary OOM kills (Thomas)
 - Restore system memory GGTT mappings (Brost)
 - Fix build error for XE_IOCTL_DBG macro (Gyeyoung)
 - Documentation updates and fixes (Lucas, Randy)
 - A few exec IOCTL fixes (Brost)
 - Fix potential GGTT allocation leak (Michal)
 - Fix races on fdinfo (Lucas)
 - SRIOV VF: Post-migration recovery worker basis (Tomasz)
 - GuC Communication fixes and improvements (Michal, John, Tomasz, Auld, Jonathan)
 - SRIOV PF: Add support for VF scheduling priority
 - Trace improvements (Lucas, Auld, Oak)
 - Hibernation on igpu fixes and improvements (Auld)
 - GT oriented logs/asserts improvements (Michal)
 - Take job list lock in xe_sched_first_pending_job (Nirmoy)
 - GSC: Improve SW proxy error checking and logging (Daniele)
 - GuC crash notifications & drop default log verbosity (John)
 - Fix races on fdinfo (Lucas)
 - Fix runtime_pm handling in OA (Ashutosh)
 - Allow fault injection in vm create and vm bind IOCTLs (Francois)
 - TLB invalidation fixes (Nirmoy, Daniele)
 - Devcoredump Improvements, doc and fixes (Brost, Lucas, Zhanjun, John)
 - Wake up waiters after setting ufence->signalled (Nirmoy)
 - Mark preempt fence workqueue as reclaim (Brost)
 - Trivial header/flags cleanups (Lucas)
 - VRAM drop 2G block restriction (Auld)
 - Drop useless d3cold allowed message (Brost)
 - SRIOV PF: Drop 2GiB limit of fair LMEM allocation (Michal)
 - Add another PTL PCI ID (Atwood)
 - Allow bo mapping on multiple ggtts (Niranjana)
 - Add support for GuC-to-GuC communication (John)
 - Update xe2_graphics name string (Roper)
 - VRAM: fix lpfn check (Auld)
 - Ad Xe3 workaround (Apoorva)
 - Migrate fixes (Auld)
 - Fix non-contiguous VRAM BO access (Brost)
 - Log throttle reasons (Raag)
 - Enable PMT support for BMG (Michael)
 - IRQ related fixes and improvements (Ilia)
 - Avoid evicting object of the same vm in none fault mode (Oak)
 - Fix in tests (Nirmoy)
 - Fix ERR_PTR handling (Mirsad)
 - Some reg_sr/whitelist fixes and refactors (Lucas)

----------------------------------------------------------------
Apoorva Singh (1):
      drm/xe/xe3lpg: Add Wa_16024792527

Ashutosh Dixit (1):
      drm/xe/oa: Fix "Missing outer runtime PM protection" warning

Balasubramani Vivekanandan (2):
      drm/xe: Set mask bits for CCS_MODE register
      drm/xe: Use the filelist from drm for ccs_mode change

Daniele Ceraolo Spurio (2):
      drm/xe/gsc: Improve SW proxy error checking and logging
      drm/xe: Call invalidation_fence_fini for PT inval fences in error state

Everest K.C. (1):
      drm/xe/guc: Fix dereference before NULL check

Francois Dugast (1):
      drm/xe: Allow fault injection in vm create and vm bind IOCTLs

Gyeyoung Baek (1):
      drm/xe: Fix build error for XE_IOCTL_DBG macro

Ilia Levi (2):
      drm/xe: Use managed BO in memirq
      drm/xe: Make irq enabled flag atomic

John Harrison (7):
      drm/xe/guc: Reduce default GuC log verbosity
      drm/xe/guc: Support crash dump notification from GuC
      drm/xe/guc: Add support for G2G communications
      drm/xe: Add a reason string to the devcoredump
      drm/xe: Move the coredump registration to the worker thread
      drm/xe: Add mutex locking to devcoredump
      drm/xe/guc: Fix for dead CT dump not re-arming

Jonathan Cavitt (1):
      drm/xe/xe_guc_ads: Add nonpriv registers to write list

Lucas De Marchi (19):
      drm/xe: Move Wa 1607983814 to oob
      drm/xe: Fix drm-next merge
      drm/xe: Improve devcoredump documentation
      drm/xe: Wire up devcoredump in documentation
      drm/xe: Fix case for asserts in documentation
      drm/xe: Add trace to lrc timestamp update
      drm/xe: Stop accumulating LRC timestamp on job_free
      drm/xe: Reword exec_queue and vm lock doc
      drm/xe: Add gt_id to xe_sched_job traces
      drm/xe: Wait on killed exec queues
      drm/xe: Sample gpu timestamp closer to exec queues
      drm/xe: Include xe_oa_types.h
      drm/xe: Drop HAS_HECI_*
      drm/xe: Split xe_gt_stat.h
      drm/xe: Sort again the info flags
      drm/xe/reg_sr: Remove register pool
      drm/xe/reg_sr: Convert whitelist to gt logging
      drm/xe/reg_sr: Stop setting all whitelist slots
      drm/xe: Apply whitelist to engine save-restore

Matt Atwood (1):
      drm/xe/ptl: Add another PTL PCI ID

Matt Roper (1):
      drm/xe: Update xe2_graphics name string

Matthew Auld (10):
      drm/xe: improve hibernation on igpu
      drm/xe: handle flat ccs during hibernation on igpu
      drm/xe/vram: drop 2G block restriction
      drm/xe/vram: fix lpfn check
      drm/xe/trace: improve xe_sched_msg trace
      drm/xe/guc_submit: fix race around pending_disable
      drm/xe/guc_submit: fix race around suspend_pending
      drm/xe/migrate: fix pat index usage
      drm/xe/migrate: use XE_BO_FLAG_PAGETABLE
      drm/xe/display: fix ttm_bo_access() usage

Matthew Brost (21):
      drm/xe: Restore system memory GGTT mappings
      drm/xe: Fix possible exec queue leak in exec IOCTL
      drm/xe: Drop VM dma-resv lock on xe_sync_in_fence_get failure in exec IOCTL
      drm/xe: Ensure all locks released in exec IOCTL
      drm/xe: Add xe_ring_lrc_is_idle() helper
      drm/xe: Add ring address to LRC snapshot
      drm/xe: Add ring start to LRC snapshot
      drm/xe: Add exec queue param to devcoredump
      drm/xe: Improve schedule disable response failure
      drm/xe: Change xe_engine_snapshot_capture_for_job to be for queue
      drm/xe: Wire devcoredump to LR TDR
      drm/xe: Mark preempt fence workqueue as reclaim
      drm/xe: Drop useless d3cold allowed message
      drm/xe: Add xe_bo_vm_access
      drm/ttm: Add ttm_bo_access
      drm/xe: Add xe_ttm_access_memory
      drm/xe: Take PM ref in delayed snapshot capture worker
      drm/xe/display: Update intel_bo_read_from_page to use ttm_bo_access
      drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
      drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
      drm/xe: Only allow contiguous BOs to use xe_bo_vmap

Michael J. Ruhl (2):
      drm/xe/vsec: Support BMG devices
      drm/xe/vsec: Address static checker issue

Michal Wajdeczko (14):
      drm/xe/pf: Fix potential GGTT allocation leak
      drm/xe/guc: Log content of the failed G2H message
      drm/xe/guc: Drop redundant logs about invalid G2H length
      drm/xe/guc: Don't read data from G2H prior to length check
      drm/xe/guc: Don't treat GuC generic CAT error as protocol error
      drm/xe/guc: Add VF_CFG_SCHED_PRIORITY_KEY KLV definition
      drm/xe/guc: Add VF_CFG_SCHED_PRIORITY to KLV helper
      drm/xe/pf: Add functions to configure VF scheduling priority
      drm/xe/pf: Allow to control scheduling priority using debugfs
      drm/xe/pf: Adjust scheduling priority based on policy change
      drm/xe/guc: Prefer GT oriented asserts in submit code
      drm/xe/guc: Prefer GT oriented logs in submit code
      drm/xe/pf: Drop 2GiB limit of fair LMEM allocation
      drm/xe: Introduce xe_gt_dbg_printer()

Mika Kahola (2):
      drm/i915/xe3lpd: Power request asserting/deasserting
      drm/i915/display: Use struct intel_display instead of struct drm_i915_private

Mirsad Todorovac (1):
      drm/xe: fix the ERR_PTR() returned on failure to allocate tiny pt

Niranjana Vishwanathapura (1):
      drm/xe: Allow bo mapping on multiple ggtts

Nirmoy Das (7):
      drm/xe: Move LNL scheduling WA to xe_device.h
      drm/xe/ufence: Flush xe ordered_wq in case of ufence timeout
      drm/xe/guc/tlb: Flush g2h worker in case of tlb timeout
      drm/xe: Take job list lock in xe_sched_first_pending_job
      drm/xe: Ignore GGTT TLB inval errors during GT reset
      drm/xe/ufence: Wake up waiters after setting ufence->signalled
      drm/xe/tests: Wait for clear fence operation to complete

Oak Zeng (2):
      drm/xe: Trace xe_bo_validate
      drm/xe: Avoid evicting object of the same vm in none fault mode

Raag Jadav (1):
      drm/xe/throttle: Log throttle reasons

Randy Dunlap (1):
      drm/xe/vm_doc: fix more doc typos

Rodrigo Vivi (2):
      Merge drm/drm-next into drm-xe-next
      Merge drm/drm-next into drm-xe-next

Sai Teja Pottumuttu (1):
      drm/xe/oa/uapi: Make OA buffer size configurable

Thomas Hellström (3):
      drm/xe: Avoid the OOM killer on buffer object memory allocation
      drm/xe: Don't unnecessarily invoke the OOM killer on multiple binds
      Merge drm/drm-next into drm-xe-next

Tomasz Lis (6):
      drm/xe/vf: React to MIGRATED interrupt
      drm/xe/vf: Document SRIOV VF restore flow
      drm/xe/vf: Send RESFIX_DONE message at end of VF restore
      drm/xe/vf: Start post-migration fixups with provisioning query
      drm/xe/vf: Defer fixups if migrated twice fast
      drm/xe/guc: Do not assert CTB state while sending MMIO

Zhanjun Dong (2):
      drm/xe/guc: Remove duplicate source field
      drm/xe/guc: Fix missing init value and add register order check

 Documentation/gpu/xe/index.rst                    |   1 +
 Documentation/gpu/xe/xe_devcoredump.rst           |  14 +
 drivers/gpu/drm/i915/display/intel_cx0_phy_regs.h |   7 +
 drivers/gpu/drm/i915/display/intel_tc.c           |  39 ++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  40 ++-
 drivers/gpu/drm/xe/Makefile                       |   5 +-
 drivers/gpu/drm/xe/abi/guc_actions_abi.h          |  20 ++
 drivers/gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 +++
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h             |  14 +
 drivers/gpu/drm/xe/display/ext/i915_irq.c         |  13 +-
 drivers/gpu/drm/xe/display/intel_bo.c             |  25 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c            |  12 +-
 drivers/gpu/drm/xe/regs/xe_gt_regs.h              |   2 +
 drivers/gpu/drm/xe/regs/xe_oa_regs.h              |   9 +-
 drivers/gpu/drm/xe/regs/xe_pmt.h                  |  19 ++
 drivers/gpu/drm/xe/tests/xe_bo.c                  |   7 +
 drivers/gpu/drm/xe/tests/xe_migrate.c             |  17 +-
 drivers/gpu/drm/xe/xe_assert.h                    |   8 +-
 drivers/gpu/drm/xe/xe_bo.c                        | 182 ++++++++++--
 drivers/gpu/drm/xe/xe_bo.h                        |  33 ++-
 drivers/gpu/drm/xe/xe_bo_evict.c                  |  14 +-
 drivers/gpu/drm/xe/xe_bo_types.h                  |   5 +-
 drivers/gpu/drm/xe/xe_devcoredump.c               | 121 +++++---
 drivers/gpu/drm/xe/xe_devcoredump.h               |   7 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h         |  10 +-
 drivers/gpu/drm/xe/xe_device.c                    |   8 +
 drivers/gpu/drm/xe/xe_device_types.h              |  57 ++--
 drivers/gpu/drm/xe/xe_drm_client.c                |  80 ++++--
 drivers/gpu/drm/xe/xe_exec_queue.c                |   7 +
 drivers/gpu/drm/xe/xe_ggtt.c                      |  35 +--
 drivers/gpu/drm/xe/xe_gpu_scheduler.h             |  10 +-
 drivers/gpu/drm/xe/xe_gsc_proxy.c                 |  47 +++-
 drivers/gpu/drm/xe/xe_gt.c                        |   4 +-
 drivers/gpu/drm/xe/xe_gt_printk.h                 |  31 +++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c        |  78 +++++-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.h        |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   2 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c       |   5 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_helpers.h       |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_policy.c        |  27 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c               |  63 +++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h               |   2 +
 drivers/gpu/drm/xe/xe_gt_stats.h                  |   8 +-
 drivers/gpu/drm/xe/xe_gt_stats_types.h            |  15 +
 drivers/gpu/drm/xe/xe_gt_throttle.c               |   2 +
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c       |  21 +-
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_types.h                  |   4 +-
 drivers/gpu/drm/xe/xe_guc.c                       | 320 +++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_ads.c                   |  11 +-
 drivers/gpu/drm/xe/xe_guc_capture.c               |  33 +--
 drivers/gpu/drm/xe/xe_guc_capture.h               |   6 +-
 drivers/gpu/drm/xe/xe_guc_ct.c                    |  32 ++-
 drivers/gpu/drm/xe/xe_guc_fwif.h                  |   1 +
 drivers/gpu/drm/xe/xe_guc_klv_helpers.c           |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c                | 151 +++++-----
 drivers/gpu/drm/xe/xe_guc_types.h                 |  10 +
 drivers/gpu/drm/xe/xe_heci_gsc.c                  |   8 +-
 drivers/gpu/drm/xe/xe_hw_engine.c                 |  11 +-
 drivers/gpu/drm/xe/xe_hw_engine.h                 |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h           |   2 -
 drivers/gpu/drm/xe/xe_irq.c                       |  37 +--
 drivers/gpu/drm/xe/xe_lrc.c                       |  29 ++
 drivers/gpu/drm/xe/xe_lrc.h                       |   4 +
 drivers/gpu/drm/xe/xe_macros.h                    |  12 +-
 drivers/gpu/drm/xe/xe_memirq.c                    |  26 +-
 drivers/gpu/drm/xe/xe_module.c                    |   2 +-
 drivers/gpu/drm/xe/xe_oa.c                        |  55 +++-
 drivers/gpu/drm/xe/xe_oa_types.h                  |   2 +-
 drivers/gpu/drm/xe/xe_pm.c                        |   3 -
 drivers/gpu/drm/xe/xe_pt.c                        |   6 +-
 drivers/gpu/drm/xe/xe_query.c                     |   4 +-
 drivers/gpu/drm/xe/xe_reg_sr.c                    |  84 +-----
 drivers/gpu/drm/xe/xe_reg_sr_types.h              |   6 -
 drivers/gpu/drm/xe/xe_reg_whitelist.c             |  37 +++
 drivers/gpu/drm/xe/xe_sriov.c                     |   4 +
 drivers/gpu/drm/xe/xe_sriov_pf_helpers.h          |   2 +-
 drivers/gpu/drm/xe/xe_sriov_types.h               |  17 ++
 drivers/gpu/drm/xe/xe_sriov_vf.c                  | 263 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_sriov_vf.h                  |  14 +
 drivers/gpu/drm/xe/xe_trace.h                     |  11 +-
 drivers/gpu/drm/xe/xe_trace_bo.h                  |   5 +
 drivers/gpu/drm/xe/xe_trace_lrc.c                 |   9 +
 drivers/gpu/drm/xe/xe_trace_lrc.h                 |  52 ++++
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c              |  53 +---
 drivers/gpu/drm/xe/xe_vm.c                        |  32 +--
 drivers/gpu/drm/xe/xe_vm_doc.h                    |  22 +-
 drivers/gpu/drm/xe/xe_vsec.c                      | 233 ++++++++++++++++
 drivers/gpu/drm/xe/xe_vsec.h                      |  11 +
 drivers/gpu/drm/xe/xe_wa.c                        |   6 +
 drivers/gpu/drm/xe/xe_wa_oob.rules                |   1 +
 include/drm/intel/xe_pciids.h                     | 235 ++++++++++++++++
 include/drm/ttm/ttm_bo.h                          |   2 +
 include/uapi/drm/xe_drm.h                         |   9 +
 94 files changed, 2463 insertions(+), 590 deletions(-)
 create mode 100644 Documentation/gpu/xe/xe_devcoredump.rst
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pmt.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_stats_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.c
 create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf.h
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.c
 create mode 100644 drivers/gpu/drm/xe/xe_trace_lrc.h
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
 create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
 create mode 100644 include/drm/intel/xe_pciids.h
