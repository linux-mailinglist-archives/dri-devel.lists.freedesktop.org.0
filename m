Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4F7CF741B
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 09:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 121C610E4A1;
	Tue,  6 Jan 2026 08:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rAnI0K3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EA410E4A1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 08:16:35 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-47a8195e515so4736555e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 00:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767687394; x=1768292194; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=4AKaw+nd+gT2mIZJK7ahgYo6tCiYKJOStvoi/mlUV2E=;
 b=rAnI0K3mw/GBSGd1XMh0Q42K3Pn+3EyxcLQCDJNgJSPQJtrrSS3uYhipRXlUNqkeTv
 CIlteZNM6aftXSchyw0a+9F+dgOsDcbPkVKckFSnOvgMBKouM0oCJqEiLtipg9ENFBfx
 208p7mDTba+x0CVU/OJvN1H00/vuedPCGSkyYXbOVFqbOEeOXEaR/Et7O8FpWTOQ/S/v
 0oN9Eld5wkLb5pPSETuaRNdcxsPAu0tUpEcusmgPBVVmCsCCCBcvI59x0SS3sSkDlhAS
 apojVLD2HxlsH9VXB1pWuuB1jSNUrheXAX0/dyHwtKlM+Q/jRsEGFCdyqoInXIHgvsew
 JR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767687394; x=1768292194;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AKaw+nd+gT2mIZJK7ahgYo6tCiYKJOStvoi/mlUV2E=;
 b=ngMA661uC1TOf7AjSRJT29Ee29BLl+uGngCkDSB6/1dJscbBlhoLbKGesXZTqVP/iE
 Jvdjsi6JABE8slu8uPpHxDppwIOmzCFJXt55eJzV54MCUlf4NUymFrd4T/6wZI9ZcViv
 Fwridj3285hI/SEd4Yh4oOicBAzvJZ4nRCsvixAYLXROphmHXGYp84iauYwRDOiWkfkn
 jU9sT4OML9nruZ4CeSmug3ONOY4BAOEnJIRqy9Paf1tl1r0SNRBaeC7OXXrdDoKNys5F
 5OUXOgZgMNE7zMXs/Rt/tMvWdYAkBS61+93/2wFJptiEnhUxGLvr8Vs1LzW+lP6uy4w7
 wVDw==
X-Gm-Message-State: AOJu0YxQIXRID++oXiWUW2g0Wp2ohkEDTxskXSj7ceHNOr5MbxqGFPTe
 nWr4Zgm9dnFuKMkpfrZfkDmXdXi6LRdYUGqslH5FKYOaS1jPGz989k9vI3m3OTqWtfk=
X-Gm-Gg: AY/fxX4kNMe4uihT8cwEulZBeU4XdclTFq5AzZmFHeOm4jvRddKv+6iErjsGBjQWnLj
 /GSkxvhLFPwNS+8rQbzBjxoRhFHCDsgxymRtohf5H2IG14oj2sKhAxejeEc2wFrWC3Q0OvUJLLR
 TPiHE283YSLRO+WHvjl5ODwh+lxIftm3aPUGXOs/3x8SHkIfiC6Hd3C7dKnHlad779487JBBasd
 JAIkbNYTME+Hvq05mhn+L4sjWUgwEN97NMvXc7OVqnIzUQwUlMI03qNJ/8VL2K9bVqhGruXbgSM
 l738PICFvWYGPyHbZWt0MsQH/JQJ2MNSjDvnBombaBXPanUE2HC40uf10RWfo9bEY8XdHiVjKVx
 dcGsSFqM3DoCdzu2j7/LGBZ7azN2rYjYiF4cwlsTBCH4gvrvFd2ywI4WOtNHdONtRTbo4zTRNmN
 ozVRMLhd0mqvACP5YEKmNyLmll5C8R1C/8KCQZtLPI/e0iYP5TKzadGC4BZI+F1z8jNLanrv+2m
 w==
X-Google-Smtp-Source: AGHT+IE3f13/LhwclvOmb9Uf+FihBvg9CEqaG02RP4E8A3rTQtaeNLXmdMGGRVptI2AUliXaHd5fTA==
X-Received: by 2002:a05:600c:848c:b0:477:8a2a:1244 with SMTP id
 5b1f17b1804b1-47d7f075dbdmr21593075e9.11.1767687394351; 
 Tue, 06 Jan 2026 00:16:34 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7fb26c20sm12640885e9.7.2026.01.06.00.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 00:16:33 -0800 (PST)
Message-ID: <4d46750c-6c49-4fc6-9e4e-e5a479eae2aa@linaro.org>
Date: Tue, 6 Jan 2026 09:16:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel-simple: Allow "data-mapping"
 for "yes-optoelectronics,ytc700tlag-05-201c"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260105193220.3166778-1-robh@kernel.org>
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
In-Reply-To: <20260105193220.3166778-1-robh@kernel.org>
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

On 1/5/26 20:32, Rob Herring (Arm) wrote:
> The "data-mapping" property is in use already with the
> "yes-optoelectronics,ytc700tlag-05-201c" panel, so allow it in the
> schema.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index fc244fbb5a54..e4a5b30ccfc9 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -349,7 +349,9 @@ if:
>       properties:
>         compatible:
>           contains:
> -          const: innolux,g101ice-l01
> +          enum:
> +            - innolux,g101ice-l01
> +            - yes-optoelectronics,ytc700tlag-05-201c
>   then:
>     properties:
>       data-mapping: false

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
