Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE26153FF3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1616FA02;
	Thu,  6 Feb 2020 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf4a.google.com (mail-qv1-xf4a.google.com
 [IPv6:2607:f8b0:4864:20::f4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 186F16F4F9
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 09:38:17 +0000 (UTC)
Received: by mail-qv1-xf4a.google.com with SMTP id p3so1122746qvt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 01:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=bbLPD11pJNP7z0qv5E33IZM/9P32aN1BiTDiclSD91ktgW9ymyd0g4owTP4KK+LwzR
 K+WhzY9i2aokt6o2xdpnl66xUsaFQ/cDWKeK+44fu2Pbcy4K9+6h5BaapO4wA5UWfHnl
 qbqglmyx1tjGdqR9cBn07Y7vtOUMKq+ekzWw0ihual64ADtttR8wm0JHH22mQjQLk9tZ
 EVwoS/Og+xRMjTYucYE69Vgyhtn/5WFTpOFLwW0YekDxIDgqEr9i0CBXDjAlmbK9emD5
 7EQH5+S2WcyAw6vWVOxga4H6jbS447UNf1GPb9C0PdxteybJaxwfpgzXs94lyNCrOIN2
 Hq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=tBXcSAsufXkXOuW9PvUV+Wh6rVuOGvvy2T2JHVeF07hPXzp5Hgnxe9fvHqNsFuwVgc
 ARiIKtIOhkVGmCjaSk1190LZfdTct9AIXLQzEwV34zGWbfNNpgRKEev0RoXSH/kMD4dS
 grwAyuOPQm0qYBxTxspXqv3++lTXeMzDXwNgR6pNQsjsKtQMn4gwUtOnSZlbxAB298Og
 ZesnNNOO4CY1dBJNDz8VfX+0l/VNwoQGujMm1d1kjK8ZDyS4n50NEH7rw7rbFJqZELET
 W0ibxUyQ19nxOSYuV4M/mqLomNXi2dS7H0yN6ZMgD9TP00cVEMajxwXC2/rrZYq7s1Sm
 2T9w==
X-Gm-Message-State: APjAAAUDuzp5jUsjCUs9ofePpa+l+lgLhQGv1302ttpqeZjzCQp0SInm
 D8Mmm6Ia8h1BrM4UvxeJRMCHJOIjx5F1
X-Google-Smtp-Source: APXvYqx2aVafJaBi4FAJbVRsUMEjozIunQWr9coCiHXvYR3Vgt99h+edhRyud9ckFrhlWW7s5OKnOxs8PRRW
X-Received: by 2002:a05:620a:2043:: with SMTP id
 d3mr32700550qka.279.1580895496183; 
 Wed, 05 Feb 2020 01:38:16 -0800 (PST)
Date: Wed,  5 Feb 2020 17:37:45 +0800
In-Reply-To: <20200205093745.79298-1-tzungbi@google.com>
Message-Id: <20200205170416.3.I253f51edff62df1d88005de12ba601aa029b1e99@changeid>
Mime-Version: 1.0
References: <20200205093745.79298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH 3/3] ASoC: mediatek: mt8173-rt5650: support HDMI jack reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Uses hdmi-codec to support HDMI jack reporting.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index ef6f23675286..849b050a54d1 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -11,6 +11,7 @@
 #include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/jack.h>
+#include <sound/hdmi-codec.h>
 #include "../../codecs/rt5645.h"
 
 #define MCLK_FOR_CODECS		12288000
@@ -98,7 +99,7 @@ static const struct snd_soc_ops mt8173_rt5650_ops = {
 	.hw_params = mt8173_rt5650_hw_params,
 };
 
-static struct snd_soc_jack mt8173_rt5650_jack;
+static struct snd_soc_jack mt8173_rt5650_jack, mt8173_rt5650_hdmi_jack;
 
 static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 {
@@ -144,6 +145,19 @@ static int mt8173_rt5650_init(struct snd_soc_pcm_runtime *runtime)
 				      &mt8173_rt5650_jack);
 }
 
+static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+				    &mt8173_rt5650_hdmi_jack, NULL, 0);
+	if (ret)
+		return ret;
+
+	return hdmi_codec_set_jack_detect(rtd->codec_dai->component,
+					  &mt8173_rt5650_hdmi_jack);
+}
+
 enum {
 	DAI_LINK_PLAYBACK,
 	DAI_LINK_CAPTURE,
@@ -222,6 +236,7 @@ static struct snd_soc_dai_link mt8173_rt5650_dais[] = {
 		.name = "HDMI BE",
 		.no_pcm = 1,
 		.dpcm_playback = 1,
+		.init = mt8173_rt5650_hdmi_init,
 		SND_SOC_DAILINK_REG(hdmi_be),
 	},
 };
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
