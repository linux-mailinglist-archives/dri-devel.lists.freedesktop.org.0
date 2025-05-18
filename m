Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB09ABAFE1
	for <lists+dri-devel@lfdr.de>; Sun, 18 May 2025 13:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364110E1FF;
	Sun, 18 May 2025 11:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TTgAYCLl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD44710E2B2
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IAtVHW029142
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 seN4YYKwjaMssJPoiSSAk/UJINq71z4OK7vTWwlIhfk=; b=TTgAYCLlz/kO/wwe
 Nk8QxwWduSD8FtVPhADU3xKw+PeGjNMfFAc16tNogkkv1MVi0lZeMdnGBLbhlgtW
 Za22ro4hKMkUVB53Xn4zTmRUlrQPm07/tQEpo6ukqKbLoesKz9Xt8YWcnf4C8dae
 YysG3kizyf5BQdGeeubxyc8vqRYfn86MyXDVVgqDazxU+0BRwqJ5Zj+XF8rePVo6
 zQ5y2pxjswkkah1xgPNpupC8H9jNEhBKMnuwrPJwSXpTUpxJZ6U8FRgfOFJzhddH
 ZBalYLs0om9a5ZQqu5GIyC/5KAwV9Wp2pniC6i1TB1rjULVHnjMgWIDI5FjTc+MS
 eXBLJQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhwm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 11:21:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6f8d0bdd023so24452946d6.1
 for <dri-devel@lists.freedesktop.org>; Sun, 18 May 2025 04:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567303; x=1748172103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=seN4YYKwjaMssJPoiSSAk/UJINq71z4OK7vTWwlIhfk=;
 b=rjEvkkgyeIcpXBGlPba/Qfdn/YFEDMqvKNIRZMXEjoUEhZMiPTIivHprjDRjlCYZtd
 /BG9YxqA8/zZgamlYe9RTsxYE2rm6A/IDISrGEO8ix2ts/rKszW6Xg2rzooJ+fHsjGuZ
 nTY6ddb+S395YZMBrgrtvZtjmsJrZENOj6MHrDp8a4VGqU9V/LqMykahJ0Nof13yTPhS
 CV3e4Zf/2xXq4h0fs0tppDUJ/YLsioiMHZ0vaHIzoqLIeQ7k0X4wBunSWxa4DATtH/lD
 bIDBtDmL4cwVgXBJkmyPdR0DARULeD0FISD1yRsTJxvwq91nJ7UNRZc4FOrWyV1u9a7C
 TKNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUU56gee64/xUcEIQxctQm+9vb7LNXMbmVSd+Uu2LR69gNPl8c7Os/ObnYNYc5LzEWhFGAEZMzifXA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwayNlzAI3PQOjPJk5sLpH8BmVzCgePrRUwpHsmigLKydoTwD/z
 g0SVWmejysFZvxugi9MjufZLeJNTHdpLhhBKt0+vwSXI297u3DKDZOYlnATYAfu4EyDY8lpoegn
 k+g1CWEvptkZtWIR4J0cmJetEVxcczAaBTLCpHqv++/F0v/URLW4wbxmyny8bJZ/Bz9tndQbzCM
 vGbRk=
X-Gm-Gg: ASbGncuHwlcoGvUVeKQyEdmu6I5I8UTUw4ipFAYlT/qjWmX7Ph6re7+yhJfPiYrk07M
 v3UxCKUPzZfKO/iLBY4/QslhGHVdJMUmWVEAOYPjVRWlXmTDhBn1LoTLBA1+2XHcq/KUeJWXb1B
 QzNORBoaDWu/hjisawcnsoY+OjcsAr+PgZrBeuKzvCIRFy1eNRFx7rwilxAToPUE3jYa+C5zFau
 +9CleBGAsjlgHGkcJZhSyv8nwMr+QhFTN3Ni0GFzYe0IEeqZrSGdoRQK5G/OL3ZK03sQQXEMDB6
 +eJi3mDBD9j2mNji6BihG4T46MPCVYUfWIZEPjbx1/i+eMxRTQRd4kSyzewyPJIsJLQfEcpj6IR
 uLTTgf/wtMgC+GnPZmpQih695
X-Received: by 2002:a05:6214:248a:b0:6e8:fbe2:2db0 with SMTP id
 6a1803df08f44-6f8b2d15198mr130437716d6.30.1747567302890; 
 Sun, 18 May 2025 04:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHom7w+/F5VHLvfNBFeNm/lt02SI6nyFasMUbdwz0mFjeIJfWFMkSxTZc6WbCqk9JLZN2F5sg==
X-Received: by 2002:a05:6214:248a:b0:6e8:fbe2:2db0 with SMTP id
 6a1803df08f44-6f8b2d15198mr130437346d6.30.1747567302505; 
 Sun, 18 May 2025 04:21:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:35 +0300
