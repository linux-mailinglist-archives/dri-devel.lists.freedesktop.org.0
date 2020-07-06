Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C346F21609C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 22:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F0989354;
	Mon,  6 Jul 2020 20:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3BB89354
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 20:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594068792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJBb9vmOm2JK7nGDUVre5MvvJpR8wfW9OIW8ydd7RPw=;
 b=J8d5c1UyUAzeTNNG6AwdryMx/WMzA60xbwqSjYM1qdnAUjg6Llv5qWz1RnXPn7OZPDI+hn
 kWpuVNrDpXdAQ/8/FkH0zSkr5teP25w0XSSrbFd2mnXi+dR+xh+fWAqPIN0aC+wzbMqdiX
 CR1jy0e3jwN5/vvFD1aMTjkLWZT6Q+c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-6tKQ4DNGP6CXOfAL4bn4Og-1; Mon, 06 Jul 2020 16:53:11 -0400
X-MC-Unique: 6tKQ4DNGP6CXOfAL4bn4Og-1
Received: by mail-ed1-f71.google.com with SMTP id b11so41288700edx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 13:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VmQkX3FO5LoKOrvIcObuwNEzr62NZi3RmyXG+ZG1rhQ=;
 b=WHwR+/KAhk5ZqoZ0GmVZTeQAK4WoE7fBf03szaLnJt/ZynmBAEu7HSaxIhqAcI16ie
 Trm02blgRgZaXajShpAFBLCzaOTTU0IODUo7SLEpJ4cDI+J0PVhJTT6MN4mZjI7BMS/R
 OkX9j47TRuQfl8FMDH9AnDotLFjJh6WeI5wUUzJ54jNN5vPzhRjWv7fYPa1BUu06w66x
 g4zCAi9McWaOMIegcjzgUgbp1cnIjwFWfalPrGplbWdkrzPN7YIEKrIMMF70F46M9aIO
 8eE4sp0EJitSziaz+wHHvfb7OjMfgYC1RvgaPuh/IHPJGk2iuedXi/7jJm+jEpbpprD4
 eSnA==
X-Gm-Message-State: AOAM532uPRkpRjnFbAgBxToAy2o6htZBAqneEIKD7xHXfaqhaPoPrtGj
 kcmGgREgOFh+SdnJTH718scikpJovBHKt8u9by7JVacgo289OEkjkeFJZepH9JvtjmD7YfASJ0r
 o57+HHcyQkeDrOlGjqYMBnHRBFMVH
X-Received: by 2002:a50:ab53:: with SMTP id t19mr58817993edc.179.1594068789840; 
 Mon, 06 Jul 2020 13:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJLqQedknwImIh/uEvGfEaSeiVkqbHLj6i2l9sOsL8TysnunOSU+/B1l1i/HZmnZ5eIogAiQ==
X-Received: by 2002:a50:ab53:: with SMTP id t19mr58817973edc.179.1594068789589; 
 Mon, 06 Jul 2020 13:53:09 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id l15sm17043805ejd.100.2020.07.06.13.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 13:53:08 -0700 (PDT)
Subject: Re: [PATCH v3 04/15] pwm: lpss: Add range limit check for the
 base_unit register value
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-5-hdegoede@redhat.com>
 <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <e07a7dd6-c361-32b8-c4e7-91e022f9c21d@redhat.com>
Date: Mon, 6 Jul 2020 22:53:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622073554.wf3smq3tvnr6t2xy@taurus.defre.kleine-koenig.org>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for your review and sorry for the slow reply.

I would like to get this series upstream this cycle, so
I will do my best to be a lot faster with responding from
now on.

