Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I0qCkAohmmSKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90310144E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 18:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D779D10E86F;
	Fri,  6 Feb 2026 17:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kj9a0d5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB14A10E3A1
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Feb 2026 07:13:00 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-352e2156450so196453a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Feb 2026 23:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770361980; x=1770966780; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3UW7bwvIJSmR6JD5JewClPLgD/uZ6ndB7iEUdc/rSvY=;
 b=kj9a0d5KrsU/nGngz+pHYmSyVdVoIZDQ+0qG+XyWDig/B83WT2GnN6PxWGxgFrm9p0
 m74L0MPDZgOjKOZFr1G8tbYnz/aEGKaa1wwi880Qi7efSD6m98v2+R53qZHMIpiaD3dI
 /IL+igA8fWkfNfVGCNW+aak16Yd0d3Ms0xZ+eGj8LsqFaa19EhQT1PhZHxfyN3QLWL52
 Vez7uNUOJtmY5vp7JxX8YTNz8NKSWymbBpHItEdgUTVpfeoFeITXp3RiqzdDpzFLajX3
 cShnsGgehrcFvcYgP/LEyKZE+7pHCLUhQnE6l7AltLlfleaTWx+dz7goKgtR72nftasW
 S5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770361980; x=1770966780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3UW7bwvIJSmR6JD5JewClPLgD/uZ6ndB7iEUdc/rSvY=;
 b=ASUfZM77QLS1N9l2F6il5Jg3LzaN6+xFqeq8U3SiIYudNOn/VunrBv7sfE5vY7QKgN
 d/Kw6TIeEtzCKSnOFQ5tBIdVL681Jx7u/qg/10SVclpPb/VfMSQiN1mNoPHus6pCl/K/
 rvh/aCf2Nxu2K86NfWz42aUUudxc/GQ7v5WEaeSfiiiycCPiQTp0wKbLQmsLmE+BsDMx
 33XixczcI8RRPllgFe/kYy6XeatVYaPA4lrVOE7Zmdo+2ykH+TBOTkK6flDpjaKBlJwv
 cVhmTrtiFpItkUJ7KkIIDuBBvka5kw6QD/OCxAXfMxga8qd/vugR539ws4Ifbe2vMFiH
 YWpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSpcz3WdFRwDFicMFRbZ8X7DcbVfwcU6p/Qq1WtGoTxveJo87w2i5bs2j2PdVTdHFHzQHjI2JJDgA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBKGd/fzhRs3QR0s/+aIVn8C53JvdkN0gXq7eeMLRT9C7vDqy/
 0ClVOm+kKIB/dyZKAn6Fzm/j/H4IeL0AArDTqUPb/6qr33GnB1IyFlTH
X-Gm-Gg: AZuq6aJ9NoW2KolHD30LyGxvbOrsEOzBUJ5vUCWxIoyR95UbONLyEGXjMyG1Ui7bBIY
 ujDfWGQe9dpRbVigip/mJzYk5+ewlSodos2K7D9vD62pCs7fv6W0w6/9S7EIHIfvmT6gF81LJxH
 M/3aXD1yj3+pbYeRc8cGO+HtVBZNETBYAt6SpAYkbAEX5M09jvbH77yH9XqbRRUh95BDtBK7icn
 36bdO48URHDinbkuoHcXhWZ2+xwP9+Pu6cmeSmr/i+TCxHlsnPg7Zq4wqNpl9TkdhULQIUk7gEy
 nDVww9J4JkqcxSZBD1bHL8rA6ij4doAFEUpLEOpXYuSnRH8mEoQBcbbhwS4pnBQzCl0rJsgcmCB
 kX1uFiUr8AltYJvHeSUpEqd7GfZyCm8m42f5yceEddUQ8YqqK1kGavUFn5S9G7OZrMjgrOvM2TB
 Xtnc3YBld/pP2U6o1HZZA0KXg79bk7yp2dNMxDnEcwrRnutkSjOAPLG9We/oyQxr7j
X-Received: by 2002:a17:90a:dfcb:b0:330:bca5:13d9 with SMTP id
 98e67ed59e1d1-354b3e5e993mr1427756a91.32.1770361980362; 
 Thu, 05 Feb 2026 23:13:00 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6dcb52494bsm1411203a12.10.2026.02.05.23.12.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 23:13:00 -0800 (PST)
Message-ID: <a0910eb7-4597-45a7-b538-f2feb021f389@gmail.com>
Date: Fri, 6 Feb 2026 15:12:57 +0800
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
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <20260205-tactful-warm-chicken-50bdc8@quoll>
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
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: 7D90310144E
X-Rspamd-Action: no action


On 2/5/2026 9:23 PM, Krzysztof Kozlowski wrote:
> On Thu, Jan 29, 2026 at 12:05:31PM +0800, Joey Lu wrote:
>>   &uart0 {
>> @@ -129,3 +165,23 @@ &uart16 {
>>   	pinctrl-0 = <&pinctrl_uart16>;
>>   	status = "okay";
>>   };
>> +
>> +&panel {
>> +	port {
>> +		panel_in: endpoint@0 {
>> +			remote-endpoint = <&dpi_out>;
>> +		};
>> +	};
>> +};
>> +
>> +&display {
> What sort of ordering rule is followed in Nuvoton? Why is it different
> than DTS coding style? Why do you choose other style?
>
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pinctrl_display>;
>> +	status = "okay";
>> +
>> +	port {
>> +		dpi_out: endpoint@0 {
>> +			remote-endpoint = <&panel_in>;
>> +		};
>> +	};
>> +};
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index e51b98f5bdce..7d9d077f12b2 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> @@ -379,5 +379,19 @@ uart16: serial@40880000 {
>>   			clocks = <&clk UART16_GATE>;
>>   			status = "disabled";
>>   		};
>> +
>> +		panel: panel {
> No, there is no way your SoC has a panel.
>
> Don't add fake stuff to your DTS.
>
> Best regards,
> Krzysztof

I'll move panel nodes out of dtsi into board dts.

Joey

