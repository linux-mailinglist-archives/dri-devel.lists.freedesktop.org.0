Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0132C4FC112
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:40:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5BE10E3F2;
	Mon, 11 Apr 2022 15:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF1610E3F2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:40:41 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r13so23611724wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 08:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kURCqWE8pomFkfYFiXr4O15/fAJHColFs2BDAs5/sSY=;
 b=JtoaVvLTXvRhY3gYKm77KhSxq+xb1+GNAnVO3CZFzO9gm8QRx1cDg3BS7TrSiYd6sP
 NQJFtUPhw9/KvCsKvJv+9LmViJLY1/vOcRqH9UVoS4nrkacZGUr+QMzjX9vSzAKYT0r/
 ZNwbY1n6vQCPWLPbZgQ2PmigGmGzuglGmfX8wxSMW6sFPo6+ad/HNxr1nObKLDhVznyw
 14BVrHCXdbAZ6CIUMpFt7lClsNf5WkZxiL41emF5hIIzgbI82zNPcubfwP2ZcJc9SHJ7
 QOXzF2p5wih7tlA+wCqGhR0sbcXPQZVO9BMe10mNM+OhIG9BAjICICEStMJA0HeXCIls
 HPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kURCqWE8pomFkfYFiXr4O15/fAJHColFs2BDAs5/sSY=;
 b=iClrlbQRxjNwhROfFTrHZ0RCFujw1Q1XtFw4zmQnrUf8aw2SVZrS5QyDejzcv8VG1y
 nxCpIw1/21kfmhorG4JeC56rjV82wo0qkM3e/5SOhBOWRkAWIfXf4KQSVwCQ0KIe4hgY
 Op49bHinZl4AtJfjqk2/znBeY6pggunyniRcq6rdAZq+2f8iR0p33L5lsHTw66jXBRik
 85FeAkywMyT5hHJnBjC2hAiaQVW50oAZheJWgfPRM47ApeBgvdH2Z/YR+MoT8bU/n+OX
 XN6y0DHN19N4PZGkpFZqOrfWRzGzfflqXP0dYts7nMDStrhRuhy5IP/QpsSIYd7OnAjn
 mL9Q==
X-Gm-Message-State: AOAM530iGGS12/jkDTgCr/Do2eiyMvTW4iQUI6Sk7A+m7osprittoU4Z
 V+HW3WsBNiaf0wVtmbgkAoXOi3jSoqSKyQ==
X-Google-Smtp-Source: ABdhPJw+7iaYzPWSZQx3m2FbTZmDAGdYmIThnu0ups3wQnpV0ymEdmrs+11yOe3CNNLF+7H6a6WQwQ==
X-Received: by 2002:adf:dd8a:0:b0:207:9e5f:fd0a with SMTP id
 x10-20020adfdd8a000000b002079e5ffd0amr9290217wrl.94.1649691639887; 
 Mon, 11 Apr 2022 08:40:39 -0700 (PDT)
Received: from kista.localnet (cpe-86-58-32-107.static.triera.net.
 [86.58.32.107]) by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm4710207wrq.81.2022.04.11.08.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 08:40:39 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 05/10] drm/sun4i: csc: Add support for the new MMIO layout
Date: Mon, 11 Apr 2022 17:40:38 +0200
Message-ID: <21425699.EfDdHjke4D@kista>
In-Reply-To: <20220411043423.37333-6-samuel@sholland.org>
References: <20220411043423.37333-1-samuel@sholland.org>
 <20220411043423.37333-6-samuel@sholland.org>
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

Dne ponedeljek, 11. april 2022 ob 06:34:17 CEST je Samuel Holland napisal(a):
> D1 changes the MMIO address offset for the CSC blocks in the first
> mixer. The ccsc field value is used as an index into the ccsc_base
> array; allocate the next available value to represent the new variant.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/gpu/drm/sun4i/sun8i_csc.c   | 3 ++-
>  drivers/gpu/drm/sun4i/sun8i_csc.h   | 1 +
>  drivers/gpu/drm/sun4i/sun8i_mixer.h | 6 ++++--
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/
sun8i_csc.c
> index 9bd62de0c288..1ed10c6447a3 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
> @@ -8,9 +8,10 @@
>  #include "sun8i_csc.h"
>  #include "sun8i_mixer.h"
>  
> -static const u32 ccsc_base[2][2] = {
> +static const u32 ccsc_base[][2] = {
>  	{CCSC00_OFFSET, CCSC01_OFFSET},
>  	{CCSC10_OFFSET, CCSC11_OFFSET},
> +	{CCSC00_OFFSET, CCSC01_OFFSET_D1},
>  };
>  
>  /*
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/
sun8i_csc.h
> index 022cafa6c06c..bd54166b2bcc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -13,6 +13,7 @@ struct sun8i_mixer;
>  /* VI channel CSC units offsets */
>  #define CCSC00_OFFSET 0xAA050
>  #define CCSC01_OFFSET 0xFA050
> +#define CCSC01_OFFSET_D1 0xFA000
>  #define CCSC10_OFFSET 0xA0000
>  #define CCSC11_OFFSET 0xF0000
>  
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/
sun8i_mixer.h
> index 5b3fbee18671..22f1b7ef9225 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
> @@ -151,8 +151,10 @@
>   *	scaler and 2 UI channels with scaler, bitmask would be 0xC.
>   * @ccsc: select set of CCSC base addresses
>   *	Set value to 0 if this is first mixer or second mixer with VEP 
support.
> - *	Set value to 1 if this is second mixer without VEP support. Other 
values
> - *	are invalid.
> + *	Set value to 1 if this is second mixer without VEP support.
> + *	Set value to 2 if this is first mixer or second mixer with VEP 
support,
> + *	and the SoC uses the MMIO layout found in the D1 SoC.
> + *	Other values are invalid.

It would be better to introduce some kind of enum. Number 2 is completely 
arbitrary.

Best regards,
Jernej

>   * @mod_rate: module clock rate that needs to be set in order to have
>   *	a functional block.
>   * @is_de3: true, if this is next gen display engine 3.0, false otherwise.
> -- 
> 2.35.1
> 
> 


