Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F44B2CDF6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 22:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1637F10E67B;
	Tue, 19 Aug 2025 20:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bFhsWMUV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B2B10E67E
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHTe68021776
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=; b=bFhsWMUVsK/mgqrG
 NSHunI1XmlSLZElpNwvyRiwZ/3mr5cI5bLIb1UdAw8uev1a4V5yaOTBLATlcDjlo
 W6T2VMXL2ko8M0yuICaEq3v0kpOrPxbN+up8MuHWL6BORh49znwHpRqIRtEx1mDc
 Q6cEZwHXvWMCRPEBCjTph0OTdUlQGHZihunQzqU6FywZhRRDCD4biEmpLD5B/rOu
 1V4uzyP2u4Aki5+U6rZL/RzVEMNqvk82YODQUSK8pF0jMFx1zxqkq7b1qgiBgMOn
 zJaJnoJhF0utusTDfKMs7NoYxNWPE7UkQQoinG1T6hTc7q4t+al2Yt7fkJCIMBba
 D7heoQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m71cmnyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 20:33:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-70a92820fd0so56649216d6.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 13:33:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755635592; x=1756240392;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qV+1O4itHxYPrihyEQKWirrQ3uqLooPtU+1YJ1+NTiI=;
 b=VECEw2o3e/UzdlRTN5IHmwKhTxlBdRSDa8P0hdb6A8WsyEa32r6VJM8gXgv1FT1CMt
 Zz2F8OEEoFV6VkIl8qTzp0h+9e7q4ZrdrcMfP8hzLPejEh6OXRrcjR2wg8/D+8H+Dzpf
 u1PG750mepbDyn+BivlhyfKoqokTzk90H2HBaYLevFR5q/sdH36cTnI1k25+gJRU7SDU
 Lm+3xdaKUOeVHO6izWmKImdQYV71acKkVSROs750eUUpuNBp7YM8Wu++z7+eiiFT4uP7
 Tf8Jpvpas8RDhPliVb6oGcobvzIEt7qvIycNu5Qf9S2EYkYnmpY3q2hTb3Gno21kEp8d
 qFJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX509GO8JB1Ui+h8txScgdX1vBIxHh0hx2OmvNq11Bv+PQlChTpMmo4I+HbnvUH+CXd3aTJpVT57fg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyHCYzOpjExmusfCnToN5HNe4FjYaA1KcgwCNSvn2Rt/O0CDzY
 K2FSs4L0/3RrMnDexEpcWArRefLS8YOU5B+JB4ehehjFVSL1REoR6y+QBBxvLrZ1eRWBGheoQVm
 8wR2e2ANpoKkV4KsgimDeDwVBi7VgRAzKhWmDChlab3XLm9IIj7qQeTppeSjEtyVYqZ/QASQ=
X-Gm-Gg: ASbGncv6uDLu/we4w/5RUC61Rt33IpbQ6VGn5gXqBHpEqS7WoKPhWp5EKC5Gv/ZdZMe
 vo8nIAsWXJZZNsElG7trvIPlBPSxyDNcOKZKDGivD63qU5COelz7Jx8PVcGb2eVkAQjSgxSpis7
 Syom+dXYuslr8I9KRK8h9Eiz93ivOULYRAd99vkDwwTqakXAMovJy7IrMj+0uLXN6rj4vKKCnSL
 leoS4Vbf5LQhd8JK7+/shuxSmrSKnZEpUNrM3gymnsGQcqe1Fi69eDJscg+rZ71nRAyGwCBRs5K
 r4zz9rZftKNLGXgTWUH95zQrSUZewj1ccCFiJh63K82CaPnBuGCkYW0QFnkzNf69rfNWgNfNjdy
 XfiSh7310SQGZCYKWpbEJX0qXH64W/7GsBVdNrNx8eKzz1ay6HnOS
X-Received: by 2002:a05:6214:f2c:b0:709:bc45:b9f7 with SMTP id
 6a1803df08f44-70d76f57943mr5196556d6.14.1755635592220; 
 Tue, 19 Aug 2025 13:33:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDKziY91eNkFu9vLBSCg4AutRFh33SncxQFOgdnIxYVcxqqICtOLRE8iLeaVF2g0WJIIGjAA==
X-Received: by 2002:a05:6214:f2c:b0:709:bc45:b9f7 with SMTP id
 6a1803df08f44-70d76f57943mr5195916d6.14.1755635591529; 
 Tue, 19 Aug 2025 13:33:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351806sm2212969e87.13.2025.08.19.13.33.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 13:33:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 23:32:59 +0300
