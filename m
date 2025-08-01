Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A99B182C2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 15:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1515610E867;
	Fri,  1 Aug 2025 13:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B5XaPGSC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6621E10E867
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 13:51:24 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5718jfHX001430
 for <dri-devel@lists.freedesktop.org>; Fri, 1 Aug 2025 13:51:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 tVawR6mCQAAJds4EZ/RayxaIa/tzB6nlBY+m3oTR/UI=; b=B5XaPGSCzoY8/OEL
 nKR5SEJSQqDyUZCNVdUUJx5GkkDzxCIQUiR84wJQY/a2C82x0AGoGUkvBbCDJdyg
 9jC7I7Ppe5ZxSl41lmDWQiYGA+pK0uQbETAcfyB/oJZ2ckfzE9BjzXbLHUki/Opw
 lbFK9gXG7eN10zogPdA4kysRBnZyIZArwfdoUwDeWzusSXIWJLJ44+3OBfQ/Dbj4
 AfPPrIBn4GmZai08pEL/cCb6vvK4cj1cKsTIkCqxi9/f5KfkxdQP/Ps7tzMos5km
 cur9oiL6PuZWEZKuN/NWQqsETFA/iPtLc2KwtXGgLZR2CL7Ks+iMColNLasS37U9
 L1zpuA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyucg53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 13:51:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ab684d3b55so46875421cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 06:51:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754056282; x=1754661082;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tVawR6mCQAAJds4EZ/RayxaIa/tzB6nlBY+m3oTR/UI=;
 b=WB4B5F9i+U9pbhNcyGiPNb6drddSCzJYebrhPNOg69rrpDf2mckIUMKoobkpIQr3Np
 OIHz2klBV0j2/iWM2TwhFtmOb2osGHl4a8h/BcKF1MZWfCT2+xIKYRUzcdGSBNSjQAUP
 1bQd1H9xeKhBNbZW//fhZNIS5sU7ZzEx8HGSFxOWE8rcrufz6Bw1Syv0m+4+Mq3Mljn8
 1/d+D9VkDkBxLDyLoEgtt6Rs5Upy1/EboktvdDkVoZDjxvbwu37ZV44bxTNVArM3pSQ+
 vNRDQWpi5wpJZfqWkNkuyetSO2kdPBujaEbgqU3zUbwJ7xfHSrj8l+wpkvZHTB8+hgMW
 pw/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9xQDtjkToLiABO/rWo5qd1j98A97qtIsbbFnkzqBpoENR2w5am71K6i2CU4xfK2VXUr55+drODi4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlOKoWPMCP37DiIMQnJbTZhWGvf6RfAqadBs7igxXNGcXLof4y
 XgcFG18l4OCu4+LH3wxCNRSwec3r92F9pJTgbH/yXjodRWofXOfCujbiFojC2occ2mIEYwMop5G
 rtAWPzWPICBFkCMmSVuKfZAaNd9XGM4pJpOl1svb9ZzAHxwL8Z19BzY9AaXv08emqCRTcSss=
X-Gm-Gg: ASbGncszjrvLfy1pXYjsGmnR6ohZIx26+ulYVJLKszDTVAlKZDsMbjiPEYqbB5l/ilP
 7egWEeUuIRQAlHHVKrdjmgruhyfHHMSKsbxKG/GwdV1odf8ZfbEj6rducyGbUkQGGA9y4SS+B91
 WNLtRtfOYaO2q/y3A6afg1ED/w1heSUOYFmDuJAmlKU7hYk59Hr4BeQa4DuH65dWW08PAP/TPKe
 wHza3nrKCr0qwAaR9wa9MNWyrZ216mvviIan4QSHfwrxEhNb8jAn3YMkQN9ARvsiNKGcSUjg2WJ
 tiX3/i2XXCBlut09J0vqnIkIC6EhVVwGxWHxgs1qab47urBl5qyZawrsSdOvTO6yeLBoaY+Ir2c
 cWj7i0OYNPrPP0r3gL8TbZOTrQqsqEOnApTIj36t7wBrGRtpXZZmW
X-Received: by 2002:ac8:59c9:0:b0:4ab:722c:ff15 with SMTP id
 d75a77b69052e-4aef16d926emr76618371cf.8.1754056282324; 
 Fri, 01 Aug 2025 06:51:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHinZAK6zgz67gxcBa5Qc+o9XL/d6M0vzQBd+as2iX1dHhTo8v0oERF1BzFlbp7qnq1jXNRzQ==
X-Received: by 2002:ac8:59c9:0:b0:4ab:722c:ff15 with SMTP id
 d75a77b69052e-4aef16d926emr76617941cf.8.1754056281863; 
 Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33238273006sm5917801fa.9.2025.08.01.06.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 06:51:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 01 Aug 2025 16:51:11 +0300
