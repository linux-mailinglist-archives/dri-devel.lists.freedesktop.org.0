Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772BB34344
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 16:19:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF69610E4B0;
	Mon, 25 Aug 2025 14:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GcldEwMH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7539C10E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8LTXV004455
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7R+hTtTaw5ToTCdndEqM/Un8EO0K3ITnYySHNRTUxeU=; b=GcldEwMHV/S/D5Jg
 QOiE5JgBkxKkLgrkkDstCWZ/mtTcV5BHCCX0FHXEC0LtpQZt+HwBWOxRpZtEOmgH
 fMq4ZS3SG+YZZbGtsiZTF1AC3rjh+aF//mM8JILL0Y+wyOPIW+SYTrd+D7ioM1hE
 mQNOwiauHRo62Ory+bL6i2ivuVa4j9HD9w1znb0AsjAEVMeiwThjRpzwTGpxHJMD
 H8pWGKWDuNAHInjpJLi3ALERkxIqnFPHAyjEZRx7QZjwYtFJEh9JZ6awMHnUnWGK
 0qzLtEkXePHv1088mp2UROBxpo1buf1ZweaZsgpnCtn22PeblepOrmk36Vudmkt4
 f/k+nQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6de5dtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 14:19:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-76e2e5c4734so4477250b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 07:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756131559; x=1756736359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7R+hTtTaw5ToTCdndEqM/Un8EO0K3ITnYySHNRTUxeU=;
 b=U1yEYD2FVu+YBSepQdVJFb349KPXpgMLmzHLz2YH2dqjrnTkZaiShDYyjMfqAFeDBl
 GY1Kx9MFceSOQHSROpqyoC6pxJwtL63eBFa0WjgDSgQVl1WRrjDrI6uM9VARVlIkboeF
 Thox3F8rmdbZR9EyXiyLD7KwI777EEVLpoIke2Nung7JjmLmXKLDv2n5S5M3JE+EzDqM
 YwO8y1lNwhcN9czf6gSqMZ1QSGqgowcYSPi1PvbW0jZZgxTPDqcu4w/ufFFsL7LJSe1N
 1jWRpKp3vRSRtzPh5lRswpahIgk2P/zPwzCtIHTGcE2t/4d5jec6YnYUmdcGyhXhFvZP
 jMSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPdfcJik0n9uOqlQbHbZYFtwqVxGOLo8wh6fzLvHSuM5vxk3rDdRiH+fIRSha0CJfSv541ERIj2hw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvacXigRVARBrreW7GifbsfPk4n6qCrIQQTsEzdlTGwAxfQx9U
 RAnApn6p3raGEzVVUiexgruMnmVZJmxGWP5ZTohuYeIfeKsmAP4T27dmAK5JgXuywAbB08IEc0Q
 w1twJop8YV0tDe7nfjUm8kxIMnQr+gZiW/zllj45LFXdSHcz+HVbcVtdyYyZmu+Wc4m1q6fU=
X-Gm-Gg: ASbGnct0gWMOR32WVFPB7JWzCVzZx2eEn6M7GatLcQC0k9ygNOB/Qde8yoaBLOUpqsp
 Yz1JixaB9av7xrQgrbX9rFMyNMrv8CZF13LMvk1c1P5bDW9LZ4d3xPvxQuyiNPUSYJLE+dEm+6q
 2tmUD1Bex1kai3CwGfTxskyH8tD0AHTSYyg+G0KMA6AF5DdP88I/RVgDKVUg300QtLSoceBE+qm
 My5wVgo+IilJXLmyinqCXx7LTGa12rQsCeqteDJ54Z8LF51Kvx3o1yYh2HYRl3Q2T7EntWjr6Zd
 Bi/83oVpHYqrY6L1/boufbMIi0qulhHreFVMIrf/Hlg63anDeydD7Tr6I2Eq44YgR35zJDg=
X-Received: by 2002:a05:6a00:66ea:b0:770:573f:fc60 with SMTP id
 d2e1a72fcca58-770573ffe32mr6197208b3a.0.1756131559041; 
 Mon, 25 Aug 2025 07:19:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjmJ7NV1t2qumG5euFKY+e++axraVSZFOy8I/JF9oxRhd3vr0G6AVqJ5TJ0WdytlSZ+NXJMw==
