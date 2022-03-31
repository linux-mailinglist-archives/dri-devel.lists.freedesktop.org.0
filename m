Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 132064ED798
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 12:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D375710E74F;
	Thu, 31 Mar 2022 10:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA87D10E9F3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 10:10:30 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id 5so40591462lfp.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DkPFTvrQEeskfvBTqfSOajTcre8fVDqFYzIN3B6dTsI=;
 b=KItC8IMn5rncXU6DjNFWlsw2ttC3GaaAEUbxCnBOR7T/9Tfj6lRHHFcT2drBRA225/
 dk71o9m/4VllMnJRSsHw7LpJ9ASmXszD3qY5Zz+5TfhYdsRg38C3XtGxx2w1jGsQWBY8
 ih5uzDcudKl79At3nt5SsfB64kDTfNMDqHWXP07DhGCY1vsGKCPn+LukasFPljTlUHJI
 fP10i7MwzuQBxdQAzpmwtCsOshjAuwnIOjprbAKbJ1Yy6ciMxquv4ewcAaNOedjPDwYA
 nOxsNYnOLJ6pOXJnjlR2ncJeheVQ923O6vmgq2BTKrYI1rCvcolTwFfgDgtF5Fn0MUui
 Bdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DkPFTvrQEeskfvBTqfSOajTcre8fVDqFYzIN3B6dTsI=;
 b=PNShR3qX5o0yWR93oOnAFOjoB7dya/AGY8+fAmrvuIKRfDl47BJKCHQfkuhVWb42gg
 GNmMIIdXyxr0/75e9bOD4dUDtaC2e9Y7QO4dMlE83C8oy2bUFeItNw3pxoJtc+CRWKU0
 d5PyEJfBf5n8FGRNumygWk2d9/wZ2naTnF/eGB3KJMXWAt0UisN/v5ml6Gnoh2OSYLTK
 AAeErNqEQm74s+GcRTx1kntTTiJOKeaHSpt9i0DCLVhGR/xC7VVgeWDPyziJe5SZQb42
 lS4IBbkYLY0kiiAmpFBE1pYZCalIqv+YVgEOkAx3tntxN/zUuPEoHjvkeRrhfEFRYUXQ
 X5QQ==
X-Gm-Message-State: AOAM530a55QxPn3IYZtzQ/EQ2O+1FRo91uuS6+GxsYWNYz/PWFDUFyRG
 r7sb7j6qaHSJW1Zrv6Ci8TicOA==
X-Google-Smtp-Source: ABdhPJwtAJyMy0EoY+rrG6bKX7082NXgD8paVU/49U2dxYES7x6TI8M54x7s0LTqdnwet5PnHMXT9w==
X-Received: by 2002:ac2:485b:0:b0:44a:23d5:d4bd with SMTP id
 27-20020ac2485b000000b0044a23d5d4bdmr10216994lfy.214.1648721428984; 
 Thu, 31 Mar 2022 03:10:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a26-20020a19fc1a000000b0044ab4920887sm805769lfi.57.2022.03.31.03.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:10:28 -0700 (PDT)
Message-ID: <d9ac1cee-d4fc-09ae-b2df-82ae2ecd57fb@linaro.org>
Date: Thu, 31 Mar 2022 13:10:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 4/8] drm/msm/dp: avoid handling masked interrupts
Content-Language: en-GB
To: "Sankeerth Billakanti (QUIC)" <quic_sbillaka@quicinc.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-5-git-send-email-quic_sbillaka@quicinc.com>
 <CAA8EJprMvik_6xmGt2oZGpDG9FoMtC_ojuw+oTjPLTck4Hu3WA@mail.gmail.com>
 <MW4PR02MB7186669BA1B19FA4F184B558E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <MW4PR02MB7186669BA1B19FA4F184B558E1E19@MW4PR02MB7186.namprd02.prod.outlook.com>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "dianders@chromium.org" <dianders@chromium.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "swboyd@chromium.org" <swboyd@chromium.org>,
 "sean@poorly.run" <sean@poorly.run>,
 "seanpaul@chromium.org" <seanpaul@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/03/2022 08:53, Sankeerth Billakanti (QUIC) wrote:
> Hi Dmitry,
> 
>> On Wed, 30 Mar 2022 at 19:03, Sankeerth Billakanti
>> <quic_sbillaka@quicinc.com> wrote:
>>>
>>> The interrupt register will still reflect the connect and disconnect
>>> interrupt status without generating an actual HW interrupt.
>>> The controller driver should not handle those masked interrupts.
>>>
>>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_catalog.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> index 3c16f95..1809ce2 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
>>> @@ -608,13 +608,14 @@ u32 dp_catalog_hpd_get_intr_status(struct
>>> dp_catalog *dp_catalog)  {
>>>          struct dp_catalog_private *catalog = container_of(dp_catalog,
>>>                                  struct dp_catalog_private, dp_catalog);
>>> -       int isr = 0;
>>> +       int isr, mask;
>>>
>>>          isr = dp_read_aux(catalog, REG_DP_DP_HPD_INT_STATUS);
>>>          dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
>>>                                   (isr & DP_DP_HPD_INT_MASK));
>>> +       mask = dp_read_aux(catalog, REG_DP_DP_HPD_INT_MASK);
>>>
>>> -       return isr;
>>> +       return isr & (DP_DP_HPD_STATE_STATUS_MASK | mask);
>>
>> I suspect that the logic is inverted here. Shouldn't it be:
>>
>> return isr & DP_DP_HPD_STATE_STATUS_MASK & mask;
>>
>> ?
>>
>   
> The value of DP_DP_HPD_STATE_STATUS_MASK is 0xE0000000 and the value of the read
> interrupt mask variable could be is 0xF.
> 
> The mask value is indicated via the register, REG_DP_DP_HPD_INT_MASK, bits 3:0.
> The HPD status is indicated via a different read-only register REG_DP_DP_HPD_INT_STATUS, bits 31:29.

I see. Maybe the following expression would be better?

return isr & (mask & ~DP_DP_HPD_INT_MASK);

> 
> isr & DP_DP_HPD_STATE_STATUS_MASK & mask, will return 0 always.
> 
>>>   }
>>>
>>>   int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
>>> --
>>> 2.7.4
>>>
>>
>>
>> --
>> With best wishes
>> Dmitry
> 
> Thank you,
> Sankeerth


-- 
With best wishes
Dmitry
