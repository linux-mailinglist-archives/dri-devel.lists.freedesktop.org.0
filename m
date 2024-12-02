Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FE09DFD58
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 10:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED8710E68C;
	Mon,  2 Dec 2024 09:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rGLF/QZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6457010E68C
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 09:38:09 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-71d40573d03so1557064a34.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2024 01:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733132288; x=1733737088;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=;
 b=rGLF/QZ5E/oNad9mxGuArxqtGSpLcfDh3jRVDF4ouapAysxQKI9EPi4Onwicc0oKYl
 w3/1V63RYflXZde0x4koOpTuoA6WJD3KSifo0MPI6CibarWTYCWLvOQWa5L4Sl0w39VE
 e7UhibPR0a7ZasYuPMXbvzz+xUb1oLlz2br0uOE3Zk+FumdX5A0PmHPsuTPMiAj5SCCG
 u9wU9pnMh9w7wmVKy5wx0t4EKb9ay09ELn/Ing6gzx1P+xWsuEJ7pKhkRRyW5vuZwvv7
 DNWE39bZ8+jo565wZTw35Las5q/NeKDKK2SOEzIEtQAx9RknInit9zsL5hQJ8l8Ut3ZO
 8jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733132288; x=1733737088;
 h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
 :user-agent:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTAHukQDOhRmCnoHVRWCZSaR6X9fYnJA+kiQMKbXQ6U=;
 b=MJggFFPjvyCh5qBF430i1U323COwPUJ7mXLRd7wzBKrwr1NaipxwvsGliYGVe/uZPI
 ztkGqWcvF3glaXJxXBidf7n2Q/fS/ixL8GDq7oWipolE+s1rywUo7m274TbCoyTlzdOZ
 mRq/sIAGEC+5cM0bDnZWfIHm8SFQsG+b3kdBAqMmAsiAh9pY4YDjAyUZbd+mA7+dW1Jm
 zZuWFjrfmJNA9C8eeYLCcVmHroYhJeivWpbYlQyDXY0VtjYsBF3ukpVjBe/XGHcDxhX5
 ZmcVANnBuwtMsP2JhmmnXJAWtwTBthc80xK4/u6y0NljhGjQGMnq/MFsQgzSzgL+nSb4
 SfVg==
X-Gm-Message-State: AOJu0YzF0oULE8kWi4IR+V5KBf9tai8VzavY4RyCAqBl0S4LOScrK58b
 71pDjImwuKRK4sMLUjTVepXz0VDxLyUc5SugdFhg+uMZkq1Q3cpVbOxdBiLuelbiqsyrV5cuWag
 Onn0fdNy10HNa0krWYzv4Vt5kst/w4Xgu43HWTw==
X-Gm-Gg: ASbGncsduAKLKE0OMaYbGaYENEd6MyUe2YP8cPXuZ2AVblvxfp+RFaugn1kfGUcuEj6
 p/R6UrqtgqOv8pfwNmbp8g86v1B0T2w==
X-Google-Smtp-Source: AGHT+IGFYBkRu+t9Rgm8uEYvRACv3R8GZFuyUPEoCQ2kFsszRxvWlytkFAb4tTArftXgRYmzaFXCGr9/hwxPw8QMZIA=
X-Received: by 2002:a05:6830:6d84:b0:71d:559d:de29 with SMTP id
 46e09a7af769-71d65cce8femr13291782a34.17.1733132288329; Mon, 02 Dec 2024
 01:38:08 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Dec 2024 03:38:07 -0600
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.8.9
References: <20241128030940.25657-1-liankun.yang@mediatek.com>
In-Reply-To: <20241128030940.25657-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Date: Mon, 2 Dec 2024 03:38:07 -0600
Message-ID: <CABnWg9tDMkKkFbQpL8YphOBu3_2zr_q4YASnO-UYMrdM22wCuQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Add return value check when reading
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

On Thu, 28 Nov 2024 04:08, Liankun Yang <liankun.yang@mediatek.com> wrote:
>Returns the number of bytes transferred (1) on success.
>Check the return value to confirm that AUX communication is successful.
>
>Fixes: d9e6ea02fc3f ("drm/mediatek: dp: Add MT8195 External DisplayPort support")
>
>Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
>---
>Changes in V2:
>- Modify Fixes in Commit Message.
>Per suggestion from the previous thread:
>https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.5385-1-liankun.yang@mediatek.com/
>---
> drivers/gpu/drm/mediatek/mtk_dp.c | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
>index 1cc916b16471..9dc68ec2ff43 100644
>--- a/drivers/gpu/drm/mediatek/mtk_dp.c
>+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
>@@ -2101,6 +2101,7 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	enum drm_connector_status ret = connector_status_disconnected;
> 	bool enabled = mtk_dp->enabled;
> 	u8 sink_count = 0;
>+	size_t value;
>
> 	if (!mtk_dp->train_info.cable_plugged_in)
> 		return ret;
>@@ -2115,7 +2116,12 @@ static enum drm_connector_status mtk_dp_bdg_detect(struct drm_bridge *bridge)
> 	 * function, we just need to check the HPD connection to check
> 	 * whether we connect to a sink device.
> 	 */
>-	drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>+	value = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
>+	if (value < 0) {
>+		drm_err(mtk_dp->drm_dev, "Failed to read DP Sink Count: %zd\n", value);
>+		return ret;
>+	}
>+
> 	if (DP_GET_SINK_COUNT(sink_count))
> 		ret = connector_status_connected;

Hi Liankun,

thx for your fix.
I think your patch could be improved by using the drm_dp_helper
function drm_dp_read_sink_count() ?

Thx,
Guillaume.

>
>--
>2.45.2
