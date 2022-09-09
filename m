Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C715B3659
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BB610ECA4;
	Fri,  9 Sep 2022 11:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CC9910ECA4
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:30:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so4222618wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=sIASLX0R2P23+j8OeRBs0Bj5TUjyqw9EM4B0ZPGTtVs=;
 b=ZJBmHCv0f53AQHKe+rGmvzNG0HFlLBm8LmaLcJtQH1fuk/QUEIwjTEZHwO3toPEbqU
 lS/I8A9XbjNw4En/m5MzZf2Z5cp+EAj7vLa2TI4DylJm4JDsrCNZZX1tmtZ5TeLzkoBu
 EPAHO7R3Lzt5yfvX8sjecia1VoeMwl+vGNzPlFoQVmQwgwsV4HHyxD8Oqvtj80aBFow7
 bOlZEQZ/Io5xREDlwoMagLj8OaBKa9jbFRQ7hbkPnxRJxHIJC+LgxZDqYmDcIMiLxWVa
 Qz5FzwUOu29qxh2CNOmUnPQIzTxkswYrHSLvMsJIkhB2MxcspEWNkaVPtjw3VKbQ4sbi
 QFIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sIASLX0R2P23+j8OeRBs0Bj5TUjyqw9EM4B0ZPGTtVs=;
 b=ZJwSI+ARdWRiApIASYMvBe5q8VxoZrZK3Pj9NpOryuvyvN23bU3lInuIpNoo1uss+G
 IevGwDNv2rkoWr7E//UeysEWgUB42GFaotZS1USgFV0EYR9ZNwIa9t9eDfWKx5tJH3Gp
 C5a16yJr7hdPDca284ZR8BK2Un/xrTPumTlkIVUKlLg00GsnnpJABqyRDFlKKnjz3O3C
 S/HK5K0bOuPcIsBjHeASv/zRM/uetxoE4LemYd1e2ZojfT6TKU8insUVWvIm7V6TkWhY
 WHZi/bOJmUhEqvJ25iIjY29Foi5UvKEKUqCWG/qey5uS6CuVVwrosy/X1KczBb2XLBDw
 A9sQ==
X-Gm-Message-State: ACgBeo1zKb66ngbaUP8K2i4RkBxGCIMO9/pQfTYlFayp5gawPU/ImxtB
 chtfYj4pGAix5afNJI9/y8igbg==
X-Google-Smtp-Source: AA6agR6z2m0ul1bIB7gX6941qTm3iNigFl3vuOxonibB7cnEPzY+zddV4FHmw39XAXbj5dHUq1cq9Q==
X-Received: by 2002:a05:600c:35cc:b0:3a6:f08:9b1 with SMTP id
 r12-20020a05600c35cc00b003a60f0809b1mr5014747wmq.22.1662723052887; 
 Fri, 09 Sep 2022 04:30:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab?
 ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
 by smtp.gmail.com with ESMTPSA id
 r2-20020adfda42000000b002286231f479sm305722wrl.50.2022.09.09.04.30.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 04:30:52 -0700 (PDT)
Message-ID: <326dedc2-0e83-55eb-fe74-84d10b7769ce@baylibre.com>
Date: Fri, 9 Sep 2022 13:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/meson: Fix OSD1 RGB to YCbCr coefficient
Content-Language: en-US
To: Stuart Menefy <stuart.menefy@mathembedded.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
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

Hi !

On 08/09/2022 17:52, Stuart Menefy wrote:
> VPP_WRAP_OSD1_MATRIX_COEF22.Coeff22 is documented as being bits 0-12,
> not 16-28.

Thanks, Good catch !

> 
> Without this the output tends to have a pink hue, changing it results
> in better color accuracy.

Indeed, it was a regular issue reported.

> 
> The vendor kernel doesn't use this register. However the code which
> sets VIU2_OSD1_MATRIX_COEF22 also uses bits 0-12. There is a slightly
> different style of registers for configuring some of the other matrices,
> which do use bits 16-28 for this coefficient, but those have names
> ending in MATRIX_COEF22_30, and this is not one of those.
> 

Fixes: 728883948b0d ("drm/meson: Add G12A Support for VIU setup")
> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>   drivers/gpu/drm/meson/meson_viu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index 51df4de..876ffe0 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -94,7 +94,7 @@ static void meson_viu_set_g12a_osd1_matrix(struct meson_drm *priv,
>   		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF11_12));
>   	writel(((m[9] & 0x1fff) << 16) | (m[10] & 0x1fff),
>   		priv->io_base + _REG(VPP_WRAP_OSD1_MATRIX_COEF20_21));
> -	writel((m[11] & 0x1fff) << 16,
> +	writel((m[11] & 0x1fff),
>   		priv->io_base +	_REG(VPP_WRAP_OSD1_MATRIX_COEF22));
>   
>   	writel(((m[18] & 0xfff) << 16) | (m[19] & 0xfff),

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
