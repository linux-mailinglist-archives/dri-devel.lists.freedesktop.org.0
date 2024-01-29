Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CADD83FD39
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 05:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32C2D10F5D9;
	Mon, 29 Jan 2024 04:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630FE10F5D9;
 Mon, 29 Jan 2024 04:31:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T4S30G023819; Mon, 29 Jan 2024 04:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=3PYONMN3QgSPifLpfDtz8eOz9jf9GeMM+f8QxIpY+V8=; b=RX
 u0W4+U6JZCFdKF058zADze/JLsYaY6yZybRmHRzluWPF/T1BpQdHj0/ItNo8oynQ
 zy2eNCjTllvOyo93N/ZHlcGgwtEUC+fyGqZq97+en4xA7U7BFCbbku8OR6EoGXf2
 EYd2zVRlxF2vgltKwg+qKbH3ZhdoAc7rPP9PTA4L6LqMgZq2//7rvsmbpL5feLaZ
 rTfIuQvbmznhHpPhR2SeA3699c/+TN0r556CMHL5snvfqtNR7EWqBPOFNqrdIB63
 6tNBb1m/B78/M9c0Ieqze8lxMQ8uuQzIBoj9cciBRl/tcW+kXe81lHgZuhncwUBQ
 tFx19GFJ7QH2h7ci1e/A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvt272rer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 04:30:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40T4UsBd002589
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Jan 2024 04:30:54 GMT
Received: from [10.110.98.98] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 28 Jan
 2024 20:30:53 -0800
Message-ID: <1666a8c3-f1f0-f050-aa06-cf221bdbcbb9@quicinc.com>
Date: Sun, 28 Jan 2024 20:30:52 -0800
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
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJppj1xN8E==VGncvW5DKMtLPixynpgAqyZoJzPQXZEEYjg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: KfMQA9-gKfIOt7H8Hg7v6TkUqF15zilz
X-Proofpoint-ORIG-GUID: KfMQA9-gKfIOt7H8Hg7v6TkUqF15zilz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_02,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 mlxscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290029
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



On 1/28/2024 7:52 PM, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 05:17, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>>
>>
>> On 1/25/2024 2:05 PM, Dmitry Baryshkov wrote:
>>> On 25/01/2024 21:38, Paloma Arellano wrote:
>>>> All the components of YUV420 over DP are added. Therefore, let's mark the
>>>> connector property as true for DP connector when the DP type is not eDP
>>>> and when VSC SDP is supported.
>>>>
>>>> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> index 4329435518351..97edd607400b8 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>>>> @@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct
>>>> dp_display_private *dp)
>>>>        dp_link_process_request(dp->link);
>>>> -    if (!dp->dp_display.is_edp)
>>>> +    if (!dp->dp_display.is_edp) {
>>>> +        if (dp_panel_vsc_sdp_supported(dp->panel))
>>>> +            dp->dp_display.connector->ycbcr_420_allowed = true;
>>>
>>> Please consider fixing a TODO in drm_bridge_connector_init().
>>>
>>
>> I am not totally clear if that TODO can ever go for DP/HDMI usage of
>> drm_bridge_connector.
>>
>> We do not know if the sink supports VSC SDP till we read the DPCD and
>> till we know that sink supports VSC SDP, there is no reason to mark the
>> YUV modes as supported. This is the same logic followed across vendors.
>>
>> drm_bride_connector_init() happens much earlier than the point where we
>> read DPCD. The only thing which can be done is perhaps add some callback
>> to update_ycbcr_420_allowed once DPCD is read. But I don't think its
>> absolutely necessary to have a callback just for this.
> 
> After checking the drm_connector docs, I'd still hold my opinion and
> consider this patch to be a misuse of the property. If you check the
> drm_connector::ycbcr_420_allowed docs, you'll see that it describes
> the output from the source point of view. In other words, it should be
> true if the DP connector can send YUV420 rather than being set if the
> attached display supports such output. This matches ycbcr420_allowed
> usage by AMD, dw-hdmi, intel_hdmi and even intel_dp usage.
> 

hmmm I think I misread intel_dp_update_420(). I saw this is called after 
HPD so I thought they unset ycbcr_420_allowed if VSC SDP is not 
supported. But they have other DPCD checking there so anyway they will 
fail this bridge_connector_init() model.

But one argument which I can give in my defense is, lets say the sink 
exposed YUV formats but did not support SDP, then atomic_check() will 
keep failing or should keep failing. This will avoid this scenario. But 
we can assume that would be a rogue sink.

I think we can pass a yuv_supported flag to msm_dp_modeset_init() and 
set it to true from dpu_kms if catalog has CDM block and get rid of the 
dp_panel_vsc_sdp_supported().

But that doesnt address the TODO you have pointed to. What is really the 
expectation of the TODO? Do we need to pass a ycbcr_420_allowed flag to
drm_bridge_connector_init()?

That would need a tree wide cleanup and thats difficult to sign up for 
in this series and I would not as well.

One thing which I can suggest to be less intrusive is have a new API 
called drm_bridge_connector_init_with_YUV() which looks something like 
below:

struct drm_connector *drm_bridge_connector_init_with_ycbcr_420(struct 
drm_device *drm, struct drm_encoder *encoder)
{
	drm_bridge_connector_init();
	connector->ycbcr_420_allowed = true;
}

But I don't know if the community would be interested in this idea or 
would find that useful.

>>>>            drm_dp_set_subconnector_property(dp->dp_display.connector,
>>>>                             connector_status_connected,
>>>>                             dp->panel->dpcd,
>>>>                             dp->panel->downstream_ports);
>>>> +    }
>>>>        edid = dp->panel->edid;
>>>
> 
> 
> 
