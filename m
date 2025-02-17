Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ACAA38FCF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 00:59:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225F10E105;
	Mon, 17 Feb 2025 23:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="HR/GfALI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5710E0DB;
 Mon, 17 Feb 2025 23:59:08 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAd7uZ026649;
 Mon, 17 Feb 2025 23:59:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lMqMZLTYa2kYLC7D9fFxESD4s5mT7HcSQDi9amyaCIU=; b=HR/GfALI+fiDt4WL
 87TMC38N7MmGIGi0z67zVrAJNzUjmv9zR2KViX1P0avT2+2XM/t1v0NZF2idOELP
 tae5kbq/gcTqPsqMQamMbFawih2EcgJDRk6n7xS8ZAv3QrpWM1CtP9EU0PCXcTdK
 3szB/2hY80eN4knFbxrekphO1OWX7sRTH85K49m9qWbONtvpYLaOIDJU3mQS1CFn
 mov/QA4KK15u2e70vM9X/QoaRtZBTvbVMgPHq8T5d2cZ6YdbG8DofvVzVAYUYBhx
 knNEkbJt+7qNyAA8O+I7S64UHWopQJIO4GfRh2cA8eLJwzC5aGLd11gkuXMptG5M
 6Ci7RA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sk26y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 23:59:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HNx4og028195
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Feb 2025 23:59:04 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 15:59:04 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 2/2] drm/msm/dpu: Drop extraneous return in
 dpu_crtc_reassign_planes()
Date: Mon, 17 Feb 2025 15:58:56 -0800
Message-ID: <173983666324.1740000.4701768298873523057.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
References: <20250108-virtual-planes-fixes-v1-0-420cb36df94a@quicinc.com>
 <20250108-virtual-planes-fixes-v1-2-420cb36df94a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: i_08xV6m383Dqmiq7MT6vQNlEcLbfTM4
X-Proofpoint-ORIG-GUID: i_08xV6m383Dqmiq7MT6vQNlEcLbfTM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=687 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170181
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


On Wed, 08 Jan 2025 14:40:48 -0800, Jessica Zhang wrote:
> Drop extra return at the end of dpu_crtc_reassign_planes()
> 
> 

Applied to msm-fixes, thanks!

[2/2] drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()
      https://gitlab.freedesktop.org/drm/msm/-/commit/5e192eefebaa

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
