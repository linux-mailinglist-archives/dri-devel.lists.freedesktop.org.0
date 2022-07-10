Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC81456D203
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 01:21:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7509F8A801;
	Sun, 10 Jul 2022 23:21:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D7C68A80A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 23:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1657495278; x=1689031278;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2bOuAF8hy4hQXexxGrNRideeT3L1vDk2fxucN4Onkrw=;
 b=UCMS0riGhOxQ5wNuHTdB5Z4VOj08tOA+e/ydmXplTq1uxWac8z6e4N+b
 kAHddfmeFCE2Iy8Bf1Qzee6xkur49e7GqzEpHe+zQfTriwUWH0cSrtqQn
 c+K1EWasfgcemEe3FJvLIqzMD/x2QSUn0OF2cqHqnh6cMiI2E6Ms2K3kU
 1LFo3Jqi5+20V393Z/xBHm8qmPpntK0V0ApXRHSwMCC0N+aALc+M3Ah5K
 hXuVJeF5Wze/zhMvQv8HRwNUFCYbnxTAugYr/aqaVXUjT1wdGMJVqW0+y
 0ZQaor6IvixVPCh5Krv/mROcWtBI1hgYIKkaAVvjuw2TZpDFWOYTP/Psn A==;
X-IronPort-AV: E=Sophos;i="5.92,261,1650902400"; d="scan'208";a="210243194"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 07:21:17 +0800
IronPort-SDR: nnrdEybXqWi6P+dIitKGEizDrM2ea5A5nRDpc/Ci322hTUPnoCezWaZ5rG0s54e4eavEgGVu25
 Kw+mGM8UcEXZ9tU9Av3hrApzKUBh+DasDT6nYPNelGTpWEqtBKk3ttlAEysPjYD+XsnbQwAqUc
 ZZs17UBNPlCzXVyRRiXUM/X+DYnnkudiSE4w4rXjS+WzcWhI+eaPMP2k/mFYmrBwIKQvsjZkq4
 72KqWuabp+MdBIAIekHd1WiOFqIFMBcs88MdggXeZG6Ix4k+wY0KHi7xPxbB5N6rufZRHJQP4X
 CkxR4h5fFnd5fSTtQLgsetAn
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2022 15:42:56 -0700
IronPort-SDR: c9HHVWJDcZZ4WsTMnQmhYr1xUhGeE7aZ6CzvU2PdMcqWzK7qaWnlNB91pGmON3D4BNvbXLIO00
 izn4+A3MlNJvmMRZAV4lnY8aWSWm5Te2OUOuTyO5hkuLVXJfZTSU6kHyxKZ3Bnm6kJkWtYgGHZ
 YJs/81RENsvjhV9zr5vAWQlgP6Fis4uhfJjflPMvOE5SX8w+mqpKLJyYWpR8xZEQ2qiDvyQRG7
 93Q218EF3faNoJ2W/3326ZXPBZBsqyEET0efvKwTLHUIMQULS0hwV3PHg6XaUeinK3RHB86BD1
 TCY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2022 16:21:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Lh31B2ctmz1Rws0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Jul 2022 16:21:18 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1657495276; x=1660087277; bh=2bOuAF8hy4hQXexxGrNRideeT3L1vDk2fxu
 cN4Onkrw=; b=iY63mouJ51j7XgRwIzOQn2aNTZVGHkHmYlbv3oLuDn/RDNSJ7js
 fnWlCx5bkYECfSDwfPKXZH28vOy4xBFbYfUEkxA1Bk0W2tEB7xhgqTeJ+Ap/DWQg
 hnU2JJ6onNNBChD6gz9Kl/vSpx1TSHHOgot2/Uqfdxc4DnIvZSx6VX+6PdzkD70r
 YVqYdcosyHDk94OS6MzUxZOSvEXaAvw/o45nGZ12hsI/wy+QaFd1V1Sg5eJIOY1P
 zhOxlrFrGxL9GVwUBo0k2YY10LMCSiITH68OuumTq2EHMgRnenXg9PofTScTe5mF
 NsDo8QkwxLeJkbWK48XERzZy97CMD3y6pOA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id HhQR4Gm2WjPV for <dri-devel@lists.freedesktop.org>;
 Sun, 10 Jul 2022 16:21:16 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Lh31457fMz1RtVk;
 Sun, 10 Jul 2022 16:21:12 -0700 (PDT)
