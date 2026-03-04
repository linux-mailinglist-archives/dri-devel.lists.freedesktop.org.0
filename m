Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMIHMc6RqGkLvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:10:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0120774D
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 21:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F40710EA9C;
	Wed,  4 Mar 2026 20:10:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KddNp545";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A61310EA9C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 20:10:51 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso1534278f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 12:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772655049; x=1773259849; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LWiObVokoGo44EDF8550QchMq9i7Dl/51e+1IUk+1eU=;
 b=KddNp545V2XQmkj/2NVNWN+XjCTCyBbFzsg74bzpwpkl999wueNgoEBxYIynW/7ixe
 JxVZ3SG8iAKpY826ihbYMcf/UGMGtKyhC4UNcgDjeY45uvlr1cyMRetSwScQsIacvVHC
 RYrfvV4Blc+DqDbiTinvKgJ7AiIq/jOxsOVYs5QSyS82nhLY0oI1qmH/yEowEtQWyrcv
 uZOavT/ydmoFx5/C2wXgQ3vwQqKByAujYk1grGPlI7SMjuz/GFeqZfs1f70GC/cRLAYF
 7B6d4dkbcXlJO/PGIoOjFe+U/wnlYYgMCVl5hQVYLxCX11lJG8fWec8M9bU5JPSEGJqN
 oBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772655049; x=1773259849;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWiObVokoGo44EDF8550QchMq9i7Dl/51e+1IUk+1eU=;
 b=wKk2rD0QngKH6uJwHBq7amATNvmyNlU8LKiO/FysrNmZo+P9VVu/IFxiCSOaVBNJwr
 ZtDhOQLeDYRTubiXrE1vj7C5yCuNj6dZvNKXfH5XLbMLDRTkXoSiI8ArMhS43tnj7QEC
 UukJbvkwv3GtRcKGluSA6Ak2v6Z5xEdco6unXuATICrgLxL00YTEvhNwM5FRSDAtlkbG
 MbDW6PqHqFMeU3A+C7aupFC4oTvlNURbxNlJ8F5ThJYrEvB6iw1tRHeBITz8Mve2n1fj
 7FQPDyQzSlNHEFDq+BCvqN5xYC7qmWxmoAfUbhAnA4RTRkNHNyg1B3B9TbJeIqWlFuUB
 5p2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMI4+QJ4EpYe/kAf0nBnjnW0u/E/TEz9NdmPrtZGCTo1KXSkviD2L6HMfg4NIOvZT7rsfl5W0HcUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoknNHF+BnXQ+SHAUuotZzAyfALony9Y71vRI4WDq5+dDkf/qv
 AuIW3HOP8B548rQZqfYLZjB8o3iz4r/bION165C2nmt+Xt5B83VycWcifmsRzkZ6mCw=
X-Gm-Gg: ATEYQzxs/bG7sHNVpmZXZZ0xw4dF/oRMKFI4kQ3QleCT4Ol+W/C6blx4/Ek4mL3WRNT
 sZtwyUIe128RmmzHFVEfFXgPyCcptVZUceRup5ybITNqJAoJYUua/MJD+ie+r/Ol8JZEaMm/1Gx
 yhqjxf36P7pAvmlT2w1UqO8kE27qGefsIPAKDw5ZCOmaDKTr7I2XLRZRAIe8wrrTDGLJmbvFxhD
 +5cHNx0k/2Kq1vePUpRTgVEgGSs9MvEFe+0ro6EuOiXP2TTAlodb7eT+pSCeiiMj1WcBh4CTALZ
 T9TWf4aYK22F9s6OD3PcBYZRaT/gH0pU0DiBfsA7PqFRNR40mv4883J7fVztYIlJ/sR8/3gSqQf
 LxJpQVcN5YapiwhfBrksgrxNx3wIG1xIq/3ojplGGU/H43krz2n7y+76e2j4OKpDU1Isvx3RGET
 JtgHgahSaKAVGpA2nuUWCwRY1cRns5FmB0V7Q3yGTQbcYCGlYYZriqZhJXuin/1f0h12I5Y6Cnq
 xfCL8P5VZkGLQ0=
