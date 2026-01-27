Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNamOJuzeGlzsQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 13:46:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F4C94753
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 13:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E0210E0DE;
	Tue, 27 Jan 2026 12:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bkDpU4nM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C92D10E0DE
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 12:46:15 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2a7a94c6d4fso26598955ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 04:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769517975; x=1770122775; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0f9xEgBB4m5dikvKwwgGmgDkV1uot0Bgrh0VsHDieZs=;
 b=bkDpU4nMhiKWelD9PTjlX5xlMdL3mMuXts6XgvtkcMQJGQDRWBTWAkUcOk6jdIulJH
 LG1hBSb0QwfiZxl95qsHgL2BooQV5FWrWnJ/eMDGJEF2/cgmYfZZ6K12TOCc3NlEKlpD
 7qNX/w2aC84M68Tbo++0npChQVoT9n6I5PjKyznUFk1rsthxra35jEeHYzScHZTgTv1C
 ffCuTKKvF+ijStip32a8AT3atqxwuuWkrdM2rqSJWaM1qymLkKyg0YW45PTXlj22Nrhs
 HTymrCMgR6g7/jIQH6JmcthooxgBzXJpgw5+w8VyIoiI8keW5VFG7VwU4Pit425xQZN+
 SfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769517975; x=1770122775;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0f9xEgBB4m5dikvKwwgGmgDkV1uot0Bgrh0VsHDieZs=;
 b=CaeLIge1gwEiXuUZcDcRt5pjU7wqCyNi6C9GvdlptDxM0uXtx1IZEhePonJnkkCaRz
 pz8ZhmY2fG1g5GwVkckcpyp2VC2GKKOkrprT2osa0DNle0pMd+3OTvUIkcELrMxV3mfh
 gDSQdUCNkH8tqUaUzqUvyuMXksi3xywp/VOXoY2FOX+t+5fN2wEBA1w8cMjHDIpA5TEA
 p/mJUoa7LnHN6Wmy8ylUcLwDcuY5nTJIbAxRedoQ8Qqv+MGKNSH4rEzlwI+RmF0PAI7E
 YhfobN61X5TxZ0en/gTXzYJPhzZEptEwxOvvoRNkiDYKOHkYA5GUwEwDNgMli+O/uHqQ
 875A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+/C3mr+9fawfG1W/83W/M77jQI9bnRguNa+r2JRoug4bZNN6wVuuQdG31nyIYYCF/an1UntIus1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHaSCkifAWwRq7FZmYE6YNnIcaclxwo0fEHbrdDpXMjGBpeGWx
 huubyu/dibsTL/thqYWc9kFCdCkF3fwp74V/4uj0BrNdJ2mmwIIpGAn/
X-Gm-Gg: AZuq6aIc+kee25eI/UYgO5OV6u6rrNZJ9qtU6vLcwL9KDZaBk3nj3/ksy5viLkyyKXI
 h4Z4tavT6PVI1nImZmMPhtnhnSYfg0Z5L53H/fqwjspvdiln2F+tb6zP132O9KAs1FbAxyJNneE
 CzWOB9u5Y1uhQ1GirMv1G0NJ7bEc3/DI0RhTi2u8EheDjCagnN6iA+NkNBszMj3fvdA/SrbRoW0
 HTXYQuVmJquySr9J+ai4cOqJWR5QvGXoAmptOSPkh9+vHTOm1ECyxJaBIWvaTUFmSGPlBM+JnPr
 Tr5HDjjAEDjTRORY5/Z4S22eeze6sMymtMONwB4CVD1pNiRkW6ib+RKCGZB+FXv7Nf0kOyKDQw4
 6NOCJ4R9uEthXEgeoKpq9HzZrG/SuwuNJYv2vziqQOOFZi3slIme+czGDeFUfYH/GxBsNLj87rg
 WnAX0SdQpHXPELZVOXAdFJ5ja1xThNDKsBrw==
X-Received: by 2002:a17:902:e802:b0:2a7:a5b3:bf4f with SMTP id
 d9443c01a7336-2a870de2274mr13541465ad.34.1769517974606; 
 Tue, 27 Jan 2026 04:46:14 -0800 (PST)
