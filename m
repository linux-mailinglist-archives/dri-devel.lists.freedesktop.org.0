Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OB6tFQXLeGmNtQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:26:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A529598F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 15:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C87B10E589;
	Tue, 27 Jan 2026 14:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QEjl88uw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C6810E587
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 14:26:09 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so2509285e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jan 2026 06:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769523968; x=1770128768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=DjwjvW1TfSwNKp13nluNXuupXNtMKRFXmr36DD91OKs=;
 b=QEjl88uwPvrK8IhgAHcEzcydCU6NjKMvLMTxdzMiSNFpIskEw4COpwDAzeXE47Smrn
 gd4AUOtBnAPwtW4XC98RR7rY4stESOvVTwFGQk2CKCO/XBv3Mh4FDN8clskcGr8gZMpT
 MJIaNPGD+SMT9CVLRvh44vFLnJYfx0cmCX8X5FPtTefzdLkVDg6Lh4+Io2ylxqZ0SlNI
 xsofPSCTd9dHbwp/pa84oh2uxZA65rZgu8Rsri21MtQcFj98f8X6t5RuM4qrLRvwUzxS
 ExAUq/2mRdZrArE+GotoLKptVJ8mhN0ruxi+jIbltgqnXVL6IsunxRUoXCYj5WzBCYmD
 6KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769523968; x=1770128768;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DjwjvW1TfSwNKp13nluNXuupXNtMKRFXmr36DD91OKs=;
 b=S56gaDC6d19KX9x8vIchG15ptS7pgzuT/GV+7rU8xOpa0tlUFrzVQ96rTo1GgiBK4Y
 IHFq/0rFjC0gO+hrPjsC1uA/7ambLhhZv/fpBlu4phQv97Xt0WDeytEiYv/bpwgBYMFr
 lZ5Eblvulnu87+ydOdRE5jjk0p9qZkIv0XN5sYL3+AvQrR5PIz6AHGy4QckE7AKzPusC
 vBNLyz7l9naOOPLdyovfR0m97nt0aZsLSpzqZogf4UBCh3aAWi4ID609aYlRb9MHCjQf
 4gqOQXNQcLwTxBHbpiiHud47xf5Q+PESHlYucxmGFt4jZpp9NZm64jcpp+UnaPOWFm9i
 YRWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm0Al/T0W3hdCjo5B3IeLM3b4pINoUndI1Bt+EWxFUN36WEDF6yJ+0ulzQLy9wUY68SayIFRGTKoQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1gJbiVxg0duElOFehJ4cJJtvGFOuuD/aNilPNetIjv0H0FNTR
 RC9Ej6kz8v8jaioiSCqiUsUbetWIx3ZavjqVvevAEv9F08E0iwA93pfPpRkHoJU+w60=
X-Gm-Gg: AZuq6aLQrY//eKVFwNL9853kkDzHWJ6Y2WjRLs1TxbsQnLtt2+RZ7+GCBIHyssZYeeV
 4Zn8OMT5AnzxqhaOFn3GvrsXh8S8KOs/g7pqY57yMyiJmXu6cFbGE6bP7Un4PLw9qns94cMwvok
 4lE+7DoKY+Apte2rt3zoy1BHnHxfYTh6UEq3kigSLXwh5jkbIDxlKDjPyKL0PDt9HDUfYPBXYaO
 cZ+7C9o8KqBHEANu+I/8SKg8plv+a3k8y6N7+9bh4we4czgpJ3SD4pS4UDn71fopP1Ndi9FQBLG
 nFdSki1Jqb1hDrMUxD9W7FXsDY/E/98htK78IfDLz7rcgLAz99Un3LvCvJmrkN3zewHamEPOKLw
 xlfSoeIXWLJgcO4AjYpMYCdbdKRgo5pxPu9giiz3FHrp0KfJDjJQCIcEtn5K4hQVjeCF7a+/yna
 CGvvckOZUNHBWChyEL9LItbQ6BPyORmaGNUODtRDWK7pDNCfcMCWn9BsWGDDKoQtY=
