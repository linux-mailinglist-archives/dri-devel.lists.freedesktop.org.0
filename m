Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB3562CB1
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 09:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5233910F289;
	Fri,  1 Jul 2022 07:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BFD12B38C
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 21:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656623783; x=1688159783;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S3lpds+Dm08bh0wmuZJxD7UtITL3wTfX27aPen8VTS4=;
 b=L08f//uVVAqasHYcso2YTgVcDladYUMu20X4p38hNGZmPr3RJrInGZpW
 oDydX6kq6AeTSxb+c5Gym+iEiFvdd2ibjXJlyFRf9n2u0PvWDNXo9/Kch
 hPCBq8x24nQebE+wBcfEJcWeOZSeN0oIXyRHaG6GisWhsWyCRaxeU89A4
 hkEdZsS3g79pyXTELaqB64IrxLaSN8NEY5gwrRTgTGPFemSx1P0Qxrt5C
 pQ1msxBY2OnIgtVXC5MPP2iNJXmhxxcjR6dvJiBPMyh34y/HmnxVHfc7J
 /ESoLT0K63PHXh4hSnVosxQNY8v63wQpjPfBIgVFCI9oC3vYcFNlu79sS w==;
X-IronPort-AV: E=Sophos;i="5.92,235,1650902400"; d="scan'208";a="209407243"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2022 05:16:22 +0800
IronPort-SDR: LekjFPHDV3qxao/GzTlp4lva6+dsnr7NW8oV3H1WAoi0KjyOE4dNtYp2MITUW0VRtFd2us9ecj
 2zooYrOgFTLrKNl4e2yBWK6TePtLGkXTP5UbMcGG3K1dCyqE8n1ph0sndU5dazWmcWNnw6bCrw
 Nm5Cz7cN4k2oQr8AngAQXvPCnxKZL6uuHqO3Rxc/PJe/OwKaOrYIc75EAeytIIoAKDKjiD4o/H
 uinME2EXQLLgnA22mLhzMm1KK/o4tBhZvwwZ1YkzVkg5SBqA7G3wS2/DpjNrX+mnGtBPNTrVMe
 +aSUPaF+eu6xxrgKuuctg3e4
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 13:33:57 -0700
IronPort-SDR: f/25Bk/q3+FMV01mrSplfgK+Tg/PTPB0uDEAWsXQPUkbL5OjoGN6rCzy7IHmtqR0f+HO45p+Q+
 bO3tjlWDXwFJgUCE5AodATTlgN9VkN/HRLB1VBiZgC7AvIdfb6GhyDmJZp4T/pNmW4eNP8R6lc
 72dknmJS64JzWCUZ9sQTwdxF3AUovWEKXxgaVUa8sjAIc8ykWi3t/2TBWBqjcTXHRNjlL0+B8F
 YxCbAUmHQ5q+/8/kxs0DkKBOcjPsHzRvjvGy9fv1L8SAsitdFRWC1D1BdM6Bno6fe+ncjsVo8Z
 36g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 14:16:24 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LYrjf4qhwz1Rws8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:16:22 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656623781; x=1659215782; bh=S3lpds+Dm08bh0wmuZJxD7UtITL3wTfX27a
 Pen8VTS4=; b=Zv6Mnk5EbWMx+llj8qJU8aBOizcZtGxsux4YRgT/p/ff+YddkCe
 9YVKoHzbIir/H0fnTayYjpqqZKzpZmwf8/JmV+x2HGK0OJbxeyWPowvwoCbOgf6b
 hDXYRdfhJsYM8O5XBQetyYO5ITVdKfOBisvEiYA1ScpiS4ZaepvTK5syZaX0Xc07
 odZgk6A0B0wcFNMaUSZ/CslIlzsMpM0q8joScup+JSn2MkdjdVwPzg/mAmNzS6EB
 kj9evFhgFjor7EXMKSoR8K0vRGAWTqI5NU+/1RRHqkUygH40iW/Ud/+E2ba/nLRi
 qEYhnoJu8DhosGyMkfT7BM8CPxRJxR6qKVw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id eMxD3eaOt9KH for <dri-devel@lists.freedesktop.org>;
 Thu, 30 Jun 2022 14:16:21 -0700 (PDT)
