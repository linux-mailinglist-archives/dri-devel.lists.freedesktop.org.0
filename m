Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5ACB182D2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 162CD10E875;
	Fri,  1 Aug 2025 13:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XRpZth5d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69AF10E873
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571AT10K001622
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kBx5bn66d6vut0znzeSHUeN3eqzlVEi7rifsJB3EV/E=; b=XRpZth5d5B+ArEFp
 qt2j+OEM5CBM1SM0Rgw8MPgYk1p7Gp7Cr3IBPVawEsN6bS/LQyBfA+KyK8zQyKhh
 0Jz9lcDtN752a4bDJjvFiaW1NVgh8Akyro/bvduCAMu5FvQJ4UeRHJw8/DTtxAX+
 lQV9goHAX3AmRDdNZxT6KMWWZoClrU6rpVxGgASMZvat6MCGCoGgoTmoAs/lT2Oh
 sCaDkNA+GqByye4emPzarqvh+ADlVJd771iYZNeZQGLFFgq18ydQcUL8AtQv1tR4
 pu6ig8WH3QAPcfRM3ERR1wgo0cGuU8D/ElAYl5UQ+nrrZKmDLj/fVdltfVEAxkd0
 QKhPvw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2uvhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7074bad051fso28980976d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056289; x=1754661089;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kBx5bn66d6vut0znzeSHUeN3eqzlVEi7rifsJB3EV/E=;
 b=CUnKrmaB9O8R06v67nDz9i4nzs/KdwpfrrFh5Yec8rP+Uj0sPGUoMVNhoQ+FK0W1cz
 Jmy2lvGMIMV+SN8WGRrScRixxNt4RYQgVdGKduj3cZ/BihDsV2fd1AFdccQ/vE0jmuoy
 EUPWC98oBJSBHiSB22Ve5NRjkeoYgePXZKYTAv9kcra5SywJqYa+2PxGjCLpAMV1PyA1
 lTGfnbuMs9gOdyrEJSAliyQf+DQ7xweqJVKS4kVnJJ4flhyocZR+lsXZ0SHF9iv92iRE
 /r2X10sdZHgElYCrejTSLPYkhKkkhT6hh2hTqhSx7kL7VunE7thp5dIoIRehFlGEIl5+
 H/iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLEiBgopqnQIr+ydvSa3Z7FR39ckAxiSo3lGWKo3g6OPOIlCTQ8OV9UygelVqmtUfzhuVCvwbbfVQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzuWqDjB8E7c1mFgrc0Bg9EMAcoUPD8qaDZZqqJlo6Wi1p8GqX
 u8Mj+bfLVl3AhYrb/CvyDloZ165PxvR95PVAKOs7Ds7hBGL1dcSBHWpCwWkdiJZaqoQpDjYjA5C
 +xMvH7+YebeRNMtOt7oAm0oR/8v1wsrdJpJsLQdfW88jkuWQwI8d1wwFfjQQpwaFYH58l0GI=
X-Gm-Gg: ASbGncsD17S1E+6zKseWACk/ZeVXFFvsx8Bl3wvidDoVpPmY4JG3R8c1n+3yBLhbYAg
 M91WqYj+suEGR341dDyjEuI3nRRKRz6TQ/2SYJS3WGzo/1gs/sQkFhmGMXzbSnxSVgfM6FV2zeZ
 P/rVzpCbqSOn8v5OtySTufV5cpiev6A1SlqlNBkph5pvRtGpaHPTmd00wFaojlb5D75X7xtJmBB
 herCx2WoRimTnEelFe9gCDhT0cOUAXY+ZTuFAkEObXHrmYR4nBjwqBuDQJoBOVWSdCGebJzZIS5
 5yiat0xIveTyEjQr5y9lvST7wvDSZZGa7e8Hy5ab3Y+u18BzLiYuTR4YHVdph4zaadxnuGcWSYW
 9yFPLGbXfoMasusSe8cW/mZAWs4+LVlK/hoqzhJpu0Mj8AX6zAFV/
X-Received: by 2002:ad4:5c6b:0:b0:707:642b:cdf4 with SMTP id
 6a1803df08f44-709266e5b39mr33801806d6.44.1754056288548; 
 Fri, 01 Aug 2025 06:51:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGllYuESTRqftyHKDNb4inezLURrR+fzmRpNK5DetH32nfbPqtCnDKyebMVY5gAjPzgta1wgg==
X-Received: by 2002:ad4:5c6b:0:b0:707:642b:cdf4 with SMTP id
 6a1803df08f44-709266e5b39mr33801266d6.44.1754056287837; 
 Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:15 +0300
