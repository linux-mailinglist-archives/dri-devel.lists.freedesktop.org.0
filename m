Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331998119E0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 17:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77C1A10E08A;
	Wed, 13 Dec 2023 16:44:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521F10E08A
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 16:44:32 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c55872d80so10622835e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 08:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702485871; x=1703090671; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xr6toAXCsIC/bmSJ5B/sgzDjMz3Z0Uajw+zCN70ZLA8=;
 b=Z84qWVFkMJ6uktwrLFJNewP/VJYZoqNVi5Li4nlnDR7snwrTQIfM1f5i6P79B1nkbz
 URWhcpef3KB0esHjcjCqEH09m4dwwLzqwqm8b/hpvc1W8UgAZ8T7AzIT8s96lZ0dJxwD
 3a6GFgfuOdBtBhSw4j7B5+J9s2LruIqfyvreW12dZq9kJXAf8e9gDp6zQ1/tfB4YPrff
 4699Vxlw0RLo81miSIz4hcy0Kq2aqLK/lrDpxiUHS1Qm6UF4yIvEv1wOvuu6TeQg8bcs
 VeCLUuyOdTHY6c9Mvfoxi++JYlooTUui5tA80x/3seM0pQ6SXH85a2BwXnENiDUoEvK9
 aGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485871; x=1703090671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xr6toAXCsIC/bmSJ5B/sgzDjMz3Z0Uajw+zCN70ZLA8=;
 b=QeBImwR65BkS8rjAxIzGCGU/iS55AHvWbM0f3YCH36MODXljdVmEz80/h7peZCK8A4
 hqbRIA6J8d4+4ehJ1N0CYhEqd3f6fQY7SoIcMcAbelGHcSBJ+grlD5YznPagBzW7Jno4
 6/9vRQ7RdM+7SDNuQQK61NE6uSdzMBgUOL0Q+2IqhkXYp6x3GbxIsQ4bN0w5BuRj9CdM
 6u5iisjHkgjFLWnkP9y1dCD9b4DoMgq7sB1AqyAx0B+imMio6441fv40i7Hgqo5h+T9X
 HApOQEoiXckNQqTdYvwPdYJtjhVN6/v46bVaHQwExSW3wtoIThwOnXkYZ0o/iaMszftN
 Vaog==
X-Gm-Message-State: AOJu0YxOy/X4y9N8NIdYktyBSuwxadTAAJ02fr4hVWkJhEROrEJ32/cu
 SUAkHsFu/X1QGz7rPKrUpKP0hA==
X-Google-Smtp-Source: AGHT+IHmb8ewYnbRlq6v/5rMQRoMcMWRfLl01skabFTAXrcQx6eTujOz4Paqf/1jHchf7eivqMmEQQ==
X-Received: by 2002:a05:600c:2246:b0:40b:2a46:6f1 with SMTP id
 a6-20020a05600c224600b0040b2a4606f1mr4313509wmm.2.1702485870981; 
 Wed, 13 Dec 2023 08:44:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59?
 ([2a01:e0a:982:cbb0:ac4e:a5fe:7f71:8d59])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a5d58c4000000b0033333bee379sm13767115wrf.107.2023.12.13.08.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 08:44:30 -0800 (PST)
Message-ID: <212239ae-60ab-46f3-a838-39a4d61091fe@linaro.org>
Date: Wed, 13 Dec 2023 17:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: Make clk_rate_exclusive_get() return void
Content-Language: en-GB
To: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
References: <cover.1702400947.git.u.kleine-koenig@pengutronix.de>
 <ki5n3rz5n4oxj2hhc3rj6xpn3e2tdi7fcp2q7exjbzilrlqflp@przautvhuy4g>
 <20231213074300.4bq7wkfqd4jhhcr4@pengutronix.de>
 <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <2nvbag657mlniqwq7fbilapc6vfw5qumab3yd6bqul25ot6wcn@wdlkh5az2fgs>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Chen-Yu Tsai <wens@csie.org>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 linux-arm-kernel@lists.infradead.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-sunxi@lists.linux.dev,
 kernel@pengutronix.de, linux-pm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Johan Hovold <johan+linaro@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Georgi Djakov <djakov@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Le 13/12/2023 à 09:36, Maxime Ripard a écrit :
