Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B76D76D68F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668B10E560;
	Wed,  2 Aug 2023 18:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7572910E55F;
 Wed,  2 Aug 2023 18:09:38 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 372HYdti029976; Wed, 2 Aug 2023 18:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=7+rdSljm+ZDF6d34FHMYqNV/gE7egf6igpJ72nu9IuI=;
 b=eIkOOfXBR/BeBMY9fDhrFrFZDccF6PMif6ZsRcyYpHf2poevmo2phc5R4Np8gfmcMbJQ
 Oa071r+gLYsnV8SneQCfmoCZg27lHtMp1mlZ/cE35934D6hpEm3ASCy/1pFKq03pin9E
 KSf4hda/y23v27Ocxz67qgECHp2plbMt7h84Fb1c/yGjE2ApZyybtpwJRG3EvD6Ai5vT
 FvJYhY161xGl/sMGdiwM7HOWwlm0a09XneeDv9HGn5j3G/Tq45RNRCUTsXO61OvR+OV1
 5uYE5gSldtsXVy5Wu+bMONaywIpDSOxTa9+5g0msFULBlYeuFwsQo4RmvnKLxXp3FfcL Mw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s7bw9jcjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Aug 2023 18:09:09 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 372I98NN006543
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 2 Aug 2023 18:09:08 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 2 Aug 2023 11:09:08 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 2 Aug 2023 11:08:50 -0700
Subject: [PATCH v3 3/4] drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230802-add-widebus-support-v3-3-2661706be001@quicinc.com>
References: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
In-Reply-To: <20230802-add-widebus-support-v3-0-2661706be001@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690999747; l=923;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=aRMmQo7E922CFIY2TnXZRiHKSErVfoF/5a7XDvCAP28=;
 b=pmWB7DhlFwG9lrPGKwBaC/b8mGuaIzUSL0rIGF9c9T0LUnCb2KOZ767diCxtiyB3BSti+EZKJ
 QxjkwUWgzhQCA5bvhh5z96QPSWpnZs0eu268PaUrbepfqRSk/6/MMQS
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: SmVjfW2AqVDIjyAOrg1nbUN1lAr_YtLg
X-Proofpoint-GUID: SmVjfW2AqVDIjyAOrg1nbUN1lAr_YtLg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_14,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=626 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020161
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a DATABUS_WIDEN bit to the MDP_CTRL2 register to allow DSI to enable
databus widen mode.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi.xml.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
index a4a154601114..2a7d980e12c3 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
@@ -664,6 +664,7 @@ static inline uint32_t DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP(enum dsi_rgb_swap v
 	return ((val) << DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__SHIFT) & DSI_CMD_MODE_MDP_CTRL2_INPUT_RGB_SWAP__MASK;
 }
 #define DSI_CMD_MODE_MDP_CTRL2_BURST_MODE			0x00010000
+#define DSI_CMD_MODE_MDP_CTRL2_DATABUS_WIDEN			0x00100000
 
 #define REG_DSI_CMD_MODE_MDP_STREAM2_CTRL			0x000001b8
 #define DSI_CMD_MODE_MDP_STREAM2_CTRL_DATA_TYPE__MASK		0x0000003f

-- 
2.41.0