Subject: [PATCH 7/8] drm: writeback: drop excess connector initialization
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-7-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4482;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gZgct+R3pIg8eXO3IJV5mPFQorUlTRSoPS4dZG7+aRg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZUui4aeAWjDE1KcnUWDiWpmo7D1w9CnyLW1
 NS+7irQsJCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGVAAKCRCLPIo+Aiko
 1VnvB/wN1Uyqu8Gb7rElaqvtKoq8ctBCnyPLrCinS1CSpFKhE6DmjVLZ93duHSs8PhT2XLUl+Gk
 FHlskZNC8PV0yqTDNDF8ljaQxml44/wm5h6idVdLatujDJKa4yVGpox41E2mkKxMFg8cJEQdUHo
 mDOKWaFTl9tTkseYzULna9+MamFoDNn7K2bAAkU2sqZHh242r0i//UoAcoZD6jvcJOxYtjpoOVT
 Mi8lHRiCI7shQ+XZfD6Lt1eS35mbm7RQbHnUF5ivVS6Ytsxx8DInpU4WT+Vwf9Q8Dfv7UF4vMzV
 h9maCrN7tS9BsiflO86XVabEVhHS1tEOnD2ABbu+CMWr4Bsn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: mUHF1xTCrlbJZjwnOWEEI5UFUIpri7Xe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX7CS649AzlNVG
 S13qquqocNJBpNSJDl+Wq4hKkmdjhVGOxo12vDH9Ft3CahwSLSdBlmxg4p76xsqPKpOXnsHzNMU
 WTaTTwaODlXqJwk6DXsPbQ/qOi8S1UG/O+HSyzjAdNlfgG3SDM3i2U7o+YVwZKAzLrHMoYVrZtl
 LF+JRK8t4KACaj5jdjnn3QpwwePBRtVgM7O+tscdbZ8yb0GUI1qz2URKp22KYjRX2uRJ5jjBxlF
 MLq9ceU+KLdJMvO8AIKibCpLYEZS3/+Ykkw6Bh2FphU9NxhZ9Bt8vp39la+dnMfmQ242IlI2tfu
 crDxPQQ4KybGng7IguyTUDEa2FET2519teHoKv1dTYIzuISbMlMPYq2zNjy8qsZ5Ufnjlp1sNBX
 sH6lbB1FNPjH/TN63wSbtXGlQf9E+k+S52oFQxL5OqH1uKpOY7aOQNWsolpSI0i5/a7foDFJ
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688cc661 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=3owybDqXPaZAjLikVYcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: mUHF1xTCrlbJZjwnOWEEI5UFUIpri7Xe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
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

Now as all drivers have been converted to
drmm_writeback_connector_init(), drop drm_writeback_connector_init() and
drm_writeback_connector::encoder field, they are unused now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_writeback.c | 55 -----------------------------------------
 include/drm/drm_writeback.h     | 18 --------------
 2 files changed, 73 deletions(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 95b8a2e4bda69230591b50be15d14d0b3692373b..1a01df91b2c5868e158d489b782f4c57c61a272c 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -142,61 +142,6 @@ static int create_writeback_properties(struct drm_device *dev)
 	return 0;
 }
 
-static const struct drm_encoder_funcs drm_writeback_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/**
- * drm_writeback_connector_init - Initialize a writeback connector and its properties
- * @dev: DRM device
- * @wb_connector: Writeback connector to initialize
- * @con_funcs: Connector funcs vtable
- * @enc_helper_funcs: Encoder helper funcs vtable to be used by the internal encoder
- * @formats: Array of supported pixel formats for the writeback engine
- * @n_formats: Length of the formats array
- * @possible_crtcs: possible crtcs for the internal writeback encoder
- *
- * This function creates the writeback-connector-specific properties if they
- * have not been already created, initializes the connector as
- * type DRM_MODE_CONNECTOR_WRITEBACK, and correctly initializes the property
- * values. It will also create an internal encoder associated with the
- * drm_writeback_connector and set it to use the @enc_helper_funcs vtable for
- * the encoder helper.
- *
- * Drivers should always use this function instead of drm_connector_init() to
- * set up writeback connectors.
- *
- * Returns: 0 on success, or a negative error code
- */
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs)
-{
-	int ret = 0;
-
-	drm_encoder_helper_add(&wb_connector->encoder, enc_helper_funcs);
-
-	wb_connector->encoder.possible_crtcs = possible_crtcs;
-
-	ret = drm_encoder_init(dev, &wb_connector->encoder,
-			       &drm_writeback_encoder_funcs,
-			       DRM_MODE_ENCODER_VIRTUAL, NULL);
-	if (ret)
-		return ret;
-
-	ret = drm_writeback_connector_init_with_encoder(dev, wb_connector, &wb_connector->encoder,
-			con_funcs, formats, n_formats);
-
-	if (ret)
-		drm_encoder_cleanup(&wb_connector->encoder);
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_writeback_connector_init);
-
 static void delete_writeback_properties(struct drm_device *dev)
 {
 	if (dev->mode_config.writeback_pixel_formats_property) {
diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
index c380a7b8f55a3616fa070c037d5cc653b0061fe6..879ca103320cc225ffb3687419088361315535fc 100644
--- a/include/drm/drm_writeback.h
+++ b/include/drm/drm_writeback.h
@@ -24,17 +24,6 @@ struct drm_writeback_connector {
 	 */
 	struct drm_connector base;
 
-	/**
-	 * @encoder: Internal encoder used by the connector to fulfill
-	 * the DRM framework requirements. The users of the
-	 * @drm_writeback_connector control the behaviour of the @encoder
-	 * by passing the @enc_funcs parameter to drm_writeback_connector_init()
-	 * function.
-	 * For users of drm_writeback_connector_init_with_encoder(), this field
-	 * is not valid as the encoder is managed within their drivers.
-	 */
-	struct drm_encoder encoder;
-
 	/**
 	 * @pixel_formats_blob_ptr:
 	 *
@@ -148,13 +137,6 @@ drm_connector_to_writeback(struct drm_connector *connector)
 	return container_of(connector, struct drm_writeback_connector, base);
 }
 
-int drm_writeback_connector_init(struct drm_device *dev,
-				 struct drm_writeback_connector *wb_connector,
-				 const struct drm_connector_funcs *con_funcs,
-				 const struct drm_encoder_helper_funcs *enc_helper_funcs,
-				 const u32 *formats, int n_formats,
-				 u32 possible_crtcs);
-
 int drm_writeback_connector_init_with_encoder(struct drm_device *dev,
 				struct drm_writeback_connector *wb_connector,
 				struct drm_encoder *enc,

-- 
2.39.5

