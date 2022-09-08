Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0195B2013
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 16:04:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C629F10EB08;
	Thu,  8 Sep 2022 14:04:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E4C710EB08
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 14:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=9PCcrYNVuozJIfp53KT8gGXpCNqGYX69AJYowNPVeYw=; b=iQ4saYWkSE/MVdkWrQECx66yii
 KUcxnGAfTtlUbkW97RR7eoRb9/5XNLdF6dzBh73cXFZ+JDVVoKdex7K+BLFr/0/2yUXaZ0/EWj7+b
 L4bA2KbrTIYfBAb0CveDctM8P0tYVqB9hudLqrJSj/xmWAdXripeiKuuKCNw39K0xSQJgpOpTuimK
 +cDoPEn8sg/vjF6lHOnFVNDna3rdk62MxLVXfFT3h1nuZdUYR6eB69kSyt3GcCmTXimlu85dH+1b6
 g5yTanINW20ooOpkotnn1m16jPPMFqNO57f35i2U0+61lSXtfKgPdSFBUsj98pjUTINskUC1ncgfh
 px92uTNg==;
Received: from [2601:1c0:6280:3f0::a6b3]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oWI8u-004Njw-Q9; Thu, 08 Sep 2022 14:04:32 +0000
Message-ID: <3736000f-50eb-fd70-3660-580122ac948d@infradead.org>
Date: Thu, 8 Sep 2022 07:04:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] drm/vmwgfx: fix repeated words in comments
Content-Language: en-US
To: wangjianli <wangjianli@cdjrlc.com>, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220908131541.39684-1-wangjianli@cdjrlc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220908131541.39684-1-wangjianli@cdjrlc.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/8/22 06:15, wangjianli wrote:
> Delete the redundant word 'to'.
> 
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index f085dbd4736d..7677475b5d93 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -409,7 +409,7 @@ static int vmw_view_res_val_add(struct vmw_sw_context *sw_context,
>  
>  /**
>   * vmw_view_id_val_add - Look up a view and add it and the surface it's pointing
> - * to to the validation list.

No, it's correct without this change.

> + * to the validation list.
>   *
>   * @sw_context: The software context holding the validation list.
>   * @view_type: The view type to look up.

-- 
~Randy
