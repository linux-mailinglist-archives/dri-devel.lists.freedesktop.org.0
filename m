Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D56EABA7A3
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BF310E0F1;
	Sat, 17 May 2025 01:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/tXbJAK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B93810E0A0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GC6QGM014006
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2dg8MLoyMdO4bnciC488h9CAEdYdwBoAJfBSIFF1DXs=; b=l/tXbJAKmMwBGBae
 UZiTp/xxTak/vhq9m/TLxsvgo7LAuIddfdunQ7qtuTEXU0KzSPXTVtzLwDnRlRxd
 VJ0hddy6O35SathHmq8oaJAYsVSw3CXs2MB4SbPw8a6CbLbbtfMe5KFGjPEWc6yY
 tWLbm9vlKg0w4od0wFP43zfusnaaqK+knQDlCWY+vGZhRnykVTsCjVMP0UrP1uXU
 bdfnQ7mU5ijAmtQNkH4NcqVivhA9MrG+1YSdB1XvM3M4mWpI1ZfQAkjL6KxOr/OE
 P3ShUPDAa9HYhLOcla8vvdg2Kj3P6d43R5ujhVsS2DyfonMsmszo1tXkrS8f386u
 6OCusA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46nx9ju21n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6f0e2d30ab4so48135236d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447183; x=1748051983;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2dg8MLoyMdO4bnciC488h9CAEdYdwBoAJfBSIFF1DXs=;
 b=hSfKMVexmaRXvhscBPhwILklQtECygC44DKFduaQVUyaqjkFDgUcu6OdEFWpagzzv6
 X1noVxpedV47qZy5bBe5Y5RYYMTPQVYokk3kYfq4iPIQlMM2CREZSsAuspk1W3ZwhDDA
 G4kRctkUbUtmDqafO1ug4wzvu71ecmbhOezYgNjjFVo13NTC+jQ/utsZbiiRp73IgwrA
 oMexSAj8Jw2tnxpU8wL9z7uiGEU6eORbEwWwXq9HRTTT+R6I2ErjyZstXk+YtG169W78
 3QFTV/IZ38dPbwzk1mVFSxKotBBb54xOkgIoPDV3BNIE+0fyqm3ln0KQUbMgESkSUlFC
 Ffig==
X-Gm-Message-State: AOJu0YxE2wyfgsS80GJw7VAXYiaCyZfRDDc/8mhGjrdVhlTC+f0qHei4
 fxDEG1Vb8t7LZ8JnEKBJUCHpsTWxnn/8xamAmvQQ5LejbAxEyjBabWwcgN3y4EapO5BsVtUfMaw
 m/fOtfnpaAvIibmc4wXgaqFLHUBUORnl8NIebpRhKsshuUsDNihgcb+8EKdkuXOF/SlqfFRZABY
 mdD9g=
X-Gm-Gg: ASbGncvkYjIKUXhZVZ9VxB3yw4djB8di57GffTbTywSPmImQodFvdQYi6lNRVCca78T
 7oZUnsHogEr+KVfk8z+XUzs3e6+5KFacc0AdtGAS3nImQZPZqr3p5U9NfAIFkFwnA+ypNy3jnH7
 IC/cIwAmkmmvZvKjy+eYSqKrl86YUHEqDcm2Arw/BFV+K+Iigegslnn5uQQVAFtWT5aFVmZd4Rb
 1dz6/kgSoPBKIpeI8ZhUFvIR6UIhxSTCxIRqskMa3nJ4MyBlGukhwoS31pKkifvjoutK5UlxEfw
 gGsqfFEr8/3sRGF5q/I55zeE2WTDov+OFm1eiLKtZOeRH67mOLG7XxbF57UQtHx3W+W1F2/DnHl
 B8YQw2GKHRIHxqBewYhgugmLz
X-Received: by 2002:a05:6214:1c09:b0:6e1:6c94:b5c5 with SMTP id
 6a1803df08f44-6f8b080f75amr84862596d6.4.1747447183548; 
 Fri, 16 May 2025 18:59:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQAgG5vba5Anxq4hWji3CXaFpanfuubON7sPnyca7B85R5YmyE4rhzwFfcM5Hv5DG7BZ1EHQ==
X-Received: by 2002:a05:6214:1c09:b0:6e1:6c94:b5c5 with SMTP id
 6a1803df08f44-6f8b080f75amr84862286d6.4.1747447183223; 
 Fri, 16 May 2025 18:59:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:37 +0300
