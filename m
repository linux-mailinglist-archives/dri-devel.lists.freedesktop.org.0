Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA1E6F0A7F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63CE610E14C;
	Thu, 27 Apr 2023 17:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCB210E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 17:06:05 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63b7588005fso7272801b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Apr 2023 10:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682615164; x=1685207164;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k4ophyycar0aN5e81E3kbl+YpoXereyDprZ51sERIL8=;
 b=i6/aY2NfYGxoC+7GgURKzVC56OJa2jvZNZjfNwibceLVJhzOOTtbUM4nfx6gLxx15S
 RziVhq7c2xc5YgOV642ohAS/HCHxv3mo4jF0rf2pssX6WyaJTyjOOU91sy16SWS5uNUZ
 ypOE3B30h4V6mp1paI0blkrj9pBTM1yDZjCoY04QOHrGZ+xUMgOn8va/PKoBIds2hOo/
 CWwbOQl31D0XH9cbPc2mAW08+xKpqNlzC0CqkBi8R624h/CRmqzpW0n0vXLw6fFXPnpa
 YW26CyGEF/Ar/zwq/JFfTZu30pcrndHVLXDtLrUr5L8GSyWBxmQDqml/6vuTvxlymv70
 0Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682615164; x=1685207164;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k4ophyycar0aN5e81E3kbl+YpoXereyDprZ51sERIL8=;
 b=jHEmyOoYkPc8Cppw/DGA931yI8NYNE9eiJORifpLKDVWjCvOLmKowpoz71cO0LqlJg
 lVidOdBcXn8z8PYMF5gSVRenztC7xHK4zFLGo0Dn0YGCQ1BkkJa6Jya2gms6/pnjTUMU
 nyOHNA8CajMvrSvdBC6soMsC4P0ozWfpv5HRLICi6FfG/Oj5oYMlIaJOvxJd/QjVy6ag
 kzgorMYGlKa0iF6nxy9t1l+Q67RzZbvK6Kxusp53qf6Z18lryhOlz39LwHOoXrdKQxnr
 g6O44xv5rfV1Yez3l6xmiNRpc2CwZuUZIk0d1MMunGReO9+A6oKF0grHmxg1fpMYwXiH
 Z6Zw==
X-Gm-Message-State: AC+VfDz1ud+gmFZWYp4O3JzETqQxVX6wm15kA0XOYEJcnM5O36iBAvja
 kzs6d12CivlMlEeFEWMZaJBlK5g6joMydA==
X-Google-Smtp-Source: ACHHUZ4mt7vAeiKnllxZX7gigR+rhFGQGjOgpputfITtx3lb+CeixxmjixTTJbcZp/ZQAPdkDYgwkA==
X-Received: by 2002:a05:6a00:1746:b0:63d:6825:d843 with SMTP id
 j6-20020a056a00174600b0063d6825d843mr3814843pfc.23.1682615164048; 
 Thu, 27 Apr 2023 10:06:04 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 k27-20020aa79d1b000000b0063b6451cd01sm13443138pfp.121.2023.04.27.10.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 10:06:03 -0700 (PDT)
Message-ID: <61bc7bc0-4e1d-247f-14ab-2a677af5aace@gmail.com>
Date: Thu, 27 Apr 2023 10:05:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 net-next 1/6] dt-bindings: net: brcm,unimac-mdio: Add
 asp-v2.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Justin Chen <justinpopo6@gmail.com>
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
 <1682535272-32249-2-git-send-email-justinpopo6@gmail.com>
 <20230427170354.GA3163369-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230427170354.GA3163369-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, andrew@lunn.ch,
 linux@armlinux.org.uk, netdev@vger.kernel.org, richardcochran@gmail.com,
 hkallweit1@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, justin.chen@broadcom.com, edumazet@google.com,
 opendmb@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, christian.koenig@amd.com,
 pabeni@redhat.com, sumit.semwal@linaro.org, davem@davemloft.net,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/27/23 10:03, Rob Herring wrote:
> On Wed, Apr 26, 2023 at 11:54:27AM -0700, Justin Chen wrote:
>> The ASP 2.0 Ethernet controller uses a brcm unimac.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
>> index 0be426ee1e44..6684810fcbf0 100644
>> --- a/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
>> +++ b/Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml
>> @@ -22,6 +22,8 @@ properties:
>>         - brcm,genet-mdio-v3
>>         - brcm,genet-mdio-v4
>>         - brcm,genet-mdio-v5
>> +      - brcm,asp-v2.0-mdio
>> +      - brcm,asp-v2.1-mdio
> 
> How many SoCs does each of these correspond to? SoC specific compatibles
> are preferred to version numbers (because few vendors are disciplined
> at versioning and also not changing versions with every Soc).

So far there is a 1:1 mapping between the number of versions and the 
number of SoCs, and the older SoC uses v2.0, while the newer one uses v2.1.
-- 
Florian

