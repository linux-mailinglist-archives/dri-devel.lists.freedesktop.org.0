Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B86EFCE53E2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 18:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E84111B01C;
	Sun, 28 Dec 2025 17:21:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tv2gwtYh";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y59afORV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5111AF7D
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:50 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BSGw8N53554398
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=; b=Tv2gwtYhe9LuT/vl
 Ms24ndeqFrDVwYDolDRONk7c6Ce4NYzZY8Odkhnhs4DIf3Pim/yu/lou2Jp0JKmZ
 2yaxQGEz/r6vwzHWz6ytkOIi+qi4rvffeaGBLT9ADJwpNFjeXTK258jJB/lGrWUO
 30uFqgIcU/KBgho1EeT4RkrkVk+lH0gpB532i8rnllVykUX5Zv9/bZdk5MgHm5Ma
 vp/lyrEguZzkTs56kUHRgtkxJ0wMJbxrGtZ0Wc3bb02VnB8kJwRh46BV06xX3Yrw
 3wC3Sgxa5rU8a9wwL2/VCOBu2tZcI0QZ7gZl2F5HGIgDaRYYWdclCS/IsA3UYs0O
 BgSO0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba71wtgax-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 17:21:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4f4a5dba954so217581281cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766942509; x=1767547309;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
 b=Y59afORViB0lw7GYRtdrda/t++K8XeH2+AV1yt74KRzOtzmkhyWNlkB1SQZbSEj6yf
 3eQZeN9hoTXxuHJpkmmRLgqoMTk06peTf29xRN93wpHW3gC2R/LnzXj76qbqeaCN5r33
 6yUnCVLIwA0fVoBr//FdjvpqgppVujkK8bqolYFCVDxXA9uET9kyF7E/Z56xxmuNDPdJ
 qyQeUgU2U3mOlrzruNEntoMo4gFXHD5TIviFNVovRna4yNjn8KaNbGXZ0FS9QMbIS0c+
 MkRgPQQWZ21M0sVFSDKEmIU1/O52+ytU4JftTdyul8/PaZVdT554KkkCg6ht9l+tI/C0
 kpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766942509; x=1767547309;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WlmKM553K65TViFCjEWO6I9vFd2gpoyFCkRuwRh01QQ=;
 b=UHRy5vRuHkXIujlpA1P8nukA6L9PLjZ7D2l8v9G2qVUQbFuHM3zWPH2nOFDD5tPuPx
 GxxZt7zQypsfCUknEEXmHo/Lc67ZTlQ6uWAZ4eh5uXnR5ZsojDRDvyowhJLYOkhF4XgH
 BZEyrbSXfBDsEKAU/3h9RX1sRbWSe/NKZcLikhar+ql2EQ9fka7fXyJ72LqQ/Ama7Tsr
 vqxn+vTyhvzluIx+VBV8hJOgfOJYg7m7ZdHyckAMkpIFT1HMj7yWIV7rFxnOLsufJgEj
 hyruJkWcYztJd34Jd1pFRIyZdq0DnIcE8ha4wQSXFpjg5eRXHjidC4fuQUb23RiVHLqd
 l5mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUglXj77V9MpJzzMC/aeNgD6uj3YLehZ7k8WeCfvvr4tqISdHPoy4kWUllJ8MpmJ6NK7WnzREIq6pM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGr/LQeM9CstaZp3A18N45jUojIUqCqqNMLUEqwT5vw7aRMlLm
 SWe2sKgn5zNSKlRYDisPxGfs06srI4bTbDQw2ylblRh8rwCQorU57nyrm3IsVv/FKmJsMWhFxE1
 7jqXsvWcgAYro5O6vgvqbYX98mGE6Nkq4vvRIfrd7Z6bD6CpNfteRLC7pw6JUTdMHyNwiECc=
