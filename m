Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A614671205
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 04:35:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692A810E1C4;
	Wed, 18 Jan 2023 03:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E6310E1C4
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 03:35:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id v6so37129256ejg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 19:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JyC5wQaAQwe5exV8k9/wO906ujI4qMbS3vzhcJWha9A=;
 b=YZ539sfgFgnRi8TQKYjSYOo8pa1kO+1Enb3ODiy0lWqrGZSaho62pW2Sg+i057Pi4h
 GH7GLL/3aTljO5Xlb+NUrwgls8H5r1mscQsGwvTozzqc2OYxjkpjjJXq3apqU3KjHybT
 pNvE4WnveOEuB8Az7raFKs6E6MnvFQs/WFMjitRKnSh2jRLewT/4eKsyTH9jQDKNgbFx
 DR+QGvBnlCwlEDsruskZkmNcUM4dQLSlmBYWZrKCJQrxKd+D821/6GWZeDmdDYQGXjyG
 d1iZM/bauv48vdSEPu11oTWGq5E7CNU/Nv8nXi0tSJJFpnLc47sDleIJQ2v3R9FN1R2Z
 zUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JyC5wQaAQwe5exV8k9/wO906ujI4qMbS3vzhcJWha9A=;
 b=JXCE2EmFqgFf9Kj88aTPBZrHSofzgniNIjbhoalnusBhbvKqN7Jpvwgq+9/QHYNP7i
 +2Z7kIdP7f15lSyhtvY/Qb3TnF4l6a9XeEjuGtr1/5zLUl5R8HidPdgzIi6AiftRMv8v
 FKoUTA16OxMubWJzsqMERDphA7p4PgypRFf6i4Rp+pXHy9qbdhBo2+RZ/ww6Sl98GwoY
 la1NKxAn/36o90Ob2Hw8wbmvDyOeUIHQoPgHU03D0Br8Jk1iR9GqrCjcN335pZB8oeOr
 hy89inPt6TYiGaMt8w7s2bsXzIT+jvk1mjefwxogHb9gXoWlAEZgh/CmpdpHxMUYqnlg
 1QeA==
X-Gm-Message-State: AFqh2kq68+4Y3nrX9eOn/cKdF8Q23i8LT7pVgb/hgY1UGHEjH2l5KDOA
 gZ8LBKG5bah7V3QoGtHDrcsiNhJX2lFrQ8ma
X-Google-Smtp-Source: AMrXdXsAdIAPa8BvKgUibxZlFlBtNI8eWlBKctF83mVlrrhtEiAgMk1uL6QVFNT5soCNixIRLpEGgw==
X-Received: by 2002:a17:906:1112:b0:84d:28d6:3179 with SMTP id
 h18-20020a170906111200b0084d28d63179mr5141345eja.0.1674012933548; 
 Tue, 17 Jan 2023 19:35:33 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ti3-20020a170907c20300b0087190b46ab0sm2668902ejc.76.2023.01.17.19.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 19:35:33 -0800 (PST)
Message-ID: <aa89eb88-f0f3-6eb7-fdcd-b7394b1a1771@linaro.org>
Date: Wed, 18 Jan 2023 05:35:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] drm/msm/disp/dpu1: allow dspp selection for all the
 interfaces
Content-Language: en-GB
To: Kalyan Thota <kalyant@qti.qualcomm.com>,
 "Kalyan Thota (QUIC)" <quic_kalyant@quicinc.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Abhinav Kumar (QUIC)" <quic_abhinavk@quicinc.com>,
 Doug Anderson <dianders@google.com>
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-3-git-send-email-quic_kalyant@quicinc.com>
 <24ef467e-24a6-fc8f-3859-95ec0ae109ae@linaro.org>
 <BN0PR02MB81421A761275502A5A17AEEE96C79@BN0PR02MB8142.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <BN0PR02MB81421A761275502A5A17AEEE96C79@BN0PR02MB8142.namprd02.prod.outlook.com>
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
Cc: "robdclark@chromium.org" <robdclark@chromium.org>,
 "Vinod Polimera \(QUIC\)" <quic_vpolimer@quicinc.com>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dianders@chromium.org" <dianders@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/01/2023 05:30, Kalyan Thota wrote:
