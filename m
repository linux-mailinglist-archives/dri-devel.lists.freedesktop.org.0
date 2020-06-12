Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF941F7BEB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 19:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1936EA16;
	Fri, 12 Jun 2020 17:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E1E6EA15
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 17:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591981252;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kq1FsuME6m+ciAh6optHE6JOSPQf6LnlX48GlVHF/W0=;
 b=bHZPIgA+kL5wragPf1epfO4PPBp98EgTSYgeEl61xVYUoHQwr51WKIVlfHozcacE+SNdUO
 G2ayFXvhDUhtM62sn/QkxTjl57FzlLN6/8B22LkaZamtsMXlN+P+N5X0j+B0OL1HE5Emxs
 QZZEqY6MXEpSWPg0FAqtHFoMccb2Wb4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-SYjU-o6UNPy1A0T6ihlUUQ-1; Fri, 12 Jun 2020 13:00:45 -0400
X-MC-Unique: SYjU-o6UNPy1A0T6ihlUUQ-1
Received: by mail-ej1-f70.google.com with SMTP id m22so4452852ejn.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 10:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YTihYUKXSrTnrV1cw1wXoVKUqiDmvG+bRKMsuvDOElI=;
 b=rhx40NBOFjvv87p1Ywrakgxj8Gz3VfYqZIIgPioDogS6oPiauUsB891VdjRPytUthQ
 GIj7tlIekdAdVFdMr6FMxjXYk1CuFhtfS+zCNqsxRE6/qijzC4sIFSy2d4K6xSxulybK
 mud8qcnzMBxsdNUh8XuQVI/XXCisgoaUTFpEARkmvE0Z43GXYhQ0oFgB7lLPp9LXfoFX
 oZXuHd/0hgb8NGILmoNzOv2WFvORYEXcsoiNRAvejeSZFLarP5l8V7zReTxYeHpp9XLo
 tKhILhYs1tlk3x5GfmBiOwIB6TI2o2taxVD1Onkka3o5rUbdCt5m94Uy79eVWWYstsOt
 xkZA==
X-Gm-Message-State: AOAM531K687UXslqc8/7YYw2J11qh+RlD7+vlTZVk75QbQIErkpAJK72
 ylnkD0xtrPrVKwCCIinYbYshel6EyQ9bW0t6H/XVN9TKDcX+7ESl91hEzKEcutcPXbXERdDoiBs
 E9TKdR1A99WCe01u5C23bxoQTFDIN
X-Received: by 2002:a50:af25:: with SMTP id g34mr12664933edd.85.1591981244268; 
 Fri, 12 Jun 2020 10:00:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1ZL1hLqchv/eFpUYGZFQqouDUrpcBFi1A1KbkRuhgNPPw1kwQ6gTpxpqVqI+lMaYQMqCDKg==
X-Received: by 2002:a50:af25:: with SMTP id g34mr12664913edd.85.1591981244074; 
 Fri, 12 Jun 2020 10:00:44 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id x11sm3852082ejv.81.2020.06.12.10.00.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2020 10:00:43 -0700 (PDT)
Subject: Re: [PATCH v2 11/15] pwm: crc: Implement get_state() method
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20200607181840.13536-1-hdegoede@redhat.com>
 <20200607181840.13536-12-hdegoede@redhat.com>
 <20200611213744.6gg2oy45cende6ba@taurus.defre.kleine-koenig.org>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <f2a268ef-2b65-d027-0b0c-b83e12a04f20@redhat.com>
Date: Fri, 12 Jun 2020 19:00:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611213744.6gg2oy45cende6ba@taurus.defre.kleine-koenig.org>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 6/11/20 11:37 PM, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
> =

> On Sun, Jun 07, 2020 at 08:18:36PM +0200, Hans de Goede wrote:
>> Implement the pwm_ops.get_state() method to complete the support for the
>> new atomic PWM API.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/pwm/pwm-crc.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/pwm/pwm-crc.c b/drivers/pwm/pwm-crc.c
>> index 58c7e9ef7278..6c75a3470bc8 100644
>> --- a/drivers/pwm/pwm-crc.c
>> +++ b/drivers/pwm/pwm-crc.c
>> @@ -114,8 +114,37 @@ static int crc_pwm_apply(struct pwm_chip *chip, str=
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
> =

> I assume that duty_cycle_reg cannot be bigger than 0xff? Would it make
> sense to mask the value accordingly to get more robust code?
> =

>> +	clk_div =3D (clk_div_reg & ~PWM_OUTPUT_ENABLE) + 1;
>> +
>> +	state->period     =3D clk_div * NSEC_PER_MHZ * 256 / PWM_BASE_CLK_MHZ;
>> +	state->duty_cycle =3D duty_cycle_reg * state->period / PWM_MAX_LEVEL;
>> +	state->polarity   =3D PWM_POLARITY_NORMAL;
>> +	state->enabled    =3D !!(clk_div_reg & PWM_OUTPUT_ENABLE);
> =

> These aligned =3D look strange (IMHO). If you don't feel strong here I'd
> like to see a single space before a =3D.

Ok, will change for the next version.

Regards,

Hans

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
