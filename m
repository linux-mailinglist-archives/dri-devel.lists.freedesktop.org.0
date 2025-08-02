Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFBEB18DFA
	for <lists+dri-devel@lfdr.de>; Sat,  2 Aug 2025 12:40:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C08810E119;
	Sat,  2 Aug 2025 10:40:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zsuangat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD6510E119
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Aug 2025 10:40:40 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5725evqD004337
 for <dri-devel@lists.freedesktop.org>; Sat, 2 Aug 2025 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=zu+wgBbmPg38lcKPkzJiVr
 U6c5vcWfMV6SwJ1iTuKKQ=; b=ZsuangatO6qj+6HG4GpE4UDl2oB3KlcZ2GL6Pv
 IRY9pcSj7d+ylN5BWf7CCSDZHCh2FuvTCH5n+nTcI1E5L94ZcFAR29KHhTo0eJsL
 om+2TFYMbPWEvoaE8dBiL8wF8IkCyMyAMXJLfDu7+CDOpbGvssnWvC7tuE0yC/K7
 M6+wv9LGBzChwxaZoNA5Q0usM7Td1e3kzfAh+p4L2SkxcMZpno00Il8UUiDlFRRk
 XjvHJ4PRf/ml9WUCP8iYdtYB/xyF3lXErUaHcCVZuOpJti6/ZrxDiRCwZjh58kAf
 7SmH+TT4jyTYcqFYKRHZnH6nM+6UNqx/HknWn4SOqj/xjWwg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqghbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 10:40:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e665a0cddcso290630285a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Aug 2025 03:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754131237; x=1754736037;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zu+wgBbmPg38lcKPkzJiVrU6c5vcWfMV6SwJ1iTuKKQ=;
 b=YMJowbKek42XxuOkEwfJHX0kl3PnXQ/zqfIZs5llXU0ERQtK2Q55k7oNjpOFiSKxSk
 kOCCJg1sYQieW4OQIi33JAoE+AkwYWBYceIpzO/LfrfmKEFp6r+XCH+2iR062rxOxUmB
 sGh/1y0Q3uZ4xyz443DQGGmBmqlfJrieiKclwuVKJjOR9fT5bX2/Lxc2s9XqB1l2DL0m
 7Toi2vUlfKH/FjCzH6glmitl6JC63JTXyoMhtlAVl454qICoBI0orqyofkf6E+HLwqRu
 Hg3bb8y8d/eN8e1MSmj3j6iw6inWxBh1rfijTwRKYiKodKwZHajO3E8c3/DwhEOjZeAQ
 Vzig==
X-Gm-Message-State: AOJu0YxbyvKi+peulDrbnj4seRXCqQQQrZhDsQM1mPDMVuWthBbF2cLq
 vaa3JgAw1iLdPYyDLhg8c6h1Io4HtdbTNwBqWcHln0mBcvfYWvnxDA93EnBAUn/2TE+1FZg/REz
 JuxtzlzOygRaj37TMdWrNdqY/j1YSpLyosGu/M2k9srwovjW6Aw81rq0Nbb2K42pCVo/XFJojRK
 3W6Gg=
X-Gm-Gg: ASbGncvbrAGPEQPGHJ1woPWpA1aBMNUJKvpj7Aa0tZQpeeJ405v7PChQeBZ9rl5r8Pn
 yxDOMhs9fz/AA6XnFGd0uTiUKRYPX6SkFZSF9JiuyvZHJ9Jx0unLp02T0KBOetGu4DvlpofyIsu
 rHjbGvmBeyM2mevcvEC7DouIlELAUxKLKtE1m6YC+gc/wL7+5kG+fhdKYohSo1UyHeJlgywaryT
 pGQcllikezKJLVBItVHkb6N+5I+WnbfL6/Di2jpue4gTNHgfyUjObrrg0npmpRvru3aZE8b+y3K
 oGrTx2OcfqmE5XDa+AkreBd1IhkvxfLGOO69J4HLGt6PL8BAJio1t/j+VTsgSpuh+TO5Qs0yHBK
 T5O6/ZSUDkw/KNq5EiFP7uSiIjf4i5bYXeuTm5owzw1cmi2Mf34/8
X-Received: by 2002:a05:620a:8c3:b0:7d4:49fa:3c59 with SMTP id
 af79cd13be357-7e696290870mr383574485a.15.1754131237448; 
 Sat, 02 Aug 2025 03:40:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFo5WUyWXxaVu371UhvAZx0Y/HJm6ZuA6t/pRnQ+dzL5rNQV5KuJVUOj53fEOxRGNJb2YAEHw==
X-Received: by 2002:a05:620a:8c3:b0:7d4:49fa:3c59 with SMTP id
 af79cd13be357-7e696290870mr383572585a.15.1754131237029; 
 Sat, 02 Aug 2025 03:40:37 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b889ace49sm928030e87.71.2025.08.02.03.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Aug 2025 03:40:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 02 Aug 2025 13:40:35 +0300
