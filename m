Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5CAA7E372
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E585910E4E2;
	Mon,  7 Apr 2025 15:11:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LC5vNjPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1161110E4E2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:10 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378ePvK014621
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TwfDwLI+svFypEWrSxDH80ndwEBhpNaPxUQkq5vFNog=; b=LC5vNjPH/zOsn0Q6
 kq7asa8QZbDG1iQMHX49L0C3VpmOxOZH1XHBuukaGCXDjOtiQlZoWEP9awTETVOF
 vx4T1SbVYfXtte3yycPJ4Hn1uTOTrg9NJ1Cbif7ZI0JY6tCSIp5F3Ui48onB/xL2
 Y6ELmyzmfxl69ud/OTUQR64Hy0YX6wXTMy4qBVF8MTvS20Yxb9AH28gHGNzreCvY
 yc1zj2cxpPVaCi4Dgcmd+ihaS6C+CCu0MdMkR9AFeN0wkHIhSPsSqD4NlRbMVSsL
 h9kI+oTMRXhK4gJ9qE5fs5Tbj5shi6dlThEdbzjJA7VmnX6uGE2A22dNLWvudmDi
 vByd3g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1cjwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c579d37eeeso720762985a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038669; x=1744643469;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TwfDwLI+svFypEWrSxDH80ndwEBhpNaPxUQkq5vFNog=;
 b=GDMUOw1A5PteECWoh6h8IRPW+hVG/w+cfxOWNLNjkhc0TijY32FIJKhQouXxHTYwoU
 C56EGYzHOyqEERRPXoNSU6K0NLxiShaMEDekufuTP688V0u5WLN8ryJpezlVqPW2GUmm
 nMM7eqK8bC/sZEmGCY6cCfXjmseC21AdZLiGhVlP+/jOsv2NU78/l7Suhi4mg6N1tY2h
 wfJ9kcPkE3NK/VX4zLmc/6dpq+nQUicqZj2XI2yiL1VYdOdIcCMTEq4tBQTuhj7LwtIi
 Vb1ihFSbvAQriU26KgQwooXKx8GyFW6PZzECxZN8TWhKe3nsoTnMwXPVCJ+uSzfrdWki
 Crvg==
X-Gm-Message-State: AOJu0YzCpncTmTOtHqwEQ5g5/4V4jIkINVUZ3iSY8Sa7Q3iwH4thH6mB
 3jiB40FVEZKpcjWWgSCpJ6jdR2MzPm2ZGu6z9/HwQOZ0QyTewS9B5aF0k/FFlDsoLm85KF+05Xc
 alVPe4t+liVOOzhzWSwcESQRSywII62Axl8HOx6ARR5ce6La+m1O9CTi6fKG9cb0EhW5uuQ2mEK
 4=
X-Gm-Gg: ASbGncuCaqe3/BgOSn5c9kUo+e5pXlIyOTp+bDXelXx0Te6HehP25+4vzZjF07+gYVW
 CPMA7qrfcizRtiUuT/RFJSTKTcCvXgXxuSQa6Ht2uR4KUKXVj+9QtW7jGi96jmar5NTqynXqZur
 fqKu2Genuuqiuj8I9dXNh5e+v1MghuFG/n4BK8EDsmmfjmU8ugUgipsM/57oT9qploNf0riLR4E
 WhhkUYAFMPavxSo6E4zXAJiCVZv6fSQXVe8NsOoMqETEpnL+4e1ZECzCBJLOQStbVM531C95Pu6
 8y9nFgRsK9kbZeLZbD0DoFbpG2QmP1pyykGCP5NfWlBeN4SW5HsKEJJiOdC5XgTDg7VbtmbtAC1
 eeEP8NyhyhozfWMDd6RDd1KoVfGzt
X-Received: by 2002:a05:620a:1914:b0:7c5:5791:122b with SMTP id
 af79cd13be357-7c774dd6adbmr1854618085a.37.1744038669136; 
 Mon, 07 Apr 2025 08:11:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiu97niVcq15mVwpMeNMHP/Y0XMJCLX5oROKiyuW4w/bSz9fqQKiZzIg6W08wCg4MpVDg7XA==
X-Received: by 2002:a05:620a:1914:b0:7c5:5791:122b with SMTP id
 af79cd13be357-7c774dd6adbmr1854614485a.37.1744038668819; 
 Mon, 07 Apr 2025 08:11:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:01 +0300
Subject: [PATCH v5 04/11] drm/connector: unregister CEC data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-4-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1465;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FPJNyJEcg6oRDjhRbpRxEJohRpQcStLIpnuwdsY/Alc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sD6XsiB+rcOj6R+a0LHk2m/SkS3mOKvizo4
 LZ/OI4P8RGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrAwAKCRCLPIo+Aiko
 1WqmCACdTeENjyF2Q85RXWlgTQ2sy2pIWrv7GonI2CeOvmsJFdtbANmMOa74xE3i7M4bFkNX0pT
 t3dtIPAtKavXJLXF+pMK/YD1UyI7PPnAmDe+0b3ebpP4ubkuMqRLfWFt/vrqbi3QWYMaHY5xHYI
 qTRkzH/Mk4dLP6MaxrxgBWjsLbBpOUc4To5Z5P3CWjvtyjQdwLWWvtNCExpmVH1Xevscf2+zWoj
 ezHKQAV4Dq/uu5s1CE2wnjTcpdC0UuxAliRlCxDraZqkKEUYZmUk3Ff//1l+ltkBDVeEr+qAVRU
 sBqk6+cjhViUAGmWu1SAjrwtvmtOPm1F6rEAa/KQTGHrmU0Y
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: NHtUbIykCKegtrT97Ckjg94WKb-q_TPt
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f3eb0e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=y0Aual6Gy0Pt5gmibm4A:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NHtUbIykCKegtrT97Ckjg94WKb-q_TPt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106
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

In order to make sure that CEC adapters or notifiers are unregistered
and CEC-related data is properly destroyed make drm_connector_cleanup()
call CEC's unregister() callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_connector.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ba08fbd973829e49ea977251c4f0fb6d96ade631..ae9c02ef9ab102db03c2824683ece37cfbcd3300 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -743,6 +743,13 @@ void drm_connector_cec_phys_addr_set(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_cec_phys_addr_set);
 
+static void drm_connector_cec_unregister(struct drm_connector *connector)
+{
+	if (connector->cec.funcs &&
+	    connector->cec.funcs->unregister)
+		connector->cec.funcs->unregister(connector);
+}
+
 /**
  * drm_connector_cleanup - cleans up an initialised connector
  * @connector: connector to cleanup
@@ -763,6 +770,8 @@ void drm_connector_cleanup(struct drm_connector *connector)
 
 	platform_device_unregister(connector->hdmi_audio.codec_pdev);
 
+	drm_connector_cec_unregister(connector);
+
 	if (connector->privacy_screen) {
 		drm_privacy_screen_put(connector->privacy_screen);
 		connector->privacy_screen = NULL;

-- 
2.39.5

