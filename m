Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B5BA1D7EA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 15:19:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76E1F10E0EE;
	Mon, 27 Jan 2025 14:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gwWshXI7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF9010E0EE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 14:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737987542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmNPm6eP14DfUsjoMCbgfYeUbSdRmtBo5ZygBeYXQhg=;
 b=gwWshXI7gjvg1NNsyAiFIqa7afnnuw8392bNtCketDUx7BrtTskv8nOXIySXU2rndBBLiL
 j4ge+1f/ke9xpIOozsxMeO6Ye5KeWmthizO+r1WJp8bfXhEJu0rfJMpw3jIBAn+M3+ZoaZ
 zp/ZwRizSbDk2NZQxDYZEEWafAesTFg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-BA1h94xtOzmFv_dinAYwrg-1; Mon, 27 Jan 2025 09:19:01 -0500
X-MC-Unique: BA1h94xtOzmFv_dinAYwrg-1
X-Mimecast-MFC-AGG-ID: BA1h94xtOzmFv_dinAYwrg
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-436219070b4so20868445e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 06:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737987539; x=1738592339;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JmNPm6eP14DfUsjoMCbgfYeUbSdRmtBo5ZygBeYXQhg=;
 b=kAvOfn6XWMdmWufUitQFm8Zk7dKbKTMq6pn3o8dRkkQCSc7lM/GIt2K5YxnOIGdQo8
 3s07rF4NuKjF+wpxyopHnWhCJZHyaq9OS4J2h1Esmr4HLltVlvbAoUm3bfbzBMwH+/2U
 4OZtHWyZTUeNCZnPZMJ7FDk8JdUOydiWWLEpORblUvN67uc5EUmiFWvb8zHkzmK/nuNr
 mEyZh3ATRq4D4h2OI5osVeN5oxm6QaQwVS2FEM5xf4jvxz+hXN60uoAjO+kIeYGcUJGo
 zgxElm2qpy5IyWp+QSQuIAQ2dn/9auM5s/ws6P2x+11lHGt6dCVM9rg0LZt30gvoAG5z
 w4pA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURHzMfka/q28aQlAjQGd/qHuXBP23Ck7qobpfrz3+Rl+GQOpBJH7J4y1S7OHmIS204/5BkD921W3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyPfUJ58iA3HOyjETPSRe9mWByTg3TeaU3JHav4y9Mh9pb/lmU
 ZhPDOzFruGPrW4JR2LrO3XYuQ7tDfl8XuXEyjZl8xVq2zaRrHhPeAR78AEu0Mu1IMkPebt9Yz3x
 osiLfXvRAepffhl9SPNz5u1Geq9auo6mwmQdsB6wOo0NcrHy7gbacb8KpGadyd9Nea1I4oPkLXw
 ==
X-Gm-Gg: ASbGnctzoJdmcI2RLpjKZEbIprT6ZAowB7JaIHRLydwteDo2PIWl2B3Y8ISTK87aLa4
 vHp6IItm6KlF9j5QZCrSF47Xg653PtYhtrHTQv+7ihnXuU60Wq9ynY5l0leZm0K5Ox9zV38yRYw
 UDC9Nc5NAXTiafwAuT/LtuWBmpFD33F8fPZnUaowXJ5c94biP4hxw4ksol9fmNi3qTBBJ9+Mnej
 A4b8PYW94YtPBFmcJgQWl+21brHzQnKDwZmtEY3gi8PZCcKz/QSVZqSbApt9jG8R5QH2C++TxcO
 MAedSBpD0sOymTsgDyBk/hc5L56DysIivkLEeOe1AYdx
X-Received: by 2002:a05:600c:4f84:b0:42c:bb96:340e with SMTP id
 5b1f17b1804b1-4389144fbffmr410686615e9.31.1737987539426; 
 Mon, 27 Jan 2025 06:18:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsaoh0NkPUkc2bqJPlnIj+RYaoNiV9U5iA+40xennnBpGquKesOt/d5wVXGwNQVKWYZF6Bbw==
X-Received: by 2002:a05:600c:4f84:b0:42c:bb96:340e with SMTP id
 5b1f17b1804b1-4389144fbffmr410686375e9.31.1737987539020; 
 Mon, 27 Jan 2025 06:18:59 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d6b2sm11490160f8f.34.2025.01.27.06.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:18:58 -0800 (PST)
