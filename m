Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1FF486832
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 18:13:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364010E7CB;
	Thu,  6 Jan 2022 17:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2EA10E5DE;
 Thu,  6 Jan 2022 17:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1641489229; x=1673025229;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SWAmITqjsYu6xDYGpHA7fp1gPjfRndTao20EuIkpURA=;
 b=b4DcgF09pxOiQ47i15i1++G8DSC6zWEJiIB0bPsKOc/LOfOsZyTxEzr6
 I5yDk4AQOc3IQ4oi4xNHDBQVUXeswmszmj2uML7xA4p7/lCI3vPDZC75c
 5HNWF4KzoSebFxACo6KncniTU2Lhk7MiJJO8Nf+QO05zetBghJyZkT6JR c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
 by alexa-out.qualcomm.com with ESMTP; 06 Jan 2022 09:13:48 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 09:13:48 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 6 Jan 2022 09:13:47 -0800
Received: from [10.110.24.66] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 6 Jan 2022
 09:13:46 -0800
Message-ID: <63bae3ec-2bbf-f4f7-b54a-73a921f8f438@quicinc.com>
Date: Thu, 6 Jan 2022 09:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] drm/msm/dp: populate connector of struct dp_panel
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dmitry.baryshkov@linaro.org>, <robdclark@gmail.com>, <sean@poorly.run>,
 <vkoul@kernel.org>
References: <1640805422-21904-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n50Bi2v3D1B8Ee1ckdUWLhpyNrCEVqikbuS8wMfT0+2VnA@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n50Bi2v3D1B8Ee1ckdUWLhpyNrCEVqikbuS8wMfT0+2VnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 1/5/2022 1:34 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-12-29 11:17:02)
>> There is kernel crashed due to unable to handle kernel NULL
>> pointer dereference of dp_panel->connector while running DP link
>> layer compliance test case 4.2.2.6 (EDID Corruption Detection).
> Can you explain how we get into that situation? Like
>
> "We never assign struct dp_panel::connector, instead the connector is
> stored in struct msm_dp::connector. When we run compliance testing test
> case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid edid set
> in struct dp_panel::edid so we'll try to use the connectors
> real_edid_checksum and hit a NULL pointer deref error because the
> connector pointer is never assigned."
>
>> This patch fixes this problem by populating connector of dp_panel.
>>
>> [drm:dp_panel_read_sink_caps] *ERROR* panel edid read failed
>> Unable to handle kernel NULL pointer dereference at virtual address 00000000000006e1
>> Mem abort info:
>>    ESR = 0x96000006
>>    EC = 0x25: DABT (current EL), IL = 32 bits
>>    SET = 0, FnV = 0
>>    EA = 0, S1PTW = 0
>> Data abort info:
>>    ISV = 0, ISS = 0x00000006
>>    CM = 0, WnR = 0
>> user pgtable: 4k pages, 39-bit VAs, pgdp=0000000115f25000
>> [00000000000006e1] pgd=00000001174fe003, p4d=00000001174fe003, pud=00000001174fe003, pmd=0000000000000000
>> Internal error: Oops: 96000006 [#1] PREEMPT SMP
> This sort of stuff isn't really useful because it takes quite a few
> lines to say "We hit a NULL pointer deref" which was already stated. I'd
> rather have a clear description of what goes wrong and how setting the
> pointer in msm_dp_modeset_init() fixes it.
>
>> {...]
>>
>> Changes in V2:
>> -- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()
>>
>> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
>> Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 25 +++++++++++++++----------
>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 3449d3f..c282bbf 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1495,36 +1495,41 @@ void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor)
>>          }
>>   }
>>
>> -int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>> +int msm_dp_modeset_init(struct msm_dp *dp, struct drm_device *dev,
>>                          struct drm_encoder *encoder)
>>   {
>>          struct msm_drm_private *priv;
>> +       struct dp_display_private *dp_display;
>>          int ret;
>>
>> -       if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
>> +       if (WARN_ON(!encoder) || WARN_ON(!dp) || WARN_ON(!dev))
>>                  return -EINVAL;
>>
>>          priv = dev->dev_private;
>> -       dp_display->drm_dev = dev;
>> +       dp->drm_dev = dev;
>> +
>> +       dp_display = container_of(dp, struct dp_display_private, dp_display);
>>
>> -       ret = dp_display_request_irq(dp_display);
>> +       ret = dp_display_request_irq(dp);
>>          if (ret) {
>>                  DRM_ERROR("request_irq failed, ret=%d\n", ret);
>>                  return ret;
>>          }
>>
>> -       dp_display->encoder = encoder;
>> +       dp->encoder = encoder;
>>
>> -       dp_display->connector = dp_drm_connector_init(dp_display);
>> -       if (IS_ERR(dp_display->connector)) {
>> -               ret = PTR_ERR(dp_display->connector);
>> +       dp->connector = dp_drm_connector_init(dp);
>> +       if (IS_ERR(dp->connector)) {
>> +               ret = PTR_ERR(dp->connector);
>>                  DRM_DEV_ERROR(dev->dev,
>>                          "failed to create dp connector: %d\n", ret);
>> -               dp_display->connector = NULL;
>> +               dp->connector = NULL;
>>                  return ret;
>>          }
>>
>> -       priv->connectors[priv->num_connectors++] = dp_display->connector;
>> +       dp_display->panel->connector = dp->connector;
> This is the one line that matters I think? Can we reach the connector
> for the dp device without going through the panel in
> dp_panel_handle_sink_request()? That would reduce the number of struct
> elements if possible.
I tried, but very difficulty. It will take more text section space.
>
>> +
>> +       priv->connectors[priv->num_connectors++] = dp->connector;
> Can we not rename all the local variables in this patch and do it later
> or never? Reading this patch takes a long time because we have to make
> sure nothing has actually changed with the rename of 'dp_display' to
> 'dp'.
>
>>          return 0;
>>   }
>>
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
