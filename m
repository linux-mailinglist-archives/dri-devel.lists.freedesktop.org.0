Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B683C2EA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 13:58:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C022810F1E9;
	Thu, 25 Jan 2024 12:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C572110F23F
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:58:56 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-40ed4690ee4so394685e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706187475; x=1706792275; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=LbpApPtBndgo6ix27UGtqM1Xbypk95J6H2yA5dhq4yI=;
 b=xBfuoCWWlIyIuJPwOCThL6C+vEbOQd2B0EBiP+vN4O6rZvSX1VJcpUKO4TT8ElOovC
 OEctmZ9V6+J7mUW2AQhq4AF4X62IvV/rxGuwu3lS3VnlHqcjkkgbYC2atCvcb1wdVnrU
 aR002DnT+SGU5dTfJwjljj+HhoBtIy/xW2OukR9ZyGZxQNB2NnSCKCLP/p6/Wp0ugqgK
 k9uKe7QcYzK35JEQF7dYiscdHNmtCr+JOvYnVCAcxAb/v3xXC9H4swXKUu5b7M4uiUzb
 xzXEsxC5HVToODEzH9aZo6oQw53TQISxp7anHt9WxPUse+XaZQidQsfR8QLXZp2FUTGe
 75aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706187475; x=1706792275;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=LbpApPtBndgo6ix27UGtqM1Xbypk95J6H2yA5dhq4yI=;
 b=Gj3pjf+rMumUZm7sJTvfIBjdUQGCCTa7c9CZaweEeF9+gnPArUQmqODKfbGODYgTiz
 cHtB0k6PeLYn1V2+B6VhiKYs3SwVv7g8jsI5575xO7UDZ31SgeJpf9sbY2hwznouHvCP
 ZEPWQ/XSWEK163oFvVqID0TLU2x/FS4Rj8l4R5hnwEw5fvTmXkOOhY6QeKeEK9MQ+x/m
 ikkxydcEK7PcQ5up0E8JRIkLxB3lEgT6YRQNmnukMqPE1gDU2LsSsAYWwwdmvLg07DfG
 RycPez+fcIeYPkaJC10RaIxz20jZdL/ihv8u1r2sVya8wtrvBffmLMFgXV5DZv21PWMk
 7vEg==
X-Gm-Message-State: AOJu0Yy5KEMss77KWRyYqMydsMIbhfiVbgGhZ1cOfzGA1et9u8SjRyiG
 /V9F6ZRT/2EWoeSzg/9iv8srikucFuYZ9XboJzvq3T8lXbFa3WZykC84nVAihFI=
X-Google-Smtp-Source: AGHT+IGwN7FSPdZX2Oi3qTLAXzd0NEgco4BwEx10QSaTcaAeWvt16iZJVMIX1mSJmRk97eSurYvl3Q==
X-Received: by 2002:a05:600c:5249:b0:40d:5575:a197 with SMTP id
 fc9-20020a05600c524900b0040d5575a197mr565842wmb.12.1706187474953; 
 Thu, 25 Jan 2024 04:57:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:1a7d:7b36:3842:9bc3?
 ([2a01:e0a:982:cbb0:1a7d:7b36:3842:9bc3])
 by smtp.gmail.com with ESMTPSA id
 h9-20020a05600c314900b0040e8800fcf3sm2569481wmo.5.2024.01.25.04.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 04:57:54 -0800 (PST)
Message-ID: <a6b8152a-a8ef-4b41-96e2-df6192f3c934@linaro.org>
Date: Thu, 25 Jan 2024 13:57:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/39] drm/bridge: switch to struct drm_edid
Content-Language: en-US, fr
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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
Organization: Linaro Developer Services
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
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

