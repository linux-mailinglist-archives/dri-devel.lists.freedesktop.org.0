Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFAFAEB88B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 15:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5F9D10EA16;
	Fri, 27 Jun 2025 13:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ENgiycsn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 523F710EA16
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751029870; x=1782565870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=lcJWZqeVwjpFnSWJSZOtJO5vAGFfa9DHinhZvGR946A=;
 b=ENgiycsnsjC2/aqPRQO4rve0ChP9AIrEIitn9kKBKVBLYTXTe+ItpH5i
 +X5XcPhFSx/tUeSDpXPLvIQt8p1A8EDrL7sjeiVynrN4yG2EjBryTz/N5
 XvLX1K8IXWZ8Gs4UEbnUbukdtPejlagyEPh60zsWb5AxEzW4g/8naCarh
 gQiA4MxQgleJI3RjgTGqKuFVoODRs+A7uYN1OyQt9V8YCUyy9/foUQb2E
 3edFjZOZFvjpmysCJOcW1Hl6DTDMJKCGesJrNIG4uAivNmvALBUUVdfXG
 mzv6NNO6NAYxmYiLMy3eIoaoxEGHo/5hfX7aIXzT/63alH4W/tu2F+wHT A==;
X-CSE-ConnectionGUID: kJC10K5GTgiqug9+BMX4pQ==
X-CSE-MsgGUID: xsAdVXiDRkCPdUo8p3QuYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53216378"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="53216378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:11:08 -0700
X-CSE-ConnectionGUID: X9qCysVXTMOOGGnxCeuv7w==
X-CSE-MsgGUID: f2/YQqXwSAKxqaMjoJ71Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157348817"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 06:11:05 -0700
Date: Fri, 27 Jun 2025 16:11:02 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 airlied@gmail.com, simona@ffwll.ch,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v2 1/2] drm/doc: Fix title underline for "Task information"
Message-ID: <aF6YZmRiPcIGt6F5@black.fi.intel.com>
References: <20250619140655.2468014-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250619140655.2468014-1-andrealmeid@igalia.com>
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

On Thu, Jun 19, 2025 at 11:06:54AM -0300, André Almeida wrote:
> Fix the following warning:
> 
> Documentation/gpu/drm-uapi.rst:450: WARNING: Title underline too short.
> 
> Task information
> --------------- [docutils]
> 
> Fixes: cd37124b4093 ("drm/doc: Add a section about "Task information" for the wedge API")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
> v2: Add Reported-by tag
> ---
>  Documentation/gpu/drm-uapi.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 263e5a97c080..10dea6a1f097 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -447,7 +447,7 @@ hang is usually the most critical one which can result in consequential hangs or
>  complete wedging.
>  
>  Task information
> ----------------
> +----------------

Since we're here, can you please also fix the grammar in last sentence
of this section? I presume you meant to use either "provides" or "should
have" and not both? ;)

Raag

>  The information about which application (if any) was involved in the device
>  wedging is useful for userspace if they want to notify the user about what
> @@ -728,4 +728,4 @@ Stable uAPI events
>  From ``drivers/gpu/drm/scheduler/gpu_scheduler_trace.h``
>  
>  .. kernel-doc::  drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> -   :doc: uAPI trace events
> \ No newline at end of file
> +   :doc: uAPI trace events
> -- 
> 2.49.0
> 