On 6/22/20 9:35 AM, Uwe Kleine-K=C3=B6nig wrote:
> On Sat, Jun 20, 2020 at 02:17:47PM +0200, Hans de Goede wrote:
>> When the user requests a high enough period ns value, then the
>> calculations in pwm_lpss_prepare() might result in a base_unit value of =
0.
>>
>> But according to the data-sheet the way the PWM controller works is that
>> each input clock-cycle the base_unit gets added to a N bit counter and
>> that counter overflowing determines the PWM output frequency. Adding 0
>> to the counter is a no-op. The data-sheet even explicitly states that
>> writing 0 to the base_unit bits will result in the PWM outputting a
>> continuous 0 signal.
>>
>> When the user requestes a low enough period ns value, then the
>> calculations in pwm_lpss_prepare() might result in a base_unit value
>> which is bigger then base_unit_range - 1. Currently the codes for this
>> deals with this by applying a mask:
>>
>> 	base_unit &=3D (base_unit_range - 1);
>>
>> But this means that we let the value overflow the range, we throw away t=
he
>> higher bits and store whatever value is left in the lower bits into the
>> register leading to a random output frequency, rather then clamping the
>> output frequency to the highest frequency which the hardware can do.
>>
>> This commit fixes both issues by clamping the base_unit value to be
>> between 1 and (base_unit_range - 1).
>>
>> Fixes: 684309e5043e ("pwm: lpss: Avoid potential overflow of base_unit")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Change upper limit of clamp to (base_unit_range - 1)
>> - Add Fixes tag
>> ---
>>   drivers/pwm/pwm-lpss.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
>> index 43b1fc634af1..80d0f9c64f9d 100644
>> --- a/drivers/pwm/pwm-lpss.c
>> +++ b/drivers/pwm/pwm-lpss.c
>> @@ -97,6 +97,9 @@ static void pwm_lpss_prepare(struct pwm_lpss_chip *lpw=
m, struct pwm_device *pwm,
>>   	freq *=3D base_unit_range;
>>   =

>>   	base_unit =3D DIV_ROUND_CLOSEST_ULL(freq, c);
> =

> DIV_ROUND_CLOSEST_ULL is most probably wrong, too. But I didn't spend
> the time to actually confirm that.

Yes I saw your comment elsewhere that the PWM API defines rounding
in a certain direction, but fixing that falls outside of this patch.

>> +	/* base_unit must not be 0 and we also want to avoid overflowing it */
>> +	base_unit =3D clamp_t(unsigned long long, base_unit, 1,
>> +			    base_unit_range - 1);
> =

> .get_state seems to handle base_unit =3D=3D 0 just fine?!

It tries to do something with it to avoid a divide by 0, back when
I wrote the get_state code I wasn't fully aware of how the PWM
controller works. I did have access to the same datasheets as today
(the datasheets for this one are public) but the datasheet needs to
be read and then left to sync in for a couple of months and then read
again, or iow the datasheet does not explain things all that well.

As I tried to explain in the commit msg the way this PWM controller
works is it takes its input clock and then each input clock-cycle the
"base_unit" gets added to a n-bit register lets say a 16-bit register
at that is the case for the HW on which I've done all my testing.

The 8 most significant bits of the 16 bit register are compared with
a 8 bit value programmed by the PWM driver / coming from a ctrl
register and the output of that comparator is the PWM output.

The problem with a base_unit value of '0' is that adding 0 to the
16 bit register is a no-op, so the register never increments
(iow is always 0) and thus can never become bigger then the comparator
input and thus the PWM output is always 0.

The datasheet does helpfully contain a note explicitly warning of
this behavior.

So when we are programming the base_unit value, it seems best to
clamp the lower end to 1, which gives an PWM output frequency of
e.g. 19200000 / 65536 =3D 293 Hz

If the user has request an even lower output frequency, which
would result in our base_unit calculation outputting 0, then we
can either output always low, which is an infinite low output
frequency, or give the user 293 Hz and a working PWM.

This is the low end of the clamp. The high end clamp simply is
there because base_unit itself is e.g. a 16 bit value too.

The looks a bid weird because instead of 65536 (for the divides)
/ 65535 (for the clamp / masking) it uses base_unit_range and
(base_unit_range - 1). This is because different versions of
the SoCs using this driver have a different register size for the
base_unit value.

I hope this helps to explain what is going on a bit.

###

As for the behavior on base_unit=3D=3D0 in the get_state method,
as mentioned above I wrote that when I did not fully understood
how the controller works.

We really should never encounter this.

But if we do then I think closest to the truth would be:

state->period     =3D UINT_MAX;
state->duty_cycle =3D 0;

I can submit a separate patch for that, if you agree
that this is the best way to describe the "output always low"
state in which a base_unit value of 0 will result.

Regards,

Hans


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
