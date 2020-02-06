Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B526A153FFE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E317F6FA2C;
	Thu,  6 Feb 2020 08:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com
 [IPv6:2607:f8b0:4864:20::f49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A4C6F9AB
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 03:18:27 +0000 (UTC)
Received: by mail-qv1-xf49.google.com with SMTP id p3so2863667qvt.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 19:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=ueuYkYfzd1J7mUX84rods+zZPBEDPeQEpjWo1fKgNXmmkJRjFmQ57clQ25FbxVrB81
 0BoeuWRSAlLi4ikcBydPblOqMIIYdUZlWt96IlppvTopxt4MrWxe1NJNb00pEILdALIL
 mwP9m3shNI4otFS5JNL2mDva9EvmqHjaLpSPV+4fWAoYFTZp1nvG0CRMuMvaQQpiTocd
 RdQCWBIwo+BGVgpp3NbIEtfA/GO13BcJrwl9r2EoO9jqfv5ogBgO5W/6Q7nyLCxted8+
 Q/tls29mCNiLAHzFozF2uSg8V5VCuOfUUjtgXE6vmEdrV5rvwC9qaa9Tedzul30Dx9L2
 FkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=3xSqtFmkuhmH7fZvAamf8hbYq+ufSxebJYVWVye4C7Y=;
 b=tm0mZWCbyuIv3fkj2p+fi9LMcq/H4FuMCihAA+Bi8FroDPTCKq+/Jpd7RknX43dcuw
 CpIeEwEyICwzAihn0bRVi9wxB1LtI3feL9QimCGH2t+/C4JIPt7a7NjQGdv2URbO79cl
 eBAwWfENKP9X4ks0OGUr/fb1kVfCCgnpAy2eufGIvafy/Eb51+rvj2EmDOW3kNT97EQ3
 TTmtxWEBlStsnCt3TNWUCxch3levyyFGtJv5ZR9i7cZ/kCu/cJE1Jy//d1MIgckS/d3C
 DEAkkgD4W9vpCBRhPKPL8Ch7o7izsQHF5rpy5Bf4uqDxT6uXYT7U9XI1kEBBEt7jRphg
 V2cA==
X-Gm-Message-State: APjAAAUjPBG87AAKirkRG3l+RTaNIBMHEztqTt/+8TXA93x4w+mnXOZw
 EtP3BwLWawANxBgopoCx473BmOv0yp6Y
X-Google-Smtp-Source: APXvYqz/fAMuYGvIwuayOCKaf8jH3Jt4uA2sxWoRh0ciqFGB/O4svWNUa/d29O7qRqPWaudemfa9s6lehhZc
X-Received: by 2002:a0c:fe8e:: with SMTP id d14mr705336qvs.106.1580959106204; 
 Wed, 05 Feb 2020 19:18:26 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:52 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.3.I253f51edff62df1d88005de12ba601aa029b1e99@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 3/3] ASoC: mediatek: mt8173-rt5650: support HDMI jack
 reporting
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
