Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15FB5158D0
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 01:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3670710E46B;
	Fri, 29 Apr 2022 23:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92CC510E46B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 23:09:26 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id z8so10054907oix.3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 16:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=43bhXKjvki5l9d/uYFdijwNa1GUErzr1H3q463hR+XU=;
 b=OUSt6wkRUbg0ovBrwSGrseeTfVqA3atJE26IGGL8DNDKMbVWyzV7fWqixesYb9S/mA
 rgBp/vgWVmZ/2SlxqdaVKFisC/DX2eo4pEgNEmTUveV61siwDvexnXReKJ4KInzJ+JVf
 qFRYIk57Zf7KE5IqQd6E9kuwLyNvXqeY18u9sXPldsZHCbpZQ9kw31XwNt/jpYsmggt1
 3DzogSdIaSMtewj0hqjuAW3EwbG0+z+yCYsMAftASTL8pYSQ3/TIzpEEpEvE1aCdKITD
 c0o8+XWDHiHzhST5JtA4/c6tGuJLD552k5cdjIV4SeeCvbAOGItN9qS8zGZ2A17U8O+I
 msTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=43bhXKjvki5l9d/uYFdijwNa1GUErzr1H3q463hR+XU=;
 b=SW7dYdQK/oLd1rFvQidVGq1fPIMX3aVbxEurOy5GX7x0g1NkZgVPz5zeZbm/XWk4yf
 tpDFOZLIuSwYHkkZTunp5rnL5EUVzYTPdJYRNEb1JbDbCYhpyg5MfdT908xyXj491gXE
 T9a2QRahC+d6jY6hXJ108Xw+sPc/tVJCTAB/9Rkay8Iw94iKh+hMG1mst8F6zVxyKBe/
 NemB0LYVCrG+LG8grwO1Gl4c4If//7aQ10vrPOeuOqc0uiVeVj8nsMgNuZ8b81AWenPU
 13xHRUs/sMbLrBclGEoPl2SScZt5CTMDoEF4LGpdYe26CQOpj+HqGXkDacNNRbo2WJgQ
 L/LQ==
X-Gm-Message-State: AOAM531Oaom3RCPMH3Q+N4hxQ9IPYYOBeOle8tfKH/aJyV6SOfLJy+mo
 mnLG2gP8hNVlga7WKrTw20A=
X-Google-Smtp-Source: ABdhPJwXwAJF7RkFvU52UI/VP0gJxz700pwOLyrX7CYTkoQTpT4bc4rvMjOD84iMZwh8LrG+2Nl3bg==
X-Received: by 2002:a05:6808:17a7:b0:325:c561:31fb with SMTP id
 bg39-20020a05680817a700b00325c56131fbmr1544693oib.75.1651273765807; 
 Fri, 29 Apr 2022 16:09:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a9d77c1000000b0060603221242sm230484otl.18.2022.04.29.16.09.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 16:09:24 -0700 (PDT)
Message-ID: <149509dd-f43d-1b27-4395-81eab4ff3455@roeck-us.net>
Date: Fri, 29 Apr 2022 16:09:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 00/48] ARM: PXA multiplatform support
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
References: <20220419163810.2118169-1-arnd@kernel.org>
 <20220422170530.GA2338209@roeck-us.net>
 <CAK8P3a3V=qxUqYT3Yt=dpXVv58-Y+HVi952wO6D4LPN5NNphGA@mail.gmail.com>
 <8b36d3a4-ec85-2f9f-e4b7-734d8ddd3d8f@roeck-us.net>
 <CAK8P3a0R9cpEb1d2=e9KnGSbi_uRv48RWfCu_J4DDak_cGZSuw@mail.gmail.com>
 <20220422234150.GA3442771@roeck-us.net>
 <CAK8P3a3qZdEqnJ2nTOKwDMossngOgCpEvZq4cQMPQjSsUoU=6g@mail.gmail.com>
 <3b4046ed-fd75-13ea-fac3-06469172806c@roeck-us.net>
 <CAK8P3a1LzEG1vo+5nMrnL3TOMcbSKJ3u=StcfY8dajV2raUBjA@mail.gmail.com>
 <3df135a2-17f5-d6c6-b4a8-e1a60e254297@roeck-us.net>
 <CAK8P3a2EHMQPN4ny9sXXuReFG0jN0hyRV7h9v_AR_0pqpOU41w@mail.gmail.com>
 <CAK8P3a09+nFS3g1rgvTW9da3tMiAhHjkjZVs1QOJOj8TJ-9MDg@mail.gmail.com>
 <6f1b27fa-96d1-4be7-ac6a-762610314f2a@roeck-us.net>
 <8d6d453a-e6fc-439b-2f34-e60c22fc9e98@roeck-us.net>
 <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <CAK8P3a2Ekvis1YcrJZtuga+XQdbeTC98PkOszCpS2DiZri7VMQ@mail.gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, USB list <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Helge Deller <deller@gmx.de>, Marek Vasut <marek.vasut@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, Sergey Lapin <slapin@ossfans.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 14:46, Arnd Bergmann wrote:
> On Fri, Apr 29, 2022 at 10:23 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 4/29/22 10:48, Guenter Roeck wrote:
>>>
>>> I tried the pxa-multiplatform-5.18 branch. Its failures match
>>> those in v5.18-rc1.
>>>
>>
>> Uuh, wait, the build wasn't complete. There are still some
>> failures. I'll report later.
> 
> Sorry about the breakage, I got a few more reports about minor build errors
> and warnings, the newly uploaded branches should address all of the ones
> I got reports for.
> 

Unless I am missing something the failures are the same as before. See
https://kerneltests.org/builders/qemu-arm-testing/builds/74/steps/qemubuildcommand/logs/stdio

This is with v5.18-rc1-49-ge8ab9a9a2745 which is the tip of
soc/pxa-multiplatform-5.18.

Should I check a different branch ?

Thanks,
Guenter
