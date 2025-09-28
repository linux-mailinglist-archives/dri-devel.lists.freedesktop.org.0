Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DB0BA6B28
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD57710E2A5;
	Sun, 28 Sep 2025 08:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQwlpWSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F77110E328
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:22 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5Lssd032246
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pDGCMgEwnjTnK4X9AKh+cUPiYlJXGC7VErq2j1leXiI=; b=CQwlpWSPQTUYPWV9
 T++W2n23NdFXAGo1Oz5z8OuzR4V3TeLUenpqXGIpk6WYUxPrjn49tZT0hSwqL55g
 J5Xt+JQu5RonBzt814SibeYMkhy+zbJZZjccY4PQJ594iadgVRvoihEd+7fZNr7r
 jaqGQqHzycvMp1fdvVD3NTjQXQHTPU7+KhjxYZSKu5yOctkUnqfRvpMI1gY9t3/I
 /kzRaY/Rr/vhFjLdw8XekRdt6WOqYUc0aV5TRNu5KmkaEF4+OFrUsAAYq02hvrKj
 Zrp/WG2XXIb8D5RIo9Mw0GlfIN0a/GOto/OqkHMWqsE9piZYG1kBl8Me8sGetgjn
 XX6KrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5jfs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4d91b91b6f8so63254581cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047921; x=1759652721;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pDGCMgEwnjTnK4X9AKh+cUPiYlJXGC7VErq2j1leXiI=;
 b=ClveHHUVPzPq3+jr//m6G0swztwwqKrWZ1kodcMJcTePbZfv1VVOwvf7djsjks6wEY
 eZDDxfUA1tPJ04BGB55K3tyiuYC44fTigcA07vRCU3oG6Wt1gD1YBtHDJgQN4PJR8dxo
 /tNyVlIOfAJzU70A5JdKRW5P7USAi9yH8mjE1QAaXHW2yngmXcNF+sRlISGU3sbo3xtx
 NPbtLWHwXKw4acgBiHgsmiTR71Gmw4Q9ymQKeue+m76cU3o2axEnvI7FJ6fJ7u8p4zMy
 UCtSxKMv/T+RiFa+gntz1Cj8ab628n+CHu9LCmPUof3J3hJt+YJEZ9e9SAgnThMxlwGz
 NS8Q==
X-Gm-Message-State: AOJu0Yy8qPetv+70aV7exgIDSZgvoV2741yxyQbc87hLf6elpSIf0Ayq
 aZwBq/KPEvMwmeFLbI6XuhU3Phlg6uHCN3Hf/BVrgvLNRqIvqaqmGFPmCRstcA5heploBIuFlsh
 DeUuldy8FEoPZu/yDdVIy6B94jOct+uZvuYzRfx4TsD1fJ18Wsm0VHacB03GDtqVodiFdNyc=
X-Gm-Gg: ASbGncsciuvBj63DTsFA4gv/CPecxCTPdCNR7juZVIwre8M0QSDg/eumTOoGOb+Dul0
 IaPz7ND3KdyZzc+V38/NIZCf9B2XZjofunZRqNUPYd50AV0p56174KjS4oWQC/aNabwMKEkan5J
 BLDNnvhKWgewqjfI9YGqLPkJ8I209h9/wJTlV5OPhuG7pvVTIcNS5xfBmkJ4+ETB9qLoTx8CZCI
 0tE7EvZzDzpLp0zLPySEy8oqFndosGLgxnC/iJZkCyYRhYAvYGcaeZxLJRaTkfm6Yl10pBzGJIg
 pnUgUE2MShtCLA+qTpEyoclXCV0Khj0pkIBgREewbN+1jDIPe95zyQgJLy1H+WAkYZze5jbfOd6
 mXZ5OxEso3i3X52lTlgrA3j4nGMSyhxNuee040Ray6CafyWsepd7D
X-Received: by 2002:ac8:7d8e:0:b0:4cf:6b60:8814 with SMTP id
 d75a77b69052e-4da4c39d551mr157223421cf.70.1759047920613; 
 Sun, 28 Sep 2025 01:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs63wvjlOp3xMxlD61SlugRb128ix3vSdkzbHU2oqtBagfbingC8Ut4nFepJQEg0y1xF3nfQ==
X-Received: by 2002:ac8:7d8e:0:b0:4cf:6b60:8814 with SMTP id
 d75a77b69052e-4da4c39d551mr157223271cf.70.1759047920172; 
 Sun, 28 Sep 2025 01:25:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:53 +0300
Subject: [PATCH v2 8/9] drm/rockchip: inno-hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-8-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L5F+9hmws1ws8sHBg3j3OZgk+hUi3reLwHH9RQ7UEnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDU9uR0Y3DH7A3+x8geiLghZLN7tPC7B3SOj
 e6zCefBhf6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1Ru6B/9PE+eUbg3q9YXlFXZd6EPBBkP5lZgICQEKOE0FuYIcvp6aqj8KRAYaSBf3nOEsYkh6Cmv
 izDSG7gqnOYbJtZa1DBmYqSXwcIYU9x3PqJtOca9yASpRyYkvVH8b9c8vz/LfL2SFkM0iWK3/HE
 oPq0/r5tSjjrJ9u5/+s1evNujBe86ROuzIpMMbVVTj5U9sJ0LQhBHpdBVmwkbN9cfVxuaUmhUo4
 +hHRrX+QqJ0qvxolviQQVzyaLLE7VuP4ZbG/H5NauVJRDGd6YUABlNx7xw9adhsUxwugFv2UAs5
 CL2oRovfS/3sNkx1Xb25MSdesvX4wPFuG9Dy5chHmg0qOIxr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: SITiwzIbZena5JlHn7FE_rhllRO4kKsH
X-Proofpoint-ORIG-GUID: SITiwzIbZena5JlHn7FE_rhllRO4kKsH
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68d8f0f1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX6rXuks6qVXMB
 9F3JorovtYwoZFrkFW0Xw8UmCpUd2o99U5VSby92skBZVSxmiXEecs2z7/W1C9KYdEeK/tEGhuJ
 kHesmuJ140j/9wS1ho+o37Ju2/Q8C6qz31pMeKAibQ/vI2WmLw5NZxAQeoytqvgeJ9A8JYq0KZm
 GxxyoYDXs3pApH2iBqz3ulHbEhUO+psl983atTRQ6F6tKCgHsmMpUUsNQG6+Af4VpjEp3uDk8mr
 PrLJIDpVXpd758fEzHP5IpKai5y9Zu0PMu3jH9uZNg5WrnHNtikCIJr5Nw5XIVjYQORF5rjvGKF
 eGqPox0fwzOh9jP2SHejgvRlAi1RGoXw1pNPSi6WYVaCuqIzfyD1BfqAnTVXpB7kBm6k5/pZ3FD
 0iYdGSXcaMDiZW+YR0lJycTRcoMgYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
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

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 47 +++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421cf5e0c1be63a80da23d645cf3f24..733294c6807da4663285ebd482181589c37f960a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -641,13 +641,11 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
+	// XXX: this doesn't seem to actually disable the infoframe.
 
 	return 0;
 }
@@ -659,11 +657,8 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	inno_hdmi_disable_frame(connector, type);
 
@@ -673,6 +668,36 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
 	.clear_infoframe	= inno_hdmi_disable_frame,
 	.write_infoframe	= inno_hdmi_upload_frame,
@@ -1029,7 +1054,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
+	.atomic_check = inno_hdmi_connector_atomic_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };

-- 
2.47.3

