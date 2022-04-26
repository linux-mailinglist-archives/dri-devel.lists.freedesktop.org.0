Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7015108DC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 21:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0DE10E54D;
	Tue, 26 Apr 2022 19:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A1C10E532
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 19:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1651000847; x=1682536847;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=Fmy89Zk4IfdhrvBHV8RGwaA3LuC4mMyB9cHa34B6ROM=;
 b=JbTpcvOJ/unP+OwWsBlZxmIaMKExRolTNbw1NlUfEYXx95vvChM9TNMj
 TcV22I1GRhvpEk/F02aBn45IUY+UbfDTUzu6VoD5LZxz0xmQbQXLPUW+w
 BmcXeU5aTDU6jzFpQRdlEakTf3rp1QQIwCOrglAgzp8jJWzJtJ+h5PNaS 8=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 26 Apr 2022 12:20:45 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:20:45 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 26 Apr 2022 12:20:45 -0700
Received: from [10.111.160.161] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 26 Apr
 2022 12:20:42 -0700
Message-ID: <517f71e4-785f-ef6f-d30e-fb18974eed57@quicinc.com>
Date: Tue, 26 Apr 2022 12:20:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/2] drm/probe-helper: For DP, add 640x480 if all other
 modes are bad
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Douglas Anderson <dianders@chromium.org>, <dri-devel@lists.freedesktop.org>
References: <20220426114627.1.I2dd93486c6952bd52f2020904de0133970d11b29@changeid>
 <20220426114627.2.I4ac7f55aa446699f8c200a23c10463256f6f439f@changeid>
 <fa49384c-76a5-6686-7d4d-cf11f3e98c75@quicinc.com>
In-Reply-To: <fa49384c-76a5-6686-7d4d-cf11f3e98c75@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: quic_sbillaka@quicinc.com, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, Thomas Zimmermann <tzimmermann@suse.de>,
 dmitry.baryshkov@linaro.org, quic_aravindh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Missed one more comment.