Received: from [172.16.20.12] ([136.226.253.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a802daa675sm119001545ad.15.2026.01.27.04.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 04:46:14 -0800 (PST)
Message-ID: <5f78fbe8-288d-4b0a-af57-e834bd1186ba@gmail.com>
Date: Tue, 27 Jan 2026 18:16:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
From: tessolveupstream@gmail.com
To: Krzysztof Kozlowski <krzk@kernel.org>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com
Cc: deller@gmx.de, pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260120125036.2203995-1-tessolveupstream@gmail.com>
 <20260120125036.2203995-2-tessolveupstream@gmail.com>
 <3f3c47ea-1660-4bd4-ab89-3bdf58217995@kernel.org>
 <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
Content-Language: en-US
In-Reply-To: <54d156ba-e177-4059-a808-2505983b4e2e@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:deller@gmx.de,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-fbdev@vger.kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tessolveupstream@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[gmx.de,kernel.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 49F4C94753
X-Rspamd-Action: no action



On 23-01-2026 16:41, tessolveupstream@gmail.com wrote:
> 
> 
> On 20-01-2026 20:01, Krzysztof Kozlowski wrote:
>> On 20/01/2026 13:50, Sudarshan Shetty wrote:
>>> Update the gpio-backlight binding to support configurations that require
>>> more than one GPIO for enabling/disabling the backlight.
>>
>>
>> Why? Which devices need it? How a backlight would have three enable
>> GPIOs? I really do not believe, so you need to write proper hardware
>> justification.
>>
> 
> To clarify our hardware setup: 
> the panel requires one GPIO for the backlight enable signal, and it 
> also has a PWM input. Since the QCS615 does not provide a PWM controller 
> for this use case, the PWM input is connected to a GPIO that is driven 
> high to provide a constant 100% duty cycle, as explained in the link 
> below.
> https://lore.kernel.org/all/20251028061636.724667-1-tessolveupstream@gmail.com/T/#m93ca4e5c7bf055715ed13316d91f0cd544244cf5
>  
>>>
>>> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
>>> ---
>>>  .../leds/backlight/gpio-backlight.yaml        | 24 +++++++++++++++++--
>>>  1 file changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>> index 584030b6b0b9..4e4a856cbcd7 100644
>>> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
>>> @@ -16,8 +16,18 @@ properties:
>>>      const: gpio-backlight
>>>  
>>>    gpios:
>>> -    description: The gpio that is used for enabling/disabling the backlight.
>>> -    maxItems: 1
>>> +    description: |
>>> +      The gpio that is used for enabling/disabling the backlight.
>>> +      Multiple GPIOs can be specified for panels that require several
>>> +      enable signals. All GPIOs are controlled together.
>>> +    type: array
>>
>> There is no such syntax in the bindings, from where did you get it? Type
>> is already defined.
>>
>> items:
>>   minItems: 1
>>   maxItems: 3
>>
>>
>>> +    minItems: 1
>>> +    items:
>>> +      type: array
>>> +      minItems: 3
>>> +      maxItems: 3
>>> +      items:
>>> +        type: integer
>>
>> All this is some odd stuff - just to be clear, don't send us LLM output.
>> I don't want to waste my time to review microslop.
>>
>> Was it done with help of Microslop?
>>
> 
> I understand now that the schema changes I proposed were not correct, 
> and I will address this in the next patch series. My intention was to 
> check whether the gpio-backlight binding could support more than one 
> enable-type GPIO. 
> Could you please advise what would be an appropriate maximum number of 
> GPIOs for gpio-backlight in such a scenario? For example, would allowing 
> 2 GPIOs be acceptable, or should this case be handled in a different way?
> 

In line with Daniel’s suggestion, I am planning to adopt a fixed upper 
limit for the number of backlight GPIOs. The current hardware only 
requires two GPIOs, so the maxItems can be set to 2.

If future platforms or customers require support for a higher number 
of GPIOs, this limit can be increased and the driver can be 
updated accordingly.

Kindly advise if this solution aligns with your expectations, or if 
you prefer an alternative maximum value.
 
>> Best regards,
>> Krzysztof
> 

