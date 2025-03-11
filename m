Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5DBA5C1D0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 14:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4187010E59B;
	Tue, 11 Mar 2025 13:02:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H7tEqdbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 611C410E59B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 13:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741698164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o7pWXniYY5u0I1tg2NDNTmOUntZxDKCzJSL7zFPDRcE=;
 b=H7tEqdbqZpnkTJLyp2eLdtMU4idzCgsXnXy57YhxCp7/bTV6P8vALa6aa5/DdG0DUbbxRe
 0AJ8jqZqRrd+VTh8xLmL+XthPG68NT31cRpP/Izgtf+1oGFo5n6pJRAuhBO59ERq+FCbig
 hPbFc5+rAw0zHjdDekoDc9uvEhYi8tw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-YJXitzGFM3yLNh-l6Jmljg-1; Tue, 11 Mar 2025 09:02:41 -0400
X-MC-Unique: YJXitzGFM3yLNh-l6Jmljg-1
X-Mimecast-MFC-AGG-ID: YJXitzGFM3yLNh-l6Jmljg_1741698161
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43ce245c5acso26091245e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741698160; x=1742302960;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o7pWXniYY5u0I1tg2NDNTmOUntZxDKCzJSL7zFPDRcE=;
 b=HDzpGlf4cV9cSnExGtG/7nhviqkw0RzgDtjJZ5wCvWYGmmHSC20340sr+j6ZmnqFb/
 VAUIb8isR3RpCs28WW21ypvVT8ApluQ/wk3cbOxckdGWAGlEkS7/t/gWHGeIL3k7B8mv
 S9wr8Pp7oN6unFHN7Sjb9EVdJj+B2ILS8kA68qBjLc80NxcMoo2w6bjGKirmbmQTFxX4
 Xf4BzyDUWai/K4JHSFpYeRwosDVQ06/LHucRKipaSjNA60LPVL0h1JOunYgHzScc9CFH
 IV2a8t+Ue5eCePAW0yDRGk+tCb42z+ZrrCO+CSiEZNjpOBwNpaw8YcwRaXCaNfXuExpX
 ww1Q==
X-Gm-Message-State: AOJu0YxG2Ia1EAmJzkpFfKyEhtJ0vuX7VuY6fS6HQ0omAm0Mf8r58/4W
 FFpwl/uKdOXYgcBbV/DS8NApSo4LPhT37nLdpejG2qLi0cElt5FLvxI1rkO8K8KMH8nsmEvNX2Z
 lXjEbMTD289lCt7ZvtiYXH6X3awptAa4mXOgwNSrzk5mUvixlBVs2hAkdnZpxoIAxsg==
X-Gm-Gg: ASbGncsfOQln/3hOTnFCQ0l6DSToOh4NYyI8BM/shXDU8PgYb5fQPspIN6RT1OmSttB
 otDP8hZXjOpA7JSzlNGXBQKgPP4oUlnTrbqyMuaBoeUjIfIXhcnzXXF545Mo9YK+WEyCTiw96IE
 PHKN0qFbyVg3FxM4LgCtQ9rOJlGLuU+VEFYmWaPczWPh+TJVir2ytXjjPmPbglOy0CvCOEjbhpm
 zNcrqHp6Wgx/CdspbSa2kgrMDGK8SiNa5q9R68EbNJ3Q5IejP0pzhrin2XlVKtpql+jjbLaevFX
 jiPKSLZprxYPZ/pxe4INTTxW5r7JOjjCzMA/KRUBMu96Af6y4wH9KpI=
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id
 5b1f17b1804b1-43cfceb0aedmr82858235e9.11.1741698160272; 
 Tue, 11 Mar 2025 06:02:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmatG+Or+hD6H2MOrMFkv0OaFBDJufU9okNk/f+CjpFMHzyXA34WC0XAMAwS8nHew82Qt3Ww==
X-Received: by 2002:a05:600c:1547:b0:43c:fceb:91f with SMTP id
 5b1f17b1804b1-43cfceb0aedmr82857005e9.11.1741698159543; 
 Tue, 11 Mar 2025 06:02:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfdfe2bsm17936122f8f.24.2025.03.11.06.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 06:02:39 -0700 (PDT)
Message-ID: <dd5657bf-33b3-46f0-aaeb-d08c4cd44109@redhat.com>
Date: Tue, 11 Mar 2025 14:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] drm/ast: Add VGACR99 register constants
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250305134401.60609-1-tzimmermann@suse.de>
 <20250305134401.60609-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250305134401.60609-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wWxZq_kdPuczv8NTTnoIGnet27K4oOO_pN9d5fqBgLE_1741698161
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

On 05/03/2025 14:35, Thomas Zimmermann wrote:
> Add register constants for VGACR99 and use them when detecting the
> size of the VGA memory. Aligns the code with the programming manual.
> Also replace literal size values with Linux' SZ_ size constants.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/ast_mm.c  | 13 ++++++-------
>   drivers/gpu/drm/ast/ast_reg.h |  1 +
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mm.c b/drivers/gpu/drm/ast/ast_mm.c
> index 8d8aac8c0814..3d03ef556d0a 100644
> --- a/drivers/gpu/drm/ast/ast_mm.c
> +++ b/drivers/gpu/drm/ast/ast_mm.c
> @@ -35,9 +35,8 @@
>   
>   static u32 ast_get_vram_size(struct ast_device *ast)
>   {
> -	u8 jreg;
>   	u32 vram_size;
> -	u8 vgacraa;
> +	u8 vgacr99, vgacraa;
>   
>   	vgacraa = ast_get_index_reg(ast, AST_IO_VGACRI, 0xaa);
>   	switch (vgacraa & AST_IO_VGACRAA_VGAMEM_SIZE_MASK) {
> @@ -55,16 +54,16 @@ static u32 ast_get_vram_size(struct ast_device *ast)
>   		break;
>   	}
>   
> -	jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0x99, 0xff);
> -	switch (jreg & 0x03) {
> +	vgacr99 = ast_get_index_reg(ast, AST_IO_VGACRI, 0x99);
> +	switch (vgacr99 & AST_IO_VGACR99_VGAMEM_RSRV_MASK) {
>   	case 1:
> -		vram_size -= 0x100000;
> +		vram_size -= SZ_1M;
>   		break;
>   	case 2:
> -		vram_size -= 0x200000;
> +		vram_size -= SZ_2M;
>   		break;
>   	case 3:
> -		vram_size -= 0x400000;
> +		vram_size -= SZ_4M;
>   		break;
>   	}
>   
> diff --git a/drivers/gpu/drm/ast/ast_reg.h b/drivers/gpu/drm/ast/ast_reg.h
> index 039b93bed19e..e15adaf3a80e 100644
> --- a/drivers/gpu/drm/ast/ast_reg.h
> +++ b/drivers/gpu/drm/ast/ast_reg.h
> @@ -30,6 +30,7 @@
>   
>   #define AST_IO_VGACRI			(0x54)
>   #define AST_IO_VGACR80_PASSWORD		(0xa8)
> +#define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
>   #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
>   #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)
>   #define AST_IO_VGACRA3_DVO_ENABLED	BIT(7)

