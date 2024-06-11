Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C771903470
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 09:56:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CCA10E55C;
	Tue, 11 Jun 2024 07:56:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="L5wlEoYZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6621910E55C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 07:56:17 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-421f4d1c057so13534965e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 00:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718092575; x=1718697375; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=yaXeG3R9YcDyayLk5fnOo/XnkT8Q/xttYsYmH8uTJ2Y=;
 b=L5wlEoYZw21YC/MdPyZblmvEwCD/G/uw1cCRIFNzPScGhqZGuo6+dn25lxarjke+U7
 O2UgWbL5AwUeMOIC/qS0gEQfXUcLOuAdR4sawMkiAEeP7lLJb2NIY7bpgm/YaLovKesR
 b/9SAlE7BOXpv6PiXPGU0xi23XDQY6hV1OQUTxp/vM+rwAe8xKYSrQMuIO4ko7anKGte
 uvscbsQ4aeRX/YZFb/N51CZqCAs4L3ndlMuRj6s3FM0XOAMVjf+3Ax7GCLnRvMSGXV+I
 IWZJ2e1BSxoVQIdkiP+5zuQXEYs+cVQajyKGlmKwVv5DaexDIJEiSrKF9+TwxmFhxay3
 N05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718092575; x=1718697375;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=yaXeG3R9YcDyayLk5fnOo/XnkT8Q/xttYsYmH8uTJ2Y=;
 b=HBDaB18Y9KC/P5qBLKlRC8/z7dO8GPGYVW1mkJs+61UcKK0KJBKcCr+YsJd4lOc606
 GRVhlOF5HQwRCmLLwyeXFxjT09lbeToo9C6bU7V++7DAzgqyU34dKJLaazlgiNfylqT2
 fQ9dSafeok/rW41fDqaVOzrOg6T6WIP4UZ3gep+d2sPWDqdInfccaRrLHqgiu8yX9GT2
 TpEIgzchfVzAirZuL8WB21EDVWM4MDb7boE/egHTCjNAi2wcyszWeovp9T2IWcY/IkEe
 KkPYfsTtqU2D0he1m4PBJ0DvAF6Ip/mAemI6VdZfgzPbkmOi3/vbts2gP1b5Bqz4ghc/
 9wkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXm1xjdJbLewbInqEH4hGwVm3BoSCfhtvqbggDo7Btq7uOq/K0qLD8rTXeb8tAYrGYmwF7k3o+q5VN+6gP+tDgrcHhIke+SxcbtKsBUw2qY
X-Gm-Message-State: AOJu0YwfXjjVekPcAhp3qO/8bMowfKB3JgMLRGPkYEyy2A5scpZFC9vA
 rqf4YoL391j8x8VRtyfnKUPKIrKrfmaKCvkyZtUnXt2y4b08WBX0Ftirr6YeRAo=
X-Google-Smtp-Source: AGHT+IF5ErUhZ0Gir3WaEpkIMTyi5A9X1sNl7/oV0utGu6R3mmUFRlimyA8iwylUV2vLZCk0lFcIhA==
X-Received: by 2002:a05:600c:35d3:b0:421:7fe5:12a with SMTP id
 5b1f17b1804b1-4217fe50433mr49372795e9.35.1718092575454; 
 Tue, 11 Jun 2024 00:56:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c?
 ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158148f66sm206043675e9.32.2024.06.11.00.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Jun 2024 00:56:14 -0700 (PDT)
Message-ID: <9067e697-4786-49ae-8727-603c7cc8ec5b@linaro.org>
Date: Tue, 11 Jun 2024 09:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 00/24] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Robert Chiras <robert.chiras@nxp.com>, Stefan Mavrodiev <stefan@olimex.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20240605002401.2848541-1-dianders@chromium.org>
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
In-Reply-To: <20240605002401.2848541-1-dianders@chromium.org>
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

