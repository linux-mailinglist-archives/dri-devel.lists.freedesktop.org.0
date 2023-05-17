Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 950FA7060AA
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 09:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8623010E3B4;
	Wed, 17 May 2023 07:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D5D10E3B4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:03:48 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-966287b0f72so62480766b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 00:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684307027; x=1686899027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=skuWGLhcahKcfpI9gv7EyAfzwDHEZGuI7n4LLTizb9I=;
 b=xcgAb9uPdAdq0nlFzp3iDfOIwtyGfWnBk7u2+E71JkslkOFLtAD8fhA4D1h/k5gZsI
 WvNeZoWUuFqtS2GIo8vRwKh5qoZqTDJ6KP5BrDGj+VXcEK6ZudfdBgeH6Yztu1GeAzOr
 jIFb0Va1Kg9/B97T61jibpyEXt72R6RE7uo+qJYo+as8nb42gGtPc/4l8B6Loyv+qXT2
 zjE0ftbDZGIAa2AulDsP67AumuvGQucK/et8shEU5UN0G1Po/YYUxz3vyLxxNCLy/qL+
 4Tw4+o8uh1wk9ReW5FpREZFG/TWzY3vPJDBKDvj/9MatKtEMmwWJo1J8IdEi/6lwrOvW
 4Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684307027; x=1686899027;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=skuWGLhcahKcfpI9gv7EyAfzwDHEZGuI7n4LLTizb9I=;
 b=SKV0Zx35GauETI7SjdTsYYVgzqJ8qAcPrkTeCFaoMD4Uczy6BusJeuvBYWsPBua/x7
 nb/AQRIS74sjJP/nyXHQj3AaWlNgLRzXuUCRUgatFWt+QVYHoUccS4oNCoS+cBIGTPkH
 1Luutm9qJyhCR9/FtHXTgjJrY4kchSaj4RoBTtvhAgTuWL7psPw+iWYF9GyPUKh6ygEA
 5b7atutS8W12MKyYtahyW1h//MJmdk4dCncES+gYhNZLf0p0wxMKJAK5MtRIBzGzhtTH
 meAkL1igmscPPil7aXmoWyGla3yF+/e/S3fSW8kHJgx4BOWZjRgiDhBM2Y8j927kj/Ve
 AfVw==
X-Gm-Message-State: AC+VfDz7u7u3Ci0hbPMS1U1TnAWp2HsDH7YzXvP3oKsLUOHpOof2rPk9
 x7KPolVrZNbgjZLiKZi4Qk12Qg==
X-Google-Smtp-Source: ACHHUZ7PbnK+4EsSURGPM2BgTIgsWuRJr6EknCyxYT2iu2yURY/Jp855T0yFgP+syLZqbCRC0hNxLw==
X-Received: by 2002:a17:907:3ea5:b0:96b:559e:7f2f with SMTP id
 hs37-20020a1709073ea500b0096b559e7f2fmr8394708ejc.38.1684307026625; 
 Wed, 17 May 2023 00:03:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d?
 ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
 by smtp.gmail.com with ESMTPSA id
 hv7-20020a17090760c700b00965be665811sm11871346ejc.2.2023.05.17.00.03.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 May 2023 00:03:46 -0700 (PDT)
Message-ID: <97124cb1-4f45-22d5-418f-568f8a68deec@linaro.org>
Date: Wed, 17 May 2023 09:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 00:13, Paulo Pavacic wrote:
> Hello, thank you for your time to review this patch and sorry for not
> addressing all of the concerns, it was done unintentionally. This is
> my first contribution to the Linux kernel and it is quite a process.
> I have run those two scripts and haven't received any errors I have
> latest master cloned so I will check what I did wrong.
> 
> The thing I would like to get approval on before I try anything else
> is the name 'panel-mipi-dsi-bringup':
> 
>> Still wrong filename. You did not respond to my previous comments, so I
> don't really understand what's this.
>>
>> Judging by compatible, this should be fannal,c3004.yaml
>>
>> If not, explain please.
>>
>> Missing user of the bindings - driver or DTS. Please sent patches together as patchset.
> 
> 
> I wasn't sure how to name it and this name seemed fit. I'm not sure
> how to be concise about this, but here is the full story as to why I
> have done that:
> 
> I got a task to enable panel for which working driver wasn't
> available. I have started testing raydium driver and modifying parts
> of it until I got it working.
> Driver was modified quite a lot, new functions, macros and structures
> were added which resulted in a new driver.
> Therefore I have made a simple driver which I have submitted for a
> review which will probably be rejected now due tomany reasons I have
> noticed after sending it:
> https://lore.kernel.org/lkml/CAO9szn03msW6pu37Zws5EaFGL10rjp9ugPdCuDvOPuQRU72gVQ@mail.gmail.com/T/
> 
> While talking with manufacturers of the panel I have figured out that
> they aren't that familiar with the Linux kernel.
> They had previously only enabled  it on bare metal (PLA?) and provided
> me with the initialization sequences. Initialization sequences are hex
> values sent over MIPI DSI to initialize panel controller.
> Initialization sequences sometimes also require delays after certain
> commands and for different panels it can be very different.
> I believe I have simplified it so that someone can follow comments
> inside of the driver and try to enable mipi dsi panel by copy pasting
> initialization code from bare metal system and doing minor
> modifications.
> Since I have targeted this at people who need to enable their panels
> for the first time name seemed okay. I thought that since there is
> panel-simple.yml that panel-mipi-dsi-bringup.yml would be acceptable
> name.

Bindings are for hardware, not driver, so they describe the hardware panel.

Best regards,
Krzysztof

