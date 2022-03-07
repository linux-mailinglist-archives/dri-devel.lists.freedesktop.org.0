Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF624CF385
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 09:30:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D220610E1E6;
	Mon,  7 Mar 2022 08:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103CD10E1E6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 08:30:27 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p9so21902456wra.12
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Mar 2022 00:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rx8yLAgwRWd5HxxwxNM22XOGHWHvMO2UWDFHTxYRPbY=;
 b=PzxsUr8GCskd/ha2XcgDg2QL4P+bOwFIly3XBO/Xt9YzrrwjfIAQ4g14SPqNycRmtF
 coDdMoft9V5Xcra7GNPqyIhV61IfFJmB0VF0WY3P5NHsaNu/XApWteGTv41D7x33HcKC
 YFB74IGzfnd550j4pufrL3MtFsKRa8NiWeZJ9hYtYsopK8NbRbhySPUqlrm8sEoLXqun
 gTTl1y6LWuJLVuZmfEyuDHNe9iSRaEaSVi5WMxoo/6Ol6a2HAEPAQRHSVmXmqWsWMQgy
 lrwkhIs/0M0CAzxmDamIj7PXC64Mrn1AZC7QbygUj0QeS8SRMDGfVcXGhEpX8/BXaduY
 z5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=rx8yLAgwRWd5HxxwxNM22XOGHWHvMO2UWDFHTxYRPbY=;
 b=XAdOXqWtseMKh2D8w7dPoomAXpyzZgFxRYtk5eeBiQSVQn9CvgrRXYpFiCwZAo/M9+
 kfKOd1KUE7C3iWzdPaTvls3vhmIQ6r1evgIg7ZbkxaE2HTGhjI0g9vidbtQV6fx/O+dA
 NC6vAVztghHyULwXN+23ZZt/GF3IvtQ0VIqmYR0ZsxQw+1DbKL51jEDScIoPVWe7WMz0
 2IubYDQInhgxlQyeSUjD8K/7ICYwZzDWJtmDGgHX56biqCIhhv8R4zfCHh16NBiO46YQ
 9etxJCyGBpoExQrfV2MWLNtvsb9/Md+RC2uf3PJ0LjbbjDBgysiRHIZdcESewDmgZj7U
 xjmQ==
X-Gm-Message-State: AOAM530tKDEXP6L3S50vzx7S9xfP44r71BST22ytoweeydKRc4lc+Rhk
 GloEU4ppstFT3ibassF1IyzcBA==
X-Google-Smtp-Source: ABdhPJzvPc5TFTjp2S5kZK8I2dRki97feHPUxjcD/hGdln5ABt4ZLetFTLKJr6PSASZR3EMjTSh7gQ==
X-Received: by 2002:a05:6000:1ac7:b0:1f1:f9ee:7c57 with SMTP id
 i7-20020a0560001ac700b001f1f9ee7c57mr1730287wry.52.1646641825489; 
 Mon, 07 Mar 2022 00:30:25 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096?
 ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 r187-20020a1c44c4000000b0038377fb18f8sm21189154wma.5.2022.03.07.00.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:30:25 -0800 (PST)
Message-ID: <af4cffb7-a519-dea1-4b82-f00e9603ce84@baylibre.com>
Date: Mon, 7 Mar 2022 09:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: Drop commas after SoC match table sentinels
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
 <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <298f0644275d7d0b4aa3ee7143756a2431a4900c.1646311443.git.geert+renesas@glider.be>
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
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/03/2022 13:44, Geert Uytterhoeven wrote:
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/gpu/drm/bridge/nwl-dsi.c  | 2 +-
>   drivers/gpu/drm/meson/meson_drv.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
> index 5abb5ec3de467458..846df1ee7a2888cb 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -1151,7 +1151,7 @@ MODULE_DEVICE_TABLE(of, nwl_dsi_dt_ids);
>   static const struct soc_device_attribute nwl_dsi_quirks_match[] = {
>   	{ .soc_id = "i.MX8MQ", .revision = "2.0",
>   	  .data = (void *)E11418_HS_MODE_QUIRK },
> -	{ /* sentinel. */ },
> +	{ /* sentinel. */ }
>   };
>   
>   static int nwl_dsi_probe(struct platform_device *pdev)
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 26aeaf0ab86ef932..35eaa669e8fe0c2a 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -167,7 +167,7 @@ static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
>   		},
>   		.attrs = (const struct soc_device_attribute []) {
>   			{ .soc_id = "GXL (S805*)", },
> -			{ /* sentinel */ },
> +			{ /* sentinel */ }
>   		}
>   	},
>   };

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Tell me if you want me to apply it to drm-misc-next.

Thanks,
Neil