> 
> 
>> -----Original Message-----
>> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Sent: Tuesday, January 17, 2023 10:26 PM
>> To: Kalyan Thota (QUIC) <quic_kalyant@quicinc.com>; dri-
>> devel@lists.freedesktop.org; linux-arm-msm@vger.kernel.org;
>> freedreno@lists.freedesktop.org; devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; robdclark@chromium.org;
>> dianders@chromium.org; swboyd@chromium.org; Vinod Polimera (QUIC)
>> <quic_vpolimer@quicinc.com>; Abhinav Kumar (QUIC)
>> <quic_abhinavk@quicinc.com>
>> Subject: Re: [PATCH 2/3] drm/msm/disp/dpu1: allow dspp selection for all the
>> interfaces
>>
>> WARNING: This email originated from outside of Qualcomm. Please be wary of
>> any links or attachments, and do not enable macros.
>>
>> On 17/01/2023 18:21, Kalyan Thota wrote:
>>> Allow dspps to be populated as a requirement for all the encoder types
>>> it need not be just DSI. If for any encoder the dspp allocation
>>> doesn't go through then there can be an option to fallback for color
>>> features.
>>>
>>> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++---------
>>>    1 file changed, 9 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index 9c6817b..e39b345 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder
>> *drm_enc)
>>>    static struct msm_display_topology dpu_encoder_get_topology(
>>>                        struct dpu_encoder_virt *dpu_enc,
>>>                        struct dpu_kms *dpu_kms,
>>> -                     struct drm_display_mode *mode)
>>> +                     struct drm_display_mode *mode,
>>> +                     struct drm_crtc_state *crtc_state)
>>
>> Is this new argument used at all?
>>
>>>    {
>>>        struct msm_display_topology topology = {0};
>>>        int i, intf_count = 0;
>>> @@ -563,8 +564,9 @@ static struct msm_display_topology
>> dpu_encoder_get_topology(
>>>         * 1 LM, 1 INTF
>>>         * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>>>         *
>>> -      * Adding color blocks only to primary interface if available in
>>> -      * sufficient number
>>> +      * dspp blocks are made optional. If RM manager cannot allocate
>>> +      * dspp blocks, then reservations will still go through with non dspp LM's
>>> +      * so as to allow color management support via composer
>>> + fallbacks
>>>         */
>>
>> No, this is not the way to go.
>>
>> First, RM should prefer non-DSPP-enabled LMs if DSPP blocks are not required.
>> Right now your patch makes it possible to allocate LMs, that have DSPP attached,
>> for non-CTM-enabled encoder and later fail allocation of DSPP for the CRTC
>> which has CTM blob attached.
>>
>> Second, the decision on using DSPPs should come from dpu_crtc_atomic_check().
>> Pass 'bool need_dspp' to this function from dpu_atomic_check(). Fail if the
>> need_dspp constraint can't be fulfilled.
>>
> We may not get color_mgmt_changed property set during modeset commit, where as our resource allocation happens during modeset.

So, you have to fix the conditions to perform LM reallocation if CTM 
usage has changed (note, color_mgmt_changed is not a correct one here).

> With this approach, dspps will get allocated on first come first serve basis

I don't think that this is what we have agreed upon.

> @Rob, is it possible to send color management property during modeset, in that case, we can use it for dspp allocation to the datapath. The current approach doesn't assume it.
> On chrome compositor, I see that color property was being set in the subsequent commits but not in modeset.
> 
>>
>>>        if (intf_count == 2)
>>>                topology.num_lm = 2;
>>> @@ -573,11 +575,9 @@ static struct msm_display_topology
>> dpu_encoder_get_topology(
>>>        else
>>>                topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT)
>>> ? 2 : 1;
>>>
>>> -     if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
>>> -             if (dpu_kms->catalog->dspp &&
>>> -                     (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>> -                     topology.num_dspp = topology.num_lm;
>>> -     }
>>> +     if (dpu_kms->catalog->dspp &&
>>> +         (dpu_kms->catalog->dspp_count >= topology.num_lm))
>>> +             topology.num_dspp = topology.num_lm;
>>>
>>>        topology.num_enc = 0;
>>>        topology.num_intf = intf_count;
>>> @@ -643,7 +643,7 @@ static int dpu_encoder_virt_atomic_check(
>>>                }
>>>        }
>>>
>>> -     topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>>> +     topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode,
>>> + crtc_state);
>>>
>>>        /* Reserve dynamic resources now. */
>>>        if (!ret) {
>>
>> --
>> With best wishes
>> Dmitry
> 

-- 
With best wishes
Dmitry