Subject: [PATCH v3 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-wb-drop-encoder-v3-5-b48a6af7903b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2304;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/fLUas0t6+pmOh4Lpow6ATkHgTqazIs0UqCL1npG8PE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBopN98epbohhlNRN+h1NEK1xOyQcbh7iWhPdJwQ
 SZcAvaENneJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKTffAAKCRCLPIo+Aiko
 1bc7B/92b1GUfl19mLZdEdSZGXv/W6zvpY2/xRH/vjYXBUUv3SeYkNDpWGIJYROMyeOMzlycp0t
 99NiJcVMQjHVA9trbZTbH2fW5xaxO9f2xrJEiQI1dGEDFh5gnRoB4crRkxVTZ4um6S/atfDU271
 6TMvCy1ix69lUxiKHMicdLVMUhrFcQZOqKEjZ6ZsuEFxw7QP2lR4k1YTbAiQvvheHYuoUqQKxhO
 2dPVz0uaYuzwXYgBK1DtPqxj7JW2d2/YLaeMirNINj3QRZpAf4MDcQojRSJ7ALdp4yatPvOIFx3
 b5mdkvmeWroQkwwNhePwPDJItO+iuBw34yibnRlo48wTJ9Xr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Z_jmH6AWD-IOiK98sPyRAu5tzmwiKoJP
X-Proofpoint-GUID: Z_jmH6AWD-IOiK98sPyRAu5tzmwiKoJP
X-Authority-Analysis: v=2.4 cv=IvQecK/g c=1 sm=1 tr=0 ts=68a4df89 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8
 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDE0NyBTYWx0ZWRfX5hiyGrBHxjgY
 zoadOQa7zURCn5G32DKINx8aQQ+qCt402EHeseHyuCwWyEw2zvTLz0mSNTkSpsMLpMew/Bo6vgE
 NCMIiZqULZmSz+dYv15ylXt4XfGHF2ztZLKFYBz2j6pt4w35zkqx9k+p5HK9sSZo1e4pZYydu0D
 qJm3OLRmrKIqPcb12kUYsOmRutXyRZcFpg/2nqepPvIYHnuHmdfM8A2CJZT8v32G4xYsVgyZtuW
 UnVSmx1jqEHNKgeNt8bReOEJwSoX0G2AUOCQS6m6dJezWCGezpEOt1VgvXBLv1dv1NOKF/9T+8t
 vFLzPoTLTPI8DyDyqf+6FxQ2LiXpZoX+RB4d4jyiIh6cG+IwSK0nPUEh7A75qe437fo7uoHQtUW
 Kb8/kFFq
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

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../gpu/drm/renesas/rcar-du/rcar_du_writeback.c    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
index 8cd37d7b8ae281cbc1fd8cbb243c621174517e23..64cea20d00b38861e22fc53375ab41ae988ceb59 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c
@@ -134,7 +134,6 @@ static void rcar_du_wb_conn_reset(struct drm_connector *connector)
 static const struct drm_connector_funcs rcar_du_wb_conn_funcs = {
 	.reset = rcar_du_wb_conn_reset,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = drm_connector_cleanup,
 	.atomic_duplicate_state = rcar_du_wb_conn_duplicate_state,
 	.atomic_destroy_state = rcar_du_wb_conn_destroy_state,
 };
@@ -202,15 +201,25 @@ int rcar_du_writeback_init(struct rcar_du_device *rcdu,
 {
 	struct drm_writeback_connector *wb_conn = &rcrtc->writeback;
 
+	struct drm_encoder *encoder;
+
+	encoder = drmm_plain_encoder_alloc(&rcdu->ddev, NULL,
+					   DRM_MODE_ENCODER_VIRTUAL, NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &rcar_du_wb_enc_helper_funcs);
+
+	encoder->possible_crtcs = drm_crtc_mask(&rcrtc->crtc);
+
 	drm_connector_helper_add(&wb_conn->base,
 				 &rcar_du_wb_conn_helper_funcs);
 
-	return drm_writeback_connector_init(&rcdu->ddev, wb_conn,
-					    &rcar_du_wb_conn_funcs,
-					    &rcar_du_wb_enc_helper_funcs,
-					    writeback_formats,
-					    ARRAY_SIZE(writeback_formats),
-					    1 << drm_crtc_index(&rcrtc->crtc));
+	return drmm_writeback_connector_init(&rcdu->ddev, wb_conn,
+					     &rcar_du_wb_conn_funcs,
+					     encoder,
+					     writeback_formats,
+					     ARRAY_SIZE(writeback_formats));
 }
 
 void rcar_du_writeback_setup(struct rcar_du_crtc *rcrtc,

-- 
2.47.2

