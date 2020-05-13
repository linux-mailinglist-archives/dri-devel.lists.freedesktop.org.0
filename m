Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19B81D0A01
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 09:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE446E1E6;
	Wed, 13 May 2020 07:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1626E1E6
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 07:37:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id n5so12355646wmd.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 00:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:reply-to:cc
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FU0AJ0DhmcLQxEmfgznKbg65FbliVqqBgdHWkP1GE4U=;
 b=AU5ROtgezNwZ66vXizBFgkxTTDGACO2+WYqJO3GrNoTjQ5ILLA9PxU+zj1FvRuKH4d
 GOpYAMQblN4Rqp1pUJfmt0eYmqL22X55lVGa2pJq89n/eAh2JuwEMWPd0rUR7IM85Xb+
 OvDTAnKhZoRbUk6U5YXQLftye0iZcMkj9Mw9wsXsMpHIuO0he6wNhHID51nQpgs+w8ql
 61vseIgCBzMnkUWBmGyW70V+uQd03gerM4GM8a4Qsic6pVVW0coD/L3M1qzNCV76LIhb
 KJmS7Ba1GcS27S7RsfI9KlwUgogPH2gl3HgjaPc8P6M36ZNyc/9a3kN4REE5OzpsPNmP
 ZV3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:reply-to:cc:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=FU0AJ0DhmcLQxEmfgznKbg65FbliVqqBgdHWkP1GE4U=;
 b=s1J5nGY3EKjpCV+9bOsqk4KR7aLaY3Y0KchJNB3uviISPoCekFG/htqynDlm8wbXPq
 qPBvh4l0B960pq266lhqCtZAfIgFT3ppNlbznrSF0Tt5moWTWi4UNbI0SWv7WK/id0dc
 mESy3Q5ELchMKYdczKEA1U2OhEbCwe5ZvafslaPvXRhlqj2tyJI9+OgME3ES2oBp/uUk
 Pa8h/JE29UQAL6TgFwwLrKjCJwChKtAsrrIOEdB3BZHOgpbwoQjhIxk6cR1GH0SyRRZ9
 1DSMQTwlimlXHXT1NTtcNxwmtpaZL/m6bteF9m5ezcF5niXtrZeMNVMMrwRakhztP4g8
 oqUg==
X-Gm-Message-State: AGi0Puaf2bSTU291PBB+0TYsm98u0ka/dHhExLpA0sBb54BLCa45dFsZ
 3nHQWyTbeUHWZg1uht3UQPU4seGhfzb6YQ==
X-Google-Smtp-Source: APiQypJ+d7GSzHXeZX7HmYXO1/C6bHbSQY6H27BB05v2eWFeQ+LPB3Hgy0RYGbK20G3lUstshx8XqQ==
X-Received: by 2002:a1c:5988:: with SMTP id
 n130mr31429108wmb.187.1589355470769; 
 Wed, 13 May 2020 00:37:50 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:4460:3fd3:382:4a71?
 ([2a01:e35:2ec0:82b0:4460:3fd3:382:4a71])
 by smtp.gmail.com with ESMTPSA id l12sm26189939wrh.20.2020.05.13.00.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 00:37:50 -0700 (PDT)
Subject: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the Ingenic
 JZ4780)
To: Paul Boddie <paul@boddie.org.uk>, dri-devel@lists.freedesktop.org
References: <1940005.XIBaf5lNV5@jeremy>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <c34fe43b-51c4-0231-7a41-77d5c703e9ba@baylibre.com>
Date: Wed, 13 May 2020 09:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1940005.XIBaf5lNV5@jeremy>
Content-Language: en-US
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
Reply-To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

I'm one of the drm/bridge maintainer and, with Jernel & Jonas, we did most of the
changes on the dw-hdmi driver recently for the Amlogic, Rockchip & Allwinner platforms.

On 12/05/2020 21:37, Paul Boddie wrote:
> Hello,
> 
> On and off over the past few months, I have been looking at getting the 
> Synopsys DesignWare HDMI peripheral used in the Ingenic JZ4780 SoC working 
> with a recent kernel. Unfortunately, what probably should be a straightforward 
> task is proving more difficult than it seems, and I have been advised to ask 
> for advice on this list.
> 
> == Background ==
> 
> Previously, in the vendor kernels released by Imagination Technologies for the 
> MIPS Creator CI20, there were specialised HDMI drivers for the JZ4780:
> 
> * One (based on Linux 3.0.8) which seems to use a Synopsys hardware
>   abstraction layer.
> 
> * Another (based on Linux 3.18) where the driver incorporates code used to
>   support Freescale products and cooperates with a "CRTC" driver that has
>   since been replaced by the ingenic-drm.c driver.
> 
> Since the Freescale-related code now seems to reside as a kind of generic 
> driver in drivers/gpu/drm/bridge/synopsys [1], with some other drivers 
> specialising this generic support, I thought that it might be straightforward 
> to specialise the code similarly for the JZ4780. Unfortunately, I have not 
> managed to achieve this so far, and I imagine that I must have overlooked 
> something.
> 
> == Summary of Work ==
> 
> What I have done so far is to add a new file to...
> 
> drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c
> 
> (See [2] for the full file.)
> 
> This specialises the generic dw-hdmi.c driver and is heavily based on the 
> existing driver in...
> 
> drivers/gpu/drm/imx/dw_hdmi-imx.c
> 
> However, the probe and remove functions are defined in a similar way to...
> 
> drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c
> 
> It would appear, looking at the vendor kernel code, that the configuration of 
> the peripheral in the JZ4780 is most similar to that done in the i.MX 
> products, with various configuration operations that are done in their own 
> particular way in the vendor kernel code now being done in a more generic way 
> in the bridge driver code. So, I have a certain amount of confidence that the 
> PLL and current control tables are reasonable.
> 
> == Observations ==
> 
> When powering up the system with the driver built into the kernel, the driver 
> is able to obtain mode information over DDC using the Synopsys peripheral's 
> own I2C support (which is more reliable than using the JZ4780's I2C 
> peripherals), and a viable list of modes is obtained. 

