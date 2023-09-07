Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103A4797E18
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 23:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB4E10E819;
	Thu,  7 Sep 2023 21:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59B5710E817
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 21:48:57 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-52a39a1c4d5so1932410a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 14:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694123336; x=1694728136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NQJgEH3f9fUyW9GofjnZwi+SALtmAUwJX7vDCsMBypg=;
 b=D9W3BY1z2fjD3W4A2bfmRlVk3Fd+IQ+wF1xWJQ4l/oUKao6JNe+MlgDmKyhDLAQbfJ
 OWrdFAxjDm8dguaTfolOgIgJNUM6Bj8QctC+G7NDm2TP7agGFTsfl4TAotsCdN8Uq2ps
 HBO19mHrLKpsW/PjogvOfYhzPxi6k6qXqgcHDc39VUVciumRaiwo0eOeSliay7jQtpzp
 1vVuSLqT0o1EL4LW4KapnnHrUBUS+g+kdLI2zX8/kBI978rTnphLdx0vz2aGJ6ofBGLb
 eC+tnZr2VnnruagC+BJjcLnvtr5VonhHtkr2m8HIh8oc1uGBNzxKlIpREYy2Udu9ABuc
 a4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694123336; x=1694728136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NQJgEH3f9fUyW9GofjnZwi+SALtmAUwJX7vDCsMBypg=;
 b=klUMTIfpaM4uQFvVyFrMan4JfeRWJnZi268mnuqt38i3pGe/bU0opVBbzp/XTC3D/q
 i1tfmpWB5lOUu96XOHZYoA1+o3S7puKDynq50XqkCC6FgRx55UOgQW8lwXJHscrgwWHe
 fR5HokPQ9Imlsk/SRMcNK1X8zbbzJSalcviLEXDcPJtgB79lMCEPphm9Hsxz1pbqUYai
 fV11eDU+nyASpw7+YuePmtwoIKWi5CPUlBMZGH3Uh4sLui81nG6E317z5wN6FUoSzLzO
 /F4124IuYtS5FzSLAWbQ/RnS+czAFMGx2fwrv9q+sO9oLKaKDWexQlskz95M1fyEpTbh
 hrvA==
X-Gm-Message-State: AOJu0YwJGe7YI/YNmDnkSYLhDRy+lDlu2zC0WftmRUPQmP4tTczeIfLi
 sglDvgXcnscxsMGUkjjBNP0CRA==
X-Google-Smtp-Source: AGHT+IHt8dq+fHGWcodmuk5PMPvb2LZ/t1lPkyNiWwgmY6kA/kRGNzdelYlTvJ+cJXNgTUJ62I/msg==
X-Received: by 2002:a05:6402:2d9:b0:525:691c:cd50 with SMTP id
 b25-20020a05640202d900b00525691ccd50mr432973edx.24.1694123335807; 
 Thu, 07 Sep 2023 14:48:55 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c10-20020aa7df0a000000b00525c01f91b0sm268738edy.42.2023.09.07.14.48.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 14:48:55 -0700 (PDT)
Message-ID: <bd833f26-ba76-4e9a-a158-d1e5eb4152cb@linaro.org>
Date: Fri, 8 Sep 2023 00:48:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: support setting the DP subconnector type
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
 <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/09/2023 00:34, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index 97ba41593820..1cb54f26f5aa 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>>                  }
>>          }
>>
>> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
>> +                                        dp_panel->downstream_ports);
>> +       if (rc)
>> +               return rc;
> 
> I haven't been able to test it yet, but I think with an apple dongle
> we'll never populate the 'downstream_ports' member if the HDMI cable is
> not connected when this runs. That's because this function bails out
> early before trying to read the downstream ports when there isn't a
> sink. Perhaps we need to read it again when an hpd_irq comes in, or we
> need to read it before bailing out from here?

I don't have an Apple dongle here. But I'll run a check with first 
connecting the dongle and plugging the HDMI afterwards.

However my expectation based on my previous tests is that we only get 
here when the actual display is connected.

-- 
With best wishes
Dmitry

