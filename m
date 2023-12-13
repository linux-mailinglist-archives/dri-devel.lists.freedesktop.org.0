Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1285C812071
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0886110E84D;
	Wed, 13 Dec 2023 21:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9A710E86B;
 Wed, 13 Dec 2023 21:09:47 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDKBCFl031276; Wed, 13 Dec 2023 21:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=/rhwcmQIGpxuH2PpJGNfHmKy/ei9tHCfHa5jtDp4gRM=; b=aZ
 2cwV47AAcH/yJZq1JZ/GPjikV1MtRasWkPD9dZzl09nVoatHrQLfY5nccXKrIrg/
 ufYxLH9HDMGwd8e4RTCOuYNtGKq3ctHb7qaW7C9Z5SeUxcA+OAH3ecyWPaHJ5aAU
 VVT+xyxChlmdMpM6JVdtFn+b9gs4oaH5zMNteQP4h7v9YpdWgT9JCmq5EwNHUBHT
 qH5CV0K55Z6whJ6VuFMpozQEC4v7+rnfErklP2sCbinqApVFzhDZa39E9AppjF6C
 Vzp+jIkrNof/u1bxCaa0nLbOCCZ0N96qivRbZJbuEfHdln41q1rCgFRdG1IqHj0f
 K04tlERBskoWOf95+JnQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy5x4t6m8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:09:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDL9eQ1025969
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:09:40 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:09:39 -0800
Message-ID: <d0102871-648f-f8fc-c27d-ccaf58a033c5@quicinc.com>
Date: Wed, 13 Dec 2023 13:09:38 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFT PATCH v2 0/4] drm/msm/dpu: enable writeback on the other
 platforms
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231203003203.1293087-1-dmitry.baryshkov@linaro.org>
 <06daf3a5-f069-1209-8029-79c766e034e4@quicinc.com>
 <CAA8EJpqYAmbX6=wKYJ34=FxewCaqp9Lb8kqqCumL1i_wSZdvfw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpqYAmbX6=wKYJ34=FxewCaqp9Lb8kqqCumL1i_wSZdvfw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: jMq25-1dqtyZLqMEPXOJnmHgt86OvoZW
X-Proofpoint-ORIG-GUID: jMq25-1dqtyZLqMEPXOJnmHgt86OvoZW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130150
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/11/2023 10:23 PM, Dmitry Baryshkov wrote:
> On Tue, 12 Dec 2023 at 02:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 12/2/2023 4:31 PM, Dmitry Baryshkov wrote:
>>> I was not able to test it on my own, this is a call for testing for the
>>> owners of these platforms. The git version of modetest now fully
>>> supports writeback.
>>>
>>> Use libdrm >= 2.4.117, run modetest -ac to determine the writeback
>>> connector, cat /sys/kernel/debug/dri/0/state to determine
>>> spare CRTC and plane, then run something like:
>>>
>>> modetest -M msm -a -s 36@85:1024x768 -o test.d -P 79@85:1024x768
>>>
>>> where 36 is the Writeback connector id, 85 is CRTC and 79 is the plane.
>>>
>>> Then press Enter and check the test.d file for the raw image dump.
>>>
>>> Changes since v1:
>>> - Fixed the DPU_CLK_CTRL_WB2 definition
>>>
>>
>> I think this series needs to be re-based as WB_SDM845_MASK is no longer
>> present in msm-next and 3/4 patches in this series use that.
> 
> Quite the contrary: the WB_SDM845_MASK was added in
> https://patchwork.freedesktop.org/patch/570189/?series=127245&rev=1,
> which is now merged to msm-next-lumag
> 

Ah okay, I was comparing against msm-next. Let me complete rest of the 
review checking the other branch.

>>
>>> Dmitry Baryshkov (4):
>>>     drm/msm/dpu: enable writeback on SM8150
>>>     drm/msm/dpu: enable writeback on SC8108X
>>>     drm/msm/dpu: enable writeback on SM6125
>>>     drm/msm/dpu: enable writeback on SM6350
>>>
>>>    .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 18 ++++++++++++++++++
>>>    .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    | 18 ++++++++++++++++++
>>>    .../drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h | 18 ++++++++++++++++++
>>>    .../drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h | 18 ++++++++++++++++++
>>>    4 files changed, 72 insertions(+)
>>>
> 
> 
> 
