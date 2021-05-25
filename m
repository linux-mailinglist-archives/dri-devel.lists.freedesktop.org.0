Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B58390233
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B523A6EA12;
	Tue, 25 May 2021 13:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2918B6EA12
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:24:05 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 822525806EF;
 Tue, 25 May 2021 09:24:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 25 May 2021 09:24:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=4busT0ScX2tGF
 G4MgpCnSUk/xgSURpG5BDRBKodv8yE=; b=T0bJsVRBzmBLGPci4EhuWS4tXHmKL
 8QNzedFyGkyy4H/bMPDjaezIufwstEFIpc8kjx65RDC4txr/ZJ9TGqC6kxHRsbTF
 W8NorVJd3CuW8e2AfY0+8s52Gu+4QU+XV7F5ueeadE87Lk6t5aBr211rGyeMAlsg
 PozbJEqmLrEbAnTW5IZnA/TGb/nfkZCURDWKjjhTYyPr+lobN6WH6urzq1g29+hL
 eNAwF8Ex5XWwFf4/SaRf6KiZJDmubSHn1Hrb/4MUUIweZvPjn0V+gwjOWs8vlJPr
 h07CJd16gIxlqyYjj0HjzB5cI0V0au3qtg50h+Ts5EJPxoY0cqV3ilzwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=4busT0ScX2tGFG4MgpCnSUk/xgSURpG5BDRBKodv8yE=; b=ti7o/HgL
 sK+qHGMakveukOJsHfsPriLHNhZqFyhLjCbkb7lbl8La8yJa6YL7jTnAL0z5+JtA
 DJIys9nCzJbyLc0rM1VgCW5atN7619yecnAMBnrAfjcuD+2c3iSi622IWDj6g0Gp
 /wX5rubiY0Z+jELGJNfHrh8RWhV+RutyFtcuLma2TFnoYNJzjWLnPrbxS5iQS9+v
 j/uAdXTkHRdC2aEVzRjbvv59/vHmO1W49DRKcDojGxxyaF/pq06pqve/cNgmwxtl
 gGaO7QDgKvUbKEaTIBNqlmG5DXHxdkPDikrQdZ7pbQpimh40UoVbTJamhyNcMRcR
 7OEmM3qBZXOX0Q==
X-ME-Sender: <xms:dPqsYJoEo5n8Rwudf4j03sqbNAVMIo3r2rn-3kku2vPycb-Vwtc6Sg>
 <xme:dPqsYLptefKrs0yj5mSd4Nz_Tz1_VUOnlJu58mR-fMGTQeLGew4v4bIWN2ku8kP7S
 bfXczCutl8ObSoLL38>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dPqsYGMsIcEYFg2fdXVXJeIpP9TwXl64x-OTDSsxA7ECtepDmxVIXA>
 <xmx:dPqsYE5EKBOdTDkUTk8tC30-G6XN6sZShFnr0MMEio9Nj-LNyPV-DQ>
 <xmx:dPqsYI7tri1OaiF4ryVXvlXUk-PhCccOJ_JlaZR6jPBPwDQ-58PyIg>
 <xmx:dPqsYDwJNsNtTGxUCvzNxhz-3sokmeGOx_720ngQc2-ZC6b2y5CQgQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 09:24:04 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 02/12] ALSA: iec958: Split status creation and fill
Date: Tue, 25 May 2021 15:23:44 +0200
Message-Id: <20210525132354.297468-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525132354.297468-1-maxime@cerno.tech>
References: <20210525132354.297468-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>, linux-doc@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In some situations, like a codec probe, we need to provide an IEC status
default but don't have access to the sampling rate and width yet since
no stream has been configured yet.

Each and every driver has its own default, whereas the core iec958 code
also has some buried in the snd_pcm_create_iec958_consumer functions.

Let's split these functions in two to provide a default that doesn't
rely on the sampling rate and width, and another function to fill them
when available.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/sound/pcm_iec958.h |   8 ++
 sound/core/pcm_iec958.c    | 176 ++++++++++++++++++++++++++++---------
 2 files changed, 141 insertions(+), 43 deletions(-)

diff --git a/include/sound/pcm_iec958.h b/include/sound/pcm_iec958.h
index 0939aa45e2fe..64e84441cde1 100644
--- a/include/sound/pcm_iec958.h
+++ b/include/sound/pcm_iec958.h
@@ -4,6 +4,14 @@
 
 #include <linux/types.h>
 
