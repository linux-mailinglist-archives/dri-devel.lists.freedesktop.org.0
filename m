Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979519D08F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:54:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7706EB0F;
	Fri,  3 Apr 2020 06:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DF16EAE4
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 01:34:23 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id 111so5631095oth.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 18:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qIYcq8W/wQaQKfS0jsKTD0GfgP5XZSOsMql1SZeV8I8=;
 b=TThcSQqFzxjcnGoBrPzGePjj9boBinqTKW5qbM/NNKEIc7LLsiunbROtFCJs4fD437
 SxmMXNOMo4eGuijwSNVJ787GhJBHTbloiZL1Xp6xQt76ih9QsEZ9XwUN+Uo7s3iSoqti
 TyN98rdormsnsYYlEyoA04p4x/Ov/Cv9G1FbDK/Go4W7B99p3HSFB7n03CHx8lH6iEoI
 KLnZ4QgMqXg+BmunRK/fCp0X6PA9GPDy/LEWTqP7GuadHjiOfAhRAxrgQmEgcHr+Bh/K
 VPRWSEyQKmX4tZrUlhEMWrUQCJCApxpEINOqoaa4aJ1DBKgS50Xynl1mosTS6X9SBO1P
 MM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qIYcq8W/wQaQKfS0jsKTD0GfgP5XZSOsMql1SZeV8I8=;
 b=B9WeEuxZEW89yK/rR3e4WVLAMIJllkc6dtHvtx6ZNHw1fFdVZPrIoQaWxpNK783Niu
 dceJwIeejEFEiljTiEhrrxzYwEiNuKhdYq7BFLDeo8Hj7nVKZ8SvX8BGaYcxAVohghek
 xU7KvmHeR39t+5hWL22DIErjhI+6v4ZYHvylP+OVn9HD0d4U9T821xNl+4BLBTHeYOSP
 XvRnCP18pme+OYq8ymRobrrnhC9Dq+bs5rMfcKISf4CAVER3Foxz5z2t2189KfMZNKYB
 CO5xZD5xoopv7EKVrLE4bQAz+s8LMeqOoEtZ8WvlGUKycB5Gx4ra8zK/NSzX5hlpht6f
 XuQA==
X-Gm-Message-State: AGi0PuY6EkBWuhDpRapjLDfYOCzPjZw31WksO5++3gwW1thFPVxusQdZ
 EuPrgmvchuQOx1IeAcvoUCA=
X-Google-Smtp-Source: APiQypLKiSm1NyuRjd4p5t7tz0TqIH1wuqzKrOCp3b2UGGucVP9oEsz1Tfa6lQ5dtIWNU1yzXue2bQ==
X-Received: by 2002:a9d:4810:: with SMTP id c16mr4551484otf.138.1585877663188; 
 Thu, 02 Apr 2020 18:34:23 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id 68sm1756076oon.14.2020.04.02.18.34.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Apr 2020 18:34:22 -0700 (PDT)
Date: Thu, 2 Apr 2020 18:34:20 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] drm/legacy: Fix type for drm_local_map.offset
Message-ID: <20200403013420.GA11516@ubuntu-m2-xlarge-x86>
References: <20200402203317.GA34560@ubuntu-m2-xlarge-x86>
 <20200402215926.30714-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200402215926.30714-1-chris@chris-wilson.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Fri, 03 Apr 2020 06:54:15 +0000
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 02, 2020 at 10:59:26PM +0100, Chris Wilson wrote:
> drm_local_map.offset is not only used for resource_size_t but also
> dma_addr_t which may be of different sizes.
> 
> Reported-by: Nathan Chancellor <natechancellor@gmail.com>
> Fixes: 8e4ff9b56957 ("drm: Remove the dma_alloc_coherent wrapper for internal usage")
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Nathan Chancellor <natechancellor@gmail.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> ---
>  include/drm/drm_legacy.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/drm/drm_legacy.h b/include/drm/drm_legacy.h
> index dcef3598f49e..aed382c17b26 100644
> --- a/include/drm/drm_legacy.h
> +++ b/include/drm/drm_legacy.h
> @@ -136,7 +136,7 @@ struct drm_sg_mem {
>   * Kernel side of a mapping
>   */
>  struct drm_local_map {
> -	resource_size_t offset;	 /**< Requested physical address (0 for SAREA)*/
> +	dma_addr_t offset;	 /**< Requested physical address (0 for SAREA)*/
>  	unsigned long size;	 /**< Requested physical size (bytes) */
>  	enum drm_map_type type;	 /**< Type of memory to map */
>  	enum drm_map_flags flags;	 /**< Flags */
> -- 
> 2.20.1
> 

Thanks for the quick fix!

I ran it through my set of build tests and nothing else seems to have
broken (at least not any more than it already is...).

Tested-by: Nathan Chancellor <natechancellor@gmail.com> # build
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
