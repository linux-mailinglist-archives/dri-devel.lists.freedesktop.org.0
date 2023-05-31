Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20936718A27
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 21:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B11010E50E;
	Wed, 31 May 2023 19:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99AD10E50E
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 19:31:22 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-514924b4f8cso186902a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 12:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685561481; x=1688153481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XzmS9Q7rcF4wK+3M4xWTzjFrvHkAxzNx2k0i9sXDaBI=;
 b=kmUd0XwMBxGai5Os+SkdP4FhHNwp6VP4CdwZVb4ASXJHhhW5RA30JTo0fHGGLGewCL
 SagSqWzSx5FUD63hlEcd4px2errlCXd1ERTf4jwER+cI9yXSLKTlc3/CRf4/tzKkX3kM
 5eihEYPiPDX87UVMK8kYU9atiYTEUwDjlsOpXBMnoougeaHRkpzl8Vb7ca/kMIGfZ2fM
 HbcvRvqlRlXjNcptJYtsquDN+XvHmb8LBlMPKs6WzlvUZtcoNUkg9DRQgs5vtrvagyCZ
 KitkbHZMXXlqU6cgc5KyjUOTQHUU7jfTFXP0yER16lse8X4DOY1QpX7ZsCHf+Llc7WJL
 YQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685561481; x=1688153481;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XzmS9Q7rcF4wK+3M4xWTzjFrvHkAxzNx2k0i9sXDaBI=;
 b=PJf6ItR0qcj6FjwQD/rvJAgjqRzlB4Xq6b6ReV+/OFVdH4fQm+m5sG0D6y/yYY4Zxs
 Ol9uymSV1/vuZ0/mf4MPCV1L1rkI8cP6AUIWgpb0kRmZOlAbugbloRwhNOJAObME0Cm0
 uX6rRT2jKPYBJGA1szaPeXixOYdDEsLFkz1ULS6Isqwvbx4YUx63KzrQZdSTyti8AwGF
 TSBjCQJmm8Hn/+kkJyWQqet8twT7vHOVomf4rndd6c7NDJnySR5YlmmgtueSsxNc6gtd
 9UBFgemtctdEdGTnXOtbSgDubINu6NgvR8EpiFuxVjy0x7HRQ+s8tdclPQW1gQufCGzL
 GgrQ==
X-Gm-Message-State: AC+VfDw/2Lr193A2QM0o9o9VyWizWS0zteRZaNpjIYATne9D0/E/gZzd
 iD6WJWcfIF4CodHKEBQHywiPHw==
X-Google-Smtp-Source: ACHHUZ7YpDIJJ0TXK1hKPptboCJTxQbTSLxMFbGHVI4pYNLLWMwUqhrBPicY9RoBCBrZKOfJ3iNNWQ==
X-Received: by 2002:a17:907:25cd:b0:973:8823:f53f with SMTP id
 ae13-20020a17090725cd00b009738823f53fmr6334041ejc.52.1685561480773; 
 Wed, 31 May 2023 12:31:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 ss7-20020a170907038700b0096a2eaa508asm9414104ejb.168.2023.05.31.12.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 12:31:20 -0700 (PDT)
Message-ID: <4810fb0f-2b0f-0118-435a-d7373553163a@linaro.org>
Date: Wed, 31 May 2023 21:31:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next v5 2/6] dt-bindings: net: Brcm ASP 2.0 Ethernet
 controller
Content-Language: en-US
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 Justin Chen <justin.chen@broadcom.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com
References: <1684969313-35503-1-git-send-email-justin.chen@broadcom.com>
 <1684969313-35503-3-git-send-email-justin.chen@broadcom.com>
 <ce7366d0-616d-f5f4-56be-714e65a0a96e@linaro.org>
 <b21ca84f-a5a1-6dde-7efb-5d7ce0283263@broadcom.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b21ca84f-a5a1-6dde-7efb-5d7ce0283263@broadcom.com>
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
Cc: andrew@lunn.ch, conor+dt@kernel.org, opendmb@gmail.com,
 christian.koenig@amd.com, simon.horman@corigine.com, richardcochran@gmail.com,
 linux@armlinux.org.uk, sumit.semwal@linaro.org, edumazet@google.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org,
 pabeni@redhat.com, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 31/05/2023 21:29, Florian Fainelli wrote:
>>> +        required:
>>> +          - reg
>>> +          - brcm,channel
>>> +
>>> +    additionalProperties: false
>>> +
>>> +patternProperties:
>>> +  "^mdio@[0-9a-f]+$":
>>
>> Isn't mdio a property of each ethernet port? Existing users
>> (e.g.bcmgenet, owl-emac, switches) do it that way...
> 
> They are sub-nodes of the larger Ethernet controller block, hence the 
> property here.

This is the Ethernet controller. They are subnodes here, so what do you
mean by that? They are part of some other block?

> 
>>
>> Otherwise how do you define relation-ship? Can one mdio fit multiple ports?
> 
> The relationship is established between Ethernet ports and children 
> nodes of the MDIO controller, such as switches or Ethernet PHYs using 
> 'phy-handle' for instance. And yes, a single/common MDIO controller 
> could be serving multiple Ethernet ports.

We do not talk about generic case, but your device.

Best regards,
Krzysztof