Message-ID: <659f6eff-a0ac-40f7-99da-098dfe620314@redhat.com>
Date: Mon, 27 Jan 2025 15:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] drm/ast: Align naming in widescreen detection code
 to manual
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 dri-devel@lists.freedesktop.org
References: <20250124080546.9956-1-tzimmermann@suse.de>
 <20250124080546.9956-3-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250124080546.9956-3-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9tPHfX1ecCfDZwqQCSpqfAOBs7LtD61z4AEYAXZHjno_1737987540
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 24/01/2025 08:57, Thomas Zimmermann wrote:
> Rename variables and register constants to align with the programming
> manual. Add new constants where necessary.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  2 +-
>   drivers/gpu/drm/ast/ast_main.c |  8 ++++----
>   drivers/gpu/drm/ast/ast_post.c |  2 +-
>   drivers/gpu/drm/ast/ast_reg.h  | 11 ++++++-----
>   4 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index cddd69972e89d..6fbf62a99c48d 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -170,7 +170,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
>   
>   			/* Patch AST2500/AST2510 */
>   			if ((pdev->revision & 0xf0) == 0x40) {
> -				if (!(vgacrd0 & AST_VRAM_INIT_STATUS_MASK))
> +				if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK))
>   					ast_patch_ahb_2500(regs);
>   			}
>   
> diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
> index ba69280b33e78..2a813f0128eb8 100644
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -38,7 +38,7 @@
>   
>   static void ast_detect_widescreen(struct ast_device *ast)
>   {
> -	u8 jreg;
> +	u8 vgacrd0;
>   
>   	/* Check if we support wide screen */
>   	switch (AST_GEN(ast)) {
> @@ -46,10 +46,10 @@ static void ast_detect_widescreen(struct ast_device *ast)
>   		ast->support_wide_screen = false;
>   		break;
>   	default:
> -		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> -		if (!(jreg & 0x80))
> +		vgacrd0 = ast_get_index_reg(ast, AST_IO_VGACRI, 0xd0);
> +		if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_BY_BMC))
>   			ast->support_wide_screen = true;
> -		else if (jreg & 0x01)
> +		else if (vgacrd0 & AST_IO_VGACRD0_IKVM_WIDESCREEN)
>   			ast->support_wide_screen = true;
>   		else {
>   			ast->support_wide_screen = false;
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 0daa8e52a092a..91e85e457bdf3 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -2062,7 +2062,7 @@ void ast_post_chip_2500(struct ast_device *ast)
>   	u8 reg;
>   
>   	reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> -	if ((reg & AST_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
> +	if ((reg & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
>   		/* Clear bus lock condition */
>   		ast_patch_ahb_2500(ast->regs);
>   
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 0745d58e5b450..b4ff38949a565 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -38,6 +38,12 @@
>   #define AST_IO_VGACRCB_HWC_16BPP	BIT(0) /* set: ARGB4444, cleared: 2bpp palette */
>   #define AST_IO_VGACRCB_HWC_ENABLED	BIT(1)
>   
> +/* mirrors SCU100[7:0] */
> +#define AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
> +#define AST_IO_VGACRD0_VRAM_INIT_BY_BMC		BIT(7)
> +#define AST_IO_VGACRD0_VRAM_INIT_READY		BIT(6)
> +#define AST_IO_VGACRD0_IKVM_WIDESCREEN		BIT(0)
> +
>   #define AST_IO_VGACRD1_MCU_FW_EXECUTING		BIT(5)
>   /* Display Transmitter Type */
>   #define AST_IO_VGACRD1_TX_TYPE_MASK		GENMASK(3, 1)
> @@ -61,11 +67,6 @@
>   #define AST_IO_VGAIR1_R			(0x5A)
>   #define AST_IO_VGAIR1_VREFRESH		BIT(3)
>   
> -
> -#define AST_VRAM_INIT_STATUS_MASK	GENMASK(7, 6)
> -//#define AST_VRAM_INIT_BY_BMC		BIT(7)
> -//#define AST_VRAM_INIT_READY		BIT(6)
> -
>   /*
>    * AST DisplayPort
>    */

