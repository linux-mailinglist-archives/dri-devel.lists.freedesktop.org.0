Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D06DFCC6
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 19:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A2310E8D8;
	Wed, 12 Apr 2023 17:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CA610E8D6;
 Wed, 12 Apr 2023 17:33:24 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33CAJKAV013575; Wed, 12 Apr 2023 17:33:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+hQca6aJFCTeUv4DhPPARdu8+ozw1MikI+1sASk8QeM=;
 b=Jo+jogq89Vnp6T7RKZ70yo9RgojTCksqe1uEAjXH/dmMz1YFWE0rIY6gk+8PiEBRNVEB
 VL5CwPBE/da6rqSXsaTXrKvs6KFLf/M8MArwbxrZKxlu9+BfAE7y3B/SaHDx+mRmLtsA
 HwSMM+UjukdM+wvPD/+38gFMRl9LumIvH3RNSJ++V8iDyaLCOAtgYfe0FqljSzw5gLin
 PYVR/6jvSag4/ljq6DaNYlRbteuXLpZddVgdd63JBvEUqXBn64HGMoLqSWmOJmlvW15Z
 qD33GKfk4IoYmFD0bUog79pEr0NX4hC+FpdqHD/CS8PQjoK91Fz/1mMhXxWPMNU1orGx 7A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pwqn1hd6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 17:33:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33CHXHl0014185
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Apr 2023 17:33:17 GMT
Received: from [10.110.115.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 12 Apr
 2023 10:33:16 -0700
Message-ID: <e78e576a-2a04-e7ca-f6c4-701d508541ad@quicinc.com>
Date: Wed, 12 Apr 2023 10:33:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dpu: always program dsc active bits
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <1681247095-1201-1-git-send-email-quic_khsieh@quicinc.com>
 <z7wj2lcgcdxsqh7ylhec3ig6o4p6q37zqvpzoxp4bd4vid2z2n@ubsgt3ebqrwr>
 <83f9a438-52c5-83f3-1767-92d16518d8f0@quicinc.com>
 <feedv4isliterjtwyicqfarwuvzhtov3jkmvjcwqvt7itkyh7y@e2jq5t6r3lxc>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <feedv4isliterjtwyicqfarwuvzhtov3jkmvjcwqvt7itkyh7y@e2jq5t6r3lxc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -r8w261Un6rqEpUZc2hU7W3jdsN8Hsre
X-Proofpoint-ORIG-GUID: -r8w261Un6rqEpUZc2hU7W3jdsN8Hsre
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-12_08,2023-04-12_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=695 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304120150
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 dianders@chromium.org, andersson@kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/12/2023 12:24 AM, Marijn Suijten wrote:
> On 2023-04-11 16:45:34, Abhinav Kumar wrote:
> [..]
>>> Does this flush all DSCs programmed in CTL_DSC_FLUSH as set above?  That
>>> is currently still in `if (cfg->dsc)` and never overwritten if all DSCs
>>> are disabled, should it be taken out of the `if` to make sure no DSCs
>>> are inadvertently flushed, or otherwise cache the "previous mask" to
>>> make sure we flush exactly the right DSC blocks?
>>>
>>
>> Yes, DSC flush is hierarchical. This is the main DSC flush which will
>> enforce the flush of the DSC's we are trying to flush in the
>> CTL_DSC_FLUSH register.
> 
> That's what I was thinking, thanks for confirming.
> 
>> So if DSC was active, the CTL_FLUSH will only enforce the flush of the
>> DSC's programmed in CTL_DSC_FLUSH
>>
>> If DSC is not active, we still need to flush that as well (that was the
>> missing bit).
>>
>> No need to cache previous mask. That programming should be accurate in
>> cfg->dsc already.
> 
> This kind of implicit dependency warrants a comment at the very least.
> 

Sure.

> What happens if a device boots without DSC panel connected?  Will
> CTL_DSC_FLUSH be zero and not (unnecessarily, I assume) flush any of the
> DSC blocks?  Or could this flush uninitialized state to the block?
> 

If we bootup without DSC panel connected, the kernel's cfg->dsc will be 
0 and default register value of CTL_DSC_FLUSH will be 0 so it wont flush 
any DSC blocks. Sure, as I wrote in the other response, we can move this 
to reset_intf_cfg later when the other pieces are fixed. And leave a 
FIXME here.

> - Marijn
