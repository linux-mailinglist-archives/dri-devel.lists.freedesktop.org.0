Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825654FC109
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:38:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC3C10E178;
	Mon, 11 Apr 2022 15:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F75110E178
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:38:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 i7-20020a1c3b07000000b0038eb92fa965so814690wma.4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TmspQXL8ssUng8+s6ocBtiiA4+mDrC4wVOVkbmyv+jc=;
 b=CIiuQVHA6iL5XR/Dt2fESMXoo6Yb1wuc1DIuHgWEvLGJHYC0z4DcWHcHwLtnLvtMvZ
 V7mg6ctge3MQY3saddAJ44l7kii5s7bYvzxSvqJ7UnyUfON8PfIoMgSCHpJyaLA63SyR
 UZzKhIAtAfwYC0UdiZwVomHq2VEo2XvXsl9/H67ug1BGq1RS0hwdE7P/EzatPCP+7LEE
 JaZ8lALrjMact0xO8EMTc4L+nE5LWRCA9f57JCzD5yl8dal6t5Sm8yyMSPfSBWN0tXun
 uaiaJlmGR7FB+mrbCnpcsdZguJbG9mGxQqP5h8/xmrKJtQA6r6Wa89K4lVjnv/4GPlU/
 3v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TmspQXL8ssUng8+s6ocBtiiA4+mDrC4wVOVkbmyv+jc=;
 b=MrVB4baL23bJojugPeNiud8KpDTCQzBqmYKpfc7A74XkCwt38EsxwcBITsLf7jKq8r
 4NSBd82S1KBHM/JiK8p7SSPiWVPwcMG7qQU2FeRmftoMYD1oIzu0cPil8xv7xzczEheE
 6KoAlzsesrb93jxF/So2dncC9glOuLfZGtSpC6h8syT7QD1cL3OUkQCXBziwB2fnBVWJ
 PW3KnB5ua4ACw/6JLkIReidpwetPihsSteAcyyBzRX96VZOPSDvknZIgQY0vCbqMABpF
 Y0tVSph/qwfvw+Zj5MSlyA7J7wn8MewsJe64h0GRdIrNPbw25STaBS1VihY95CRZwu+s
 bUNg==
X-Gm-Message-State: AOAM531rUJEuaIT384pvqH2GCGYCsBcTjkgTi53reA8V1DPaub8aBQpT
 5s2swMoZNOUSzlIHWkp/h74=
X-Google-Smtp-Source: ABdhPJzWoncL/AiKibYMqJhjJTiMNRn07rs4GeeqsXGT8DIiJ+Eq0UE1a+s/h30NfVGfgmLSUP9Ijw==
X-Received: by 2002:a05:600c:4f0f:b0:38c:c8f5:73e7 with SMTP id
 l15-20020a05600c4f0f00b0038cc8f573e7mr29193223wmq.201.1649691505211; 
 Mon, 11 Apr 2022 08:38:25 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 a18-20020a05600c349200b0038ca453a887sm18336226wmq.19.2022.04.11.08.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:38:24 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 04/10] drm/sun4i: Allow building the driver on RISC-V
Date: Mon, 11 Apr 2022 17:38:23 +0200
Message-ID: <10060227.nUPlyArG6x@kista>
In-Reply-To: <20220411043423.37333-5-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: devicetree@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne ponedeljek, 11. april 2022 ob 06:34:16 CEST je Samuel Holland napisal(a):
> Allwinner D1 is a RISC-V SoC which contains a DE 2.0 engine. Let's
> remove the dependency on a specific CPU architecture, so the driver can
> be built wherever ARCH_SUNXI is selected.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
> 
>  drivers/gpu/drm/sun4i/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
> index befc5a80222d..3a43c436c74a 100644
> --- a/drivers/gpu/drm/sun4i/Kconfig
> +++ b/drivers/gpu/drm/sun4i/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_SUN4I
>  	tristate "DRM Support for Allwinner A10 Display Engine"
> -	depends on DRM && (ARM || ARM64) && COMMON_CLK
> +	depends on DRM && COMMON_CLK
>  	depends on ARCH_SUNXI || COMPILE_TEST
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_HELPER
> -- 
> 2.35.1
> 
> 


