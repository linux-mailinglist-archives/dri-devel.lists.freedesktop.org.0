Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47960973CC2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 17:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD9410E871;
	Tue, 10 Sep 2024 15:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="NjoyDP3E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3C810E876
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 15:54:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42bbffe38e6so44091775e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 08:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1725983687; x=1726588487;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PxrvNA8ZTQVOz0CWahQR48w5Gv7e/oF6A+jLaE/Ydo=;
 b=NjoyDP3EIoblnuYOdQC3VqYc0lgMLO1ESkcJa4AzAM9f+39RlOp6mznehS5Qh1vq2A
 LDK4vkr4GX5KD7fYMk9wzkPVt6zPp1YRKk1k8Mx6hOP5oO/XgrnBGQvpAAnCdMe8E/G7
 NCAugbkN+BjU9CUCwxkbYbSn4dNGoQ3rvmnGUP3aYg8sbvoB4sObRY58yFbZCZVlg6eW
 RHfxQ8M+l67kD89ikqYNbsPUZDhCJ750ZyM2X6tHqgaKP3v5jiFDchc8RYYVrRVe/zd/
 mp5xiSm1x+nL8hX5UHArdM6A5CxfyQGuc5NrWGzznrt0DzyGR8cRVSzwRLCpq11h5ivp
 /6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725983687; x=1726588487;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PxrvNA8ZTQVOz0CWahQR48w5Gv7e/oF6A+jLaE/Ydo=;
 b=IIG+mhdddL+pONCNirDHGCcYsUNUY9M1BTNcFbBqDwDi4pnsyskvrkaKT8Ofa6+Y6x
 9TlpU8plInrfj4ANJ6CNL5FbeVEE9Cu4NtOnbOJJ+tA7KfWPLcR7ennKavrUWP73qaUM
 N1j3LgKwj5S6lO89EkOWPMDbBAhi4h/hEv9DpffOqmMoG6Mjp/gBWvlZTk6wxEiYYR9Y
 DEyqDCbFlvKux2R0U6l7SDSDxLMOrjT2exDf+305CDD1Cg55LoW6YhNBWF6wmrELAoPA
 GD2jaViLqP0bR5ocfzEt47538XbADUV2VP7jd4Jc5PwXGHGCQJTgO1oB1VdVOkArZ3QM
 +RcQ==
X-Gm-Message-State: AOJu0Yy6TJKY6qOZRQps0aKlMbuBm9qeVoHtXYMCWY2LLj/uczdGH8Y3
 Fefw6KFPpkb0qAVgp7XmEFOJ0uBzBdUrYjGjBK9+nxd0fQUfmYNdJgjF6lxusoM=
X-Google-Smtp-Source: AGHT+IEb0qA5EpGtNaNVZJscuK0KLM4oa8DNMmxJuy4xu6oN9fz+YV9+rQWeonEJ5VU15eSCcYGm4A==
X-Received: by 2002:a05:600c:3d11:b0:426:5e91:3920 with SMTP id
 5b1f17b1804b1-42cad87f264mr87685255e9.29.1725983686172; 
 Tue, 10 Sep 2024 08:54:46 -0700 (PDT)
Received: from [192.168.108.50] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42cc1375c6esm20178245e9.1.2024.09.10.08.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 08:54:45 -0700 (PDT)
Message-ID: <19ac4e25-7609-4d92-8687-585c6ea00c79@freebox.fr>
Date: Tue, 10 Sep 2024 17:54:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] drm/msmi: annotate pll_cmp_to_fdata() with
 __maybe_unused
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org
References: <cover.1725962479.git.jani.nikula@intel.com>
 <3553b1db35665e6ff08592e35eb438a574d1ad65.1725962479.git.jani.nikula@intel.com>
 <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <4ag2efwiizn5bnskauekqwfhgl4gioafcvetpvsmbdgg37bdja@3g6tt4rlfwcb>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/09/2024 16:51, Dmitry Baryshkov wrote:

> On Tue, Sep 10, 2024 at 01:03:43PM GMT, Jani Nikula wrote:
>
>> Building with clang and and W=1 leads to warning about unused
>> pll_cmp_to_fdata(). Fix by annotating it with __maybe_unused.
>>
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=1 build").
>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> I think this function can be dropped. Marc, your call, as an author of
> the patch?

( Why is the patch prefixed "drm/msmi", is "msmi" a typo? )

-> For the record, Arnaud is the driver's author.

pll_cmp_to_fdata() was used in hdmi_8998_pll_recalc_rate()
in a commented code block which was later removed.

Thus, yes, it is safe to completely delete the unused function.
I'm surprised gcc didn't catch that...

Regards


>> ---
>>  drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> index 0e3a2b16a2ce..c0bf1f35539e 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
>> @@ -153,7 +153,7 @@ static inline u32 pll_get_pll_cmp(u64 fdata, unsigned long ref_clk)
>>  	return dividend - 1;
>>  }
>>  
>> -static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>> +static inline __maybe_unused u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
>>  {
>>  	u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
>>  
>> -- 
>> 2.39.2


