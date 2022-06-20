Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BB7552BD0
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 09:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8401C10F8AB;
	Tue, 21 Jun 2022 07:24:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jun 2022 22:53:45 UTC
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE5A10FBE4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655765625; x=1687301625;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXTfHEicD2Q=;
 b=j1lgGUJ3Rht1iemS5voWMUiazEN4DJE+W/VPMb2w5SyF9/YqmAc+7YpR
 aRIkU2Htx76G890uXUtXWM+Ijk5weGgeALTogRVTPHjBVIYbJwecJ48O3
 pk/izS/pMuc5wU0R4YWNptwcNwEFrlRwb1l6CRs6rpeoVzQVO6Wg51UgM
 Z+LDcXKtZghWIof4d1tZ669JLaqMrhsKcHjRLUFofBPA6cSL4jFRF/XJs
 ANuWv9cU45x9GVb2ibUsKd/GfKHq4XLqhZ4hGbwXVXEamNrFGye5Gq9Zb
 o2FSmet7cHxUFQcjzY50jHo5hqopu9uyphkOTlt2/ZPT0oC22BmC+oZQ1 w==;
X-IronPort-AV: E=Sophos;i="5.92,207,1650902400"; d="scan'208";a="315760968"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jun 2022 06:46:37 +0800
IronPort-SDR: hPiarcI0oyJpGPwFZwfSAxJRBe96qGveR1nTJSl7RqeqkS0WgGvEZiS2iUYV5rC0MsY18IJwug
 1ZIHYpcDCLy0VQSB7y6Gm+VZLKHEoaHxnxZsRKwIN7N1XN+EZxseJfCPzRNKvFGkejoNlTQIZK
 45cwiHPHuMdBxmWHbJPV3K7jzqXIvhhTBapIXXNAoK2JFBImbAlScjQujXXuqQNH0BIguIffan
 0aLY+yn+gVxKRIqGXuOPodJQ0Syr20ux4yDQCTxciNLnmqZiyCNo/gPfqNnzFfoHMR5mfH0m0t
 rfOkG+CjXHBS7fRG45C6DVE+
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 15:09:08 -0700
IronPort-SDR: YbE9P50xGiFzhNcs77KQJwWKc+zd3PmfH44ElKWcMDgi20YH3UUxZ5wtjrrZ0gfKKgAQ43R0NT
 MhJYtmMTSJAQX2fQuUUGPSnphrlbjk5aRFZqSHEl19+WBtnjKOk0D9YU4w37hQX8E6DELmW3ud
 7ZHrgjrBJeIePpTAZtdC0uz9Z3AZY46AqiexbupDUQv+bZ0rHgP6oYuyEgfK9hkr9uBL8VnHoH
 6vGl5qbOoVUnGlNm0gQojGPjc01MD5ctg1p/NV8xCw2iN3lSqAu1/iwg9K6d/gf6TRblHN2PAM
 mXQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2022 15:46:38 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LRlBN4WWVz1SVp8
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 15:46:36 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655765195; x=1658357196; bh=HsNQYoVzbJStzX4az+4aldPwMmRKXzHlpXT
 fHEicD2Q=; b=CgMTv5HEF2LWLR/xmzK6unobrKr7GS8iPYQabCr0jCxQs77QUb1
 gsOBb35y7MvK90lgWg+KX+ocwtj26q6vzQos7i/zs7VrFDkaAd+JcmIqQnKthG76
 zQkkLU1e3wFURfaTgRqrJvDcjb5CSUTrD8EU4VgeJiiQaZOcXmvZhKtRoqJWrYh+
 LaUp33TVh85pu9m7tO98VPke//r5Q9RLQ7TsUl49cnDof1SgI4qDdxsnqM+6hnAQ
 ZjUqRHU/iFVXCuz/5UhJ+kMWfYQudqCTL2Rgu+paQ5hpuyZuXqd011jjDhfR1vUS
 UKpjx+Cjfhcn4Bjd5xIXGSYSIeppWxdR56w==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id qkXe3BPCid_k for <dri-devel@lists.freedesktop.org>;
 Mon, 20 Jun 2022 15:46:35 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LRlBG25pSz1Rvlc;
 Mon, 20 Jun 2022 15:46:30 -0700 (PDT)