+int snd_pcm_create_iec958_consumer_default(u8 *cs, size_t len);
+
+int snd_pcm_fill_iec958_consumer(struct snd_pcm_runtime *runtime, u8 *cs,
+				 size_t len);
+
+int snd_pcm_fill_iec958_consumer_hw_params(struct snd_pcm_hw_params *params,
+					   u8 *cs, size_t len);
+
 int snd_pcm_create_iec958_consumer(struct snd_pcm_runtime *runtime, u8 *cs,
 	size_t len);
 
diff --git a/sound/core/pcm_iec958.c b/sound/core/pcm_iec958.c
index f9a211cc1f2c..7a1b816f67cc 100644
--- a/sound/core/pcm_iec958.c
+++ b/sound/core/pcm_iec958.c
@@ -9,41 +9,85 @@
 #include <sound/pcm_params.h>
 #include <sound/pcm_iec958.h>
 
-static int create_iec958_consumer(uint rate, uint sample_width,
-				  u8 *cs, size_t len)
+/**
+ * snd_pcm_create_iec958_consumer_default - create default consumer format IEC958 channel status
+ * @cs: channel status buffer, at least four bytes
+ * @len: length of channel status buffer
+ *
+ * Create the consumer format channel status data in @cs of maximum size
+ * @len. When relevant, the configuration-dependant bits will be set as
+ * unspecified.
+ *
+ * Drivers should then call einter snd_pcm_fill_iec958_consumer() or
+ * snd_pcm_fill_iec958_consumer_hw_params() to replace these unspecified
+ * bits by their actual values.
+ *
+ * Drivers may wish to tweak the contents of the buffer after creation.
+ *
+ * Returns: length of buffer, or negative error code if something failed.
+ */
+int snd_pcm_create_iec958_consumer_default(u8 *cs, size_t len)
 {
-	unsigned int fs, ws;
-
 	if (len < 4)
 		return -EINVAL;
 
-	switch (rate) {
-	case 32000:
-		fs = IEC958_AES3_CON_FS_32000;
-		break;
-	case 44100:
-		fs = IEC958_AES3_CON_FS_44100;
-		break;
-	case 48000:
-		fs = IEC958_AES3_CON_FS_48000;
-		break;
-	case 88200:
-		fs = IEC958_AES3_CON_FS_88200;
-		break;
-	case 96000:
-		fs = IEC958_AES3_CON_FS_96000;
-		break;
-	case 176400:
-		fs = IEC958_AES3_CON_FS_176400;
-		break;
-	case 192000:
-		fs = IEC958_AES3_CON_FS_192000;
-		break;
-	default:
+	memset(cs, 0, len);
+
+	cs[0] = IEC958_AES0_CON_NOT_COPYRIGHT | IEC958_AES0_CON_EMPHASIS_NONE;
+	cs[1] = IEC958_AES1_CON_GENERAL;
+	cs[2] = IEC958_AES2_CON_SOURCE_UNSPEC | IEC958_AES2_CON_CHANNEL_UNSPEC;
+	cs[3] = IEC958_AES3_CON_CLOCK_1000PPM | IEC958_AES3_CON_FS_NOTID;
+
+	if (len > 4)
+		cs[4] = IEC958_AES4_CON_WORDLEN_NOTID;
+
+	return len;
+}
+EXPORT_SYMBOL_GPL(snd_pcm_create_iec958_consumer_default);
+
+static int fill_iec958_consumer(uint rate, uint sample_width,
+				u8 *cs, size_t len)
+{
+	if (len < 4)
 		return -EINVAL;
+
+	if ((cs[3] & IEC958_AES3_CON_FS) == IEC958_AES3_CON_FS_NOTID) {
+		unsigned int fs;
+
+		switch (rate) {
+			case 32000:
+				fs = IEC958_AES3_CON_FS_32000;
+				break;
+			case 44100:
+				fs = IEC958_AES3_CON_FS_44100;
+				break;
+			case 48000:
+				fs = IEC958_AES3_CON_FS_48000;
+				break;
+			case 88200:
+				fs = IEC958_AES3_CON_FS_88200;
+				break;
+			case 96000:
+				fs = IEC958_AES3_CON_FS_96000;
+				break;
+			case 176400:
+				fs = IEC958_AES3_CON_FS_176400;
+				break;
+			case 192000:
+				fs = IEC958_AES3_CON_FS_192000;
+				break;
+			default:
+				return -EINVAL;
+		}
+
+		cs[3] &= ~IEC958_AES3_CON_FS;
+		cs[3] |= fs;
 	}
 
-	if (len > 4) {
+	if (len > 4 &&
+	    (cs[4] & IEC958_AES4_CON_WORDLEN) == IEC958_AES4_CON_WORDLEN_NOTID) {
+		unsigned int ws;
+
 		switch (sample_width) {
 		case 16:
 			ws = IEC958_AES4_CON_WORDLEN_20_16;
@@ -64,21 +108,58 @@ static int create_iec958_consumer(uint rate, uint sample_width,
 		default:
 			return -EINVAL;
 		}
+
+		cs[4] &= ~IEC958_AES4_CON_WORDLEN;
+		cs[4] |= ws;
 	}
 
-	memset(cs, 0, len);
-
-	cs[0] = IEC958_AES0_CON_NOT_COPYRIGHT | IEC958_AES0_CON_EMPHASIS_NONE;
-	cs[1] = IEC958_AES1_CON_GENERAL;
-	cs[2] = IEC958_AES2_CON_SOURCE_UNSPEC | IEC958_AES2_CON_CHANNEL_UNSPEC;
-	cs[3] = IEC958_AES3_CON_CLOCK_1000PPM | fs;
-
-	if (len > 4)
-		cs[4] = ws;
-
 	return len;
 }
 
+/**
+ * snd_pcm_fill_iec958_consumer - Fill consumer format IEC958 channel status
+ * @runtime: pcm runtime structure with ->rate filled in
+ * @cs: channel status buffer, at least four bytes
+ * @len: length of channel status buffer
+ *
+ * Fill the unspecified bits in an IEC958 status bits array using the
+ * parameters of the PCM runtime @runtime.
+ *
+ * Drivers may wish to tweak the contents of the buffer after its been
+ * filled.
+ *
+ * Returns: length of buffer, or negative error code if something failed.
+ */
+int snd_pcm_fill_iec958_consumer(struct snd_pcm_runtime *runtime,
+				 u8 *cs, size_t len)
+{
+	return fill_iec958_consumer(runtime->rate,
+				    snd_pcm_format_width(runtime->format),
+				    cs, len);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_fill_iec958_consumer);
+
+/**
+ * snd_pcm_fill_iec958_consumer_hw_params - Fill consumer format IEC958 channel status
+ * @params: the hw_params instance for extracting rate and sample format
+ * @cs: channel status buffer, at least four bytes
+ * @len: length of channel status buffer
+ *
+ * Fill the unspecified bits in an IEC958 status bits array using the
+ * parameters of the PCM hardware parameters @params.
+ *
+ * Drivers may wish to tweak the contents of the buffer after its been
+ * filled..
+ *
+ * Returns: length of buffer, or negative error code if something failed.
+ */
+int snd_pcm_fill_iec958_consumer_hw_params(struct snd_pcm_hw_params *params,
+					   u8 *cs, size_t len)
+{
+	return fill_iec958_consumer(params_rate(params), params_width(params), cs, len);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_fill_iec958_consumer_hw_params);
+
 /**
  * snd_pcm_create_iec958_consumer - create consumer format IEC958 channel status
  * @runtime: pcm runtime structure with ->rate filled in
@@ -95,9 +176,13 @@ static int create_iec958_consumer(uint rate, uint sample_width,
 int snd_pcm_create_iec958_consumer(struct snd_pcm_runtime *runtime, u8 *cs,
 	size_t len)
 {
-	return create_iec958_consumer(runtime->rate,
-				      snd_pcm_format_width(runtime->format),
-				      cs, len);
+	int ret;
+
+	ret = snd_pcm_create_iec958_consumer_default(cs, len);
+	if (ret < 0)
+		return ret;
+
+	return snd_pcm_fill_iec958_consumer(runtime, cs, len);
 }
 EXPORT_SYMBOL(snd_pcm_create_iec958_consumer);
 
@@ -117,7 +202,12 @@ EXPORT_SYMBOL(snd_pcm_create_iec958_consumer);
 int snd_pcm_create_iec958_consumer_hw_params(struct snd_pcm_hw_params *params,
 					     u8 *cs, size_t len)
 {
-	return create_iec958_consumer(params_rate(params), params_width(params),
-				      cs, len);
+	int ret;
+
+	ret = snd_pcm_create_iec958_consumer_default(cs, len);
+	if (ret < 0)
+		return ret;
+
+	return fill_iec958_consumer(params_rate(params), params_width(params), cs, len);
 }
 EXPORT_SYMBOL(snd_pcm_create_iec958_consumer_hw_params);
-- 
2.31.1

