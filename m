Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE9A4FC93B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CE410FA8F;
	Tue, 12 Apr 2022 00:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3E010FA8F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:23:02 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y32so29462809lfa.6
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 17:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yOjAWbY0UR7Bw7D+6dLajU1Gt4KJ9I9tTJQx5yeuMKM=;
 b=nTYdC2mOxTqAVDPAfm4M/DKJTAtGPexyIeFczb44uM99vLJi4+KMXs5FlGtBz/LlSc
 /S4Lc8OMJTOuSpsm0k1d4AWMldDw/rEsArXH2/TL9c+HMaVhv6Vs6oOcpHb0Jrnaapd7
 bhya9Ip74FhxLoeiNWaYvv9/PXSR6DK4GaJe6/xViUD/SoQn68Q/EEXWN6dY6ThjPtm4
 2kRjmQcCANcGWxt9xJXFIVJYC+FAASLF3Ej9Fvbd7lh6tLdrnCOGLCFBei4rf8IspoJk
 4ftS/KIdUJjuRRMrzNZVEu+ymRmdvp2mBX+x+D0MWmY4JBt9YAriWegqdSTnT47tAtED
 3Uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yOjAWbY0UR7Bw7D+6dLajU1Gt4KJ9I9tTJQx5yeuMKM=;
 b=y8Sn4Oaa0163X7QP7Bic9aXLztDSxxjE4IwaK1XOBP3nSll5447F3GqK8iT8TUojbd
 5503RW7pTCDMNh4yMEnilhtMIx0jcs2/QRvXxENWF6ryM/xFMXk/XmoBCm7FU3InyOgk
 +sEuV6wkov9SwX34c8vVignPIr/gQmbyj+5dbFDKAZ/a8gVo/nl9HKZFTPHVA8V7f9Jh
 NxnEPQHAq8fz9kvJPHeY2OlFcxc5cdwcv9j5p4JC4iig8Cg574TUAjbXo0BPKyaKPJXk
 gpF8bFLpwAwD+9fPVy0oZqTCsISnltM3Q9ek0r/oqCUzR7eHa4C00xziBBJClJRcNt2a
 q8jg==
X-Gm-Message-State: AOAM530Jek2ct5PFOqDIHcnjjgFTe3UUr7R5TRakqY52YI448c+O9RkJ
 poEdXVNG29Py290D/pCexfF3Cw==
X-Google-Smtp-Source: ABdhPJwsKGf4RfVTHS/qN0bJdgQaSZll46wag0CzD6YUaL28bZDNRZULT7YDpPfyBV9HNO5cnN/31A==
X-Received: by 2002:ac2:4194:0:b0:442:ed9e:4a25 with SMTP id
 z20-20020ac24194000000b00442ed9e4a25mr22394740lfh.629.1649722980575; 
 Mon, 11 Apr 2022 17:23:00 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a056512228300b0044a0e0a609bsm3455478lfu.38.2022.04.11.17.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 17:22:59 -0700 (PDT)
Message-ID: <7529d921-0b12-d162-416d-3542933a0aed@linaro.org>
Date: Tue, 12 Apr 2022 03:22:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/msm/dp: stop event kernel thread when DP unbind
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh
 <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, vkoul@kernel.org
References: <1649722129-12542-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53zYpqJL9GCoqZRwMptCne+4Dk4thz-7rCDac7H98dm=A@mail.gmail.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/04/2022 03:21, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2022-04-11 17:08:49)
>> Current DP driver implementation, event thread is kept running
>> after DP display is unbind. This patch fix this problem by disabling
>> DP irq and stop event thread to exit gracefully at dp_display_unbind().
>>
>> Fixes: e91e3065a806 ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
> Should add a Reported-by tag from Dmitry here.
> 
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 01453db..fa1ef8e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -273,6 +274,8 @@ static int dp_display_bind(struct device *dev, struct device *master,
>>          return rc;
>>   }
>>
>> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv);
> 
> Why can't the function be defined here?
> 
>> +
>>   static void dp_display_unbind(struct device *dev, struct device *master,
>>                                void *data)
>>   {
>> @@ -280,6 +283,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>>          struct drm_device *drm = dev_get_drvdata(master);
>>          struct msm_drm_private *priv = drm->dev_private;
>>
>> +       disable_irq(dp->irq);
>> +       dp_hpd_event_stop(dp);
>>          dp_power_client_deinit(dp->power);
>>          dp_aux_unregister(dp->aux);
>>          priv->dp[dp->id] = NULL;
>> @@ -1054,7 +1059,7 @@ static int hpd_event_thread(void *data)
>>
>>          dp_priv = (struct dp_display_private *)data;
>>
>> -       while (1) {
>> +       while (!kthread_should_stop()) {
>>                  if (timeout_mode) {
>>                          wait_event_timeout(dp_priv->event_q,
>>                                  (dp_priv->event_pndx == dp_priv->event_gndx),
>> @@ -1137,7 +1142,22 @@ static void dp_hpd_event_setup(struct dp_display_private *dp_priv)
>>          init_waitqueue_head(&dp_priv->event_q);
>>          spin_lock_init(&dp_priv->event_lock);
>>
>> -       kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
>> +       dp_priv->ev_tsk = kthread_run(hpd_event_thread, dp_priv, "dp_hpd_handler");
>> +
>> +       if (IS_ERR(dp_priv->ev_tsk))
>> +               DRM_ERROR("failed to create DP event thread\n");
> 
> Why can't we error out? Why can't this kthread be started in probe?

Just my 2c. I don't think starting it in probe is a good idea. The 
driver uses components, so, in my opinion, the thread should be started 
from bind and stopped in unbind.

> 
>> +}
>> +
>> +static void dp_hpd_event_stop(struct dp_display_private *dp_priv)
>> +{
>> +       if (IS_ERR(dp_priv->ev_tsk))
>> +               return;
>> +
>> +       kthread_stop(dp_priv->ev_tsk);
>> +
>> +       /* reset event q to empty */
>> +       dp_priv->event_gndx = 0;
>> +       dp_priv->event_pndx = 0;
>>   }
>>


-- 
With best wishes
Dmitry
