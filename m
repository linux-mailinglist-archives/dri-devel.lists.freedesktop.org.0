Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F4886A359
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 00:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CE710E644;
	Tue, 27 Feb 2024 23:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="eBnnIAHi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C461F10E5EF;
 Tue, 27 Feb 2024 23:10:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41RMwjdc028566; Tue, 27 Feb 2024 23:10:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=aAI+TfZHFuSnjozCO/guPxtJJG77SQ7YQVWlsUjwcq4=; b=eB
 nnIAHi1Vblnyd0VWJ/zJWr2tAE6UOja8jGK4BtQNfoDBhiS098L1hlcPD1BBGFGJ
 F7IkPoVfP5x5krzYhSLqcjTYLz6vJ6D0l40wwkBeb1iOjYX+pZYfigRKSyX4l5a1
 vC8ahkl/QtSneK5M1fMxHdRUgrI+EBAk3QZOVQ2yJ0M/VLhJAcExSVGFgrmpG6vp
 HKVywBYF0HH9dNw03nt8opFHoXUtXQOqyPhgVnULHh7ObV69ETEvk24uDrBkUL+W
 hDe/qKPYE5SyQ8hbi4+ATIX2USbFs0a+szhyKTDUk2gWfvYuQPGxkUOzKzZdip2X
 cmRAbvPwDG6FzkKZez6A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3whrqag1rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 23:10:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RNAmQR015384
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Feb 2024 23:10:48 GMT
Received: from [10.71.111.96] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 15:10:47 -0800
Message-ID: <dc9ef0ad-7844-606e-2212-2ff652819ea0@quicinc.com>
Date: Tue, 27 Feb 2024 15:10:47 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, Kuogee Hsieh <quic_khsieh@quicinc.com>, "Sankeerth
 Billakanti" <quic_sbillaka@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 Johan Hovold <johan@kernel.org>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
Content-Language: en-US
From: Paloma Arellano <quic_parellan@quicinc.com>
In-Reply-To: <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: VNQWUcKNnySxVTxSnj7Ts07D3gBHzWQr
X-Proofpoint-ORIG-GUID: VNQWUcKNnySxVTxSnj7Ts07D3gBHzWQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-27_09,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402270177
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


On 2/27/2024 2:11 PM, Abhinav Kumar wrote:
>
>
> On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
>> This reverts commit e467e0bde881 ("drm/msm/dp: use
>> drm_bridge_hpd_notify() to report HPD status changes").
>>
>> The commit changed the way how the MSM DP driver communicates
>> HPD-related events to the userspace. The mentioned commit made some of
>> the HPD events being reported earlier. This way userspace starts poking
>> around. It interacts in a bad way with the dp_bridge_detect and the
>> driver's state machine, ending up either with the very long delays
>> during hotplug detection or even inability of the DP driver to report
>> the display as connected.
>>
>> A proper fix will involve redesigning of the HPD handling in the MSM DP
>> driver. It is underway, but it will be intrusive and can not be thought
>> about as a simple fix for the issue. Thus, revert the offending commit.
>>
>
> Yes, for fixing this on 6.9 I am fine with this.
>
> I hope there were not other changes which were built on top of this. 
> So it will be better if we retest internal HPD case as well with this.
>
> We will do that in a day or two and give Tested-by.
>
>> Fixes: e467e0bde881 ("drm/msm/dp: use drm_bridge_hpd_notify() to 
>> report HPD status changes")
>> Link: https://gitlab.freedesktop.org/drm/msm/-/issues/50
>> Reported-by: Johan Hovold <johan@kernel.org>
>> Link: https://lore.kernel.org/r/Zd3YPGmrprxv-N-O@hovoldconsulting.com/
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>>   1 file changed, 18 insertions(+), 2 deletions(-)
>>
>
> For the change itself,
>
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>


Tested-by: Paloma Arellano <quic_parellan@quicinc.com>

