Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF8A9F26A9
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040D610E3F4;
	Sun, 15 Dec 2024 22:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hMoNj/Yn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D282D10E2E7
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:19 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30039432861so40635371fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302658; x=1734907458; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UfNu0dNr6gNc7ZyMNRFRl6r61F4MYMcTmAPmZwUXsJY=;
 b=hMoNj/YnpaJuNAzWw9xVnWFUPmfjpUxmmCF8Akt+fjlt3YExcSrP1ESeAk9/1FhxEb
 1PV52JNde5hGXiI6ZKEkc3vRrVuhGRGG1PLj7TSPBKifXM+tEAHLtsagBv6ZWoC0N+ih
 +IZxy9PThAtG9dotxa7XtQkaH6J1vPgupuZ2HoYRR2E77Oi4ZC85jnriCE2/zRiQufGV
 Lpyv/BplnGNrjp6RT4BtYKpKAYWmWSXJ9mrOPtInu7a0bf8f21XpniVy0MmUZMmS9aJ9
 hFp1AECudCL9B+GSgNMIl+4484kTWPAj6nUQZCir03L02I4BS1W7dCZbPHc3JCWP7TJD
 kpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302658; x=1734907458;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UfNu0dNr6gNc7ZyMNRFRl6r61F4MYMcTmAPmZwUXsJY=;
 b=RI+1OG/MYcC28MF3aIbCgFB8GKVwz1z0qcwvozYbJSG9q1jxT5YElgYsw1YjJfOxX1
 Roz1tNdNut+PSmNnbUe08DYI1unLKOCpKan0LCmWsXFSINFgrYlw+uFkMZ4gyH8mfy21
 udH6FIASp6hKOFnBdl5Bvo3bEg9wEQlIoFw90Ck/aN5pdA3sk9060avCBXIzC4Y4fgo0
 wv2XA/WR9rV4TZW+WZtAaPWxSG8myIXcHcwlkwPwraLj4O7OAWF5rM5YDSHqx1duVD9g
 5lH7IzVjHOl04tf1pYvLoWAvY/eaYqEpotSjjwRba9T3N3KfIzT/n9dKX9tdGgK0BGAC
 gQSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCdLYveXI1wn8+WMda/oou6k/SAfbZ/Ri7bJhlDWGkDpkjgATJUq0yS0bYkIDWmlkcCJsiDnZ4uAk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkpdOpThauK4AfsWJWHOxdJKRwsGaa37qR6HUyHRGg5mfrclpd
 z26CbH8o0yOjbar6H49JCnu6TtHFW97mPWfOlPHKdbvxwPp6NET1gVThi0PuvAY=
X-Gm-Gg: ASbGncu8Z0fyCADW+xOSjZ19Vb98KVJagf3ih8XqDKia/Djtja/mnp4PkRGLreVP8KY
 9UV0tFDJuR6g0ieCtb7L/QbPnQC/6YNy/Tj4iAxnlQXvCd19jJhBlYJ4W07cD1Ot6ohYqj5aHVV
 CI72fXJ8BwzZWhDyk81h30LEEPVpKwev5PN/raEZ0xgi+EkwSm8mNCGicXptl3zSYszQqUfffkq
 C7Kbw79rICvOiYKTlx1bhry0tKyp5Bfzhg3ecRm+MR22k6+hXF8TF0t7urbGH9r
X-Google-Smtp-Source: AGHT+IF9LwmKsxrRntIBEldp7Bijki6HAvjE/sqlfZG2FJkXPK0+FP4QMXW8DXTFjYmKq7QxUaSxzQ==
X-Received: by 2002:a05:651c:54a:b0:300:2848:fc7f with SMTP id
 38308e7fff4ca-302544f93abmr36413641fa.25.1734302658099; 
 Sun, 15 Dec 2024 14:44:18 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:07 +0200
Subject: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15188;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zZAoMMPsb9fb/oDQ7+LF8Eb34eAsmWspMbb/qgrfju8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u5TwuQ3amRfpEpvPRxw+KJuZGrZ8KSHosNv
 zQhgLPFP9uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19buQAKCRCLPIo+Aiko
 1ST0B/42Hpd9NlyS95eb7PBhy/HjkrlUc578i7vTzoV4+wwO8hgbmNySWlt/D0G56j+WA8Z+YZK
 UeQzBQKuG/lGB5aCfooaPLnyPtK0537p0yYhnQ47SA5ywXCLru5TVu4enQ5ldGDUeVQJi0WjaYN
 3Q/f1zixMFUcsa43gMvdFRZc/aMOcKGfhYkk8Dy71kfWLc7T7gYfOJXVsODlHGwtopM4CsBAdL+
 40lHnHRJ6InChSgsOsTOdMPaFhUPxxvZvgcRPnyP7A5SP0p4xjrYdZj2ONf99fgrrldNM8I/+/+
 RnTdQmg5CqJpkp55sABfpav9roPo4y0qnDAbeQ9TuXV/JOOX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
