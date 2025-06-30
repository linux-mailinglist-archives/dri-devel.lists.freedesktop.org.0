Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A310DAED790
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA17410E3C1;
	Mon, 30 Jun 2025 08:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bEdOZ2Qb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3B710E3C1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751272851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GbzS3/7wOLVYMQM7fq09DAq/NtYuBLxSJ0uQz6yllZw=;
 b=bEdOZ2QbURuCrL0henTaYx9k0jVwKM/+YJB/lPFgGN0LpbG3GDA6r3JJaD52cHOuneYS1j
 zqXHf7CmZlxRnpBqy5JAZPqwtfE0rX6hwmRV/KYa7X8tIlOJL8zvqtIcZ+pMANQnEEcMDN
 8pPic97UcCtiMwnJRa83XF5E9Z3dxKg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-L4RkQYrCNReR1XTEzNkQ6g-1; Mon, 30 Jun 2025 04:40:50 -0400
X-MC-Unique: L4RkQYrCNReR1XTEzNkQ6g-1
X-Mimecast-MFC-AGG-ID: L4RkQYrCNReR1XTEzNkQ6g_1751272849
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ae0dffaa8aeso323333366b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 01:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751272849; x=1751877649;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GbzS3/7wOLVYMQM7fq09DAq/NtYuBLxSJ0uQz6yllZw=;
 b=iDdV/RMIr4LhYoUviLzd8WLP5rkwMad/7hrNsqJphP1FfVTyRasIeQ8rXqsetO+yRk
 IXvOFthKI7+S18BpNto7ok39vNDz/SUwp6am224QWHNxhAUh4h06ahjT6K1tajD8lZ5D
 byaLa+6Zczgp6yOR/bYhn61s2oht+8ofDLjXKmzPbGFiZFHPPwPiL3P++HdKX4ngsvJP
 ZrgwOzQFSW6U8o3cftiYvovMu9Sf9bH0aWAo24LkXVJClGghpZchhYV4xJrHznI1L5Ju
 EVSB0z2lF8AEl/sUXaq47qJJt8RajfNzj6PeFkUxtHoMbl3xHcWS4CiiGbIW4qpcjP3t
 Z7Dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWU0bnSZBASiYfanYVK2uo3mpguIYsJVKtUBpRDwdKE/RdvqrouGqfVzUjDpzUPdNptxVti/TC1U9k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywi+k7uVKiFqbnHpDlr1d9rKAnlYlqhwvz4rXjyQEfWmH/9REeh
 9mtjzRYDmG/DOJeVfByRAjuD1mS++ShvXtCxPsdiMy6uFtf5rrGrxvArK7bCkcjKYdGBMlqmamX
 fxf9p6ZHVhB/Nbu8o2d6DubSipzWZwCZnCT3RcHGUsGcdxYmMDvIbMyoxhE4Dad6MYhVX/w==
X-Gm-Gg: ASbGnct07tH3ZMoRGllpFYxcNF9xLVW3rFd6u522o5PSOGph97Ojgv7QOJxk+WhF/z+
 2r54orzvAkJ7d3omGg7xLyFn7MqIxQwbDzR3kOwqWgSWjsr4a+cNaKUEMOVEn7+261GKAP02li1
 XsrR+ofkTqIKiXYISV32+Ha0GFqISTvLJjbx/4bBMZd1Bl/VjdGppxsp4QuN9PJO2OUDW7LeMdH
 eHSEPRNx6HlB7LQvj7GvZc2sWhNBYtx39jxymCRu27XjIdTmfHYj4kKuuKDIvjeXdZgy4Jm3PW9
 nD53UG7amaXHVgAfutVba/oz6/WkZSafUyjK6WKdTU3eC+Q4TL87oKrvFPu4iXs+bh5cIitp55f
 1da86PrCoYz4T2DWJtdG8CaZIA7zsULRGICoH5YAu1xuSwYeTnCSGaoV3P9xo5oDTS1S8VAyD+Q
 ==
X-Received: by 2002:a17:907:3c91:b0:ae3:61ea:31b1 with SMTP id
 a640c23a62f3a-ae361ea3303mr1065072366b.12.1751272848979; 
 Mon, 30 Jun 2025 01:40:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/y7vOHMHZ5AF4xuBNceBfPbSy8M7ATw5UKXH09WWku0rRQgHald4Jy38PCYx58QuWLBfH7g==
X-Received: by 2002:a17:907:3c91:b0:ae3:61ea:31b1 with SMTP id
 a640c23a62f3a-ae361ea3303mr1065069566b.12.1751272848439; 
 Mon, 30 Jun 2025 01:40:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae362cbf19asm547457166b.128.2025.06.30.01.40.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 01:40:47 -0700 (PDT)