On 05/06/2024 02:22, Douglas Anderson wrote:
> 
> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
> 
> This series attempts to do just that. While the original grep, AKA:
>    git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>    git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> ...still produces a few hits after my series, they are _mostly_ all
> gone. The ones that are left are less trivial to fix.
> 
> One of the main reasons that many panels probably needed to store and
> double-check their prepared/enabled appears to have been to handle
> shutdown and/or remove. Panels drivers often wanted to force the power
> off for panels in these cases and this was a good reason for the
> double-check.
> 
> In response to my V1 series [1] we had much discussion of what to
> do. The conclusion was that as long as DRM modeset drivers properly
> called drm_atomic_helper_shutdown() that we should be able to remove
> the explicit shutdown/remove handling in the panel drivers. Most of
> the patches to improve DRM modeset drivers [2] [3] [4] have now
> landed.
> 
> In contrast to my V1 series, I broke the V2 series up a lot
> more. Since a few of the panel drivers in V1 already landed, we had
> fewer total drivers and so we could devote a patch to each panel.
> Also, since we were now relying on DRM modeset drivers I felt like we
> should split the patches for each panel into two: one that's
> definitely safe and one that could be reverted if we found a
> problematic DRM modeset driver that we couldn't fix.
> 
> Many of the patches in the V2 series [5] landed, so this V3 series is
> the patches that are left plus one new bonus patch. At this point, we
> may want to just land the patches that are left since it seems like
> nobody is going to test/review them and they've all been Acked by
> Linus and Maxime.
> 
> NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> really possible to generate automatically. That means it's entirely
> possible that my eyes glazed over and I did something wrong. Please
> double-check me and don't assume that I got everything perfect, though
> I did my best. I have at least confirmed that "allmodconfig" for arm64
> doesn't fall on its face with this series. I haven't done a ton of
> other testing.
> 
> [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
> [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
> [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
> [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org
> [5] https://lore.kernel.org/r/20240503213441.177109-1-dianders@chromium.org/
> 
> Changes in v3:
> - drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
> 
> Changes in v2:
> - Only handle 1 panel per patch.
> - Split removal of prepared/enabled from handling of remove/shutdown.
> 
> Douglas Anderson (24):
>    drm/panel: boe-himax8279d: Stop tracking prepared/enabled
>    drm/panel: boe-himax8279d: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: khadas-ts050: Stop tracking prepared/enabled
>    drm/panel: khadas-ts050: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: olimex-lcd-olinuxino: Stop tracking prepared/enabled
>    drm/panel: olimex-lcd-olinuxino: Don't call unprepare+disable at
>      remove
>    drm/panel: osd-osd101t2587-53ts: Stop tracking prepared/enabled
>    drm/panel: osd-osd101t2587-53ts: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: tdo-tl070wsh30: Stop tracking prepared
>    drm/panel: tdo-tl070wsh30: Don't call unprepare+disable at
>      shutdown/remove
>    drm/panel: jdi-lt070me05000: Stop tracking prepared/enabled
>    drm/panel: jdi-lt070me05000: Don't call disable at shutdown/remove
>    drm/panel: panasonic-vvx10f034n00: Stop tracking prepared/enabled
>    drm/panel: panasonic-vvx10f034n00: Don't call disable at
>      shutdown/remove
>    drm/panel: seiko-43wvf1g: Stop tracking prepared/enabled
>    drm/panel: seiko-43wvf1g: Don't call disable at shutdown/remove
>    drm/panel: sharp-lq101r1sx01: Stop tracking prepared/enabled
>    drm/panel: sharp-lq101r1sx01: Don't call disable at shutdown/remove
>    drm/panel: sharp-ls043t1le01: Stop tracking prepared
>    drm/panel: sharp-ls043t1le01: Don't call disable at shutdown/remove
>    drm/panel: raydium-rm67191: Stop tracking enabled
>    drm/panel: raydium-rm67191: Don't call unprepare+disable at shutdown
>    drm/panel: Update TODO list item for cleaning up prepared/enabled
>      tracking
>    drm/panel: Avoid warnings w/ panel-simple/panel-edp at shutdown
> 
>   Documentation/gpu/todo.rst                    |  47 +++---
>   drivers/gpu/drm/drm_panel.c                   |  12 ++
>   drivers/gpu/drm/panel/panel-boe-himax8279d.c  |  40 -----
>   .../gpu/drm/panel/panel-drm-shutdown-check.h  | 151 ++++++++++++++++++
>   drivers/gpu/drm/panel/panel-edp.c             |  19 +--
>   .../gpu/drm/panel/panel-jdi-lt070me05000.c    |  35 ----
>   drivers/gpu/drm/panel/panel-khadas-ts050.c    |  39 -----
>   .../drm/panel/panel-olimex-lcd-olinuxino.c    |  44 -----
>   .../drm/panel/panel-osd-osd101t2587-53ts.c    |  41 +----
>   .../drm/panel/panel-panasonic-vvx10f034n00.c  |  47 +-----
>   drivers/gpu/drm/panel/panel-raydium-rm67191.c |  26 ---
>   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c   |  49 ------
>   .../gpu/drm/panel/panel-sharp-lq101r1sx01.c   |  63 +-------
>   .../gpu/drm/panel/panel-sharp-ls043t1le01.c   |  24 ---
>   drivers/gpu/drm/panel/panel-simple.c          |  19 +--
>   drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c  |  23 ---
>   16 files changed, 199 insertions(+), 480 deletions(-)
>   create mode 100644 drivers/gpu/drm/panel/panel-drm-shutdown-check.h
> 


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

for all patches, let me apply all but the last one and let us a more
week to review it. Could you resend it as standalone patch?

Thanks,
Neil