X-Received: by 2002:a05:6a00:66ea:b0:770:573f:fc60 with SMTP id
 d2e1a72fcca58-770573ffe32mr6197171b3a.0.1756131558524; 
 Mon, 25 Aug 2025 07:19:18 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 07:19:18 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:17 +0800
Subject: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131423; l=3991;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=1chu/CyRFrYOIwyNnb7S1JG/A8QXA7TWXcBAfK9Edbc=;
 b=gEe8hTvRJJLhsQmmiybBLmIQrG2tiZ4F0jIKl5ZuNvwsnEohg7D4bYN8sSFgu8jgmUYzGWHCn
 C+HuY+eRJ0bD+s84EKfVlrAooZa3aw+Jn0tJ4b8uaCks7YEKleczjoo
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzNyBTYWx0ZWRfXzM3C1GCjGwk9
 a/M0uL3ZtKy4JES0EQ+/BQBZmBYx50JRK0NpGwmJ3aCT5Nr/WP0oNl6kOEq0gXaInVl0NIzIGUT
 8XHjeV7r3PvhOxqvLddcRvY748cOuT0a8XfWgQY2Hg+6RYWjz1XbPXuC1936zEMvb+ys84OZrW1
 Squ1Zhe6ajG8tus/MXIKnr66FQuH1LsIgQFXZZQuuUDFNdraz804b/UAojI7MbZcDe91I16sbKO
 bWCCiXKkyFW9xYXKzYvD1f7MmecqI/v+U95ePR/GMmy75gjOJ0nX1cDvNPn/YQakrZRfJyiMhei
 ZSRVJD9V6NjdbEImFFkiXqd5VkIbCzYpNKtC/ao5sLXAa7IOypzL/kBQJ5VgLkVBJk0A0ls7SfJ
 gTYF9Pw7
X-Proofpoint-ORIG-GUID: PYim3oai-EZqPfrn73ecWUxAKVnhElRS
X-Proofpoint-GUID: PYim3oai-EZqPfrn73ecWUxAKVnhElRS
X-Authority-Analysis: v=2.4 cv=K7UiHzWI c=1 sm=1 tr=0 ts=68ac70e8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=bKAP0W6k1q0hwOPLvAEA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230037
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add HPD callback for the MST module which shall be invoked from the
dp_display's HPD handler to perform MST specific operations in case
of HPD. In MST case, route the HPD messages to MST module.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
 3 files changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
 
 static int msm_dp_display_usbpd_attention_cb(struct device *dev)
 {
-	int rc = 0;
-	u32 sink_request;
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
+	u32 sink_request;
+	int rc = 0;
+
+	if (msm_dp_display->mst_active) {
+		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
+			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
+		return 0;
+	}
 
 	/* check for any test request issued by sink */
 	rc = msm_dp_link_process_request(dp->link);
@@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
 	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
 		msm_dp_display_send_hpd_notification(dp, false);
 
-	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
+	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
 		msm_dp_display_send_hpd_notification(dp, true);
+		msm_dp_irq_hpd_handle(dp, 0);
+	}
 
 	ret = IRQ_HANDLED;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index b4f640134af544c77ab262d2cbe0b67e1e2e1b3a..331d08854049d9c74d49aa231f3507539986099e 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -567,6 +567,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
 	return to_msm_dp_mst_bridge_state_priv(obj_state);
 }
 
+/* DP MST HPD IRQ callback */
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	u8 ack[8] = {};
+	u8 esi[4];
+	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;
+	bool handled;
+
+	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
+			      esi, 4);
+	if (rc != 4) {
+		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);
+		return;
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
+		   esi[1], esi[2], esi[3]);
+
+	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
+
+	/* ack the request */
+	if (handled) {
+		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
+
+		if (rc != 1)
+			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
+
+		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
+	}
+	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
+}
+
 /* DP MST Connector OPs */
 static int
 msm_dp_mst_connector_detect(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 1484fabd92ad0075eac5369aac8ca462acbd3eda..5e1b4db8aea4506b0e1cc1cc68980dd617d3f72a 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -86,4 +86,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
 
 int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_aux *drm_aux);
 
+void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1

