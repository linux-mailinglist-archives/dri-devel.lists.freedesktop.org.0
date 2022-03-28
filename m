Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F034E8FB1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 10:04:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA9410E5CC;
	Mon, 28 Mar 2022 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB4210E5CC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:04:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6A11F1F42F03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648454668;
 bh=OgeZn3h62XRwSUZAUHSs6JjYPCvTevBe27bS/7gUpUU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RYSAAir6nrRU1Bv61iSlbrH6+U+cZjsjYqInwDj/OIUQpvqrymdIIn/bg8TvOTvun
 U7K6MQUOZmaOMEzQ2bOcq3rv7glozuTwUnHAADB55ZmlByZyawn3Oh8hklLJuEM/Fx
 F8jZNLKTAGZtBTykPIf/+nsEWBtpa7Tsp9kI05bCOHix34dlzPJzC/JZhl9dDjju0s
 XHADgeqcLyRs9PlPLGlclF5ilyASiSDqC/pggNZRefQahGSBi2D0E7klkS4cHtNhZm
 /t6CjUsFLlXSRFX2MhoHYXteDVyOGWJfhOKBmdRv9UNBkfBBGkiALXB/7UjOL0QFye
 BoNjq6IFiSFcg==
Message-ID: <0c523ad5-6a71-5c71-17b8-1f15c1860d89@collabora.com>
Date: Mon, 28 Mar 2022 10:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v9 04/22] drm/edid: Convert cea_sad helper struct to
 kernelDoc
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, airlied@linux.ie,
 chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org, ck.hu@mediatek.com,
 daniel@ffwll.ch, deller@gmx.de, jitao.shi@mediatek.com, kishon@ti.com,
 krzk+dt@kernel.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, p.zabel@pengutronix.de,
 robh+dt@kernel.org, tzimmermann@suse.de, vkoul@kernel.org
References: <20220327223927.20848-1-granquet@baylibre.com>
 <20220327223927.20848-5-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220327223927.20848-5-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, markyacoub@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/03/22 00:39, Guillaume Ranquet ha scritto:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   include/drm/drm_edid.h | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index 144c495b99c4..5d4d840b9904 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -359,12 +359,17 @@ struct edid {
>   
>   #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
>   
> -/* Short Audio Descriptor */

Hello Guillaume,

> +/* struct cea_sad - Short Audio Descriptor.
> +	@format: See HDMI_AUDIO_CODING_TYPE_*.
> +	@channels: max number of channels - 1.
> +	@freq: See CEA_SAD_FREQ_*.
> +	@byte2: meaning depends on format.
> +*/

I appreciate the effort, but this is not valid kerneldoc.

Please refer to https://docs.kernel.org/doc-guide/kernel-doc.html

Regards,
Angelo
