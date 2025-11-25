Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D35F6C86EA6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:07:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA46910E447;
	Tue, 25 Nov 2025 20:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AQY8q2zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF73B10E447
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764101235; x=1795637235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KDAMEcekW0GbeCdlt1+A39flE38a3ZcvoP/43pcRNmI=;
 b=AQY8q2zVxNTjLT/RdQLYdNRLRBOmVOK24rM4oCKe36Xt9Wdk88D8uEMd
 ND6Y2KS4oPIfgC4YU5ejMBL3OAiYauaJ2MoZVdlBm6xb1vRhspxfC76pU
 vJer+poKhXbQIIyMCdDt+l/i96Ezai7s5HQNcH4wRQcJHGmCQELERRmu1
 E0WdL8c4ffej1uKTjUFAZ55t58JMDJi5aVF8M5CglCGFCsg/WqvSLue5x
 G9d3yTbRoXkr/ZUb4OPNFy+/G54vH9y4W0ArnfzR7NIOAOYfShgNGWNb1
 AkDVwL1Wtq1h158RiE3YMl/lKz0cF7PL7vxuJtJUtzQNZE2oYRLy2eBC/ w==;
X-CSE-ConnectionGUID: x8U7PbtMS+mqNry1IJ1eeg==
X-CSE-MsgGUID: SFT6afi/QTmwOSqjdMGEFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76814365"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="76814365"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 12:07:15 -0800
X-CSE-ConnectionGUID: /M1ViyviQSqztxx+pfyhCA==
X-CSE-MsgGUID: KvAHAXFBQOqrGjb1oPcNfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="193554410"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa010.fm.intel.com with ESMTP; 25 Nov 2025 12:07:13 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
 id CE696A0; Tue, 25 Nov 2025 21:07:11 +0100 (CET)
Date: Tue, 25 Nov 2025 21:07:11 +0100
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 karol.wachowski@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
Message-ID: <aSYMb4EKFCaYrWTI@black.igk.intel.com>
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

+Cc: David

On Wed, Oct 15, 2025 at 05:37:15PM +0200, Youssef Samir wrote:
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.

I believe it's the opposite to what has to be done here.
At first glance it should be umin(), but I Cc'ed David
who is the expert in this topic.

> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -615,7 +615,7 @@ static void sahara_parse_dump_table(struct sahara_context *context)
>  
>  	/* Request the first chunk of the first image */
>  	context->dump_image = &image_out_table[0];
> -	dump_length = min(context->dump_image->length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, context->dump_image->length, SAHARA_READ_MAX_SIZE);
>  	/* Avoid requesting EOI sized data so that we can identify errors */
>  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;
> @@ -663,7 +663,7 @@ static void sahara_parse_dump_image(struct sahara_context *context)
>  
>  	/* Get next image chunk */
>  	dump_length = context->dump_image->length - context->dump_image_offset;
> -	dump_length = min(dump_length, SAHARA_READ_MAX_SIZE);
> +	dump_length = min_t(u64, dump_length, SAHARA_READ_MAX_SIZE);
>  	/* Avoid requesting EOI sized data so that we can identify errors */
>  	if (dump_length == SAHARA_END_OF_IMAGE_LENGTH)
>  		dump_length = SAHARA_END_OF_IMAGE_LENGTH / 2;

-- 
With Best Regards,
Andy Shevchenko