Subject: [PATCH] drm/bridge: display-connector: don't set OP_DETECT for
 DisplayPorts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-dp-conn-no-detect-v1-1-2748c2b946da@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACLrjWgC/x3MPQqAMAxA4atIZgP9QVCvIg62jZolLa2IULy7x
 fEb3qtQKDMVmLsKmW4uHKVB9x34c5ODkEMzGGUGNSqDIaGPIigRA13kL3ST0uNk3UDWQ+tSpp2
 f/7ms7/sB/Uavb2MAAAA=
X-Change-ID: 20250802-dp-conn-no-detect-b901893b5e3c
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1917;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V5fwEFSvd6iZX7vn1nOUGXoBQVgsda3sPWa8+8IxVEQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBojesjxhI5LE1y0oeOUvU2pvk6ANdl/CkH4FaFn
 0Ute45kT5KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaI3rIwAKCRCLPIo+Aiko
 1cs+CACO7cAgyLFxQc0407yt4axfgDYItBSqQrrMOKTFTpXNQhcEIIfC90mhSmpoxc/38Fm3XHw
 fqowe6NMvNUzZwTXJ8KMUnWE1FvSmMHdMF5i5f4VgqmxAQn8zvzFjBnuHz2GmFdoZvthLG0QzLC
 Elz1LL+mzcAtxwoSMw5L35tIUhtCZuaQxDho3igakcyl5osd6VOYS/8vvbRslEL1RrDZR3iMTCK
 79eHouHtIOvUwF/8zPOubPwnD4pYd15BlDrZWiWehoLxZP78AwVQhIlwNGp2Do78LWvzs3Wr7R3
 6wZkKoLwjQmzQ9n5+uCslf7Ew0/0QnuyxPkIsbKqr1R/oWgc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pMihiAOqqjugAqtVwF5M8Uuhs7tgiWQ2
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=688deb27 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jZDBt8FwwR466f3IuqAA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAyMDA4OSBTYWx0ZWRfX9wBUUYT/cpr6
 WXvoxh7Zq4W4njmbWuj+5Ghe/7MmF91wfguInQDbEEda+P3tkbJkgRpSdaXjYoj1BZNrWBWGFML
 +C3h8zrtnqNNE4ndRZa+9ikWs9IuCTokWn+gICKzVAV5MkVWDb9dyAu4t5nTmwUPgu6lPLUGXpR
 AzEBirIShDbt4PsduP8cI4LMD8gLDzUcw892x7fsQgafaaHvR5BMqsyELPF+NOj8tdTjAEx50++
 NzCMVjCkrsewVehc75b7mYZBWtex26b1mPaok3Isoz8gUWSxUS2KevLQCI9Qqcvh9He3bLGzLiv
 9md8HIeR97pB7m4WnhjtppcaJK0RKZBGhU4JM/W9IJdV+UWveEurf34lJfns3wpttfOozVCgNrO
 xyBEk+e/eOyIWx03+t69KLSnZOFUqvv47Q4tTVEMOcIhyE5jPziiMBOmXvSk5kGPW4Bb6kKK
X-Proofpoint-ORIG-GUID: pMihiAOqqjugAqtVwF5M8Uuhs7tgiWQ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_08,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508020089
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

Detecting the monitor for DisplayPort targets is more complicated than
just reading the HPD pin level: it requires reading the DPCD in order to
check what kind of device is attached to the port and whether there is
an actual display attached.

In order to let DRM framework handle such configurations, disable
DRM_BRIDGE_OP_DETECT for dp-connector devices, letting the actual DP
driver perform detection. This still keeps DRM_BRIDGE_OP_HPD enabled, so
it is valid for the bridge to report HPD events.

Currently inside the kernel there are only two targets which list
hpd-gpios for dp-connector devices: arm64/qcom/qcs6490-rb3gen2 and
arm64/qcom/sa8295p-adp. Both should be fine with this change.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/display-connector.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index d7e1c2f8f53cad514ec502d58c1b94d348515b42..e9f16dbc953533c2a2d329ee8fd50c1923a78aac 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -373,7 +373,8 @@ static int display_connector_probe(struct platform_device *pdev)
 	if (conn->bridge.ddc)
 		conn->bridge.ops |= DRM_BRIDGE_OP_EDID
 				 |  DRM_BRIDGE_OP_DETECT;
-	if (conn->hpd_gpio)
+	/* Detecting the monitor requires reading DPCD */
+	if (conn->hpd_gpio && type != DRM_MODE_CONNECTOR_DisplayPort)
 		conn->bridge.ops |= DRM_BRIDGE_OP_DETECT;
 	if (conn->hpd_irq >= 0)
 		conn->bridge.ops |= DRM_BRIDGE_OP_HPD;

---
base-commit: 82928cc1c2b2be16ea6ee9e23799ca182e1cd37c
change-id: 20250802-dp-conn-no-detect-b901893b5e3c

Best regards,
-- 
With best wishes
Dmitry

