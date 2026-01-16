Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD40DD2DAB3
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 09:05:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C4310E824;
	Fri, 16 Jan 2026 08:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="nac0/bA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 531 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jan 2026 07:51:26 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F9510E818;
 Fri, 16 Jan 2026 07:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1768549874;
 bh=clnzf/H1JmwR0ak8FPrl0YMZL+WsDsmHb/QJM015m/E=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=nac0/bA5ylhePovrc6dxYzpYo9wcU5OfCixM0eInnd+bZm+gZPaNDDJNmgwlmbDT5
 Zu+HL3kSOKVVaayR5CW1UshjdY0ftWFmDNNB84e6B8v7QBVLeem6Vy703S0wEppkD0
 +18N5j41qBFw+eoFZdJi463seyhFhQSSJXXA2jrA=
X-QQ-mid: zesmtpip4t1768549333t9f98ac5c
X-QQ-Originating-IP: DU9ZYwVUrtfQbkh8Im5uPNO9uZxdnn03eHkqvpXs+GI=
Received: from PECI2107 ( [localhost]) by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 16 Jan 2026 15:42:05 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11121185886742935995
EX-QQ-RecipientCnt: 21
From: Runrun Liu <liurunrun@uniontech.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, kernel@uniontech.com,
 Runrun Liu <liurunrun@uniontech.com>,
 Cryolitia PukNgae <cryolitia@uniontech.com>
Subject: [PATCH] treewide: fix misspelling of "minimum" in comments
Date: Fri, 16 Jan 2026 15:42:01 +0800
Message-ID: <8FCE6718C7BBE127+20260116074202.56135-1-liurunrun@uniontech.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M9oQrxULcDvjvbYUgi0mJ6annjdjX6A60/sR58IMS2tlXEUIlh4KKvZH
 wKH+jwbFK9TuUky+GSfxJxarBF8kfdJ4BHAxwRSN7wKBp0UcPCodN+shVyY+GiwFLCfS/21
 eV2f2pe5hDxj5BlMkDFu9NQkn232Em5EWfteyQo9xhMDFg8bqWHR3GwoT28TAcCrHHFJGdc
 RR8r9N83t4iBG62GZAwwgkSh41sWQ6siUza/yjrdnjJD0vbMMyNFLxsllfRwfdtx1NkGNwx
 O+/WtMucZfWrXQzOjjJMQeEf+My3iSoxvvg2fxKe1nZQjkIuMEgsi69WAhyLsm0j36reIzU
 pzb6e4yS6Rvpgfbht9267IZzYd+Q12O553H/TCyDrOnnnWwwcPIom8lYCC2MlN/sK59mSQl
 Vg33vACYNOEHimi5gtsSzkM8UdC/yrHwaV1JrQEdDEU7ujr+6a7nmi4Z+jXAzv8RYbwpwiR
 NhL9z++27J5rxg7O2jlS4yokBSskbV/ZAotxDPFq5lE6cvI4oD48LvplskAdeOEe1++w1Cq
 B9RxM9t1mXjZgvO+KBrou0GwJk6esvgcCe+G0UYekM5h8GHuzVfAp2yNl/1MwAbBt+IHR7k
 rg2LIPoi8X7L0IP0aLPZtIYS/4LAPYuqjCByBdQezzoL2n8WlHQ4rvvMT4ANBry9MdVuS9v
 3PoU3E3dWrWRYs/JqBE35WhGp0O1km92mJhmag9oDF15jItp0EhA46D0QJplHN6lUV9Rsy9
 Ru2v952hqzu1Ur2lzkj7gXFqt6d9l1TnJ5b97rcfToFX4l7OtfoU4Nrdu7Kf01En3A0zy3+
 SBqPUZZYtQjqW6PLT0Rl7t+25sUmWZ79CB29MhaOskIBJARZ50TkcaAemyNvHrN9s1xD42c
 QFmPimv71QuDHBOyye6Bp/+tzgGFKDgXOhzfuj72QO99YptwCxqfux/rfaXAivFJ0qTBdcb
 HXpYaMV8gfAQEQVFByR3pnK78WfLERDLdp2E3i52e/RKbBUeyKTSMbAncsoB/gXccqXWK35
 eI8zVDXiAYQBYyn3Q3+j+uisWgvC9ncN4k9tZAooOOa7ItKufeZPVdPRUuRZhKSd7dBfLZL
 q57wekgsiUUX07h3SUthRIVnB4w/3UKMA==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Fri, 16 Jan 2026 08:05:22 +0000
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

Fix misspelling of "minimum" in comments across AMD display and Realtek
codec drivers.

This typo is already listed in scripts/spelling.txt by commit
8c3200265787 ("scripts/spelling.txt: add several more common
spelling mistakes").

Suggested-by: Cryolitia PukNgae <cryolitia@uniontech.com>
Signed-off-by: Runrun Liu <liurunrun@uniontech.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
 sound/soc/codecs/rt5659.c                   | 2 +-
 sound/soc/codecs/rt5665.c                   | 2 +-
 sound/soc/codecs/rt5668.c                   | 2 +-
 sound/soc/codecs/rt5682-i2c.c               | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index e4144b244332..5b3584ad5b6b 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -1157,7 +1157,7 @@ static bool setup_dsc_config(
 	if (!is_dsc_possible)
 		goto done;
 
-	/* increase miniumum slice count to meet sink slice width limitations */
+	/* increase minimum slice count to meet sink slice width limitations */
 	min_slices_h = dc_fixpt_ceil(dc_fixpt_max(
 			dc_fixpt_div_int(dc_fixpt_from_int(pic_width), dsc_common_caps.max_slice_width), // sink min
 			dc_fixpt_from_int(min_slices_h))); // source min
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index f5957470652c..3590ebd41c27 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -4118,7 +4118,7 @@ static int rt5659_i2c_probe(struct i2c_client *i2c)
 	rt5659->gpiod_reset = devm_gpiod_get_optional(&i2c->dev, "reset",
 							GPIOD_OUT_HIGH);
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	msleep(300);
 
 	rt5659->regmap = devm_regmap_init_i2c(i2c, &rt5659_regmap);
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index c7beccd54b16..38fb3a277e26 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4688,7 +4688,7 @@ static int rt5665_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(rt5665->gpiod_ldo1_en);
 	}
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	rt5665->regmap = devm_regmap_init_i2c(i2c, &rt5665_regmap);
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index 5fcdb50d5184..c551696ae11a 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2458,7 +2458,7 @@ static int rt5668_i2c_probe(struct i2c_client *i2c)
 		return PTR_ERR(rt5668->ldo1_en);
 	}
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	regmap_write(rt5668->regmap, RT5668_I2C_MODE, 0x1);
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index bba987308e15..e556a365adc8 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -173,7 +173,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c)
 	if (ret)
 		return ret;
 
-	/* Sleep for 300 ms miniumum */
+	/* Sleep for 300 ms minimum */
 	usleep_range(300000, 350000);
 
 	regmap_write(rt5682->regmap, RT5682_I2C_MODE, 0x1);
-- 
2.51.0

