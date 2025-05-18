Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDB7ABAFF6
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 13:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB34710E2E9;
	Sun, 18 May 2025 11:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TBThohDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 850BD10E2E8
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:22:09 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAE1ki030512
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DrWS0eBn8HYDVn6QZQx7LvwG9MtNc5KSad3knKJx8P8=; b=TBThohDpNIJ/J4su
 FwIT9dsoLVX7x1QL8IgGSGfL5oinZLmLeyAYMxN4zaBMUum/5OXkHXl1rMzrGfFo
 8V1Ku0PcjeWgz8DzWBdT1uj7j8FhqTIWuAHPiFsFz+AsMMidYcoaTL9a5jH4YeiV
 FzMHFB2IbDtqtXBXrVAwWIr8FaFR7VgKXh4ZYdQPO+Ohmm44XYJ8t3jHoy0IdG2Z
 OP8pbpC58kSrVLzy4avXYcweuFFG3/Jb58uWSB4Dmq01VlpZf+KWM+X4sZu61UD+
 pap0ZLWtvAgr6a67njVueI+u3OyfNVT/taz21BFtEfvDmLMMQvdV+ozALI5yOkS9
 h9erUg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4swen-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:22:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f6f2c41eddso79467036d6.2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 04:22:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567327; x=1748172127;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DrWS0eBn8HYDVn6QZQx7LvwG9MtNc5KSad3knKJx8P8=;
 b=Pd+UKjl9sVRflQTBwTzcqtpJhFTci4MIZ8v+zzSfBBcRYSpO3yEJ9OMGeGQAEJeY0e
 NL0E9nGM7e8VbVMBvAEx0kqiz6ccfGggQjqJCAfqh/EmgDWVVCcmrZ0gqx7YD1j+2kCA
 7SCgtTBEj5fMszD8+8w7aeTV3aofGjVfywa6F85IxqH/2XOCkxPOQiKkOdZb9CHEuxZg
 42ycK0WSAANUfY3Pv92a3/LnkPS63MkGJ6TIgru5A38jfyCkfE6vEdpRbNXxlLMuJw8N
 06ejoQwVSjb2221a6dx+Km6fpfDXs0JxHHcVz8Q9/A0dBBKpuSQP2J8edRSvij4pGi5T
 7/iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlGZMrb1W0S7fCmk1WeAzFCmyx8yM6meu4swDW1I+vZaVomVTdeWeQ+JjSn51PuUZFDnCjFPvAVi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/Z1UXsXJfTb1ilc+4CQzfwDjaDWSX4p+cX5xKcdienT5S/3Dg
 Nilk1huI6b+wkoti+Lnya1s43e5GBiLY2LM3tX33GaJkAXxuAExBXIqAFUQWGGzPcMjvoycKYYY
 ouiVRYweLidwv8oKjgGmwBK0L0/F5yDheiSEqXo+F/6Y6mLvU9hHp/KSiQVEzCwB5lI5C7Omkn+
 1tfRg=
X-Gm-Gg: ASbGncsZb6vO0CYzlbnm4zmESqzY1X5KXZ4Y2EYcUy7HD6g4g3Qi0Jy+1Cettqv0hO0
 9X+tz7lbiQqZl7db+2ovvDrXZGEs8u+xGgu/3Y8lWFgzfmFU5s58qh92VpBA9Xmx97iPzgT/+ew
 QoQc1BOuizkI/jz0vedklGDyc+pEPqFKWku4StwlnpKWCVOmy3zSfHNYndZlTeZ3OBxK4OhCEk9
 xPxXM8h8OUvzrsHYcuSVgDdXNpPjnza62pEwqRiok1/GRCYvX30uUqt1LpBBBR5Dwi92n+qESqC
 1diU2TANyCj6Av5MrRK9NPpUHYuiMW7mq0mH8DXyHc7PRYXMMKjDPCQDNZU48IZp7ibHE8Quewa
 3m1wTo6MkFCD/UWcJRnncKlcv
X-Received: by 2002:ad4:5cca:0:b0:6e8:f940:50af with SMTP id
 6a1803df08f44-6f8b08f3c7amr146221336d6.44.1747567324226; 
 Sun, 18 May 2025 04:22:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhB09Z5+fWhcWvP99gZLFiefWezoUOSp126b9JvVDooEZSXKMUji1NkWH3ZtyV3HTwYdasPg==
X-Received: by 2002:ad4:5cca:0:b0:6e8:f940:50af with SMTP id
 6a1803df08f44-6f8b08f3c7amr146220306d6.44.1747567322766; 
 Sun, 18 May 2025 04:22:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:44 +0300
Subject: [PATCH v6 11/11] drm/msm/dp: drop the msm_dp_catalog module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-11-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=78946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0JkwTGZeVMyL24cSeJz+zAVwJTTJ0EXM2Y8tVgnWmZ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcLAgWA4r7syYL9WkFzlac7ts2o480VfkRvg8
 p3XLbKV8m6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCwAAKCRCLPIo+Aiko
 1TfBB/9iQhJE7sTKE2zpbMT+xBKMo9K1ntCc2NXXwLrYf//WPwX3UrJoVHTqtnf1uBFZRqpeOBQ
 lgM+mWYdnnF7BPDpiuHBZlb6xoF/8DfekOZSxVzBettiyM8I4iq3WNgM4pVJQ891WgFaz/DO61z
 6bdVe9dBwhFuFrQ8a0cCmrIbJcv8mp7TaKWtu+TrIf6QIRU7KIpflHbYIPqVwctdUCyJ/2FV35R
 7HC5Gti3S5v6o2FiyIZIfjrGn99IRaPJ0qxxbkg16BKLFriQgFcLCzI8Hd00m6d841dTE7u3IXc
 bzfgGaOlVRkGUf6gfBXBKJayWHlSLgHzOB3aXAB80JVfyvXO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=6829c2e0 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=l76XXDAN4ChfmoQA3-8A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: PLbqOZus4gQUA_B6SzM3Bc0dqobdFF4K
X-Proofpoint-GUID: PLbqOZus4gQUA_B6SzM3Bc0dqobdFF4K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfXzxEoAS4gR4HM
 FMvrcXDuZ5c0TUI4DIbEE1dLHEFDvqcEi7lX4Ixy05veIniORoUUY8VBYltIFx3Ph8D5AWe8/IF
 m+2E5VQIWawZbSywAFoxjHel/NdpaA5SlpgplN86t9i07Vv9tmwVSiQRNj9JcW2SA8O9d9PlGgV
 0W1iJKHMvcJEpkj4G78FOmdCmFPrbaEtQRR4DK5fDgk+B+1WRtH2ZSec8D4lI3RBKNj9f7DQnxC
 X92kBGiHowfCWrsMLSuxrorJFzrI1NUfrXoM2lSR/XXvfQslw1q+mLTU0Im8g1wJRRGoNlYylvb
 6dTqbKuGOeNxE0p+j94txIdPCSK8eHZ12x924aAhyH8xWI7Eiz+VI1L2/PftxRGTUoNa7boIHv4
 m5k3dAFa08nal0s+DWe1FxUVb3cIH89S3IC51muN9ZvimrRDVP0jgNzFQO1+H+Zz814Oo2kM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180108
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Now as the msm_dp_catalog module became nearly empty, drop it, accessing
registers directly from the corresponding submodules.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile        |   1 -
 drivers/gpu/drm/msm/dp/dp_audio.c   |  70 ++++++-----
 drivers/gpu/drm/msm/dp/dp_audio.h   |   7 +-
 drivers/gpu/drm/msm/dp/dp_aux.c     | 113 +++++++++---------
 drivers/gpu/drm/msm/dp/dp_aux.h     |   6 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c | 126 --------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 100 ----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 231 +++++++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  12 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 123 +++++++++++++++----
 drivers/gpu/drm/msm/dp/dp_link.c    |   1 +
 drivers/gpu/drm/msm/dp/dp_panel.c   | 157 ++++++++++++++----------
 drivers/gpu/drm/msm/dp/dp_panel.h   |   7 +-
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +
 15 files changed, 435 insertions(+), 522 deletions(-)

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..b6b6f2d0867d548e8d2c1be9fd98a0f1ceadb111 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -135,7 +135,6 @@ msm-display-$(CONFIG_DEBUG_FS) += \
 	dp/dp_debug.o
 
 msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