On 23/01/2024 20:37, Jani Nikula wrote:
> v3 of [1] with a couple of patches fixed.
> 
> BR,
> Jani.
> 
> [1] https://patchwork.freedesktop.org/series/128149/
> 
> 
> Jani Nikula (39):
>    drm/bridge: add ->edid_read hook and drm_bridge_edid_read()
>    drm/bridge: switch to drm_bridge_read_edid()
>    drm/bridge: chrontel-ch7033: switch to drm_bridge_read_edid()
>    drm/bridge: lt8912b: use drm_bridge_read_edid()
>    drm/bridge: lt8912b: clear the EDID property on failures
>    drm/bridge: lt8912b: use ->edid_read callback
>    drm/bridge: lt9611uxc: use drm_bridge_read_edid()
>    drm: bridge: simple-bridge: use drm_bridge_edid_read()
>    drm: bridge: simple-bridge: clear the EDID property on failures
>    drm/bridge: tfp410: use drm_bridge_edid_read()
>    drm/bridge: tfp410: clear the EDID property on failures
>    drm/meson: switch to drm_bridge_edid_read()
>    drm/bridge: remove drm_bridge_get_edid() in favour of
>      drm_bridge_edid_read()
>    drm/bridge: anx7625: switch to ->edid_read callback
>    drm/bridge: cdns-mhdp8546: switch to ->edid_read callback
>    drm/bridge: cdns-mhdp8546: clear the EDID property on failures
>    drm/bridge: display-connector: switch to ->edid_read callback
>    drm/bridge: it6505: switch to ->edid_read callback
>    drm: bridge: it66121: switch to ->edid_read callback
>    drm/bridge: lt9611: switch to ->edid_read callback
>    drm/bridge: lt9611uxc: switch to ->edid_read callback
>    drm/bridge: megachips: switch to ->edid_read callback
>    drm/bridge: nxp-ptn3460: switch to ->edid_read callback
>    drm/bridge: sii902x: use display info is_hdmi
>    drm/bridge: sii902x: switch to ->edid_read callback
>    drm/mediatek/dp: switch to ->edid_read callback
>    drm/mediatek/hdmi: switch to ->edid_read callback
>    drm/msm/hdmi: fix indent
>    drm/msm/hdmi: switch to ->edid_read callback
>    drm/omap/hdmi4: switch to ->edid_read callback
>    drm/omap/hdmi5: switch to ->edid_read callback
>    drm: xlnx: zynqmp_dpsub: switch to ->edid_read callback
>    drm: adv7511: switch to ->edid_read callback
>    drm: bridge: dw_hdmi: switch to ->edid_read callback
>    drm: bridge: dw_hdmi: clear the EDID property and CEC address on
>      failures
>    drm/bridge: tc358767: update the EDID property
>    drm/bridge: tc358767: switch to ->edid_read callback
>    drm/bridge: ti-sn65dsi86: switch to ->edid_read callback
>    drm/bridge: remove ->get_edid callback
> 
>   drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  | 47 ++++++++++++-------
>   drivers/gpu/drm/bridge/analogix/anx7625.c     | 30 ++++--------
>   .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 28 ++++++-----
>   drivers/gpu/drm/bridge/chrontel-ch7033.c      | 12 ++---
>   drivers/gpu/drm/bridge/display-connector.c    |  8 ++--
>   drivers/gpu/drm/bridge/ite-it6505.c           | 17 +++----
>   drivers/gpu/drm/bridge/ite-it66121.c          | 16 +++----
>   drivers/gpu/drm/bridge/lontium-lt8912b.c      | 20 ++++----
>   drivers/gpu/drm/bridge/lontium-lt9611.c       |  8 ++--
>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c    | 18 +++----
>   .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 18 +++----
>   drivers/gpu/drm/bridge/nxp-ptn3460.c          | 22 +++++----
>   drivers/gpu/drm/bridge/sii902x.c              | 38 +++++++--------
>   drivers/gpu/drm/bridge/simple-bridge.c        | 17 +++----
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 43 ++++++++++-------
>   drivers/gpu/drm/bridge/tc358767.c             | 17 +++----
>   drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  8 ++--
>   drivers/gpu/drm/bridge/ti-tfp410.c            | 18 +++----
>   drivers/gpu/drm/drm_bridge.c                  | 17 +++----
>   drivers/gpu/drm/drm_bridge_connector.c        | 16 +++----
>   drivers/gpu/drm/mediatek/mtk_dp.c             | 31 +++++++-----
>   drivers/gpu/drm/mediatek/mtk_hdmi.c           | 26 ++++++----
>   drivers/gpu/drm/meson/meson_encoder_hdmi.c    | 20 ++++++--
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        | 33 ++++++++-----
>   drivers/gpu/drm/omapdrm/dss/hdmi4.c           | 22 ++++++---
>   drivers/gpu/drm/omapdrm/dss/hdmi5.c           | 12 ++---
>   drivers/gpu/drm/xlnx/zynqmp_dp.c              |  8 ++--
>   include/drm/drm_bridge.h                      | 25 +++++-----
>   28 files changed, 328 insertions(+), 267 deletions(-)
> 

Thanks, but now some patches subjects are wrong:
s/drm_bridge_read_edid/drm_bridge_edid_read/s

With that fixed please add:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
