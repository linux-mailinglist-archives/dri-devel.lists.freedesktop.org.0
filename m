Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88569D0A08A
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 13:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EE310E8AF;
	Fri,  9 Jan 2026 12:52:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdWomjGR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A13110E8AF
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767963178; x=1799499178;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=3J7Eg1jXWEJtsQ+djr7bGYkudA6kqW1yj5d2bXsUCek=;
 b=jdWomjGRrW1qo/TBhk6PJFltOY1SPaxKSAkDjq6JOvSRAoh+DNIql1vV
 CJkPpHBao0veko6REYOSUQ3SD01ph1mQ0LPeOD/94YbFh5Q83l8lJGsRE
 pHe4BI8HgCT7KqPEUzqMQDe4JZmmoDtawpYmgJ1TpqT5guamQJNtgJovD
 bCHNHzmepwZrt0cr8S7SdSHGxAU7wLNQs2Or5AdZaYJcba4dLBXcDMxUL
 lTTlsZzadus7Iqncc0SYdNNW9D0GNXORZGvhw9igtDsug+a1wag2OEkmH
 Ik/dWTvMyAMl+i+TY/dWNtAqBIA9yTLTZtpRANwz+zEI5l3awq497Gg0x g==;
X-CSE-ConnectionGUID: 9Y4SMpU+TrWbR7UkvtJ0xg==
X-CSE-MsgGUID: hliJRmRRQJGq7tr1p/wl6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="69257597"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="69257597"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 04:52:57 -0800
X-CSE-ConnectionGUID: MKw1cOY6QlOjJCozqAZ1ow==
X-CSE-MsgGUID: uRrwHiMpTsCtwJGX73FNDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; d="scan'208";a="207945009"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.143])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 04:52:54 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: simona@ffwll.ch, airlied@gmail.com, mperttunen@nvidia.com,
 thierry.reding@gmail.com, Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] gpu: host1x: fix missing 'host1x_context_device_bus_type'
In-Reply-To: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109124507.403728-1-ben.dooks@codethink.co.uk>
Date: Fri, 09 Jan 2026 14:52:51 +0200
Message-ID: <48679d960d98c3134e5a3fcc6c6238c66f0b61af@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 09 Jan 2026, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
> The drivers/gpu/host1x/context_bus.c does not include
> any declaration of host1x_context_device_bus_type, and
> after including "context.h" it also showed that there
> are two definitons in the kernel, so fix those two
>
> Change context.h to include the correct definiton of
> host1x_context_device_bus_type by including
> <linux/host1x_context_bus.h> in context.h
>
> Fixes the following sparse warning:
> drivers/gpu/host1x/context_bus.c:9:23: warning: symbol 'host1x_context_device_bus_type' was not declared. Should it be static?
>
> Fixes: 3d70eb8e60c6d009c988 ("gpu: host1x: Make host1x_context_device_bus_type constant")
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/gpu/host1x/context.h     | 3 +--
>  drivers/gpu/host1x/context_bus.c | 2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/host1x/context.h b/drivers/gpu/host1x/context.h
> index 3e03bc1d3bac..5215922905ed 100644
> --- a/drivers/gpu/host1x/context.h
> +++ b/drivers/gpu/host1x/context.h
> @@ -10,11 +10,10 @@
>  
>  #include <linux/mutex.h>
>  #include <linux/refcount.h>
> +#include <linux/host1x_context_bus.h>
>  
>  struct host1x;
>  
> -extern struct bus_type host1x_context_device_bus_type;
> -
>  struct host1x_memory_context_list {
>  	struct mutex lock;
>  	struct host1x_memory_context *devs;
> diff --git a/drivers/gpu/host1x/context_bus.c b/drivers/gpu/host1x/context_bus.c
> index 7cd0e1a5edd1..89f61b1f7d33 100644
> --- a/drivers/gpu/host1x/context_bus.c
> +++ b/drivers/gpu/host1x/context_bus.c
> @@ -6,6 +6,8 @@
>  #include <linux/device.h>
>  #include <linux/of.h>
>  
> +#include "context.h"

Shouldn't this and context.c just include <linux/host1x_context_bus.h>?
context_bus.c doesn't need anything from context.h, and context.h
doesn't really need <linux/host1x_context_bus.h> either.

BR,
Jani.

> +
>  const struct bus_type host1x_context_device_bus_type = {
>  	.name = "host1x-context",
>  };

-- 
Jani Nikula, Intel
