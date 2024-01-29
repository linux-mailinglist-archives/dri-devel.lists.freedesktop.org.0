Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C8A83FDC2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 06:36:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EAB10F802;
	Mon, 29 Jan 2024 05:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38DA10FCD2;
 Mon, 29 Jan 2024 05:36:52 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5CIJc003778; Mon, 29 Jan 2024 05:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=A4+YhRJbxAj8pl4exb8U1Diw6ayXlnWsul8WoEggIOI=; b=f2
 /sYrrp4EVA7QaID3Oc1M4V8QPShrNd66b3sIFLEq3jQH3arK9KclwYpReIM4xms2
 xeQ+6pZOhKejIRc0NjaBQGcj4M8luL/PeNTdjsfMQZXej91iBbOLSHcHo9X31ejt
 ktsqM3grAkBDQFh+vUKGKvYDO8cCvoYEAC1gwmPZfTKqsXI3v1pobiQ6oUH2mLos
 7olOVYbQohxt44SQ4adcw5ZBRihtv8g3jNduuGeW29sb4Zs1tbupiPA/QTo/Bsom
 9Pu/BXghYCj+4+azmMxLEowMnnxFm7ttt+xpQMdbQ3MOps1rzyfnznQZ/FJGI4X6
 YzMDe1DpsggccT/B6hlA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvqhmu27j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 05:36:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T5ahfj023463
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 05:36:43 GMT
Received: from [10.110.98.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 28 Jan
 2024 21:36:42 -0800
Message-ID: <3c87c423-e290-c399-30d3-3b0d94903619@quicinc.com>
Date: Sun, 28 Jan 2024 21:36:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when
 VSC SDP supported
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-18-quic_parellan@quicinc.com>
 <493926f1-90e9-493a-bd2f-ea1db16d7ee6@linaro.org>
 <72ca08ac-ae16-37f6-6f85-f203ddf79084@quicinc.com>
 <CAA8EJppj1xN8E==VGncvW5DKMtLPixynpgAqyZoJzPQXZEEYjg@mail.gmail.com>
 <1666a8c3-f1f0-f050-aa06-cf221bdbcbb9@quicinc.com>
 <CAA8EJprDUBb7yM-16QVa_i6ONRaNYSWRvJKMG=Z2rPhJ0JfwXw@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJprDUBb7yM-16QVa_i6ONRaNYSWRvJKMG=Z2rPhJ0JfwXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: -LgbofhnBlEELVriZVXxfi08VXU09cyN
X-Proofpoint-ORIG-GUID: -LgbofhnBlEELVriZVXxfi08VXU09cyN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290038
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
Cc: neil.armstrong@linaro.org, marijn.suijten@somainline.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 Paloma Arellano <quic_parellan@quicinc.com>, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/28/2024 9:05 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 06:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/28/2024 7:52 PM, Dmitry Baryshkov wrote:
>>> On Mon, 29 Jan 2024 at 05:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
>>>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>>>> All the components of YUV420 over DP are added. Therefore, let's mark the
>>>>>> connector property as true for DP connector when the DP type is not eDP
>>>>>> and when VSC SDP is supported.
>>>>>>
>>>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>>>>>>     1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> index 4329435518351..97edd607400b8 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>>>> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct
>>>>>> dp_display_private *dp)
>>>>>>         dp_link_process_request(dp->link);
>>>>>> -    if (!dp->dp_display.is_edp)
>>>>>> +    if (!dp->dp_display.is_edp) {
>>>>>> +        if (dp_panel_vsc_sdp_supported(dp->panel))
>>>>>> +            dp->dp_display.connector->ycbcr_420_allowed = true;
>>>>>
>>>>> Please consider fixing a TODO in drm_bridge_connector_init().
>>>>>
>>>>
>>>> I am not totally clear if that TODO can ever go for DP/HDMI usage of
>>>> drm_bridge_connector.
>>>>
>>>> We do not know if the sink supports VSC SDP till we read the DPCD and
>>>> till we know that sink supports VSC SDP, there is no reason to mark the
>>>> YUV modes as supported. This is the same logic followed across vendors.
>>>>
>>>> drm_bride_connector_init() happens much earlier than the point where we
>>>> read DPCD. The only thing which can be done is perhaps add some callback
>>>> to update_ycbcr_420_allowed once DPCD is read. But I don't think its
>>>> absolutely necessary to have a callback just for this.
>>>
>>> After checking the drm_connector docs, I'd still hold my opinion and
>>> consider this patch to be a misuse of the property. If you check the
>>> drm_connector::ycbcr_420_allowed docs, you'll see that it describes
>>> the output from the source point of view. In other words, it should be
>>> true if the DP connector can send YUV420 rather than being set if the
>>> attached display supports such output. This matches ycbcr420_allowed
>>> usage by AMD, dw-hdmi, intel_hdmi and even intel_dp usage.
>>>
>>
>> hmmm I think I misread intel_dp_update_420(). I saw this is called after
>> HPD so I thought they unset ycbcr_420_allowed if VSC SDP is not
>> supported. But they have other DPCD checking there so anyway they will
>> fail this bridge_connector_init() model.
>>
>> But one argument which I can give in my defense is, lets say the sink
>> exposed YUV formats but did not support SDP, then atomic_check() will
>> keep failing or should keep failing. This will avoid this scenario. But
>> we can assume that would be a rogue sink.
> 
> This should be handled in DP's atomic_check. As usual, bonus point if
> this is done via helpers that can be reused by other platforms.
> 
>> I think we can pass a yuv_supported flag to msm_dp_modeset_init() and
>> set it to true from dpu_kms if catalog has CDM block and get rid of the
>> dp_panel_vsc_sdp_supported().
> 
> These are two different issues. CDM should be checked in PDU (whether
> the DPU can provide YUV data to the DP block).
> 

Yes, I found this issue while discussing this. We need to make this change.

>>
>> But that doesnt address the TODO you have pointed to. What is really the
>> expectation of the TODO? Do we need to pass a ycbcr_420_allowed flag to
>> drm_bridge_connector_init()?
> 
> Ugh. No. I was thinking about a `ycbcr420_allowed` flag in the struct
> drm_bridge (to follow existing interlace_allowed) flag. But, this
> might be not the best option. Each bridge can either pass through YUV
> data from the previous bridge or generate YCbCr data on its own. So in
> theory this demands two flags plus one flag for the encoder. Which
> might be an overkill, until we end up in a situation when the driver
> can not decide for the full bridge chain.
> 

Yes.

> So let's probably ignore the TODO for the purpose of this series. Just
> fix the usage of ycbcr420_allowed according to docs.
> 

Ack.

>>
>> That would need a tree wide cleanup and thats difficult to sign up for
>> in this series and I would not as well.
>>
>> One thing which I can suggest to be less intrusive is have a new API
>> called drm_bridge_connector_init_with_YUV() which looks something like
>> below:
>>
>> struct drm_connector *drm_bridge_connector_init_with_ycbcr_420(struct
>> drm_device *drm, struct drm_encoder *encoder)
>> {
>>          drm_bridge_connector_init();
>>          connector->ycbcr_420_allowed = true;
>> }
>>
>> But I don't know if the community would be interested in this idea or
>> would find that useful.
>>
>>>>>>             drm_dp_set_subconnector_property(dp->dp_display.connector,
>>>>>>                              connector_status_connected,
>>>>>>                              dp->panel->dpcd,
>>>>>>                              dp->panel->downstream_ports);
>>>>>> +    }
>>>>>>         edid = dp->panel->edid;
>>>>>
>>>
>>>
>>>
> 
> 
> 
