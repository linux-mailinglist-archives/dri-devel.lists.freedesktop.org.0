Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7AC559CE7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 17:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3619F10E324;
	Fri, 24 Jun 2022 15:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0A010E1B2;
 Fri, 24 Jun 2022 15:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1656082855; x=1687618855;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=r9BpodH8DspgmZK/JHyZzFlbmsdPEpE2WjRvHVubaRA=;
 b=Hlhe21SYrifUNqdBwRS2YsCwKdOx3ieYGgq76dqL4bXnVEIn06rp9XMv
 9KFpSlnkWX+gD61zd5z6Tv+9P7EumxyfjKUxdOQLm2bjwZgA5l+PPmiNg
 aQjhFc8c2wR1uimy80svoYij5tJaMRb0N35iEsIz4BkW0+Y38X+XX5DLq U=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 24 Jun 2022 08:00:54 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2022 08:00:53 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Fri, 24 Jun 2022 08:00:53 -0700
Received: from [10.110.58.84] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 24 Jun
 2022 08:00:52 -0700
Message-ID: <d1ad862d-3419-d9d8-f31e-bca791a3e6bc@quicinc.com>
Date: Fri, 24 Jun 2022 08:00:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/msm/dp: no dp_hpd_unplug_handle() required for eDP
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <agross@kernel.org>,
 <airlied@linux.ie>, <bjorn.andersson@linaro.org>, <daniel@ffwll.ch>,
 <dianders@chromium.org>, <dmitry.baryshkov@linaro.org>,
 <robdclark@gmail.com>, <sean@poorly.run>, <vkoul@kernel.org>
References: <1656027256-6552-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n534jvnjX5TShZw7CB9Cu9F7yowhwUosNkJE8t_R4xHYOw@mail.gmail.com>
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <CAE-0n534jvnjX5TShZw7CB9Cu9F7yowhwUosNkJE8t_R4xHYOw@mail.gmail.com>
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
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/23/2022 5:09 PM, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-06-23 16:34:16)
>> eDP implementation does not reuried to support hpd signal. Therefore
> s/reuried/require/
>
>> it only has either ST_DISPLAY_OFF or ST_CONNECTED state during normal
>> operation. This patch remove unnecessary dp_hpd_unplug_handle() for
>> eDP but still keep dp_hpd_plug_handle() to support eDP to either
>> booting up or resume from ST_DISCONNECTED state.
> I take it that making this change also fixes a glitch seen on the eDP
> panel when a second modeset happens? Can you add that detail to the
> commit text? The way it reads makes it sound like this is purely a
> cleanup patch, but then there's a Fixes tag so it must be a bug fix or
> worthy optimization, neither of which is described.

no, this patch will not fix edp (primary display) corruption issue.

This patch is pure clean up edp.

I will submit fixes edp corruption issue at other patch.

>> Fixes: 391c96ff0555 ("drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index da5c03a..ef9794e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1666,7 +1666,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>>                  return;
>>          }
>>
>> -       if (dp->is_edp)
>> +       if (dp->is_edp && dp_display->hpd_state == ST_DISCONNECTED)
>>                  dp_hpd_plug_handle(dp_display, 0);
>>
>>          mutex_lock(&dp_display->event_mutex);
>> @@ -1737,9 +1737,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>>
>>          dp_display = container_of(dp, struct dp_display_private, dp_display);
>>
>> -       if (dp->is_edp)
>> -               dp_hpd_unplug_handle(dp_display, 0);
> dp_hpd_unplug_handle() has a !edp check, and from what I can tell after
> this patch that condition will always trigger? But then I wonder why we
> aren't masking the irqs for hpd when the eDP display is disabled.
> Shouldn't we at least be doing that so that we don't get spurious hpd
> irqs when the eDP display is off or on the path to suspend where I
> suspect the power may be removed from the panel?
