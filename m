Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFAB3A4BB
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 17:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FEC10EA35;
	Thu, 28 Aug 2025 15:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7590510EA34;
 Thu, 28 Aug 2025 15:39:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92AA61688;
 Thu, 28 Aug 2025 08:39:19 -0700 (PDT)
Received: from [10.1.37.42] (e122027.cambridge.arm.com [10.1.37.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75B653F738;
 Thu, 28 Aug 2025 08:39:25 -0700 (PDT)
Message-ID: <2f9336f7-898e-4fe9-a17e-b41042de4d13@arm.com>
Date: Thu, 28 Aug 2025 16:39:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib: add support for opening Panthor devices
To: Daniel Almeida <daniel.almeida@collabora.com>, adrinael@adrinael.net,
 arek@hiler.eu, kamil.konieczny@linux.intel.com,
 juhapekka.heikkila@gmail.com, bhanuprakash.modem@gmail.com,
 ashutosh.dixit@intel.com, karthik.b.s@intel.com,
 boris.brezillon@collabora.com, liviu.dudau@arm.com
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250828130402.2549948-1-daniel.almeida@collabora.com>
 <20250828130402.2549948-2-daniel.almeida@collabora.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250828130402.2549948-2-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 28/08/2025 14:03, Daniel Almeida wrote:
> We will be adding tests for Panthor in a subsequent patch, so first add
> the ability to open the device.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

There's also chipset_to_str() which should be updated to return the
correct name. Although I think that only makes some error messages prettier.

I'm not familiar enough with IGT to really provide a proper review, but
I gave the tests a spin. See my comments on patch 4 for the bugs I hit ;)

Steve

> ---
>  lib/drmtest.c | 1 +
>  lib/drmtest.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 436b6de78..f4b429048 100644
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
> index 27e5a18e2..1a933eae1 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -55,6 +55,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
>  #define DRIVER_MSM	(1 << 6)
>  #define DRIVER_XE	(1 << 7)
>  #define DRIVER_VMWGFX   (1 << 8)
> +#define DRIVER_PANTHOR   (1 << 9)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system

