Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3672B6FE8D3
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 02:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1F810E586;
	Thu, 11 May 2023 00:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 282C410E585;
 Thu, 11 May 2023 00:39:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34B0bpZY004805; Thu, 11 May 2023 00:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=JBd4dCnoaYdWnyAXKLFTXNcGOtZv+qeTRUG1UGI5EVc=;
 b=LyYrCeUIqq3LbuTQhH4NG4AxmdJ5HTIRtfKtcE6BIXOSPz2qIBhRNykJUXOo9ZDv4U+i
 oJWJgTE5qpohmKLuffKMOqmDmIyfbPmbLhS5pDR70So4Ra3j7/3QhioXPZKCzeo3/hoK
 SXa/ZJvDb54rcZczpmk6eW4leuNnJ2hLlwyJHdpRMzkB9kPmv+rvhylMZ5OD4g0vEEQK
 A9C/gD2ejVuK8jjJp37OyhD9160KRyHCfp1y50yGKwVUgFqYV7Zk2fFsqDIEmUfmxIH5
 2olaGJas7wkKcBJymMEziJd5O1Z9aR7bTuK5bFLqoVon7Liueisc9hZk3DI9QdyWDLRA Xw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgm5m057h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 00:39:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34B0d9hT011241
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 May 2023 00:39:09 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Wed, 10 May
 2023 17:39:08 -0700
Message-ID: <6830a829-5b8a-a05a-da6a-5aaaeef23e57@quicinc.com>
Date: Wed, 10 May 2023 17:39:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/2] drm/msm/dp: enable HDP plugin/unplugged interrupts
 to hpd_enable/disable
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, <agross@kernel.org>,
 <airlied@gmail.com>, <andersson@kernel.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
 <sean@poorly.run>, <vkoul@kernel.org>
References: <1683750665-8764-1-git-send-email-quic_khsieh@quicinc.com>
 <1683750665-8764-2-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53ywhgFhJXA9krBo-Ds6ezM0K8n6w0xnVZj+sTJ4qt9cA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAE-0n53ywhgFhJXA9krBo-Ds6ezM0K8n6w0xnVZj+sTJ4qt9cA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Tp2N6F0bTE9PWQAciXo6TT6gdBjaEZrj
X-Proofpoint-ORIG-GUID: Tp2N6F0bTE9PWQAciXo6TT6gdBjaEZrj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-10_04,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110004
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/10/2023 4:55 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2023-05-10 13:31:04)
>> The internal_hpd flag was introduced to handle external DP HPD derived from GPIO
>> pinmuxed into DP controller.
> 
> Was it? It looks more like it was done to differentiate between eDP and
> DP, because internal_hpd is set only if DRM_BRIDGE_OP_HPD is set on the
> bridge and we only set the bridge op if the connector type is DP. The
> assumption looks like if you have DP connector_type, you have the gpio
> pinmuxed for "dp_hot" mode, which isn't exactly true. We don't treat
> that gpio as an irq either, because it isn't. Instead the gpio is muxed
> to the mdss inside the SoC and then that generates an mdss interrupt
> that's combined with non-HPD things like "video ready".
> 
> If that all follows, then I don't quite understand why we're setting
> internal_hpd to false at all at runtime. It should be set to true at
> some point, but ideally that point is during probe.
> 

Kuogee had the same thought originally but were not entirely sure of 
this part of the commit message in Bjorn's original commit which 
introduced these changes.

"This difference is not appropriately represented by the "is_edp"
boolean, but is properly represented by the frameworks invocation of the
hpd_enable() and hpd_disable() callbacks. Switch the current condition
to rely on these callbacks instead"

Does this along with below documentation mean we should generate the hpd 
interrupts only after hpd_enable callback happens?

" * Call &drm_bridge_funcs.hpd_enable if implemented and register the 
given @cb
  * and @data as hot plug notification callback. From now on the @cb will be
  * called with @data when an output status change is detected by the 
bridge,
  * until hot plug notification gets disabled with drm_bridge_hpd_disable().
"

Bjorn, can you please clarify this?

>> HPD plug/unplug interrupts cannot be enabled until
>> internal_hpd flag is set to true.
>> At both bootup and resume time, the DP driver will enable external DP
>> plugin interrupts and handle plugin interrupt accordingly. Unfortunately
>> dp_bridge_hpd_enable() bridge ops function was called to set internal_hpd
>> flag to true later than where DP driver expected during bootup time.
>>
>> This causes external DP plugin event to not get detected and display stays blank.
>> Move enabling HDP plugin/unplugged interrupts to dp_bridge_hpd_enable()/disable() to
>> set internal_hpd to true along with enabling HPD plugin/unplugged interrupts
>> simultaneously to avoid timing issue during bootup and resume.
>>
>> Fixes: cd198caddea7 ("drm/msm/dp: Rely on hpd_enable/disable callbacks")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 27 ++++++++++++++-------------
>>   1 file changed, 14 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 3e13acdf..71aa944 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1801,15 +1788,29 @@ void dp_bridge_hpd_enable(struct drm_bridge *bridge)
>>   {
>>          struct msm_dp_bridge *dp_bridge = to_dp_bridge(bridge);
>>          struct msm_dp *dp_display = dp_bridge->dp_display;
>> +       struct dp_display_private *dp;
>> +
>> +       dp = container_of(dp_display, struct dp_display_private, dp_display);
>>
>>          dp_display->internal_hpd = true;
> 
> Can we set internal_hpd to true during probe when we see that the hpd
> pinmux exists? Or do any of these bits toggle in the irq status register
> when the gpio isn't muxed to "dp_hot" or the controller is for eDP and
> it doesn't have any gpio connection internally? I'm wondering if we can
> get by with simply enabling the "dp_hot" pin interrupts
> (plug/unplug/replug/irq_hpd) unconditionally and not worrying about them
> if eDP is there (because the pin doesn't exist inside the SoC), or if DP
> HPD is being signalled out of band through type-c framework.
