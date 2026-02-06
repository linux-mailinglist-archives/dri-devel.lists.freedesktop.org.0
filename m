Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKkHKUQohmmSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45675101471
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E025810E889;
	Fri,  6 Feb 2026 17:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eiLzYSBs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3914610E627
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 09:21:35 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-82318b640beso1102200b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Feb 2026 01:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770369695; x=1770974495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DHcOD9pDSPOBKmWPMOHD8g7QnZvvQliE20szaOYrjF8=;
 b=eiLzYSBs4KHvPx4zBvboEXT8bXNagNZ+4hAvuFxLx77OCYsgz9TlEhrwnHfhePGQiB
 YoyII5UuZjAhojqNrBOKCqQfMsjoSGAsxxZEEAMPyHFexG/yaeC8B/G5TYo/Px8f63Lg
 652FXkp6qBVOPcK1C4WU6XoGYqu7xczTXgwCUmUb+yaqdhyMrYvPNQUW/shcwMm7YfOT
 DXYAaF5ZXU71wZcoqyATUYSXk/yPXzQ0HYiBNMUcDgnvpYYSuqpNbVfKVGF4Mt2locSG
 hJGsSMo9yHt1y4bRnOuL5vZUFmn+yOQnYnc2v7Qz8NWZm6uGK8mpW8XjFmvr+Pw1al7R
 /WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770369695; x=1770974495;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DHcOD9pDSPOBKmWPMOHD8g7QnZvvQliE20szaOYrjF8=;
 b=qeN2Dx3o3SL03Eo9CBfcxlPFRQnhrDAVjgua+cmWIP2sJq9Ffwr/biE/MO1/QEAmdz
 0Ebhb01H12QpnLlxFm9LdBr4zaU2ttpLFbpU+p6Qmfx1QtFK8Hse4Tw2NJM6/s+AG8/L
 Kncj/S3aqZvu2Ql35j/1lzQgDKLqgMLMYzs5EZGZC3G1u8HH6mT3qqmscwgA4eCF9Dab
 mdNLjO6OXFl7HQOiUzyeUyR/eUJ/Ab0QKRdwCM2MyrUUit5JXVx7t3/PCFvhKaYcez1D
 zNp2BY7uX3rwqOirj5WUervZ6BGEon7Uiikh0gz4JiKd3I3My2Fi83MtD4WsM9FvONgh
 SLSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNjwQ45DCGJzg8uZ4jJbQQpXzNIa3aNoO0cTguw5OfzAno/dqo1P/kAJ4R+3+3/A6zdWq0Ul+j68w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7sDJVy+q0vMBt2jy2fnd3atWI9W12qw6HrqY9rfmRHAR/CYBa
 jR9bzXUD26rmyCSJeQUBI12nyvwZy3R1zmXEaQqAnlhpnsduKrcKlL0+
X-Gm-Gg: AZuq6aKBqXeXsidnqrunOJQ53cYOLcP8uFcCYzY59ORQE+jDuubbi7t80oKnn88lDJy
 5f6qZkFhxlUfDx1InKQ6cKtuwEeWLhmR48i6J5+K0HHp2nhqj+3JxvScwl0Nx7qzihQO9Fifvpn
 Lnya14BzYnawcWd8Oja62tMyw4h5Pk1ULRq40cQLTih3VqDvZV9hAxF0ZEg5zUUL62+WwiDB58a
 6eKDivwh+dJ+MXnFPgkzvOT8gN0rCK9OXFfxzyOpHoOWaHzru1rDi6ffIwQqh2Fatn/5jcq0rLv
 WtjNgV1qzY9jo6S5IVjBoBkF2C0zHEm23bbpKj2xCZHoKtNKjKQPk4TLgTrcZXgIY+SIUEp+5C7
 MxkzU6p4/ymushjnqBmVIVqLPEPCxoh7MPcxDWS7d8UkIeyV3CNd9cWGAJSGIiR6wVbdWu7dC0/
 TUHP833YMQGN3h6FcL6U2SxWQ1uO7qsWOYe3wWLsCxK5JkrKTY083H0t9w8k0UqCoq
X-Received: by 2002:a05:6a00:158e:b0:81f:4c37:7647 with SMTP id
 d2e1a72fcca58-824417a9046mr1511837b3a.68.1770369694600; 
 Fri, 06 Feb 2026 01:21:34 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824416cb967sm1632051b3a.30.2026.02.06.01.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Feb 2026 01:21:34 -0800 (PST)
Message-ID: <1a82e38f-2009-47b0-bfb5-c2624bb06719@gmail.com>
Date: Fri, 6 Feb 2026 17:21:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: ma35d1: add display
 controller support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-3-a0987203069@gmail.com>
 <20260205-tactful-warm-chicken-50bdc8@quoll>
 <a0910eb7-4597-45a7-b538-f2feb021f389@gmail.com>
 <7c29f46c-aa27-4569-9170-53538785e029@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <7c29f46c-aa27-4569-9170-53538785e029@kernel.org>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nuvoton.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[2.111.199.128:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 45675101471
X-Rspamd-Action: no action


On 2/6/2026 4:56 PM, Krzysztof Kozlowski wrote:
> On 06/02/2026 08:12, Joey Lu wrote:
>> On 2/5/2026 9:23 PM, Krzysztof Kozlowski wrote:
>>> On Thu, Jan 29, 2026 at 12:05:31PM +0800, Joey Lu wrote:
>>>>    &uart0 {
>>>> @@ -129,3 +165,23 @@ &uart16 {
>>>>    	pinctrl-0 = <&pinctrl_uart16>;
>>>>    	status = "okay";
>>>>    };
>>>> +
>>>> +&panel {
>>>> +	port {
>>>> +		panel_in: endpoint@0 {
>>>> +			remote-endpoint = <&dpi_out>;
>>>> +		};
>>>> +	};
>>>> +};
>>>> +
>>>> +&display {
>>> What sort of ordering rule is followed in Nuvoton? Why is it different
>>> than DTS coding style? Why do you choose other style?
>>>
>>>> +	pinctrl-names = "default";
>>>> +	pinctrl-0 = <&pinctrl_display>;
>>>> +	status = "okay";
>>>> +
>>>> +	port {
>>>> +		dpi_out: endpoint@0 {
>>>> +			remote-endpoint = <&panel_in>;
>>>> +		};
>>>> +	};
>>>> +};
>>>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>>> index e51b98f5bdce..7d9d077f12b2 100644
>>>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>>>> @@ -379,5 +379,19 @@ uart16: serial@40880000 {
>>>>    			clocks = <&clk UART16_GATE>;
>>>>    			status = "disabled";
>>>>    		};
>>>> +
>>>> +		panel: panel {
>>> No, there is no way your SoC has a panel.
>>>
>>> Don't add fake stuff to your DTS.
>>>
>>> Best regards,
>>> Krzysztof
>> I'll move panel nodes out of dtsi into board dts.
> You did not respond to several comments in total, it's fine, but if you
> just ignored them, then it would not be fine.
>
>
> Best regards,
> Krzysztof
Thanks for the review. I've gone through all comments carefully.

Some points were addressed directly in the next revision,so I grouped a 
few replies together since the original code will no longer appear after 
the update.

I will also restructure the DTS so the panel is defined under the root 
node to follow the standard hierarchy and ordering conventions.

For remaining items that need discussion, I'll reply inline one by one.

Joey

