Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75E74FC25
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 02:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD8410E466;
	Wed, 12 Jul 2023 00:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F51210E463;
 Wed, 12 Jul 2023 00:34:08 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36C0I5R0031906; Wed, 12 Jul 2023 00:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=V3kOupI2+zPUUBVhvbOLc1sNnyjIW4o6i/NwgoF9m18=;
 b=on+TXMAIqjg3xuXLShaJ/E1kzTpf48rfGm8RwanzNkXfIBOVwquw/cKXgs2d2B8Nk/b4
 lhWagOcJX/6HE4B/aQQYhw4niEX0gU6j4XgN6sZ4FQTxxqfrMh2HmZkl0cVI0bTh+sGu
 LNxtAGa0DxiRrEsGBwZqA8vsvo3CmRA0bt+qddzgJlCSa+HZrulPJi8DUiJgrH/8vA2Y
 j/RzcESpbNKoUkZuw6F4lZiM/NZr/mKuOfjCjJHX15p03Np+O1YwgloWB9DjkTXYvTzi
 NT7W5ag47/GvGQA10+K3kOLvkKO76APwNxvRB/r6wYSwGGkp8XfBquxGpaNqh7S4K4+v Hw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rser0r9df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 00:34:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36C0Y3Bi014320
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Jul 2023 00:34:04 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 11 Jul 2023 17:34:03 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>
Subject: [PATCH v4 0/4] drm/msm/dpu: Re-introduce dpu core revision
Date: Tue, 11 Jul 2023 17:33:05 -0700
Message-ID: <20230712003310.31961-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: sPf6UEIqx4DXn3je-qkV74enGLRgzXJl
X-Proofpoint-ORIG-GUID: sPf6UEIqx4DXn3je-qkV74enGLRgzXJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_14,2023-07-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307120002
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
Cc: quic_jesszhan@quicinc.com, andersson@kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With commit dac76a0144d31 ("fetch DPU configuration from match data"),
dpu core revision was dropped in favor of using the compatible string
from the device tree to select the dpu catalog being used in the device.

This approach works well however also necessitates adding catalog
entries for small register level details as dpu capabilities and/or
features bloating the catalog unnecessarily. Examples include but
are not limited to data_compress, interrupt register set, widebus etc.

Introduce the dpu core revision back as an entry to the catalog so that
we can just use dpu revision checks for setting register bits based
on the dpu's core revision rather than catalog feature bits.

changes in v4:
        - added a cover letter explaining the feature
        - introduce struct dpu_mdss_version to hold the core revision
        - rebased and added support for sm6125 into this
        - removed hex prefix from the revisions
        - renamed enable_compression() to program_intf_cmd_cfg()

Abhinav Kumar (4):
  drm/msm/dpu: re-introduce dpu core revision to the catalog
  drm/msm/dpu: use dpu core's major version to enable data compress
  drm/msm/dpu: rename enable_compression() to program_intf_cmd_cfg()
  drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS from dpu catalog

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  6 ++++++
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 ++++++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  8 ++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 19 +++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 16 +++++++++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   | 14 +++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 22 files changed, 139 insertions(+), 18 deletions(-)

-- 
2.40.1

