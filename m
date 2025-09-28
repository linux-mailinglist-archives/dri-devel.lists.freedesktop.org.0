Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F98BA6AF2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 859A310E1EC;
	Sun, 28 Sep 2025 08:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d25S158d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9513310E1EA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:00 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5TG0E007388
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=; b=d25S158dbMUwLxBm
 R785Dd80o16MVQY7oYklF1CygQd2zDKI/89YN/PSnPdDxigAtHQ7Uu7x6WndWr6Y
 kbnXr2nNoIbbRQ6W7paF+hgHR7FHm2rmGqCQaJp85xHd/e3KdwdjVacZRZUMs6TR
 xF+52srTpnRuniTacA7SjovxmMP63S1tgIu+2A340QmTOjSCL2A8gWvBGHq+2Hrm
 sUva607nq+00q+upnoxqpvnyGZi+/9p+wb66S20GXn+euiMH2ra9MNcA25Gen5P/
 RfUwB7JBbgmRIa0li9JMoKJbjPlfc++6gn/ZNtP1XW6g8UU1WXnKpFTwTWtKDi22
 nbWfSA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e977j70d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-856d34460a3so793604885a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 01:24:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047898; x=1759652698;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3RNoMb86TETM38fjgm0MR4bIq5hfRNj//M20P1hCu3M=;
 b=Y4tOkFQ7DzO3NiU+2+gtnQ7seFQBdQ+n9M4+txTA1qnmBvtzUQ6zcUtzYaYFrkwd7B
 YvqmegsV4UkKq217pu3RhYx583YdGknONng69nJFAiKNuU9HAudUokY+Fi1Atkkw5Ei8
 fA+WCfgUo1ojujMGjfxhHWgwtNUuxlgycPnrPC30s37t4wO1c37nAPJNFvyR+t3uCHL9
 2GITRqPjQTYzyTz+ydZ9P7T4sN3S+x7i/W9aPgGiOTK6CrmIHYckYDRmCya3p2tzHXwQ
 t2juk2JOS95iG05KExALD2NoAZoVLiMYGVAXqFPnxUzdNArtAuMgiAQ/V7P3KscXxoYL
 AW8A==
X-Gm-Message-State: AOJu0YxWwaWmqFoH/JbViBeTNMixPaPjRs44ijvfuJSjiy0MAg3RuNDK
 hbHz8vRijzjCIqBfKnJVtOsx8rIzp+nW7YjI+9IKFFTr9GJ30GvQRXfPQTUiDMxwPzDb3rTocFb
 R8XDJbiCeQ7JKM0/+iBkJ6m57V8GStEioVeu4q5ois4yzVE2v2PEJDKJrZLYXvuQRC1/b0H8d+/
 uzvohrwA==
X-Gm-Gg: ASbGncufa8DCOZ0pHTWtOCHsHqqkYD8PkmhJ1fXqrgsGWJQGxcu8mr78hwgGCqOfhpL
 UCVFIGW8zURCf9eM6+FDSD/yw0WCM8wwoR9NkXzWBgh5QzRQqhMxCcJII+MCAxxOKldhr6TUZ9d
 DJwUCsvi+/ECKDOm6e8d1XEPk5GaGwOclYY/0r/l9G7F1Ro0L7XA/cC69tm1X0MR5IIoKaaOepx
 DVEzLONWsgBIktEaGC43JJzhzk2ZFlkoSsrZ8zoscn87s8jfymmGwM7/W6oDH3bBI3HvSW22ycF
 4iXhV9FA0JxeQRYKDZfDRnZ3ZqQPo24qjn1XIexRpN5JHUlVlkINb2p8e3XnK8cboznkMOW4jAw
 Q2UOKuXdNAdR6kAHaxfy3gbN6j4KjPSlFjCeZsD51+058Uj654XyO
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id
 d75a77b69052e-4ddd5ada161mr94504221cf.72.1759047898435; 
 Sun, 28 Sep 2025 01:24:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT1kPr+SGAov5dmZPG5ScdAxxwbVTr7us/Vb/QdaIyPAfJXzB+Vh1Hhl5wl5GH8A9R5uXnVw==