-	dp/dp_catalog.o \
 	dp/dp_ctrl.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 09f871a001073ae698708b31fa8030ec7cf20242..959cf53be4b8a90eb7cc87c80f50f2b220b35762 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -11,7 +11,6 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 
-#include "dp_catalog.h"
 #include "dp_audio.h"
 #include "dp_drm.h"
 #include "dp_panel.h"
@@ -22,16 +21,30 @@
 struct msm_dp_audio_private {
 	struct platform_device *pdev;
 	struct drm_device *drm_dev;
-	struct msm_dp_catalog *catalog;
+	void __iomem *link_base;
 
 	u32 channels;
 
 	struct msm_dp_audio msm_dp_audio;
 };
 
+static inline u32 msm_dp_read_link(struct msm_dp_audio_private *audio, u32 offset)
+{
+	return readl_relaxed(audio->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_audio_private *audio,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, audio->link_base + offset);
+}
+
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x02,
@@ -42,13 +55,12 @@ static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_STREAM_1, header[1]);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x01,
@@ -59,13 +71,12 @@ static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x84,
@@ -76,13 +87,12 @@ static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x05,
@@ -93,13 +103,12 @@ static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x06,
@@ -110,21 +119,20 @@ static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 	u32 reg;
 
 	/* XXX: is it necessary to preserve this field? */
-	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	reg = msm_dp_read_link(audio, MMSS_DP_AUDIO_ISRC_1);
 	sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
 
 	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
-	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_ISRC_1, header[1]);
 }
 
 static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *msm_dp_catalog = audio->catalog;
 	u32 sdp_cfg, sdp_cfg2;
 
-	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	sdp_cfg = msm_dp_read_link(audio, MMSS_DP_SDP_CFG);
 	/* AUDIO_TIMESTAMP_SDP_EN */
 	sdp_cfg |= BIT(1);
 	/* AUDIO_STREAM_SDP_EN */
@@ -138,9 +146,9 @@ static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
 
 	drm_dbg_dp(audio->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
 
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+	msm_dp_write_link(audio, MMSS_DP_SDP_CFG, sdp_cfg);
 
-	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	sdp_cfg2 = msm_dp_read_link(audio, MMSS_DP_SDP_CFG2);
 	/* IFRM_REGSRC -> Do not use reg values */
 	sdp_cfg2 &= ~BIT(0);
 	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
@@ -148,7 +156,7 @@ static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
 
 	drm_dbg_dp(audio->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
 
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
+	msm_dp_write_link(audio, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
@@ -190,7 +198,7 @@ static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 	drm_dbg_dp(audio->drm_dev, "select: %#x, acr_ctrl: %#x\n",
 		   select, acr_ctrl);
 
-	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
@@ -215,7 +223,7 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels = msm_dp_read_link(audio, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
 
@@ -223,14 +231,14 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
 		   mainlink_levels, safe_to_exit_level);
 
-	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
+	msm_dp_write_link(audio, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
 
 static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
 	u32 audio_ctrl;
 
-	audio_ctrl = msm_dp_read_link(audio->catalog, MMSS_DP_AUDIO_CFG);
+	audio_ctrl = msm_dp_read_link(audio, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
 		audio_ctrl |= BIT(0);
@@ -239,7 +247,7 @@ static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 
 	drm_dbg_dp(audio->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	msm_dp_write_link(audio, MMSS_DP_AUDIO_CFG, audio_ctrl);
 	/* make sure audio engine is disabled */
 	wmb();
 }
@@ -330,13 +338,13 @@ void msm_dp_audio_shutdown(struct drm_connector *connector,
 }
 
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
-			struct msm_dp_catalog *catalog)
+			      void __iomem *link_base)
 {
 	int rc = 0;
 	struct msm_dp_audio_private *audio;
 	struct msm_dp_audio *msm_dp_audio;
 
-	if (!pdev || !catalog) {
+	if (!pdev) {
 		DRM_ERROR("invalid input\n");
 		rc = -EINVAL;
 		goto error;
@@ -349,7 +357,7 @@ struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
 	}
 
 	audio->pdev = pdev;
-	audio->catalog = catalog;
+	audio->link_base = link_base;
 
 	msm_dp_audio = &audio->msm_dp_audio;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_audio.h b/drivers/gpu/drm/msm/dp/dp_audio.h
index 58fc14693e48bff2b57ef7278983e5f21ee80ac7..842278516c9955ea8cf59d715b0f55963cfefbff 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.h
+++ b/drivers/gpu/drm/msm/dp/dp_audio.h
@@ -8,9 +8,10 @@
 
 #include <linux/platform_device.h>
 
-#include "dp_catalog.h"
 #include <sound/hdmi-codec.h>
 
+struct drm_bridge;
+
 /**
  * struct msm_dp_audio
  * @lane_count: number of lanes configured in current session
@@ -27,13 +28,13 @@ struct msm_dp_audio {
  * Creates and instance of dp audio.
  *
  * @pdev: caller's platform device instance.
- * @catalog: an instance of msm_dp_catalog module.
+ * @link_base: pointer to the msm_dp_link resource.
  *
  * Returns the error code in case of failure, otherwize
  * an instance of newly created msm_dp_module.
  */
 struct msm_dp_audio *msm_dp_audio_get(struct platform_device *pdev,
-			struct msm_dp_catalog *catalog);
+			      void __iomem *link_base);
 
 /**
  * msm_dp_audio_put()
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
index d7a38fa5d64d618af463416edf13bef79d6b53ba..3825a2fb48e213862f5755a8e53269e09053dc29 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.c
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -23,7 +23,7 @@ enum msm_dp_aux_err {
 
 struct msm_dp_aux_private {
 	struct device *dev;
-	struct msm_dp_catalog *catalog;
+	void __iomem *aux_base;
 
 	struct phy *phy;
 
@@ -46,14 +46,27 @@ struct msm_dp_aux_private {
 	struct drm_dp_aux msm_dp_aux;
 };
 
-static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+static inline u32 msm_dp_read_aux(struct msm_dp_aux_private *aux, u32 offset)
+{
+	return readl_relaxed(aux->aux_base + offset);
+}
+
+static inline void msm_dp_write_aux(struct msm_dp_aux_private *aux,
+				u32 offset, u32 data)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, aux->aux_base + offset);
+}
 
-	msm_dp_read_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
+{
+	msm_dp_read_aux(aux, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	msm_dp_write_aux(aux, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	msm_dp_write_aux(aux, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	msm_dp_write_aux(aux, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
 }
 
 /*
@@ -61,51 +74,47 @@ static void msm_dp_aux_clear_hw_interrupts(struct msm_dp_aux_private *aux)
  */
 static void msm_dp_aux_reset(struct msm_dp_aux_private *aux)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 aux_ctrl;
 
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(aux, REG_DP_AUX_CTRL);
 
 	aux_ctrl |= DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	aux_ctrl &= ~DP_AUX_CTRL_RESET;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 static void msm_dp_aux_enable(struct msm_dp_aux_private *aux)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 aux_ctrl;
 
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(aux, REG_DP_AUX_CTRL);
 
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_LIMITS, 0xffff);
+	msm_dp_write_aux(aux, REG_DP_TIMEOUT_COUNT, 0xffff);
+	msm_dp_write_aux(aux, REG_DP_AUX_LIMITS, 0xffff);
 
 	aux_ctrl |= DP_AUX_CTRL_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 static void msm_dp_aux_disable(struct msm_dp_aux_private *aux)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 aux_ctrl;
 
-	aux_ctrl = msm_dp_read_aux(msm_dp_catalog, REG_DP_AUX_CTRL);
+	aux_ctrl = msm_dp_read_aux(aux, REG_DP_AUX_CTRL);
 	aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	msm_dp_write_aux(aux, REG_DP_AUX_CTRL, aux_ctrl);
 }
 
 static int msm_dp_aux_wait_for_hpd_connect_state(struct msm_dp_aux_private *aux,
 					     unsigned long wait_us)
 {
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 state;
 
 	/* poll for hpd connected status every 2ms and timeout after wait_us */
-	return readl_poll_timeout(msm_dp_catalog->aux_base +
+	return readl_poll_timeout(aux->aux_base +
 				  REG_DP_DP_HPD_INT_STATUS,
 				  state, state & DP_DP_HPD_STATE_STATUS_CONNECTED,
 				  min(wait_us, 2000), wait_us);
@@ -154,10 +163,10 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 		/* index = 0, write */
 		if (i == 0)
 			reg |= DP_AUX_DATA_INDEX_WRITE;
-		msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, reg);
+		msm_dp_write_aux(aux, REG_DP_AUX_DATA, reg);
 	}
 
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, 0);
+	msm_dp_write_aux(aux, REG_DP_AUX_TRANS_CTRL, 0);
 	msm_dp_aux_clear_hw_interrupts(aux);
 
 	reg = 0; /* Transaction number == 1 */
@@ -172,7 +181,7 @@ static ssize_t msm_dp_aux_write(struct msm_dp_aux_private *aux,
 	}
 
 	reg |= DP_AUX_TRANS_CTRL_GO;
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, reg);
+	msm_dp_write_aux(aux, REG_DP_AUX_TRANS_CTRL, reg);
 
 	return len;
 }
