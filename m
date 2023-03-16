Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C606BC3C7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 03:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0347210EA4D;
	Thu, 16 Mar 2023 02:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9600C10E0E4;
 Thu, 16 Mar 2023 02:28:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32G23Xip001845; Thu, 16 Mar 2023 02:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=KqirVUV+ADW7V8pbioihgIWgT8y7WP1ARFLsb6y+IMY=;
 b=cvStMLj4+jM6sJ/cBrwQAJwkcWNSOXYHqTTHB8J8yiB9Gk9NFyoy8FE+jHu08lf5uGIP
 WfQzSdBOzNvzZD2E7NKTaPBXbdl7poe8rhkhHWwUqkf9g7iICnLD0tssDjP3hPCIfO1k
 c9pRFFQ9BRoNIPSvWnIzpt5pmJ36xBW0Bg70ymgdlNujVNtrs+cFm/m4S+Hmr/9xCxLz
 NQymSEtZCzCCqLJ3mYg/LUhWrmwsbotKNLETed9TQhpUOSyntG18E/wAJzYInPQb1AMe
 h+OTqfZlBFgt+92Gi4x/YTktuBzdZMpD1tYtuzY/nXc5vpjYCGs+UeNzGiMBF/PUtvOv dA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pbpxsgeet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 02:28:51 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32G2SoNC010665
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Mar 2023 02:28:50 GMT
Received: from abhinavk-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 19:28:50 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: (subset) [PATCH v2 00/50] drm/msm/dpu: rework HW catalog
Date: Wed, 15 Mar 2023 19:28:38 -0700
Message-ID: <167893340873.3688.7944874266841520279.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: p_7KTZKZfcqk7lt6qdsc5LoAoDWcvmei
X-Proofpoint-ORIG-GUID: p_7KTZKZfcqk7lt6qdsc5LoAoDWcvmei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-16_01,2023-03-15_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxscore=0 mlxlogscore=511 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303160020
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 12 Feb 2023 01:12:09 +0200, Dmitry Baryshkov wrote:
> This huge series attempts to restructure the DPU HW catalog into a
> manageable and reviewable data set. In order to ease review and testing
> I merged all the necessary fixes into this series. Also I cherry-picked
> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
> 
> First 12 patches are catalog fixes, which can be probably picked into
> the msm-fixes.
> 
> [...]

Applied, thanks!

[03/50] drm/msm/dpu: fix typo in in sm8550's dma_sblk_5
        https://gitlab.freedesktop.org/drm/msm/-/commit/e301195507fe
[04/50] drm/msm/dpu: fix len of sc7180 ctl blocks
        https://gitlab.freedesktop.org/drm/msm/-/commit/ce6bd00abc22
[05/50] drm/msm/dpu: fix sm6115 and qcm2290 mixer width limits
        https://gitlab.freedesktop.org/drm/msm/-/commit/da06be8b4fdf
[06/50] drm/msm/dpu: correct sm8550 scaler
        https://gitlab.freedesktop.org/drm/msm/-/commit/d113d267c3bf
[07/50] drm/msm/dpu: correct sc8280xp scaler
        https://gitlab.freedesktop.org/drm/msm/-/commit/b3587cb64532
[08/50] drm/msm/dpu: correct sm8450 scaler
        https://gitlab.freedesktop.org/drm/msm/-/commit/c7da17b67847
[09/50] drm/msm/dpu: correct sm8250 and sm8350 scaler
        https://gitlab.freedesktop.org/drm/msm/-/commit/03c0c3cb22a4
[10/50] drm/msm/dpu: correct sm6115 scaler
        https://gitlab.freedesktop.org/drm/msm/-/commit/38164e990a42
[11/50] drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
        https://gitlab.freedesktop.org/drm/msm/-/commit/a5045b00a681
[12/50] drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
        https://gitlab.freedesktop.org/drm/msm/-/commit/0abb6a24aabc
[13/50] drm/msm/dpu: don't use DPU_CLK_CTRL_CURSORn for DMA SSPP clocks
        https://gitlab.freedesktop.org/drm/msm/-/commit/d6181c18d55c

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>