X-Received: by 2002:a05:600c:4e90:b0:47d:333d:99c with SMTP id
 5b1f17b1804b1-48069ea1029mr22857745e9.18.1769523967879; 
 Tue, 27 Jan 2026 06:26:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d?
 ([2a01:e0a:3d9:2080:53a6:bd3c:8e65:509d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804f5ad4c1sm124946785e9.12.2026.01.27.06.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 06:26:06 -0800 (PST)
Message-ID: <3157e5a7-19f3-404c-8842-3f1942de03d7@linaro.org>
Date: Tue, 27 Jan 2026 15:26:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-1-c55ec1b5d8bf@linaro.org>
 <CAMuHMdU9HcK3xX=itqe2di1HS1SJvV6=ySqKyrtj7Yr1yXyuqQ@mail.gmail.com>
 <6e8c3d6b-8cba-42da-bafa-28becfa15d60@linaro.org>
 <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <CAMuHMdV=u280N2HUgpiHtRXuMv0RhtDeEFDaSLFQ0Wg8frt+6A@mail.gmail.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gregkh@linuxfoundation.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:brgl@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-usb@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-pci@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid,devicetree.org:url];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: C0A529598F
X-Rspamd-Action: no action

On 1/27/26 15:02, Geert Uytterhoeven wrote:
> Hi Neil,
> 
> On Tue, 27 Jan 2026 at 14:55, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>> On 1/27/26 11:20, Geert Uytterhoeven wrote:
>>> On Tue, 27 Jan 2026 at 10:57, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>>>> which connects over PCIe and requires specific power supplies to
>>>
>>> Here: "requires"...
>>
>> Sorry I don't understand
> 
> Please read below the continuations ("...") below...

Well electronically the IC requires those voltages

> 
>>
>>>
>>>> start up.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
>>>> @@ -0,0 +1,55 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/usb/renesas,upd720201-pci.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: UPD720201/UPD720202 USB 3.0 xHCI Host Controller (PCIe)
>>>> +
>>>> +maintainers:
>>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>>> +
>>>> +description:
>>>> +  UPD720201 USB 3.0 xHCI Host Controller via PCIe x1 Gen2 interface.
>>>> +  The UPD720202 up to two downstream ports, while UPD720201 supports up to
>>>> +  four downstream USB 3.0 rev1.0 ports.
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: pci1912,0014
>>>
>>> Just wondering: how does having a new driver
>>> drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c matching against this
>>> compatible play well with normal PCI discovery and probing of
>>> drivers/usb/host/xhci-pci-renesas.c?
>>
>> In Linux, power control is implemented as a platform device driver,
>> so it doesn't collide with the pci driver.
>>
>> The pci driver won't probe until the device shows up on the bus anyway,
>> so he power control will attach as platform for this purpose.
> 
> OK.
> 
>>>> +  avdd33-supply:
>>>> +    description: +3.3 V power supply for analog circuit
>>>> +
>>>> +  vdd10-supply:
>>>> +    description: +1.05 V power supply
>>>> +
>>>> +  vdd33-supply:
>>>> +    description: +3.3 V power supply
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>
>>> ... but no power supplies are listed here? ...
>>
>> None are stricly required, they can be supplied directly without
>> a passive regulator. Not sure they should be required
> 
> So the goal of this binding is to document the required power supplies
> which are not required? I am confused (but that could just be me ;-)...

but you're right, I'll mark them required...

> 
>>>> +examples:
>>>> +  - |
>>>> +    pcie@0 {
>>>> +        reg = <0x0 0x1000>;
>>>> +        ranges = <0x02000000 0x0 0x100000 0x10000000 0x0 0x0>;
>>>> +        #address-cells = <3>;
>>>> +        #size-cells = <2>;
>>>> +        device_type = "pci";
>>>> +
>>>> +        usb@0 {
>>>
>>> The actual DTS uses "usb-controller".
>>>
>>>> +            compatible = "pci1912,0014";
>>>> +            reg = <0x0 0x0 0x0 0x0 0x0>;
>>>
>>> ... also not in the example?

... and add them to example.

>>>
>>>> +        };
>>>> +    };
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 

Thanks,
Neil
