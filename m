Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E180F829C8B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 15:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA9610E5C9;
	Wed, 10 Jan 2024 14:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 875A110E5C9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 14:28:51 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6dddba43d70so1460901a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704896930; x=1705501730; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=zIaoX1yjQhXHbsmhohdAZwhtmgurjO4w2Fx+LKGYccs=;
 b=Xmmdd1I458HYSomDENTMT7WbY9YMFnDU3efXucK5bR6k/xyWAJn9cUxymM2mz648Rg
 TOP1S8wXb3X7COh7ZZBeZM0s8KcBUPHeXsnOuUxXMBmODb/l4gXB1SbeyC+1oO8u/LnM
 VX3ifFx9iRFK1NlLQJt8LADHL3q3TQd4cbuL4TrwurOp4yFZKMAvUERGpyINXNDTKa1p
 bczphAmC/tbpVwd/s85vVW2bl0g9LVshgJLjPSHNOsqh/wy4hVZ7WnWyRGNtfKbAV8d3
 ueltY6AxPZSmEkldgNrDNAKT+jgwV1NAXnT/4nkWiWmwciEUWfkRn0FPMQE+b6i9c8i5
 g6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704896930; x=1705501730;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zIaoX1yjQhXHbsmhohdAZwhtmgurjO4w2Fx+LKGYccs=;
 b=acH6yf2HCbUogy+tOsmcxiWg2lA6BFIn1U5/P3DefdkOjfdxzQM6bb7JhcpUZQG6iP
 jJ+Oqv94rLvDf0FfvT90fJhVqjQOvljCg47zq+yYzOLyDbQjHAToZOqSVriGEtkXhBtf
 jaZHwKoiAgytuMJGmoDvihx0LMXNLWkFOXrPMFIpbTZKODMHGwUeRJmOw1pwNj+5Oudg
 9eB/C9nB67PcgIQeOhGxdtGWEKGcAEbEaGPBwlnn2PgUxo+DAB/W0DP4RMe0aCoQf3ZL
 0U8qiwgxz2Ha/3a7Hh5ryzgeW8/fFZH7jqsmoGUpQKDWY4fYBpoVvXCfx1nXwb5O2kgL
 6EOA==
X-Gm-Message-State: AOJu0YypuWhZEwRBawrTav9GJWvymLNPAzgtqT67wQ4MjrY+o3Z+tX0b
 6zp+ybohvv11qkpZIzFwiUg=
X-Google-Smtp-Source: AGHT+IG7sLERgE1XfKcrO3RXf8zO3OfNiwPA15eOOZxyAfLlJXqm615gjKSh1CGFCVXN4fmaNYQHXQ==
X-Received: by 2002:a05:6871:4319:b0:203:ceec:933c with SMTP id
 lu25-20020a056871431900b00203ceec933cmr845505oab.69.1704896930388; 
 Wed, 10 Jan 2024 06:28:50 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 x190-20020a6363c7000000b005cd945c0399sm3608310pgb.80.2024.01.10.06.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:28:49 -0800 (PST)
Message-ID: <a854bbd3-2862-4ea4-b14d-aab2d89ac2df@roeck-us.net>
Date: Wed, 10 Jan 2024 06:28:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE v6 26/37] dt-bindings: vendor-prefixes: Add smi
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <c8aaf67e3fcdb7e60632c53a784691aabfc7733e.1704788539.git.ysato@users.sourceforge.jp>
 <20240109-fructose-bundle-05d01033277b@spud>
 <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAMuHMdU1z64QHJOVd3jUsOfyuDApB1+khkUV8PvjoKbwsi327g@mail.gmail.com>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Baoquan He <bhe@redhat.com>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 03:23, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Tue, Jan 9, 2024 at 7:06 PM Conor Dooley <conor@kernel.org> wrote:
>> On Tue, Jan 09, 2024 at 05:23:23PM +0900, Yoshinori Sato wrote:
>>> Add Silicon Mortion Technology Corporation
> 
> Motion
> 
>>> https://www.siliconmotion.com/
>>>
>>> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
>>> ---
>>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> index 94ed63d9f7de..a338bdd743ab 100644
>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>> @@ -1283,6 +1283,8 @@ patternProperties:
>>>       description: Skyworks Solutions, Inc.
>>>     "^smartlabs,.*":
>>>       description: SmartLabs LLC
>>> +  "^smi,.*":
>>> +    description: Silicon Motion Technology Corporation
>>
>> How come "smi" is used for a company with this name?
>> Why is it not something like SMTC? There's probably some history here
>> that I am unaware of.
> 
> See Documentation/devicetree/bindings/display/sm501fb.txt
> The stock ticker is "SIMO", though.
> https://www.nasdaq.com/market-activity/stocks/simo
> 

 From https://en.wikipedia.org/wiki/Silicon_Motion:

"Controllers are marketed under the “SMI” brand,
  enterprise-grade SSDs under the "Shannon Systems" brand.
"

Guenter