Subject: [PATCH 3/8] drm/mali: use drmm_writeback_connector_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-wb-drop-encoder-v1-3-824646042f7d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2517;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=P1Z0Gdm80qNJHt3MSy/BfGrhTCWZS7Xn/sS5jUPkuZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojMZTgNmCXsFmzp+S17Kx+aqN4yS4VmhyhMxrP
 aqLrBUR/VWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaIzGUwAKCRCLPIo+Aiko
 1Tt8B/416/YgM3zYyZ0WB5DeZyBJzXBjPQXXAaToCtg+qCkd5fJZPLQ3Vr5YUNhMTw/2trGwgAn
 fJVDfQrkMZQOKG2PrGGMHGUx5GIEUMqir/XjCmlH23+lEtuIWOzNBJHF22ojkfLtYI8VvBHTeIN
 vq4mYfMW7gxKtXuUdM5N7VFzD5teZBSYI86b7FMVT2/Xyk57ul4HjqmR2QyPSrWBPKiX9TcQLTe
 h9+6W2wC/ey3qnTTaz9jqTEWseyUjwxc0/MvAkor8AplA/Ef/FrUP70IG5LHH00Mq8S/Y00DaLH
 RGajsMZxfRPOEJpeRd2dJiyB7BHKG9eahphZY27/p3NrY5dt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 36yR9uLcaqpPgGUBJfr107-scyUZRlvs
X-Proofpoint-ORIG-GUID: 36yR9uLcaqpPgGUBJfr107-scyUZRlvs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEwNSBTYWx0ZWRfX1xGkQ3I8J/+R
 icvwFxsoV5pRU8yFC3oTCGNEcPWeV9ABf9fUfWlFZDB4oBSXd5Tz+qhnX7GXJ0xberf1h0wfwcI
 0s8FB2lcuEopaB8w4kRpFdsE6elfmvxLgbFVjT+wTeFtoR+5y+2NFmKVqnOMAoVZ/ctqccGTUrc
 QWXQS1gsqcapSSI8ksO3DzfeLu7Lox1x6lCfUmqAdSvBMfMMyOU65aRMhdRLgivDtiN7pgVplyv
 WGHrs69KHeaKbeI0ulMSyIp/rJFTXEulFYP8cPLAzwTXaoVV6Ph73lLGKx8RSHgalka9Co4tBPz
 PYDEv2f3o83W6ttDFnHWROtUxWQRaYSIZqYR0mN4tEG2H2ppbclQPlyZzFXSd3r58eqtGBDxAWq
 ZNPVWV0sb+WZBBn1Fm9tFT9fcHsTDD6BoRn3MBI9ssXBM2G1ke8cDUumxMmYiMJxoeXpxaNO
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688cc65b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=mhD89yN676IZukTL2GQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=869 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010105
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
 drivers/gpu/drm/arm/malidp_mw.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 600af5ad81b15d0c30f9f79588f40cca07437ed8..182275c0c29cd8527c85dfb3e7317561da392c46 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -84,11 +84,6 @@ malidp_mw_connector_detect(struct drm_connector *connector, bool force)
 	return connector_status_connected;
 }
 
-static void malidp_mw_connector_destroy(struct drm_connector *connector)
-{
-	drm_connector_cleanup(connector);
-}
-
 static struct drm_connector_state *
 malidp_mw_connector_duplicate_state(struct drm_connector *connector)
 {
@@ -114,7 +109,6 @@ static const struct drm_connector_funcs malidp_mw_connector_funcs = {
 	.reset = malidp_mw_connector_reset,
 	.detect = malidp_mw_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.destroy = malidp_mw_connector_destroy,
 	.atomic_duplicate_state = malidp_mw_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -211,6 +205,7 @@ static u32 *get_writeback_formats(struct malidp_drm *malidp, int *n_formats)
 int malidp_mw_connector_init(struct drm_device *drm)
 {
 	struct malidp_drm *malidp = drm_to_malidp(drm);
+	struct drm_encoder *encoder;
 	u32 *formats;
 	int ret, n_formats;
 
@@ -224,11 +219,19 @@ int malidp_mw_connector_init(struct drm_device *drm)
 	if (!formats)
 		return -ENOMEM;
 
-	ret = drm_writeback_connector_init(drm, &malidp->mw_connector,
-					   &malidp_mw_connector_funcs,
-					   &malidp_mw_encoder_helper_funcs,
-					   formats, n_formats,
-					   1 << drm_crtc_index(&malidp->crtc));
+	encoder = drmm_plain_encoder_alloc(drm, NULL, DRM_MODE_ENCODER_VIRTUAL,
+					   NULL);
+	if (IS_ERR(encoder))
+		return PTR_ERR(encoder);
+
+	drm_encoder_helper_add(encoder, &malidp_mw_encoder_helper_funcs);
+
+	encoder->possible_crtcs = 1 << drm_crtc_index(&malidp->crtc);
+
+	ret = drmm_writeback_connector_init(drm, &malidp->mw_connector,
+					    &malidp_mw_connector_funcs,
+					    encoder,
+					    formats, n_formats);
 	kfree(formats);
 	if (ret)
 		return ret;

-- 
2.39.5

