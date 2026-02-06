Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDCBLEUohmmSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1D3101479
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0118110E88D;
	Fri,  6 Feb 2026 17:43:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KYWyttvr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D79410E39A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 07:05:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso14864905ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 23:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770361531; x=1770966331; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0haU+G8kaq0CKeXvOdlPG1qWpXklEM3L/X+ta2ZlzJo=;
 b=KYWyttvrxnmNEnQ519jvC/iKUmyETi+x+pcB8Psb8r8BtZUec/nPiRxRgr6/9VGh7M
 VTZ608+ClQoGwCv9AzfXUOAtGTAjJL88GXvHbOf7f4K5h0QuwhM8PLeN/5QTfIe6E/Ga
 j8CqKTHH7UnTbbX+UMUqGBROJ/IuOiLNJuoPYpuIPU/GiuAWf2dSnZRGKfTvXsJbMJdI
 QxW0qMYeyAfEuLCX0OeteTADh6p7sJ+DfZFp2zNmcI1CgbJXclLyNDWWBcUuFjOoh2II
 v8bgRsqnFCFzohnbroJhNrW0z/MtSN/W/Hl2Sl/kVF3J/Pz33yNeX4EZqFOtl4T9RpBz
 fmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770361531; x=1770966331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0haU+G8kaq0CKeXvOdlPG1qWpXklEM3L/X+ta2ZlzJo=;
 b=ZupXOU7qYTCrMSDu0tlnrmzV5Todyoziq54FcG08vnwNhvFdVerwQ94PHwJ50QhpsL
 6CaIxPsi67LAUURl4ccjS2YV92WBgO1UadXdT2YoltjTNHqwow1OWOX+8BbaYCfZ1Ihm
 CcrQglM6/9PY8GQIcleTM+nZjM0gESbo+WsdXkP+m0zqKrTezcYIe21RkYU80xAB+crq
 Tx+okBPvmrfPqcP46A82qeg+cFaPxyhc91IiJrH5mzovErrlSxc1h3xP0OjRcTs+toAK
 CKd9mFYRMiPpZqoVCegMJZoT0vQLitgHi7DDd9f5Cy9jWBJMC0moY2DUbeFQ+cue+F7W
 3G9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUW1HoyAj+DK6v7cpnOfmL2qULZvv60P6zj9xfccHUhw+yKJQCg/zqOn4vL7ModfP7DjBio2HCx2LQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq0951UXrQat8qjKE2AHaaPtYtLgylEA5AfPGenytdpidPmYVQ
 15kwqGXglb0PsTpj/xmZmqh7odkjI7Ox/OjlLCqMXuwF4zRJAw4Wks7E
X-Gm-Gg: AZuq6aLM0UNuwdpbKxKAe3+OJjOoTA03GGMO6RQsrGt59Ig3ps71CuEOpvsa63oWfVL
 zOcKUZ9LvjhwQpcRyW/J6//kojmoojIfIDZG9XSErk8TecC+UiPoIv0yBidIxMozoFzYp6tQ9tj
 Ohog3OS8hV/ysBk4YKZ2+hJVVFpqPEjWHYLSoQ56uPJ+evmsh4kGM2P3IrSOSLhTTcySgkeFSNC
 867iC/tZF3gukiox/TOiECdG0RJPmutstaafHpk5civFjwubyJ9oS46KeWVDeGdp/6+b2q8t+71
 xHELXcR1siYm5cctVR6mDab1QzBd5Yh7fD42B+tYcTV+gWWtuLsOdoiH5V49ctElKJe2wc3nY4F
 +7LUvU+EP4JcRJ3m/ko777iPu7H2wbJ/QMPtRJpyeuacd7utOYY+zhkpUvZihtb4f1cxwNrh8IV
 XVx9yPRuPwU6AcEdnsr0rHLfMIhbk1EbhN/u6OHme7G3M+HsEX4gepK5DfQRyYDVm3
X-Received: by 2002:a17:902:f546:b0:295:745a:8016 with SMTP id
 d9443c01a7336-2a951605e16mr19839485ad.11.1770361530915; 
 Thu, 05 Feb 2026 23:05:30 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a9521b9bc3sm13778935ad.63.2026.02.05.23.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 23:05:30 -0800 (PST)
Message-ID: <31ad6a98-66c7-4e95-b40f-ead8c594a212@gmail.com>
Date: Fri, 6 Feb 2026 15:05:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU
 binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-2-a0987203069@gmail.com>
 <20260205-psychedelic-brave-toad-db4936@quoll>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260205-psychedelic-brave-toad-db4936@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 06 Feb 2026 17:43:15 +0000
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nuvoton.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4F1D3101479
X-Rspamd-Action: no action


On 2/5/2026 9:18 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 12:05:30PM +0800, Joey Lu wrote:
>> +
>> +  clocks:
>> +    items:
>> +      - description: DCU Gate clock for register access
>> +      - description: DCU Pixel clock for display timing
>> +
>> +  clock-names:
>> +    items:
>> +      - const: dcu_gate
> That's bus or apb
>
>> +      - const: dcup_div
> That's pixel
>
> Use descriptive names of functions here. Not your clock controller. It
> is completely irrelevant whether you provide here gate or div or mux or
> whatever else. If by any chance in new design you put here mux, not div,
> then completely new binding?
>
>
> Best regards,
> Krzysztof

I'll use functional clock names bus & pixel instead.

Joey

