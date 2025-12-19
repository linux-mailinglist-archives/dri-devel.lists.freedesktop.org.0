Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0566CCF699
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:39:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9821310EF18;
	Fri, 19 Dec 2025 10:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PL6mbnBv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YgExg5ES";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0606510EF19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:26 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJ4bxws4145265
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=; b=PL6mbnBv7EfMa/B3
 G/A19Ugs8x7no5uZnLc29BKl5Vn8kvur6C1cWp0BD6B1yAEL46bhrEpfcdmUJYlA
 MlUhdBP13GpNKF7CztRp2h3Rl/X+GwnC+iphFCsnCl7LXcBxunss8sfRgfeduSwY
 NQulyM566QcMI+8rgGko+9m8/K1S7D5MmjNzzlZx7nvROqa5FIFPAL/OHxZ66NR9
 OyedHIjhIsqSVTv3pBbl/6/8r7WnQYdsY4ma6gMPrB7MHKBElv+Ov1CrdTHxZbMu
 ZJgrti+EpWkMyNssU+vC7PcmKI5W1AUxaLJHh9LOWSDp9k6mq3jr74AvbchRF3vn
 Hh5fgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2dtcab-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:39:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f4a5dba954so27197401cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 02:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766140765; x=1766745565;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=;
 b=YgExg5ESHROL4/KbYD3QjNyVVOtry24P3ggzvvvF1/1GisP9kWTiq5wZ43YN4aFR6G
 fE6bZgUoBhCEOraEiEUO6Ihkyw9okP1kdWHw1VqoUUw1zsMP8nFM7kEi9Qhi33drP9NM
 OJBRjGI40Vu1n1JmpDI+AT1eITh3TE45+RdC2ru6zi6CCTNvcbiF7yvt3mvjVMCXg0Zy
 jLrSYHSineZEZcZh4GXqutqSWZ9T3oHCq4QdYdKLGb0j0lgnz8E0gJfE6ooJn6pHw7w/
 8Qq4nqxJdepnAdkjMW75dEI3LFhPJTD/PS6DHIdYROSV/S3UUHbiI3sMmE/yjaWJTCmQ
 uDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766140765; x=1766745565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sbDgyYqjBiwisdufx8Q+hYVd73Qfr9p891HKLDe9eZs=;
 b=qCN57AMAMEFouQAcCNUbSdsySrws993RIg9sz8myBTB0AVhAzfjicgWTUwrcQLmqhU
 WX9Ne4xV1mhDfabK9eELgn7By9/l1rL0UkCdfMfjIsJXEHWnZXWuYL0HCBAZ0jcq1sCG
 AaNWiomBydIi2fw5A5Io7wnim6UTjfzhxqEXZHqtEPIPLW+t1Sc6mo8IFmU9eDDkF0+z
 hHf4dBkqjZVY5rVLbgrKvYfYYqxpOjXPvpPqhd/VZzy5eYrb34arI1BKwza9XOsDJOjg
 tgXGCJ5SrILJ1BO/pzJ/9o00O3faC6rTzlOm+JQb6n29cVNIE3H9FIRIbVgHcGMK49YF
 VDnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpgGyGvjbfINixA6+OxeftKCUuLDe8xrzl01SP8/VMFHiIzg465GL056Ko1hDkoRiR8lpW8KSf2oE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynJ+OfXFqtD4ZtVZN+f97Q/qzS6e9lUAXSUdO4ncMTWl7Ib66Z
 NMedj1ojTzbVXTQLfM3S11ZXUGG0Gsd82TSTu6veyE2bOTATiHd4HBvSfbAzdNUAuhv7Su7h341
 rw6xgZw1uwGLbPx7aurgYwMIemkHulOd4e2gm/ypzWvQ/s89sukYIxPAEm5Kxd8XWESVio6w08c
 gYipLBSw==
