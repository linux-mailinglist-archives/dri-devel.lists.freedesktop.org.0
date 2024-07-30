Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66189942390
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 01:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB02510E195;
	Tue, 30 Jul 2024 23:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="fMRpGrHC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064F510E195;
 Tue, 30 Jul 2024 23:50:10 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGNjuq029474;
 Tue, 30 Jul 2024 23:50:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 qV7QIGHtPL1hsBOzNi7uYRV9NgXMuu+jrx0+CDor++Q=; b=fMRpGrHCp2Nu1TX1
 JTL55Eiiu9JDPbfwP3lclDHrOTezurSPB01FaPbPGlOeDtCZJP7y47USXNiT1Y6m
 6qlp8OWtDKVuypDtmeG3L+SyfLkTVw8+hbNXIA2duA+1UyHjl/N40G2nEQf+Q22L
 1Rlgd1Dq3Q6Zbbkl35tyDfSXuN6uBqBk78dHVxm242FHzE3n/8PMR7CSvhFe203G
 08sISKNTvFMCYkl+tAMAoMANl0ARRW/SR3zQZmn86Y07EatLaT7/cAgh7HxZZO5a
 QK13vlyrcQsV2HnzcUlL6Q8nJzXydNj2PAY8MlRUt6l39A2kHAjQXSaR9aV9F0kP
 Y7+Guw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw442kqy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 23:50:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 46UNo39n011755
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2024 23:50:03 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 16:50:02 -0700
Message-ID: <7466dc92-15e9-40c9-a6ca-40fed44865ac@quicinc.com>
Date: Tue, 30 Jul 2024 16:50:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <quic_bjorande@quicinc.com>
CC: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Abel
 Vesa <abel.vesa@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
 <swboyd@chromium.org>, <dianders@chromium.org>, <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com>
 <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpok+M3xYqtKDM=N=+fc778ipUdYcnNBLLEXMkpNjjy5rQ@mail.gmail.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpok+M3xYqtKDM=N=+fc778ipUdYcnNBLLEXMkpNjjy5rQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: yM_g8dNUskRlrt_AU97ATZQKGAZ7Z5k4
X-Proofpoint-ORIG-GUID: yM_g8dNUskRlrt_AU97ATZQKGAZ7Z5k4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_19,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300165
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



On 7/30/2024 4:34 PM, Dmitry Baryshkov wrote:
> On Wed, 31 Jul 2024 at 01:27, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>>
>> On Tue, Jul 30, 2024 at 11:58:19PM +0300, Dmitry Baryshkov wrote:
>>> Hi Abhinav,
>>>
>>> On Tue, 30 Jul 2024 at 22:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>> Hardware document indicates that widebus is recommended on DP on all
>>>> MDSS chipsets starting version 5.x.x and above.
>>>>
>>>> Follow the guideline and mark widebus support on all relevant
>>>> chipsets for DP.
>>>>
>>>> Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
>>>> Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
>>>
>>> The issues are present in the following commits. Please consider using
>>> them instead:
>>>
>>> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
>>> Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
>>>
>>
>> But are we really fixing any bugs/issues here? While the docs do
>> recommend widebus, we're effectively enabling more harware/features.
>>
>> Unless there's a strong reason (which I'm not confident that the commit
>> message entails), I think we should drop the fixes-tags and just bring
>> this to 6.12...
> 
> I'm fine either way. I'll check tomorrow if this is required to fix
> https://gitlab.freedesktop.org/drm/msm/-/issues/43.
> 

In v1, I also did not have the Fixes tag and I admit, originally even 
though I made the change in an attempt to fix another issue, it was not 
resolving the issue completely so there is no functional issue getting 
fixed due to the change.

I have confirmed that on my setup this patch is not needed to fix that bug.

I decided to add the Fixes tag in v2 because not following the hw doc 
recommendation is also a bug as it can lead to unexplained issues. Thats 
why I am still divided on this.

If the consensus is not to take it as a fix, I am fine with it and will 
not include it and while we are compiling the changes for 6.12 this can 
be included without the Fixes tags.

> 
> 
