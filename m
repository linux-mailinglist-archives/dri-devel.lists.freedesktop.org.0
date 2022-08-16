Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8C9595161
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 06:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CAADC2E1;
	Tue, 16 Aug 2022 04:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F182DC2E8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 04:56:11 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id j3so9576155ljo.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 21:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc;
 bh=lMyaBQ0fr/YKfcqNoaKSdb+50RM2Rxj1DLsmzLOg6p8=;
 b=emj3c4qKkUjUv1uibUM0Ft8DTfEO05AQs/3Y741be7NMkNUqfjGZwGCKNZo9C6YjXp
 T3u8ogp+Q7xyqUvWTbVxqcfKvlVXs+sCdEW176mhvN95YWDcTH1MCuzscHr20UM4t23y
 efx6c0daYiXNg01uKsfggL1TIi4sG62wT7fq7xNMdYWmSyv0IojrLQ3X+x3JlfiYjCWI
 ZGleJlTBA7imnc87Mtsd2wKxuRqiB4CfXoOM/VC02Ai37op0ZH3k+3vNM5TFazrPwDbX
 I3K6wSQIq8cyMpVj2t+/iVXSTMsuGrDBGJEDknJ3KmY9XUsqIPVIorSVNOoEmEoQm85s
 ld9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=lMyaBQ0fr/YKfcqNoaKSdb+50RM2Rxj1DLsmzLOg6p8=;
 b=2RFR203kpV7eSOHfygxjuFRCHvD0FTB+5AB5urIyc83EZu7W3rPaercrMebos6Cpm4
 eYwBT9D76hc7iyS8pBIg+kZq0Q3w8zgmsIUqlD2rPpgaXTp7wqXLYV0zPYx3Y7IkEW08
 YhaaCAowltyV/Nyn9M35U2s+tCy8dtvURgNEOgeX+J/HBNfAyRgka/5ZziEylyRpl/nh
 lgN7e/DTXSD2cgbhxPMrPBe2TRqbfU+GCu+bIafodERdK+a2lhDDEhLZOp75OxMPD4kt
 4ceyhB+eRjXervyHG+fmm32EGAMnhI4qo/mr0PJ1reM3+k2Q67Uj0nM+ntA7S2kaL89A
 rZjg==
X-Gm-Message-State: ACgBeo11cH75rjmNf/px+FG6EZ6I6pzabDtwhTDV+xI4SC1FG9Apj5A4
 Yt6iz8qToD4cxVrq3YWo9wA=
X-Google-Smtp-Source: AA6agR5Now0GlaC9p5MWRyZT/Uc6WkRd+5NRB4I7ljhPTH6IshCkE/HR/M28GX+goQncDQyVAAYQYQ==
X-Received: by 2002:a05:651c:1241:b0:261:9313:9cb9 with SMTP id
 h1-20020a05651c124100b0026193139cb9mr1021791ljh.213.1660625769185; 
 Mon, 15 Aug 2022 21:56:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:16ee:fa00::9?
 (dc73szyyyyyyyyyyyyyft-3.rev.dnainternet.fi. [2001:14ba:16ee:fa00::9])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac24429000000b0048a7b1530cesm1254427lfl.284.2022.08.15.21.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 21:56:08 -0700 (PDT)
Message-ID: <57c312b3-ca5b-6efb-6356-43b6513a0c88@gmail.com>
Date: Tue, 16 Aug 2022 07:56:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <cover.1660292316.git.mazziesaccount@gmail.com>
 <166057828406.697572.228317501909350108.b4-ty@kernel.org>
 <YvpsRbguMXn74GhR@pendragon.ideasonboard.com>
 <Yvp1Qkuh7xfeb/B2@sirena.org.uk>
 <YvqV9Mq6I3gXQaf2@pendragon.ideasonboard.com>
 <20220815205857.308B1C433D6@smtp.kernel.org>
 <Yvq33T+XCduoqv7Z@pendragon.ideasonboard.com>
 <YvrO+velKdYdGVve@sirena.org.uk>
From: Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Devm helpers for regulator get and enable
In-Reply-To: <YvrO+velKdYdGVve@sirena.org.uk>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Michael Turq uette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-doc@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-iio@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Alexandru Ardelean <aardelean@deviqon.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>,
 Jean Delvare <jdelvare@suse.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Aswath Govindraju <a-govindraju@ti.com>, linux-amlogic@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 =?UTF-8?Q?Nuno_S=c3=a1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi dee Ho Mark, Laurent, Stephen, all

On 8/16/22 01:55, Mark Brown wrote:
> On Tue, Aug 16, 2022 at 12:17:17AM +0300, Laurent Pinchart wrote:
>> On Mon, Aug 15, 2022 at 01:58:55PM -0700, Stephen Boyd wrote:
> 
>> You will very quickly see drivers doing this (either directly or
>> indirectly):
> 
>> probe()
>> {
>> 	devm_clk_get_enabled();
>> 	devm_regulator_get_enable();
>> }
> 
>> Without a devres-based get+enable API drivers can get the resources they
>> need in any order, possibly moving some of those resource acquisition
>> operations to different functions, and then have a clear block of code
>> that enables the resources in the right order.

I agree. And I think that drivers which do that should stick with it. 
Still, as you know the devm-unwinding is also done in well defined 
order. I believe that instead of fighting against the devm we should try 
educate people to pay attention in the order of unwinding (also when not 
handled by the devm. Driver writers occasionally break things also w/o 
devm for example by freeing resources needed by IRQ handlers prior 
freeing the IRQ.)

If "purging" must not be done in reverse order compared to the 
aquisition - then one should not use devm. I know people have done 
errors with devm - OTOH, I've seen devm also fixing bunch of errors.

>> These devres helpers give
>> a false sense of security to driver authors and they will end up
>> introducing problems, the same way that devm_kzalloc() makes it
>> outrageously easy to crash the kernel by disconnecting a device that is
>> in use.

I think this is going a bit "off-topic" but I'd like to understand what 
is behind this statement? From device-writer's perspective - I don't 
know much better alternatives to free up the memory. I don't see how 
freeing stuff at .remove would be any better? As far as I understand - 
if someone is using driver's resources after the device has gone and the 
driver is detached, then there is not much the driver could do to 
free-up the stuff be it devm or not? This sounds like fundamentally 
different problem (to me).

> TBH I think the problem you have here is with devm not with this
> particular function.

I must say I kind of agree with Mark. If we stop for a second to think 
what would the Laurent's example look like if there were no 
devm_regulator_get_enable() provided. I bet the poor driver author could 
have used devm_clk_get_enabled() - and then implemented a .remove for 
disabling the regulator. That would be even worse, right?

> That's a different conversation, and a totally
> valid one especially when you start looking at things like implementing
> userspace APIs which need to cope with hardware going away while still
> visible to userspace.

This is interesting. It's not easy for me to spot how devm changes 
things here? If we consider some removable device - then I guess also 
the .remove() is ran only after HW has already gone? Yes, devm might 
make the time window when userspace can see hardware that has gone 
longer but does it bring any new problem there? It seems to me devm can 
make hitting the spot more likely - but I don't think it brings 
completely new issues? (Well, I may be wrong here - wouldn't be the 
first time :])

> It's *probably* more of a subsystem conversation
> than a driver one though, or at least I think subsystems should try to
> arrange to make it so.


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

Discuss - Estimate - Plan - Report and finally accomplish this:
void do_work(int time) __attribute__ ((const));