X-Gm-Gg: AY/fxX6NFcp1BZGCs29BdpOvqTbgNdhraCc/wDphSjeqfCdSZCBwjUtVx8BRXxxg0KE
 9Cwgw09SXL/DaZKllejSE+0XI6aiUQgVeJOnRKdbIuwp0AcTbWvQaZqgXkGpGdgIkk/toebS80s
 Mmad0o85oqa357GLgVuO0855tE5yjsyCVizV6ZS5e+NTua3evT+qElkhWU7i4vuZe9pSP4qW/Mk
 SI+oyPz/ZYbZpMvPmcCzE6I1j+RBeviu7MxuPUzvd8XpGbUZvXMUcv9jREN5RXp5aa0RHvGx+w7
 eD+m89os8ETNwI/WdkutbrHeUW9WzrjfM59/VXUWq62YemJhQ3U/W0Xt3ShZu9oxB3iQENE4UM1
 pAVM5Biv8zoxiUek=
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id
 d75a77b69052e-4f4abdb50afmr28813841cf.76.1766140764937; 
 Fri, 19 Dec 2025 02:39:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8DdSG740C5NPtMnK++fiGar0BQXZYGFlOhBwei0Gw+oZGsGEVWCVcw5gfBcVRV33F8o/4LA==
X-Received: by 2002:a05:622a:244a:b0:4f1:dfc8:50b with SMTP id
 d75a77b69052e-4f4abdb50afmr28813631cf.76.1766140764354; 
 Fri, 19 Dec 2025 02:39:24 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037ad8577sm198142066b.24.2025.12.19.02.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 02:39:23 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 12:39:02 +0200
Subject: [PATCH 2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-2-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=7927;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xi0isO2zj7u63F4efQxBlJHUzywGMfOEhn2zIGrUuP0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpRStWe971J3fXTWEto13F48xEAWlKpa5UIoGw+
 D+K2Ywjo9CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaUUrVgAKCRAbX0TJAJUV
 Vhq2EACMJmriHKHHwDFtldQFgURBx4XUWuTs2XtI6i/Lz1PK+mNP3KE6bb02hHOT9IQv5viiWMu
 Q7f/wqUQX8WTlW27jFbpxXs+AusXdLV5Tjkx+KlAtjuJ1GkRiKGBCa6nvc8Zml+m9mTsA4sCm6R
 xN8/Nqf1955BF2X+9qS7t27e1dHFl0Z6bov60B55+1+V9DQmHARRDBnabvRTn2ttIrfapZfxj6S
 9PsJG0d4MCqPZ+6Ap2TAVP/1x5qL9Le1vDR3dChYL3rlxYXLjIpzKDwqvw20rolUk2HPBoKOhZA
 IoumZx27B8wJP1fouA4tXkP3sklTjaedbdvZbBdfdtJ2Oqw6S6cSUJ+P+sF5V4t0QytGRm8lVIV
 m1M6h8hgIl6fEE+OIF+MdOHxie9RpgNV+Bn/Au0X7MaXx3hAEAMllohmUrvn+erTNzSzuRxwS7w
 U60+NY2ypnELM3YT6p6ZVwdAQdpH2eTFiSyqaxMGQRXbFD4y0KulWSWCb2rt6/2FrkIo7NI0/0y
 lKSYhb60Q6tAStYRyJBTNVOJWNwzX274eH2zLVIqR9D8MX0sQ+shMiRPN+2WQlasy4UQUiAKGNe
 3LXjhrbdhacEsctzY9VMnAboKO09+7NpxVh2h4afqs6wY6yU2cOh79KjXyVXBTKlW4Q7wZl6N5c
 sfQV7olIOinz7XQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: QtRJxceRWG6fMVg_RIRDx_2GJDtex5om
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=69452b5d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DdBtMnqNxkYIvXj6ev4VzQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8
 a=ZMc9qBuXswDIMKfH7wMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-GUID: QtRJxceRWG6fMVg_RIRDx_2GJDtex5om
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4NyBTYWx0ZWRfXwW0R9jWQVmBY
 jfbADALJdoeqg/zkx1BWr5hmKuaLaNZglYuBG1XMG7t2j23DnjuyqPaovELqNnPEmzLeVh0YQci
 9I6XeZjE0rhA+B9CLjrDUyFMya1fhwYnXRYKmh77Iyp48HD7Z2Y8RiSXyTIU8NkAlqkcbyxj9Zn
 EGdPUb8Al3Xy+tW6lJx/p6V4SNrrO/XeydZ2lYagowKrazADws23ldAkdk6kJLtZsnz0jGGxcwM
 m2n9lvNG3O4IElUx7IbhndunjEoCW5Zc+IhSCOrpOPlzPfpe2AIgAl58Xr5sZwOhr12CrkUOUch
 SE/m5gyql2l3EScbMR2con3xsQ7OhySw1cAsm9w2NF5onX1gI1ELT+XUrbxXq9QPhP6ToU0yAff
 eAfSGDH1owZXlSpbVQ/MVfrTQuYotB8Ce3QRG2gz72Z8L7o+fbsvKTYhJtqMZDlu72RoaLYEoG2
 BtqcOqmuDRp4U8qJgyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190087
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

This reverts commit d7ec9366b15cd04508fa015cb94d546b1c01edfb.

The dual-DSI dual-DSC scenario seems to be broken by this commit.

Reported-by: Marijn Suijten <marijn.suijten@somainline.org>
Closes: https://lore.kernel.org/r/aUR2b3FOSisTfDFj@SoMainline.org
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 27 ++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 33 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 011946bbf5a2..2d06c950e814 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_QUAD_MIXERS];
+	u32 crcs[CRTC_DUAL_MIXERS];
 
 	int rc = 0;
 	int i;
