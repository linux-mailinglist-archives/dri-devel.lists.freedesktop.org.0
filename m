Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1A90D320
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 15:59:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932FD10E0AC;
	Tue, 18 Jun 2024 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="igtCbCxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD84410E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 13:59:03 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-705fff50de2so1479679b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718719143; x=1719323943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Sik2h3nsDyel21Jp17t3SHjC9uUWJPp0CKLjhaHrkIk=;
 b=igtCbCxKWNf4jDDWaaezxENwMZPD4Itl14Oo6/qT3rvaLRs24n/PX3ICyoKp24ncxW
 S19yaEaf2lTtbGRP3P/3VtSxRVV+GCDUUqMseMGVyJXkBLtd2UZ+AFKhuSXhKCM0P+ag
 p+qwraVeIO0HxUOX3qvUg5jnP20DJd8kLcMmW7EAEc+iqGQqkWzIkVO17XWMeRpfg3hz
 Msy4A9m0XkjtNSwA32qutYVyWCUK/rj1JUD1nOIusfxUG8UF/EIP3jCfSKouY3rumbmp
 BtvTW+EoDxkhxdGPOAo5leKTRNr+2UostLf+8nRDIQa1gOcVv34JN0FYDSGeP0LIr6tP
 n5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718719143; x=1719323943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Sik2h3nsDyel21Jp17t3SHjC9uUWJPp0CKLjhaHrkIk=;
 b=E1Z1GfSMKHaaVC86UucqnuIG7lJg5+cDfWEqH83LsDfdrojbWSmHiKfg9mpd05VgI7
 2FtJomUj7HHcsUu34aL6juRfc4gfW8nvWlMnEw94346jl289kzc0DVU34l68JUE1j/Bz
 teD85doPUklF3JLgcF8zDZZhpEeDVbTAAj1HZF7AbGvEJfgNROfoFRswldkH9kCp5x+E
 3HiSr8y2ien1pe8rKwc4T6KAF09d8x27fHHhctS0Q48ftk8N/EZfP1spZqFlyYFtwDfd
 F23viWVdBxREBcQ1d/hshNRZSGMTl9hTVB1Dfl8pusSoueWPIy97yYzFXWwXeipGZlb5
 CyUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDNbiYaFVGRGn0gVcLudMbO+6U6A+UakP9BXPPNi2TnWx+QLb1o4vk9z0MXrkeoX4q6UOBYDozE6JxVvdhuMBkXIDMLrolY8JksQR9GFhl
X-Gm-Message-State: AOJu0YwDzXXDAuHRlFO2nMWeQHlY7CYz2URGHpD0H4FBdPfgR1cULyP+
 Gk0yIH6VKqo+vLHYFwh1iPgUOPdffp9CLe/bwlolji7IyRx4A+Bf
X-Google-Smtp-Source: AGHT+IEiinzFmHmdnmLYP4XsvIyrnVEQNRoyQtf+OGBitODon2aa67vxDN6ukc/624yPUW4OT8SVdw==
X-Received: by 2002:a05:6a00:228b:b0:706:1f67:64d3 with SMTP id
 d2e1a72fcca58-7061f6768c9mr2805782b3a.14.1718719142770; 
 Tue, 18 Jun 2024 06:59:02 -0700 (PDT)
Received: from [10.0.0.19] ([122.172.85.149]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb8dd68sm8947876b3a.206.2024.06.18.06.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 06:59:02 -0700 (PDT)
Message-ID: <55d951fc-d5c4-4bd1-9629-352d1e7489f4@gmail.com>
Date: Tue, 18 Jun 2024 19:28:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: raydium-rm692e5: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240615093758.65431-1-tejasvipin76@gmail.com>
 <CAD=FV=XRZKL_ppjUKDK61fQkWhHiQCJLfmVBS7wSo4sUux2g8Q@mail.gmail.com>
 <aa757abb-9883-4a46-a5e1-a7d4d5b044eb@gmail.com>
 <CAD=FV=XX-_YA6ZjiwfqttL5y4i+QRLJn=BQUM2ugSa8HNkEUtg@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=XX-_YA6ZjiwfqttL5y4i+QRLJn=BQUM2ugSa8HNkEUtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/18/24 7:06 PM, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jun 18, 2024 at 5:25 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>>>>         rm692e5_reset(ctx);
>>>>
>>>> -       ret = rm692e5_on(ctx);
>>>> -       if (ret < 0) {
>>>> -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
>>>> +       dsi_ctx.accum_err = rm692e5_on(ctx);
>>>> +       if (dsi_ctx.accum_err) {
>>>> +               dev_err(dev, "Failed to initialize panel: %d\n", dsi_ctx.accum_err);
>>>
>>> I'd probably change rm692e5_on() to take the "dsi_ctx" as a parameter
>>> and then you don't need to declare a new one there.
>>>
>>> ...also, you don't need to add an error message since rm692e5_on()
>>> will have already printed one (since the "multi" style functions
>>> always print error messages for you).
>>
>> I'm guessing that the change about regulator_bulk_enable and
>> rm692e5 should also be applied to all the other panels where
>> similar behavior occurs?
> 
> Yeah, I'd say so.
> 
> 
>>>>                 gpiod_set_value_cansleep(ctx->reset_gpio, 1);
>>>>                 regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
>>>> -               return ret;
>>>> +               return dsi_ctx.accum_err;
>>>
>>> Not new for your patch, but it seems odd that we don't do this error
>>> handling (re-assert reset and disable the regulator) for errors later
>>> in the function. Shouldn't it do that? It feels like the error
>>> handling should be in an "err" label and we should end up doing that
>>> any time we return an error code... What do you think?
>>
>> Personally I don't think this is necessary because imo labels
>> only get useful when there's a couple of them and/or they're
>> jumped to multiple times. I don't think either would happen in
>> this particular function. But I guess if you have some convention
>> in mind, then it could be done?
> 
> I think mostly my suggestion was just that we should also do the
> gpiod_set_value_cansleep() and regulator_bulk_disable() at the end of
> rm692e5_prepare() if `dsi_ctx.accum_err` is non-zero. Then you've got
> two places doing the same thing: here and at the end of the function.
> 
> ...oh, but everything below here is already a no-op if the error is
> set. ...so I guess looking at it closer, my suggestion wouldn't be a
> "goto" but would instead be to just move the gpio/regulator call to
> the end. What do you think?

Yeah, sounds good. I'll be doing that.

> 
> -Doug
