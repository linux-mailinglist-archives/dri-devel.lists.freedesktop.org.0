Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A74F00B8
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 12:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586F10F81F;
	Sat,  2 Apr 2022 10:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD0D10F81F
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 10:37:47 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p15so9035104lfk.8
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Apr 2022 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Jx8e761MNPFyJ2/BAtkY0nyoED7Z8+xj5f0GT++V4DU=;
 b=CM5tAEao5vQ2577zZq46eGT5uUdK6gdVlWEARVuyxYeNLnYiT8lvo5OCG2ZcKhDGfb
 wy6RzILMGSWya1H7UCQr8Y4fjgCHbD+N0bIgO8rFWOwSygD60R87YX12LQBKXes0rNPR
 FQOBFpPb/5zrL2nQxvW2rumRZWeKgIx/p9Ila06gACmYl8sawMjF2PLwS8QtgZb8I5qx
 QyOD88AioP5g/0oCKIYAfuqniXGLgVHDyp5CkITXTV/3iv2MJ1nPjOiTehzvNKJJvomc
 Oa3oNbA/WgWKKW3dNoiI/IVu3xfKKUao07GPXs4EzJA+/sVfrm6CUbZRq58SKFwbCDRs
 CVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Jx8e761MNPFyJ2/BAtkY0nyoED7Z8+xj5f0GT++V4DU=;
 b=3WAItZPnWm4kkWPgNICKX+XaFPMYI+gJImENVea6eYnlKetfwlf7wMcP0SmlGQb2Po
 jzoHBE8ts9zie5Vg3g6P8LnFHQNaZJPi49MM7DcnDxbdT78RelF8HbVYdgeA4OhHErWz
 +VVzmknrUuN9bGSNDxMu7P1X5U/QWAfD/0F5MysGp/feOmOKmEZN0U0FOdVxAKpWfJ+8
 1rn3tUn3L8Cx6StKTadcUNs0MdL7pjx/d9LZ7m7i2A+TGJ2yn48FjHc1eLl20aeDJ9ym
 2VP8BWSZB3jacXCSilD+q6ZqVjqHdVXMATyMdmLSqVviqBC6nGpONUUBmdOM3QZax4lK
 G+2Q==
X-Gm-Message-State: AOAM531EJuUZ1jNP3AVuAwwDK9rlhnDTVLUAaJyx6xy66M5j1+HqnI77
 7095cwO9rrGUF7R/s9GrEqyyFw==
X-Google-Smtp-Source: ABdhPJwCW+uY9rOuoWmKzwTgEAQFjN4YRpp4A7QPyITSlGphPJj0f1ExJfTaWODEaAXo0GmLCCHjuw==
X-Received: by 2002:a05:6512:3c90:b0:44a:dc25:ab44 with SMTP id
 h16-20020a0565123c9000b0044adc25ab44mr4502073lfv.407.1648895865799; 
 Sat, 02 Apr 2022 03:37:45 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 i16-20020a056512319000b0044ae52c6365sm264006lfe.88.2022.04.02.03.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Apr 2022 03:37:45 -0700 (PDT)
Message-ID: <392b933f-760c-3c81-1040-c514045df3da@linaro.org>
Date: Sat, 2 Apr 2022 13:37:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 1/8] drm/msm/dp: Add eDP support via aux_bus
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-2-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=X+QvjwoT2zGP82KW4kD0oMUY6ZgCizSikNX_Uj8dNDqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2022 02:22, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 30, 2022 at 9:03 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
>>
>> @@ -1547,6 +1593,10 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>>
>>          dp_display->encoder = encoder;
>>
>> +       ret = dp_display_get_next_bridge(dp_display);
>> +       if (ret)
>> +               return ret;
> 
> It feels weird to me that this is in a function called "modeset_init",
> though I certainly don't know the structure of the MSM display code
> well enough to fully comment.

It's called modeset_init() as it initializes KMS objects used by DP 
driver. We have similar functions for dsi and hdmi

> My expectation would have been that
> devm_of_dp_aux_populate_ep_devices() would have been called from your
> probe routine and then you would have returned -EPROBE_DEFER from your
> probe if you were unable to find the panel afterwards.

I don't think it's possible to call it from probe() since 
drm_dp_aux_register() is called only from dp_display_bind().
The PHY also isn't initialized at that moment, so we can not probe AUX 
devices.

The overall semantics of the AUX bus is not clear to me.
Typically the bus is populated (and probed) when devices are accessible. 
But for the display related buses this might not be the case.
For example for the DSI bus we clearly define that DSI transfer are not 
possible before the corresponding bridge's (or panel's) enable call.

Maybe the same approach should be adopted for the AUX bus. This would 
allow us to populate the AUX bus before hardware access is actually 
possible, thus creating all the DRM bridges before the hardware is 
actually up and running.

> Huh, but I guess you _are_ getting called (indirectly) from
> dpu_kms_hw_init() and I can't imagine AUX transfers working before
> that function is called, so maybe I should just accept that it's
> complicated and let those who understand this driver better confirm
> that it's OK. ;-)
> 
> 
>> @@ -140,5 +140,6 @@ struct dp_parser {
>>    * can be parsed using this module.
>>    */
>>   struct dp_parser *dp_parser_get(struct platform_device *pdev);
>> +int dp_parser_find_next_bridge(struct dp_parser *parser);
> 
> Everything else in this file is described w/ kerneldoc. Shouldn't your
> function also have a kerneldoc comment?

-- 
With best wishes
Dmitry
