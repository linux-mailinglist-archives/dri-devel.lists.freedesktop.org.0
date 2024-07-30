Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D186940E25
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 11:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDDB610E242;
	Tue, 30 Jul 2024 09:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="SUfyqnc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C773710E242
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 09:44:16 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2f035ae0fd1so53302071fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1722332655; x=1722937455;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5X+3I4mAhhgELVJxXkRcesSsn8t1Uglvy6fHEbHplYo=;
 b=SUfyqnc1GGNfrDihYuI7gHvbnDJ/I+NCoPDAR5S9j4AzjFdy1Kg+Kd0gjY/dzOyd0Q
 kdErUeEcnaCBQDwcZQ4vroJKYctB3Ez1oNV0fUojaSpG7ywVcPc4EfKZKKVTeDili0fS
 OzHIvVIgQIhqn2RgJyo4jTe9buw6uEalbQdPfRJt3PmXQGTnlYIYa7kmGSoMXfd6CKvS
 kpIJ1SD0w5q5fgcBHH9V7wa5u4L15CrCUh6hmn1mR+hfm0e56sfa3Qt4kdgqbX65PG5k
 uFZbGAQciMDe2619u+OtSjrc85+MhB2tc9qNeQlxwp8THiQzhB8LavCZN8QzkIW5Tkfo
 GLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722332655; x=1722937455;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5X+3I4mAhhgELVJxXkRcesSsn8t1Uglvy6fHEbHplYo=;
 b=IMyv/wBP2+p/DZXLCNYH8LV9MXVQ48OmPb8UdoiYaYF7D4pwV4Vb7TbVbDd1M6LvS4
 kmg+uNckOO7zSzM0XKDZJO4jiZLdyJkIZ1XfJG0aCmEOCBQCrNly4+MGzZrzbM5ZCWfl
 4V+LhcJHqDwaZDE894HWliQROY2a/NWdDlMA8iPkVyKFgVTEL9crch5JgmufzNe5EQFJ
 mdpkTiA23XYwCGoMJblrIEBX7VpOMS2AakEmXStyItGu7zHumzC/JPb9o5C6UbfBYz6p
 Lr8m4Kcjr5cBtNjK5QW5MGiuryxMeZJ9jXQDqcxOOgcTzQ7XuL3999UuV60KYtWmFUc9
 AwUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWjxmn37YhmGyA5XuwPdOnGj4OkzxjqdEw8fVneGfw8dP3fOiEBupqMU0kELKwF1/jT6k6PoxCxmoq8n12tH7iKhw9eYr6kSHAbSwT3+/WJ
X-Gm-Message-State: AOJu0YwNdxe6USYYG6mKOaWLPlRptM99xcI/3m8dzljU+1le9y8MFB+N
 fISbrO817pBHcRN4CFnMdGnYN5f/ET+m9WlFKJ36sh2APy/zUCuGYHj+GVkKIvc=
X-Google-Smtp-Source: AGHT+IFGitPFeg1TtD5PxVR6e9euX4p9+GtT4nUgoRZzzijx1d+UmVOFUGYjkijvYVa4yae+Rk4Ibg==
X-Received: by 2002:a2e:88c1:0:b0:2ec:2d75:509c with SMTP id
 38308e7fff4ca-2f12ee69f13mr63361281fa.46.1722332654704; 
 Tue, 30 Jul 2024 02:44:14 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42805730bd0sm211904295e9.10.2024.07.30.02.44.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 02:44:14 -0700 (PDT)
Message-ID: <996d24d0-0541-4784-945d-fbadbb66e128@freebox.fr>
Date: Tue, 30 Jul 2024 11:44:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: add TI TDP158
To: Maxime Ripard <mripard@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
References: <20240627-tdp158-v3-0-fb2fbc808346@freebox.fr>
 <20240627-tdp158-v3-1-fb2fbc808346@freebox.fr>
 <20240701-bug-of-great-honeydew-cfb6ef@houat>
 <e55d0f0e-a104-4790-b832-120dbddd93ad@freebox.fr>
 <20240715-stirring-purple-toad-7de58c@houat>
 <c302bc47-6492-44af-86a1-3ff6a815e314@freebox.fr>
 <20240730-eminent-venomous-condor-8ef421@houat>
 <CAA8EJprQJJ2AuB99RFU+d074PV+NHMPwjFWn_auju7HYQQ8R7w@mail.gmail.com>
 <20240730-miniature-wonderful-okapi-01aa0f@houat>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <20240730-miniature-wonderful-okapi-01aa0f@houat>
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