@@ -205,22 +214,22 @@ static ssize_t msm_dp_aux_cmd_fifo_rx(struct msm_dp_aux_private *aux,
 	u32 i, actual_i;
 	u32 len = msg->size;
 
-	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL);
+	data = msm_dp_read_aux(aux, REG_DP_AUX_TRANS_CTRL);
 	data &= ~DP_AUX_TRANS_CTRL_GO;
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_TRANS_CTRL, data);
+	msm_dp_write_aux(aux, REG_DP_AUX_TRANS_CTRL, data);
 
 	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
 	data |= DP_AUX_DATA_READ;  /* read */
 
-	msm_dp_write_aux(aux->catalog, REG_DP_AUX_DATA, data);
+	msm_dp_write_aux(aux, REG_DP_AUX_DATA, data);
 
 	dp = msg->buffer;
 
 	/* discard first byte */
-	data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
+	data = msm_dp_read_aux(aux, REG_DP_AUX_DATA);
 
 	for (i = 0; i < len; i++) {
-		data = msm_dp_read_aux(aux->catalog, REG_DP_AUX_DATA);
+		data = msm_dp_read_aux(aux, REG_DP_AUX_DATA);
 		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
 
 		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
@@ -588,42 +597,39 @@ void msm_dp_aux_hpd_enable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
 	/* Configure REFTIMER and enable it */
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_REFTIMER);
 	reg |= DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_REFTIMER, reg);
 
 	/* Enable HPD */
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_CTRL, DP_DP_HPD_CTRL_HPD_EN);
 }
 
 void msm_dp_aux_hpd_disable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_REFTIMER);
 	reg &= ~DP_DP_HPD_REFTIMER_ENABLE;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_REFTIMER, reg);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_REFTIMER, reg);
 
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_CTRL, 0);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_CTRL, 0);
 }
 
 void msm_dp_aux_hpd_intr_enable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_MASK);
 	reg |= DP_DP_HPD_INT_MASK;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_INT_MASK,
 		     reg & DP_DP_HPD_INT_MASK);
 }
 
@@ -631,12 +637,11 @@ void msm_dp_aux_hpd_intr_disable(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 reg;
 
-	reg = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	reg = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_MASK);
 	reg &= ~DP_DP_HPD_INT_MASK;
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK,
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_INT_MASK,
 		     reg & DP_DP_HPD_INT_MASK);
 }
 
@@ -644,13 +649,12 @@ u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	int isr, mask;
 
-	isr = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
-	msm_dp_write_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_ACK,
+	isr = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_STATUS);
+	msm_dp_write_aux(aux, REG_DP_DP_HPD_INT_ACK,
 				 (isr & DP_DP_HPD_INT_MASK));
