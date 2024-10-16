Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0A29A099C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9744310E054;
	Wed, 16 Oct 2024 12:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WaL1lnYN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9764210E054
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 12:26:57 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5c9709c9b0cso5283333a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729081616; x=1729686416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o5XkYbhD7GQ/UM3/ZFxDvMxdDBYYQYu99C2uqRsaiV8=;
 b=WaL1lnYNfhI4tYvWB3TBR8JCSWDmj1Drh+u1zo4pc1ecJ87YuSdQfxuLmSO2ChTLjp
 pGdlO6Lk4G5D+sgOj2qtOy6eaGVphdNUKCJh4sgKeBT0KH52gjbe/x67oX60aj4+aN5m
 rCzwr4UAD1JgjE57pEILALxPGbvu/tnFbl2N0bvh0663VhOfIGPHDWAEPjqqgp/OtjZt
 Lc3ECLeL7fbbIaz49JEZkqYi2FSDcz141z9fKiLaaSmZBrnNBWedrbSiqC8vQFg6Oq2D
 Vg/VH8fVBOddbXv8gRrEVdYj1CZi3xQSlTQBxi83bu0iEv3zyLcwpyLLKMVTdpxpM4MU
 zCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729081616; x=1729686416;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o5XkYbhD7GQ/UM3/ZFxDvMxdDBYYQYu99C2uqRsaiV8=;
 b=Rhw2JJeqh0F3R+XyjW8Z5GZ9Li2TDsZmcRRyyFXb0fg9qJnLCN2Y+bLDPHqc7vWowj
 q0en464AR9z638d8nlURo4RncXqeAyCFxrIkJeoTiODynGjKb2P6cgObrlXzQWAZSLpX
 xIX1RJxqeh5CUxG4DeFTw0pH7K1OwRhDxpZpCxdSBR4dBEVHLrbADFkSjeNeYLjRCaqq
 /49uvZbANuTG/Lm1XMynZ0O/VYlDud58DOzsgw6ekKo/xDSUPnPxo+zF6bGkh6TqxEQa
 wPrNGTuSo0B7adGGcxBeJyR7wbkf1wdKJYLEhPdoWBE1+lzyEQ/sH2RyxvJHshs59gzH
 aXzA==
X-Gm-Message-State: AOJu0YzqSmWAeAumkBdgHWl+VG/EkHBCf2nEZz7K92FNp9Al3N4w9zFI
 Nj0a1brJCi5jIobFmrDT92aY/pH2p4pdvsuctZtBS9Fpg2iomKIR
X-Google-Smtp-Source: AGHT+IFcnPGvv+07WP6skyv4hg/FfgbGscqMu7BmRbPY69IWoa1LmdxhGPZoAcM+AnYli8pZGFn0ow==
X-Received: by 2002:a05:6402:5210:b0:5c9:4a36:8f4e with SMTP id
 4fb4d7f45d1cf-5c94a369527mr13528544a12.25.1729081615530; 
 Wed, 16 Oct 2024 05:26:55 -0700 (PDT)
Received: from [192.168.42.132] ([81.95.8.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c98d4d63fesm1659905a12.13.2024.10.16.05.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Oct 2024 05:26:53 -0700 (PDT)
Message-ID: <8d35081d-74cd-4d4c-ae31-b3b4e8ce65de@gmail.com>
Date: Wed, 16 Oct 2024 14:26:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mediatek: Fix color format MACROs in OVL
To: Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dianders@chromium.org
References: <20241016-color-v2-1-46db5c78a54f@chromium.org>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20241016-color-v2-1-46db5c78a54f@chromium.org>
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



On 10/16/24 13:08, Hsin-Te Yuan wrote:
> In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
> OVL"), some new color formats are defined in the MACROs to make the
> switch statement more concise. That commit was intended to be a no-op
> cleanup. However, there are typos in these formats MACROs, which cause
> the return value to be incorrect. Fix the typos to ensure the return
> value remains unchanged.
> 
> Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> Changes in v2:
> - Clarify that the commit get fixed was intended to be a no-op cleanup
> - Fix the typo in tag
> - Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@chromium.org
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9cf7864728dcb63b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -65,8 +65,8 @@
>   #define OVL_CON_CLRFMT_RGB	(1 << 12)
>   #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
>   #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
> -#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
> -#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
> +#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
>   #define OVL_CON_CLRFMT_UYVY	(4 << 12)
>   #define OVL_CON_CLRFMT_YUYV	(5 << 12)
>   #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)
> 
> ---
> base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
> change-id: 20241015-color-e205e75b64aa
> 
> Best regards,