On 30/07/2024 11:30, Maxime Ripard wrote:
> On Tue, Jul 30, 2024 at 11:46:24AM GMT, Dmitry Baryshkov wrote:
>> On Tue, 30 Jul 2024 at 11:27, Maxime Ripard <mripard@kernel.org> wrote:
>>> On Wed, Jul 24, 2024 at 07:59:21PM GMT, Marc Gonzalez wrote:
>>>> On 15/07/2024 16:40, Maxime Ripard wrote:
>>>>> On Thu, Jul 04, 2024 at 07:04:41PM GMT, Marc Gonzalez wrote:
>>>>>> On 01/07/2024 15:50, Maxime Ripard wrote:
>>>>>>
>>>>>>> The i2c register access (and the whole behaviour of the device) is
>>>>>>> constrained on the I2C_EN pin status, and you can't read it from the
>>>>>>> device, so it's also something we need to have in the DT.
>>>>>>
>>>>>> I think the purpose of the I2C_EN pin might have been misunderstood.
>>>>>>
>>>>>> I2C_EN is not meant to be toggled, ever, by anyone from this planet.
>>>>>
>>>>> Toggled, probably not. Connected to a GPIO and the kernel has to assert
>>>>> a level at boot, I've seen worse hardware design already.
>>>>>
>>>>>> I2C_EN is a layout-time setting, decided by a board manufacturer:
>>>>>>
>>>>>> - If the TDP158 is fully configured once-and-for-all at layout-time,
>>>>>> then no I2C bus is required, and I2C_EN is pulled down forever.
>>>>>>
>>>>>> - If the board manufacturer wants to keep open the possibility
>>>>>> to adjust some parameters at run-time, then they must connect
>>>>>> the device to an I2C bus, and I2C_EN is pulled up forever.
>>>>>
>>>>> How do you express both cases in your current binding?
>>>>
>>>> It's not that I'm ignoring your question.
>>>>
>>>> It's that I don't understand what you're asking.
>>>
>>> And that's fine, you just need to say so.
>>>
>>> Generally speaking, you're focusing on the driver. The driver is not the
>>> issue here. You can do whatever you want in the driver for all I care,
>>> we can change that later on as we wish.
>>>
>>> The binding however cannot change, so it *has* to ideally cover all
>>> possible situations the hardware can be used in, or at a minimum leave
>>> the door open to support those without a compatibility breakage.
>>>
>>> That's why I've been asking those questions, because so far the only
>>> thing you've claimed is that "I can't test the driver for anything
>>> else", but, again, whether there's a driver or not, or if it's
>>> functional, is completely missing the point.
>>>
>>>> SITUATION 1
>>>> tdp158 is pin strapped.
>>>> Device node is child of root node.
>>>> Properties in proposed binding are valid (regulators and power-on pin)
>>>> Can be supported via module_platform_driver.
>>>>
>>>> SITUATION 2
>>>> tdp158 is sitting on I2C bus.
>>>> Device node is child of i2c bus node.
>>>> (robh said missing reg prop would be flagged by the compiler)
>>>> Properties in proposed binding are valid (regulators and power-on pin)
>>>> Supported via module_i2c_driver.
>>>>
>>>> If some settings-specific properties are added later, like skew,
>>>> they would only be valid for the I2C programmable mode, obviously.
>>>
>>> I think there's a couple more combinations:
>>>
>>>   - The device is connected on an I2C bus, but I2C_EN is tied low
>>
>> No, this is not possible. I2C pins are repurposed if I2C_EN is low.
>> You can not call that an i2c bus anymore.
>>
>>>   - The device is connected on an I2C bus, but I2C_EN is connected to a
>>>     GPIO and the kernel needs to assert its state at boot.
>>
>> This is a pretty strange configuration.  The I2C_EN pin isn't supposed
>> to be toggled dynamically. Anyway, if that happens, I'd use pinctrl /
>> hog to control the pin.
> 
> ACK. I still believe it would be valuable, but I don't really want to be
> part of that conversation anymore. Marc, do whatever you want.

OK.

I'll send the v4 sitting in my queue.

Regards

