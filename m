Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077ACCD58FF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD1810E34C;
	Mon, 22 Dec 2025 10:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lW4H9h7j";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DqECq/1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 417B710E5F4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:06 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8QHsa090252
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FQG5BqsGnCi
 ZEwc/eMkHo/ya5niea9nDglgo72tq9vo=; b=lW4H9h7jjvTU7HPAwzt9JGC6fyY
 d0sQxoaKD15QBLsBwb2EIIaSWrrYDzXcC/PIPMbEjWa4ESAH0bDvn36VRWHVuIEc
 0fC+bfZcY2+/IqcVbAt0hJhohcZQrMdJKhUjVXQfzR2XRIoN8z7j/lRwyxHvHqCw
 1Xjl4njxNzFmWmRZnZ0ZKbBzzOZow4yadZyxAQPqInaN2gOzJp5jKwlIYu4ejGQA
 i8fCHRz11fVzCw2EVCpgQ0yhCbVIqRy0N8ieXv2PoMEsHPym1y9Bk8oVWzd/p5g6
 1QGswrZJSJScH+AwKYS9ziC4+LWZXfbbGP4glPo3hlytpFIgy7JEGo4l+Wg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mracn84-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so88994901cf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 02:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399105; x=1767003905;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
 b=DqECq/1/lUC4CDDq6oZ0QybKLAjxQxjMR8l39lpnOS+fz2uwXtip0T2DpUBMPiWVVU
 XTbZT+VCgAvlmzTJ8w+rnyVd10AaFl45arLVaC0zVyDvH96Zw3/A33Bmk7meO5LVXiY3
 0oEr3EyeTCSd+hKaor7dwS7JvJDzCHZ+lJ9NF8Zm0CGhusG0fU/peo+poffB620cAKL9
 aE3sVo+kXwxdnqqE2BWWJLeCzM45KSLm94mi7uaBKeBqtTpHdhQraR7QwG27MtjqHwOQ
 jnRqtNBzXis1xO+qr5h/aDvuEalT/Vqrx0Hm3SjFlyknJelTL2Mbu/SY2W4yViZRfCuF
 EiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399105; x=1767003905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
 b=YyyV7bx5kx/JSzZHF8/4FT1kd5Rami9S665YD6yAjXVa3olnip1BcfnDuvQA1OXVxy
 y6o6de4OQBqtgXmRkF9uUd77CEZweCUzZBZ0c0Nc517bHNwlUzMWbPAWOyd5DtbEzIHm
 rlyGD84COyvRWWMBpButGk3M0hIN6IIRQzG0OLj32n1q9tAZgS15Pt3XQ6YAzqZrMWdU
 AGgSJ1hLx9Wn0hWczHDYX3q9LwZ5yOz6fwFw5BJM3oNnvFT4ATmCSruFUxIs4QDfTZSx
 RwJ3UmHdQv8qkWkxUaHwM9RWsZfr9nCL25gW8TcZJbk2sC1T+6Opqv5AJ5JVsfVfl05a
 LWHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyr65i7L3s6r1585CeIjNXKDmobHPiFP+qdqK3JJ+BY7f82D1E831fs6AI9hJyshTphh7gwOa+iiE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBHBc/67QmIBYTf+GDG8gsTxDmpvdhTrzehcaq4v86fOLDiKAC
 jzjUTUl7gRk9cbVMlgoo+bHhGbgZye7WtLbUQblTE7rMLd8Rj6gqh3IPwmx469zsKdfBnN4ofdq
 Q61kih/ciQmwQErOLkjIi1cOyw5sOBiBtz5KOhd4xOP7JFEjQCzNIJl1y3sxy8LsTQtPqIYs=
X-Gm-Gg: AY/fxX61vIIBrNi3Bet1IQ4038eN8j+n/h0G0RliZBOmEXQMIdbk6pgX4oD+bd2bmYy
 cA+ktPRBfbsILKM0nz2fDausNm/8jeihHBClOZOYVyww3XCkCa0mFaxHNuS9n3wyZyhvdIyC+3v
 ViritJLgqoi+cp4+oo/8HLR85Mso6MiWSOz40cnNO78VwmzNchHUh4KUP9xi6PCHf0WQAkCbCxD
 FoRs/xmmUKY4lmcG/DqwhDSdAkbxf9FICTKAj4jYF83QuozIFY02ouo0sipsasBd7YzzvJFP7g0
 VuUi/1zJwYZgBqR6Jv2z/bgazdo2ntMR/Fm7E5rgAbex2NDJ0AdnX4ylScRE6W4uHaJN/42BF2d
 HA94rwy4np4LKdQi5jGXwRuO4VWUcGQ7dSzB+M2fUkQhpCb6BiqkRLjoL0cVn22xh/mU=
X-Received: by 2002:a05:622a:14d2:b0:4ee:739:142 with SMTP id
 d75a77b69052e-4f4abd9950cmr152195881cf.51.1766399104807; 
 Mon, 22 Dec 2025 02:25:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg72loQVQ3ROxbdMldRDmJqXKjwUSCWfEGLH0PRiH86vimyJapbk+lJWkciAVHhCTHfsSNcA==
X-Received: by 2002:a05:622a:14d2:b0:4ee:739:142 with SMTP id
 d75a77b69052e-4f4abd9950cmr152195611cf.51.1766399104312; 
 Mon, 22 Dec 2025 02:25:04 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:25:04 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:55 +0800
Message-Id: <20251222102400.1109-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7jnbnsmCSeqFCRvUzkPyyc_OVYIIFCsV
X-Proofpoint-GUID: 7jnbnsmCSeqFCRvUzkPyyc_OVYIIFCsV
X-Authority-Analysis: v=2.4 cv=e9wLiKp/ c=1 sm=1 tr=0 ts=69491c81 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfXwqXLIk3Je9KV
 r7M1cMRcLr+mPAU6cwVcK2hoS0U577pGgeCDSSGB5c6DEkEru7A2L1/3+4PHXPzat5Li50sxmfE
 CZHLoLIWjFnKbIzmpMOhF7Lec3EvE3kRSAhtEC/oT7Owaf6mG4lS6DscrhyIc7sn+oAHu87CR/X
 lCY2UEslQVwlvsLCq6H9AdZySWjw+noHOXcbUN5d+5/fDjmLJXofXAmF1zTOp3gJuOtzdcqpaJX
 I4pAezvTJMRNJSEdKoZ4R4KVNWsPyZOLOKWckXagVkU7Dd/qRm+7Hs6kqeGlxtABB+kVa7X9XJl
 MgueUTWzj9pkRBd7fPw6mNIhwURE+PgQRQCjfm7XfNaKDyAWU4VdY1mus3sjyrmMmy3V3rCx8gw
 uX3mj7oIg8SeL8p0u9mlDmFPBkRwZ6puaGUxn698VF3QIwOJ+SJ3ZnDKurfqxaRrtnfaf+7/jSv
 4bxRWvXaFQr4jd+n0tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220094
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI PHY support for the Kaanapali platform, Kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650. However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7937266de1d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8650_cfgs },
 	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
 	  .data = &dsi_phy_3nm_8750_cfgs },
+	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_kaanapali_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..c01784ca38ed 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c5e1d2016bcc..8cb0db3a9880 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1504,3 +1504,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x9ac1000, 0x9ac4000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1

