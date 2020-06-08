Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DA31F1736
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 13:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0C689CF8;
	Mon,  8 Jun 2020 11:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8526E1F7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591614440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e8PAvNJwl8CVvzuQhQrqiLIXXDJ1qmAQ7ddNr8veIRE=;
 b=KsagcJ3z7NxCuzh52gze/sjkVa2NYeBmVjHHLBsqbMpUMptFaf3Axw5jLvYkZwLtnj14gy
 OnUQgUDGfvFfQyxh7R6/4jdRLi22xmumkCpnpv5AiwDI/jxsiVX44QsahaWoJ3BqwsdUaP
 1KS3NLCTX6dhEee8Oi5RREhWcgOW9+8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-0okBYyeEP0CHMuBAfUWWEg-1; Mon, 08 Jun 2020 07:07:19 -0400
X-MC-Unique: 0okBYyeEP0CHMuBAfUWWEg-1
Received: by mail-wm1-f71.google.com with SMTP id a7so1422251wmf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 04:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e8PAvNJwl8CVvzuQhQrqiLIXXDJ1qmAQ7ddNr8veIRE=;
 b=swx9DapwEw/xI2XUOvm+EMxN1Z4TNMDdRhJklc59Mlb14Qruzx+TcKFpbYREjnVz1N
 GFcpbVGO/ICqgfFl5aaVO7LysavxXS6MX/Q4GioKop5d8c43PclcqCWvvB4uvHHw9CqS
 pW8JCV5/fOa/vaVckSFDzkyyPdeJofSlaJN3V5z9gtiU+9SstYgGMlARMlnEM0b+xLgP
 hCNMA1/tbAIk1KuvOCPBW0OHLOHELeVH8RVr7MZwQ4dYhiz2r/aX7nEb1EFYLZR/EWkf
 zyUpfKXY98vf/AG4SZ3Hnr+2bjULTlS4jltmMT0TNRGnkN4q5trJrDj7aUvo6MYmNWSr
 wOGQ==
X-Gm-Message-State: AOAM530xuUBBYEIS30ic2m2c8pBH1XfIWVludfixCo7No8kRptm9F1m+
 kOWcVU0ZfZ/zGE0WyBxm42WpMzRBgaKp/E51tRwe/yQISbuW4xuoQPm7A0NGggMBe79tg/HDSmg
 8zcjkw8+41DPyIIxAyuyTYD07xDos
X-Received: by 2002:a7b:c041:: with SMTP id u1mr3779519wmc.56.1591614434757;
 Mon, 08 Jun 2020 04:07:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdmXNioeILy0TwT3HF2mT0/SxnOtWw0UuEKWxJARe1kqkMmGS1C96ubFrpAE8YjhmMf7MKIQ==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr3779498wmc.56.1591614434473;
 Mon, 08 Jun 2020 04:07:14 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id h15sm22301292wrt.73.2020.06.08.04.07.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:07:13 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] pwm: lpss: Add range limit check for the
 base_unit register value
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-4-hdegoede@redhat.com>
 <20200608035023.GZ2428291@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <90769dc0-3174-195b-34e0-ef4bb9d9b982@redhat.com>
Date: Mon, 8 Jun 2020 13:07:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608035023.GZ2428291@smile.fi.intel.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/8/20 5:50 AM, Andy Shevchenko wrote:
> On Sun, Jun 07, 2020 at 08:18:28PM +0200, Hans de Goede wrote:
>> When the user requests a high enough period ns value, then the
>> calculations in pwm_lpss_prepare() might result in a base_unit value of 0.
>>
>> But according to the data-sheet the way the PWM controller works is that
>> each input clock-cycle the base_unit gets added to a N bit counter and
>> that counter overflowing determines the PWM output frequency. Adding 0
>> to the counter is a no-op. The data-sheet even explicitly states that
>> writing 0 to the base_unit bits will result in the PWM outputting a
>> continuous 0 signal.
> 
> So, and why it's a problem?

Lets sya the user requests a PWM output frequency of 100Hz on Cherry Trail
which has a 19200000 Hz clock this will result in 100 * 65536 / 19200000 =
0.3 -> 0 as base-unit value. So instead of getting 100 Hz the user will
now get a pin which is always outputting low.

OTOH if we clamp to 1 as lowest value, the user will get 192000000 / 65536
= 292 Hz as output frequency which is as close to the requested value as
we can get while actually still working as a PWM controller.

>> base_unit values > (base_unit_range / 256), or iow base_unit values using
>> the 8 most significant bits, cause loss of resolution of the duty-cycle.
>> E.g. assuming a base_unit_range of 65536 steps, then a base_unit value of
>> 768 (256 * 3), limits the duty-cycle resolution to 65536 / 768 = 85 steps.
>> Clamp the max base_unit value to base_unit_range / 32 to ensure a
>> duty-cycle resolution of at least 32 steps. This limits the maximum
>> output frequency to 600 KHz / 780 KHz depending on the base clock.
> 
> This part I don't understand. Why we limiting base unit? I seems like a
> deliberate regression.

The way the PWM controller works is that the base-unit gets added to
say a 16 bit (on CHT) counter each input clock and then the highest 8
bits of that counter get compared to the value programmed into the
ON_TIME_DIV bits.

Lets say we do not clamp and allow any value and lets say the user
selects an output frequency of half the input clock, so base-unit
value is 32768, then the counter will only have 2 values:
0 and 32768 after that it will wrap around again. So any on time-div
value < 128 will result in the output being always high and any
value > 128 will result in the output being high/low 50% of the time
and a value of 255 will make the output always low.

So in essence we now only have 3 duty cycle levels, which seems like
a bad idea to me / not what a pwm controller is supposed to do.

So I decided to put a cut of at having at least 32 steps.

The mean reason I wrote this patch though is to avoid a base-unit
value of 0 which really results in a completely non working PWM
output. I personally believe clamping on the high side is a good
idea too. But if you are against that I can drop that part.

Note that the clamping on the high side will not affect the
primary user of the LPSS-pwm driver which is the i915 backlight
code, that never asks for such high frequencies.  But it could
help to avoid an user shooting themselves in the foot when using
the PWM on a dev board through the sysfs interface.

Regards,

Hans


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
