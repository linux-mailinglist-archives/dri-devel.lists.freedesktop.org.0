Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F308614CB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 15:54:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDCA10EC2F;
	Fri, 23 Feb 2024 14:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PLdvnbm4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807A110EC30
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 14:54:09 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso272755f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 06:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708700047; x=1709304847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cNUbkWdNlhpKbmxfuu6qZOk5j1wm/SN92RpylpPx2rA=;
 b=PLdvnbm4jOsMuEZDlnafWD09I9GElh76mYXDO+nM+8dSU5EOAYo0zHaYU/xMXp2Khe
 Fczdo7J2ZBK1Xb00MQjczZNupp5Ita8YZdSgm8COPo3QXsXVTBdk0sL5IS0xJboqWkRm
 IbsCgUlYWITa6aB7OBsuZGw4joOsNC4fBbeP+04M0g5Jf5qyar9seyNsYEMwxSsYVW1a
 2de1Vq+NBHF2slV3y34oCBflzACeUNxJf5ODwx3qMHuZVR31rckqOeLvX3xAhWQJFcRB
 /RaCJpacUJNtRAwCXwJ+vlzK4hsr0PjzG1I/jwlhJLmtOD3QGoqxRy2gLDGBQh6PnukC
 li5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700047; x=1709304847;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cNUbkWdNlhpKbmxfuu6qZOk5j1wm/SN92RpylpPx2rA=;
 b=vJHJmQSV06XQ5WKeemsOQB/3myFujhzoN5DlmZFS2aKcJknOhNyBBL1C9G18iPirOS
 jn0PqYXMlQbkn1Edc7DAmqkX5TJ5PC6QqEv5B9ydfPc4UTUum7bYBHe/kPZSB7OGv1Cg
 GQolme8QRSfqxuZjligPLCXlNhDqhUPuQu/T8g/gHKpJkov4eeVavNyIsQhxLPW0pQMg
 MK0AsZfnVRH9oo5JmTinOc1KKbRXzV/RoSZZjWdxLzUfV7TSMYrL0ClmgOmRK3hl0B4b
 VzYnVkQT7LvnVObZ2UP8AjTF5qKcqumjl4dw7f3icyi1/OR1V1/uUCvb8++OoOOGEkVp
 N6zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdgEbxokqMPL5yRG9MM8vpe4NmAj8TbbwUToT70SBe73i7oW1MOh8Ds+qH5gRA5lGpjNzsRmrJKbkkYG4zeslcUdzXILFRPlVRcPDND6nG
X-Gm-Message-State: AOJu0Yw2+J/dzgP4TcFYNIDWalii/PXW+deQBppsn9COoQTUCb0QPHa3
 LP+usHM2iCO41DwPQ7Aohieh5q8hst2UA2tLL/T7QK48MstYbEFIj9YrjMKgvqc=
X-Google-Smtp-Source: AGHT+IHHEFVM/kLFgskVImQRztBShP4RflP5MJmVzKMK1rt1otBVKUaSq91oY7qDe/w6ZbH8jRi3mA==
X-Received: by 2002:a5d:6a90:0:b0:33d:c45:15ec with SMTP id
 s16-20020a5d6a90000000b0033d0c4515ecmr5104778wru.32.1708700047381; 
 Fri, 23 Feb 2024 06:54:07 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:58e3:6b80:c446:11f4?
 ([2a01:e0a:982:cbb0:58e3:6b80:c446:11f4])
 by smtp.gmail.com with ESMTPSA id
 fa15-20020a05600c518f00b0041294a1d7bcsm2314742wmb.36.2024.02.23.06.54.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Feb 2024 06:54:06 -0800 (PST)
Message-ID: <3b6dc98a-a13d-4958-b8b4-003d27c84f89@linaro.org>
Date: Fri, 23 Feb 2024 15:54:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] soc: qcom: pmic_glink_altmode: fix drm bridge
 use-after-free
Content-Language: en-US, fr
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>
Cc: Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20240217150228.5788-1-johan+linaro@kernel.org>
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
In-Reply-To: <20240217150228.5788-1-johan+linaro@kernel.org>
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

On 17/02/2024 16:02, Johan Hovold wrote:
> Starting with 6.8-rc1 the internal display sometimes fails to come up on
> machines like the Lenovo ThinkPad X13s and the logs indicate that this
> is due to a regression in the DRM subsystem [1].
> 
> This series fixes a race in the pmic_glink_altmode driver which was
> exposed / triggered by the transparent DRM bridges rework that went into
> 6.8-rc1 and that manifested itself as a bridge failing to attach and
> sometimes triggering a NULL-pointer dereference.
> 
> The intermittent hard resets that have also been reported since 6.8-rc1
> unfortunately still remains and suggests that we are dealing with two
> separate regressions. There is some indication that also the hard resets
> (e.g. due to register accesses to unclocked hardware) are also due to
> changes in the DRM subsystem as it happens around the time that the eDP
> panel and display controller would be initialised during boot (the
> runtime PM rework?). This remains to be verified, however.
> 
> Included is also a fix for a related OF node reference leak in the
> aux-hpd driver found through inspection when reworking the driver.
> 
> The use-after-free bug is triggered by a probe deferral and highlighted
> some further bugs in the involved drivers, which were registering child
> devices before deferring probe. This behaviour is not correct and can
> both trigger probe deferral loops and potentially also further issues
> with the DRM bridge implementation.
> 
> This series can either go through the Qualcomm SoC tree (pmic_glink) or
> the DRM tree. The PHY patches do not depend on the rest of the series
> and could possibly be merged separately through the PHY tree.
> 
> Whichever gets this to mainline the fastest.
> 
> Johan
> 
> 
> [1] https://lore.kernel.org/lkml/ZctVmLK4zTwcpW3A@hovoldconsulting.com/
> 
> 
> Johan Hovold (5):
>    drm/bridge: aux-hpd: fix OF node leaks
>    drm/bridge: aux-hpd: separate allocation and registration
>    soc: qcom: pmic_glink_altmode: fix drm bridge use-after-free
>    phy: qcom-qmp-combo: fix drm bridge registration
>    phy: qcom-qmp-combo: fix type-c switch registration
> 
> Rob Clark (1):
>    soc: qcom: pmic_glink: Fix boot when QRTR=m
> 
>   drivers/gpu/drm/bridge/aux-hpd-bridge.c   | 70 ++++++++++++++++++-----
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 16 +++---
>   drivers/soc/qcom/pmic_glink.c             | 21 +++----
>   drivers/soc/qcom/pmic_glink_altmode.c     | 16 +++++-
>   include/drm/bridge/aux-bridge.h           | 15 +++++
>   5 files changed, 102 insertions(+), 36 deletions(-)
> 

For the serie:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

After an offline discussion, Dmitry, it's ok to push the remaining patches to drm-misc-fixes.

Thanks,
Neil
