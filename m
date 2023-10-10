Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333567C43D9
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 00:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BAC10E3F4;
	Tue, 10 Oct 2023 22:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 836E310E3EE;
 Tue, 10 Oct 2023 22:26:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39ALTFvM021718; Tue, 10 Oct 2023 22:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=Aj9U9fI3f4a2Ip9hx+Ecv5NzDfwsXL7mLeWAMLh6lFM=;
 b=NYiodHLfYLILXI8nip9PV6QHb4r7WIJq4uRw9rv/CWETEPKB2P6AV8NehtL8LdNfCBxG
 6CiKVTa98++KOV/6l7NpH47hkABPU//4OxHyRCuovrKoHW8GpPr4G+5CZNW14h5Rcf5T
 5dsVt1OFf7iKTeYUBbsCwh8KTdJcq2RgaZYUTGc9SNeX/PzrVFG6q0ekQs+m8mQtsjDr
 7B+0NT0ADsYpxrxYzg9O4h3HqHzdjPALE41D50aTLdG0Yp8mIMJRFulAWLSUtHVwG5df
 PPZ/Y6ugUoipA2HFrZ1PYX1ACxy/9MPvqzW+Fg60vbMI31aVWncR3ejvafiV76MpNYSx bQ== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tn3s19mm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 22:26:01 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39AMQ0Dh000492
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 22:26:00 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 15:26:00 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 10 Oct 2023 15:25:35 -0700
Subject: [PATCH 1/3] drm/ci: Add SM8250 job to CI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231010-rb5-runner-v1-1-aba1fcc6e3aa@quicinc.com>
References: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
In-Reply-To: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696976760; l=1974;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=+xGEx1U3mdrd85xIqftmS00zV1XP0XlMOhsUfd1Dsp0=;
 b=p5KkHoRoIRqHn9LQt57ysjVuK2O6qHpj1yfJSzdhGk7pSGAEgbYh7yI5RBn2FVAWZcaRkiOaW
 P5lnFXHl/EFCmx2b770FmnpefvipA81mJ6+OXHlB6R+ytgBT9xxtsPj
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: a66gBpERF98WNaMPbxgi1AhuXBOdKtJw
X-Proofpoint-GUID: a66gBpERF98WNaMPbxgi1AhuXBOdKtJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_18,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=918 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310100171
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
Cc: robdclark@chromium.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add job for testing the Qualcomm RB5 board to CI. This will allow developers
working on MSM chipsets to test their changes on the SM8250 chipset.

This board shall be hosted and maintained by Qualcomm.

For now, keep the test a manual-run only. We will drop the tag after stabilizing
the tests and addressing some outstanding failures.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/ci/build.sh |  1 +
 drivers/gpu/drm/ci/test.yml | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
index 7b014287a041..63bfdcaa897e 100644
--- a/drivers/gpu/drm/ci/build.sh
+++ b/drivers/gpu/drm/ci/build.sh
@@ -26,6 +26,7 @@ if [[ "$KERNEL_ARCH" = "arm64" ]]; then
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb"
     DEVICE_TREES+=" arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb"
+    DEVICE_TREES+=" arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb"
 elif [[ "$KERNEL_ARCH" = "arm" ]]; then
     GCC_ARCH="arm-linux-gnueabihf"
     DEBIAN_ARCH="armhf"
diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 6473cddaa7a9..7ef0d261216e 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -138,6 +138,21 @@ msm:sdm845:
   script:
     - ./install/bare-metal/cros-servo.sh
 
+msm:sm8250:
+  extends:
+    - .baremetal-igt-arm64
+  stage: msm
+  variables:
+    DRIVER_NAME: msm
+    BM_DTB: https://${PIPELINE_ARTIFACTS_BASE}/arm64/qrb5165-rb5.dtb
+    GPU_VERSION: sm8250
+    RUNNER_TAG: qcom-freedreno-rb5
+    TEST_PHASE_TIMEOUT: 180
+  script:
+    - ./install/bare-metal/fastboot.sh
+  rules:
+    - when: manual
+
 rockchip:rk3288:
   extends:
     - .lava-igt:arm32

-- 
2.42.0

