Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6825510FF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 09:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67DD310E8C6;
	Mon, 20 Jun 2022 07:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 20 Jun 2022 00:32:54 UTC
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9BD10E8DA
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 00:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1655685173; x=1687221173;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUSX4iWBZhA=;
 b=QxOD5MdsMxinKn1wF8OWjYLwFNITLHFI128CuRywSPBw8LiAe/JHdqQa
 vAkRIlnLXiuQz65xBu2C2B3VCyJ5qRBtqhGABDGm5V8Q1q1+gXJL9b+b+
 umHEnCLCd/Tn5b1A3C2E0cpsQ6OUj6xy5Y0WF9QqsUeOFl2jI08VO+l54
 kyksSPfyGJHr+44IpbFvgw3xMnsXiYOELBEn7D0iG5M0iVTSDYxjfShK9
 WYuNIdygcX4eOTqBRR8R9SFhA7xGxxz0r40zfs0200u4cLwkoRwZquJ0f
 hkMQNZXI9VOAbZapgQuHU0xF1SQzRht0M5CK/UdhfGym/YMRcNt4AGr3f w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650902400"; d="scan'208";a="202279305"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Jun 2022 08:25:47 +0800
IronPort-SDR: su1W6eCGr6iUAusY5rW2zeOdotjgV4qxLG1u8/es/jZHctfE5K7eFakw+i9rVrj8QNpI41vO0J
 Uj1c3lXGFAT+3YMStq3O/mbJWdTAJmapaFrDFTOzF6m0HFuo2JHk3boKvg+TbuPapc0dXXgtF4
 E+0rNNhbxdv0i3NNqD0g9Fe7/TWB+16dcMVf/1rdiLkC+j7VqrT39+CAEj4ZhVlrXEkxyMujee
 JWjZbfmy74yr1jb2UodFjmgTBJuZqXVYrgeRYF9QM5L37xv5Lb2Oy2gY1ufrIBnG3glIzrjOFT
 4LZEhqi7Q3kryuR5FhditJYI
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 16:48:19 -0700
IronPort-SDR: rTPuXKDLVO5WbyjloGxQDgJnOyk4aaJQr+Jomt1Exkxi/t6S6bo7TRXyfhMpxtK+SzY5fOfMNL
 NXe5rlFYDz0K1115TalIVuuxURVjU+w8xTGfKEaYm3KFTxdkQHeaRMvmA/RduKTm7r2gjgqI/4
 LHSQIv+QV2ZPFBeSOjbbYShtkg7ADH5xDgUumtkCHSA5I7sjTlnCxPRdPGf1i2rwsf3smjfWdc
 4OzwNPtRkvfar/5Cw5Ej5XDUbTwpmBOZkWNJ6dVdwDLkyimNL4ONliHWkRIX8f5RIlS8yg1TUl
 SMI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Jun 2022 17:25:47 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LR9RG3SM1z1SVp7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 17:25:46 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1655684745; x=1658276746; bh=H0ulQrMBtA6pu622Zq7Ff/HeEgzOhbo0ZUS
 X4iWBZhA=; b=jiZLlvSxMCZ6FyKEwxTD9KC+yR9WRhcg+KBamtfquRBI7vS8pGJ
 mBX0zoQMpTkJaMFFdVJnj3t13KHqhbLZ0wxv4yH09WD5zap1Onl7UiZRRPdtTT8q
 lRpIKFHnIHS6ATDMIB1EBmgVvIKlGPRbTBmO5z1aEaR53EnGopmn8GW5MfYpr+wV
 dW8obWKceDCrsqysJgrYGk90jld2x82pjjO7GVot8iccx/JpoOjI3x1vD3Avo5Tq
 8Z0iZwu+SbCnAqDIHlTu4eXzBK/+zo527aefCY9ZzO+FsC511gbTaO4E5/c48io7
 0JzIK6++acSKredsKoDjpGQoBzQrwNc1phQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id wVkaensQ7dfh for <dri-devel@lists.freedesktop.org>;
 Sun, 19 Jun 2022 17:25:45 -0700 (PDT)
Received: from [10.225.163.87] (unknown [10.225.163.87])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LR9R75cZsz1Rvlc;
 Sun, 19 Jun 2022 17:25:39 -0700 (PDT)
Message-ID: <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
Date: Mon, 20 Jun 2022 09:25:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor.Dooley@microchip.com, mail@conchuod.ie, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 thierry.reding@gmail.com, sam@ravnborg.org, Eugeniy.Paltsev@synopsys.com,
 vkoul@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 fancer.lancer@gmail.com, daniel.lezcano@linaro.org, palmer@dabbelt.com,
 palmer@rivosinc.com
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 20 Jun 2022 07:08:14 +0000
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, aou@eecs.berkeley.edu,
 devicetree@vger.kernel.org, masahiroy@kernel.org, linux-kernel@vger.kernel.org,
 jee.heng.sia@intel.com, linux-spi@vger.kernel.org, joabreu@synopsys.com,
 geert@linux-m68k.org, dri-devel@lists.freedesktop.org,
 paul.walmsley@sifive.com, dmaengine@vger.kernel.org, tglx@linutronix.de,
 dillon.minfei@gmail.com, linux-riscv@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 00:38, Damien Le Moal wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 6/18/22 21:30, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> The k210 memory node has a compatible string that does not match with
>>> any driver or dt-binding & has several non standard properties.
>>> Replace the reg names with a comment and delete the rest.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>> ---
>>>  arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>  1 file changed, 6 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> index 44d338514761..287ea6eebe47 100644
>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>
>>>       sram: memory@80000000 {
>>>               device_type = "memory";
>>> -             compatible = "canaan,k210-sram";
>>>               reg = <0x80000000 0x400000>,
>>>                     <0x80400000 0x200000>,
>>>                     <0x80600000 0x200000>;
>>> -             reg-names = "sram0", "sram1", "aisram";
>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>> -                      <&sysclk K210_CLK_SRAM1>,
>>> -                      <&sysclk K210_CLK_AI>;
>>> -             clock-names = "sram0", "sram1", "aisram";
>>>       };
>>
>> These are used by u-boot to setup the memory clocks and initialize the
>> aisram. Sure the kernel actually does not use this, but to be in sync with
>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>> kernel work fine with both u-boot internal DT and the kernel DT.
> 
> Right, but unfortunately that desire alone doesn't do anything about
> the dtbs_check complaints.
> 
> I guess the alternative approach of actually documenting the compatible
> would be more palatable?

Yes, I think so. That would allow keeping the fields without the DTB build
warnings.

> 
> Thanks,
> Conor.
> 
> 
> 


-- 
Damien Le Moal
Western Digital Research
