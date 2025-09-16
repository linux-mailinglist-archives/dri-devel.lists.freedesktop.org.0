Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D822DB595AD
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 14:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8F410E651;
	Tue, 16 Sep 2025 12:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TnyyZus+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B2710E646;
 Tue, 16 Sep 2025 12:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758024227; x=1789560227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OAWqw+Ec0VOYKbI2esBa1lt+zJjfo9ex0oj2tgwkqYg=;
 b=TnyyZus+c2GeT2GyYVQ2NXVkitzLRogFyemOyswNYTXe367JjIq/+USR
 2Sj+DM3siZSVr2s6x5FR8e9JKs8+uj4KPaYaVQ0jfcfnj0D3JmUqzyC90
 CxlXzNZS/IUISaWN2zWSqs/bq5mhPHO5ev6ACWoHGEQTWFBGqIcvxYSDi
 +VXOfpEglZnlXry+aq0N7JSoO36TQevRH3PTHqomEy0j+ui5ixzioKG1p
 TNBeUwJZWMKKFJ2N/Fcht7nSUncnqp8ZCIy+zQEBKUzLcD3a200ctdWKN
 q7UNBtCqnjDOPN4jbqWY4xjXme54LGEAKfTDj6aaS7ejyDpOtBFgNYRyK g==;
X-CSE-ConnectionGUID: F4oh6QasRJKO6blD/Di74w==
X-CSE-MsgGUID: 5lnvHSpaSa+lSTy5V7KOuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="62938270"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="62938270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 05:03:47 -0700
X-CSE-ConnectionGUID: 9Uzij7cLTru7DrNlqszHiw==
X-CSE-MsgGUID: PnSOHptDRpOyUghGwreAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="174729929"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:03:43 -0700
Date: Tue, 16 Sep 2025 14:03:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com, aliceryhl@google.com,
 jeffv@google.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 1/3] lib: add support for opening Panthor devices
Message-ID: <20250916120340.rmhsnpixqcznex2n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 adrinael@adrinael.net, arek@hiler.eu, juhapekka.heikkila@gmail.com,
 bhanuprakash.modem@gmail.com, ashutosh.dixit@intel.com,
 karthik.b.s@intel.com, boris.brezillon@collabora.com,
 liviu.dudau@arm.com, steven.price@arm.com, aliceryhl@google.com,
 jeffv@google.com, intel-gfx@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250912181931.3738444-1-daniel.almeida@collabora.com>
 <20250912181931.3738444-2-daniel.almeida@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250912181931.3738444-2-daniel.almeida@collabora.com>
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

Hi Daniel,
On 2025-09-12 at 15:19:28 -0300, Daniel Almeida wrote:
> We will be adding tests for Panthor in a subsequent patch, so first add
> the ability to open the device.
> 
> In particular, these will be used to test both Panthor[0] and Tyr[1],
> i.e.: the new Rust GPU driver that implements Panthor's uAPI (i.e.:
> panthor_drm.h).
> 
> This work is being tested on a RockPi 5, featuring an rk3588 SoC and
> Mali-G610 Valhall.
> 
> [0]: https://patchwork.freedesktop.org/patch/msgid/20240229162230.2634044-12-boris.brezillon@collabora.com
> [1]: https://lore.kernel.org/dri-devel/aMLB0Vs0dJ_AkU4z@google.com/
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/drmtest.c | 1 +
>  lib/drmtest.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 551385867..ea37a886a 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -220,6 +220,7 @@ static const struct module {
>  	{ DRIVER_INTEL, "i915", modprobe_i915 },
>  	{ DRIVER_MSM, "msm" },
>  	{ DRIVER_PANFROST, "panfrost" },
> +	{ DRIVER_PANTHOR, "panthor" },
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index a9542dde2..4c34ac311 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -56,6 +56,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_XE	(1 << 7)
>  #define DRIVER_VMWGFX   (1 << 8)
>  #define DRIVER_VKMS	(1 << 9)
> +#define DRIVER_PANTHOR   (1 << 10)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> -- 
> 2.51.0
> 
