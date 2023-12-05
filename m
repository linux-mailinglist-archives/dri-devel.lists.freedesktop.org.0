Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26AA680562C
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220210E536;
	Tue,  5 Dec 2023 13:37:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AEEF10E533
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:37:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id A795E580992;
 Tue,  5 Dec 2023 08:37:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Tue, 05 Dec 2023 08:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1701783435; x=1701790635; bh=MS
 o40/DzILPmk4fVztq26tP1UcAt4IZ5edthROYfIeQ=; b=r5lP/X9E6buMpTEZuP
 JJMjDISS1eV5fPT9mu4cFAHezhRutGQYOb6IkM9C/acwC3xpfzMBeTyNg8sC6XW2
 LcSoc7vYgiIBEWD+MsSs731PRrT/PaOlRpJV2OkowdU/JiLnPKsRdmSULsVlm/FT
 15cRLw3HIF7+HT52H9hb48jk64skDVVU2YO2GecNAoKeQTkFC/UzxOkHuT9nlDkB
 GYGFYWdKkWodGuA5HjptjFgfxmB+B6cUGmJKT6VU038Eg38dH6uHpsetTVVnSTd+
 wLSiIS3oZc+O4As+8QRhEq/1qWPABu59Dk6deA33j9cox3jKF18qqKsJkkvZ7v/y
 yMTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1701783435; x=1701790635; bh=MSo40/DzILPmk
 4fVztq26tP1UcAt4IZ5edthROYfIeQ=; b=G05ajpa0ydYsGRTTZcpNT41Qi18VL
 tTkeNfMRhK8INQhOvsR4CzvGUG38/O65WlZTnWYNbScClP2CC+mdksV1Iu+edOaH
 a9DvPxVHGEkdt6OEhL4ey7tn7eqXYm1tChXMfN/BXrYQINu9Wy90WVKf6lMMV8Ru
 WtcsWI/B7yFqlcPhbI0EkKjTEBcLazxDmVRBBosRg8oloI4An3JsQ68nRZKaUwAM
 y++3QL4b1J7pXLIfQDvvOa60jh5C9vHHVejxAy7OGYi1Sr+ocax8iuZeQ4LqYZTb
 dCGi5oKHrq2yhYEdOFBEDcavSa+FpcSqprL57zaD1oupPh78AqEXGLkOQ==
X-ME-Sender: <xms:iidvZQA5mUT1bVo6Yswef5I7EVViPH8embvXLXyq28STqkjccda83g>
 <xme:iidvZShhabKIuETXLy-0zPjFWYWz9m2qBw7uuMTYW8fZVkkVskRlH9a3Ya4qW7lSf
 HpWE-_pXfEv9SQnkOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejkedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:iidvZTmmaNx2EjlM5F2twmSiNrX_wrK4508mBaoJdM6KvkqQi6rwCQ>
 <xmx:iidvZWxoVc3OnJKPBLwApxns2IqUxu1kqCyNdMlNM8vDu37vHRqV_A>
 <xmx:iidvZVRCAlGIIzSF8HWR2AiHkPNr8YfI8TjE5nUFfA6XOcPAtjVbeA>
 <xmx:iydvZW5xGDo2YidjUjCbYahLNJEJjFasTqjg_MtGo4QepswNu9QetQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2D405B60089; Tue,  5 Dec 2023 08:37:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1178-geeaf0069a7-fm-20231114.001-geeaf0069
MIME-Version: 1.0
Message-Id: <2a5ce0d0-ad0a-49d7-84a6-055c4b729eec@app.fastmail.com>
In-Reply-To: <f671beae8a8ebfd361f4c903bccce713135a169f.1701768028.git.ysato@users.sourceforge.jp>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <f671beae8a8ebfd361f4c903bccce713135a169f.1701768028.git.ysato@users.sourceforge.jp>
Date: Tue, 05 Dec 2023 14:36:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yoshinori Sato" <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Subject: Re: [DO NOT MERGE v5 22/37] dt-bindings: display: smi,
 sm501: SMI SM501 binding json-schema
Content-Type: text/plain
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 5, 2023, at 10:45, Yoshinori Sato wrote:
> Define SM501 functions and modes.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../bindings/display/smi,sm501.yaml           | 134 ++++++++++++++++++
>  include/dt-bindings/display/sm501.h           |  25 ++++

It looks like we already have a binding at
Documentation/devicetree/bindings/display/sm501fb.txt

> +  little-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: available on big endian systems, to set different 
> foreign endian.
> +  big-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: available on little endian systems, to set different 
> foreign endian.
> +
> +  swap-fb-endian:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: swap framebuffer byteorder.

Why do you need both the "swap" and the specific little/big
properties?

> +  crt:
> +    description: CRT output control
> +
> +  panel:
> +    description: Panel output control

What type are these?

> +  smi,misc-timing:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Miscellaneous Timing reg value.
> +
> +  smi,misc-control:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Miscellaneous Control reg value.
> +
> +  smi,gpio-low:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: GPIO0 to 31 Control reg value.
> +
> +  smi,gpio-high:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: GPIO32 to 63 Control reg value.

Register values should generally not go into DT


> +
> +  smi,gpio-i2c:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 5
> +    description: |
> +      GPIO I2C bus number
> +      1st field - I2C bus number
> +      2nd Field - GPIO SDA
> +      3rd Field - GPIO SCL
> +      4th Field - Timeout
> +      5th Field - udelay

Instead of a bus number and other fields, I think
this should reference an i2c device.

      Arnd
