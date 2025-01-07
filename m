Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B21A03A54
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 09:55:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DC210E3BD;
	Tue,  7 Jan 2025 08:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GmUHAYJA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612D610E3B9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 08:55:16 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-21619108a6bso206822865ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 00:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736240056; x=1736844856; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sYzLOLBD7SRiQdyP3FHTMuHYR+jXGJc6CWggQbGTPXo=;
 b=GmUHAYJAc4I9qppbm7pyyoX74Tgv5HyFuK5bw6CQ88JkQktOQUg/WtpR6Mw3nuQMI9
 2gpblPgyxwgljC4IDeaIHAXdbjnWt7gsNma9g6u7hxvj/roPWiApSHst5Eqr0aujraV7
 JLeJeqFBVOmkY7ci+6Xj4QlMzsV190rGdINS2UX9zx/xRm7wPahISAGYyVrIlI9H4I8R
 a0h5G2tQKa8wZ3xtapADXTV4h1D16QKYdI7CotKzxZVVc5o+pzfaTFet0tuGWBYHpXHs
 pvzdTmnE4HkoXBD7DbC+zxmEI5NBy8Rr8xboAyZ6F5elUoKxRxU8a/gYeCXiFYUWAb9I
 Ix4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736240056; x=1736844856;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sYzLOLBD7SRiQdyP3FHTMuHYR+jXGJc6CWggQbGTPXo=;
 b=rSUwjmWghrXQF1hceomX0mgdj3/5ReWKzcPyg+I2Eu8pETtDKcU1y01ylR7LFHgzff
 SOGoOHIF958GhVaQFwAPEtK/8tSfEM5JqNvGm3otVUbrxXsnTq0vq7YmqjLTa9s+sZw/
 KGYEucdo/JP7C4bh5cIEIfRQfZuhqlia5aghyddozjGQIGApUYJGz74V+qS8OG3ZgYCc
 g1MQsXvYFXZSWCS/nbve6fXcZzT4wt6CoskgBoLqY6HMw6yqJ+GJGaNS/qOSl0ceQIqs
 jpPK3kiVcAVzlNcizV1n4qrVSjlSEemKdK/AMo33Y0LPimulMQ8jDNBhaUCAOQxLlYye
 1Q8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdHqMLMC7/E3VpZyFwtFg/BoGYRcTDItqVZ0nYNYUQtilzVbStCyhcjDSpjaOgZYVI0HkwHaa8U10=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnG+BTWfrsnDAqXXZl+yYwWxRIg3A4LruHb4uIqEdEYsS6hwTS
 O2TgfgnHkBc7RUBp/Ks91D/0mmlWXjKZ1fFBl0IxLL+PdCb5H/sS
X-Gm-Gg: ASbGncvNodkYvgi1pajKxGkbcwal0HztM3+oc+nAhXvCTzHOGVIlR8A1toGQTd8gHPD
 H0m5HBJ6JQHFxYdNprqaZH7T0F51bnx9lCmG4kcI2+mhI2bJsURG2Rn6kkbAYq5j5RwJibUEP1p
 m3a9QXBZnSpAuLYUDlgEbHsVH/f0u10kQf8AHdF9LYQoP3gvPAxwxsF50HeQIXsV66sBODZkNRJ
 jEedO4GCvFbm0ZBvSRvT0H30J7tey21EFvvnPY8+9SUXVRTN/JPXhJZXi12VA==
X-Google-Smtp-Source: AGHT+IGrzpud2u8tqXeIx6WFYqVHRmSk1jmn5bqvNmqVDa5o7b3UdPxWswuHMvhF2AnFQPiAyzPDLw==
X-Received: by 2002:a05:6a20:a127:b0:1e1:aa24:2e56 with SMTP id
 adf61e73a8af0-1e5e07ffd4bmr104670663637.30.1736240055792; 
 Tue, 07 Jan 2025 00:54:15 -0800 (PST)
Received: from [10.3.72.248] ([14.139.187.71])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8f90b9sm32769075b3a.131.2025.01.07.00.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:54:15 -0800 (PST)
Message-ID: <1f1cdfdd-2765-49f2-b179-14b18bd49d67@gmail.com>
Date: Tue, 7 Jan 2025 14:24:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panel: xinpeng-xpp055c272: transition to mipi_dsi
 wrapped functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20241223052049.419831-1-tejasvipin76@gmail.com>
 <47738b2b-351b-4df9-a50a-f4dff51441c8@linaro.org>
 <CAD=FV=WEEbC+LB9TM8VHDgO41=XPdgJR6eSYHo=KytDbPTROqw@mail.gmail.com>
 <70f0dbf2-dd84-4a50-94cc-1d388c5c93fe@gmail.com>
 <CAD=FV=XV8D2X98ULLhT0ChAfSxiBgA1uh6tRtzGv8RpXiFYN+Q@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=XV8D2X98ULLhT0ChAfSxiBgA1uh6tRtzGv8RpXiFYN+Q@mail.gmail.com>
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



On 1/7/25 10:18 AM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jan 6, 2025 at 8:21 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>>
>>>>> -     ret = xpp055c272_init_sequence(ctx);
>>>>> -     if (ret < 0) {
>>>>> -             dev_err(ctx->dev, "Panel init sequence failed: %d\n", ret);
>>>>> -             goto disable_iovcc;
>>>>> -     }
>>>>> -
>>>>> -     ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
>>>>> -     if (ret < 0) {
>>>>> -             dev_err(ctx->dev, "Failed to exit sleep mode: %d\n", ret);
>>>>> -             goto disable_iovcc;
>>>>> -     }
>>>>> +     xpp055c272_init_sequence(&dsi_ctx);
>>>>> +     dev_dbg(ctx->dev, "Panel init sequence done\n");
>>>
>>> Should the above print be only if "accum_err" is 0? That would match
>>> the previous behavior. I guess I would have also left the print as
>>> part of xpp055c272_init_sequence() unless there's a reason for moving
>>> it...
>>
>> I don't think it should print only if accum_err is 0. In the previous
>> code, it would just print after all the msleeps and write_seqs are done,
>> with no error checking at any point.
> 
> How sure are you about this? Remember the reason why we wanted to
> deprecate mipi_dsi_dcs_write_seq()? All those dang hidden return
> values. So if any one of the old mipi_dsi_dcs_write_seq() got an error
> they would have had a non-obvious return out of the function, right?
> So the print would have only happened if all of the commands executed
> successfully...
> 
> :-P

Right yes. I'd kind of forgotten how mipi_dsi_dcs_write_seq worked. I'll
fix it then along with the rest of the changes.

> 
> 
>> The reason I've moved the print outside the function is because we are
>> able to reduce a couple lines of code by passing dsi_ctx to the function
>> instead of ctx. If I'd kept the print inside, it would require us to
>> declare a `struct device*` variable which would require ctx as far as
>> I've seen and just overall introduces some lines that we could otherwise
>> avoid. I've done this in a couple other panels too.
> 
> Ah, OK. That's a reasonable reason. Thanks for the explanation...
> 
> 
> -Doug

-- 
Tejas Vipin
