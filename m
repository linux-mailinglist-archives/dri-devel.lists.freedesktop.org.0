Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4A66879DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 11:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76DBA10E038;
	Thu,  2 Feb 2023 10:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07BA10E4D5
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 10:12:11 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q5so1244714wrv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 02:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M/O8m3Tu7QUrsruCqpFCy7yupD/hlwqyVYceONRYcvI=;
 b=hW8BFD9Y0HleZOJn18fvxLUyprlrKHtILedP2aCNQxVNQ7lkb/QCJdzEw+Q6QGDJl2
 hrY1Ad3uUhkNbCrBTt55J3FtrhTyMqG23Xow/3UWIJb52H6XNRmF9+BAXiE3HdIEKZMS
 sNamuNi4fcEOrqO0ehj/GijImIubAM0XM295QV8XDqh8duQbfDIzVDvgtOJAOVinWGn8
 zv5E+Rs7BUDDymtHYRN9+J57u6VWEM6ITGBDvx3jURovt31FKicKWWjWpAg5E5Z9tkpE
 kzlFnbWVulhJSYXLcSPvZE1rcJTmgqziCklcEj6Yt7nmFogrmqa0j08vZRDuK6snEVCt
 Zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M/O8m3Tu7QUrsruCqpFCy7yupD/hlwqyVYceONRYcvI=;
 b=WnIPlGC0Z2bw5VSv/5fScV3js+TSyUUO9oXiX7bud8CVsRKNA7X9evtNt22s9sSTo1
 GEiLr6/P1h4SalCLE62qE7wHwd8A5LZhyfFpVK3Nen5YMul3G5GPUwKezb/IZkgialmh
 WKgoa6dlNQLHDkUFd/MBP46PfIfi6l8m1o5/3MqpvXin+jltrbhqSr4NHZhDesVMmpvU
 naxqKJQun6qjChKBeqfvaW82FUy5NK8jQXQkS3s1yvsMWcU7a8ci9H1USbaFPqjZbY7X
 a29UNEvue08WFzifZxf8rz6h2UwTVs9bGnx3Run4OtCDTiBTmpdefbkBXzeXV0BjgDym
 QUTw==
X-Gm-Message-State: AO0yUKVmi+RVbuOoZvkONArPsUYvQGNe2Zec0Ixu0VVNoiSwfKc2b/88
 pWZqh1HaAHGW6DB25gc692g=
X-Google-Smtp-Source: AK7set9qcgtdgwtBCY3bAUh8GE68YA23k6QCIv1vg30Gu+HIyXv2tpL3Z+BQyuAeCqdFXDcqDDzw0Q==
X-Received: by 2002:a05:6000:1f0f:b0:2bf:bbd1:1db3 with SMTP id
 bv15-20020a0560001f0f00b002bfbbd11db3mr5187356wrb.44.1675332730446; 
 Thu, 02 Feb 2023 02:12:10 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe4ce000000b002bfafadb22asm20143890wrm.87.2023.02.02.02.12.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 02:12:09 -0800 (PST)
Message-ID: <e938bbee-3a93-6e08-c5d7-5b5b346062b1@gmail.com>
Date: Thu, 2 Feb 2023 11:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] drm/mediatek: Enable AR30 and BA30 overlays on MT8195
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-4-greenjustin@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230201170210.1253505-4-greenjustin@chromium.org>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 01/02/2023 18:02, Justin Green wrote:
> Tested using "modetest -P" on an MT8195 device.
> 
> Signed-off-by: Justin Green <greenjustin@chromium.org>
> ---
>   drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index a6255e847104..7d26f7055751 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -85,6 +85,22 @@ static const u32 mt8173_formats[] = {
>   	DRM_FORMAT_YUYV,
>   };
>   
> +static const u32 mt8195_formats[] = {

I'd call it mt8195_ovl_formats, to make it explicit that it's only for the OVL.

Regards,
Matthias

> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_ARGB2101010,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_BGRA1010102,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +};
> +
>   struct mtk_disp_ovl_data {
>   	unsigned int addr;
>   	unsigned int gmc_bits;
> @@ -616,8 +632,9 @@ static const struct mtk_disp_ovl_data mt8195_ovl_driver_data = {
>   	.fmt_rgb565_is_0 = true,
>   	.smi_id_en = true,
>   	.supports_afbc = true,
> -	.formats = mt8173_formats,
> -	.num_formats = ARRAY_SIZE(mt8173_formats),
> +	.formats = mt8195_formats,
> +	.num_formats = ARRAY_SIZE(mt8195_formats),
> +	.supports_clrfmt_ext = true,
>   };
>   
>   static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
