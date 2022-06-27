Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6155BAD7
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 17:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A838210E171;
	Mon, 27 Jun 2022 15:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC6010E060;
 Mon, 27 Jun 2022 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656344965; x=1687880965;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MazB7iTKSPhXJzSAG36/MGOqvBF1QknHKgi3fk97f0U=;
 b=P0CzaFf4TWpJNEvLL0AKHfNnp4O9/2xR9f0dItTfgFX1fIvWJvqhHYGW
 eoAMkKAuDRpAl+JjCZHdeP9vWXZ4MOaDtKHQWJ7AI0WBB1JZuvc7+A2Pw
 ZQJ39nAi9nFw0EAAhHM/GH/9fA5dNAXLjswjvo4N7G8zckjSEdZ/Nrp76 A=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Jun 2022 08:49:24 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2022 08:49:24 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 27 Jun 2022 08:49:24 -0700
Received: from [10.110.113.167] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 27 Jun
 2022 08:49:22 -0700
Message-ID: <ec673bc4-1c48-b891-5d94-3461618268dd@quicinc.com>
Date: Mon, 27 Jun 2022 08:49:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 2/3] drm/msm/dp: decoupling dp->id out of dp
 controller_id at scxxxx_dp_cfg table
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1656090912-18074-1-git-send-email-quic_khsieh@quicinc.com>
 <66ff4642-f268-f5b0-7e28-b196368c508a@quicinc.com>
 <5cf094cf-343a-82d7-91c4-1284683f9748@quicinc.com>
 <CAA8EJprqq=vxXT2DmEWii_Ajx2UbkHRexPTT58xFcWkBa_D5hA@mail.gmail.com>
 <26263c16-8cbc-ccca-6081-7eba14635d73@quicinc.com>
 <CAA8EJpqEoXXA=eKGHRGuQ3VOHnmEShY8u_SMZ6WFWORCFhFcrw@mail.gmail.com>
 <8445f93a-00f0-64af-5650-07f2bc487742@quicinc.com>
 <CAA8EJpqB2KPyvFehK9WRGgiVnqvD24cz5BcHsw8a5PQ2Vs1oKA@mail.gmail.com>
 <CAA8EJppZdyutyNBG+OFinickQoDxg0i4GwbaNQubo_LSRWNh4w@mail.gmail.com>
 <1a2e7574-8f78-d48e-a189-020ffcd39f60@quicinc.com>
 <CAE-0n52L1fvvpEH56+HD_UXuV61tMvhh8Qjp781bW9tTKRQymw@mail.gmail.com>
 <9b197183-5306-bf19-0195-2dc1bb72c33b@quicinc.com>
 <CAA8EJppnELtjmOp+Yp7rbrrjf9UixBb82Uvfyg9ofcq+EqaOnw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAA8EJppnELtjmOp+Yp7rbrrjf9UixBb82Uvfyg9ofcq+EqaOnw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, dianders@chromium.org,
 airlied@linux.ie, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, agross@kernel.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, Stephen Boyd <swboyd@chromium.org>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/27/2022 8:38 AM, Dmitry Baryshkov wrote:
> On Mon, 27 Jun 2022 at 18:33, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>
>> On 6/24/2022 6:15 PM, Stephen Boyd wrote:
>>> Quoting Kuogee Hsieh (2022-06-24 18:02:50)
>>>> On 6/24/2022 5:46 PM, Dmitry Baryshkov wrote:
>>>>> On Sat, 25 Jun 2022 at 03:28, Dmitry Baryshkov
>>>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>>> On Sat, 25 Jun 2022 at 03:23, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>>>> On 6/24/2022 5:21 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Sat, 25 Jun 2022 at 03:19, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>>>>>>>>> How can I have eDP call dpu_encoder_init() before DP calls with
>>>>>>>>> _dpu_kms_initialize_displayport()?
>>>>>>>> Why do you want to do it? They are two different encoders.
>>>>>>> eDP is primary display which in normal case should be bring up first if
>>>>>>> DP is also presented.
>>>>>> I do not like the concept of primary display. It is the user, who must
>>>>>> decide which display is primary to him. I have seen people using just
>>>>>> external monitors and ignoring built-in eDP completely.from
>>>>>> Also, why does the bring up order matters here? What do you gain by
>>>>>> bringing up eDP before the DP?
>>>>> I should probably rephrase my question to be more clear. How does
>>>>> changing the order of DP vs eDP bringup help you 'to fix screen
>>>>> corruption'.
>>>> it did fix the primary display correction issue if edp go first and i do
>>>> not know the root cause yet.
>>>>
>>>> We are still investigating it.
>>>>
>>>> However I do think currently msm_dp_config sc7280_dp_cfg has issues need
>>>> be addressed.
>>>>
>>> What issues exist with sc7280_dp_cfg? It looks correct to me.
>>
>> If we are going to bring up a new chipset with edp as primary only, i am
>> not sure the below configuration will work?
>>
>>> static const struct msm_dp_config sc7280_dp_cfg = {
>>>           .descs = (const struct msm_dp_desc[]) {
>>>                   [MSM_DP_CONTROLLER_1] = { .io_start = 0x0aea0000, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_en = true },
>>>           },
>>>           .num_descs = 1,
>>> };
> As I wrote in one of the comments, there is an issue with num_descs
> being not obvious (in your example it should be 2, not 1). I thought
> about dropping it and looping until the MSM_DP_CONTROLLER_COUNT, but
> this would result in other kinds of hard-to-catch issues. Let me muse
> about it.

Thanks for consideration.

