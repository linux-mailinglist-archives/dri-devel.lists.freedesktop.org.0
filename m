Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C123C2BC2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 01:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D27A6E9B2;
	Fri,  9 Jul 2021 23:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975C06E9B2
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 23:46:36 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id p1so26437856lfr.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GR17m4TCo1bxAJbxwHuYhDUZxpveBueDWH1Tshnwhcw=;
 b=hmPlfythTE2CxjcaXjAVAWgrW2Gi2aikI45PIV7gfoj4G7M6oAEMPoirHnWK1fF1iE
 0rfo4/3xZQIb9+cs+6ntmClUn1ek8wkuiQvWcbmvMXOnVJQkWWPFYX5P76tR6llo7yq2
 R5YGjcVaF2tRv4h1oplG/+1/gGUhQ7atnCgKSIkpWsUigEGdImiRELOxKp3mWXcA+CTx
 3/ENzIMdnPfl+QViXdMA2oDoe0noNm1w1KMTN2g3X9NqdUmwTUmoBe06wME9672G7aQ8
 8oPCZxiqzPIXLR9lc334HvcNUET2CkZX0ymL8cC8ajAqq98TQBtrnJYTrOMYgecX1J4u
 JVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GR17m4TCo1bxAJbxwHuYhDUZxpveBueDWH1Tshnwhcw=;
 b=b+SSjqh49CZ6wIpnUGDzzFEXPdhqmYntNfse6QSiEwMhg8wPQkoU4qyezQgdDt2T2/
 lYYDobra97VZCtBZX0ABuJygFhj5wZIdHXiUWtaDAVMmpEW/fYxv2Zw5J/0NvizBq/Z2
 +H63IzgN2StVk3EYERlEIUFY2OVujt1UA22tEpInJXYKN7fSI1h9Hpg4TTpi6AhhE7oT
 y3rc93hUeVSClgHIqhzL4bO2AHIP281ennLS5Yh3fxz08djGm/B2qVo4Pm9kCCpLAy2N
 //eNj2DfCRywF6U/h8TVWhbB6AXS1H0dLzBQp5si8g0NkFiFKZvMBwplY4VOLKvf1CQM
 wYNQ==
X-Gm-Message-State: AOAM532FRMFdL4s+6/ZInN28M6q6Tx+SAb27ji5XTEXaCVCVE5Mj0kBO
 2eNW2pwf06TmJ8VOG8J0G6zrFA==
X-Google-Smtp-Source: ABdhPJwLXKpJ5yziTMVpeRJ+aJVWJpnPi6aLSogHhO7o4SSJprFYE+zfyjZMegAk5EL+0c93bLJgqA==
X-Received: by 2002:ac2:598b:: with SMTP id w11mr31398334lfn.534.1625874394692; 
 Fri, 09 Jul 2021 16:46:34 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id 189sm748273ljf.117.2021.07.09.16.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jul 2021 16:46:34 -0700 (PDT)
Subject: Re: [Freedreno] [PATCH v1 5/7] drm/msm/dp: stop calling
 set_encoder_mode callback
To: abhinavk@codeaurora.org
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-6-dmitry.baryshkov@linaro.org>
 <16be30732d3c2108f7a3ca640ed8285d@codeaurora.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <2920aa33-c5cf-717f-4e6e-dfd473a87820@linaro.org>
Date: Sat, 10 Jul 2021 02:46:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <16be30732d3c2108f7a3ca640ed8285d@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/07/2021 01:16, abhinavk@codeaurora.org wrote:
> On 2021-07-08 05:28, Dmitry Baryshkov wrote:
>> None of the display drivers now implement set_encoder_mode callback.
>> Stop calling it from the modeset init code.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The change looks fine,
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> 
> But has DP been re-verified with this change by Bjorn?
> If not, I can verify this on my board and give my Tested-by

Please test it on your setup.

> 
>> ---
>>  drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
>>  1 file changed, 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 051c1be1de7e..70b319a8fe83 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -102,8 +102,6 @@ struct dp_display_private {
>>      struct dp_display_mode dp_mode;
>>      struct msm_dp dp_display;
>>
>> -    bool encoder_mode_set;
>> -
>>      /* wait for audio signaling */
>>      struct completion audio_comp;
>>
>> @@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct
>> msm_dp *dp_display)
>>  }
>>
>>
>> -static void dp_display_set_encoder_mode(struct dp_display_private *dp)
>> -{
>> -    struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
>> -    struct msm_kms *kms = priv->kms;
>> -
>> -    if (!dp->encoder_mode_set && dp->dp_display.encoder &&
>> -                kms->funcs->set_encoder_mode) {
>> -        kms->funcs->set_encoder_mode(kms,
>> -                dp->dp_display.encoder, false);
>> -
>> -        dp->encoder_mode_set = true;
>> -    }
>> -}
>> -
>>  static int dp_display_send_hpd_notification(struct dp_display_private 
>> *dp,
>>                          bool hpd)
>>  {
>> @@ -369,8 +353,6 @@ static void dp_display_host_init(struct
>> dp_display_private *dp, int reset)
>>      if (dp->usbpd->orientation == ORIENTATION_CC2)
>>          flip = true;
>>
>> -    dp_display_set_encoder_mode(dp);
>> -
>>      dp_power_init(dp->power, flip);
>>      dp_ctrl_host_init(dp->ctrl, flip, reset);
>>      dp_aux_init(dp->aux);


-- 
With best wishes
Dmitry
