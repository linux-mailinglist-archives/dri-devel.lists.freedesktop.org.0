Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27944B182C7
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA87310E868;
	Fri,  1 Aug 2025 13:51:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ot71yDba";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1DF10E868
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57194rR0020480
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 278QZ0lFfDm835VGauRYZsYszXs7O8BAZXSyOh2pTg4=; b=ot71yDba/AH2AD6I
 Mj2dOXKQojk6IRbIcHcc2poCjsJKGX4bm8HdAdEldXhvifVAQe7sLwhUihEUpDxi
 Pl1EpZu8O1We7/iLGosinar8YzZVZdqFxpd4LK2SyUoHWVYQJ4ci6M0px+NDMHhX
 TWDrEjYRBeN3bW4rjWFBYqF04YLNWilWVI6WjXUBHVAGo6EpOUOyOG0lPHvjUaS7
 FWyYNsJtUvWoilTT6LAhGtrPZp+uzfxD+fG908le2MPVxQLPA52G8WkI+6uoF7zS
 t8Zf4KA8nqADiu5GRVoxg5//Jm3JaqPRCbGsBD7mSZj5Lxk/IQv1Bv9DHg9xF+nj
 4FoyrQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1auw3d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7074bad051fso28979466d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056284; x=1754661084;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=278QZ0lFfDm835VGauRYZsYszXs7O8BAZXSyOh2pTg4=;
 b=msB/AOvve69WfsXdREMPUuDGd44cfwN/s0uMiiu/JP9XYJNcgYOd4KTcfI+K6jwu7U
 4ymDXgAChFQUHCz9xDudq5Srh3ZlzFUt/38hZdabCL2gjIS3PNawuCFVpNZO0meTaHDs
 RnXwtLI7gFs6UXgMY/55xM9kL+WfTeA4VsLPeFtymHPp4hVlzS53g8g8iG3cKQaAXIHV
 2iW5FOrqWTNVe/VMBttzCHWRGEdf6g3nbVOquN9Y0NI6knmGrGUwikalKr0FHOWYxwxw
 K/Ts1UibLDDIMkd3qW/m+B6K88UwHSVAtEj+Onb9rQMY57bZecuiXXFIGgf9OTQz9faI
 CKow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDUCUbJC4JJ+Mrtu8+qKeCaJsgcTE6qwcP6IroNynL89SdCDR1BMhUNgh8m4XnQ828tX1tueBVIkc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCKYVE5PK2k+RKAxUEFO9FeqS6syacVj0ULIjFEb2sYBsPQwnk
 UKRZ7hh2Gv9gVKJ/ypkcZO6lOVrUcKNuLpK1vkuosWY/PfoW48EDR/RP34dtPxIt/eVScj59AXO
 y+4+sZtR2NgBenzSHDqZrhvIavw1z8/fxDIXS4hq/Ay0ohWCpfvi6EovjZhzuAIj3JBJoKwE=
X-Gm-Gg: ASbGnct828R5aefeDR1UmZTrEV4B11FGwGcX82dfwrcdqeaTxRtHaizpyBRM7WNFWFV
 +Y7YVWOQiwr6I3kGsUtqqM6yZr3n2tTLN5G3X2Td8DGXohvuOGHVNhoUVDm6WesQsJQooQWyUh3
 iP1K5PCU94C15eeCP6+xkEBC+QbIsGfSqGwCE3mzNKtRm5zcXb4ZWQtPyV0c3ek6FrE1264j9kl
 0d9j5DxmbkqZA656IT+yjonTq47BSmoVQCQulo8s63Xh3T1gqPq1uR0P86A7nHQ55ruB73lRVBa
 gbSGoqL76ezoU8WY9GAR5Nj605OI6H9mHTfz2xZqUKdjnU3pwf8DS6cmbqdAlgoCI7mNpl1xNBQ
 RbTzoeC/ZS7aTzK8rDFZ0jONegs6rn9vdVFb8TR+iHZebe4f8jeg9
X-Received: by 2002:a05:6214:226f:b0:707:4fec:c0ca with SMTP id
 6a1803df08f44-70926508ddcmr38892566d6.4.1754056283830; 
 Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJom3kFAnf8JFuU2DiA4RfLsiaMRDn6FA+aJ51nDsVnUTvIGfyBP8DkrKWMMjE38R3E76PPQ==
X-Received: by 2002:a05:6214:226f:b0:707:4fec:c0ca with SMTP id
 6a1803df08f44-70926508ddcmr38891606d6.4.1754056283051; 
 Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:12 +0300
Subject: [PATCH 4/8] drm/msm/dpu: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-4-824646042f7d@oss.qualcomm.com>
References: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
In-Reply-To: <20250801-wb-drop-encoder-v1-0-824646042f7d@oss.qualcomm.com>
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
 bh=4v/UkWVUd2usRk11ttudKMK/GFE7oPMYIMlz0jnkFl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTDNkPGITvncNEDx/CNCeglk1Jp+f/ChpC0
 AXAHrPUnAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1f8aCACjBXtlBxXcmFySHdDryhXuuyHrGFTLWoQAJYFbFPslFIRoxZSJT6mHErULJ228fcTw8Ww
 risQU9WSdjD7jV8ENl54qLAQNALPedsvbKGwten2/zVwwHND1/tHm62gE/zJVsv0AAxskybYyqX
 XgnflK5pL7cHdNq8kEqSnM8NrkQfgWCwS+NE00GVjlUOwvIM+Db4IxyZpw8ysGkKcOooYn0XV1j
 4zVzcS/pLcAgTkHK6SEWIusjCrJuUX2qaE0MHEDMfL/vyb+buazqF8TLWkgP4XM94aJOKBQFcAC
 qr7avC1KLtKnUu4777zLxpSwk41rREYYp97VOlRBxnyQ5KCS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 3t8sBCx40wkAjrXGlulSrOk_JnJrdyP2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX4KXrXshvpVOw
 v4SwgNcI39mzzHqPsm+uPhNA65WcvnJdaAaVHU9IcLV5o4B5Selvq7/HUp/Fuv4RsoGAW69bwSZ
 QZjG6lMFbN9JrAWjg7pwOEWEGtsyhxLayz14k+2Kpq4HOiKhClroPO3moOpTbOlXAQYNoY2Io6U
 UrZm+JakT1T/nx2yQkiibH818tYle8lHmc/lpg0N6CJIkqZVd9bUjDnebCBHYEmYqvzZCqRhNP6
 7VQOGedkOboJnN3fUVND+GZOuBNb80vOWs6V+m/pGC+M3/NbTvzN8M1Ckq+8qXLcsM/vAYbjwpT
 p2eG0EQMlPeakoX94+xBNQqUkB/aEzpAMSYRUyl9mxxcDWomvNqrrX02nlpL3copeK90I5JBRgq
 9vGW2U4ymJT8CgS8zt1RZL1tVGw/15B1vOHR1n/Lvl7WB3wEi+C9dzwdkLo7b6orsnOE6Bt8
X-Proofpoint-GUID: 3t8sBCx40wkAjrXGlulSrOk_JnJrdyP2
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688cc65d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UqIHtJT1QCIVCAY24KsA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010105
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
2.39.5