Message-ID: <e534d496-6ce0-46c8-835d-94b3346446a7@redhat.com>
Date: Mon, 30 Jun 2025 10:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: display: simple-framebuffer: Add
 interconnects property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
 <20250623-simple-drm-fb-icc-v2-1-f69b86cd3d7d@fairphone.com>
 <20250627-mysterious-optimistic-bird-acaafb@krzk-bin>
 <DAX7ZB27SBPV.2Y0I09TVSF3TT@fairphone.com>
 <1129bc60-f9cb-40be-9869-8ffa3b3c9748@kernel.org>
 <8a3ad930-bfb1-4531-9d34-fdf7d437f352@redhat.com>
 <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <85521ded-734d-48e8-8f76-c57739102ded@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: i5I0nBoBWPWBa08bDE-4NYxhlYBJ53chQtsP-n7tfM0_1751272849
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30-Jun-25 10:24 AM, Krzysztof Kozlowski wrote:
> On 29/06/2025 14:07, Hans de Goede wrote:
>> Hi Krzysztof,
>>
>> On 28-Jun-25 1:49 PM, Krzysztof Kozlowski wrote:
>>> On 27/06/2025 11:48, Luca Weiss wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Fri Jun 27, 2025 at 10:08 AM CEST, Krzysztof Kozlowski wrote:
>>>>> On Mon, Jun 23, 2025 at 08:44:45AM +0200, Luca Weiss wrote:
>>>>>> Document the interconnects property which is a list of interconnect
>>>>>> paths that is used by the framebuffer and therefore needs to be kept
>>>>>> alive when the framebuffer is being used.
>>>>>>
>>>>>> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/display/simple-framebuffer.yaml | 3 +++
>>>>>>  1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> index 296500f9da05e296dbbeec50ba5186b6b30aaffc..f0fa0ef23d91043dfb2b220c654b80e2e80850cd 100644
>>>>>> --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
>>>>>> @@ -79,6 +79,9 @@ properties:
>>>>>>    power-domains:
>>>>>>      description: List of power domains used by the framebuffer.
>>>>>>  
>>>>>> +  interconnects:
>>>>>> +    description: List of interconnect paths used by the framebuffer.
>>>>>> +
>>>>>
>>>>> maxItems: 1, or this is not a simple FB anymore. Anything which needs
>>>>> some sort of resources in unknown way is not simple anymore. You need
>>>>> device specific bindings.
>>>>
>>>> The bindings support an arbitrary number of clocks, regulators,
>>>> power-domains. Why should I artificially limit the interconnects to only
>>>> one?
>>>
>>> And IMO they should not. Bindings are not supposed to be generic.
>>
>> The simplefb binding is a binding to allow keeping the firmware, e.g.
>> uboot setup framebuffer alive to e.g. show a boot splash until
>> the native display-engine drive loads. Needing display-engine
>> specific bindings totally contradicts the whole goal of 
> 
> No, it does not. DT is well designed for that through expressing
> compatibility. I did not say you cannot have generic fallback for simple
> use case.
> 
> But this (and previous patchset) grows this into generic binding ONLY
> and that is not correct.

I think that it is important here to notice that this is not
a generic fallback binding, this is not and will never be
intended to replace have a proper binding for
the display-engine.

This is just a way to give the kernel access to the firmware
setup framebuffer to e.g. show a bootsplash but also fatal
kernel errors until the real display-engine driver loads.

Note sometimes the whole framebuffer memory is not touched
at all and the sole reason for having a driver attach to
the simplefb node early on is just to keep the resources
needed to keep the panel lit up around (on) until the real
display-engine driver comes along to claim those resources.

This avoids the display going black if the display-engine
driver only binds after the kernel starts turning off
unused resources, this typically happens when the display-engine
driver is a module.

>> It is generic by nature and I really do not see how clocks and
>> regulators are any different then interconnects here.
> 
> Yeah, they are also wrong. I already commented on this.
> 
>>
>> Note that we had a huge discussion about adding clock
>> and regulators to simplefb many years ago with pretty
>> much the same arguments against doing so. In the end it was
>> decided to add regulator and clocks support to the simplefb
>> bindings and non of the feared problems with e.g. ordening
>> of turning things on happened.
>>
>> A big part of this is that the claiming of clks / regulators /
>> interconnects by the simplefb driver is there to keep things on,
>> so it happens before the kernel starts tuning off unused resources
>> IOW everything is already up and running and this really is about
>> avoiding turning things off.
> 
> No one asks to drop them from the driver. I only want specific front
> compatible which will list and constrain the properties. It is not
> contradictory to your statements, U-boot support, driver support. I
> really do not see ANY argument why this cannot follow standard DT rules.

So what you are saying is that you want something like:

framebuffer0: framebuffer@1d385000 {
	compatible = "qcom.simple-framebuffer-sm8650-mdss", "simple-framebuffer";
}

and that the binding for qcom.simple-framebuffer-sm8650-mdss
can then list interconnects ?

Regards,

Hans




