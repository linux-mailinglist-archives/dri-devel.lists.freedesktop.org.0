Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E509510FD
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 02:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509E410E3E3;
	Wed, 14 Aug 2024 00:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="NZYIvlMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4A310E3E3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 00:21:03 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-710ece280b6so2630724b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1723594863; x=1724199663;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yo8qByJpwK5ue8wU6fp7zYfaHZGt3cBHSps+Q3gbC34=;
 b=NZYIvlMAgCKDHjdLAy+CVngEO6FUKJup0CT5Q1mesZKXDHBzlejUKglH3wwU0paItg
 MJ+TqZzNhuauYWlOjfZtO4CZB6FOP8wZ0sOPaiuL8O4IKTg825IPGpWzYNFf6maH8Itp
 BliMf5hhuSNjeOyFLxnsypuWr7KiZLXXCoVfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723594863; x=1724199663;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yo8qByJpwK5ue8wU6fp7zYfaHZGt3cBHSps+Q3gbC34=;
 b=KpWXLdN5/WWQGk5m0ZomiNUkXSV2Mn1/r6yR91X1USXVBHa5VSbmvq6/qCeoflsuS8
 VIL68fX8s0kQWoeoZoCjd9Z9IRhQw5+5wKcUC2zo176ErGK2506KPzg45SF1BHHaeOfc
 KHdB3hVCl+glTltpL7NC6PDmeczvwYQvhKEmuVH5al8ctXOmUbUUGxvef1ArEo8V4quC
 K9+HuvvUyokmOiamVzmKo8X/BtrTHGM/9Ao6ehmrxBxkMdPgm1+wIeB5kIw0w8OS1jnb
 IFRzUSeUZn+mwg5e6Bnj7+TuCI3cQZeP7Lo6yYJ/eXgZkdd83iu3x7kvALU+xS4tKs4H
 AFtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvG6b96EdnFDeVfaILXu8kbuV49EsAL0R3pPRsWIY/5kTMf/QGWaepx47aBuarqw6OwzT8FBtL694I8dwwGuznmuL5jhq2UlJH5OmTEXR7
X-Gm-Message-State: AOJu0Ywq6bRPQb51SwB8XTIRsn2FWMXVgQf0CUuOVHb63syLIp2d5VIf
 xtmvhv9ZIRBelU5NL2BLClCsktSHSx9g35zmx9+QBQErVduoVE86YFt2nW0BGw==
X-Google-Smtp-Source: AGHT+IF92O+1lnGcWi0fCwZJU+MsE2l32aB4cTMe79I8TX2TSlRSnaaR3jnI2YjAoeexYkefmpwyGA==
X-Received: by 2002:a05:6a20:4392:b0:1c4:8876:2ae with SMTP id
 adf61e73a8af0-1c8eaf5cd68mr1565327637.41.1723594863334; 
 Tue, 13 Aug 2024 17:21:03 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e5872bfdsm6276039b3a.26.2024.08.13.17.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 17:21:02 -0700 (PDT)
Message-ID: <f7da3c46-abb9-460d-8fee-7d70189f9846@broadcom.com>
Date: Tue, 13 Aug 2024 17:21:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Bump the minor version of the driver
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com
References: <20240723043543.536675-1-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240723043543.536675-1-zack.rusin@broadcom.com>
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

On 7/22/24 21:35, Zack Rusin wrote:
> Provide a way to query for the fixed support for dumb buffers with kms.
> 
> Lets mesa svga return a buffer id, instead of a surface id from
> resource_to_handle which fixes a lot of userspace apps that assume
> that those handles are gem buffers.
> 
> Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 8de973549b5e..ced881fdca4a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -57,9 +57,9 @@
>  
>  
>  #define VMWGFX_DRIVER_NAME "vmwgfx"
> -#define VMWGFX_DRIVER_DATE "20211206"
> +#define VMWGFX_DRIVER_DATE "20240722"
>  #define VMWGFX_DRIVER_MAJOR 2
> -#define VMWGFX_DRIVER_MINOR 20
> +#define VMWGFX_DRIVER_MINOR 21
>  #define VMWGFX_DRIVER_PATCHLEVEL 0
>  #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
>  #define VMWGFX_MAX_DISPLAYS 16

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

Maaz Mombasawala <maaz.mombasawala@broadcom.com>

