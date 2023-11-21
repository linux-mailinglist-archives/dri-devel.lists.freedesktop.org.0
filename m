Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CF17F3642
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A23310E565;
	Tue, 21 Nov 2023 18:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3636B10E565;
 Tue, 21 Nov 2023 18:40:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3ALI8I5L025601; Tue, 21 Nov 2023 18:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=/BDvp/+M7FtxKsx5CnIFoAzu3HuceD6Uf8E03fkbYkA=;
 b=i/Rk3o69ico5qI1Tig/uqM4BYf7psKCNrG5hpYwkiiGXyOuH98L3f8ewszv6hLvtb61L
 eJEPRtOep6O+7uX+bEEVs7LYzSyRNV+Qp5LHQ2iad2AVtDZXDknY7hIJh4YAqtQpfw9I
 RqlGymSfgzGp+vj5umrg+0XAS7zyvQTz4Y6nPLmKHambrsp4nCPGjFxo4EgcMwJXKOen
 CBM3hKQ/apJ36m1KA523dHDsOTZBJbxpXyZotYUAMNkX8Wk6wSXxJZqO1s5y3sZrqqL1
 VYwPy+nmBVcRSzw9gYRcjGxt2C7+KiPPcjKBZI/aUI7cZmXWTiqy83CqhOyxK4nFwqc+ sQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugu549grx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:40:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ALIeYnZ003920
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Nov 2023 18:40:34 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 21 Nov 2023 10:40:34 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
Date: Tue, 21 Nov 2023 10:40:23 -0800
Message-ID: <170059186277.16750.2750065361264739153.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
References: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: z8cXBg5gRK5Y5TZnNLPlm5OXcrOHnwPd
X-Proofpoint-ORIG-GUID: z8cXBg5gRK5Y5TZnNLPlm5OXcrOHnwPd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-21_10,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxlogscore=782 adultscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210146
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
Cc: Rob Clark <robdclark@chromium.org>, Doug Anderson <dianders@chromium.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 30 Oct 2023 16:23:20 -0700, Bjorn Andersson wrote:
> During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
> typically take 1-2ms to complete. As expected this results in poor
> performance, something that has been mitigated by proposing running the
> iommu in non-strict mode (boot with iommu.strict=0).
> 
> This turns out to be related to the SAFE logic, and programming the QOS
> SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
> TLB sync time to below 10us, which means significant less time spent
> with interrupts disabled and a significant boost in throughput.
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
      https://gitlab.freedesktop.org/drm/msm/-/commit/a33b2431d11b

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
