Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26712160CE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 23:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F1489E5B;
	Mon,  6 Jul 2020 21:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBB689E5B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594069535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZ4PLJw4PBuUGJVeUTW+U9UdcJG0xdBh1DcgbZxmOc0=;
 b=GHyT/SvhDIbx53k5F+LJWwHphznj7ON/9rQuY8MrNvQpNQJIpUfVmg3sBvvRnus9TT+kmV
 8zZYdO8WWs+4CgTFfc4vqDVNvDfo1XrFRuNCm0fqOrd8KOfIZ0KjM2jUir50oFTQh67W/3
 MhrQ+pKDP8l4WnrlAqi1D3mp4IwOdik=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-lmIllAcqNCeEAFvWFq1sWA-1; Mon, 06 Jul 2020 17:05:23 -0400
X-MC-Unique: lmIllAcqNCeEAFvWFq1sWA-1
Received: by mail-ed1-f71.google.com with SMTP id h5so50808245edl.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 14:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=joj3ugB6R/6J+5A0HiLDzW8Xgi+NkTicU2Iuhf30mzk=;
 b=B8Ii/MCdIo+YHTiAFVErH8rguOAlEEAGO24y9Zo+jZTI7O/0IIoovSSy9w0qFJIZiA
 OHgeskAkO592IRTuzY5PEV50Y1kv+6EgjKLewL/RoUl2M9FALlvd0X+YYYN3hmzCxkgT
 bB/RDObiszKi5G1FjMHE4xuSKbUvHWwQX3LuY+PurZfCIHLmViJ9pbuDRSSUqtFhrPoa
 lj7bVsNII1L9bsSVwX3zxz7KCEwW7fV1UJZ6ihX3B9OicGig5FB5ZRuQ5ZkGmGp2zydd
 yDnbZwNfE4QC0mhiOlJwtQB1WNoucXgjXwq+xo68F7hmm485UzCq8shywm/pfsmFqfKP
 JtLg==
X-Gm-Message-State: AOAM530RmRq13SPfEnBZJOwmSOIXq0h2XcRgD4ixDuhq2rwCx2MSUJvN
 mpcF6W56FisvmjquR/W+Cjd/hjpI6SFVyoYabx3Is+GmjTkBmxWNGka0f4RY2ojQKOaMGNm5bzP
 o7ff/K5uQNGAun8qomvZ2GEQ/HQrP
X-Received: by 2002:a17:906:fa92:: with SMTP id
 lt18mr33000429ejb.534.1594069522021; 
 Mon, 06 Jul 2020 14:05:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK9F8LwD6ImPYy5wRucrWx7eh1AqEMfwqNCkCL/l8TpHT/un27SnONteRcUHtIlD5wblFxWA==
X-Received: by 2002:a17:906:fa92:: with SMTP id
 lt18mr33000405ejb.534.1594069521782; 
 Mon, 06 Jul 2020 14:05:21 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id y11sm16560013ejw.63.2020.07.06.14.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 14:05:21 -0700 (PDT)
Subject: Re: [PATCH v3 11/15] pwm: crc: Implement get_state() method
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200620121758.14836-1-hdegoede@redhat.com>
 <20200620121758.14836-12-hdegoede@redhat.com>
 <20200622075730.lenaflptqnemagff@taurus.defre.kleine-koenig.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <59babd32-9421-0b31-187f-ceff7c003f54@redhat.com>
Date: Mon, 6 Jul 2020 23:05:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622075730.lenaflptqnemagff@taurus.defre.kleine-koenig.org>
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

On 6/22/20 9:57 AM, Uwe Kleine-K=C3=B6nig wrote:
> On Sat, Jun 20, 2020 at 02:17:54PM +0200, Hans de Goede wrote:
>> Implement the pwm_ops.get_state() method to complete the support for the
>> new atomic PWM API.
>>
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v3:
>> - Add Andy's Reviewed-by tag
>> - Remove extra whitespace to align some code after assignments (requeste=
d by
>>    Uwe Kleine-K=C3=B6nig)
>> ---
>>   drivers/pwm/pwm-crc.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
>> index 8a7f4707279c..b311354d40a3 100644
>> --- a/drivers/pwm/pwm-crc.c
>> +++ b/drivers/pwm/pwm-crc.c
>> @@ -119,8 +119,37 @@ static int crc_pwm_apply(struct pwm_chip *chip, str=
uct pwm_device *pwm,
>>   	return 0;
>>   }
>>   =

>> +static void crc_pwm_get_state(struct pwm_chip *chip, struct pwm_device =
*pwm,
>> +			       struct pwm_state *state)
>> +{
>> +	struct crystalcove_pwm *crc_pwm =3D to_crc_pwm(chip);
>> +	struct device *dev =3D crc_pwm->chip.dev;
>> +	unsigned int clk_div, clk_div_reg, duty_cycle_reg;
>> +	int error;
>> +
>> +	error =3D regmap_read(crc_pwm->regmap, PWM0_CLK_DIV, &clk_div_reg);
>> +	if (error) {
>> +		dev_err(dev, "Error reading PWM0_CLK_DIV %d\n", error);
>> +		return;
>> +	}
>> +
>> +	error =3D regmap_read(crc_pwm->regmap, PWM0_DUTY_CYCLE, &duty_cycle_re=
g);
>> +	if (error) {
>> +		dev_err(dev, "Error reading PWM0_DUTY_CYCLE %d\n", error);
>> +		return;
>> +	}
>> +
>> +	clk_div =3D (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
>> +
>> +	state->period =3D clk_div * NSEC_PER_USEC * 256 / PWM_BASE_CLK_MHZ;
>> +	state->duty_cycle =3D duty_cycle_reg * state->period / PWM_MAX_LEVEL;
> =

> Please round up here.

Ok, I can fix that for the next version of this patch-set. Before I
post a new version of this patch-set, you have only responded to
some of the PWM patches in this set. Do you have any remarks on the
other PWM patches ?

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
