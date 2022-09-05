Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 419DB5ADB25
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 00:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0AA10E3DA;
	Mon,  5 Sep 2022 22:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD69810E3DA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 22:09:09 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id y29so9632487pfq.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 15:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=7X66Mhu89Nd1JC1tC2C3GiFsxMesGQdlZVFrlo9aYm8=;
 b=b7jRxWPyK0Rq4w8FR9ZFdzOAagpu8Ly97+vIsJC3Zr3BYQL9lMVB+ShDYBZ2D8gDRn
 iG42XCqTvMR/etwnUxtVq4dc6kjBUmYkBG8G+Uq0g4SiQD+aD7FdS44c68HxkrxInjmX
 rQwIEiXivv7vBIj5Sf8Y65QbFkdKpO+b+xgFODtb9auHWLSyyRIc9buVgrGAtV6dAmSk
 vw5WAxq8xcLg9s7lPX4OmewpOzfHhIQkLGIRLhUtapokGcK0j0Egcpyqr1AShiOI+SGy
 eWqxW4Icxyq7dn3JsNejnG/2tlPR6tqehYrDr8AxyduISs7Ol7B5gyVkSMCzO9kplR/h
 RRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=7X66Mhu89Nd1JC1tC2C3GiFsxMesGQdlZVFrlo9aYm8=;
 b=Ml8zuwumNWV0apzoHVU5sfeEU3YDhJaY/ARvpmCEkMLo3EKNvUNLw2vkjtE3biMVVZ
 MxzS/iv2R+ZHv8RlcC79fLxjo2Vnyc8HEAlh/vePfzKjNJqgOvxmyU6N0yVzSKPel8Fa
 HgwUZqIWvbjlO+Xdk7OvoKaDaydwMGIDdjkeY/5V32krQRZ2L+ltZqHFtaVHp+YDq+Ep
 lrbqiUv0ZVtvRtn6q6OETJA5IuKNoCmD1r/xbeghQHuAWwJjAdejbY5HhMjQ1i6w3sun
 O7RpUoJPxFwxJXlQmL2HQZQZFfwEVvaiyGeWOUoH4p3b5FfIvrPsq54lBSBKQDJXW6rl
 ZqWw==
X-Gm-Message-State: ACgBeo0ysWX27t0+mLWQ7zZI3eQhNyvkDa461nTBew9ND4b2uBPGI7Uo
 dha1vBJu8YokEwf17hckUgg=
X-Google-Smtp-Source: AA6agR6Eea0J+fyHn4cnB8pX01mZJQu8GcEqrT2a0QWMcFiUqA9q20U0tI3FWNDXq+ZYzlcm5H9Qbw==
X-Received: by 2002:a63:6e09:0:b0:430:663:7757 with SMTP id
 j9-20020a636e09000000b0043006637757mr24953820pgc.340.1662415749460; 
 Mon, 05 Sep 2022 15:09:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a170902ce8900b00176b8f587efsm2127192plg.148.2022.09.05.15.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 15:09:08 -0700 (PDT)
Message-ID: <73749107-35aa-0720-1a30-02a90c0540fa@roeck-us.net>
Date: Mon, 5 Sep 2022 15:09:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 10/11] watchdog: bd9576_wdt: switch to using
 devm_fwnode_gpiod_get()
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-10-b29adfb27a6c@gmail.com>
 <CAHp75Vd35EOy=mP25=9fmYfqQnbafgotHw1fxk-TdGk6Oc8g8Q@mail.gmail.com>
 <75e60144-9fa2-d6ba-bc92-edd23f7e7189@roeck-us.net>
 <CAHp75VcisCTYoRp-=713YKtwi7BQyPKGiUhF4DkpfAFtvDXCiQ@mail.gmail.com>
 <c696b9bf-d0ce-1c6a-0ee3-939b180891be@roeck-us.net>
 <YxZSUlCPEE9o/s4G@google.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <YxZSUlCPEE9o/s4G@google.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, David Airlie <airlied@linux.ie>,
 linux-pci <linux-pci@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB <linux-usb@vger.kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/5/22 12:47, Dmitry Torokhov wrote:
[ ... ]
>> We know that count is either 1 or 2 here, so strictly speaking
>> 	if (count == 1) {
>> 	} else {
>> 	}
>> would be sufficient. On the other side, that depends on ARRAY_SIZE() being
>> exactly 2, so
>> 	if (count == 1) {
>> 	} else if (count == 2) {
>> 	}
>> would also make sense. Either way is fine with me. I'll leave it up
>> to Dmitry to decide what he wants to do.
> 
> My goal is to drop usage of devm_gpiod_get_from_of_node(), beyond that I
> do not have strong preferences either way really. It is probing code, so
> performance is not critical, but I'm obviously satisfied with how the
> code looks now, or I would not have sent it.
> 

Good point.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>
