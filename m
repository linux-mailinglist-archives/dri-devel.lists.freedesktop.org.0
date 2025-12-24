Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3DCDB05D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 02:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC010E2EB;
	Wed, 24 Dec 2025 01:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl0jOJV2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSwsJsdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060C310E2F4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:40 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNGOEAZ1018224
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=; b=Bl0jOJV24JiFPMET
 xHzSY4DSukQHLXYvaS+j8AC2V1B7oTwCX/V4HE3eWFTq5cS6OcPRyrAqVDY+qCpe
 qrFYm27AFt8KkxgawPYL/Fe0FaD7KkT9u3yDdi2AmiHPp++bl3E8ECzsLRIu88Jo
 PvaOMF1dSP4/LJTXL81dgO0Pa9pdcH+1O6q1pRDc4tlgrNHbr87ywG+rGaofvEBZ
 XzUlymhYYoz5ryyo4G9IluagRkMxMBkjTodNRJQv/iSAW66J69otOk5hjpFyATm+
 s9XUpm9Lf9XcyKMP9SFUa7aIWGdeBNgNefrwznwxC+Mhh+cGxaMqYAk14PEYEr89
 IcsumQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjs9ahg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 01:03:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-88233d526baso157871316d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 17:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538219; x=1767143019;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
 b=YSwsJsdX71ggIBHgCEWMGI4WLXx0cO+E2yUj8ufAYDPaMiBdew8azUlrvnC0zKngNN
 oE+pOuRkNxpXAQG4n/FjnXUQepJmilcOKfJ7dQu6tHADh5SS7tzpqJb7jGj8GXVMpWXY
 6Jz+tC49qpZVf1qn8BmIW9HraJhoErM7C+uztOmH0AE1cIs0qreAXBn8oTOWiss1zQ8A
 DiR7h+3leIxYDD1fyrVLDC+BU6af/zgRgJE0cYyMxY++hVHnVgruBFS+jRu359ZXPAmA
 mSVUCZtuhKtuQlwL+5gIhzsUvRYcTQVDZ3R92XV52QWQdzmqZYvFzqoRdN1lvJE00DUy
 smdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538219; x=1767143019;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=j2BT4ALqtU5AjsTQozcF6Tmng8niaFOYcGnl/GxzzY8=;
 b=L+/+/yHSKsmbakN5E81NBSuY8K2YSZsrn6Mie9ch+oFTQMTS9OCpDMM01unYNV3SEV
 rhA9fLSXfwCo79sVCIldnQPEAJn1Q3Eyvxsc8we/hP9A1H+M8prCl81oco66dv2ld50K
 asUukgDQdl9ltxHRonWMamfHilCDK2tirhDZoi0mc+EuBOXI1SMPe5XcyVRqcZ4ujDtD
 hKTgSPZtP8WlR9YqUGPXxI4OyFGGVJWwu58DW+PZUsyM1de1QJOHF2O5Eq4OS+Atpefz
 fgGvLaREyQsjLoe8mlariX/MINI9SeruT6JlbknjoUWNiipUGClFb+ypDVm0uSR0IIeN
 dlgg==
X-Gm-Message-State: AOJu0Yx7kBHCFs4VNfA8siAwO9stV+K6/RRpRxgDmA5Hd1u7TjmUMLOH
 UhUUUiEymV4iFJe7kt/EDBuc54NayTRBSVMmc0t4vYEPOPck7erUk6TGO7+ORcbarNvnMVk6abK
 dCn6el7tg+WQs9V4HryX1iJUQWKaxCQGLRwX8d6WCbwNc7j2AaGbbOI9cJd/9NYJfWwZ96tY=
