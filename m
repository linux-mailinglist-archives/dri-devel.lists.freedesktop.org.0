Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F511568B15
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2664610EE4B;
	Wed,  6 Jul 2022 14:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF0E711A333
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 11:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657108519; x=1688644519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=9/V+jeecOKQ9buv2Jjb6PxTGk0efO8S6cyBl2B3zFEA=;
 b=Sroos3SzfYaun0+bXCjm/pU9SaTx1YEj0Jao7/NKnJDX16I+lphOapMN
 fiO25a4SL3OcVDRyh0V4xgF9MxgLeNupxYWzQxgAO6vsJHpo3DrbAR36x
 rtmYtdMWBA3FLMiF2Og16B901AxxWpBr90ndYBRrfrbf0w5VmJBs8oa/g
 g0GkKcXkBqOL4XAhfGHhZiqAukSNGXhhkjejYs44MP0FGvcuhFRvZMzNC
 ZRxq2kpYU8Uinl/JYvdAmYK8a6cP0M8NmeiF2mDLn+2JDPCRzG6/TfOkp
 NgRjCGy4NIQfCZop+V02XHMSYKhAsUHTxLvMmPI7sDi/dbsHT0MSi1qEP w==;
X-IronPort-AV: E=Sophos;i="5.92,249,1650902400"; d="scan'208";a="209871839"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jul 2022 19:55:18 +0800
IronPort-SDR: gT5EUfscnjZDioIPPvd4OOBFSQEHpToTfAM/Vxf3ltidnldKCXfFCKDHL2rQzLjE3NsCa3qyAR
 M8uSj2evdS7ot1ZW//vG2EZHsZRv9W/Bq+UcpS1Lz57rAqz2JHzHFKHITMeFHrgOyjtlrf6qHY
 gI7SWjwRfj4z5IC2VIxXiNcPB07czlsWnSnxpCrImWKOsJr4DiaZF/gV90WbezGrvzhkGNCIPt
 tnNAI0KvMVz7+PNsTEeYU29Vhzbci8JS+KbovFKrbFAyThBKTqdWVl3u50yhy6J90QyS6AfCkA
 p+dCy/5yFiCS4IUJmt4OmAvK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jul 2022 04:12:34 -0700
IronPort-SDR: uqFVBT3qybuQTEEyG20Es+uH8L1ZW0NY9+0qJpLaHrel5hR8NM61nYt/b++vOsZXcK9aaRjHXn
 u0Tm939Y2oRKJW0izUqp8xW3jMQc4eofoyh+mOChovuu30blsvQJluHOIWkbgx5eWQ44WwbjAj
 40KLqVtXSU+byXXhifOHk5511eBPgbHG8svJ1ein4xF/uRIVoh3juYUDSVxXQYJ8mPETVLRyND
 QS4+JGXV7gfiAe/PoGPr+xPk6teVpQEfAWw8ToocRYFCz6y3PGDHzMLMIsG50pbm/d9bzeYB9g
 YY4=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jul 2022 04:55:20 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LdHzW39DSz1Rwnm
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 04:55:19 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657108518; x=1659700519; bh=9/V+jeecOKQ9buv2Jjb6PxTGk0efO8S6cyB
 l2B3zFEA=; b=lSIPiRDEYyFvXDQNNHtQithq0+PFOLUo0Zk5PgdLd4mByWeGnNN
 mmmcjxvF73+JD1P4+Jg0yEzzRaf1IOlCheyb3waduJZm0F+naD4PCRHqVenKcJ1K
 U0OvntK9Pwm854EII6t0DrgJeVT7QGYTS+NzhHak9QpOx92XMa0YDwBYa5FX4haO
 8axnji6jHR3fLDFFFGb8R78ev10jcmpthVCoKyLX0oBtrFPjCl4go3l1lMtMlG93
 w+NoTe8NHULN+cpr1zGvHwMUgA4sBowVM6sQlIkw4S7LIDEKBB9Nn8tZjS1DWMnK
 pB4c7HiF+n/4PXarEzy96uJIB2IBW4ZsJOw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id lUZebQiIs8ML for <dri-devel@lists.freedesktop.org>;
 Wed,  6 Jul 2022 04:55:18 -0700 (PDT)
Received: from [10.225.163.110] (unknown [10.225.163.110])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LdHzQ65N7z1RtVk;
 Wed,  6 Jul 2022 04:55:14 -0700 (PDT)
Message-ID: <160267df-2f3f-02f7-4a4d-21baf60c4a44@opensource.wdc.com>
Date: Wed, 6 Jul 2022 20:55:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 00/13] Canaan devicetree fixes
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdVOK+iHeTfRLDeMF1mwZoeH1KH_GHuCY72YnhQibGqhwA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 06 Jul 2022 14:20:42 +0000
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Dillon Min <dillon.minfei@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, dmaengine <dmaengine@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/6/22 17:03, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Tue, Jul 5, 2022 at 11:52 PM Conor Dooley <mail@conchuod.ie> wrote:
>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>> out of the limited stockists none seemed to want to deliver to Ireland :(
>> I based the series on next-20220617.
> 
> Digi-Key does not want to ship to IRL?
> The plain MAiX BiT is out-of-stock, but the kit incl. a display is
> available (97 in stock).

Seedstudio is out of stock on the MAIX bit, but they have maixduino, which
is the same, almost (pin wiring differs, everything else is the same).

https://www.seeedstudio.com/Sipeed-Maixduino-Kit-for-RISC-V-AI-IoT-p-4047.html

And you can still find plenty of MAIX bit on Aliexpress too.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


-- 
Damien Le Moal
Western Digital Research
