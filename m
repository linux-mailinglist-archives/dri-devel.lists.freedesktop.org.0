Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6E979665
	for <lists+dri-devel@lfdr.de>; Sun, 15 Sep 2024 12:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1733010E021;
	Sun, 15 Sep 2024 10:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ld0neYkA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E28910E021
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 10:55:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-42cb806623eso30402705e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Sep 2024 03:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726397703; x=1727002503; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KfJHt9roWykgi6iCo8OJXtKub6FZQX7k2pQODR1XVPY=;
 b=ld0neYkAd5DsQQBBTwM//URAIfRG2DPqxqc810HGWCfiX2ULAslNqlbfnmrv5zfWF0
 X85EfPmkeH69Bii1/K7aurppSB8LmUUNuUAfoz6Pev6npR3yMwj8B0V7rmlmlBmaiCCV
 RF0WB1dV3n5I2nLyrhWXR8Y1aC1FNbLM8Onx/imsaRJyzpOiX8eAO0i/9MS0jja5J/We
 7yDj77NJLDVI7Bdk+YNNouag/TiFkwbySSes3xoARGd3HkbyalUSfiaZODpwBcXg5IZE
 sOVHYm2Ju8wlcd8oF3LXPFRcAvyxivuAiHGEwKiRO1u6CMRApC35F4pTCbELc+gg6Mez
 CIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726397703; x=1727002503;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KfJHt9roWykgi6iCo8OJXtKub6FZQX7k2pQODR1XVPY=;
 b=Wf2YyddWO+2/BzaURLjyb+cQ4MHew8G74ilEaHtPBmoP9a+lu0r+sJXYMyoFTOpRaS
 zYyfBXqYEneuiiNc8Bha8NDTbVpTNDYCKyPzXBDKdqMVApnOEDqyyTHSY290cMa5fsQ1
 NaY2Q2NVC3sKDhtvBaCPAgs5Va4K9quI2pfCT/6g5i8dY+pFwL6qtOJJXjgTiok8EG/A
 qjQ8/4yiq8Jc+ELOHTPvGL4TCbJhFAiAEbv1quOf9wV6w23yoxXsHYKZF2K1oC1YT69R
 dJK1MiVEeYbis7l2e3ckFJdvdMR8bvM31lhS1irrgJ8/L9KxlcOJeM20iaYC7BUN4i62
 rX3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+GqMZPThoo11zdB1dO5PrbAUhhNNgJFhsEPrSL8oFq4iU1rbnDnBm4M1VE5q5H6GvKb9YJqnKfP0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybfDBo7CkHQbq6H+o4lpl4jp6EW4AXBJwSED0iS7iF3XN8W9QF
 bNdoeLmW6njrrAn75iPere6ZKhqQ7x2Kc8wH8I/W/E+iPnwTeybr
X-Google-Smtp-Source: AGHT+IE7YoEPsvKgdohHfPyJvwpQ7Im0rUIBUpBdVjvxGocvco6SAce7YBX2SYunJXDZO0VL5oYdrg==
X-Received: by 2002:a5d:5e12:0:b0:378:c2f3:defd with SMTP id
 ffacd0b85a97d-378c2f3e021mr6334242f8f.13.1726397702891; 
 Sun, 15 Sep 2024 03:55:02 -0700 (PDT)
Received: from [192.168.0.10] ([178.233.24.52])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b87a9sm46384925e9.6.2024.09.15.03.55.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 03:55:02 -0700 (PDT)
Message-ID: <c8f8d556-77bf-4b60-abd9-bfcf7ac40ac5@gmail.com>
Date: Sun, 15 Sep 2024 13:54:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: ovl: Add fmt_support_man for MT8192 and
 MT8195
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Shawn Sung <shawn.sung@mediatek.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Singo Chang
 <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240914201819.3357-1-jason-jh.lin@mediatek.com>
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <20240914201819.3357-1-jason-jh.lin@mediatek.com>
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

Hi,

On 2024-09-14 23:18 +03:00, Jason-JH.Lin wrote:
> OVL_CON_CLRFMT_MAN is an configuration for extending color format
> settings of DISP_REG_OVL_CON(n).
> It will change some of the original color format settings.
> 
> Take the settings of (3 << 12) for example.
> - If OVL_CON_CLRFMT_MAN = 0 means OVL_CON_CLRFMT_RGBA8888.
> - If OVL_CON_CLRFMT_MAN = 1 means OVL_CON_CLRFMT_PARGB8888.
> 
> Since OVL_CON_CLRFMT_MAN is not supported on previous SoCs,
> It breaks the OVL color format setting of MT8173.
> So add fmt_support_man to the driver data of MT8192 and MT8195
> to solve the downgrade problem.
> 
> Fixes: a3f7f7ef4bfe ("drm/mediatek: Support "Pre-multiplied" blending in OVL")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 28 ++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 89b439dcf3a6..aa575569f996 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -70,10 +70,18 @@
>  #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>  #define OVL_CON_CLRFMT_YUYV	(5 << 12)
>  #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> -#define OVL_CON_CLRFMT_PARGB8888 ((3 << 12) | OVL_CON_CLRFMT_MAN)
> -#define OVL_CON_CLRFMT_PABGR8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP)
> -#define OVL_CON_CLRFMT_PBGRA8888 (OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_PRGBA8888 (OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_PARGB8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					((3 << 12) | OVL_CON_CLRFMT_MAN) : \
> +					OVL_CON_CLRFMT_ABGR8888)

Should be OVL_CON_CLRFMT_ARGB8888 (*RGB* vs *BGR*)?

Otherwise I still see broken colors, but in blue instead of red.

> +#define OVL_CON_CLRFMT_PABGR8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					(OVL_CON_CLRFMT_PARGB8888 | OVL_CON_RGB_SWAP) : \

Compile error, likely (OVL_CON_CLRFMT_PARGB8888(ovl) | ...)?

> +					OVL_CON_CLRFMT_ABGR8888)
> +#define OVL_CON_CLRFMT_PBGRA8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					(OVL_CON_CLRFMT_PARGB8888 | OVL_CON_BYTE_SWAP) : \

Same as above, OVL_CON_CLRFMT_PARGB8888(ovl)

> +					OVL_CON_CLRFMT_BGRA8888)
> +#define OVL_CON_CLRFMT_PRGBA8888(ovl)	((ovl)->data->fmt_support_man ? \
> +					(OVL_CON_CLRFMT_PABGR8888 | OVL_CON_BYTE_SWAP) : \

Same as above, OVL_CON_CLRFMT_PABGR8888(ovl)

> +					OVL_CON_CLRFMT_RGBA8888)
>  #define OVL_CON_CLRFMT_RGB565(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \
>  					0 : OVL_CON_CLRFMT_RGB)
>  #define OVL_CON_CLRFMT_RGB888(ovl)	((ovl)->data->fmt_rgb565_is_0 ? \

With those changes, colors are fine on my MT8173, MT8183, MT8186 
Chromebooks.
