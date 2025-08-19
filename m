Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2662DB2CDF4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BAB110E681;
	Tue, 19 Aug 2025 20:33:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8Uhmr/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34BA810E67D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JGw5kX021768
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Uae42TaI8vGi2qGQ8bwNSeWnG/c2PiftWqaI8l7bbt8=; b=S8Uhmr/4O+nSPYIm
 2zKbhC/oDjV9DkZ26zlb6qdRRPz5Rnu4ww2ej5v0TmDFmkdYXv8TFVeTP/bGwxsb
 4ZxQ/2im9UB6JRhBSPPadrP6c6xKYOU/sHEkIlTyb59nZdRsVRfqUKazW2GxnS+H
 aaRQM4t55EbBdmsQ47OzwhMocAXF0XDTJo+mbWRGecA/e6GR7IKVMmJ2s4Jbj4fl
 ZK5O0LX5cytxx88P+iIVnB8iDHNFRFHTIUma/cchElwTH8ASfdFxrYbMrbaas43I
 WepbyRcoss2ENw0vXLUxZn+tJtkDSdBp0OkS0+lQaOo+uw1esXpqN1Z1fDiJrdB/
 Lbw0Yg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cmny4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:12 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70ba7aa13dbso108959186d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635591; x=1756240391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Uae42TaI8vGi2qGQ8bwNSeWnG/c2PiftWqaI8l7bbt8=;
 b=IJ2FNGN72XJuPbLeVrWTqzpo1F9Dg/PCjI/U9Xufu3to3Msdi/+GKla0y8ss2kjRmS
 yEQD+tnoW+ITYsI/VuWd6GEz3IWjI8KXK2wSnhAp6qRKEoIg3xMRxRyGWI7wHAa8lFEU
 vCHz5k7gIQcWinyxLg8dQW/BE01PFU5n4r1ysRzgYZTUOOtiDaxQ4Z4oA/qqgX+KJKju
 Atac40s4R8lvknd7UzVWxII/xXytrJ8ALBHxfuqFqPZ4o8PmR6ota62yrHTxpxdhJJr3
 io47+s21MPJ7ob64B8V9RWhQD7wvj6ve21ZvqDRofjMv/ksEUIoUQ5ZLPU1sv1M5NuSF
 dgeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVqkBoeUfIDoKy3fFNn5d+u50mxWGWb2jO3voiNwdNKpkI47ItTEjFgARuaWlt46b1RyabphwnOCE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyufiipzC7SSAs8wHeodi3VSzpSwcvSGb6UOOmg0ohg8pZwd9Ga
 pro8dyhRhha3V9CL3D7csKq2V0ca7zEvXRu6TMYzu08LfxT0Za946nm3QUugS6yBd/XoLmAlKMc
 9SzAYvYXrmaEyPflLYNZ9FUvHCPi+aL8+XjwwSJP1sbpYCdrOTINrLsVwtEKIvDd2VFhiAJw=
X-Gm-Gg: ASbGncuUAn1WjKQXcwgaslK3lmmpmu8ZbMSeM2G/wFAIUzo9hmsDvYFXf7y8PwH7X07
 hjNK9jHyZ9Ctwt9IzV2YImSOcz5HF8lCe4Tn9sZ6tGwZOXHJ5g4BHwjNtkCs3Edk+prHGvQrfTy
 H38MVZJq6fxTgASJNb7TxXtsG+8VsKiAr9luuB0Iml3J+ry2ucm0bKH4ywc26HbUIXnaBmIBu+H
 aGOPInEtOTkRisMItaYC+k+vtaZp0bV5uhfTfCuPLELGL6ZMgHvmoP4oL5aAImsxbVjMxpjHbN1
 F1T1+LabcRG5UMVFZAoxzl/qFDuuREnl9yT4JFI9MTf6PlPUVtE6Jt15v+7Z+DOFrHbS6xFc4nz
 XaKOcZX1ilMNyNPbvBYfuid4b9Mz+FpstlvAmohd+eka2egtXJPhj
