Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298645917E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:35:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C57897FB;
	Mon, 22 Nov 2021 15:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E2A89F4A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 15:35:43 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso17165888wms.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tEysCCocALBU/rUp6AhyWkRhZMZjzwQs7VwnjhYTvPk=;
 b=fFb+naYoMcVI/gT3T/aM6fcLKB7O4tOdu7o7RvV/ZYLTgomjCsjm1H3MSFmxrLWdi3
 irmDq7P8749xqRMqy1P+0AXHlgk+lae1sv/7SVrNjxdL1xRf6puY2wv/YL3KrHTNKhvO
 yZuCd1lpk8qMjAdoaS0tETj5H/+4WiHP5fr2bSOtKIwhe754C1IGLgrsJ5ds2GRa7Fcc
 qRRV0I8Rb6sY3OBe4eV9PSGDfJZUMX+30+1O1Uzy/aTefETKPMGi6RRGX1QJ3++b0i3K
 VmT+U0r9rWvX64LdSwGq6iA/jAZYw65qQ65di69BpvtUonDNBszRJRArRjHmzSppSgxV
 8/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tEysCCocALBU/rUp6AhyWkRhZMZjzwQs7VwnjhYTvPk=;
 b=DThdUkDIjNxdpa4O6O6RLJyX2v/k5ydJ+fUrM6Q59mSnpaIW+FcOcv0UYwRiBe9FRy
 m1G5X5TR/t+ujqa9Y3d0BYhVpIdLOsSfsVlSjCmgFK5wFWmtpbuO9DfjTZvnd5JymwfS
 Jl3qZlk9Llq0Z8fjsrD0wlo7AwK29/UBj/WKo6loCcmxzHfG/WnaB32m1IFatUTh0lMZ
 YwnlBCviU/gBrM1vnBbZOQXurbN+tS6D9XHBgWQsWww/+geWB0L9mck8zTb0WpR9MpTv
 il0aVYGDbwP/xlhBpG8Tb4UqFBkhWJfmINP5UbbsrLtjsdfL7TMEdZ5AHACaBaZgYdXq
 NbZw==
X-Gm-Message-State: AOAM531iEfNJSTiSPbmc884liy7i8jiOzDn2Lt6HmMXmNb45gYjTSb1u
 Z5aTg97VV/Awe/ocyEG3tFV4pQ==
X-Google-Smtp-Source: ABdhPJyi2G+8oCyRLwWPNkZSI70OLFA95QCd+6GE7Il0Ktgf0j1ii6P7Rn6RweTgMCUAB34kwOrHsQ==
X-Received: by 2002:a1c:5414:: with SMTP id i20mr30848635wmb.88.1637595341947; 
 Mon, 22 Nov 2021 07:35:41 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:68f2:9b9a:7f6d:f86c?
 ([2001:861:44c0:66c0:68f2:9b9a:7f6d:f86c])
 by smtp.gmail.com with ESMTPSA id h27sm23929091wmc.43.2021.11.22.07.35.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 07:35:41 -0800 (PST)
Subject: Re: [PATCH v5 3/7] drm: sun4i: dsi: Convert to bridge driver
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
 <20211122065223.88059-4-jagan@amarulasolutions.com>
 <35a25992-741b-b3f1-c3cd-695a19b9a413@baylibre.com>
 <CAMty3ZDATTKoJq7aLOe5i=RPo2UHzqnLs8j8sT-EBNdpC7=3DQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <9aa3d19d-4378-aaf3-6857-c40be5d252c7@baylibre.com>
Date: Mon, 22 Nov 2021 16:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZDATTKoJq7aLOe5i=RPo2UHzqnLs8j8sT-EBNdpC7=3DQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 22/11/2021 14:16, Jagan Teki wrote:
> Hi Neil,
> 
> On Mon, Nov 22, 2021 at 6:22 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 22/11/2021 07:52, Jagan Teki wrote:
>>> Some display panels would come up with a non-DSI output, those
>>> can have an option to connect the DSI host by means of interface
>>> bridge converter.
>>>
>>> This DSI to non-DSI interface bridge converter would requires
>>> DSI Host to handle drm bridge functionalities in order to DSI
>>> Host to Interface bridge.
>>>
>>> This patch convert the existing to a drm bridge driver with a
>>> built-in encoder support for compatibility with existing
>>> component drivers.
>>>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>> Changes for v5:
>>> - add atomic APIs
>>> - find host and device variant DSI devices.
>>> Changes for v4, v3:
>>> - none
>>>
>>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 112 ++++++++++++++++++++-----
>>>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |   7 ++
>>>  2 files changed, 96 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>> index 43d9c9e5198d..a6a272b55f77 100644
>>> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
>>> @@ -21,6 +21,7 @@
>>>
>>>  #include <drm/drm_atomic_helper.h>
>>>  #include <drm/drm_mipi_dsi.h>
>>> +#include <drm/drm_of.h>
>>>  #include <drm/drm_panel.h>
>>>  #include <drm/drm_print.h>
>>>  #include <drm/drm_probe_helper.h>
>>> @@ -713,10 +714,11 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
>>>       return 0;
>>>  }
>>>
>>> -static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>> +static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
>>> +                                        struct drm_bridge_state *old_bridge_state)
>>>  {
>>> -     struct drm_display_mode *mode = &encoder->crtc->state->adjusted_mode;
>>> -     struct sun6i_dsi *dsi = encoder_to_sun6i_dsi(encoder);
>>> +     struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
>>> +     struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
>>>       struct mipi_dsi_device *device = dsi->device;
>>>       union phy_configure_opts opts = { };
>>>       struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
>>> @@ -772,6 +774,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>       if (dsi->panel)
>>>               drm_panel_prepare(dsi->panel);
>>>
>>> +     if (dsi->next_bridge)
>>> +             dsi->next_bridge->funcs->atomic_pre_enable(dsi->next_bridge, old_bridge_state);
>>> +
>>>       /*
>>>        * FIXME: This should be moved after the switch to HS mode.
>>>        *
>>> @@ -787,6 +792,9 @@ static void sun6i_dsi_encoder_enable(struct drm_encoder *encoder)
>>>       if (dsi->panel)
>>>               drm_panel_enable(dsi->panel);
>>>
>>> +     if (dsi->next_bridge)
>>> +             dsi->next_bridge->funcs->atomic_enable(dsi->next_bridge, old_bridge_state);
>>> +
>>
>>
>> No need to call the next bridge atomic pre_enable/enable/disable/post_disable since they will
>> be called automatically on the bridge chain.
> 
> Correct, but the existing bridge chain (stack) is not compatible with
> sun6i DSI start sequence. We cannot send any DCS once we start HS
> mode.
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c#n775

It's a classical DSI sequence init issue, look at dw-mipi-dsi:
https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

We setup the "command-mode" (low-speed) withing mode_set so when the next bridge dsi_pre_enable is called,
low-speed DCS can be sent, then the bridge enable() sets video mode (high-speed).
The disable still needs to call the next_bridge post_disable :
https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L893

You can send any low-speed DCS once HS mode is started if the HW supports it and the driver handles it, look
at the https://elixir.bootlin.com/linux/v5.16-rc2/source/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c#L397
The MIPI_DSI_MODE_LPM and MIPI_DSI_MSG_USE_LPM is used for that.

Neil

> 
> This specific problem can be fixed only if we change the bridge chain
> from stack to queue. Please check this series
> https://patchwork.kernel.org/project/dri-devel/patch/20210214194102.126146-6-jagan@amarulasolutions.com/
> 
> Jagan.
> 

