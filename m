Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231B989A6A4
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 23:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BED610EA73;
	Fri,  5 Apr 2024 21:53:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="buA2P7mc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766910EA75
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 21:53:55 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6e703e0e5deso2399654b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 14:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1712354034; x=1712958834;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sQO+6yaLB4Rb5sgHnSOpqt9vaP8rvsYYSXfywwM4Y/c=;
 b=buA2P7mcH1KSoPyNbRmgWDANQRJONeBuvuBYpWijmiAR1tpOgDyyyB7aU7Pst56nau
 5UM/Gg6xhs5Bc+93HJJw1AoMfm5pPdcpL5WjLyKlSG0RAuGb5Zr6vQsE/+4t8QnhxDep
 YYu4n49ZcD/G/jkG5mMH1GVp0bwE7CE3KHJAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712354034; x=1712958834;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQO+6yaLB4Rb5sgHnSOpqt9vaP8rvsYYSXfywwM4Y/c=;
 b=qKK29r83WzuvYGTNnAyFXM7L4QXwv+GIU/fbtr7gZQlXAKp2WCksPx71v8NvPFx4ow
 mNOXCdxHm53dYFs490dOXUztN7q7Q7vQgzbvCSsGid1hUtDMYwtjpD111y8VPP70gK2a
 PstMJRZ6A3TniLHB4ObyBHGtcFcayJ3fQ3K8nEF12m8EXWuq1LYuMFbUpaAIwtlFh7s3
 oWefzhvqasMTkgtGpSXCeKcZ01Ax2EN5D6fQ4rNofPb/rpmjttXDC6IkXgvs7bzAwZtr
 0lEwRhzMbvDUxc47jO7hkF15aCmYCjyXwDMAjuaOUNURDY9mbB/XZE6xJQcxNyNu4GmR
 z/og==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4DS3g+L4Y83TtkVzEpshvJsYSW6paHy2R/LpCd8MUPCuksN2goerAf+pic+qoz1LzdOArNkHaXcSyxHryfngQ0kGr5qaCd08J5BF95pm9
X-Gm-Message-State: AOJu0YyinPDyCaQB/YPqfoHHNbjq2zirR/HiQ6cLph8jEBGkTFFfiMlo
 zxDIfVdbH4B7BRXoPBPk2adDOuhNHkh42dXUsOTMK7ZAUw3rHX9NFInPD3bSUw==
X-Google-Smtp-Source: AGHT+IE3t9Lw6Gq4bRsN4I7EwlEZptfEj1Zl8LpK+4Kd+ccLk0SeWQSPJWXW+G4Gj2LP9tBYxTK6uQ==
X-Received: by 2002:a05:6a20:9785:b0:1a7:afc:b057 with SMTP id
 hx5-20020a056a20978500b001a70afcb057mr2684198pzc.36.1712354034598; 
 Fri, 05 Apr 2024 14:53:54 -0700 (PDT)
Received: from [10.211.41.59] ([66.170.99.2]) by smtp.gmail.com with ESMTPSA id
 g6-20020aa79f06000000b006ed00ea504asm1735753pfr.159.2024.04.05.14.53.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 14:53:53 -0700 (PDT)
Message-ID: <0e7ad871-36e8-42bc-a5df-f418b971dfef@broadcom.com>
Date: Fri, 5 Apr 2024 14:53:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/vmwgfx: Implement virtual kms
To: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, ian.forbes@broadcom.com,
 martin.krastev@broadcom.com
References: <20240402232813.2670131-1-zack.rusin@broadcom.com>
 <20240402232813.2670131-2-zack.rusin@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20240402232813.2670131-2-zack.rusin@broadcom.com>
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

On 4/2/24 16:28, Zack Rusin wrote:
>  
> @@ -541,6 +518,8 @@ static int vmw_ldu_init(struct vmw_private *dev_priv, unsigned unit)
>  			 dev_priv->implicit_placement_property,
>  			 1);
>  
> +	vmw_du_init(&ldu->base);
> +
>  	return 0;
>  
>  err_free_unregister:

> @@ -905,6 +900,9 @@ static int vmw_sou_init(struct vmw_private *dev_priv, unsigned unit)
>  				   dev->mode_config.suggested_x_property, 0);
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.suggested_y_property, 0);
> +
> +	vmw_du_init(&sou->base);
> +
>  	return 0;
>  
>  err_free_unregister:

> @@ -1575,6 +1576,9 @@ static int vmw_stdu_init(struct vmw_private *dev_priv, unsigned unit)
>  				   dev->mode_config.suggested_x_property, 0);
>  	drm_object_attach_property(&connector->base,
>  				   dev->mode_config.suggested_y_property, 0);
> +
> +	vmw_du_init(&stdu->base);
> +
>  	return 0;
>  
>  err_free_unregister:

Shouldn't calls to vmw_du_init() be behind an if(vkms_enabled) condition?

Thanks,

Maaz Mombasawala <maaz.mombasawala@broadcom.com>

