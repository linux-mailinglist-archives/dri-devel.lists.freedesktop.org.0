Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C189C944241
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 06:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99B810E009;
	Thu,  1 Aug 2024 04:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AD342D5n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4071110E009
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 04:41:51 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-81f96ea9ff7so221060039f.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 21:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722487310; x=1723092110; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrS7ZmWwF7HPF34u2t9hLe1InvTL4w8sJTnePBAV3mg=;
 b=AD342D5ncFSMjZFu/pcTP/PSwqxA7ebs/dmInJYl5bJR0HONKrM+6pfJwSjlJazUSf
 WH7EQC4Qt6sOqVs+Km+q2m162Yoplai7ncA3dzlMkMlcnk11ZIg3JCXH96jC5/Z5pg0C
 xTUc1H+jGhfOEk2CZrlaklX0BZC8r7xQ8rQ6Nt45RNwBVnz48OT/Am+itQi3lbnRnZxb
 aN9O9zJkHoqFx60yoVV6GYwHPfIBcD+sELD5LjU0aXL2c8kVjis90l0WmoLjqGyg6cfg
 zzz54+ga8nIKcR+UNO6lo1vt3eHuox/EZ3uEwr23hlwde+TWLTyyjErgAMxStTnBFUCZ
 nFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722487310; x=1723092110;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrS7ZmWwF7HPF34u2t9hLe1InvTL4w8sJTnePBAV3mg=;
 b=ft1X8Ha8smpNQJFLgiZAQV4GGcAcvUnIz++eQ0WNxwU4IHe/U5BwRsCdiZQj3Go7Ct
 ruf50L6acf7dDqFkg3aSb2G6TOGOsPid36lb+Nu2KVtJVZ0rQqf3jp24JG2c06UF3jIO
 4e7wd4z2tjpsAdcllNzFkuO6oAgCAOpT50u1ikke/sxRWP6UkAJ6E5bfBrwtvYwdHQq/
 YaHiOpBM97JRiccE2derlt5i8yIcZl5GEEeVQxvk1eQm5EceiIabLhXduVMXsOLrkoCg
 5b6xK03TsPwexDsOIhRoaL4TU9+5n/SWS4dz537Fm3m6pYvslUdG9/4qd/HXRdOUR9WN
 pSsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUffomqpQz/TNEJF56OC1xGKHih/q77IQ0fev4RmERRkgO0mhRkan9rozFGHYYcJGJPUWiXrL9+DmgRdx9EDIExbDB89De4z4Nj+3ut4W5w
X-Gm-Message-State: AOJu0YyQMB7gzmbhyHZ8ssIDuRYgtERWx8ce3m/Le2+dcTVbQWUg1r99
 8KEzULWFjbAqtYqvJ4R3jkebYA5jZy8U5+wmP3DEYyeUNV84Rf/9
X-Google-Smtp-Source: AGHT+IHOO+qv2QQwi+jWLgh6b+xMILAAavu2vX5eMe2CcHpvUKecTXPxU7Ozo6PD4cg1UgEckJCnJQ==
X-Received: by 2002:a05:6e02:1586:b0:398:b5b8:a683 with SMTP id
 e9e14a558f8ab-39b18362baemr18700575ab.9.1722487310120; 
 Wed, 31 Jul 2024 21:41:50 -0700 (PDT)
Received: from [10.3.80.76] ([103.4.222.252]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f817aebasm11378845a12.28.2024.07.31.21.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 21:41:49 -0700 (PDT)
Message-ID: <96048585-28e4-4bdd-b73c-1e2d6f806f91@gmail.com>
Date: Thu, 1 Aug 2024 10:11:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add more multi functions for better
 error handling
To: Doug Anderson <dianders@chromium.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, neil.armstrong@linaro.org, quic_jesszhan@quicinc.com,
 airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240730060659.455953-1-tejasvipin76@gmail.com>
 <20240730060659.455953-2-tejasvipin76@gmail.com>
 <CAD=FV=XGzQN0LK6SBOY_6P8eF-cAuP4hRwsS+NTZEaik_Os7NA@mail.gmail.com>
Content-Language: en-US
From: Tejas Vipin <tejasvipin76@gmail.com>
In-Reply-To: <CAD=FV=XGzQN0LK6SBOY_6P8eF-cAuP4hRwsS+NTZEaik_Os7NA@mail.gmail.com>
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



On 8/1/24 2:59 AM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jul 29, 2024 at 11:07 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
>> +/**
>> + * mipi_dsi_dcs_get_display_brightness_multi() - gets the current brightness value
>> + *    of the display
>> + * @ctx: Context for multiple DSI transactions
>> + * @brightness: brightness value
>> + *
>> + * Like mipi_dsi_dcs_get_display_brightness() but deals with errors in a way that
>> + * makes it convenient to make several calls in a row.
>> + */
>> +void mipi_dsi_dcs_get_display_brightness_multi(struct mipi_dsi_multi_context *ctx,
>> +                                              u16 *brightness)
>> +{
>> +       struct mipi_dsi_device *dsi = ctx->dsi;
>> +       struct device *dev = &dsi->dev;
>> +       int ret;
>> +
>> +       if (ctx->accum_err)
>> +               return;
>> +
>> +       ret = mipi_dsi_dcs_get_display_brightness(dsi, brightness);
>> +       if (ret < 0) {
>> +               ctx->accum_err = ret;
>> +               dev_err(dev, "Failed to get display brightness: %d\n",
>> +                       ctx->accum_err);
>> +       }
>> +}
>> +EXPORT_SYMBOL(mipi_dsi_dcs_get_display_brightness_multi);
> 
> I'd be interested in others' opinions, but this function strikes me as
> one that *shouldn't* be converted to _multi.
>

Only reason I converted the function at all was really for uniformity's
sake. But I don't think that's valid anymore seeing how there's already
other mipi_dsi funtions that I'm not converting and this function
probably wouldn't show up in the context of the other multi
functions.

> Specifically the whole point of the _multi abstraction is that you can
> fire off a whole pile of initialization commands without needing to
> check for errors constantly. You can check for errors once at the end
> of a sequence of commands and you can be sure that an error message
> was printed for the command that failed and that all of the future
> commands didn't do anything.
> 
> I have a hard time believing that _get_ brightness would be part of
> this pile of initialization commands. ...and looking at how you use it
> in the next patch I can see that, indeed, it's a bit awkward using the
> _multi variant in the case you're using it.
> 
> The one advantage of the _multi functions is that they are also
> "chatty" and we don't need to print the error everywhere. However, it
> seems like we could just make the existing function print an error
> message but still return the error directly. If this automatic
> printing an error message is a problem for someone then I guess maybe
> we've already reached the "tomorrow" [1] and need to figure out if we
> need to keep two variants of the function around instead of marking
> one as deprecated.
>

One thing that struck me as odd was that the callers of
mipi_dsi_dcs_get_display_brightness never bothered to print errors at
all? If we want to print errors for non-multi functions, then I think it
would be best to just modify the existing function. And in the case that
someone doesn't want those errors showing up, I agree with what Maxime
said [2] and let users handle it.

> NOTE: If we don't convert this then the "set" function will still be
> _multi but the "get" one won't be. I think that's fine since the "set"
> function could plausibly be in a big sequence of commands but the
> "get" function not so much...
> 
> [1] https://lore.kernel.org/r/CAD=FV=WbXdnM4or3Ae+nYoQW1Sce0jP6FWtCHShsALuEFNhiww@mail.gmail.com

[2] https://lore.kernel.org/all/20240726-cerise-civet-of-reverence-ebeb9d@houat/
-- 
Tejas Vipin