> Hi,
> 
> On Wed, Dec 13, 2023 at 08:43:00AM +0100, Uwe Kleine-König wrote:
>> On Wed, Dec 13, 2023 at 08:16:04AM +0100, Maxime Ripard wrote:
>>> On Tue, Dec 12, 2023 at 06:26:37PM +0100, Uwe Kleine-König wrote:
>>>> clk_rate_exclusive_get() returns zero unconditionally. Most users "know"
>>>> that and don't check the return value. This series fixes the four users
>>>> that do error checking on the returned value and then makes function
>>>> return void.
>>>>
>>>> Given that the changes to the drivers are simple and so merge conflicts
>>>> (if any) should be easy to handle, I suggest to merge this complete
>>>> series via the clk tree.
>>>
>>> I don't think it's the right way to go about it.
>>>
>>> clk_rate_exclusive_get() should be expected to fail. For example if
>>> there's another user getting an exclusive rate on the same clock.
>>>
>>> If we're not checking for it right now, then it should probably be
>>> fixed, but the callers checking for the error are right to do so if they
>>> rely on an exclusive rate. It's the ones that don't that should be
>>> modified.
>>
>> If some other consumer has already "locked" a clock that I call
>> clk_rate_exclusive_get() for, this isn't an error. In my bubble I call
>> this function because I don't want the rate to change e.g. because I
>> setup some registers in the consuming device to provide a fixed UART
>> baud rate or i2c bus frequency (and that works as expected).
> 
> I guess it's a larger conversation, but I don't see how that can
> possibly work.
> 
> The way the API is designed, you have no guarantee (outside of
> clk_rate_exclusive_*) that the rate is going to change.
> 
> And clk_rate_exclusive_get() doesn't allow the rate to change while in
> the "critical section".
> 
> So the only possible thing to do is clk_set_rate() +
> clk_rate_exclusive_get().

There's clk_set_rate_exclusive() for this purpose.

> 
> So there's a window where the clock can indeed be changed, and the
> consumer that is about to lock its rate wouldn't be aware of it.
> 
> I guess it would work if you don't care about the rate at all, you just
> want to make sure it doesn't change.
> 
> Out of the 7 users of that function, 3 are in that situation, so I guess
> it's fair.
> 
> 3 are open to that race condition I mentioned above.
> 
> 1 is calling clk_set_rate while in the critical section, which works if
> there's a single user but not if there's multiple, so it should be
> discouraged.
> 
>> In this case I won't be able to change the rate of the clock, but that
>> is signalled by clk_set_rate() failing (iff and when I need awother
>> rate) which also seems the right place to fail to me.
> 
> Which is ignored by like half the callers, including the one odd case I
> mentioned above.
> 
> And that's super confusing still: you can *always* get exclusivity, but
> not always do whatever you want with the rate when you have it? How are
> drivers supposed to recover from that? You can handle failing to get
> exclusivity, but certainly not working around variable guarantees.
> 
>> It's like that since clk_rate_exclusive_get() was introduced in 2017
>> (commit 55e9b8b7b806ec3f9a8817e13596682a5981c19c).
> 
> Right, but "it's always been that way" surely can't be an argument,
> otherwise you wouldn't have done that series in the first place.
> 
>> BTW, I just noticed that my assertion "Most users \"know\" that
>> [clk_rate_exclusive_get() returns zero unconditionally]" is wrong. As of
>> next-20231213 there are 3 callers ignoring the return value of
>> clk_rate_exclusive_get() and 4 that handle (imaginary) returned errors.
>> I expected this function to be used more extensively. (In fact I think
>> it should be used more as several drivers rely on the clk rate not
>> changing.)
> 
> Yes, but also it's super difficult to use in practice, and most devices
> don't care.
> 
> The current situation is something like this:
> 
>    * Only a handful of devices really care about their clock rate, and
>      often only for one of their clock if they have several. You would
>      probably get all the devices that create an analog signal somehow
>      there, so audio, display, i2c, spi, uarts, etc. Plus the ones doing
>      frequency scaling so CPU and GPUs.
> 
>    * CPUs and GPUs are very likely to have a dedicated clock, so we can
>      rule the "another user is going to mess with my clock" case.
> 
>    * UARTs/i2c/etc. are usually taking their clock from the bus interface
>      directly which is pretty much never going to change (for good
>      reason). And the rate of the bus is not really likely to change.
> 
>    * SPI/NAND/MMC usually have their dedicated clock too, and the bus
>      rate is not likely to change after the initial setup either.
> 
> So, the only affected devices are the ones generating external signals,
> with the rate changing during the life of the system. Even for audio or
> video devices, that's fairly unlikely to happen. And you need to have
> multiple devices sharing the same clock tree for that issue to occur,
> which is further reducing the chances it happens.

Well, thanks for HW designers, this exists and some SoCs has less PLLs than
needed, and they can't be dedicated for some hw blocks.

> 
> Realistically speaking, this only occurs with multi-head display outputs
> where it's somewhat likely to have all the display controllers feeding
> from the same clock, and the power up of the various output is done in
> sequence which creates that situation.
> 
> And even then, the clk_rate_exclusive_* interface effectively locks the
> entire clock subtree to its current rate, so the effect on the rest of
> the devices can be significant.
> 
> So... yeah. Even though you're right, it's trying to address a problem
> that is super unlikely to happen with a pretty big hammer that might be
> too much for most. So it's not really surprising it's not used more.

Honestly I tried my best to find a smart way to set the DSI clock tree
with only 2 endpoints of the tree, but CCF will explore all possibilities
and since you cannot set constraints, locking a sub-tree is the smartest
way I found.
In this case, the PLL is common between the DSI controller and video generator,
so to keep the expected clock ratio, the smart way is to set the freq on
one side, lock the subtree and set the rate on the other side.
An API permitting to set multiple rates to multiple clocks in a single call
would be the solution, but not sure if we could possibly write such algorithm.

> 
> Maxime

Neil
