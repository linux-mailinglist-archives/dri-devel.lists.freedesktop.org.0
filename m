Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16CD9F88D3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 01:11:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA7F10E034;
	Fri, 20 Dec 2024 00:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FungW+Bc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD8810E034
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 00:11:18 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-3022c6155edso15460511fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734653477; x=1735258277; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g57t40m8WiF3Qt45USyEwa/syWG581vvqXreLVQ2pKE=;
 b=FungW+BcIvrbSnN8ObNUsCAZP0IVFvWVoTq3A6PrxnQ99XDLwM66IXt8lL23SUZqh8
 O5raZFET+suuyuZlLe4oiZbcfz3uH1a14vUpnW3UuAmLfr/Vd55LLt8uC1egz7lMoLAw
 9ocpoeE0Mo4dmGUwFHgMBrd/15gSyHJW/9gpMetLsrVWPQfztJij8dUHB6QSJcwdzX8k
 pxM+pcTtWzy0zOb7kuF9C1QZi7Y5+DQb/YNp+K3kLWxuGbdkXbGD9wLJ9D/QZf7oiGDc
 E/uTRGvc7TeYKQxr+oKwSsz1imDwvxYmjAc3+ni4lzDyrFCubiFC5QmwBKT3G/rfz7tj
 C+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734653477; x=1735258277;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g57t40m8WiF3Qt45USyEwa/syWG581vvqXreLVQ2pKE=;
 b=ApIItEz6eeLE6LY9WWbfOoEnreOU0CA517C5CJLaIBtl9iWhtvnwevximuQk85dg1b
 RNzezX9EvMUMVCYt1CELJkB1BiLwc23S9c3eyDKrW0BJzthKEbE+kXMk+kUPBHgdDVhF
 PvgA0ixtjLRxuGMUZAzL0kxlYZ0eDpxcfYJlbxBu8vdHLrW0SCIiw16JcEoqPw53uyS0
 zDY26VV0kavm/JJR9SY/rW3+mbuUozZAwtRg0x+nUrxxGgQ7l6rtkkBkVxz2yIXCXVPZ
 t53yHVLH0IjmrccdWh0inEFnzNa+mp2PNHrfcfXiVqEzUGdKx4nocswmjoSr90c2FNbf
 57hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURZ+PerxpnHIDWSdLws8wHzRspE6xLxKkqoxzkkjXU1L02c+d6gnL4n7YfWeqXHSmrmz1HFEwVbC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl5+GkQvmkc2jwg44XshB50fdVcfA9OHZ7M02VcR7JBYH7yUu6
 RWH7xmUdymaT3iLh+VYoFQ2bbwbLAO6TcGaskY5tH5Tmn6H1B1S9JHWCjBXda/E=
X-Gm-Gg: ASbGncuDIDxqxiOTZ87k+vz1KsgVE5udKEgHT6fN10UeEGyKJNcjcKvHjW2hbBJjW2b
 +jaClDlwlNoBsCfitueyEM+hBh6xHwtwkYhzADsRbfs9igkS/GrPFjM8b0nFk9kuiX6HI7dL57i
 wDGgow33Po7C6FoL1MOSQacwsECxd8VVPMaqhfWbMVMKbMgXzATAN2MquTEWH2A2kWSdkm1rPmU
 tpBob2FM6R1dl21/N1M3kDTn6Wd96sAgPgoWwp4BUcb96ZF5ozy+MHOWlWnN9PLS93IWUdKipBS
 oWObzx8PxdXTfBAFkPu4IL7WxKqjJRA0yVaE
X-Google-Smtp-Source: AGHT+IG/EvNfdXX4S4Ubyf70ZsXUL+TAw4dwxn3OL6NK95tyIE5MZoMdIPQljPkzSPFS04i9qfeF5A==
X-Received: by 2002:a05:6512:3d16:b0:540:1b2d:8ee1 with SMTP id
 2adb3069b0e04-54229522508mr154878e87.11.1734653475196; 
 Thu, 19 Dec 2024 16:11:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542238136d4sm316140e87.138.2024.12.19.16.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 16:11:13 -0800 (PST)
Date: Fri, 20 Dec 2024 02:11:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Assume maintainership of PL111
Message-ID: <bmaigvj24rqriugxykrbe47poonji4nw5up5orptx5ajd2mzad@imazjm7fmuj2>
References: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-pl111-maintain-v1-1-c60f57c523cd@linaro.org>
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

On Thu, Dec 19, 2024 at 07:36:05PM +0100, Linus Walleij wrote:
> Emma Anholt dropped maintainership for PL111 and I
> didn't notice it at the time. I've written part of it
> and I'm happy to maintain it, list myself as maintainer
> and assume active maintainership.

Nice!

Could you please convert it to use DRM_BRIDGE_ATTACH_NO_CONNECTOR?
Likewise pl111_display_enable() should use the bus flags and input
formats of the next bridge rather than the ones of the connector.

> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e930c7a58b13d8bbe6bf133ba7b36aa24c2b5e0..99dbe95995824cb6bdf9e5865982c92677924fa8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7068,7 +7068,8 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/sun4i/sun8i*
>  
>  DRM DRIVER FOR ARM PL111 CLCD
> -S:	Orphan
> +M:	Linus Walleij <linus.walleij@linaro.org>
> +S:	Maintained
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>  F:	drivers/gpu/drm/pl111/
>  
> 
> ---
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> change-id: 20241219-pl111-maintain-ec7f69230d48
> 
> Best regards,
> -- 
> Linus Walleij <linus.walleij@linaro.org>
> 

-- 
With best wishes
Dmitry
