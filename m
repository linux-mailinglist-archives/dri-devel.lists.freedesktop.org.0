Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD9686B6D8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 19:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6E210E2BD;
	Wed, 28 Feb 2024 18:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="BZS7GZ2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8467210E2BD;
 Wed, 28 Feb 2024 18:10:20 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41SEFod5003277; Wed, 28 Feb 2024 18:10:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=qPht8/tXsd9pnMzeoe5ooQy9HyfQW3MHlLXpElIdJSA=; b=BZ
 S7GZ2lDbsuEOm+pHnbuOlhtofsnkl0tZiGhFUdSL/IlfQo91yZnXzCC2TlzcuKdZ
 dp0H9dpb1PajkHU4GsIXcfPx7k8szKlNW0ZbG4R1kjDxX/SmP42cyEv219OblDqZ
 qswmSJ0GyX11WLAIqSBa4SGwHxnf+vKwgc/nnDGP+2J0E1PMW+AbB6EV5JIeCCs8
 jdUq2Zb4TPIeGCnDgKJIJCb21suE59jW3y4siyRL4v6t9QMo+8uzmtFb1t1+gf7w
 LNPaPVRexyaFXfQLche+3L4gw3R7g0nuvqcLgYk+/rz5HFvmqzyxake3qeuLivgj
 shYo5Slxq9XbPEXYMwXQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wj6en8p9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 18:10:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41SIACIc022746
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Feb 2024 18:10:12 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 28 Feb
 2024 10:10:11 -0800
Message-ID: <a8b68a42-f41d-5ce1-0d14-7fc158dff673@quicinc.com>
Date: Wed, 28 Feb 2024 10:10:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "drm/msm/dp: use drm_bridge_hpd_notify() to report
 HPD status changes"
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
References: <20240227220808.50146-1-dmitry.baryshkov@linaro.org>
 <46fa8e0a-0af2-2a44-f5f9-70fd49649aa4@quicinc.com>
 <Zd8B6T6ROHFCqEyB@hovoldconsulting.com>
 <CAA8EJppvansib9NxqPcuuAVe+qc1i8HmDqNh6+kaDZn6zFijpw@mail.gmail.com>
 <Zd81BWaj5zJeDA2Q@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Zd81BWaj5zJeDA2Q@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 58XRTJ-g30Sp1Ho5Q0g6FyxtVw-JferJ
X-Proofpoint-ORIG-GUID: 58XRTJ-g30Sp1Ho5Q0g6FyxtVw-JferJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402280143
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



On 2/28/2024 5:28 AM, Johan Hovold wrote:
> On Wed, Feb 28, 2024 at 01:08:04PM +0200, Dmitry Baryshkov wrote:
>> On Wed, 28 Feb 2024 at 11:50, Johan Hovold <johan@kernel.org> wrote:
>>>
>>> On Tue, Feb 27, 2024 at 02:11:56PM -0800, Abhinav Kumar wrote:
>>>> On 2/27/2024 2:08 PM, Dmitry Baryshkov wrote:
>>>>> This reverts commit e467e0bde881 ("drm/msm/dp: use
>>>>> drm_bridge_hpd_notify() to report HPD status changes").
>>>>>
>>>>> The commit changed the way how the MSM DP driver communicates
>>>>> HPD-related events to the userspace. The mentioned commit made some of
>>>>> the HPD events being reported earlier. This way userspace starts poking
>>>>> around. It interacts in a bad way with the dp_bridge_detect and the
>>>>> driver's state machine, ending up either with the very long delays
>>>>> during hotplug detection or even inability of the DP driver to report
>>>>> the display as connected.
>>>>>
>>>>> A proper fix will involve redesigning of the HPD handling in the MSM DP
>>>>> driver. It is underway, but it will be intrusive and can not be thought
>>>>> about as a simple fix for the issue. Thus, revert the offending commit.
>>>>
>>>> Yes, for fixing this on 6.9 I am fine with this.
>>>
>>> Since this is a regression in 6.8-rc1, I hope you meant to say 6.8 here?
>>
>> In the worst case it will land to 6.8.x via the stable tree process.
> 
> This is a fix for a user-visible regression that was reported formally
> two weeks ago and informally (e.g. to you) soon after rc1 came out, and
> which now also has an identified cause and an analysis of the problem.
> And we're at rc6 so there should be no reason to delay fixing this (e.g.
> even if you want to run some more tests for a couple of days).
> 

Yup, we landed it in msm-fixes now, so this will go as a late -fixes PR 
for 6.8.


> Johan