-	mask = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_MASK);
+	mask = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_MASK);
 
 	/*
 	 * We only want to return interrupts that are unmasked to the caller.
@@ -666,27 +670,22 @@ u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux)
 {
 	struct msm_dp_aux_private *aux =
 		container_of(msm_dp_aux, struct msm_dp_aux_private, msm_dp_aux);
-	struct msm_dp_catalog *msm_dp_catalog = aux->catalog;
 	u32 status;
 
-	status = msm_dp_read_aux(msm_dp_catalog, REG_DP_DP_HPD_INT_STATUS);
+	status = msm_dp_read_aux(aux, REG_DP_DP_HPD_INT_STATUS);
 	status >>= DP_DP_HPD_STATE_STATUS_BITS_SHIFT;
 	status &= DP_DP_HPD_STATE_STATUS_BITS_MASK;
 
 	return status;
 }
 
-struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
+struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
 			      struct phy *phy,
-			      bool is_edp)
+			      bool is_edp,
+			      void __iomem *aux_base)
 {
 	struct msm_dp_aux_private *aux;
 
-	if (!catalog) {
-		DRM_ERROR("invalid input\n");
-		return ERR_PTR(-ENODEV);
-	}
-
 	aux = devm_kzalloc(dev, sizeof(*aux), GFP_KERNEL);
 	if (!aux)
 		return ERR_PTR(-ENOMEM);
@@ -697,9 +696,9 @@ struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *cat
 	mutex_init(&aux->mutex);
 
 	aux->dev = dev;
-	aux->catalog = catalog;
 	aux->phy = phy;
 	aux->retry_cnt = 0;
+	aux->aux_base = aux_base;
 
 	/*
 	 * Use the drm_dp_aux_init() to use the aux adapter
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
index 83908c93b6a1baa6c4eb83a346b4498704008ca5..4be02e8b4d0baec8e8c14e5325c44f446204f4f5 100644
--- a/drivers/gpu/drm/msm/dp/dp_aux.h
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -6,7 +6,6 @@
 #ifndef _DP_AUX_H_
 #define _DP_AUX_H_
 
-#include "dp_catalog.h"
 #include <drm/display/drm_dp_helper.h>
 
 int msm_dp_aux_register(struct drm_dp_aux *msm_dp_aux);
@@ -25,9 +24,10 @@ u32 msm_dp_aux_get_hpd_intr_status(struct drm_dp_aux *msm_dp_aux);
 u32 msm_dp_aux_is_link_connected(struct drm_dp_aux *msm_dp_aux);
 
 struct phy;
-struct drm_dp_aux *msm_dp_aux_get(struct device *dev, struct msm_dp_catalog *catalog,
+struct drm_dp_aux *msm_dp_aux_get(struct device *dev,
 			      struct phy *phy,
-			      bool is_edp);
+			      bool is_edp,
+			      void __iomem *aux_base);
 void msm_dp_aux_put(struct drm_dp_aux *aux);
 
 #endif /*__DP_AUX_H_*/
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
deleted file mode 100644
index 84adf3a38e4cf0619b15850c31416f1e67049a42..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ /dev/null
@@ -1,126 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
- */
-
-#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
-
-#include <linux/delay.h>
-#include <linux/iopoll.h>
-#include <linux/platform_device.h>
-#include <linux/rational.h>
-#include <drm/display/drm_dp_helper.h>
-#include <drm/drm_print.h>
-
-#include "dp_catalog.h"
-#include "dp_reg.h"
-
-#define DP_DEFAULT_AHB_OFFSET	0x0000
-#define DP_DEFAULT_AHB_SIZE	0x0200
-#define DP_DEFAULT_AUX_OFFSET	0x0200
-#define DP_DEFAULT_AUX_SIZE	0x0200
-#define DP_DEFAULT_LINK_OFFSET	0x0400
-#define DP_DEFAULT_LINK_SIZE	0x0C00
-#define DP_DEFAULT_P0_OFFSET	0x1000
-#define DP_DEFAULT_P0_SIZE	0x0400
-
-struct msm_dp_catalog_private {
-	struct device *dev;
-	struct drm_device *drm_dev;
-	struct msm_dp_catalog msm_dp_catalog;
-};
-
-void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state)
-{
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->ahb_len, msm_dp_catalog->ahb_base, "dp_ahb");
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->aux_len, msm_dp_catalog->aux_base, "dp_aux");
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->link_len, msm_dp_catalog->link_base, "dp_link");
-	msm_disp_snapshot_add_block(disp_state,
-				    msm_dp_catalog->p0_len, msm_dp_catalog->p0_base, "dp_p0");
-}
-
-static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
-{
-	struct resource *res;
-	void __iomem *base;
-
-	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
-	if (!IS_ERR(base))
-		*len = resource_size(res);
-
-	return base;
-}
-
-static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
-{
-	struct msm_dp_catalog *msm_dp_catalog = &catalog->msm_dp_catalog;
-	struct platform_device *pdev = to_platform_device(catalog->dev);
-
-	msm_dp_catalog->ahb_base = msm_dp_ioremap(pdev, 0, &msm_dp_catalog->ahb_len);
-	if (IS_ERR(msm_dp_catalog->ahb_base))
-		return PTR_ERR(msm_dp_catalog->ahb_base);
-
-	msm_dp_catalog->aux_base = msm_dp_ioremap(pdev, 1, &msm_dp_catalog->aux_len);
-	if (IS_ERR(msm_dp_catalog->aux_base)) {
-		/*
-		 * The initial binding had a single reg, but in order to
-		 * support variation in the sub-region sizes this was split.
-		 * msm_dp_ioremap() will fail with -EINVAL here if only a single
-		 * reg is specified, so fill in the sub-region offsets and
-		 * lengths based on this single region.
-		 */
-		if (PTR_ERR(msm_dp_catalog->aux_base) == -EINVAL) {
-			if (msm_dp_catalog->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-				DRM_ERROR("legacy memory region not large enough\n");
-				return -EINVAL;
-			}
-
-			msm_dp_catalog->ahb_len = DP_DEFAULT_AHB_SIZE;
-			msm_dp_catalog->aux_base = msm_dp_catalog->ahb_base + DP_DEFAULT_AUX_OFFSET;
-			msm_dp_catalog->aux_len = DP_DEFAULT_AUX_SIZE;
-			msm_dp_catalog->link_base = msm_dp_catalog->ahb_base +
-				DP_DEFAULT_LINK_OFFSET;
-			msm_dp_catalog->link_len = DP_DEFAULT_LINK_SIZE;
-			msm_dp_catalog->p0_base = msm_dp_catalog->ahb_base + DP_DEFAULT_P0_OFFSET;
-			msm_dp_catalog->p0_len = DP_DEFAULT_P0_SIZE;
-		} else {
-			DRM_ERROR("unable to remap aux region: %pe\n", msm_dp_catalog->aux_base);
-			return PTR_ERR(msm_dp_catalog->aux_base);
-		}
-	} else {
-		msm_dp_catalog->link_base = msm_dp_ioremap(pdev, 2, &msm_dp_catalog->link_len);
-		if (IS_ERR(msm_dp_catalog->link_base)) {
-			DRM_ERROR("unable to remap link region: %pe\n", msm_dp_catalog->link_base);
-			return PTR_ERR(msm_dp_catalog->link_base);
-		}
-
-		msm_dp_catalog->p0_base = msm_dp_ioremap(pdev, 3, &msm_dp_catalog->p0_len);
-		if (IS_ERR(msm_dp_catalog->p0_base)) {
-			DRM_ERROR("unable to remap p0 region: %pe\n", msm_dp_catalog->p0_base);
-			return PTR_ERR(msm_dp_catalog->p0_base);
-		}
-	}
-
-	return 0;
-}
-
-struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
-{
-	struct msm_dp_catalog_private *catalog;
-	int ret;
-
-	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
-	if (!catalog)
-		return ERR_PTR(-ENOMEM);
-
-	catalog->dev = dev;
-
-	ret = msm_dp_catalog_get_io(catalog);
-	if (ret)
-		return ERR_PTR(ret);
-
-	return &catalog->msm_dp_catalog;
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
deleted file mode 100644
index ddbae0fcf5fc428b2d37cd1eab1d5860a2f11a50..0000000000000000000000000000000000000000
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ /dev/null
@@ -1,100 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
- */
-
-#ifndef _DP_CATALOG_H_
-#define _DP_CATALOG_H_
-
-#include <drm/drm_modes.h>
-
-#include "dp_utils.h"
-#include "disp/msm_disp_snapshot.h"
-
-#define DP_HW_VERSION_1_0	0x10000000
-#define DP_HW_VERSION_1_2	0x10020000
-
-struct msm_dp_catalog {
-	bool wide_bus_en;
-
-	void __iomem *ahb_base;
-	size_t ahb_len;
-
-	void __iomem *aux_base;
-	size_t aux_len;
-
-	void __iomem *link_base;
-	size_t link_len;
-
-	void __iomem *p0_base;
-	size_t p0_len;
-};
-
-/* IO */
-static inline u32 msm_dp_read_aux(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->aux_base + offset);
-}
-
-static inline void msm_dp_write_aux(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure aux reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->aux_base + offset);
-}
-
-static inline u32 msm_dp_read_ahb(const struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_ahb(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure phy reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->ahb_base + offset);
-}
-
-static inline void msm_dp_write_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure interface reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_p0(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->p0_base + offset);
-}
-
-static inline u32 msm_dp_read_link(struct msm_dp_catalog *msm_dp_catalog, u32 offset)
-{
-	return readl_relaxed(msm_dp_catalog->link_base + offset);
-}
-
-static inline void msm_dp_write_link(struct msm_dp_catalog *msm_dp_catalog,
-			       u32 offset, u32 data)
-{
-	/*
-	 * To make sure link reg writes happens before any other operation,
-	 * this function uses writel() instread of writel_relaxed()
-	 */
-	writel(data, msm_dp_catalog->link_base + offset);
-}
-
-/* Debug module */
-void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_disp_state *disp_state);
-
-struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
-
-#endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 82ed6da67b44e56015efe6ceb6038c79c16a9fa8..c42fd2c17a328f6deae211c9cd57cc7416a9365a 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
 #include <linux/types.h>
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -16,6 +17,7 @@
 #include <linux/string_choices.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_device.h>
 #include <drm/drm_fixed.h>
 #include <drm/drm_print.h>
 
@@ -114,7 +116,8 @@ struct msm_dp_ctrl_private {
 	struct drm_dp_aux *aux;
 	struct msm_dp_panel *panel;
 	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
+	void __iomem *ahb_base;
+	void __iomem *link_base;
 
 	struct phy *phy;
 
@@ -139,6 +142,36 @@ struct msm_dp_ctrl_private {
 	bool stream_clks_on;
 };
 
+static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
+{
+	return readl_relaxed(ctrl->ahb_base + offset);
+}
+
+static inline void msm_dp_write_ahb(struct msm_dp_ctrl_private *ctrl,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, ctrl->ahb_base + offset);
+}
+
+static inline u32 msm_dp_read_link(struct msm_dp_ctrl_private *ctrl, u32 offset)
+{
+	return readl_relaxed(ctrl->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_ctrl_private *ctrl,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, ctrl->link_base + offset);
+}
+
 static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
 					struct msm_dp_link_info *link)
 {
@@ -165,34 +198,32 @@ void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 sw_reset;
 
-	sw_reset = msm_dp_read_ahb(msm_dp_catalog, REG_DP_SW_RESET);
+	sw_reset = msm_dp_read_ahb(ctrl, REG_DP_SW_RESET);
 
 	sw_reset |= DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(ctrl, REG_DP_SW_RESET, sw_reset);
 	usleep_range(1000, 1100); /* h/w recommended delay */
 
 	sw_reset &= ~DP_SW_RESET;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_SW_RESET, sw_reset);
+	msm_dp_write_ahb(ctrl, REG_DP_SW_RESET, sw_reset);
 
 	if (!ctrl->hw_revision) {
-		ctrl->hw_revision = msm_dp_read_ahb(msm_dp_catalog, REG_DP_HW_VERSION);
+		ctrl->hw_revision = msm_dp_read_ahb(ctrl, REG_DP_HW_VERSION);
 		ctrl->panel->hw_revision = ctrl->hw_revision;
 	}
 }
 
 static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS);
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS);
 	intr &= ~DP_INTERRUPT_STATUS1_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS1)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS,
 		     intr_ack | DP_INTERRUPT_STATUS1_MASK);
 
 	return intr;
