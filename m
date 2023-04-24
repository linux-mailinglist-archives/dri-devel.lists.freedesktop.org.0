Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2696ED906
	for <lists+dri-devel@lfdr.de>; Tue, 25 Apr 2023 01:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0697610E218;
	Mon, 24 Apr 2023 23:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A7510E218;
 Mon, 24 Apr 2023 23:55:21 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33ONfACC015914; Mon, 24 Apr 2023 23:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zqZGaOSjUAQJTHScwH8oD4cPGHMaNmoxs19FkizSuf8=;
 b=od/LeIv4wSu+NqjOpDcyQ6q/TidXeJS9GSq9j1LH9lj+akiPhd47yomItb+QN0kQylgk
 5LsOiMhtHmdVs0kic9oUeurJW49GToVwTw2+HHQgtfzn8LdAV2RK/18JWZRpKbKee4zp
 hyhqMSIBMDGkO9nIvH0KTo8RgmcvqL+6c9M1plq+ayFSrMXZlxlke9HM7baezEAs7JOx
 Yr+9j/25SfeElptLVg5+ir6QjnsGJYKkgUnJ0xOA4F8f6Z43BHwq93F69kiR/3m0nzEy
 jhNTLSNMizW5P9J1makTt8Ol07n6z4UJYOpdMWFbmztsJlcf1lj5ym/eh4g29uWLroIK QA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q5r0usn6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 23:54:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33ONsHIF008341
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 23:54:17 GMT
Received: from [10.110.104.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Mon, 24 Apr
 2023 16:54:16 -0700
Message-ID: <5277878a-75d9-27bd-35d6-6cc2ac4aaeeb@quicinc.com>
Date: Mon, 24 Apr 2023 16:54:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 05/17] drm/msm/dpu: Remove duplicate register defines
 from INTF
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Sean Paul" <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Adam Skladowski <a39.skl@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>,
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Rajesh Yadav <ryadav@codeaurora.org>, Jeykumar Sankaran
 <jsanka@codeaurora.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 "Chandan Uddaraju" <chandanu@codeaurora.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
 <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230411-dpu-intf-te-v2-5-ef76c877eb97@somainline.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fPnBC5k4rAYdUxGNjaWHDjNyGroHLFjf
X-Proofpoint-ORIG-GUID: fPnBC5k4rAYdUxGNjaWHDjNyGroHLFjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxlogscore=636 phishscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240217
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
Cc: Archit Taneja <architt@codeaurora.org>, Jami
 Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/17/2023 1:21 PM, Marijn Suijten wrote:
> The INTF_FRAME_LINE_COUNT_EN, INTF_FRAME_COUNT and INTF_LINE_COUNT
> registers are already defined higher up, in the right place when sorted
> numerically.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