Subject: [PATCH v6 02/11] drm/msm/dp: read hw revision only once
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-2-2f0ec3ec000d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4182;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZQK3De9spKq2bOT0Hl1HvbbvggyGKbTI3+3PIdSsFLY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/Hs1HGodxey0UOVjoJO2Kl/jlINR9/hl6O
 1fkgwO0m2uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1bqIB/0eR7M7/nrB8bKHxc+BHj/vguTWWbNuciMREsFKLdHnJ/NIus2916NlmOCHfEJPEvfVJar
 C/pV5dShhMJjpHX39OlauTv7EZQZ7UIm44O65CFA9sEC8B9JHHOhCvXlb0xlMeyPWLW8Wx66iRw
 apc6bhIUYJEHeGULbtNEjYYQosy9kByMe8om9Q5U301UhXL7T0Xs78xe803YpHUMNvPTfkNHqTe
 edgTO/2iqUEtZcKixGT8AhmZtvxHEjc0wpEUiKQDeDZ94KzhB4GvYTvJmtQAfnSOOsQEjhdSwkT
 EtlO3kZhj4hBiHirJscN9TtudorIJw5Zc0SEEnX2e/79S5Ak
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: GmGxOOKvjKAlIkfKjkgDEJKwGp8aCccP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX3C8+a1+jJjt7
 q1hzGShpUEw5U7AkjHO/1WfgJK6eiFjenyssN1eYLbygKuAirBo1bq8IjQXDzkQQIAu51jQCAVn
 zHwoba91ANlMGqrxemJi3Lla/rit3FmW3Ma02XGfqql6xr2sxBXC/1SRAlwb+K2rTg2pvgeQtIe
 w5bgsW9d3BL8f+mRDjKGUYoyWLsujXSzv+qDmPHK1oMfeqN34Q6iqIPl0ZH6y1P7IMdLfd1B/JE
 E8F8xuP/7RqLMAAvIUQHT9wyY9hPpdt6Kj6EAFn9uXEYrXmuqJz+UqxSkg+7/D9yuvFenyZ07Hv
 58OWfxFLD/x+jPZxk/ne4EOAC+KXAwksZa4mFaXvx8UaYzP/eAtApEpAlXooiHEze4CEzwWqn71
 mj63PaQvspSzo3PdxKjvUnNR4ExNuzjI0vYinromT9dV5ELK4ep0qj33wTLG/SthkiqmYEwp
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829c2c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=pC6Btxr2GG0oDPZGBtIA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: GmGxOOKvjKAlIkfKjkgDEJKwGp8aCccP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

There is little point in rereading DP controller revision over and over
again. Read it once, after the first software reset.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 29 ++++++++---------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 4f80eceb6ae19f542110d7379007f57c2ac16a8a..23f9fcb75123a58b3a4b69d3dad0598135108eec 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -414,14 +414,13 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog,
 
 void msm_dp_catalog_setup_peripheral_flush(struct msm_dp_catalog *msm_dp_catalog)
 {
-	u32 mainlink_ctrl, hw_revision;
+	u32 mainlink_ctrl;
 	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
 				struct msm_dp_catalog_private, msm_dp_catalog);
 
 	mainlink_ctrl = msm_dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision >= DP_HW_VERSION_1_2)
+	if (msm_dp_catalog->hw_revision >= DP_HW_VERSION_1_2)
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
 	else
 		mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
@@ -514,22 +513,6 @@ int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_cata
 	return 0;
 }
 
-/**
- * msm_dp_catalog_hw_revision() - retrieve DP hw revision
- *
- * @msm_dp_catalog: DP catalog structure
- *
- * Return: DP controller hw revision
- *
- */
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog)
-{
-	const struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
-				struct msm_dp_catalog_private, msm_dp_catalog);
-
-	return msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
-}
-
 /**
  * msm_dp_catalog_ctrl_reset() - reset DP controller
  *
@@ -556,6 +539,9 @@ void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog)
 
 	sw_reset &= ~DP_SW_RESET;
 	msm_dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+
+	if (!msm_dp_catalog->hw_revision)
+		msm_dp_catalog->hw_revision = msm_dp_read_ahb(catalog, REG_DP_HW_VERSION);
 }
 
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog)
@@ -895,9 +881,10 @@ static void msm_dp_catalog_panel_update_sdp(struct msm_dp_catalog *msm_dp_catalo
 	u32 hw_revision;
 
 	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
+	hw_revision = msm_dp_catalog->hw_revision;
 
-	hw_revision = msm_dp_catalog_hw_revision(msm_dp_catalog);
-	if (hw_revision < DP_HW_VERSION_1_2 && hw_revision >= DP_HW_VERSION_1_0) {
+	if (hw_revision < DP_HW_VERSION_1_2 &&
+	    hw_revision >= DP_HW_VERSION_1_0) {
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
 		msm_dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 08bb42e91b779633875dbeb4130bc55a6571cfb1..379fa4fef9ceb63b20c4aec2fca1e09003dc738b 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -33,6 +33,7 @@
 
 struct msm_dp_catalog {
 	bool wide_bus_en;
+	u32 hw_revision;
 };
 
 /* Debug module */
@@ -61,7 +62,6 @@ void msm_dp_catalog_ctrl_config_misc(struct msm_dp_catalog *msm_dp_catalog, u32
 void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog, u32 rate,
 				u32 stream_rate_khz, bool is_ycbcr_420);
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog, u32 pattern);
-u32 msm_dp_catalog_hw_revision(const struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_reset(struct msm_dp_catalog *msm_dp_catalog);
 bool msm_dp_catalog_ctrl_mainlink_ready(struct msm_dp_catalog *msm_dp_catalog);
 void msm_dp_catalog_ctrl_enable_irq(struct msm_dp_catalog *msm_dp_catalog, bool enable);

-- 
2.39.5

