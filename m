Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01B7C43D3
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 00:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E9C10E3EE;
	Tue, 10 Oct 2023 22:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA00310E3EF;
 Tue, 10 Oct 2023 22:26:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39ALnovJ030589; Tue, 10 Oct 2023 22:26:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=lKQKuAwh65sh0qixZObGBU5urU0UIj12oq6080A+8HQ=;
 b=oeCc2tiYxNPR1t4trqpXXk7Ld1ap3kBDsbGauZxTh/P8sSompFmLPfHBT9dx26CXBJVS
 rvtXSMheUU1VPfgmAYTc0AbZ3/7FfnXotlLERo2rStHnOwGSCzNJuyrj5MBQ6r56UzFT
 lJYeQB7BssMRJaTsSuHSIT7VZKwPq5u5CEFpguy85QksKEgQSBtPq68uhqvx28mCTsoZ
 WDesCLU+x3JCNnHw7nxAomCE4wKjdvw9S0athBM17w6/CHvRu9aRCNmvviMrjhgo7zwa
 NBPDpc05QgjORN+kF4JeGEJi7feM/K0ilmu6KsVTHdcy/Z1xWtowip938zEErHjJh69C VA== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tmt70agw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 22:26:02 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39AMQ1CD000495
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 Oct 2023 22:26:01 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 15:26:00 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 10 Oct 2023 15:25:36 -0700
Subject: [PATCH 2/3] drm/ci: enable CONFIG_INTERCONNECT_QCOM_SM8250 for
 arm64 config
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231010-rb5-runner-v1-2-aba1fcc6e3aa@quicinc.com>
References: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
In-Reply-To: <20231010-rb5-runner-v1-0-aba1fcc6e3aa@quicinc.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696976760; l=840;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=4+0/X0jvRme2IjY8qf0RU17Imtqt+wfoJ67+dfsKtgE=;
 b=dTkya3k6QRnFj8RuElpzUqf0QnxeD1HxszhPYDYThNIwZxy/9ehMzhe6XgUDq5dLq+LDxMFdt
 R7YuT8ACcYKD2iPRZPbomU3KFVObVcxN6srZYB63Ik+9IqYnBKuQHOl
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: _M9mMP4uDGTqYoxYXCRg1PdH6P81Xse4
X-Proofpoint-ORIG-GUID: _M9mMP4uDGTqYoxYXCRg1PdH6P81Xse4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_18,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=851 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310100171
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

Set CONFIG_INTERCONNECT_QCOM_SM8250 needs to =y so that the ASIX AX88179
USB Ethernet driver can be probed in time to set up nfsroot.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 817e18ddfd4f..7273a37cbc4f 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -75,6 +75,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8916=y
 CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y
+CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=y
 CONFIG_CRYPTO_DEV_QCOM_RNG=y
 CONFIG_SC_DISPCC_7180=y

-- 
2.42.0

