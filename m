Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F068955B808
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 08:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2789113FFB;
	Mon, 27 Jun 2022 06:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C555113E44
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 06:55:24 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id fi2so17009723ejb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=l8DLyJeTvw1xggLYIHIAs8lG/FP9YwAC/H3QcrJQQbM=;
 b=lfgBG6BcegbTxn3oISBf4RsaDUKM1nhVWAfcGq0zhvN4IJqH7WSK7JFr5tCQyT4LhR
 d3gzqK1269FOcBTTQRj6VW3qzmmFI2wXSc64Nt2UxGUePVjixulD3AFbREgmAsN+lFeL
 HwiLI3JD9ln4Ucm/7OFwUSa0edTyKBYwXARd8flIWAl5vo19z4kdrlu7947/py5QeJYl
 5geBx1o7hjeEa6/y+BjqBlLbb00NtPWXQVfDgYXenyBSH+m2KPcW22e8FAmdWrrzn1Kk
 jK5n1XfVEc+py+OgSpy6lqVFDccn0L+WAbGo6nrf6yeJtVi6tgZY/qojyRLDyAWyox7c
 /g5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l8DLyJeTvw1xggLYIHIAs8lG/FP9YwAC/H3QcrJQQbM=;
 b=wheESZOdlXiYX4rFjzQ1OjCFP0PN3VnU2CMND6V55ITOkAHutG1eYXTAQOAhMTp71w
 jgBmvPu8iVxggCWcN+UWNtiT1wA1hEI0EQsiDgFkkVY1itY63xTcK4hMadCd0ZsF0ANW
 zFW7rQ60ImVRGWksQkci6ETOn98f4bgM+DsvN148hl4MnZdYCEZ1xMgEZooX6RfKiGl6
 s2BJwey/4BSqGV+7NZ9AMLPU+9cZJ337MJIq7RO3ewxY+Qt/ne7TtHVgGHTfC4EvDg3h
 zZVGy0SGVGBVY5RN8IkelkHQqxJ4c9CWovVAo0iQYiQCrQMEZu6aiG8ibw5Bz2Z16eNi
 vwxQ==
X-Gm-Message-State: AJIora+g17Dshw7y74FEsqgEhwQFpIHlvn1sZCKl3haT/2JwF6BWmAGc
 g6EBGFHTkrKbRNZXUKai9nyNdA==
X-Google-Smtp-Source: AGRyM1uOrGGFKIKFwX1OUL+TaKzbf/DR/DTxjj1a56xgid+qPv5S8NCnwy6OhwV1/zW1L8jkeok5qg==
X-Received: by 2002:a17:907:60d2:b0:725:5611:cea6 with SMTP id
 hv18-20020a17090760d200b007255611cea6mr11136755ejc.60.1656312922947; 
 Sun, 26 Jun 2022 23:55:22 -0700 (PDT)
Received: from [192.168.0.246] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 e17-20020a170906505100b006fece722508sm4615390ejk.135.2022.06.26.23.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jun 2022 23:55:22 -0700 (PDT)
Message-ID: <70cd0066-9aa7-ca41-ad61-898d491328aa@linaro.org>
Date: Mon, 27 Jun 2022 08:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 07/14] riscv: dts: canaan: fix the k210's memory node
Content-Language: en-US
To: Conor.Dooley@microchip.com, damien.lemoal@opensource.wdc.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-8-mail@conchuod.ie>
 <9cd60b3b-44fe-62ac-9874-80ae2223d078@opensource.wdc.com>
 <e1fbf363-d057-1000-a846-3df524801f15@microchip.com>
 <891cf74c-ac0a-b380-1d5f-dd7ce5aeda9d@opensource.wdc.com>
 <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6c9de242-6ccf-49a2-8422-e6949c5169ff@microchip.com>
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
Cc: niklas.cassel@wdc.com, alsa-devel@alsa-project.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, jee.heng.sia@intel.com,
 linux-riscv@lists.infradead.org, sam@ravnborg.org, masahiroy@kernel.org,
 daniel.lezcano@linaro.org, joabreu@synopsys.com, geert@linux-m68k.org,
 Eugeniy.Paltsev@synopsys.com, devicetree@vger.kernel.org,
 aou@eecs.berkeley.edu, broonie@kernel.org, palmer@rivosinc.com,
 paul.walmsley@sifive.com, mail@conchuod.ie, tglx@linutronix.de,
 dillon.minfei@gmail.com, lgirdwood@gmail.com, fancer.lancer@gmail.com,
 linux-spi@vger.kernel.org, vkoul@kernel.org, palmer@dabbelt.com,
 dmaengine@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/06/2022 11:49, Conor.Dooley@microchip.com wrote:
> On 20/06/2022 01:25, Damien Le Moal wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 6/20/22 08:54, Conor.Dooley@microchip.com wrote:
>>> On 20/06/2022 00:38, Damien Le Moal wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 6/18/22 21:30, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> The k210 memory node has a compatible string that does not match with
>>>>> any driver or dt-binding & has several non standard properties.
>>>>> Replace the reg names with a comment and delete the rest.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> ---
>>>>> ---
>>>>>   arch/riscv/boot/dts/canaan/k210.dtsi | 6 ------
>>>>>   1 file changed, 6 deletions(-)
>>>>>
>>>>> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>> index 44d338514761..287ea6eebe47 100644
>>>>> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
>>>>> @@ -69,15 +69,9 @@ cpu1_intc: interrupt-controller {
>>>>>
>>>>>        sram: memory@80000000 {
>>>>>                device_type = "memory";
>>>>> -             compatible = "canaan,k210-sram";
>>>>>                reg = <0x80000000 0x400000>,
>>>>>                      <0x80400000 0x200000>,
>>>>>                      <0x80600000 0x200000>;
>>>>> -             reg-names = "sram0", "sram1", "aisram";
>>>>> -             clocks = <&sysclk K210_CLK_SRAM0>,
>>>>> -                      <&sysclk K210_CLK_SRAM1>,
>>>>> -                      <&sysclk K210_CLK_AI>;
>>>>> -             clock-names = "sram0", "sram1", "aisram";
>>>>>        };
>>>>
>>>> These are used by u-boot to setup the memory clocks and initialize the
>>>> aisram. Sure the kernel actually does not use this, but to be in sync with
>>>> u-boot DT, I would prefer keeping this as is. Right now, u-boot *and* the
>>>> kernel work fine with both u-boot internal DT and the kernel DT.
>>>
>>> Right, but unfortunately that desire alone doesn't do anything about
>>> the dtbs_check complaints.
>>>
>>> I guess the alternative approach of actually documenting the compatible
>>> would be more palatable?
>>
>> Yes, I think so. That would allow keeping the fields without the DTB build
>> warnings.
> 
> Hmm looks like that approach contradicts the dt-schema;
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/memory.yaml
> 
> @Rob,Krzysztof what is one meant to do here?

Why do you think it contradict bindings? Bindings for memory allow
additional properties, so you just need to create binding for this one.
And make it a correct binding, IOW, be sure that these clocks are real etc.

Although usually we had separate bindings (and device drivers) for
memory controllers, instead of including them in the "memory" node.

Best regards,
Krzysztof