@@ -201,14 +232,13 @@ static u32 msm_dp_ctrl_get_aux_interrupt(struct msm_dp_ctrl_private *ctrl)
 
 static u32 msm_dp_ctrl_get_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2);
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS2);
 	intr &= ~DP_INTERRUPT_STATUS2_MASK;
 	intr_ack = (intr & DP_INTERRUPT_STATUS2)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 		     intr_ack | DP_INTERRUPT_STATUS2_MASK);
 
 	return intr;
@@ -218,11 +248,10 @@ void msm_dp_ctrl_enable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS,
 			DP_INTERRUPT_STATUS1_MASK);
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2,
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2,
 			DP_INTERRUPT_STATUS2_MASK);
 }
 
@@ -230,111 +259,101 @@ void msm_dp_ctrl_disable_irq(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl =
 		container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS, 0x00);
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS2, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS, 0x00);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS2, 0x00);
 }
 
 static u32 msm_dp_ctrl_get_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 intr, intr_ack;
 
-	intr = msm_dp_read_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4);
+	intr = msm_dp_read_ahb(ctrl, REG_DP_INTR_STATUS4);
 	intr_ack = (intr & DP_INTERRUPT_STATUS4)
 			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_STATUS4, intr_ack);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_STATUS4, intr_ack);
 
 	return intr;
 }
 
 static void msm_dp_ctrl_config_psr_interrupt(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
-
-	msm_dp_write_ahb(msm_dp_catalog, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
+	msm_dp_write_ahb(ctrl, REG_DP_INTR_MASK4, DP_INTERRUPT_MASK4);
 }
 
 static void msm_dp_ctrl_psr_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 val;
 
-	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 	val |= DP_MAINLINK_CTRL_ENABLE;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
 }
 
 static void msm_dp_ctrl_psr_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 val;
 
-	val = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	val = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 	val &= ~DP_MAINLINK_CTRL_ENABLE;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, val);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, val);
 }
 
 static void msm_dp_ctrl_mainlink_enable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 mainlink_ctrl;
 
 	drm_dbg_dp(ctrl->drm_dev, "enable\n");
 
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 
 	mainlink_ctrl &= ~(DP_MAINLINK_CTRL_RESET |
 					DP_MAINLINK_CTRL_ENABLE);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 	mainlink_ctrl |= DP_MAINLINK_CTRL_RESET;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 	mainlink_ctrl &= ~DP_MAINLINK_CTRL_RESET;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 
 	mainlink_ctrl |= (DP_MAINLINK_CTRL_ENABLE |
 				DP_MAINLINK_FB_BOUNDARY_SEL);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 static void msm_dp_ctrl_mainlink_disable(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 mainlink_ctrl;
 
 	drm_dbg_dp(ctrl->drm_dev, "disable\n");
 
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 	mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 static void msm_dp_setup_peripheral_flush(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 mainlink_ctrl;
 
-	mainlink_ctrl = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 
 	if (ctrl->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
 
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
 }
 
 static bool msm_dp_ctrl_mainlink_ready(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 data;
 	int ret;
 
 	/* Poll for mainlink ready status */
-	ret = readl_poll_timeout(msm_dp_catalog->link_base + REG_DP_MAINLINK_READY,
+	ret = readl_poll_timeout(ctrl->link_base + REG_DP_MAINLINK_READY,
 				data, data & DP_MAINLINK_READY_FOR_VIDEO,
 				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
 	if (ret < 0) {
@@ -352,7 +371,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
 
 	reinit_completion(&ctrl->idle_comp);
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_PUSH_IDLE);
 
 	if (!wait_for_completion_timeout(&ctrl->idle_comp,
 			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
@@ -399,12 +418,11 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_CONFIGURATION_CTRL, config);
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
 
 static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
 	u32 ln_mapping;
 
@@ -413,7 +431,7 @@ static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
 	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
 
-	msm_dp_write_link(msm_dp_catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
 }
 
@@ -429,7 +447,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
 
-	misc_val = msm_dp_read_link(ctrl->catalog, REG_DP_MISC1_MISC0);
+	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
 	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
@@ -439,9 +457,9 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
 
 	drm_dbg_dp(ctrl->drm_dev, "misc settings = 0x%x\n", misc_val);
-	msm_dp_write_link(ctrl->catalog, REG_DP_MISC1_MISC0, misc_val);
+	msm_dp_write_link(ctrl, REG_DP_MISC1_MISC0, misc_val);
 
-	msm_dp_panel_timing_cfg(ctrl->panel);
+	msm_dp_panel_timing_cfg(ctrl->panel, ctrl->msm_dp_ctrl.wide_bus_en);
 }
 
 /*
@@ -1257,9 +1275,9 @@ static void msm_dp_ctrl_setup_tr_unit(struct msm_dp_ctrl_private *ctrl)
 	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
 			msm_dp_tu, valid_boundary, valid_boundary2);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
-	msm_dp_write_link(ctrl->catalog, REG_DP_TU, msm_dp_tu);
-	msm_dp_write_link(ctrl->catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
+	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY, valid_boundary);
+	msm_dp_write_link(ctrl, REG_DP_TU, msm_dp_tu);
+	msm_dp_write_link(ctrl, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
 }
 
 static int msm_dp_ctrl_wait4video_ready(struct msm_dp_ctrl_private *ctrl)
@@ -1376,12 +1394,12 @@ static int msm_dp_ctrl_set_pattern_state_bit(struct msm_dp_ctrl_private *ctrl,
 
 	bit = BIT(state_bit - 1);
 	drm_dbg_dp(ctrl->drm_dev, "hw: bit=%d train=%d\n", bit, state_bit);
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, bit);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, bit);
 
 	bit = BIT(state_bit - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
 
 	/* Poll for mainlink ready status */
-	ret = readx_poll_timeout(readl, ctrl->catalog->link_base + REG_DP_MAINLINK_READY,
+	ret = readx_poll_timeout(readl, ctrl->link_base + REG_DP_MAINLINK_READY,
 				 data, data & bit,
 				 POLLING_SLEEP_US, POLLING_TIMEOUT_US);
 	if (ret < 0) {
@@ -1403,7 +1421,7 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	delay_us = drm_dp_read_clock_recovery_delay(ctrl->aux,
 						    ctrl->panel->dpcd, dp_phy, false);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_1;
 
@@ -1521,7 +1539,7 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	delay_us = drm_dp_read_channel_eq_delay(ctrl->aux,
 						ctrl->panel->dpcd, dp_phy, false);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	*training_step = DP_TRAINING_2;
 
@@ -1638,7 +1656,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	}
 
 end:
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 	return ret;
 }
@@ -1783,55 +1801,50 @@ static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
 
 static void msm_dp_ctrl_enable_sdp(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
-
 	/* trigger sdp */
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG3, 0x0);
+	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+	msm_dp_write_link(ctrl, MMSS_DP_SDP_CFG3, 0x0);
 }
 
 static void msm_dp_ctrl_psr_enter(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 cmd;
 
-	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 	cmd |= PSR_ENTER;
 
 	msm_dp_ctrl_enable_sdp(ctrl);
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
 static void msm_dp_ctrl_psr_exit(struct msm_dp_ctrl_private *ctrl)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 cmd;
 
-	cmd = msm_dp_read_link(msm_dp_catalog, REG_PSR_CMD);
+	cmd = msm_dp_read_link(ctrl, REG_PSR_CMD);
 
 	cmd &= ~(PSR_ENTER | PSR_EXIT);
 	cmd |= PSR_EXIT;
 
 	msm_dp_ctrl_enable_sdp(ctrl);
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CMD, cmd);
+	msm_dp_write_link(ctrl, REG_PSR_CMD, cmd);
 }
 
 void msm_dp_ctrl_config_psr(struct msm_dp_ctrl *msm_dp_ctrl)
 {
 	struct msm_dp_ctrl_private *ctrl = container_of(msm_dp_ctrl,
 			struct msm_dp_ctrl_private, msm_dp_ctrl);
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 cfg;
 
 	if (!ctrl->panel->psr_cap.version)
 		return;
 
 	/* enable PSR1 function */
-	cfg = msm_dp_read_link(msm_dp_catalog, REG_PSR_CONFIG);
+	cfg = msm_dp_read_link(ctrl, REG_PSR_CONFIG);
 	cfg |= PSR1_SUPPORTED;
-	msm_dp_write_link(msm_dp_catalog, REG_PSR_CONFIG, cfg);
+	msm_dp_write_link(ctrl, REG_PSR_CONFIG, cfg);
 
 	msm_dp_ctrl_config_psr_interrupt(ctrl);
 	msm_dp_ctrl_enable_sdp(ctrl);
@@ -1870,25 +1883,25 @@ void msm_dp_ctrl_set_psr(struct msm_dp_ctrl *msm_dp_ctrl, bool enter)
 		}
 
 		msm_dp_ctrl_push_idle(msm_dp_ctrl);
-		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 
 		msm_dp_ctrl_psr_mainlink_disable(ctrl);
 	} else {
 		msm_dp_ctrl_psr_mainlink_enable(ctrl);
 
 		msm_dp_ctrl_psr_exit(ctrl);
-		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 		msm_dp_ctrl_wait4video_ready(ctrl);
-		msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, 0);
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0);
 	}
 }
 
 static void msm_dp_ctrl_phy_reset(struct msm_dp_ctrl_private *ctrl)
 {
-	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL,
+	msm_dp_write_ahb(ctrl, REG_DP_PHY_CTRL,
 			DP_PHY_CTRL_SW_RESET | DP_PHY_CTRL_SW_RESET_PLL);
 	usleep_range(1000, 1100); /* h/w recommended delay */
-	msm_dp_write_ahb(ctrl->catalog, REG_DP_PHY_CTRL, 0x0);
+	msm_dp_write_ahb(ctrl, REG_DP_PHY_CTRL, 0x0);
 }
 
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -1990,7 +2003,7 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 
 	msm_dp_ctrl_clear_training_pattern(ctrl, DP_PHY_DPRX);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 end:
@@ -2002,75 +2015,74 @@ static int msm_dp_ctrl_link_maintenance(struct msm_dp_ctrl_private *ctrl)
 static void msm_dp_ctrl_send_phy_pattern(struct msm_dp_ctrl_private *ctrl,
 				     u32 pattern)
 {
-	struct msm_dp_catalog *msm_dp_catalog = ctrl->catalog;
 	u32 value = 0x0;
 
 	/* Make sure to clear the current pattern before starting a new one */
-	msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL, 0x0);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, 0x0);
 
 	drm_dbg_dp(ctrl->drm_dev, "pattern: %#x\n", pattern);
 	switch (pattern) {
 	case DP_PHY_TEST_PATTERN_D10_2:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
 		break;
 
 	case DP_PHY_TEST_PATTERN_ERROR_COUNT:
 		value &= ~(1 << 16);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
 			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
 		break;
 
 	case DP_PHY_TEST_PATTERN_PRBS7:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_PRBS7);
 		break;
 
 	case DP_PHY_TEST_PATTERN_80BIT_CUSTOM:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
 		/* 00111110000011111000001111100000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
 			      0x3E0F83E0);
 		/* 00001111100000111110000011111000 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
 			      0x0F83E0F8);
 		/* 1111100000111110 */
-		msm_dp_write_link(msm_dp_catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+		msm_dp_write_link(ctrl, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
 			      0x0000F83E);
 		break;
 
 	case DP_PHY_TEST_PATTERN_CP2520:
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 		value &= ~DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
 
 		value = DP_HBR2_ERM_PATTERN;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
 		value |= SCRAMBLER_RESET_COUNT_VALUE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+		msm_dp_write_link(ctrl, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
 			      value);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS,
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_LEVELS,
 			      DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
-		value = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL);
+		value = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
 		value |= DP_MAINLINK_CTRL_ENABLE;
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL, value);
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, value);
 		break;
 
 	case DP_PHY_TEST_PATTERN_SEL_MASK:
-		msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL,
 			      DP_MAINLINK_CTRL_ENABLE);
-		msm_dp_write_link(msm_dp_catalog, REG_DP_STATE_CTRL,
+		msm_dp_write_link(ctrl, REG_DP_STATE_CTRL,
 			      DP_STATE_CTRL_LINK_TRAINING_PATTERN4);
 		break;
 
@@ -2099,7 +2111,7 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	msm_dp_ctrl_update_phy_vx_px(ctrl, DP_PHY_DPRX);
 	msm_dp_link_send_test_response(ctrl->link);
 
-	pattern_sent = msm_dp_read_link(ctrl->catalog, REG_DP_MAINLINK_READY);
+	pattern_sent = msm_dp_read_link(ctrl, REG_DP_MAINLINK_READY);
 
 	switch (pattern_sent) {
 	case MR_LINK_TRAINING1:
@@ -2430,8 +2442,8 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
 		nvid *= 3;
 
 	drm_dbg_dp(ctrl->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
-	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_MVID, mvid);
-	msm_dp_write_link(ctrl->catalog, REG_DP_SOFTWARE_NVID, nvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_MVID, mvid);
+	msm_dp_write_link(ctrl, REG_DP_SOFTWARE_NVID, nvid);
 }
 
 int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train)
@@ -2508,7 +2520,7 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
-	msm_dp_write_link(ctrl->catalog, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
+	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
 
 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
 	if (ret)
@@ -2705,14 +2717,14 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
 
 struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
 			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
-			struct msm_dp_catalog *catalog,
-			struct phy *phy)
+			struct phy *phy,
+			void __iomem *ahb_base,
+			void __iomem *link_base)
 {
 	struct msm_dp_ctrl_private *ctrl;
 	int ret;
 
-	if (!dev || !panel || !aux ||
-	    !link || !catalog) {
+	if (!dev || !panel || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -2743,9 +2755,10 @@ struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link
 	ctrl->panel    = panel;
 	ctrl->aux      = aux;
 	ctrl->link     = link;
-	ctrl->catalog  = catalog;
 	ctrl->dev      = dev;
 	ctrl->phy      = phy;
+	ctrl->ahb_base = ahb_base;
+	ctrl->link_base = link_base;
 
 	ret = msm_dp_ctrl_clk_init(&ctrl->msm_dp_ctrl);
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
index 10a4b7cf0335a584b4db67baca882620d7bab74c..124b9b21bb7f2d8616afcebb2cfaf3a2e7b482d1 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -9,7 +9,6 @@
 #include "dp_aux.h"
 #include "dp_panel.h"
 #include "dp_link.h"
-#include "dp_catalog.h"
 
 struct msm_dp_ctrl {
 	bool wide_bus_en;
@@ -25,10 +24,13 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
 irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl);
-struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev, struct msm_dp_link *link,
-			struct msm_dp_panel *panel,	struct drm_dp_aux *aux,
-			struct msm_dp_catalog *catalog,
-			struct phy *phy);
+struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
+				    struct msm_dp_link *link,
+				    struct msm_dp_panel *panel,
+				    struct drm_dp_aux *aux,
+				    struct phy *phy,
+				    void __iomem *ahb_base,
+				    void __iomem *link_base);
 
 void msm_dp_ctrl_reset(struct msm_dp_ctrl *msm_dp_ctrl);
 void msm_dp_ctrl_phy_init(struct msm_dp_ctrl *msm_dp_ctrl);
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 22fd946ee201397b72b43c8499714139deb7ba82..b65b358e98381488ecd0ecb8648dbe76dd6ff310 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -9,7 +9,6 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
 
-#include "dp_catalog.h"
 #include "dp_aux.h"
 #include "dp_ctrl.h"
 #include "dp_debug.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e0ce410c6b26e10c36fff530b6b07e537c7ed759..96fb291b28d0290c6a43291c8dea5533075341b3 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -19,7 +19,6 @@
 #include "msm_drv.h"
 #include "msm_kms.h"
 #include "dp_ctrl.h"
-#include "dp_catalog.h"
 #include "dp_aux.h"
 #include "dp_reg.h"
 #include "dp_link.h"
@@ -87,7 +86,6 @@ struct msm_dp_display_private {
 
 	struct drm_device *drm_dev;
 
-	struct msm_dp_catalog *catalog;
 	struct drm_dp_aux *aux;
 	struct msm_dp_link    *link;
 	struct msm_dp_panel   *panel;
@@ -112,6 +110,18 @@ struct msm_dp_display_private {
 	bool wide_bus_supported;
 
 	struct msm_dp_audio *audio;
+
+	void __iomem *ahb_base;
+	size_t ahb_len;
+
+	void __iomem *aux_base;
+	size_t aux_len;
+
+	void __iomem *link_base;
+	size_t link_len;
+
+	void __iomem *p0_base;
+	size_t p0_len;
 };
 
 struct msm_dp_desc {
@@ -751,21 +761,10 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 			      dp->msm_dp_display.is_edp ? PHY_SUBMODE_EDP : PHY_SUBMODE_DP);
 	if (rc) {
 		DRM_ERROR("failed to set phy submode, rc = %d\n", rc);
-		dp->catalog = NULL;
-		goto error;
-	}
-
-	dp->catalog = msm_dp_catalog_get(dev);
-	if (IS_ERR(dp->catalog)) {
-		rc = PTR_ERR(dp->catalog);
-		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
-		dp->catalog = NULL;
 		goto error;
 	}
 
-	dp->aux = msm_dp_aux_get(dev, dp->catalog,
-			     phy,
-			     dp->msm_dp_display.is_edp);
+	dp->aux = msm_dp_aux_get(dev, phy, dp->msm_dp_display.is_edp, dp->aux_base);
 	if (IS_ERR(dp->aux)) {
 		rc = PTR_ERR(dp->aux);
 		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
@@ -781,7 +780,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->link_base, dp->p0_base);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
@@ -790,8 +789,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 	}
 
 	dp->ctrl = msm_dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
-			       dp->catalog,
-			       phy);
+			       phy, dp->ahb_base, dp->link_base);
 	if (IS_ERR(dp->ctrl)) {
 		rc = PTR_ERR(dp->ctrl);
 		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
@@ -799,7 +797,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_ctrl;
 	}
 