X-Received: by 2002:a05:6000:2509:b0:437:6dc8:c372 with SMTP id
 ffacd0b85a97d-439c8006f92mr6648350f8f.38.1772655049457; 
 Wed, 04 Mar 2026 12:10:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:73bc:1eca:d39e:509?
 ([2a01:e0a:106d:1080:73bc:1eca:d39e:509])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439abded86esm35075889f8f.6.2026.03.04.12.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 12:10:49 -0800 (PST)
Message-ID: <8e7cff06-4b6a-4034-9b9a-1d4ae69a9bab@linaro.org>
Date: Wed, 4 Mar 2026 21:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver bindings
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Teguh Sobirin <teguh@sobir.in>
References: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
 <20260222-ch13726a-v1-1-e501d78e105a@gmail.com>
 <933fd2e0-46ff-4ab8-b98a-554ac46982c5@linaro.org>
 <CALHNRZ_TdVDy93uvM=p7ht50v0Y2W4Ji4ZsFwPFAgR8FZh=myw@mail.gmail.com>
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
In-Reply-To: <CALHNRZ_TdVDy93uvM=p7ht50v0Y2W4Ji4ZsFwPFAgR8FZh=myw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 30C0120774D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org,sobir.in];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,devicetree.org:url];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 3/4/26 18:56, Aaron Kling wrote:
> On Wed, Mar 4, 2026 at 10:32 AM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> On 2/22/26 23:26, Aaron Kling via B4 Relay wrote:
>>> From: Aaron Kling <webgeek1234@gmail.com>
>>>
>>> The Chip Wealth Technology CH13726A display driver is a single chip
>>> solution for AMOLED using MIPI-DSI. This is used for the AYN Thor bottom
>>> panel.
>>>
>>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
>>> ---
>>>    .../display/panel/chipwealth,ch13726a.yaml         | 66 ++++++++++++++++++++++
>>>    1 file changed, 66 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..890984b00c341285066176995e6a973c5607cbde
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
>>> @@ -0,0 +1,66 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Chip Wealth Technology CH13726A display driver
>>> +
>>> +maintainers:
>>> +  - Place Holder <place@holder.com>
>>
>> ??
> 
> Please see my reply on the cover [0].

Sorry my bad, yes add me it's fine

> 
>>> +
>>> +description:
>>> +  Chip Wealth Technology CH13726A is a single-chip solution
>>> +  for AMOLED connected using a MIPI-DSI video interface.
>>> +
>>> +allOf:
>>> +  - $ref: panel-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: ayntec,thor-panel-bottom
>>
>> ??? why not chipwealth,ch13726a ??
> 
> Because this is a driver chip that supports multiple panels. The
> driver code I based on also supports the retroid pocket 5 panel, which
> has a different resolution. Similar naming is used in the rocktech
> jh057n00900 binding, which is why I picked this compatible.

It doesn't work like that, add a compatible per physical device, not
by driver. You can add common fallbacks if the panel is the same as another.

> 
>>> +
>>> +  port: true
>>> +  reg:
>>> +    maxItems: 1
>>> +    description: DSI virtual channel
>>> +
>>> +  vdd-supply: true
>>> +  vddio-supply: true
>>> +  vdd1v2-supply: true
>>> +  avdd-supply: true
>>> +
>>> +  reset-gpios: true
>>> +
>>> +  rotation: true
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - vdd-supply
>>> +  - vddio-supply
>>> +  - vdd1v2-supply
>>> +  - avdd-supply
>>> +  - reset-gpios
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +
>>> +    dsi {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        panel@0 {
>>> +            compatible = "ayntec,thor-panel-bottom";
>>> +            reg = <0>;
>>> +            vdd1v2-supply = <&vreg_l11b_1p2>;
>>> +            vddio-supply = <&vdd_disp_1v8>;
>>> +            vdd-supply = <&vreg_l13b_3p0>;
>>> +            avdd-supply = <&vdd_disp2_2v8>;
>>> +            reset-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
>>> +        };
>>> +    };
>>> +
>>> +...
>>>
>>
> 
> Aaron
> 
> [0] https://lore.kernel.org/dri-devel/20260222-ch13726a-v1-0-e501d78e105a@gmail.com/

