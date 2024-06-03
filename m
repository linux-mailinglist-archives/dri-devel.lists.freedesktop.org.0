Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453238D7DEA
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 10:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DAF10E33A;
	Mon,  3 Jun 2024 08:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="erWzMlKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9310E33A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 08:55:52 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4213be171f7so6423335e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2024 01:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717404951; x=1718009751; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/QAeBcdtYqLIs/Rh+i5kD5TSLdR9qGs4llUtwWZdmtc=;
 b=erWzMlKKat69NfhdK+VqVCx771PS9IAJ5F21ewvExkJGIFAG7xp/WRjzlAVftrF9hF
 gfIzetszd0Dy/646Nn+CuDOudhTxsNsC7iBmDEPl44ZuItk7L2h+dFSEYcrt8e6zLoTB
 FnSdP+iN0RnBwn+aQc8VxSHZPeRi5O1KKQHcQ+ODtbpoXwPC64tnhVC3TYEfBWUCF7cA
 htgbS3Ux/qLSMVAgpE+5tvA6WIGbSJmjINudZkSU1HmRKh5UqUL9+fenpobPqAatyP88
 7atD4OPiX/7AiczHq3Z0u/+Ho85uFcv+OwT/ICRiryAlKrB0dKhYzU+Yof9uUbjxRlfs
 Pxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717404951; x=1718009751;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/QAeBcdtYqLIs/Rh+i5kD5TSLdR9qGs4llUtwWZdmtc=;
 b=YUr64HQBkQU9Db7GtTb16eCURISgHs+R777/wMV8itWVqna+jREA463RF//aKcy5hV
 Y3JznWuWxZCUpQ4uIW5tTcEHrndU+CpqMA+arw3EVHFQufBEmVKCudLhu76g5uqDL7dY
 5gHRV76sRye8JVPCcvZ6hiSxeAR/IQvM9xD1h5SbCI2cauPAzYMoxdZqg5N73c9tBW8g
 bZpqYah9583mpPgkXo0RRSb0x7kHJpbCxL4TUrsjKW8mt86hPm03QWGFayTtzV14Qbml
 qOTmZUuinfOXrDlScsPZpoQbzTTDG/oYRCrSLQcDVtiuVW67nN4RfYFiCUe9XHFzAVK6
 VZ5A==
X-Gm-Message-State: AOJu0YwrQgh7RrT1r7E6EDsgWwNMLsMTuzARk7TTRRgJ2iwcdr0MBM/j
 MgOJA1BywlHEW49wTcyY9V9J1DSd9RAlYENuCkP7L3opMSSPhwyqqfz8FNpWxiM=