X-Received: by 2002:a05:6214:40e:b0:707:4aa0:2f1 with SMTP id
 6a1803df08f44-70d76fb03e1mr4792146d6.16.1755635590905; 
 Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjMUMGSvjeQdbIF0CDnT7P91YufaBD6waHQI6sRs/n+ZhEnj+eKGwawlgjU4rExarcr2ll3Q==
X-Received: by 2002:a05:6214:40e:b0:707:4aa0:2f1 with SMTP id
 6a1803df08f44-70d76fb03e1mr4791326d6.16.1755635590143; 
 Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:58 +0300
Subject: [PATCH v3 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-4-b48a6af7903b@oss.qualcomm.com>
References: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
In-Reply-To: <20250819-wb-drop-encoder-v3-0-b48a6af7903b@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1988;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n7xaHZSSROB+2XdVsucGDeHL2qDsHnv9brWl2LaC/6Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98gnguR5E87tGamvaP6AjPWdsyN4w0BBcCn
 Y3DFYviK+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1cIrCACZlMfXC1ZcXwkARC5jlvs99j4JLrzEnSVtPScea3jfX6Xnp5Sy3egmpoSPlOFc5GNZuv7
 tqe8otrW1rgAZmoYKaWQPBtK/LzQYdu3u91oc3Ox3LhGbAIyK5c7Thl64ufZc5/XlENC8WsV34V
 q1Xb0pEDgNJdOAnN0d5l63dDxaacI912igs103k+ehliPAInW7DUdnmfFXdbnIQ7H45O5AoSTOM
 d7yhDfGWM68rDdlB9nvgMh/Tgra+l/algQswzhz+QQtwewmL8JTifw1PjO2q3eIAGUeon50Ldr8
 2F5d8cwAbCkKPqKEQsVJgrO+38orTXv/L+6y81c0EHhHs1E4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: wjVx__--yvdVSqmx3FdElFEaxbY7Ha9f
X-Proofpoint-GUID: wjVx__--yvdVSqmx3FdElFEaxbY7Ha9f
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a4df88 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=P-IC7800AAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX6LG8SJUTj/yK
 dpcyMi4CzLBMqRX7VYuPXQRAvGbGxJ5jSXrqji5RhNxs/t/gOGfi9N7Ow403RNq7Gqhh+HFkzok
 ud4CEi/EXqPrf2D3nkipSghhv6B5R/RLEk+goPhcTxxp9WAyfwiUEHOoDb3Ugc9fOww4Z9fvJ3y
 OUB8m628T69czSZZiiz6Qli1HlogIxiq/l6yED+2F0b2+huVrM4Y8ppTmeeRJsKtcYc4c49QY7t
 Tznl6IeiCqDm56UFh+0jtvCDPKCRhlcR2yltqD2ngM+OIgIjsXX6wYnbUk+W4VK26/ImbCQ/Abp
 shymyWu1BGtl1aJZfCQuucvAiNYp811McmN0fN+yy65/Q4P8IV6P8dY82eDMWhacODbe+gDzfvb
 5+DZJStb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508180147
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

Use drmm_plain_encoder_alloc() to allocate simple encoder and
drmm_writeback_connector_init() in order to initialize writeback
connector instance.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
index 8ff496082902b1ee713e806140f39b4730ed256a..cd73468e369a93c50303db2a7d4499bcb17be5d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
@@ -80,7 +80,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
 static const struct drm_connector_funcs dpu_wb_conn_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -131,12 +130,9 @@ int dpu_writeback_init(struct drm_device *dev, struct drm_encoder *enc,
 
 	drm_connector_helper_add(&dpu_wb_conn->base.base, &dpu_wb_conn_helper_funcs);
 
-	/* DPU initializes the encoder and sets it up completely for writeback
-	 * cases and hence should use the new API drm_writeback_connector_init_with_encoder
-	 * to initialize the writeback connector
-	 */
-	rc = drm_writeback_connector_init_with_encoder(dev, &dpu_wb_conn->base, enc,
-			&dpu_wb_conn_funcs, format_list, num_formats);
+	rc = drmm_writeback_connector_init(dev, &dpu_wb_conn->base,
+					   &dpu_wb_conn_funcs, enc,
+					   format_list, num_formats);
 
 	if (!rc)
 		dpu_wb_conn->wb_enc = enc;

-- 
2.47.2

