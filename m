Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF6B714665
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 10:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ADD10E03A;
	Mon, 29 May 2023 08:40:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76B8210E03A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 08:40:24 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown
 [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 73B8A6605961;
 Mon, 29 May 2023 09:40:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1685349623;
 bh=9ApkdS7663n45aSbnjR212X9+KL8lAWgYFe+AiYnwmY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=i2E0/49G7/6Z8J9cECpKX/kE53gqrMX51hEzU+35JtS8sXijVIO3VU3mkqmw4upcZ
 2lJDMfoKcFP+uS4RD9xUMqt+yO3aYMetPnPjfWUtF0d9pjq8W5ZN+zaRX+fn8IyTM7
 lK0ndchByNQvdBc+iGFNm/edUR03ovZC/fvdzkT7bARlhrb7rZeqbHVj9XSCQBWdnO
 HfC4ZhiS/PXkfRp4T61gFC3+644IxXSELc8GCr5sSlFp6ZCZdaNwYuZzUrheyfLSeM
 eOp6deD3lXrpEylyEvuxHyyn16u5ewYgnrwLZLJiUSUZ9hJzn1EKvXK5ORb9yglKmj
 Z+vh4RAEbbl+Q==
Message-ID: <66d2943f-a9a7-274b-eb00-24e8de63eb00@collabora.com>
Date: Mon, 29 May 2023 10:40:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/3] dw-hdmi: remove dead code and fix indentation
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 narmstrong@baylibre.com, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
 rfoss@kernel.org, andrzej.hajda@intel.com
References: <20230528140001.1057084-1-adrian.larumbe@collabora.com>
 <20230528140001.1057084-4-adrian.larumbe@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230528140001.1057084-4-adrian.larumbe@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 28/05/23 16:00, Adrián Larumbe ha scritto:

I agree that the title almost says it all, but please add a commit description.

Regards,
Angelo

> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 22 ++++------------------
>   1 file changed, 4 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 1afb8f2603a0..0accfb51509c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -49,20 +49,6 @@
>   
>   #define HDMI14_MAX_TMDSCLK	340000000
>   
> -enum hdmi_datamap {
> -	RGB444_8B = 0x01,
> -	RGB444_10B = 0x03,
> -	RGB444_12B = 0x05,
> -	RGB444_16B = 0x07,
> -	YCbCr444_8B = 0x09,
> -	YCbCr444_10B = 0x0B,
> -	YCbCr444_12B = 0x0D,
> -	YCbCr444_16B = 0x0F,
> -	YCbCr422_8B = 0x16,
> -	YCbCr422_10B = 0x14,
> -	YCbCr422_12B = 0x12,
> -};
> -
>   static const u16 csc_coeff_default[3][4] = {
>   	{ 0x2000, 0x0000, 0x0000, 0x0000 },
>   	{ 0x0000, 0x2000, 0x0000, 0x0000 },
> @@ -856,10 +842,10 @@ static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
>   
>   	if (pdata->enable_audio)
>   		pdata->enable_audio(hdmi,
> -					    hdmi->channels,
> -					    hdmi->sample_width,
> -					    hdmi->sample_rate,
> -					    hdmi->sample_non_pcm);
> +				    hdmi->channels,
> +				    hdmi->sample_width,
> +				    hdmi->sample_rate,
> +				    hdmi->sample_non_pcm);
>   }
>   
>   static void dw_hdmi_gp_audio_disable(struct dw_hdmi *hdmi)

