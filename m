Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290CA4E5A21
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 21:47:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0AC510E06D;
	Wed, 23 Mar 2022 20:47:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A0910E121
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 20:47:42 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id q5so3539393ljb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nR3AvqTZN+kyV/rKaUagcvSgKSZFKDoQXclXRwLziKI=;
 b=PyQdCUs1Re8Jf9leRiq9j0pQTQJHPo91IkVwd/GnKFA687tOBqUoLXYo3GpywmzbPe
 7PJGlDygTu63wAeJnWR2xCgPaQdxtD09vmoFrO1iO3ORBQCl/Z3No8XY/cmMts+H+vSk
 BT4pz7/0NrumhJRa/vQppJgUBbuF4+HqpG4YyvdClM+tcCBxhuqUVGsA82LkicFL+xLp
 6bpp8L0HXGgXJAKnGfuhNpGgWcS8Lg0EOO+IvOWERtgaa+/07L8VTOYpjygNxrDnQrWs
 VYxInEtBJw2r6y1RmVJHqhPAATlNcrMDGdJ3AqwMPAPcQp0xD3iaOZRs/nccJ6wrC2qP
 k0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nR3AvqTZN+kyV/rKaUagcvSgKSZFKDoQXclXRwLziKI=;
 b=NxEh2rlEGajNbyZIqkS/P4aHX9vg0odFUn1e5l+FNavBQdU2mFxXPmNy/8YnCKAI/3
 N4IrFFI0UsY3HkHTsBHq8OtEZ1UH0Gh3COL5k47hrpYMw3lessR29eq5zi4pIJNMPd5q
 Uf84FK9UqAGGGhV1dZIIeu72C3eE+gC5TaWoMrEvm682Eq+3QamnTa6zpASdVQ/T69Pt
 OCBUssCoUirr5IsbrnWVi3+x2djABOnVLv/4sqJG2I8HBplpTLAYFFYek90B+2nwsAQ+
 dRIqZRBE8deZ+oLdfnU77di9yuPzkGOIAUb58rZizW9T20cACwIHA5NcTaBp5DIlo0WD
 h6tA==
X-Gm-Message-State: AOAM532MY3bXd9AP5KS5mEg4FSU2IZ3IcUaUWRU1M3JJrwZ9WGXZChnn
 o1hPVVea0p8SZomSVlIN2v0NNg==
X-Google-Smtp-Source: ABdhPJyqQ1XzqSSz+YLic5LDTbGNx8+XZW4nc4dqMBq3sIkfqAcJcHF7PICThgkc7fB64FrGWjMNrQ==
X-Received: by 2002:a2e:b7c1:0:b0:249:7a91:bba1 with SMTP id
 p1-20020a2eb7c1000000b002497a91bba1mr1544981ljo.276.1648068460642; 
 Wed, 23 Mar 2022 13:47:40 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z17-20020ac24191000000b004483a4d9a3esm90429lfh.152.2022.03.23.13.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:47:40 -0700 (PDT)
Message-ID: <c43300ad-a2dd-5e9a-1e35-b5c9d546c23a@linaro.org>
Date: Wed, 23 Mar 2022 23:47:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from
 dp_panel_get_modes()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
 <8c519668-85d0-c1b5-860f-cd027ac74b84@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <8c519668-85d0-c1b5-860f-cd027ac74b84@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2022 23:46, Kuogee Hsieh wrote:
> 
> On 3/23/2022 3:35 AM, Dmitry Baryshkov wrote:
>> Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
>> case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
>> the dp_mode argument. Drop it completely.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

There was an extra >, so this line wasn't picked up by patchwork.

> 
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 2 +-
>>   drivers/gpu/drm/msm/dp/dp_panel.h   | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 178b774a5fbd..3dd790083cf7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1013,7 +1013,7 @@ int dp_display_get_modes(struct msm_dp *dp,
>>       dp_display = container_of(dp, struct dp_display_private, 
>> dp_display);
>>       ret = dp_panel_get_modes(dp_display->panel,
>> -        dp->connector, dp_mode);
>> +        dp->connector);
>>       if (dp_mode->drm_mode.clock)
>>           dp->max_pclk_khz = dp_mode->drm_mode.clock;
>>       return ret;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c 
>> b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index f1418722c549..8d7662028f30 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -259,7 +259,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
>>   }
>>   int dp_panel_get_modes(struct dp_panel *dp_panel,
>> -    struct drm_connector *connector, struct dp_display_mode *mode)
>> +    struct drm_connector *connector)
>>   {
>>       if (!dp_panel) {
>>           DRM_ERROR("invalid input\n");
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h 
>> b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index 9023e5bb4b8b..9fa6e524832c 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -64,7 +64,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>>   u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
>>               u32 mode_pclk_khz);
>>   int dp_panel_get_modes(struct dp_panel *dp_panel,
>> -        struct drm_connector *connector, struct dp_display_mode *mode);
>> +        struct drm_connector *connector);
>>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);


-- 
With best wishes
Dmitry