X-Gm-Gg: AY/fxX42ocvVjEj1dTNvF3/WD6OWD1GQsv+c3PPj0vtWApdjK7o02yXdlYOVURZ3GHo
 nyvNs29Htm/ktPM9CKsbn61iwenwLDsHGGaV6j2FPO7KVfUKjYuT/CVuvIFxqu7kIDuFLrLBVG6
 kunDsf8CLz+dTlzmZby0A0gyfR3ORKkPdrtQArmkukYtPxo9EA8052ZMixSu7w/DzKDHLR3kVMm
 KHcV4TwGe4xDnSKZQz5K3d17jpSnzuoZ+6ahLas89ixtBXBLR/cYx2LbTKf6VMEqcsEtbPNhPmK
 FtChVVNl7WkVqSEe+q5tz/inY5qWrDFATgYec5le800QDitJ5uPPDRA4yN2ll2g9hGRMVdsQ1JI
 IInjjqh5/ugtAHbr1Lb0G8ACcpwchRSYhyUxZmO+/R2S+k0/BE78Ewi0DNv3V3ZL1LwQb0/ijbt
 QJqqnO4VpHjCjyrQ8m0cTChi4=
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id
 d75a77b69052e-4f4abdca79fmr229405991cf.81.1766538219488; 
 Tue, 23 Dec 2025 17:03:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwvXGbOT6oW55CWvGFCaGI9Z8vq9+dFl2bwrw/ngJaHdkAtC4PTePtFImzvZoy9oibBhKF7A==
X-Received: by 2002:a05:622a:5983:b0:4ed:aa7b:e1a6 with SMTP id
 d75a77b69052e-4f4abdca79fmr229405351cf.81.1766538218943; 
 Tue, 23 Dec 2025 17:03:38 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:03:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:52 +0200
Subject: [PATCH v3 03/10] drm/sun4i: hdmi_enc: implement clear_infoframe stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-3-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i9/GyfQ7oCfW1uA2EJ42B3bpRaDaBcnVtDJI1DBQZYU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvY+d+DN6B8oFFIbxWN6Mv+qvpFGNgFj0Zg9
 429cFCSW4uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72AAKCRCLPIo+Aiko
 1U0DB/9O5L3yXk2jLLqOmN8V6q8wWbokThIMSYo9wxIHSgy0M5PT1YvNv+IkCrajuHc7rLm0/Wy
 cAHvtRKaeF+QVunb5Ui4hiZx4SEbTrbizizbDcBXrW4jWiZ1w4OIEFSo9Ca2FBA/eLbTNfYILzi
 HQCpFhDfzos5m2svcelBiHZqryy14l9P2FF1hFVv73xKqoG79GEfcN56cxOyCxeLVVkSb5izUXV
 /Qi7gDaaGNrZhhP1D1d2VscJWoEi/L1VJ1MTZPr1mxGEaDugo8tx8aKiQtr2Q++hnZkOcfFfbZ7
 adTRg5h65Vh9hNP2Kvva0EBQb2XULPOZjxhcE0hxDNYLkX4A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX0EoP3xUvhIm+
 8XKUFkxWCnUmTvxBSohA9OKySzkwibFmHpO/QDW8+iDHcvb4yd12yqRM+7L8VSUWAouRTyZW478
 qC6SmgaJ5xzKNaGZZm3EyVQ5UgTdptuaHVXzyuEstdqsk4Q6qe1uKIvV28oqq5kC5GcDI4Pg5Vq
 EfJ/WS7t+LJTCnRoVicTa0YG5TRSRLs95jSCn8RmBEcs+4BWNXxDJMASBALiCoF162spv7bZNAd
 i3SLWojMdGXhMR3BliSuq/OD1UeJX69AP8yY/M/litpRH6P45OuzUDjp5A0rZ3A2Et/FAWczorN
 7guKkhz1PrA3IeJPcK2DV31dWHqnI1CK2D3kiEhR1kThwfNuhLtWBzu12oKKhLebkkC7F5zHfkQ
 wC8WYcNLIghaFIOyiFuUTQ3La9ANE/TGwd1G8Ii1xe7sIPMQGPSGhbRZGDYuiLYAImPJNyAbWpo
 uByBqVEzF+WZAXMMHtg==
X-Proofpoint-ORIG-GUID: nCQnIE_tpzk0r3-jwNSCeRIpcW_Hr3bb
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b3bec cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=J8re_t9gDAGCMx8MSDUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: nCQnIE_tpzk0r3-jwNSCeRIpcW_Hr3bb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240007
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

In preparation to making clear_infoframes callbacks required, add a stub
to the sun4i driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7..6263ee15880a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -40,6 +40,14 @@
 #define drm_connector_to_sun4i_hdmi(c)		\
 	container_of_const(c, struct sun4i_hdmi, connector)
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	drm_warn_once(connector->dev, "clearing of AVI infoframe is not implemented\n");
+
+	return 0;
+}
+
 static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 				      enum hdmi_infoframe_type type,
 				      const u8 *buffer, size_t len)
@@ -236,6 +244,7 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
 };
 

-- 
2.47.3