Subject: [PATCH v6 01/10] drm/bridge: move private data to the end of the
 struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-1-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=oaS6Po7R+cg+gJ6q7cqgSpb16Fo8ijum1OmXH8rf4TE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2KdDng4r3R+df/gbbZzgYEtUrjoAj55RAe6
 Tju1cwQ9eSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftigAKCRCLPIo+Aiko
 1b5jCACfbxzHh2FRczRcQ73bgtlKc0W6bfz2WeyoN0q6yDnFsoOBqU4OvOSACPa3Benc6vbrbDr
 X4YpvPcs/1qEJMFVAdLygr1kVjdET/0IkaLHLyJFCBZSi0yqi3qHNJeosCfqQ7B5KsOr8O/B4mc
 AwRnCBPBaz3E8Zwc0lkIB7VNFG5O9atLHlIPt9nyBMe2yjEKNbTJuMwnTHEmscXNzyEYmOJwc9p
 Z4fp3Sk4J7U2u3axp9Q3ehcz1F4UniVBm3Upbu+oxc3ik5Ni7lsNolPRidrI4NeaKaePLWIKOqU
 eiAOvS9xsypZIGp/eGEZiahVK03ZvzU/5HYCRLXjBzY4oSD1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: EsEVsB4gxUgFNudPzRqOH6oweq3ISs6H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX6xfo6a72E6A6
 5sJvEnO5ECN6ypfC/xnmMmgnTVyzesmYZsRsAgxvLZJ8WErc3Zx57ZY0g1c2cF8l9y7hbxY72B6
 LwuCCppPRmxZ6KPbg9UojbVb8mlTlN4cpavShfZClMsDtYhV6SmHihI4BEiyNPuzvb9jSBaEk9M
 dMDAfRY5vAhFVp/L+B3lxlIlWgvfGgUxXkPlEL575y0kSeFhH628mg6bxtMVOfyA8c7cE63FetQ
 t915XfpuSW1uADJVjl55Or2mwfW+KHcmmiEjvfPYmnq0CrZm79WQjivWCqPQJQG9inipJMlurC4
 xJ6HnsYSvSYA1u3sv/q1Z1CNa6MK5zybiY0f6ObE03YrqkwMv6GsKQIVRlaelK/W6WAavk9kvmA
 zXmkKBzBs6TeqOr1Vjl1lxDyvFFjWocl1+LEZXbf4m9vkI3NeZJIhHzrOUf8T3Y/46F8hDOK
X-Authority-Analysis: v=2.4 cv=CIIqXQrD c=1 sm=1 tr=0 ts=6827ed91 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=Am12PNO99IVxJwGJ:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=V95sz_wBBgzcx4ufKaUA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EsEVsB4gxUgFNudPzRqOH6oweq3ISs6H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505170017
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

WHen adding HDMI fields I didn't notice the private: declaration for HPD
fields. Move private fields to the end of the struct drm_bride to have
clear distinction between private and public fields.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 4e418a29a9ff9d014d6ac0910a5d9bcf7118195e..286f6fb3fe2b80f237db85dc8459430dc82337e2 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -977,21 +977,6 @@ struct drm_bridge {
 	 * @ddc: Associated I2C adapter for DDC access, if any.
 	 */
 	struct i2c_adapter *ddc;
-	/** private: */
-	/**
-	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
-	 */
-	struct mutex hpd_mutex;
-	/**
-	 * @hpd_cb: Hot plug detection callback, registered with
-	 * drm_bridge_hpd_enable().
-	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
-	/**
-	 * @hpd_data: Private data passed to the Hot plug detection callback
-	 * @hpd_cb.
-	 */
-	void *hpd_data;
 
 	/**
 	 * @vendor: Vendor of the product to be used for the SPD InfoFrame
@@ -1043,6 +1028,22 @@ struct drm_bridge {
 	 * not used.
 	 */
 	int hdmi_audio_dai_port;
+
+	/** private: */
+	/**
+	 * @hpd_mutex: Protects the @hpd_cb and @hpd_data fields.
+	 */
+	struct mutex hpd_mutex;
+	/**
+	 * @hpd_cb: Hot plug detection callback, registered with
+	 * drm_bridge_hpd_enable().
+	 */
+	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	/**
+	 * @hpd_data: Private data passed to the Hot plug detection callback
+	 * @hpd_cb.
+	 */
+	void *hpd_data;
 };
 
 static inline struct drm_bridge *

-- 
2.39.5