X-Gm-Gg: AY/fxX5COMYj0yo/xxhYOzlotQHCdYFtdOpR8POZK/GaOnVlk7BlKKnJCMjTmgHbnDJ
 Cu3JrhLtEtucVAaA4l80k/JGF79xye/9jEnuZLlAmIW9GwmyKiOPVP0aPeHG6EnurB2CMIn57It
 NAESiQaSCS7nb4zZJWf39quhmmkEhaYB9CLJ2ApYgY/3SxR1mN7P+w8DkOyeWOKRD6oF7J/Qmp6
 cl3a0rWVJ7L7v51kWPEqXlSfBG0yHRPmk17fY+VfqCQFii59gVndGkIpod0oKXJai/hI0yxVKOM
 V4XH+r3XUyVjgf9pN5qw2iaZ4GEXUrKGlaqz507GjW0iMC+GSDWI0YBe7vKoCq0YogvJpttb4Wx
 0DTz11C57Iei+wbZ8qZb9G3T2J8KZ2NbT3UYaIpvLoyQ4E+uUKLPeJLyVR1laUPzF6A5HbHMKXE
 696Bcczp48alWr/My0y+Efi2o=
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id
 d75a77b69052e-4f4abcf6bd4mr375254361cf.30.1766942509450; 
 Sun, 28 Dec 2025 09:21:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEFrvQBeWUWGNN3K4NBz/4O0OOqfjaG3q3yoWI/L8raTZ69fCS8BqISuUrv8qLP6Fu5J6f5g==
X-Received: by 2002:a05:622a:1e96:b0:4e8:a9a0:48fa with SMTP id
 d75a77b69052e-4f4abcf6bd4mr375253831cf.30.1766942509004; 
 Sun, 28 Dec 2025 09:21:49 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3812251cfffsm76871031fa.19.2025.12.28.09.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 09:21:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:21:37 +0200
Subject: [PATCH v4 5/8] drm: renesas: rcar-du: use
 drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-wb-drop-encoder-v4-5-58d28e668901@oss.qualcomm.com>
References: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
In-Reply-To: <20251228-wb-drop-encoder-v4-0-58d28e668901@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
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
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Suraj Kandpal <suraj.kandpal@intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2248;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y1SVtonrqm+Vkemj18tTHMsAczaNy4uKaP+Hxds9BuY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ2ZgulKVA3M8710WTzVthwCt77+n/UqL+imglvP1WFdvU
 tLLKu5ORmMWBkYuBlkxRRafgpapMZuSwz7smFoPM4iVCWQKAxenAEzkezUHw3y7U6W/2AzlY/ga
 czVnPbq2vnf5299Hzepef3uYO7m4ILF8Xvi89I8fTDLiL9jZ7msSvvcteEb+PRnLiywNT65wSjd
 9WTeTf62lRYW4XqEY+45Kz0s7luTnK05+bSO9I7brv3u4i0bg35NH9VqXHJhjoel9Z9p/rWeb67
 +tzj3Zfe1rrcfTwmPrWIX7fvmruEtodQk2Nex6ergx8JPxukwBbtX6s44LXyZtNJSUcMnwsNxXM
 +uVmOy66LWbXgetvPBps3TSps/7bZiFLkc++/Gr7uvXasdZuzsrzVMv650XsZ1VEmztkizw/8mT
 /bwfuevOfPPw4n9Sa1EW36xWF3eYq/xlwsvVkVcsC03SAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDE1OSBTYWx0ZWRfX1ejkneQDfNHA
 QdEUSOqA2APW+kQX1/ZJBgsGfDG4lgLKDQ+VbSqiry04r+wGY4TScqkPzW1PMv8Nhx9aVNrzcm/
 Wsdp0nBpplmDReHpZdh37ilibUmBdOCjjbeMflKcza2QNCimh7oOYrCOq9hVjqCw49MFGjzNgm7
 LN3kPygOYjzEzJmVbzPSuhss/jo4hZXEU4I3kX84gNb4iB9AZ5nnmRPOVb9L/NYKgPIAragufw7
 0qzq8iksYQP7Z2RXfZO5q6EiV2Hlnv0GRyWDWF40ZSdMzpoEFlzeTHni4YispIpgFM/Lm2m2HMM
 I7f0Vc6Arbn1e3gXj4dbB9nYCy7Z0EYgIhvg1rQr7FA1EZtpM9WY/irzcUmim44L8zL8GLCAmF0
 g4bb2F7feCqvuDpj/1Kn0SahWuvpinBDxHbamHpDJp266q/8VDmqhny/uyNt9v7+iZGlLe1LgBw
 hoOytChkaMRSvrs6jVg==
X-Proofpoint-ORIG-GUID: TUh6ktpYcRwjp326Ub5gIX_7RIyDOJuE
X-Proofpoint-GUID: TUh6ktpYcRwjp326Ub5gIX_7RIyDOJuE
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6951672e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_06,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280159
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
index 8cd37d7b8ae2..64cea20d00b3 100644
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
2.47.3

