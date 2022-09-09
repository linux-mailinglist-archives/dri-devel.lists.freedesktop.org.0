Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773295B3650
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C7D10EC9A;
	Fri,  9 Sep 2022 11:28:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD5310EC9A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:28:21 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id bq9so2232093wrb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Sep 2022 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=woBZw+XonV0Wc5qhjXcMw+kc+9HKENdHdC390sUdFNc=;
 b=CJplOplyAgy/Vnq0Ovubf6ZmFSNmgvIHDH6Gz2pXyPAYV3zCIZpBNn7CjwI8ssgrqw
 5pe6G9ZH2SnhW/sKmnhkuCtDFiG7LS094v3vNgNqtpX8ZEyKyCeHRQ7tMTUT/1CoY+0E
 2ESenDcG3ddIMi6ZwvDF+QFXUuxBcWVSmTg0iKIwOaF1jIbvW+IXBa1ZCHf9ydTwjMcV
 kaom5lcMmT9nQFcvDuTZ2vX3NTkT3fM0RyIM5Y7mn4SmXodyaqwD8XAEsDPWcX6JO0YI
 YfJzELN9gXMw5i8MRZbnkVYXjIk30Sv9hYwXKsYokjyGMARLWGFiPYFC0uP9hDqT7b4c
 OkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=woBZw+XonV0Wc5qhjXcMw+kc+9HKENdHdC390sUdFNc=;
 b=a7PNK9zAAPyOE2eCCiS2rU/JqvANbF7BCecrdwy1M38TsUJ/7u2roWj/IC061ERfLz
 NkhgHJWs4/zFbfSmswXZsgDlie/pVaFJRiAt+2ilLkqNS+fI4+Uz6Kg4snD04nPzuUeo
 5TGDViCrveCgS8M2dj3AdnF/6iBgDwTS/b35OWEvsjwhBmGUbR4dPTHgj8AyATrZor9v
 +tKyBL/EuZfd5qQQsMmcPDIvHDM8teK1KxvuKuCxj+yBPAJsf5wzzQQPM2J8GQScIYo2
 RBryCgfSmda6o9VAQS5GXEwAv6eQOPYDZ+JrlFN2/G6D22jucVFJkBhJSWR01xaK4A0v
 FtYA==
X-Gm-Message-State: ACgBeo3qY1ZQO1ax3yO/l0UCKs+oUx9USa8gJB0apjyMgkSKD4w8+Kps
 geytddwRG5VU4yTCEdRFuZGkHYNroz5ceNpc
X-Google-Smtp-Source: AA6agR55oRIIYdaAGAIVusivzoDiLjqbkaH4/1As5zVRm7+2An/RNlFPdwa+FcvHJz1TcqoKmZQ4qQ==
X-Received: by 2002:a5d:6c6e:0:b0:225:5a20:1bd1 with SMTP id
 r14-20020a5d6c6e000000b002255a201bd1mr7652932wrz.717.1662722899518; 
 Fri, 09 Sep 2022 04:28:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab?
 ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
 by smtp.gmail.com with ESMTPSA id
 h189-20020a1c21c6000000b003a845621c5bsm318327wmh.34.2022.09.09.04.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 04:28:18 -0700 (PDT)
Message-ID: <595e620a-1d0d-73e7-cd20-79b145727a70@baylibre.com>
Date: Fri, 9 Sep 2022 13:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/meson: Correct OSD1 global alpha value
Content-Language: en-US
To: Stuart Menefy <stuart.menefy@mathembedded.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220908155103.686904-1-stuart.menefy@mathembedded.com>
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

Hi,

Thanks for submitting this patch !

On 08/09/2022 17:51, Stuart Menefy wrote:
> VIU_OSD1_CTRL_STAT.GLOBAL_ALPHA is a 9 bit field, so the maximum
> value is 0x100 not 0xff.

Indeed it's 9bit, but all bits to 1 would be 0x1ff then, but indeed vendor
uses :
#define OSD_GLOBAL_ALPHA_DEF 0x100

> 
> This matches the vendor kernel.
>
Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")

> Signed-off-by: Stuart Menefy <stuart.menefy@mathembedded.com>
> ---
>   drivers/gpu/drm/meson/meson_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
> index d5cbc47..45088f0 100644
> --- a/drivers/gpu/drm/meson/meson_plane.c
> +++ b/drivers/gpu/drm/meson/meson_plane.c
> @@ -163,7 +163,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
>   
>   	/* Enable OSD and BLK0, set max global alpha */
>   	priv->viu.osd1_ctrl_stat = OSD_ENABLE |
> -				   (0xFF << OSD_GLOBAL_ALPHA_SHIFT) |
> +				   (0x100 << OSD_GLOBAL_ALPHA_SHIFT) |
>   				   OSD_BLK0_ENABLE;
>   
>   	priv->viu.osd1_ctrl_stat2 = readl(priv->io_base +

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