X-Received: by 2002:a05:622a:4185:b0:4dd:d5ad:a0b0 with SMTP id
 d75a77b69052e-4ddd5ada161mr94504081cf.72.1759047897951; 
 Sun, 28 Sep 2025 01:24:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.24.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:24:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:46 +0300
Subject: [PATCH v2 1/9] drm/display: hdmi-state-helpers: warn on
 unsupported InfoFrame types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-1-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1404;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R1Bpa6Fvy73+xL3P7L887ElbwPPq4/fFwLVlkuQV7Qc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDTlnZoYPxDU4Z3gTveisyzt0XXcXxDuN/YH
 mhxi8pIdgOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw0wAKCRCLPIo+Aiko
 1UePB/9divEoptM9vQNCxc18kAVQN3qANEu3nhMR3r4BSfaNzPAgUOW2mNme52A/q2gPVBSnzf9
 ebr/ZjBmks2wcDwW2G2cOA8QHgDbJNdyGZxYRZb10FWI9lZPabLiArqIAFpeeVWK5qKPILTipmO
 3Yg9yyurABK8qpLUIxoUTtfJYwP42ZT33yO2Qy/cSCznvwZNq72XvTwYh09swLDXM0wv+7kRUUY
 z7Gb5CR8PPJKhkq7Vv/X3+HA/zwAvqplPHATfkcNdqltowoMh71+IS5wuGYtpTqaQsZp1deBanC
 xEmQoHpcBTmRcZ1XwWEMUFPeTHNgFqBQHTbf0WXLyu1mQUou
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: s3oJypDZjCapVyTGdrH9aD_zvC1GyD-E
X-Proofpoint-ORIG-GUID: s3oJypDZjCapVyTGdrH9aD_zvC1GyD-E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MyBTYWx0ZWRfX1eo2R0+fdgGz
 a/e9zsAYDaBkCGwUNZNZxZJLPN39bH5uXME/3rpUjMbHGIV66BG+O5+on9KXsDCTG3fdrFA6fbZ
 oGDQjRYjMXR2Hsq2+zk1tzrzIJQzQZQQsGkJJ4YaymHYdHEVNXTLb7oha1GpJzvMj6x1l6WzsFb
 s4roGzBShRDQw9r8j1NwL2IBE/cemvvks+RyDqfvlBRKY3aWQj39tqwxg0RVib2smgKLZQgGgun
 Dv95qOIXC91c32MsTrlg02CdUihMX9Pb+/rqNpVo3i5iRXJC3wVQTg5dBtVhPrfKo6KbDRqJiF6
 g/kH75cb97Tca5PuBdcOJJ7Cq38FXueTVxvqDO5onjaf38N8eUb6eO6V74/pyukCFGlDJVI0HVO
 mnQV4bLUxFtfRlODr7/6flzKvkaKnQ==
X-Authority-Analysis: v=2.4 cv=Sf36t/Ru c=1 sm=1 tr=0 ts=68d8f0dc cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=9qaGXxVFTICEpRVd4z0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270043
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

In preparation to tightening driver control over generated InfoFrames,
make sure to warn the user if the driver rejects the InfoFrames on the
grounds of it being unsupported.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a561f124be99a0cd4259dbacf5f5f6651ff8a0ea..e85a6cf6e67232528861521bb21251bfdce6f8b9 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -920,6 +920,9 @@ static int clear_infoframe(struct drm_connector *connector,
 	int ret;
 
 	ret = clear_device_infoframe(connector, old_frame->data.any.type);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      old_frame->data.any.type);
 	if (ret)
 		return ret;
 
@@ -947,6 +950,9 @@ static int write_device_infoframe(struct drm_connector *connector,
 		return len;
 
 	ret = funcs->write_infoframe(connector, frame->any.type, buffer, len);
+	if (ret == -EOPNOTSUPP)
+		drm_warn_once(connector->dev, "unsupported HDMI infoframe 0x%x\n",
+			      frame->any.type);
 	if (ret) {
 		drm_dbg_kms(dev, "Call failed: %d\n", ret);
 		return ret;

-- 
2.47.3