Message-ID: <9a1fcb40-9267-d8e6-b3b6-3b03fd789822@opensource.wdc.com>
Date: Tue, 21 Jun 2022 07:46:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Content-Language: en-US
To: Conor.Dooley@microchip.com, fancer.lancer@gmail.com, mail@conchuod.ie
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <20220620205654.g7fyipwytbww5757@mobilestation>
 <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <61b0fb86-078d-0262-b142-df2984ce0f97@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 21 Jun 2022 07:24:08 +0000
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 palmer@rivosinc.com, linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, linux-riscv@lists.infradead.org,
 sam@ravnborg.org, masahiroy@kernel.org, daniel.lezcano@linaro.org,
 joabreu@synopsys.com, geert@linux-m68k.org, Eugeniy.Paltsev@synopsys.com,
 devicetree@vger.kernel.org, aou@eecs.berkeley.edu, broonie@kernel.org,
 dri-devel@lists.freedesktop.org, paul.walmsley@sifive.com, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, jee.heng.sia@intel.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/21/22 06:06, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 21:56, Serge Semin wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Sat, Jun 18, 2022 at 01:30:28PM +0100, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>>> this.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  .../bindings/spi/snps,dw-apb-ssi.yaml         | 48 ++++++++++++++-----
>>>  1 file changed, 35 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> index e25d44c218f2..f2b9e3f062cd 100644
>>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>>> @@ -135,19 +135,41 @@ properties:
>>>        of the designware controller, and the upper limit is also subject to
>>>        controller configuration.
>>>
>>> -patternProperties:
>>> -  "^.*@[0-9a-f]+$":
>>> -    type: object
>>> -    properties:
>>> -      reg:
>>> -        minimum: 0
>>> -        maximum: 3
>>> -
>>> -      spi-rx-bus-width:
>>> -        const: 1
>>> -
>>> -      spi-tx-bus-width:
>>> -        const: 1
>>> +if:
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: snps,dwc-ssi-1.01a
>>> +
>>> +then:
>>> +  patternProperties:
>>> +    "^.*@[0-9a-f]+$":
>>> +      type: object
>>> +      properties:
>>> +        reg:
>>> +          minimum: 0
>>> +          maximum: 3
>>> +
>>> +        spi-rx-bus-width:
>>> +          const: 4
>>> +
>>> +        spi-tx-bus-width:
>>> +          const: 4
>>> +
>>> +else:
>>> +  patternProperties:
>>> +    "^.*@[0-9a-f]+$":
>>> +      type: object
>>> +      properties:
>>> +        reg:
>>> +          minimum: 0
>>> +          maximum: 3
>>> +
>>> +        spi-rx-bus-width:
>>> +          const: 1
>>> +
>>> +        spi-tx-bus-width:
>>> +          const: 1
>>
>> You can just use a more relaxed constraint "enum: [1 2 4 8]" here
> 
> 8 too? sure.
> 
>> irrespective from the compatible string. The modern DW APB SSI
>> controllers of v.4.* and newer also support the enhanced SPI Modes too
>> (Dual, Quad and Octal). Since the IP-core version is auto-detected at
>> run-time there is no way to create a DT-schema correctly constraining
>> the Rx/Tx SPI bus widths. So let's keep the
>> compatible-string-independent "patternProperties" here but just extend
>> the set of acceptable "spi-rx-bus-width" and "spi-tx-bus-width"
>> properties values.
> 
> SGTM!
> 
>>
>> Note the DW APB SSI/AHB SSI driver currently doesn't support the
>> enhanced SPI modes. So I am not sure whether the multi-lines Rx/Tx SPI
>> bus indeed works for Canaan K210 AHB SSI controller. AFAICS from the
>> DW APB SSI v4.01a manual the Enhanced SPI mode needs to be properly
>> activated by means of the corresponding CSR. So most likely the DW AHB
>> SSI controllers need some specific setups too.
> 
> hmm, well I'll leave that up to people that have Canaan hardware!

I will test this series.

> Thanks,
> Conor.
> 
>>
>> -Sergey
>>
>>>
>>>  unevaluatedProperties: false
>>>
>>> --
>>> 2.36.1
>>>
> 


-- 
Damien Le Moal
Western Digital Research
