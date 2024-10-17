Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4C9A18BC
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A5A010E789;
	Thu, 17 Oct 2024 02:44:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="fsGLmLEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EFF10E786
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 02:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ECKMUpYSJvQNNNhUeowTTPXY5+HEoB+I2ZvTarA4H6I=; b=fsGLmLEYMnvUIBf1xYys/7h2gB
 TTnJybOtwM/KZbqq1J4v2ECpHy3k7z4gatjn0FJ+mgi02f1KPaxcrauATe1bLAt/HozZZLXZ541VC
 VGPLXOPuuSeDI0Ybc22spxT2LOC82ZplJUKIiekOBT5yitnN0WzEIY6jiVPG3bs5Igb/GPD+oml37
 Xa2Bttxysn2xp0zdCFlRk/RERQoeRkf4QCHl7xzY72IrCG5rZCyzGH93u2Bz0QjSJhi8udWcHnlSS
 Dbv8dSH906agIEdmyFfgBlSVFo1zLUecZp32NZdJM+hQ/8uB6n/Ugut8c64T6kLLxgpfUsEiht4fy
 e4Q3Z8Rw==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
 by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
 id 1t1GVN-00000009nfx-3KZh; Thu, 17 Oct 2024 02:44:50 +0000
Message-ID: <3380e075-ea9e-495a-b011-c2af47dbc1d5@infradead.org>
Date: Wed, 16 Oct 2024 19:44:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] >>>>>>>>>>>>>>>>>>>>>>> FIXME <<<<<<<<<<<<<<<<<<<<<<
To: dri-devel@lists.freedesktop.org
Cc: patches@lists.linux.dev, Stephen Rothwell <sfr@canb.auug.org.au>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20241017024305.61318-1-rdunlap@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241017024305.61318-1-rdunlap@infradead.org>
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

Whoops, I reverted the subject line change.
Will resend it.

On 10/16/24 7:43 PM, Randy Dunlap wrote:
> 
> drivers/gpu/drm/drm_fbdev_dma.c:1: warning: no structured comments found
> drivers/gpu/drm/drm_fbdev_shmem.c:1: warning: no structured comments found
> drivers/gpu/drm/drm_fbdev_ttm.c:1: warning: no structured comments found
> 
> Fixes: 731fddf4302e ("drm/fbdev-dma: Remove obsolete setup function")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  Documentation/gpu/drm-kms-helpers.rst |    9 ---------
>  1 file changed, 9 deletions(-)
> 
> --- linux-next-20241016.orig/Documentation/gpu/drm-kms-helpers.rst
> +++ linux-next-20241016/Documentation/gpu/drm-kms-helpers.rst
> @@ -110,15 +110,6 @@ fbdev Helper Functions Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_fb_helper.c
>     :doc: fbdev helpers
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_fbdev_dma.c
> -   :export:
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_fbdev_shmem.c
> -   :export:
> -
> -.. kernel-doc:: drivers/gpu/drm/drm_fbdev_ttm.c
> -   :export:
> -
>  .. kernel-doc:: include/drm/drm_fb_helper.h
>     :internal:
>  

-- 
~Randy