Message-ID: <b8b015f0-d16f-8528-719a-1a3f74d9f176@opensource.wdc.com>
Date: Mon, 11 Jul 2022 08:21:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 04/13] dt-bindings: memory-controllers: add canaan k210
 sram controller
Content-Language: en-US
To: Conor.Dooley@microchip.com, krzysztof.kozlowski+dt@linaro.org
References: <20220705215213.1802496-1-mail@conchuod.ie>
 <20220705215213.1802496-5-mail@conchuod.ie>
 <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <a516943f-3dac-70a0-3ebd-9f53fd307f25@microchip.com>
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
Cc: niklas.cassel@wdc.com, airlied@linux.ie, palmer@rivosinc.com,
 thierry.reding@gmail.com, linux-riscv@lists.infradead.org, sam@ravnborg.org,
 masahiroy@kernel.org, daniel.lezcano@linaro.org, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, mail@conchuod.ie, dillon.minfei@gmail.com,
 linux-kernel@vger.kernel.org, fancer.lancer@gmail.com, vkoul@kernel.org,
 palmer@dabbelt.com, dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/11/22 04:39, Conor.Dooley@microchip.com wrote:
> Damien, Krzysztof,
> 
> I know this particular version has not been posted for all that
> long, but this binding is (functionally) unchanged for a few
> versions now. Are you happy with this approach Damien?
> U-Boot only cares about the compatible & the clocks property,
> not the regs etc.
> 
> I (lazily) tested it in U-Boot with the following diff:

If both the kernel and u-boot still work as expected with this change, I
am OK with it.

> 
> diff --git a/arch/riscv/dts/k210.dtsi b/arch/riscv/dts/k210.dtsi
> index 3cc8379133..314db88340 100644
> --- a/arch/riscv/dts/k210.dtsi
> +++ b/arch/riscv/dts/k210.dtsi
> @@ -82,11 +82,14 @@
>  
>         sram: memory@80000000 {
>                 device_type = "memory";
> +               reg = <0x80000000 0x400000>, /* sram0 4 MiB */
> +                     <0x80400000 0x200000>, /* sram1 2 MiB */
> +                     <0x80600000 0x200000>; /* aisram 2 MiB */
> +               u-boot,dm-pre-reloc;
> +       };
> +
> +       sram_controller: memory-controller {
>                 compatible = "canaan,k210-sram";
> -               reg = <0x80000000 0x400000>,
> -                     <0x80400000 0x200000>,
> -                     <0x80600000 0x200000>;
> -               reg-names = "sram0", "sram1", "aisram";
>                 clocks = <&sysclk K210_CLK_SRAM0>,
>                          <&sysclk K210_CLK_SRAM1>,
>                          <&sysclk K210_CLK_AI>;
> 
> If so, could you queue this for 5.20 please Krzysztof, unless
> you've got concerns about it?
> 
> Thanks,
> Conor.
> 
> On 05/07/2022 22:52, Conor Dooley wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The k210 U-Boot port has been using the clocks defined in the
>> devicetree to bring up the board's SRAM, but this violates the
>> dt-schema. As such, move the clocks to a dedicated node with
>> the same compatible string & document it.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>> new file mode 100644
>> index 000000000000..f81fb866e319
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Canaan K210 SRAM memory controller
>> +
>> +description:
>> +  The Canaan K210 SRAM memory controller is responsible for the system's 8 MiB
>> +  of SRAM. The controller is initialised by the bootloader, which configures
>> +  its clocks, before OS bringup.
>> +
>> +maintainers:
>> +  - Conor Dooley <conor@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - canaan,k210-sram
>> +
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: sram0 clock
>> +      - description: sram1 clock
>> +      - description: aisram clock
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: sram0
>> +      - const: sram1
>> +      - const: aisram
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/k210-clk.h>
>> +    memory-controller {
>> +        compatible = "canaan,k210-sram";
>> +        clocks = <&sysclk K210_CLK_SRAM0>,
>> +                 <&sysclk K210_CLK_SRAM1>,
>> +                 <&sysclk K210_CLK_AI>;
>> +        clock-names = "sram0", "sram1", "aisram";
>> +    };
>> --
>> 2.37.0
>>
> 


-- 
Damien Le Moal
Western Digital Research
