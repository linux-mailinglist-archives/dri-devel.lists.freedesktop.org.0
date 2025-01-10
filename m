Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE6A08D88
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:11:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F3910F051;
	Fri, 10 Jan 2025 10:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ddPp4qBa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C59B710F051
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 10:11:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so1036437f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 02:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736503825; x=1737108625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=qU/YhP9GBvho7wDOYndiW+o3LX+a4ZB1ApDiQFDDSEE=;
 b=ddPp4qBaTN/98aFDOncqHBPgI61/VsvBEYMgAz0KPOyQM1+x8Nh+xqpU/rpbRKsZnU
 5KQcpczOYuxupg0xgcwTED9b21lTQQw4PbqNByjflTC39YqgEEFLIZry/ldg+7GopHln
 5qBV08pXEj5GzUV1wxymHS86okVZEXPjk124p8T9TClOewR8EgwEfGzwUGZHJe28Khq7
 mFki4gKGAv/Xmuie6OVVCGMn80drFURKq8/K4GBKyZ01DZtaHWwmiN9uI4Uj2bSTlb3b
 xpViQl/oTOS3/EQ+DFj/SXgPG1OSz+o+vQgTD1+tLz0DHBUeNGV1nf/RLgaBorjUIFQE
 8cEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736503825; x=1737108625;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=qU/YhP9GBvho7wDOYndiW+o3LX+a4ZB1ApDiQFDDSEE=;
 b=E7WCrKovcHaSEHIs1Sse2jPKIKsZcCJUxBes70fju40tuQDEPb6I2Xz8K0IPL93HjJ
 SSZ2P00uekJBbxQyOEvpDSARb+61JGZQTTYRll5eooIB++bcpdTmW/A/9W/u8d5VXnhR
 PKEHjl1Ba4u3QaPi2Qba14fWpRgmm+iGFrmIBkA3f8axOSPOUH4asppaIAJKwvSxf3l7
 GNE/UJHFiyXztVBuBtHRpcR/uGFDBdgOqNkwWMCyWMEZw5xdSQzVh5179COkyorkWH70
 HGRSX70soO+gkDTFvVOLJqNLVpp6SBvvfIwSBCKmPQbNhKfBhXTTtBt+GFToy++ibFDq
 ryzQ==
X-Gm-Message-State: AOJu0Ywh4jW3kCNL/pHA6O//88mnz+xGkXN9WNssH80QlhQEPzNuIQOW
 pM0pfS3Aj3FV1VITVmt0ItQVpoWnDuYjR2A6NORRsX/zkdKKbXUeJri/XmVkl9s=
X-Gm-Gg: ASbGnctSmYy8cOHm38Vbg46zl+fNIe2fmccAkDZI3yRx1Bv2wW6zfa49VJCMI/eI4WZ
 23LTtoIZWSZC2QdHO8uh11ip3QqnCfbhKlXIeBWwUp1seZSQWjjU7sAvkRSWUKXLKVfm1BaYE6f
 lN+YiHEyZ2Q1VztbSXHymsWd6q9HBwCwzbJbwPSGt/3rQJkA9TQHEUURXP732v8Pa/uzVOvolLi
 XGaSUenMqu66meKaHEcySoMKBux8zuteM1uMvodFkwcTZBD1QDel2CjhuAIYOwvYDAcpCfvEh1a
 XmblugJdFtJ0knyXTRmz6URRr3jnJNZEDQ==
X-Google-Smtp-Source: AGHT+IEAfZxwOFx6sDD+ACgYzTQU4qG7OfE8myEixibPdomib11nsV0CbsCQwQeJsvXZ0TfyY9GBNA==
X-Received: by 2002:a05:6000:4913:b0:385:fbb7:672d with SMTP id
 ffacd0b85a97d-38a8735638dmr8832262f8f.52.1736503825258; 
 Fri, 10 Jan 2025 02:10:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8?
 ([2a01:e0a:982:cbb0:bf4e:5758:59ef:deb8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9d8fc51sm47902305e9.7.2025.01.10.02.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jan 2025 02:10:24 -0800 (PST)
Message-ID: <2967a475-9fbe-4d20-a27c-04676c74d03c@linaro.org>
Date: Fri, 10 Jan 2025 11:10:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: ao.xu@amlogic.com, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
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
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
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

Hi,

On 10/01/2025 06:39, Ao Xu via B4 Relay wrote:
> This patch series adds DRM support for the Amlogic S4-series SoCs.
> Compared to the Amlogic G12-series, the S4-series introduces the following changes:
> 
> 1 The S4-series splits the HIU into three separate components: `sys_ctrl`, `pwr_ctrl`, and `clk_ctrl`.
>    As a result, VENC and VCLK drivers are updated with S4-specific compatible strings to accommodate these changes.
> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>    requiring modifications to the driver to handle this new access method.
> 3 The register addresses for the video1 and video2 planes have been updated in the S4 hardware,
>    and the DRM driver has been adapted accordingly.
> 4 The OSD, VIU, and VPP components remain unchanged and are consistent with the G12-series.

Thanks a lot for this high quality changeset, happy to see DRM support for a new SoC !

I'll review it carefully next week.

Neil

> 
> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
> ---
> Ao Xu (11):
>        dt-bindings: display: meson-dw-hdmi: Add compatible for S4 HDMI controller
>        dt-bindings: display: meson-vpu: Add compatible for S4 display controller
>        drm: meson: add S4 compatible for DRM driver
>        drm: meson: add primary and overlay plane support for S4
>        drm: meson: update VIU and VPP support for S4
>        drm: meson: add meson_dw_hdmi support for S4
>        drm: meson: change api call parameter
>        drm: meson: add hdmitx vmode timing support for S4
>        drm: meson: add vpu clk setting for S4
>        drm: meson: add CVBS support for S4
>        arm64: dts: amlogic: s4: add DRM support [1/1]
> 
>   .../bindings/display/amlogic,meson-dw-hdmi.yaml    |    1 +
>   .../bindings/display/amlogic,meson-vpu.yaml        |   48 +-
>   .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     |   39 +
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  121 +++
>   drivers/gpu/drm/meson/meson_crtc.c                 |   90 +-
>   drivers/gpu/drm/meson/meson_drv.c                  |  127 ++-
>   drivers/gpu/drm/meson/meson_drv.h                  |    6 +
>   drivers/gpu/drm/meson/meson_dw_hdmi.c              |  244 ++++-
>   drivers/gpu/drm/meson/meson_dw_hdmi.h              |  126 +++
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c         |   10 +
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c         |   19 +-
>   drivers/gpu/drm/meson/meson_overlay.c              |    7 +-
>   drivers/gpu/drm/meson/meson_plane.c                |   24 +-
>   drivers/gpu/drm/meson/meson_registers.h            |   17 +
>   drivers/gpu/drm/meson/meson_vclk.c                 | 1018 ++++++++++++++------
>   drivers/gpu/drm/meson/meson_venc.c                 |  346 ++++++-
>   drivers/gpu/drm/meson/meson_venc.h                 |    4 +-
>   drivers/gpu/drm/meson/meson_viu.c                  |    9 +-
>   drivers/gpu/drm/meson/meson_vpp.c                  |   12 +-
>   19 files changed, 1865 insertions(+), 403 deletions(-)
> ---
> base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
> change-id: 20250110-drm-s4-c96c88be52e4
> 
> Best regards,

