Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DC667AADF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 08:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF7D10E736;
	Wed, 25 Jan 2023 07:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB51110E738
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 07:28:16 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h16so16070822wrz.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 23:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0juD3Z6CRCmdLHAmguPHCfD9MzYp+16yRKaiS/m80wE=;
 b=hJxiagec1rMDmnWfW5Db4ImIGKsN81dLF361HfBJP8gONdeMsQyVbgsv7K0lPF+6FT
 YD3DGQd8VLYNojWtfWnDmovrjYzRRV8h74Bq+5b65qUON8i5QrRbdvw0ZbMbPOCyO8FJ
 yZNbD8ZWFKyi+jn1oyL7JMVdFx6Npj5RpjZozks7cLPnw2soJDZ7F6VTPpqgYH2zI2Kk
 3JyxsqEzKEnRU6LN3haphIkjU7qd1bprZTL7m5w1ngAP0ZhCsM6JtiqG4VfW13QzJjBC
 +JqSq7CQnBEBerxs6/Gi60UodIESSToTeelYUJgURCdi07LHNfhSmBPOM1i3aFy+v2gZ
 1n9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0juD3Z6CRCmdLHAmguPHCfD9MzYp+16yRKaiS/m80wE=;
 b=h1Ilr3nisvVnbL8druMAERK2gzpTjpcJuaHxs/XvemIKIN0jnluIO3vRctCN+is3Wt
 5485cIXNIdcnUhCbdQGrzuM5CqtKYpkRb82H2grHWSBYVeLGTgY+XbW4lxLRHdbBt1UO
 E2y7CciA4hdt0N9G8DOH9qg88T8Rj3LiF0L4MC/275G2d/JJhk//6MACubtzn5URQhjw
 7ZYhAYv/9BzoTi90Tm0Pi3cM3fDbPtZEgvSmFoUmk9+22JqZy5i2VvMJDlaePKb5rf7Z
 cnA3IH3E1Ylp7kVVebkbccm0Z6OQOLM/5q8uKERdRJFB5QNQ+rhwv9FG5QJtt8VHfeOF
 fFAQ==
X-Gm-Message-State: AO0yUKWUHOTUZeaYrDSVLB22OSRgL2SPQNF8ErSngKKC1VgtocHnmZ9f
 ygJaSQaHvOi3sMCnqEBICczOqw==
X-Google-Smtp-Source: AK7set9lUBCjZ9+aqMQcWhmoChQgZw7gc5KBt4C0vQo4fYLZ0wwqlOF3vMs9z66OwHjipriVA7x0sQ==
X-Received: by 2002:a5d:4f87:0:b0:2bf:b2c2:e122 with SMTP id
 d7-20020a5d4f87000000b002bfb2c2e122mr3656874wru.29.1674631695385; 
 Tue, 24 Jan 2023 23:28:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g16-20020adffc90000000b002882600e8a0sm3788880wrr.12.2023.01.24.23.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 23:28:14 -0800 (PST)
Message-ID: <e053aa6d-8a0b-b0ea-85e7-a1b35fd00e53@linaro.org>
Date: Wed, 25 Jan 2023 08:28:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] dt-bindings: display: simple-framebuffer: Document
 physical width and height properties
Content-Language: en-US
To: Rayyan Ansari <rayyan@ansari.sh>, Rob Herring <robh@kernel.org>
References: <20230121153544.467126-1-rayyan@ansari.sh>
 <20230121153544.467126-3-rayyan@ansari.sh>
 <CAL_JsqL+G=Cxkc2j_NowznpqNAnixrU+-6SdccFbpMaP6OYSqQ@mail.gmail.com>
 <cdf32cb0-4529-6bbd-fdda-ae641d141ee5@ansari.sh>
 <20230123175339.GA2019900-robh@kernel.org>
 <3d448210-e9d2-b0ee-e009-535bb0bb760d@ansari.sh>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3d448210-e9d2-b0ee-e009-535bb0bb760d@ansari.sh>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, janne@jannau.net,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 ~postmarketos/upstreaming@lists.sr.ht, asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/01/2023 23:19, Rayyan Ansari wrote:
> On 23/01/2023 17:53, Rob Herring wrote:
>> On Sun, Jan 22, 2023 at 05:25:38PM +0000, Rayyan Ansari wrote:
>>> On 22/01/2023 15:36, Rob Herring wrote:
>>>> On Sat, Jan 21, 2023 at 9:36 AM Rayyan Ansari <rayyan@ansari.sh> wrote:
>>>>>
>>>>
>>>> Why do you need this change?
>>>>
>>>> The 'simple-framebuffer' contains data on how the bootloader
>>>> configured the display. The bootloader doesn't configure the display
>>>> size, so this information doesn't belong here. The information should
>>>> already be in the panel node, so also no point in duplicating it here.
>>>>
>>>>> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
>>>>> ---
>>>>>    .../devicetree/bindings/display/simple-framebuffer.yaml   | 8 ++++++++
>>>>>    1 file changed, 8 insertions(+)
>>>
>>> Hi Rob,
>>>
>>> There is the usecase that Hans has mentioned, but I have also mentioned
>>> another usecase previously.
>>>
>>> Adding the width-mm and height-mm properties allows user interfaces such as
>>> Phosh (https://puri.sm/posts/phosh-overview/) to scale correctly to the
>>> screen. In my case, a panel node is not available and the aforementioned
>>> interface is in fact running on the SimpleDRM driver (which binds to the
>>> simple-framebuffer device).
>>
>> Why is the panel node not available? Why not add it? Presumably it is
>> not there because you aren't (yet) using the simple-panel driver (and
>> others that would need). But presumably you will eventually as I'd
>> imagine turning the screen off and back on might be a desired feature.
> 
> It requires more than using the simple-panel driver: first the SoC side 
> display hardware needs to be brought up, then a panel driver that 
> implements the proper DCS initialisation sequence needs to be written 
> (which is currently not fully known).
> 
>>
>> So why add a temporary DT property that's tied to your *current* kernel? > The DT should not be tightly coupled to the kernel.
> 
> I'm not sure what you mean by it being "tightly coupled" to the kernel.

It means that you used current Linux driver support (or lack) for some
hardware as an argument for bindings. If you add later the driver, the
bindings should be changed? Answer is: not. Bindings should be
independent of Linux drivers, thus whatever kernel is missing now, is
not an argument in favor of this property.

Best regards,
Krzysztof