Received: from [10.225.163.102] (unknown [10.225.163.102])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LYrjX18xMz1RtVk;
 Thu, 30 Jun 2022 14:16:15 -0700 (PDT)
Message-ID: <f228057b-7c17-e536-ce6f-6597e263f06d@opensource.wdc.com>
Date: Fri, 1 Jul 2022 06:16:14 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 00/15] Canaan devicetree fixes
Content-Language: en-US
To: Sudeep Holla <sudeep.holla@arm.com>, Niklas Cassel <Niklas.Cassel@wdc.com>
References: <20220629184343.3438856-1-mail@conchuod.ie>
 <Yr3PKR0Uj1bE5Y6O@x1-carbon> <20220630175318.g2zmu6ek7l5iakve@bogus>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220630175318.g2zmu6ek7l5iakve@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 01 Jul 2022 07:33:24 +0000
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 David Airlie <airlied@linux.ie>, Palmer Dabbelt <palmer@rivosinc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Jose Abreu <joabreu@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Mark Brown <broonie@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <mail@conchuod.ie>,
 Thomas Gleixner <tglx@linutronix.de>, Dillon Min <dillon.minfei@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Serge Semin <fancer.lancer@gmail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/1/22 02:53, Sudeep Holla wrote:
> On Thu, Jun 30, 2022 at 04:28:26PM +0000, Niklas Cassel wrote:
>> On Wed, Jun 29, 2022 at 07:43:29PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> Hey all,
>>> This series should rid us of dtbs_check errors for the RISC-V Canaan k210
>>> based boards. To make keeping it that way a little easier, I changed the
>>> Canaan devicetree Makefile so that it would build all of the devicetrees
>>> in the directory if SOC_CANAAN.
>>>
>>> I *DO NOT* have any Canaan hardware so I have not tested any of this in
>>> action. Since I sent v1, I tried to buy some since it's cheap - but could
>>> out of the limited stockists none seemed to want to deliver to Ireland :(
>>> I based the series on next-20220617.
>>>
>>
>> I first tried to apply your series on top of next-20220630,
>> but was greeted by a bunch of different warnings on boot,
>> including endless RCU stall warnings.
>> However, even when booting next-20220630 without your patches,
>> I got the same warnings and RCU stall.
>>
> 
> Is it possible to share the boot logs please ?
> Conor is having issues with my arch_topology/cacheinfo updates in -next.
> I would like to know if your issue is related to that or not ?

FYI, I see rcu warnings on boot on my dual-socket 8-cores Xeon system, but
the same kernel does not have the rcu warnings with an AMD Epyc single
socket 16-cores box.

> 
>> So I tested your series on top of v5.19-rc4 +
>> commit 0397d50f4cad ("spi: dt-bindings: Move 'rx-sample-delay-ns' to
>> spi-peripheral-props.yaml") cherry-picked,
>> (in order to avoid conflicts when applying your series,)
>> and the board was working as intended, no warnings or RCU stalls.
>>
> 
> If possible can you give this branch[1] a try where my changes are and doesn't
> have any other changes from -next. Sorry to bother you.
> 
> Conor seem to have issue with this commit[2], so if you get issues try to
> check if [3] works.
> 
> Regards,
> Sudeep
> 
> [1] https://git.kernel.org/sudeep.holla/c/ae85abf284e7
> [2] https://git.kernel.org/sudeep.holla/c/155bd845d17b
> [3] https://git.kernel.org/sudeep.holla/c/009297d29faa


-- 
Damien Le Moal
Western Digital Research