to program audio packet data. Use 0 as Packet ID, as it was not
programmed earlier.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
 3 files changed, 122 insertions(+), 227 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -14,6 +14,7 @@
 #include "dp_catalog.h"
 #include "dp_audio.h"
 #include "dp_panel.h"
+#include "dp_reg.h"
 #include "dp_display.h"
 #include "dp_utils.h"
 
@@ -28,251 +29,64 @@ struct msm_dp_audio_private {
 	struct msm_dp_audio msm_dp_audio;
 };
 
-static u32 msm_dp_audio_get_header(struct msm_dp_catalog *catalog,
-		enum msm_dp_catalog_audio_sdp_type sdp,
-		enum msm_dp_catalog_audio_header_type header)
-{
-	return msm_dp_catalog_audio_get_header(catalog, sdp, header);
-}
-
-static void msm_dp_audio_set_header(struct msm_dp_catalog *catalog,
-		u32 data,
-		enum msm_dp_catalog_audio_sdp_type sdp,
-		enum msm_dp_catalog_audio_header_type header)
-{
-	msm_dp_catalog_audio_set_header(catalog, sdp, header, data);
-}
-
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x02;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
-	new_value = value;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = audio->channels - 1;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-		value, parity_byte);
-
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_STREAM, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x02,
+		.HB2 = 0x00,
+		.HB3 = audio->channels - 1,
+	};
+
+	msm_dp_catalog_write_audio_stream(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x1;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x17;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = (0x0 | (0x11 << 2));
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_TIMESTAMP, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x01,
+		.HB2 = 0x17,
+		.HB3 = 0x0 | (0x11 << 2),
+	};
+
+	msm_dp_catalog_write_audio_timestamp(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x84;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x1b;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = (0x0 | (0x11 << 2));
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-			new_value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_INFOFRAME, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x84,
+		.HB2 = 0x1b,
+		.HB3 = 0x0 | (0x11 << 2),
+	};
+
+	msm_dp_catalog_write_audio_infoframe(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x05;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x0F;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_2);
-
-	/* Config header and parity byte 3 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
-
-	new_value = 0x0;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_3_BIT)
-			| (parity_byte << PARITY_BYTE_3_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 3: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_COPYMANAGEMENT, DP_AUDIO_SDP_HEADER_3);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x05,
+		.HB2 = 0x0f,
+		.HB3 = 0x00,
+	};
+
+	msm_dp_catalog_write_audio_copy_mgmt(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 value, new_value;
-	u8 parity_byte;
-
-	/* Config header and parity byte 1 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
-
-	new_value = 0x06;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_1_BIT)
-			| (parity_byte << PARITY_BYTE_1_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_1);
-
-	/* Config header and parity byte 2 */
-	value = msm_dp_audio_get_header(catalog,
-			DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
-
-	new_value = 0x0F;
-	parity_byte = msm_dp_utils_calculate_parity(new_value);
-	value |= ((new_value << HEADER_BYTE_2_BIT)
-			| (parity_byte << PARITY_BYTE_2_BIT));
-	drm_dbg_dp(audio->drm_dev,
-			"Header Byte 2: value = 0x%x, parity_byte = 0x%x\n",
-			value, parity_byte);
-	msm_dp_audio_set_header(catalog, value,
-		DP_AUDIO_SDP_ISRC, DP_AUDIO_SDP_HEADER_2);
+	struct dp_sdp_header sdp_hdr = {
+		.HB0 = 0x00,
+		.HB1 = 0x06,
+		.HB2 = 0x0f,
+		.HB3 = 0x00,
+	};
+
+	msm_dp_catalog_write_audio_isrc(audio->catalog, &sdp_hdr);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 6a30996200bc7fbaacd0502f096e787f754752de..8fddfe5d85d6398c6582e1f74647f4cd83f5a4d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1122,6 +1122,77 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 	return &catalog->msm_dp_catalog;
 }
 
+void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
+				       struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
+}
+
+void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
+				     struct dp_sdp_header *sdp_hdr)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+	struct dp_sdp_header tmp = *sdp_hdr;
+	u32 header[2];
+	u32 reg;
+
+	/* XXX: is it necessary to preserve this field? */
+	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
+
+	msm_dp_utils_pack_sdp_header(&tmp, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+}
+
 u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
 				enum msm_dp_catalog_audio_sdp_type sdp,
 				enum msm_dp_catalog_audio_header_type header)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 62a401d8f75a6af06445a42af657d65e3fe542c5..4a5591d9f82a21d7a3bb64ad6b486e39bd406cd5 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -111,6 +111,16 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
+void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
+				       struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
+					  struct dp_sdp_header *sdp_hdr);
+void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
+				     struct dp_sdp_header *sdp_hdr);
 u32 msm_dp_catalog_audio_get_header(struct msm_dp_catalog *msm_dp_catalog,
 				enum msm_dp_catalog_audio_sdp_type sdp,
 				enum msm_dp_catalog_audio_header_type header);

-- 
2.39.5

