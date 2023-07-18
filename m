Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DEA7570BE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 02:05:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25210E00D;
	Tue, 18 Jul 2023 00:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F3310E00D;
 Tue, 18 Jul 2023 00:05:08 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36HNvkZ2027844; Tue, 18 Jul 2023 00:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=0HUhWxdMwZ0PMjwDvay/KmMYU3EJdqBOAhqegS7k2ro=;
 b=IM1iC8xiFV25YSMnQJNntvQn6c9+Qf7t4O1UIUse/I7yHPlBK1u4a6pmRHl6kVCg3x2/
 4E2SB4KYwfOYJQzBYvWF8TUrOy+5jUP2gKMkjSWpxmvZWTMb5LkcuA45LkgTXWxJZWwX
 T3Fr9Up1O0pswzPYRCeAokWRMehNUsOXQWWCUe4TRcJnulBAyf7TvtvjXWeY4SxZfWCG
 lqubGPxc+mlU2bqMk9ExctC00T7lKlyNTB8qGiEUKd92E4DY6TwBslk7tXVvb9Bb4HlV
 pm2o5jlmi+tI63KZpcLX6bkcPisecNdpDh00YElvVT7aQZdPIpfJoWvsr+Gv/mEcApaU hg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rw3yv1my1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jul 2023 00:04:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36I04wVc031572
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jul 2023 00:04:58 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 17:04:57 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2 0/8] MDSS reg bus interconnect
Date: Mon, 17 Jul 2023 17:04:45 -0700
Message-ID: <168963837489.9267.8179776097855928911.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2ljxW3q5_TvsiaTbwaFLPD9KX00TnnSc
X-Proofpoint-GUID: 2ljxW3q5_TvsiaTbwaFLPD9KX00TnnSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 spamscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=730
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307170219
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 12 Jul 2023 15:11:37 +0300, Dmitry Baryshkov wrote:
> Per agreement with Konrad, picked up this patch series.
> 
> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
> another path that needs to be handled to ensure MDSS functions properly,
> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
> 
> Gating that path may have a variety of effects. from none to otherwise
> inexplicable DSI timeouts.
> 
> [...]

Applied, thanks!

[2/8] drm/msm/mdss: correct UBWC programming for SM8550
      https://gitlab.freedesktop.org/drm/msm/-/commit/a85c238c5ccd

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
