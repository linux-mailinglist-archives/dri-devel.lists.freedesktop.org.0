Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCj6I7NeqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:32:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB50204529
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:32:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E943E10E596;
	Wed,  4 Mar 2026 16:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zNQqL2Dj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE3910E596
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:32:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48371119eacso85387725e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641966; x=1773246766; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=YzBLKK2SPFT1wsSEyBgdZB5voy4EsI1LK+m46W4f00k=;
 b=zNQqL2Djl1ATYnOc50sObFsICk0kzcK8D8KG90pfPCN2NCA0xdERcXeiT0Hg+OU/j3
 Mj5nAFjfNct9MUddpC3qMVKBy9+x4+dFPKWiA2LpbFA5xVcdC1tXF+oiYPJ10JsEYkG1
 3wrSV+BUoolIW0GsCJgIowmFJO459/WN3FSOJ5ykESX5AAJFOCNHFI7xwG+gn05LHfee
 TZeL+A8yf/dZ23t+GDOy5uD4scexquoKjlhlpjkcgeTshWZOXjPG+qcFzYrUfS06jfA6
 2LqpsRrCowSfpZ5okMaJuN3jvO6ZW+77AXNxZh8CLH3byFxJz4/kqpQ0a2xXkQM1r/fZ
 ztJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641966; x=1773246766;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YzBLKK2SPFT1wsSEyBgdZB5voy4EsI1LK+m46W4f00k=;
 b=mzr3OdDCAcWM//o6h+4BFzvoZdU9uL9ng4hS32LnIVKmh6lfdR2VRb3LaWvUmfMdIu
 P9TN9EOWPxsR+hPkV6D4FFDAV3Q+USEqbwZHcS8dCxxwRoyOR6rim8sFM1lSh7S1LLWF
 2UATubRAeQRNSHBtyP7nEVfc1MzCSkOAT1LTrgTvDKLDYHpIrS3LPAINqb8T0VBiQrfl
 n3I0CXEv9gHQIV4p9aTngXuWDn4CfzBYPoPXS0ESjgUWqzdCknG71aPKLtHjpPkzevVy
 xPc5mp1RTazpowRRIBZaTd8FpsL+cbJcIwmzjNb0a6grfdz5WEGTjI60EkF5QkvSF+VH
 x6Tg==
X-Gm-Message-State: AOJu0YwcpJ34yURn7M6c77QtMwFM6kuUNxYx7zYOuZA0/+x0oR+U2Xi1
 EE5HTm0qqsWQkuDz3vOnOF5CsMGv+kH1hZPW/+hxBDrBPq6mCGR/PsUVDY6GgzF9Cl8=
X-Gm-Gg: ATEYQzx1qgkBdJqfplfYWPezvaghhPAuJy4gQ/nIFIxTCm4/Xwi/7D3pxIRkA4oNz1w
 9MsBssLIL3+ZzMsMOuYLInnzNhyFOh/gnPPsno4EOkgqdfQgfa+HaZuso1FgjygRxxEGsDmaRuB
 MsCNyqNl0vHS2s9VMBM5FQVQDvppdYUGMR7kZIZDDcq74Uk2hfDQoWh0vyAaHaT9+nDYNykADO2
 Hpu/vdpGqon3/N8JlLNnrJW9PoTo5KjcPMU6csxhQvuJWchB5zvTjNefGthDO0RAPpbIGFLGKv1
 1red4QrU6d8Qi+wcpq/E1ioxM3AlHhsnxouN9LpNc1f0stc548VFahSNhJnslqJOVAMYgY41Vdu
 gdcinLxtSiXovkyE8BTaAvfRxI+G+AG+kGooFuqJUVl+AqveaSn4ZNn7/QNMvvNTJZHLgmVTyAy
 hWwVNYWHC1bja3V4IYAMvm+k5oMzeLzVgG3+ChYrdwyuBDZf0Pa5a8iKCmhQi0KcSL7Oe2QrWE+
 DC250uyA3FcbSs=
X-Received: by 2002:a05:600c:8b67:b0:483:498f:7953 with SMTP id
 5b1f17b1804b1-4851989cb45mr45028445e9.28.1772641966114; 
 Wed, 04 Mar 2026 08:32:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851acf3124sm25994175e9.3.2026.03.04.08.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:32:45 -0800 (PST)
Message-ID: <933fd2e0-46ff-4ab8-b98a-554ac46982c5@linaro.org>
Date: Wed, 4 Mar 2026 17:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 1/2] dt-bindings: display: panel: Add ChipWealth
 CH13726A AMOLED driver bindings
To: webgeek1234@gmail.com, Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260222-ch13726a-v1-0-e501d78e105a@gmail.com>
 <20260222-ch13726a-v1-1-e501d78e105a@gmail.com>
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
In-Reply-To: <20260222-ch13726a-v1-1-e501d78e105a@gmail.com>
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
X-Rspamd-Queue-Id: EDB50204529
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:webgeek1234@gmail.com,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:dkim,linaro.org:mid,linaro.org:replyto,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,devicetree.org:url,holder.com:email];
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
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/22/26 23:26, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Chip Wealth Technology CH13726A display driver is a single chip
> solution for AMOLED using MIPI-DSI. This is used for the AYN Thor bottom
> panel.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>   .../display/panel/chipwealth,ch13726a.yaml         | 66 ++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..890984b00c341285066176995e6a973c5607cbde
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/chipwealth,ch13726a.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/chipwealth,ch13726a.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Chip Wealth Technology CH13726A display driver
> +
> +maintainers:
> +  - Place Holder <place@holder.com>

??


> +
> +description:
> +  Chip Wealth Technology CH13726A is a single-chip solution
> +  for AMOLED connected using a MIPI-DSI video interface.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: ayntec,thor-panel-bottom

??? why not chipwealth,ch13726a ??

> +
> +  port: true
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  vdd-supply: true
> +  vddio-supply: true
> +  vdd1v2-supply: true
> +  avdd-supply: true
> +
> +  reset-gpios: true
> +
> +  rotation: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - vddio-supply
> +  - vdd1v2-supply
> +  - avdd-supply
> +  - reset-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "ayntec,thor-panel-bottom";
> +            reg = <0>;
> +            vdd1v2-supply = <&vreg_l11b_1p2>;
> +            vddio-supply = <&vdd_disp_1v8>;
> +            vdd-supply = <&vreg_l13b_3p0>;
> +            avdd-supply = <&vdd_disp2_2v8>;
> +            reset-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
> +        };
> +    };
> +
> +...
> 

