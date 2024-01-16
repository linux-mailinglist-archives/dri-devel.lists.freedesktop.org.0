Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089AD82FC8B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 23:23:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4AA10E223;
	Tue, 16 Jan 2024 22:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B5F10E223
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 22:22:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40GLL1mZ026373; Tue, 16 Jan 2024 22:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=qcppdkim1; bh=7AV5VoHdOHUZxO
 DEMYQjLyEgyVUtFRZTLR40V2UbT/A=; b=edYH7d1yeTvorFTi2KppjnBohU9xe3
 vB8XUACyV75xtxEnI1DfuA0cqdWKWk7zSk3xmI2A7mwZ3z58D9iEfEdW6o5hSlyB
 hI9c8D5CGQkgF7oUni3goYhSQRkYUxE7hvImHEDfyAmfMTIYMNP9Bg4JJGJjm91Y
 X7qaGctHtvHZy4EAh3eLwrZ0ohKonSm60tKJilH7TyYXO5++SIK1J83goyj4abek
 kDl3kHfGp7QVu8UlFyqX30bHhmfi8wVb/mr0qECLtrZiV6CPY6ewxbCJ9Wi5noCb
 WiemmXR9E/KOZiG6z2+UUlTiIRnb86PTn+SSkFOxGqtGzigzeBgVV2IA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vnnvbj2c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40GMMOVM031751
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Jan 2024 22:22:24 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 16 Jan 2024 14:22:23 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH RFC 0/4] Support for Simulated Panels
Date: Tue, 16 Jan 2024 14:22:03 -0800
Message-ID: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIwBp2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDQwMj3awq3ZLU4hLd4sxc3YLEvNQcXXPDZEOTRFMzc0OzVCWgvoKi1LT
 MCrCZ0UpBbs5KsbW1AH85X/hoAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705443743; l=1781;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=sbxLU4K44Nbc78E8GhhYwOgfUA4LM4PzvW498gGHVXk=;
 b=Iiu5CRgKl4sCyrzbXTiUzle3E6Qau88ltJzDaSZL10ByoX4rjplNQLaDypmUyEjLdCzVRZ0nG
 3lo1c+EHTA4AHFzJl7ZTZu2NSqx8efNkVXGyUNHawQrRcYvolcHYi8O
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: ZoCCy9smX5TsYNCWEwZdheKzq5GFiTjw
X-Proofpoint-ORIG-GUID: ZoCCy9smX5TsYNCWEwZdheKzq5GFiTjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-16_14,2024-01-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 priorityscore=1501 mlxlogscore=793 lowpriorityscore=0 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401160176
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
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series introduces a simulated MIPI DSI panel.

Currently, the only way to validate DSI connectors is with a physical
panel. Since obtaining physical panels for all possible DSI configurations
is logistically infeasible, introduce a way for DSI drivers to simulate a
panel.

This will be helpful in catching DSI misconfiguration bugs and catching
performance issues for high FPS panels that might not be easily
obtainable.

For now, the simulated panel driver only supports setting customized
modes via the panel_simlation.mode modparam. Eventually, we would like
to add more customizations (such as configuring DSC, dual DSI, etc.).

---
Jessica Zhang (4):
      drm/panel: add driver for simulated panel
      drm/dsi: Add API to register simulated DSI panel
      drm/panel: Introduce simulated panel bridge API
      drm/msm/dsi: Add simulated panel support

 drivers/gpu/drm/bridge/panel.c           |  24 +++++
 drivers/gpu/drm/drm_mipi_dsi.c           |  30 +++++++
 drivers/gpu/drm/drm_panel.c              |  33 +++++++
 drivers/gpu/drm/msm/dsi/dsi.c            |   4 +
 drivers/gpu/drm/msm/dsi/dsi_host.c       |   9 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c    |   8 +-
 drivers/gpu/drm/panel/Kconfig            |   9 ++
 drivers/gpu/drm/panel/Makefile           |   1 +
 drivers/gpu/drm/panel/panel-simulation.c | 147 +++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h                 |   1 +
 include/drm/drm_mipi_dsi.h               |   1 +
 include/drm/drm_panel.h                  |   1 +
 12 files changed, 266 insertions(+), 2 deletions(-)
---
base-commit: 9ba3471618f1ab8df2f2689a34a505a72e05760a
change-id: 20240102-jz-test-sim-panel-71c14a56716e

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

