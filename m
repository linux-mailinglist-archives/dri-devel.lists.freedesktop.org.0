Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE79A607BC2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7FE10E371;
	Fri, 21 Oct 2022 16:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD810E309;
 Fri, 21 Oct 2022 16:06:18 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29L8rYue008650;
 Fri, 21 Oct 2022 16:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=R8emWiLBFPkOphvZD7XQZDyKcPgVRPFkVJwpvC3ik0w=;
 b=Mb3McpJsM0kCnDdicPBol6ZL9QyCqdi9UeLUL660+CvUku0N6M+Lp/P/d+QBavd2fkJd
 UgQhPpEvqqfZbWUpPhZXJ/qVcpt7fhvemmm+xpw0mJAsoQlvKgtZrsTqsyjEWQt6o13U
 IHBM8f0RkDf1uSPLhawilz1jK4nNHj+6iowJrDla+BO7Y3+v5kT2zCgHzzsoj8AFhGVl
 KUlcDDZOi8YxNa3zP28F9Zug5qtD7CeZLZ8Hn2yk5mP6Tx+7aGpsu603PNvEMon72BIi
 gVGYhGGbcvyePpyWuul01AojORpZLwhkzzWVWqNfnRopfUCJAoc+LlgliJ1ZqEpVRYG1 lg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kbnqt29b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 16:06:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29LG60J1019984
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Oct 2022 16:06:00 GMT
Received: from [10.111.175.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 09:05:56 -0700
Message-ID: <139426b9-0e5b-e4c3-27c6-584ab48517c2@quicinc.com>
Date: Fri, 21 Oct 2022 09:05:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 00/10] drm/msm: probe deferral fixes
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <YymCll02tRIMb+9Z@hovoldconsulting.com>
 <Y1I77HYeOkx1fz1E@hovoldconsulting.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <Y1I77HYeOkx1fz1E@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Gls1jzuKGH2PD6_I00PqYRbhQlT3-yDP
X-Proofpoint-ORIG-GUID: Gls1jzuKGH2PD6_I00PqYRbhQlT3-yDP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-21_04,2022-10-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210210096
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Manivannan
 Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Sean Paul <sean@poorly.run>,
 Steev Klimaszewski <steev@kali.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Johan

On 10/20/2022 11:27 PM, Johan Hovold wrote:
> On Tue, Sep 20, 2022 at 11:06:30AM +0200, Johan Hovold wrote:
>> On Tue, Sep 13, 2022 at 10:53:10AM +0200, Johan Hovold wrote:
>>> The MSM DRM driver is currently broken in multiple ways with respect to
>>> probe deferral. Not only does the driver currently fail to probe again
>>> after a late deferral, but due to a related use-after-free bug this also
>>> triggers NULL-pointer dereferences.
>>>
>>> These bugs are not new but have become critical with the release of
>>> 5.19 where probe is deferred in case the aux-bus EP panel driver has not
>>> yet been loaded.
>>>
>>> The underlying problem is lifetime issues due to careless use of
>>> device-managed resources.
>>
>> Any chance of getting this merged for 6.1?
> 
> Is anyone picking these up as fixes for 6.1-rc as we discussed?
> 
> Johan

All of these except the last two ( as discussed ) have landed in the 
-fixes tree

https://gitlab.freedesktop.org/drm/msm/-/commit/6808abdb33bf90330e70a687d29f038507e06ebb

Thanks

Abhinav

>   
>>> Changes in v2
>>>   - use a custom devres action instead of amending the AUX bus interface
>>>     (Doug)
>>>   - split sanity check fixes and cleanups per bridge type (Dmitry)
>>>   - add another Fixes tag for the missing bridge counter reset (Dmitry)
>>>
>>>
>>> Johan Hovold (10):
>>>    drm/msm: fix use-after-free on probe deferral
>>>    drm/msm/dp: fix memory corruption with too many bridges
>>>    drm/msm/dsi: fix memory corruption with too many bridges
>>>    drm/msm/hdmi: fix memory corruption with too many bridges
>>>    drm/msm/dp: fix IRQ lifetime
>>>    drm/msm/dp: fix aux-bus EP lifetime
>>>    drm/msm/dp: fix bridge lifetime
>>>    drm/msm/hdmi: fix IRQ lifetime
>>>    drm/msm/dp: drop modeset sanity checks
>>>    drm/msm/dsi: drop modeset sanity checks
>>>
>>>   drivers/gpu/drm/msm/dp/dp_display.c | 26 +++++++++++++++++++-------
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  |  6 +++---
>>>   drivers/gpu/drm/msm/dp/dp_parser.h  |  5 +++--
>>>   drivers/gpu/drm/msm/dsi/dsi.c       |  9 +++++----
>>>   drivers/gpu/drm/msm/hdmi/hdmi.c     |  7 ++++++-
>>>   drivers/gpu/drm/msm/msm_drv.c       |  1 +
>>>   6 files changed, 37 insertions(+), 17 deletions(-)
