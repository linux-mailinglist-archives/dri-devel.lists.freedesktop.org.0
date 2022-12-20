Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC865279C
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 21:13:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB3E10E3D3;
	Tue, 20 Dec 2022 20:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360AC10E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 20:13:15 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b9so13570516ljr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 12:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1I2R1NZ0M+nrKQ/AIqMBDxMCjwYm6eh5zT5Z3Yt5WA0=;
 b=PDYeSRtsu33EXQkhnsspag/LUhaX1lMTn7pNFrzAyj1XFX8wy6YdHaSDAxvVJhXUWn
 qsLIvyUEQ5ZgWVm/cKqAB0R0zeD+1Ln6ilLi4HXKSpHPtyF71c2SDU2mWsD0xd3z1x+M
 maIsV09+EMKAMAH+wea8PkBIlQ4YOuI44dvL2mY+493yStMOr2LxY2ilm+Wqlk2fIgTd
 78F0VOpL4KhrYsMRxvVs1RixpOUEBonPzMFuxgRGBeqAiX2DqzmDGqSQV8r1LkzfT6JU
 AjbdVWrKKLPHWusFE461b39Fsij6mviXAVj6O+x0FVQ/PwtGib4j1RawyAoyA/id+i1/
 e8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1I2R1NZ0M+nrKQ/AIqMBDxMCjwYm6eh5zT5Z3Yt5WA0=;
 b=J1t7zHvsBL3VAxEmCl535EXXK9elodWtA0IxTOWC0UZZ88zs4OtOc7koRP6Ru23/Aw
 pJXuLmxOvwj4Hm58uM8cxGrnHEuo2wUvNBIPqkpJMcjO1xQ2/B/hGoeor6BPJc+knBDW
 dvDoEqMUbo7FCUqd482g9omeh29v9/C/BbqLvlPdUDkWqqviJctLP+v2iqmdDIm0/kmo
 8jFLHadfLCmsmH7Gqkok649WOPTPBWGF3DCqEFm1ijcvP35B+5uVxgw1keVntUeSzkcw
 6SOGV20RDWAUhq6awby6xhSA1kkUcX8d+Z8IHFEGaxdKTp9fPWOXpHBcZachfUIy79aU
 55Iw==
X-Gm-Message-State: ANoB5pkFRIHeebDHBwWRxeOi2OcgdhJW3xGrhR3cJOneh/hGjV74ZZey
 7NrS03ZiS2sNtnhFVew1/a4=
X-Google-Smtp-Source: AA0mqf4TcaS04q2CPdCkB6V3ZtYJQs3DghgWFYP0vVIPsJ3WsKjDKJhXEhWWitXs5pzRNslqXHbBSw==
X-Received: by 2002:a2e:8048:0:b0:279:fe89:fbb5 with SMTP id
 p8-20020a2e8048000000b00279fe89fbb5mr11873978ljg.32.1671567193388; 
 Tue, 20 Dec 2022 12:13:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-113-89.nat.spd-mgts.ru.
 [109.252.113.89]) by smtp.googlemail.com with ESMTPSA id
 e14-20020a05651c038e00b00277025ddc9esm1126484ljp.54.2022.12.20.12.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 12:13:12 -0800 (PST)
Message-ID: <38c7cfe0-62e0-066a-d8dd-4ed4243a552e@gmail.com>
Date: Tue, 20 Dec 2022 23:13:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 01/21] dt-bindings: display: tegra: add Tegra20 VIP
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221128152336.133953-1-luca.ceresoli@bootlin.com>
 <20221128152336.133953-2-luca.ceresoli@bootlin.com>
 <20221201231936.GB1660613-robh@kernel.org> <20221202091108.5f492d6f@booty>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20221202091108.5f492d6f@booty>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Leitner <richard.leitner@skidata.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

02.12.2022 11:11, Luca Ceresoli пишет:
> Hello Rob,
> 
> Thanks for your review.
> 
> On Thu, 1 Dec 2022 17:19:36 -0600
> Rob Herring <robh@kernel.org> wrote:
> 
>> On Mon, Nov 28, 2022 at 04:23:16PM +0100, Luca Ceresoli wrote:
>>> VIP is the parallel video capture component within the video input
>>> subsystem of Tegra20 (and other Tegra chips, apparently).
>>>
>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>>
>>> ---
>>>
>>> Changed in v2 (suggested by Krzysztof Kozlowski):
>>> - remove redundant "bindings" from subject line
>>> - remove $nodename
>>> - add channel@0 description
>>> - add reg: const: 0
>>> ---
>>>  .../display/tegra/nvidia,tegra20-vip.yaml     | 63 +++++++++++++++++++
>>>  MAINTAINERS                                   |  7 +++
>>>  2 files changed, 70 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
>>> new file mode 100644
>>> index 000000000000..44be2e16c9b4
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vip.yaml
>>> @@ -0,0 +1,63 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-vip.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: NVIDIA Tegra VIP (parallel video capture) controller
>>> +
>>> +maintainers:
>>> +  - Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - nvidia,tegra20-vip
>>> +
>>> +  "#address-cells":
>>> +    const: 1
>>> +
>>> +  "#size-cells":
>>> +    const: 0
>>> +
>>> +  channel@0:  
>> Kind of odd there is only 1 channel with a unit-address. Are more 
>> channels coming? Please make the binding as complete as possible even if 
>> no driver support yet.
> This was discussed in v1 with Krzysztof and the outcome was that it's
> OK because it's likely that other SoCs have more, but the documentation
> is not public so I cannot add examples.
> 
> Full discussion (pretty short indeed):
> 
> https://lore.kernel.org/linux-devicetree/5292cc1b-c951-c5c5-b2ef-c154baf6d7fd@linaro.org/
> 
> Do you agree that the unit-address should be kept?

It's doubtful that there is a SoC having a VIP with multiple channels.
I'd expect it to be multiple VIPs rather than channels. There are NVIDIA
people to confirm that.

The "channel" itself looks redundant to me, i.e. the reg and ports
should be moved to the vip node.