On 4/26/2022 12:16 PM, Abhinav Kumar wrote:
> Hi Doug
> 
> One minor comment below.
> 
> But otherwise, looking at this change this should work for us acc to me.
> 
> We will test this out with our equipment and then provide R-b.
> 
> Thanks
> 
> Abhinav
> On 4/26/2022 11:46 AM, Douglas Anderson wrote:
>> As per Displayport spec section 5.2.1.2 ("Video Timing Format") says
>> that all detachable sinks shall support 640x480 @60Hz as a fail safe
>> mode.
>>
>> A DP compliance test expected us to utilize the above fact when all
>> modes it presented to the DP source were not achievable. It presented
>> only modes that would be achievable with more lanes and/or higher
>> speeds than we had available and expected that when we couldn't do
>> that then we'd fall back to 640x480 even though it didn't advertise
>> this size.
>>
>> In order to pass the compliance test (and also support any users who
>> might fall into a similar situation with their display), we need to
>> add 640x480 into the list of modes. However, we don't want to add
>> 640x480 all the time. Despite the fact that the DP spec says all sinks
>> _shall support_ 640x480, they're not guaranteed to support it
>> _well_. Continuing to read the spec you can see that the display is
>> not required to really treat 640x480 equal to all the other modes. It
>> doesn't need to scale or anything--just display the pixels somehow for
>> failsafe purposes. It should also be noted that it's not hard to find
>> a display hooked up via DisplayPort that _doesn't_ support 640x480 at
>> all. The HP ZR30w screen I'm sitting in front of has a native DP port
>> and doesn't work at 640x480. I also plugged in a tiny 800x480 HDMI
>> display via a DP to HDMI adapter and that screen definitely doesn't
>> support 640x480.
>>
>> As a compromise solution, let's only add the 640x480 mode if:
>> * We're on DP.
>> * All other modes have been pruned.
>>
>> This acknowledges that 640x480 might not be the best mode to use but,
>> since sinks are _supposed_ to support it, we will at least fall back
>> to it if there's nothing else.
>>
>> Note that we _don't_ add higher resolution modes like 1024x768 in this
>> case. We only add those modes for a failed EDID read where we have no
>> idea what's going on. In the case where we've pruned all modes then
>> instead we only want 640x480 which is the only defined "Fail Safe"
>> resolution.
>>
>> This patch originated in response to Kuogee Hsieh's patch [1].
>>
>> [1] 
>> https://lore.kernel.org/r/1650671124-14030-1-git-send-email-quic_khsieh@quicinc.com 
>>
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>>
>>   drivers/gpu/drm/drm_probe_helper.c | 26 +++++++++++++++++++++-----
>>   1 file changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_probe_helper.c 
>> b/drivers/gpu/drm/drm_probe_helper.c
>> index 819225629010..90cd46cbfec1 100644
>> --- a/drivers/gpu/drm/drm_probe_helper.c
>> +++ b/drivers/gpu/drm/drm_probe_helper.c
>> @@ -476,7 +476,6 @@ int drm_helper_probe_single_connector_modes(struct 
>> drm_connector *connector,
>>       const struct drm_connector_helper_funcs *connector_funcs =
>>           connector->helper_private;
>>       int count = 0, ret;
>> -    bool verbose_prune = true;
>>       enum drm_connector_status old_status;
>>       struct drm_modeset_acquire_ctx ctx;
>> @@ -556,8 +555,8 @@ int drm_helper_probe_single_connector_modes(struct 
>> drm_connector *connector,
>>           DRM_DEBUG_KMS("[CONNECTOR:%d:%s] disconnected\n",
>>               connector->base.id, connector->name);
>>           drm_connector_update_edid_property(connector, NULL);
>> -        verbose_prune = false;
>> -        goto prune;
>> +        drm_mode_prune_invalid(dev, &connector->modes, false);
>> +        goto exit;
>>       }
>>       count = (*connector_funcs->get_modes)(connector);
>> @@ -580,9 +579,26 @@ int 
>> drm_helper_probe_single_connector_modes(struct drm_connector *connector,
>>           }
>>       }
>> -prune:
>> -    drm_mode_prune_invalid(dev, &connector->modes, verbose_prune);
>> +    drm_mode_prune_invalid(dev, &connector->modes, true);
>> +    /*
>> +     * Displayport spec section 5.2.1.2 ("Video Timing Format") says 
>> that
>> +     * all detachable sinks shall support 640x480 @60Hz as a fail safe
>> +     * mode. If all modes were pruned, perhaps because they need more
>> +     * lanes or a higher pixel clock than available, at least try to add
>> +     * in 640x480.
>> +     */
>> +    if (list_empty(&connector->modes) &&
>> +        connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
>> +        count = drm_add_modes_noedid(connector, 640, 480);
>> +        if (_drm_helper_update_and_validate(connector, maxX, maxY, 
>> &ctx)) {
>> +            drm_modeset_backoff(&ctx);
>> +            goto retry;
> 
> Do we need another retry here? This will again repeat everything from
> get_modes().
> The fact that we are hitting this code is because we have already tried 
> that and this is already a second-pass. So I think another retry isnt 
> needed?

This will help cover the case of 4.2.2.6 but not fix 4.2.2.1.

For 4.2.2.1, we will have 0 modes and so the original DRM fwk code of 
adding all modes <= 1024x768 will kick in.

Now, in that list, we will still need to pick/mark 640x480 as the 
preferred mode.

We still need IGT for that.

So yes, this will cover one of the test but not the other.
> 
>> +        }
>> +        drm_mode_prune_invalid(dev, &connector->modes, true);
>> +    }
>> +
>> +exit:
>>       drm_modeset_drop_locks(&ctx);
>>       drm_modeset_acquire_fini(&ctx);