X-Google-Smtp-Source: AGHT+IG4nbGZZdOjaAgpRmBbLec9RiHVzWyTIMWSj89sEDhnbEfh2N4e2rnLcxVfA/uyYM5cYYFysg==
X-Received: by 2002:a05:600c:3550:b0:420:1853:68c3 with SMTP id
 5b1f17b1804b1-421417bd9aemr653405e9.20.1717404950955; 
 Mon, 03 Jun 2024 01:55:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:79fe:b764:2b06:ab4b?
 ([2a01:e0a:982:cbb0:79fe:b764:2b06:ab4b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4212b858424sm110180695e9.21.2024.06.03.01.55.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 01:55:50 -0700 (PDT)
Message-ID: <a4b22708-e85d-448a-8145-244b49bca053@linaro.org>
Date: Mon, 3 Jun 2024 10:55:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI TX
 Controller
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 Alexandre ARNOUD <aarnoud@me.com>, Luis de Arquer <ldearquer@gmail.com>,
 Algea Cao <algea.cao@rock-chips.com>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
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
In-Reply-To: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 01/06/2024 15:12, Cristian Ciocaltea wrote:
> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
> 
> It is HDMI 2.1 compliant and supports the following features, among
> others:
> 
.

..

> * SCDC I2C DDC access
> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> * Multi-stream audio
> * Enhanced Audio Return Channel (EARC)
-> Those features were already supported by the HDMI 2.0a compliant HW, just
list the _new_ features for HDMI 2.1

I did a quick review of your patchset and I don't understand why you need
to add a separate dw-hdmi-qp.c since you only need simple variants of the I2C
bus, infoframe and bridge setup.

Can you elaborate further ? isn't this Quad-Pixel (QP) TX controller version
detectable at runtime ?

I would prefer to keep a single dw-hdmi driver if possible.

Thanks,
Neil

> 
> This is the last required component that needs to be supported in order
> to enable the HDMI output functionality on the RK3588 based SBCs, such
> as the RADXA Rock 5B. The other components are the Video Output
> Processor (VOP2) and the Samsung IP based HDMI/eDP TX Combo PHY, for
> which basic support has been already made available via [1] and [2],
> respectively.
> 
> The patches are grouped as follows:
> * PATCH 1..7: DW HDMI TX driver refactor to minimize code duplication in
>    the new QP driver (no functional changes intended)
> 
> * PATCH 8..11: Rockchip DW HDMI glue driver cleanup/improvements (no
>    functional changes intended)
> 
> * PATCH 12..13: The new DW HDMI QP TX driver reusing the previously
>    exported functions and structs from existing DW HDMI TX driver
> 
> * PATCH 14: Rockchip DW HDMI glue driver update to support RK3588 and
>    make use of DW HDMI QP TX
> 
> They provide just the basic HDMI support for now, i.e. RGB output up to
> 4K@60Hz, without audio, CEC or any of the HDMI 2.1 specific features.
> Also note the vop2 driver is currently not able to properly handle all
> display modes supported by the connected screens, e.g. it doesn't cope
> with non-integer refresh rates.
> 
> A possible workaround consists of enabling the display controller to
> make use of the clock provided by the HDMI PHY PLL. This is still work
> in progress and will be submitted later, as well as the required DTS
> updates.
> 
> To facilitate testing and experimentation, all HDMI output related
> patches, including those part of this series, are available at [3].
> So far I could only verify this on the RADXA Rock 3A and 5B boards.
> 
> Thanks,
> Cristian
> 
> [1]: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> [2]: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
> [3]: https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-v6.10-rc1
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (14):
>        drm/bridge: dw-hdmi: Simplify clock handling
>        drm/bridge: dw-hdmi: Add dw-hdmi-common.h header
>        drm/bridge: dw-hdmi: Commonize dw_hdmi_i2c_adapter()
>        drm/bridge: dw-hdmi: Factor out AVI infoframe setup
>        drm/bridge: dw-hdmi: Factor out vmode setup
>        drm/bridge: dw-hdmi: Factor out hdmi_data_info setup
>        drm/bridge: dw-hdmi: Commonize dw_hdmi_connector_create()
>        drm/rockchip: dw_hdmi: Use modern drm_device based logging
>        drm/rockchip: dw_hdmi: Simplify clock handling
>        drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
>        drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, cur_ctr and phy_config
>        dt-bindings: display: rockchip,dw-hdmi: Add compatible for RK3588
>        drm/bridge: synopsys: Add DW HDMI QP TX controller driver
>        drm/rockchip: dw_hdmi: Add basic RK3588 support
> 
>   .../display/rockchip/rockchip,dw-hdmi.yaml         | 127 +++-
>   drivers/gpu/drm/bridge/synopsys/Makefile           |   2 +-
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-common.h   | 179 +++++
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c       | 787 +++++++++++++++++++
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h       | 831 +++++++++++++++++++++
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c          | 353 +++------
>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c        | 351 +++++++--
>   include/drm/bridge/dw_hdmi.h                       |   8 +
>   8 files changed, 2290 insertions(+), 348 deletions(-)
> ---
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
> change-id: 20240601-b4-rk3588-bridge-upstream-a27baff1b8fc
> 