-	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->catalog);
+	dp->audio = msm_dp_audio_get(dp->msm_dp_display.pdev, dp->link_base);
 	if (IS_ERR(dp->audio)) {
 		rc = PTR_ERR(dp->audio);
 		pr_err("failed to initialize audio, rc = %d\n", rc);
@@ -1022,7 +1020,14 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp)
 		return;
 	}
 
-	msm_dp_catalog_snapshot(msm_dp_display->catalog, disp_state);
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->ahb_len,
+				    msm_dp_display->ahb_base, "dp_ahb");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->aux_len,
+				    msm_dp_display->aux_base, "dp_aux");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->link_len,
+				    msm_dp_display->link_base, "dp_link");
+	msm_disp_snapshot_add_block(disp_state, msm_dp_display->p0_len,
+				    msm_dp_display->p0_base, "dp_p0");
 
 	mutex_unlock(&msm_dp_display->event_mutex);
 }
@@ -1269,6 +1274,80 @@ static int msm_dp_display_get_connector_type(struct platform_device *pdev,
 	return connector_type;
 }
 
+static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
+{
+	struct resource *res;
+	void __iomem *base;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, idx, &res);
+	if (!IS_ERR(base))
+		*len = resource_size(res);
+
+	return base;
+}
+
+#define DP_DEFAULT_AHB_OFFSET	0x0000
+#define DP_DEFAULT_AHB_SIZE	0x0200
+#define DP_DEFAULT_AUX_OFFSET	0x0200
+#define DP_DEFAULT_AUX_SIZE	0x0200
+#define DP_DEFAULT_LINK_OFFSET	0x0400
+#define DP_DEFAULT_LINK_SIZE	0x0C00
+#define DP_DEFAULT_P0_OFFSET	0x1000
+#define DP_DEFAULT_P0_SIZE	0x0400
+
+static int msm_dp_display_get_io(struct msm_dp_display_private *display)
+{
+	struct platform_device *pdev = display->msm_dp_display.pdev;
+
+	display->ahb_base = msm_dp_ioremap(pdev, 0, &display->ahb_len);
+	if (IS_ERR(display->ahb_base))
+		return PTR_ERR(display->ahb_base);
+
+	display->aux_base = msm_dp_ioremap(pdev, 1, &display->aux_len);
+	if (IS_ERR(display->aux_base)) {
+		if (display->aux_base != ERR_PTR(-EINVAL)) {
+			DRM_ERROR("unable to remap aux region: %pe\n", display->aux_base);
+			return PTR_ERR(display->aux_base);
+		}
+
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * msm_dp_ioremap() will fail with -EINVAL here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (display->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+			DRM_ERROR("legacy memory region not large enough\n");
+			return -EINVAL;
+		}
+
+		display->ahb_len = DP_DEFAULT_AHB_SIZE;
+		display->aux_base = display->ahb_base + DP_DEFAULT_AUX_OFFSET;
+		display->aux_len = DP_DEFAULT_AUX_SIZE;
+		display->link_base = display->ahb_base + DP_DEFAULT_LINK_OFFSET;
+		display->link_len = DP_DEFAULT_LINK_SIZE;
+		display->p0_base = display->ahb_base + DP_DEFAULT_P0_OFFSET;
+		display->p0_len = DP_DEFAULT_P0_SIZE;
+
+		return 0;
+	}
+
+	display->link_base = msm_dp_ioremap(pdev, 2, &display->link_len);
+	if (IS_ERR(display->link_base)) {
+		DRM_ERROR("unable to remap link region: %pe\n", display->link_base);
+		return PTR_ERR(display->link_base);
+	}
+
+	display->p0_base = msm_dp_ioremap(pdev, 3, &display->p0_len);
+	if (IS_ERR(display->p0_base)) {
+		DRM_ERROR("unable to remap p0 region: %pe\n", display->p0_base);
+		return PTR_ERR(display->p0_base);
+	}
+
+	return 0;
+}
+
 static int msm_dp_display_probe(struct platform_device *pdev)
 {
 	int rc = 0;
@@ -1295,6 +1374,10 @@ static int msm_dp_display_probe(struct platform_device *pdev)
 	dp->msm_dp_display.is_edp =
 		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
+	rc = msm_dp_display_get_io(dp);
+	if (rc)
+		return rc;
+
 	rc = msm_dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");
@@ -1640,8 +1723,6 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 	/* populate wide_bus_support to different layers */
 	msm_dp_display->ctrl->wide_bus_en =
 		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
-	msm_dp_display->catalog->wide_bus_en =
-		msm_dp_display->msm_dp_mode.out_fmt_is_yuv_420 ? false : msm_dp_display->wide_bus_supported;
 }
 
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge)
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 92a9077959b3ec10c2a529db1a0e9fb3562aa5d3..66e1bbd80db3a28f5f16d083486752007ceaf3f7 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
+#include <drm/drm_device.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 7953b09b2fbd5c512ffe7c217b7fce986e4d9262..489e39f6c0ac0d2ce18d0ff83b5fed23770a6b1e 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -23,10 +23,46 @@ struct msm_dp_panel_private {
 	struct msm_dp_panel msm_dp_panel;
 	struct drm_dp_aux *aux;
 	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
+	void __iomem *link_base;
+	void __iomem *p0_base;
 	bool panel_on;
 };
 
+static inline u32 msm_dp_read_link(struct msm_dp_panel_private *panel, u32 offset)
+{
+	return readl_relaxed(panel->link_base + offset);
+}
+
+static inline void msm_dp_write_link(struct msm_dp_panel_private *panel,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, panel->link_base + offset);
+}
+
+static inline void msm_dp_write_p0(struct msm_dp_panel_private *panel,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, panel->p0_base + offset);
+}
+
+static inline u32 msm_dp_read_p0(struct msm_dp_panel_private *panel,
+			       u32 offset)
+{
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(panel->p0_base + offset);
+}
+
 static void msm_dp_panel_read_psr_cap(struct msm_dp_panel_private *panel)
 {
 	ssize_t rlen;
@@ -260,7 +296,6 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *catalog = panel->catalog;
 	u32 hsync_period, vsync_period;
 	u32 display_v_start, display_v_end;
 	u32 hsync_start_x, hsync_end_x;
@@ -292,33 +327,33 @@ static void msm_dp_panel_tpg_enable(struct msm_dp_panel *msm_dp_panel,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+	msm_dp_write_p0(panel, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
 			hsync_period);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
-	msm_dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
-
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	msm_dp_write_p0(panel, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL,
 				DP_TPG_CHECKERED_RECT_PATTERN);
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+	msm_dp_write_p0(panel, MMSS_DP_TPG_VIDEO_CONFIG,
 				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
 				DP_TPG_VIDEO_CONFIG_RGB);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE,
 				DP_BIST_ENABLE_DPBIST_EN);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN,
 				DP_TIMING_ENGINE_EN_EN);
 	drm_dbg_dp(panel->drm_dev, "%s: enabled tpg\n", __func__);
 }
