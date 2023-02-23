Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A83D26A05A3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2BC10EB02;
	Thu, 23 Feb 2023 10:09:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC59810EB02
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 10:09:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B0A3615FF;
 Thu, 23 Feb 2023 10:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E63C433EF;
 Thu, 23 Feb 2023 10:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677146948;
 bh=ltP+sqQ59O17JJFCXy0EhCXvNdKIgKqIbNAMj0PypVw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YCi0EnFWBDgzKvrjBRjBgH8/MnsbEY22udCE488IaaU5CiIrwnq+kcdKiQ7m4yXDJ
 3HEOtZMpgb8byjEoyQW/WSK0uToHXdI0nSTTYsLzaVomssyj9Q9lXwyO70VMHnRTiG
 9I8Jc0MrU3BiPWt7cxlRfuY2rdyxiCyH9BWpYfEZAZDYWQv+XowV6NV+bJqLOhahMd
 3rvGyqugMiVIXAcrMBiKwJzSgQKzw1t2P1/qu8gz5h3pltg5NFzHHBWATG8yi+Ahf0
 80JxzFBZT2Xv/ZV7VUqzFLUglxf+Bm/vDQd41ZGKujeE9JzrPYY6NMT7QfQCyghg0q
 tJfUs83Nm8A3g==
Message-ID: <bc67a5c3-a844-472a-74bf-f08f49ca99bb@kernel.org>
Date: Thu, 23 Feb 2023 11:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] dt-bindings: display: Add Loongson display controller
To: suijingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20230222165514.684729-1-suijingfeng@loongson.cn>
 <20230222165514.684729-2-suijingfeng@loongson.cn>
 <76bc79c9-a892-c43e-1f49-d07b54f52c90@kernel.org>
 <84796070-7740-eb69-65c0-9a3d8e464a0f@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <84796070-7740-eb69-65c0-9a3d8e464a0f@loongson.cn>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2023 10:51, suijingfeng wrote:
>>> diff --git a/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>>> new file mode 100644
>>> index 000000000000..98b78f449a80
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/loongson/loongson,display-controller.yaml
>> Filename based on compatible, so "loongson,ls2k1000-dc.yaml"
> 
> what if we have more than one SoC,
> 
> we have  loongson,ls2k1000-dc, loongson,ls2k2000-dc and loongson,ls2k0500-dc
> 
> we will have loongson,ls2k3000-dc in the future, then how should i write 
> this?

Then it is fine.

> 
> I want a single file yaml file include them all.
> 
> I'm asking because we don't know which method is good, write three piece 
> of yaml or just one.
> 
> Just tell me how to write this, i will follow you instruction.
> 
>>> @@ -0,0 +1,58 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/loongson/loongson,display-controller.yaml#
>>>
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Loongson Display Controller Device Tree Bindings
>> Drop "Device Tree Bindings"
> OK,
>>> +
>>> +maintainers:
>>> +  - Sui Jingfeng <suijingfeng@loongson.cn>
>>> +
>>> +description: |+
>> Drop |+
>>
>>> +
>> No need for blank line. Do you see it anywhere else in the bindings?
> OK, acceptable.
>>> +  The display controller is a PCI device, it has two display pipe.
>>> +  For the DC in LS2K1000 each way has a DVO output interface which
>>> +  provide RGB888 signals, vertical & horizontal synchronisations
>>> +  and the pixel clock. Each CRTC is able to support 1920x1080@60Hz,
>>> +  the maximum resolution is 2048x2048 according to the hardware spec.
>>> +
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^display-controller@[0-9a-f],[0-9a-f]$"
>> Drop nodename.
> 
> Are you sure about this?  When i  write this property, I'm reference the 
> ingenic,lcd.yaml .
> 
> ingenic,lcd.yaml has nodename too.
> 
> If I delete $nodename, then the test results say 
> '^display-controller@[0-9a-f],[0-9a-f]$'  is not of type 'object'.
> 
> log is pasted at below.

I meant, drop entire nodename and pattern.



Best regards,
Krzysztof

