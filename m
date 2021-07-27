Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 369893D787D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 16:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110FE6E106;
	Tue, 27 Jul 2021 14:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EB6A6E106
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 14:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=THKIyKaJItuuzn+mjxOm4jQhHXAEqt5rES7irp8lkI8=; b=mP2oppjzOfiz9gxL+744ngdIHc
 9tUSQWJl+Kcahr7QnZuzRMtFTwcEOftgJ9lRl/DOWqAUM/3HfKToyoFC7dqh9cv1kt9u3WVDSIAvZ
 e3EoFm3zSppD8M9TMvc6ehypDfPWegxaAiLaiHMFNIpLFnqo/UxFD7EhbMsaDySz6cJNDDuOv9qmf
 BDFMQsilOWdXjnAAHim22EaZcfO+d+ar4kgBqQKgzU2eSmInugSRar5atA+9CtLZYmQsK1SI4bbgG
 Kxmx0lukpOa5MrSGArBQLF3RswGUkunZYHOrkZ4oPvITmCSDbFj1gZpuGfvnWg6JbQyufqfM4/NqP
 WyewaO3w==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8O56-00F4E1-9B; Tue, 27 Jul 2021 14:29:16 +0000
Subject: Re: [PATCH] drm/pl111: Remove unused including <linux/version.h>
To: Cai Huoqing <caihuoqing@baidu.com>, emma@anholt.net, airlied@linux.ie,
 daniel@ffwll.ch
References: <20210727052107.659-1-caihuoqing@baidu.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ecafb6ba-ec4f-b98f-c07a-1b03a46a8b71@infradead.org>
Date: Tue, 27 Jul 2021 07:29:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727052107.659-1-caihuoqing@baidu.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/21 10:21 PM, Cai Huoqing wrote:
> Remove including <linux/version.h> that don't need it.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

as reported by 'make versioncheck':

../drivers/gpu/drm/pl111/pl111_display.c: 14 linux/version.h not needed.
../drivers/gpu/drm/pl111/pl111_drv.c: 47 linux/version.h not needed.


> ---
>  drivers/gpu/drm/pl111/pl111_display.c | 1 -
>  drivers/gpu/drm/pl111/pl111_drv.c     | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
> index b5a8859739a2..443e3b932322 100644
> --- a/drivers/gpu/drm/pl111/pl111_display.c
> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> @@ -11,7 +11,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/version.h>
>  #include <linux/dma-buf.h>
>  #include <linux/of_graph.h>
>  
> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
> index fa0a737e9dea..520301b405f1 100644
> --- a/drivers/gpu/drm/pl111/pl111_drv.c
> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
> @@ -44,7 +44,6 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/shmem_fs.h>
>  #include <linux/slab.h>
> -#include <linux/version.h>
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> 

thanks.
-- 
~Randy

