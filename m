Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B0C9F78F7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 10:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72AF710E478;
	Thu, 19 Dec 2024 09:51:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="i3d4cpaX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C1A10E2A3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 09:51:17 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-71e1e051e50so155385a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734601876; x=1735206676;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7lsL5MvpyUJT/g7OPRNEEH9d17/70n2QS/pZPS+4W0Y=;
 b=i3d4cpaXbnxBUpocuo+9SMCW+QHVBcGXbWemit06Pyu7N5T9YgDDiof5BFdGdxmcCo
 JHXZdGin+okMr8m0eUC5d4aV9iLAf9KlnusbWwHtMTpvhnOhQJQ4uwTU/Pr+u6NoStKp
 8TOKQbS4a1Hz+iLd4Qu78kXCZM7hXQfQlhnBoL2HbiyjSBAalNcHcMdrqvUczO2Npf6v
 R3hxt+tAxUG5Lqp20lreE4zVxG6Pbkd4ZbfHNIipB3vIyfFIRWF4eIMWUgkqBabzIGKx
 kOJQmPkN5/Fc7dYic7W4UTdDFjx/TDVgOIz93vuArGGP5m9PemOcuOlKf/CfXRMw9Qci
 qgmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734601876; x=1735206676;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7lsL5MvpyUJT/g7OPRNEEH9d17/70n2QS/pZPS+4W0Y=;
 b=Runr4/W4i/YloRUFKrgYOamyGuzOJzzIighGYGKjb3ptj8894xzS+kKiYGuZx38auB
 062Hv1zL2JuSukjwoZcuoENXD/w/iefxG/k5h3ClTN9QZiGx4YGgjA2wAwvKcbbRX4YA
 4xEwfHwYQToqsfdlzMkWm348cRZnwYLQtrQ6uIJGpxeuP/kCZbBymb/6OAjDs01xtYi1
 GKQEApAneNPbNbTyVcb5REeLuwrSD4WYAvHHqFAbANwKOdqVlywKoxMuM73HSrXs8484
 gh0Sxndtob2GtMIWVinPmLW5EfkcCeQ5W7tw4JqFRd2PkV1VoMSAJQOVTgsTzeRCMy8n
 /kTg==
X-Gm-Message-State: AOJu0YziEgANieDxxrZ9BQzCIIstWU6ywZq3Ak3LO+MrWN+zv6s0YAuz
 GzcBc7aEfraPn74IENzYnAuw9lZFjJbeDRATbT58eJAxGVIdnkh0b0ZAPfp4GjQoRBBLta+a7h7
 RHG+3m934yG5hT8ShOothQv8E5gi1vQxMWbCOjQ==
X-Gm-Gg: ASbGncuvtCI4K2+XPQ3nsohKeEi86f60hxWdVZl0bNYehmZDesU7NmMaMNlkHLBCnU7
 zJoDTELFAM+UAb2FbAs7BaHdZz2whbwrZ9etH
X-Google-Smtp-Source: AGHT+IEy79LXyiT2op8bTAdUEawSGOv+z8DC4vTnwhR7g9WzIVoZpBiDFmT+ifNeJg1xtzw9VNaK+cZyVwT46kQSRM8=
X-Received: by 2002:a05:6871:e786:b0:29e:255e:9551 with SMTP id
 586e51a60fabf-2a7d074d490mr1547605fac.2.1734601876589; Thu, 19 Dec 2024
 01:51:16 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 Dec 2024 03:51:16 -0600
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.10
References: <20241218113448.2992-1-liankun.yang@mediatek.com>
In-Reply-To: <20241218113448.2992-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Thu, 19 Dec 2024 03:51:16 -0600
Message-ID: <CABnWg9uvQ4_vxYx-_8AKE_CvLgKd04LuvS1qvKwyMHvBck7_cw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Add return value check when reading
 DPCD
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 ck.hu@mediatek.com, dmitry.osipenko@collabora.com, rex-bc.chen@mediatek.com, 
 jitao.shi@mediatek.com, mac.shen@mediatek.com, peng.liu@mediatek.com, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 18 Dec 2024 12:34, Liankun Yang <liankun.yang@mediatek.com> wrote:
>Returns the number of bytes transferred (1) on success.
Hi Liankun,

I'm not sure this statement above is true, you are not returning the
number of transferred bytes?


Aside of that little nitpick

Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>

>Check the return value to confirm that AUX communication is successful.
>
>Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
>
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V3:
>- Using drm_dp_read_sink_count() to improve patch.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20241128030940.25657-1-liankun.yang@mediatek.com/
>
>Changes in V2:
>- Modify Fixes in Commit Message.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++---
> 1 file changed, 2 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 36713c176cfc..b26dad8783be 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2100,7 +2100,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
> 	enum drm_connector_status ret = connector_status_disconnected;
> 	bool enabled = mtk_dp->enabled;
>-	u8 sink_count = 0;
>
> 	if (!mtk_dp->train_info.cable_plugged_in)
> 		return ret;
>@@ -2115,8 +2114,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	 * function, we just need to check the HPD connection to check
> 	 * whether we connect to a sink device.
> 	 */
>-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>-	if (DP_GET_SINK_COUNT(sink_count))
>+
>+	if (drm_dp_read_sink_count(&mtk_dp->aux))
> 		ret = connector_status_connected;
>
> 	if (!enabled)
>--
>2.45.2