Can you run the kernel with drm debug enabled ? drm.debug=0x3f for example
you'll have all the modes checks & so on

> However, the debugfs 
> state information in /sys/kernel/debug/dri/0/state is largely unpopulated:
> 
> plane[31]: plane-0
>         crtc=(null)
>         fb=0
>         crtc-pos=0x0+0+0
>         src-pos=0.000000x0.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range
> crtc[32]: crtc-0
>         enable=0
>         active=0
>         self_refresh_active=0
>         planes_changed=0
>         mode_changed=0
>         active_changed=0
>         connectors_changed=0
>         color_mgmt_changed=0
>         plane_mask=0
>         connector_mask=0
>         encoder_mask=0
>         mode: "": 0 0 0 0 0 0 0 0 0 0 0x0 0x0
> connector[34]: HDMI-A-1
>         crtc=(null)
>         self_refresh_aware=0

Please use the "modetest" utility from the libdrm source package, it will
list all the available mode and permit testing other modes.

> 
> At the moment, I and others who have tried to test this code have seen that 
> the peripheral is not enabled (as confirmed by inspecting the appropriate 
> entry under /sys/devices/platform). It appears that one obstacle is that the 
> "bus format" is not set for the connector. Here, I noticed (and was reminded 
> again recently) that in the bridge driver, there is no call to 
> drm_display_info_set_bus_formats unlike in other bridge drivers.

This call is optional, if your video pipeline outputs RGB for the dw-hdmi, then
you can leave the default for now and omit the bus format negotiation.
When you'll push the driver, you'll have to implement it correctly like I did
in the meson-dw-hdmi glue (and in RFC for rockchip driver).

> 
> If such a call is added with a plausible bus format, the peripheral will be 
> enabled, but the signal is not correct (monitors report things like "Input not 
> supported"). It also occurs to me that other aspects of the signal may need to 
> be defined. However, the debugfs state information will be populated with 
> plausible values and seems to indicate that initialisation has taken place.

"Input not supported" means the timings/clk are incorrect.

Of you had an format issue, you'll have incorrect colors/garbled output.

> 
> == Conclusions ==
> 
> Without direct modifications to dw-hdmi.c, it seems like the initialisation of 
> the appropriate data structures is not being completed. Without the call to 
> drm_display_info_set_bus_formats in dw_hdmi_bridge_attach, the encoder does 
> not get set on the connector, and the chain of components is not fully 
> traversed for initialisation.
> 
> One part of this situation is the dw_hdmi_setup function in the bridge driver. 
> Here, there is the following code:
> 
>         /* TOFIX: Get input format from plat data or fallback to RGB888 */
>         if (hdmi->plat_data->input_bus_format)
>                 hdmi->hdmi_data.enc_in_bus_format =
>                         hdmi->plat_data->input_bus_format;
>         else
>                 hdmi->hdmi_data.enc_in_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> 
>         /* TOFIX: Get input encoding from plat data or fallback to none */
>         if (hdmi->plat_data->input_bus_encoding)
>                 hdmi->hdmi_data.enc_in_encoding =
>                         hdmi->plat_data->input_bus_encoding;
>         else
>                 hdmi->hdmi_data.enc_in_encoding = V4L2_YCBCR_ENC_DEFAULT;
> 
> What I seek guidance on is whether the unfixed nature of this code is having 
> an impact and what I should be doing to make this driver initialise correctly. 
> Given that there is no obvious documentation for the Synopsys peripheral, I 
> feel that it will be a long journey figuring this out by myself.

Please enable the dw-hdmi debug prints and enable the DRM debug prints to check
if everything is negociated.

But if you have "Input not supported" on your monitor, this means you have TMDS going
out on your hardware, which is good, this means all the power/reset/system clocks
are ok.
This could mean you have a timing/clock issue, please check if something is not
done on the pixel clock before going to the dw-hdmi block.

Neil

> 
> Thanks for any advice that anyone might have!
> 
> Paul
> 
> [1] https://lists.freedesktop.org/archives/dri-devel/2017-March/134666.html
> 
> [2] http://git.goldelico.com/?p=letux-kernel.git;a=blob_plain;f=drivers/gpu/drm/ingenic/dw_hdmi-jz4780.c;hb=75c6904c2f198825f67172a0a5a98190fa54ae05
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
