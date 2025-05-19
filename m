Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAB9ABBB9F
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 12:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1710E3CB;
	Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXT8/90U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3EC10E404
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9ukrg003168
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=; b=nXT8/90UtPNYFOVl
 lO89wI7YQKOORwYNbXDwpUcHcHCYJEEnnNE/d2sZ5vcwuHD1lFP11G1pUGwuApvn
 crn7cvzPlakbrP9FtDv28Tme1qNFW5ZXiRzXro63fVro/1EzE9y+ORx6CdZU5kVi
 rEfcFJbXwaegQ5suYLTplGNyNMYqWGlfiH3DZS897k6cc/FtEa/We/gu8MTjqb9C
 ADDaqr8EiaX1n9jIdugSl6TqJSdZ0c1Ye0BZhms2r5FATXD1L/q5fPAZ8SoXha6p
 tBpVWX9dOeQB8usjOVYApGbmeeIfE4fEajD+zFGFF4Z0ZoRp0tLj8e/dMAwXwI6X
 kbx81w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4m24e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 10:58:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8ae0417b6so76296796d6.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652329; x=1748257129;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VqRNS/AP2L0HYV/XzQMxzhswyBS2iB5hSp0sUNl5kjs=;
 b=oUJLiPxPO2cGBX1tMQrmZpY0ivdCvMwPXpNY0dcYwgmHapq0HviFIufeSfZq+Z7auo
 sQ6n7GadiyNbn5D5VPo30OO7Bx0jyM6Fy5jdz7ho2ADz9KQaKJ5N33/A8IqBq480DMzN
 hz5zwqGf6P/JXOroqVxZ2TzUsxjaB/eK9WKjluJMdeowEMZrvRP0bEcLZ2HN7cq4RD2Y
 a8dfUO90FJiTNi6KMSHKwXXNcNTctPr0EjZP3feLWrOThEy4BFENoOcRVZqtRFCd7ATM
 3T98kuXe1JvRqm62rqe+dal9gvY+ig8ZMH+5yxxiBcYYC9LtTXQa9NDsbwNn5ngjTGwu
 iuvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJhPrhHs48QMSIUk9sin78OqiiAcjA3Vdv4UOFVzozhHRuXKI6n+6jkPwwG3A/iW4a1iFRQxnAdbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHjU1d0ugIZ0VY/LR2EiFfAOHQimU7f723F6gsdj9YBH713dKv
 Poq4iX71t13g+Wy6QhKuJtjtgHWfQ0K0f7VljiWeRDwkAIbi8WFhTo56nwG50vSt5YzYY50mwql
 x7xu/bu2pGOO/bV+FhjrvDNCydlz3cxOi2uc13QkFfsiWAozuaDsFJgLYQZK3F5pEHZR1iFM=
X-Gm-Gg: ASbGncv672sZBZeDQm+3D0SariRjyEzTS9waDdHFgIoQyPHstgzTtV6Ptfovj8u/6uN
 NBNtjjgA00lEvqwVtdc4c9JJxTab7rfzx/bL7IiIcI0B+KnbT/dSsSzjZv8VKSM7oUfC4ZRmPlG
 tDCvwCy8WXoHE8NR7ovKk0vlVzUy7T2UiiO8Wic7bgGZSRW0wnkjX3wOUUZ/TjWbmfAB9vx1xOJ
 +F3FI+kRcZn71s5qihcQjrWH5MoE0Pf6ftjzEK+UOXa5n8kCbE5598bYhVabvTBMth4YCl52qs5
 911m0wtfzdqe57lxsUIFm71JI1hGjEC2b00ahITJaLPshtdDvCdAEix9BKkcfm+7ieAhYPW+/0V
 PvTcw44y2lAb1iFm94K0VjuK/
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id
 6a1803df08f44-6f8b085299cmr198058116d6.33.1747652329545; 
 Mon, 19 May 2025 03:58:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZ8hMq2kgsgTEUTk7YggTkRUuA47iDtbotHwLHe0Dgywfs65yOnHSbIBuW35N62G91KOkcXw==
X-Received: by 2002:ad4:4eee:0:b0:6f5:3b8b:9115 with SMTP id
 6a1803df08f44-6f8b085299cmr198057586d6.33.1747652329096; 
 Mon, 19 May 2025 03:58:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 00/10] drm/msm: add support for SAR2130P
Date: Mon, 19 May 2025 13:58:34 +0300
Message-Id: <174637445761.1385605.10286310480029078025.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NTHB1rrzOiR5Sn7VFfyBDvn_MuGKTjaN
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b0eef cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=iEGPaXCqe01J9_RIJz0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: NTHB1rrzOiR5Sn7VFfyBDvn_MuGKTjaN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX9JZQtY0UXCu8
 MzIz7dbUCwmPiHZhxDWVrk+LbKxp7k5K7Xxz7rGFjbeNRn8xmcndX6qHixEV+aZ28a2ogwg3UeW
 QBVToRAEpInsV6lsX6ljPjNKgyNGhFA6iptxNp98bRFdj9Nwo7b3q6GQ0+4aTe42VglvY2qA4F4
 L2NuCqMSFqHlqt0AbKHB0PPGB30E4ppguMiwZB78iH9E8pp/MHD7PtBzym4ltrkDbxsTDL9DXaK
 lt7UIX0QwjtQJ1og5DVDA0BiMOVM7jc/G4MaBmKeBviQxRpHhunzVe5kBIpR9THDWoXJqyDGysY
 KSpzo3HIxCuDR7wz5pGY+FCye50PBgPkDmGpT0U8vkpWRyMHbt1xJtlz+DUg3W7S9MST4criXnw
 eKAPCJaaghCBiGJXxSYR8sN8gJq24xGGOzCqGKmXxOF+Ml3ZyVpKb89+tupbk2nEJxbjPK9K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=949 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Fri, 18 Apr 2025 10:49:55 +0300, Dmitry Baryshkov wrote:
> Add support for the Mobile Display SubSystem (MDSS) device present on
> the Qualcomm SAR2130P platform. The MDSS device is similar to SM8550, it
> features two MIPI DSI controllers, two MIPI DSI PHYs and one DisplayPort
> controller.
> 
> Note, due to the technical limitations DP controller wasn't completely
> evaluated.
> 
> [...]

Applied, thanks!

[01/10] dt-bindings: display/msm: dp-controller: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b341da1172fe
[02/10] dt-bindings: display/msm: dsi-controller-main: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3c70c9d0a99d
[03/10] dt-bindings: display/msm: dsi-phy-7nm: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/262650e71854
[04/10] dt-bindings: display/msm: qcom,sc7280-dpu: describe SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/759fe7181723
[05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3096209b7a62
[06/10] drm/msm/mdss: add SAR2130P device configuration
        https://gitlab.freedesktop.org/lumag/msm/-/commit/1e7cbfea6624
[07/10] drm/msm/dsi/phy: add configuration for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/8e63b2075e01
[08/10] drm/msm/dpu: add catalog entry for SAR2130P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/178575173472

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
