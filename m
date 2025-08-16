Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE620B28EEE
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 17:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C9610E39E;
	Sat, 16 Aug 2025 15:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rq2p6ZCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07410E399
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57G4ervY008852
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mEvIV2bV6AlxqzM7m9xsvqcJBh2delxnqohnrAUROZo=; b=Rq2p6ZCRr0spzxZ0
 77c/jJP+Aq5MegOt6dmVaWnsD1K1fiMgfkNxzfMZCTefVuTHV/4/fIak+3av+jUQ
 CZUQ1TyIeYAAiwf86MZ90zppw4ikLmmdYy7UzEyD5U22cD/5qGbrXv6nFTPhJsxj
 KZc5Bv3I//PggYVGIZGVv2+YNg5v1xBzv4lr8oyMxPE3j5e1jrSjZLQjX7eMnK7m
 E+/fWwk4FzT0XWqbU+lbOVqR3XwXUTutn2mNVAAs5C/27u6xCSzKcOwasrm8HGVA
 bflEF9yCI/ttaC2nIovn/RF+XYvx8CkO29dE3lQIOVK1f+ghxzc3dkaML72LyHTg
 cCAHtQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7rsyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:19:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-70a9289baafso57669536d6.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357588; x=1755962388;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mEvIV2bV6AlxqzM7m9xsvqcJBh2delxnqohnrAUROZo=;
 b=lhMHOOqFTwA+3bkLy8qmmmTFPajWcDb7TcJRnE5+NqJGc2HrpRt63mLq+5awjvIQX+
 I8ClPvAhLBEJoxAfQR2ufRcbgreOhGkP+FIMekkxmqAd2g+A2mm4kE2rruE8fCtBURMS
 rrHnMjJIDICdBYawvt0B3ZejN6rvYDwJuSb1s255W7wYa8T21Kl7b/s2/TJB4icpwJpY
 VAcKiY54ssoRWRfZaf1VU+R1bNknjMeGZ/TnT6ngf/hSVAiyN+AcNAhw3rK/eIsqcout
 Wss0NV4oEuSZunEY8eFao2oPdKe1r1YEW+SRojKkKuROTmHI8rVjB4GyP4RrhepY/2aV
 3yHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW93LxQx7K4qGs6PPInZP4XKRVAB4dlmQd2MCuLMcERm2hTdaX33yQ0I5MfCsK/NOGVmHlpDYsRUu0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw1KpROCEot6j9+3w1KaYhRvU35xQPrQU7flnKo2rIOXDiVI89a
 dRb1etaAS3ScRRZSpzkHDh1zQAxiOhF0j2C/zFyLXYodp3rciWa7JPe+OBxrf5dQlJRwlBnib+Y
 0K9CwHGu2+tea28OZbKFeQc1yP8486ApcX4eMLJzFgHVO7Cirlhi7eazJyOrbpmroTxRiglY=
X-Gm-Gg: ASbGncvVWpZ0en34diI9XrWnCSkMyv45KQNtqtPlFOvgqaMwHZ8ZHxtNUHj+p+P2IK6
 wyjjnMRokWloePWc0A62g9OJlRgC6YQQS2p52QdvNZra8nCQki7PScz02mq2z3d1jd5UXRFAOHX
 tBKyuVjCuvNg7AvpcP7GgoprYVxbMPKoZFifmKX9fJ4RjxItWHhNXFAebduDt8pW8hxPihjqSDe
 PpoNXw3kiHFdVUjUAO/MDbMiAacxVdJIvljMEAscGSEQ1gB82G3tgShzVY36iSh4MMjycG1jVad
 KmEEBpCIf56+zQgQKkg44UAqLs78pc+UJGZcuUBgNq9KjyrLCvaWHpWlICxmkmYXVhxHZfmweuI
 u5E0ysHswWmTQ0RKr6wKYVBOAHY5Uj0rZje0EAdI7vwUEDpOvWwjL
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id
 6a1803df08f44-70b97d50e1cmr134782366d6.8.1755357587585; 
 Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGElAmZI2U8Jde4TU+ICdrflTejDEsiodGV0TbuZxZ/JkbA4U1g8hagzZyjmkD4GE9Spc44Eg==
X-Received: by 2002:a05:6214:76c:b0:6fa:a5c9:2ee7 with SMTP id
 6a1803df08f44-70b97d50e1cmr134782076d6.8.1755357587134; 
 Sat, 16 Aug 2025 08:19:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef35965fsm907579e87.37.2025.08.16.08.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:19:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 16 Aug 2025 18:19:38 +0300
Subject: [PATCH v2 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250816-wb-drop-encoder-v2-4-f951de04f4f9@oss.qualcomm.com>
References: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
In-Reply-To: <20250816-wb-drop-encoder-v2-0-f951de04f4f9@oss.qualcomm.com>
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
 freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1817;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SsfbY2BgCwVOdMoS0AB7dKBbl1htE78XemRzUg21Jp4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBooKGJdDsbpspC67fG8mISRpjdFMuBL5GkSkS6i
 1YB1BXzE2iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaKChiQAKCRCLPIo+Aiko
 1R+zB/9gVJgtlwuaXv286oPUL9YSSVxu5wvJRyS4WQ5lemWaU/gD7xFDGPshn+e2TlAUr79nPTK
 96TU41SHn4rJvfF1yjT5zrSVt39knNzks20P0e1N2/kooOaxT1XXy2MtbLZ4ttPfwnQYVHz49ZI
 vrXB8KznoEhnSXUNJSGt91MSRuu8BsA3Ju2EPpnZ9OcPApZHYZgeSbTJLLX722M6HN82yun00Mi
 h5EbNOZ7z599t939ktW4ogS9gFbXrfpH1OSTFHXNmrGEFgNJtlzv7sSSC27KYq1rMFBU3DSLW/z
 RtCbCCGPzLhyP8pkwOvuLLihiQ+pB9/+eq8ylzIiVxNO/dOE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX9CB211VT0qlX
 FjDg0zAZx3D1ehU8DMNjnZi/cFf1QNxDEWb+MHIfqsXZ+qqtfsCMu6Vn2KrDsu0le/msVTKyuDc
 4az7DGoAARgsNIP4Cf202jWxYS34vy3UTv20CG9y6fbqtQJHLMMgGiR4vwHLgWwxo0wxDLsIRJz
 GPfyvK9hZXQK/IvKzgHaB3oH0Yscqsn0gQJwnkccXpo4gZADexVwHBLNAmL46QNQcMGC3JDwGm4
 llNSGLMGH4dgpomuWFHFWF5L7CdUOtK2dSImeSDkc2jNvDvFi7N7hBogwdJWwK+/vN5bXKIkvY5
 KUAuZtDy+EWDAE6Pq1++VpPOhuDoUO5asjw5KYUjaZPO9HCcGQItlJ+XnfGyitfahK5TBhFFxgH
 ELSaNu4k
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a0a194 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: nk7SLbw64VBLWD1l6RrSitx73Lv3lT_A
X-Proofpoint-ORIG-GUID: nk7SLbw64VBLWD1l6RrSitx73Lv3lT_A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-16_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033
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