@@ -327,11 +362,10 @@ static void msm_dp_panel_tpg_disable(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *catalog = panel->catalog;
 
-	msm_dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
-	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_BIST_ENABLE, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
 void msm_dp_panel_tpg_config(struct msm_dp_panel *msm_dp_panel, bool enable)
@@ -364,27 +398,25 @@ void msm_dp_panel_clear_dsc_dto(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *catalog = panel->catalog;
 
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+	msm_dp_write_p0(panel, MMSS_DP_DSC_DTO, 0x0);
 }
 
 static void msm_dp_panel_send_vsc_sdp(struct msm_dp_panel_private *panel, struct dp_sdp *vsc_sdp)
 {
-	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
 	u32 header[2];
 	u32 val;
 	int i;
 
 	msm_dp_utils_pack_sdp_header(&vsc_sdp->sdp_header, header);
 
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_1, header[1]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_0, header[0]);
+	msm_dp_write_link(panel, MMSS_DP_GENERIC0_1, header[1]);
 
 	for (i = 0; i < sizeof(vsc_sdp->db); i += 4) {
 		val = ((vsc_sdp->db[i]) | (vsc_sdp->db[i + 1] << 8) | (vsc_sdp->db[i + 2] << 16) |
 		       (vsc_sdp->db[i + 3] << 24));
-		msm_dp_write_link(msm_dp_catalog, MMSS_DP_GENERIC0_2 + i, val);
+		msm_dp_write_link(panel, MMSS_DP_GENERIC0_2 + i, val);
 	}
 }
 
@@ -394,8 +426,8 @@ static void msm_dp_panel_update_sdp(struct msm_dp_panel_private *panel)
 
 	if (hw_revision >= DP_HW_VERSION_1_0 &&
 	    hw_revision < DP_HW_VERSION_1_2) {
-		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, UPDATE_SDP);
-		msm_dp_write_link(panel->catalog, MMSS_DP_SDP_CFG3, 0x0);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, UPDATE_SDP);
+		msm_dp_write_link(panel, MMSS_DP_SDP_CFG3, 0x0);
 	}
 }
 
@@ -403,18 +435,17 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
 	u32 cfg, cfg2, misc;
 
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
 
 	cfg |= GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 |= GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
 
 	msm_dp_panel_send_vsc_sdp(panel, vsc_sdp);
 
@@ -424,7 +455,7 @@ void msm_dp_panel_enable_vsc_sdp(struct msm_dp_panel *msm_dp_panel, struct dp_sd
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=1\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -433,18 +464,17 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 {
 	struct msm_dp_panel_private *panel =
 		container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	struct msm_dp_catalog *msm_dp_catalog = panel->catalog;
 	u32 cfg, cfg2, misc;
 
-	cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	misc = msm_dp_read_link(msm_dp_catalog, REG_DP_MISC1_MISC0);
+	cfg = msm_dp_read_link(panel, MMSS_DP_SDP_CFG);
+	cfg2 = msm_dp_read_link(panel, MMSS_DP_SDP_CFG2);
+	misc = msm_dp_read_link(panel, REG_DP_MISC1_MISC0);
 
 	cfg &= ~GEN0_SDP_EN;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, cfg);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG, cfg);
 
 	cfg2 &= ~GENERIC0_SDPSIZE_VALID;
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, cfg2);
+	msm_dp_write_link(panel, MMSS_DP_SDP_CFG2, cfg2);
 
 	/* switch back to MSA */
 	misc &= ~DP_MISC1_VSC_SDP;
@@ -452,7 +482,7 @@ void msm_dp_panel_disable_vsc_sdp(struct msm_dp_panel *msm_dp_panel)
 	drm_dbg_dp(panel->drm_dev, "vsc sdp enable=0\n");
 
 	pr_debug("misc settings = 0x%x\n", misc);
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MISC1_MISC0, misc);
+	msm_dp_write_link(panel, REG_DP_MISC1_MISC0, misc);
 
 	msm_dp_panel_update_sdp(panel);
 }
@@ -500,10 +530,9 @@ static int msm_dp_panel_setup_vsc_sdp_yuv_420(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
+int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en)
 {
 	u32 data, total_ver, total_hor;
-	struct msm_dp_catalog *catalog;
 	struct msm_dp_panel_private *panel;
 	struct drm_display_mode *drm_mode;
 	u32 width_blanking;
@@ -513,7 +542,6 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 	u32 reg;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	catalog = panel->catalog;
 	drm_mode = &panel->msm_dp_panel.msm_dp_mode.drm_mode;
 
 	drm_dbg_dp(panel->drm_dev, "width=%d hporch= %d %d %d\n",
@@ -556,20 +584,20 @@ int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel)
 
 	msm_dp_active = data;
 
-	msm_dp_write_link(catalog, REG_DP_TOTAL_HOR_VER, total);
-	msm_dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
-	msm_dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
-	msm_dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
+	msm_dp_write_link(panel, REG_DP_TOTAL_HOR_VER, total);
+	msm_dp_write_link(panel, REG_DP_START_HOR_VER_FROM_SYNC, sync_start);
+	msm_dp_write_link(panel, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY, width_blanking);
+	msm_dp_write_link(panel, REG_DP_ACTIVE_HOR_VER, msm_dp_active);
 
-	reg = msm_dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
-	if (catalog->wide_bus_en)
+	reg = msm_dp_read_p0(panel, MMSS_DP_INTF_CONFIG);
+	if (wide_bus_en)
 		reg |= DP_INTF_CONFIG_DATABUS_WIDEN;
 	else
 		reg &= ~DP_INTF_CONFIG_DATABUS_WIDEN;
 
-	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", catalog->wide_bus_en, reg);
+	drm_dbg_dp(panel->drm_dev, "wide_bus_en=%d reg=%#x\n", wide_bus_en, reg);
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
+	msm_dp_write_p0(panel, MMSS_DP_INTF_CONFIG, reg);
 
 	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
 		msm_dp_panel_setup_vsc_sdp_yuv_420(msm_dp_panel);
@@ -673,13 +701,15 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 }
 
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
-			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
+			      struct msm_dp_link *link,
+			      void __iomem *link_base,
+			      void __iomem *p0_base)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
-	if (!dev || !catalog || !aux || !link) {
+	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -690,8 +720,9 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 
 	panel->dev = dev;
 	panel->aux = aux;
-	panel->catalog = catalog;
 	panel->link = link;
+	panel->link_base = link_base;
+	panel->p0_base = p0_base;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index c348417bb07f33efdf1402a73c27ff99e394e5a3..d2cf401506dcbaf553192d5e18c87207337664ab 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -6,6 +6,7 @@
 #ifndef _DP_PANEL_H_
 #define _DP_PANEL_H_
 
+#include <drm/drm_modes.h>
 #include <drm/msm_drm.h>
 
 #include "dp_aux.h"
@@ -48,7 +49,7 @@ struct msm_dp_panel {
 
 int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
 int msm_dp_panel_deinit(struct msm_dp_panel *msm_dp_panel);
-int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel);
+int msm_dp_panel_timing_cfg(struct msm_dp_panel *msm_dp_panel, bool wide_bus_en);
 int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 		struct drm_connector *connector);
 u32 msm_dp_panel_get_mode_bpp(struct msm_dp_panel *msm_dp_panel, u32 mode_max_bpp,
@@ -91,6 +92,8 @@ static inline bool is_lane_count_valid(u32 lane_count)
 }
 
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
-			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
+			      struct msm_dp_link *link,
+			      void __iomem *link_base,
+			      void __iomem *p0_base);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index d17e077ded73251624b5fb1bfbd8f213b4a86d65..7c44d4e2cf13960b5ab3277b1581ebbd539d4f65 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -11,6 +11,8 @@
 
 /* DP_TX Registers */
 #define REG_DP_HW_VERSION			(0x00000000)
+#define DP_HW_VERSION_1_0	0x10000000
+#define DP_HW_VERSION_1_2	0x10020000
 
 #define REG_DP_SW_RESET				(0x00000010)
 #define DP_SW_RESET				(0x00000001)

-- 
2.39.5

