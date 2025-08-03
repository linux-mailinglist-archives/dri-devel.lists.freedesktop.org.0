Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D07B193E4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Aug 2025 13:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161F310E13B;
	Sun,  3 Aug 2025 11:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iQCEe4UB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8455110E1AF
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Aug 2025 11:54:00 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5735UNwo031559
 for <dri-devel@lists.freedesktop.org>; Sun, 3 Aug 2025 11:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
 syUcZjDX5f8XV6NFySlbc=; b=iQCEe4UBn+zhy5xKBcGEWlR2jONw9So3CdetpX
 BpfErIOkkwKR3hQkvFA+8niFS1/e73tzuV9Vv5XKDWEnXeM12hoo7HG9ME02InX+
 nrmvch2r0vlubkl96JzBpFqC5ACIvESypeZVz0nNhvjLQp/OQxqKNbFX9/vfWGSH
 vGzTsYCGY3yUN8mg2ZUSQIlIeFCZJkG7yFlYKCHv8UrOgixZah5tM0awNZL4CHzJ
 Hi6h3RlmCX52GZYMlEwaS2CGLcgMjWsb5lRLeR+lmcjWNg68J3xXZbjFZWdfJT/e
 CLr2V27/e1xHmODW/9iIWMjIKcHRfTywKdVxCRasguey/7iQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqj4r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 11:53:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ab878dfc1aso79253851cf.0
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754222038; x=1754826838;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
 b=Jiz8/oNCzD8eToy+5dBUCn6ykIMqnw8gSiIEaHDCsxDCXITsMaxwhNiRhYR1XgxF6l
 OSXkbuG5hInbnzxJu9R3Hhw2e28jiqVp4QXSzIZRgMGbR+0ymZLKa8MkNsgkEuURJPx5
 e8Rv7e8qDoO4IrK5eLfoYwRx63RBhVwPHlBe49WVktPD5hEO1prlJn4rjxTAiKfOsMbb
 VjiFE3qBgVyEe0e8jHLq4YTF5h+P7twl+UXMvHQhgw0Y/THgLCK1SuB/5XpB8TnD8Oz3
 GhqSYt1s7VRQRuwZV61oPGBIsigDu9Zd1IK4DW9QbAxHxwRLIgQXLd41QW5rjUH2N2WM
 Jdnw==
X-Gm-Message-State: AOJu0YxZduSlhKg1XbUWnmY/7vkF3xqeqI6BiDMdVZAr5uzeKlHcELu4
 FswoKr+OeVN0J20p9/1f6AeN9QkXTb5e9mWe3q4A9oleoN/mvD4bosaXhzQGJZvKIMNZ3VvhBxw
 /73FEHfJlqqkK95hooI3DlkhPxI0juDPcoc3guxgx18HimJqSS/g/0RkhwILJEyV2kjYwNIg=
X-Gm-Gg: ASbGncuKpDNKs28afrgoMKIB+IVfRHOBKqjMdpHWUfKmnXQSccutadgnV4LydfzV5K0
 CKY1TsCLZDGjKbEyvWrOU4vxC4d3oK2DN1N/ilk2oysTkCmKhHrzu2lXWQTN8l9KshnyvIRlD5v
 JzurWJDWcW4UtLvayBa0Nbzg9ndECfGpYj4qCMFywm1LmVXDQ9rq0gtPxlySq5mc/2jmSp2YGUl
 Y7Xw/aQcUoVUKpYVuDmCPRcTY3m/IMCLlsP6rjuxAbfbwKYK6sdYiuRpZnZXRckHKqTs+SAlsaC
 aag5hC6BmFOtrb3VvmsAT4TqU7VQyHzITwgexN86274pOVQorIFrOdsGzs7I/g9KWXJDoihV4Cx
 qQit3+panL2AUsjxPDWOvaCXCQLVkrGkAFkEMNeOhO29lP9zinl6V
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id
 d75a77b69052e-4af1098c10cmr109506361cf.13.1754222038496; 
 Sun, 03 Aug 2025 04:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6F1gC3i9qNqPGQ2+U8UnWuUnVr8S0dL9Kp9yI/T0GmDv1re8BD8ymDZkfYLJgECcFcEOVzg==
X-Received: by 2002:ac8:7c50:0:b0:4ab:63f7:9a80 with SMTP id
 d75a77b69052e-4af1098c10cmr109505841cf.13.1754222037990; 
 Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Aug 2025 04:53:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RESEND 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Sun, 03 Aug 2025 14:53:50 +0300
Message-Id: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0a/76XO+afzL5QKXQqM/OCzeVVFxIPW+vrJ85d3iq3S2
 mJucD20k9GYhYGRi0FWTJHFp6Blasym5LAPO6bWwwxiZQKZwsDFKQAT2e/PwTDZzds4TCJ3dd13
 K9typZKPcnseh78q7kk6VPCsvHrdXva/obn74nxnev78YTf/W9lKiT7Z061Olr38F3aqXL098ep
 pZcXG5eau1/hnKbfeyjl9dIlqhfsHjisb7SvunUiT7pSwm3e7b4afq/J88xIu2+Aeqy9hscq/Kh
 7JX2LNrvM7wf7rYP5pWX6HM3tdNaclzvMIa9S6brW/+Nu73a9+83ewOyybL1ywbbVSiKq24sk2m
 Y9VXCsP5ptdvmrka7avfYLBe+9HRxZOqeQ+umZ228ME37N6ApLPWtL/KPEpb0pvVug+7nae3fJP
 e5O6RbHJtFSzH5GqLmuzovrMw2bVFT6wunHexnRnlqceAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 34v0w8J15o5fdC3TUQmRmfdFLSbRnhta
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=688f4dd7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA4MCBTYWx0ZWRfX0Hv/rSemB0Vu
 41vtVTLECJcY623YtgFk3Ucqo8XneHD3zJIFxR5ryXju31LcTDlP843MCBYJCTpNFbK6oLiVcIW
 u+7qWCCw01dLnQlm3ysKyyqI7zI6v8usU9AVQLo2aeuhz/msmLrSOsg9uz1AZAJVmfY7xCTKGKb
 6YwjacCn78SVu8wvSFW8rxrmkAsa3E3O7RK2HZVuvlmbDC1E1yYmGdRCoeNE8Vw2FuJWL4jUcfb
 UojA9qbLkUgANG9i25C3CMHLQzYV9IGlKoc5ktHPXQsJZsIaPKJ62aF3prR/zu6n9XjkE90xhzV
 BGby88UQgVhRWrJ2ZLsiIrcJBsX/St9Kc9YXlWiJkum8ev84xj5WafueAGH3aWd3nnOwl4UKRe/
 /IBVSxe/yGEwHCqUN7HH8Z5PJlHrpSFJ+F36nr3giQ4qvlkV5HYxzAZgLbx0pYFygjBb5O1J
X-Proofpoint-ORIG-GUID: 34v0w8J15o5fdC3TUQmRmfdFLSbRnhta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030080
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

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry

