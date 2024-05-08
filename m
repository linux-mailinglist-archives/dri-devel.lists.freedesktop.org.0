Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15798C0530
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:40:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED91B1131B8;
	Wed,  8 May 2024 19:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eZOuGj7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABF91131B8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715197236; x=1746733236;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=MtyO2qCBoOSiPz+MoUNpgteuinTXyO0qFdIl3BkxMsE=;
 b=eZOuGj7RchuJDqcjNyCtVxrhmk4XI7ypdyyzvJfH4DMWdzwtKUfw1/0h
 pW1Lr/T/M4NtHppd5CZo0uedarr9CXzuwMSfsLiNKFj0cJEjdCfKPMq14
 HvsWtToU2/aGvUQs5TVY4AB1BGbWt3fMmbfW9U5hjEWygBvCb4n8rpaCW
 59GVj5YVPLFBTgvYzbmrwqBu2djKD4yLZi3e2nHz2JI/YrvlsThVDP73u
 UBptN5eItdJzMKE78Fdv+bnGYKnyUUhG0foRrPC/OcPeuWwKSW5spPseq
 GRcuwHoli5jIsi6O+d6R7Kq1s4Po/MHyWnVKTTa+8C2UOununX38cDx9F A==;
X-CSE-ConnectionGUID: xWPk0PNjQK2LDV4Gw9XchA==
X-CSE-MsgGUID: PpPQAFZASwCazdMBwnInmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11210253"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11210253"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 12:40:35 -0700
X-CSE-ConnectionGUID: M3ZgaXvcSLKNVwlYkuAghA==
X-CSE-MsgGUID: IKpoq91KRraEoEavmkDAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="28935962"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 08 May 2024 12:40:32 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 08 May 2024 22:40:32 +0300
Date: Wed, 8 May 2024 22:40:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 00/21] drm: Increase COMPILE_TEST=y coverage
Message-ID: <ZjvVMM0Gujq47DJt@intel.com>
References: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240408170426.9285-1-ville.syrjala@linux.intel.com>
X-Patchwork-Hint: comment
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

On Mon, Apr 08, 2024 at 08:04:05PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I got fed up having to build multiple architectures when
> doing subsystem wide refactoring. So I decided to attack
> the low hanging COMPILE_TEST=y fruit. Here are the
> results. All of these drivers now build with COMPILE_TEST=y
> on x86/x86_64
> 
> Ville Syrjälä (21):
>   drm/hisilicon/kirin: Include linux/io.h for readl()/writel()
>   drm/hisilicon/kirin: Fix 64bit divisions
>   drm/hisilicon/kirin: Fix MASK(32) on 32bit architectures
>   drm/hisilicon/kirin: Allow build with COMPILE_TEST=y
>   drm/omap: Open code phys_to_page()
>   drm/omap: Allow build with COMPILE_TEST=y
>   drm/atmel-hlcdc: Allow build with COMPILE_TEST=y
>   drm/rcar-du: Allow build with COMPILE_TEST=y
>   drm/stm: Allow build with COMPILE_TEST=y

^ pushed to drm-misc-next. Thanks for the reviews.

>   drm/armada: Fix printk arguments
>   drm/armada: Fix armada_debugfs_crtc_reg_write() return type
>   drm/armada: Allow build with COMPILE_TEST=y
>   drm/imx/dcss: Fix 64bit divisions
>   drm/imx/dcss: Allow build with COMPILE_TEST=y
>   drm/sti: Include linux/io.h for devm_ioremap()
>   drm/sti: Allow build with COMPILE_TEST=y
>   drm/fsl-dcu: Allow build with COMPILE_TEST=y
>   drm/mediatek: Allow build with COMPILE_TEST=y
>   drm/meson: Allow build with COMPILE_TEST=y

^ are all still without comments.

>   drm/tilcdc: Allow build without __iowmb()
>   drm/tilcdc: Allow build with COMPILE_TEST=y

^ I need to respin.

-- 
Ville Syrjälä
Intel
