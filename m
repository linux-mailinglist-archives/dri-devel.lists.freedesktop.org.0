Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4506C877106
	for <lists+dri-devel@lfdr.de>; Sat,  9 Mar 2024 13:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E4A10FFBA;
	Sat,  9 Mar 2024 12:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HKWBOCGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9FF10FFB9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Mar 2024 12:22:32 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a3f893ad5f4so218903366b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 09 Mar 2024 04:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709986950; x=1710591750; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Uk5qL+AXvt/ohBX5H/1+jAQzY5GwDCBDsdL8XZZVOE=;
 b=HKWBOCGPffSWmzOTgIgnrZY6l7NbdjuKFsTF1ITRKRULm3X6NTGQH6aUYWk2Dh5luq
 ny8MZ0prkGJ2H5Bsh7B4w7j2/RufB0u1SJCgCgdP+lEAI5uoRdnID8PkbOVBjL0ab9qF
 hHySchXpfUThGTYmUeG8cTMuGZjAqxYutWcB3aiU/Tg0/Pi/VtkLkmpZuDkrKZSKWfwQ
 gaV8TEBE6O2vlKL/oI1tV1ziFJOiLvBGSCb24UiOd56YKJYaSE2i8Xn4g3cjDs4InHhj
 R3UzPHgs4oBL5qWf6OpIXWNbpsi2RXqCTuOrNHVMEPHmHUqivVs7xvYWseIUnvLvTZHD
 sOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709986950; x=1710591750;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Uk5qL+AXvt/ohBX5H/1+jAQzY5GwDCBDsdL8XZZVOE=;
 b=FU4CAFPdxPPTc9YENfXUcD/3sMnWAyUdPMgm6Wxo2h1eSZfH9u3EsgthnlmM4cj+0x
 kqqtYeBPOVn7CcMPgFu4fbiWJCYXSbul3m2jrNwOdvHKiyPbc3r3toq+GLGcimANYimB
 aCV2FrVWCK8+or8k6eCf6r7CdOiq3Bi1RH/kAT4v7mStnn2nrVsWKavuJXQkOwyi71+c
 vT4NOYrlWsXnR5+fCng4l9MB1ge1Svg6t+OKAS+04etCEv4Vsi6sQD+MouGjKj+rsXqu
 EuTY2Wbx/Y9/+MGUny+ov3CPkw80qFB+5N/gCX5xW4jctp2sq/59x57icCgoXtA17y/C
 Q/Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFMxLg6k6VSawObdk4CswC+rxHlCW8GbXudcHFxl7T7AHKoYjS0eGa6/y/mQzfv3iCvT5PKg+D4tU8narUCGlHvISHmALQgsaUZRgTHMgL
X-Gm-Message-State: AOJu0YzAcX9x77YV/8z3Ted11rFoaG5lO+qN2F99Eb8+94LIP7yn9KKc
 xMz1PNT2QzEbWZSEJHL57PREup66NkS8Wa2CLxJb9KprTzahjmB8gXo3fYTHd8k=
X-Google-Smtp-Source: AGHT+IHplcnhWLXqlMf50pcthYdu+PovyDjXD+M/4kI7kucXMnzj40QwiVoaEBKVr/qMCNP95lVynw==
X-Received: by 2002:a17:907:c20c:b0:a43:af0b:ec31 with SMTP id
 ti12-20020a170907c20c00b00a43af0bec31mr876236ejc.53.1709986950317; 
 Sat, 09 Mar 2024 04:22:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
 by smtp.gmail.com with ESMTPSA id
 f10-20020a170906560a00b00a45670f68e7sm832297ejq.92.2024.03.09.04.22.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Mar 2024 04:22:29 -0800 (PST)
Message-ID: <4f3cf3c2-c5ff-475b-af5b-3fb698325c60@linaro.org>
Date: Sat, 9 Mar 2024 13:22:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: Add Texas Instruments
 LM3509
Content-Language: en-US
To: Patrick Gansterer <paroga@paroga.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240308215617.1729664-1-paroga@paroga.com>
 <cb220c6f-086c-4995-b2e2-bce78b9a4b04@linaro.org>
 <f97b4a8e-7944-496d-9bed-20e8076a327b@paroga.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <f97b4a8e-7944-496d-9bed-20e8076a327b@paroga.com>
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

On 09/03/2024 13:09, Patrick Gansterer wrote:
> On 09/03/2024 12:53, Krzysztof Kozlowski wrote:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +patternProperties:
>>> +  "^led@[01]$":
>>> +    type: object
>>> +    description: Properties for a string of connected LEDs.
>>
>> Are you sure this is a string of LEDs? How does a string/tape work with
>> a backlight, I mean physically? How could it look like?
> 
> I just took most of the descriptions/names from lm3630a-backlight.yaml. 
> I understand it in this context as multiple serial connected LEDs (as 
> shown in the circuit diagram in the datasheet), so that each of them 
> gets the same current when connected to the output of the chip.
> 

lm3630 might have copied it as well. LED strings are true in case of...
well, LED strings, but I just wonder if such setup is applicable for
backlight. Anyway, if you think it is, I don't mind.


> Maybe a more general question: Is there any easy accessible information 
> about which code is the best used as example/reference? I tried to align 
> my code very close to the LM3630, but you gave me a bunch of comments on 
> that ;-). And would you like see patches cleaning up some of the code 
> with bad/outdated style?

There is no such reference, except example-schema. Usually newest
bindings, which passed review, are the best source.

Best regards,
Krzysztof