@@ -1328,7 +1328,6 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
-	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1342,14 +1341,11 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
-	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
-	 * resource. Otherwise, use 2:2:2 topology.
-	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2:2:1 topology
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 *
@@ -1361,23 +1357,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	num_rt_intf = topology.num_intf;
-	if (topology.cwb_enabled)
-		num_rt_intf--;
-
-	if (topology.num_dsc) {
-		if (dpu_kms->catalog->dsc_count >= num_rt_intf * 2)
-			topology.num_dsc = num_rt_intf * 2;
-		else
-			topology.num_dsc = num_rt_intf;
-		topology.num_lm = topology.num_dsc;
-	} else if (num_rt_intf == 2) {
+	if (topology.num_intf == 2 && !topology.cwb_enabled)
+		topology.num_lm = 2;
+	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
-	} else if (dpu_kms->catalog->caps->has_3d_merge) {
+	else if (dpu_kms->catalog->caps->has_3d_merge)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	} else {
+	else
 		topology.num_lm = 1;
-	}
 
 	if (crtc_state->ctm)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 2c83f1578fc3..94392b9b9245 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
+	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d1cfe81a3373..9f3957f24c6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 4
+#define MAX_CHANNELS_PER_ENC 2
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -661,6 +661,7 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
@@ -674,12 +675,22 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	/*
-	 * Set DSC number as 1 to mark the enabled status, will be adjusted
-	 * in dpu_crtc_get_topology()
-	 */
-	if (dsc)
-		topology->num_dsc = 1;
+	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
+	if (dsc) {
+		/*
+		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
+		 * when Display Stream Compression (DSC) is enabled,
+		 * and when enough DSC blocks are available.
+		 * This is power-optimal and can drive up to (including) 4k
+		 * screens.
+		 */
+		WARN(topology->num_intf > 2,
+		     "DSC topology cannot support more than 2 interfaces\n");
+		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
+			topology->num_dsc = 2;
+		else
+			topology->num_dsc = 1;
+	}
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
@@ -2169,8 +2180,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[2];
+	struct dpu_hw_mixer *hw_mixer[2];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	/* reset all mixers for this encoder */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 09395d7910ac..61b22d949454 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    (dpu_cstate->num_mixers != 1) &&
+	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 336757103b5a..4964e70610d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_QUAD_MIXERS	4
+#define CRTC_DUAL_MIXERS	2
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 31451241f083..046b683d4c66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		2
+#define STAGES_PER_PLANE		1
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.48.1

