Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F882943B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 08:25:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4285210E56B;
	Wed, 10 Jan 2024 07:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890EC10E56B
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 07:25:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 821F2B81CC2;
 Wed, 10 Jan 2024 07:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E53C433C7;
 Wed, 10 Jan 2024 07:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704871516;
 bh=y0XYir9hehV1QYoG8yiAHQAvf4oF+CEU/HIxmrlgqD0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kwLNTr+szIOaRkpRZoDgbFhI9S8qYT6jpV0hXCZE5cflXXWNyOCDzFwDuK4h9slGy
 Qg4fsDlf7+nOKVOl6YuCy3QQl8R0hc+l1J9N16iEikNi4H490UNePCs/0gsWOtIJSK
 sYXIOLMzaRzIWpBfCkgzGgLzfUAX87+ztuN49TqFz3Ax6OpU9GvL0Oclg1imlijMXU
 YRDUD1RyiUDumrGm0WOvf1L4FDUKylYTC9u9Y1IVMlvideoeSIq5GJAOrUfZ51Qg5W
 //KglQA8Jm7AtnnpTE5zNayD2c5Bb1Vwk0spa6Q+D1vwfZ9Ih+RpZzCnWEx5fjAGXj
 jN0LDsl1A6H2Q==
Message-ID: <7011f139-93c8-4b8c-9e90-dfafffd2a134@kernel.org>
Date: Wed, 10 Jan 2024 16:25:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE v6 27/37] dt-bindings: ata: ata-generic: Add new
 targets
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <06fdb2cf7927681acf3099b826390ef75ba321af.1704788539.git.ysato@users.sourceforge.jp>
 <c2f88d7b-cded-42ab-bc5c-3d9a723daa1f@kernel.org>
 <8cae92cf-ac7f-4e73-b28b-ee543a9064d9@linaro.org>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <8cae92cf-ac7f-4e73-b28b-ee543a9064d9@linaro.org>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
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
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/10/24 16:19, Krzysztof Kozlowski wrote:
> On 10/01/2024 03:06, Damien Le Moal wrote:
>> On 1/9/24 17:23, Yoshinori Sato wrote:
>>> Added new ata-generic target.
>>> - iodata,usl-5p-ata
>>> - renesas,rts7751r2d-ata
>>>
>>> Each boards have simple IDE Interface. Use ATA generic driver.
>>
>> This looks OK to me, so feel free to add:
>>
>> Acked-by: Damien Le Moal <dlemoal@kernel.org>
>>
>> Note: The "DO NOT MERGE" patch prefix almost got me to immediately delete this
>> 37 patches in my inbox... If you wish to get this work merged after review,
>> please use the regular "PATCH" prefix. No worries, the series will not be merged
>> until is is reviewed :)
> 
> The point of DO NOT MERGE was that feedback was not being implemented
> and same set of patches with same issues were kept sending. :/

OK. I found that prefix unusual, but not a big deal.
Thanks.

> 
> Best regards,
> Krzysztof
> 

-- 
Damien Le Moal
Western Digital Research

