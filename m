Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE85E21570F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 14:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88746E364;
	Mon,  6 Jul 2020 12:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCF16E364
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jul 2020 12:12:27 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o11so40617703wrv.9
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jul 2020 05:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GaSxmKSD4fAr72vQntjKYLXBJtXn9PUt6QyYqH8rOhw=;
 b=YI7ioxNJESX51nyyTM+9siMVryklDX87grO84B0gIfhX6SJNS4z2zFff3bs8vOBOYT
 MY9wxvOcqfzS4+V20gkj2loChTwNEGJEgCPPbTT31Q+XI2mfjfHIwQ3c9w5o3Nul33bG
 Qrb1ogUUqCt81Q6M9jULvObOxzqn9s/4yYY2Bd2C84assVoYLCZef8xe0LuRoTAp5v6s
 BVcBXriy/NLU3UTG12LRLVcGTmi/dcDiBe1CT9cuyjNKkIRhB1edXuPWeofVogc2NBF4
 z4DV1hmBHKdlF7/s0zYw4c2YKuS7zp0ak7+gWPBM/NRI/cVdCNvCfno0CFC84sPjTUwg
 igtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GaSxmKSD4fAr72vQntjKYLXBJtXn9PUt6QyYqH8rOhw=;
 b=NYR4Lod2CnUOQC/rfqbCzB7UZZlYufOEeHy+J/ZnaD5DKlMXB/j9rRwy/JT5JB6fIZ
 ehaezqXN0wm9FPuJhc0ZWd03jsqCi9X6wRqpK3bB9rpQcMM3fz9OhuGG3FqPP+KvyiYA
 bsgr8ozBVm8przd1hswZusDBHHDE2tJnsb/5Sjqozxxo80ciWU42U4fxgXEPCENyYmJ9
 WBgfozmiVX+zt90lckpRn9CK/UUQbDjaSJB3h9GN67l76+Lk9+E4RvRyl99cLcOMdqfL
 uywTcashIGrKmtbf0WFLRM5cWjVFUGw++uNYsdVyx3F/BHC26n+e7MzJ8S3oVt6hh0d6
 15JA==
X-Gm-Message-State: AOAM530tYTi2NEAyYDRhs4xf8/q42WG4CpED0oT+lIWjVjK0WPDJIDdS
 DvNLD7mz0cyxKNFV/YV/65bWJhyL4u4tyQ==
X-Google-Smtp-Source: ABdhPJzIzHo1GkjTc2vHvn8sv27QDqsPnzIFfNFIlp/KWVvIvXTmr+jX7SzmNYEJv2oYudAoZBuYSQ==
X-Received: by 2002:adf:8091:: with SMTP id 17mr35976801wrl.13.1594037546315; 
 Mon, 06 Jul 2020 05:12:26 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:6959:e617:6562:cabf?
 ([2a01:e35:2ec0:82b0:6959:e617:6562:cabf])
 by smtp.gmail.com with ESMTPSA id z132sm23722179wmb.21.2020.07.06.05.12.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2020 05:12:25 -0700 (PDT)
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: Paul Boddie <paul@boddie.org.uk>
References: <1940005.XIBaf5lNV5@jeremy> <1660901.RzKB6nuZHq@jeremy>
 <1689d947-b2e1-c023-b2ed-1e9d23c075f3@baylibre.com>
 <7086465.UhkgK7rEtT@jason>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com>
Date: Mon, 6 Jul 2020 14:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <7086465.UhkgK7rEtT@jason>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 06/07/2020 01:57, Paul Boddie wrote:
> Hello,
> 
> On Friday, 15 May 2020 09:43:54 CEST Neil Armstrong wrote:
>>
>> On 15/05/2020 00:04, Paul Boddie wrote:
>>>
>>> Well, I've done this but I probably need to know what to look for. One
>>> thing that appears regardless of this debugging output being enabled is a
>>> problem with the vertical blanking functionality:
>>>
>>> WARNING: CPU: 1 PID: 396 at drivers/gpu/drm/drm_atomic_helper.c:1457
>>> drm_atomic_helper_wait_for_vblanks+0x1ec/0x25c
>>> [CRTC:32:crtc-0] vblank wait timed out
>>
>> This means the CRTC didn't start, usually because the Pixel clock didn't go
>> through the pipeline to the pixel generator, thus not generating
>> vblank/vsync interrupts.
>>
>> You may check if there is not muxes to select the clock source/pixel
>> destination.
> 
> It has obviously been a while since I asked about the DW-HDMI functionality. 
> Since then, I have verified the initialisation of the Ingenic JZ4780 LCD 
> controller and the Synopsys HDMI peripheral in the L4 Runtime Environment 
> (running on the Fiasco.OC microkernel), producing a picture and handling 
> display interrupts.
> 
> Having brought the necessary changes back to the Ingenic DRM driver, I can 
> make the driver activate the LCD controller and produce vertical blank 
> interrupts, and these are handled and counted in /proc/interrupts. The 
> previous errors about timeouts are now gone.
> 
> However, the DRM driver can only be made to start if I set the bus format in 
> dw_hdmi_bridge_attach:
> 
>   u32 bus_format[] = { MEDIA_BUS_FMT_RGB888_1X24 };
>   ...
>   (&connector->display_info,
>                                    bus_format, ARRAY_SIZE(bus_format));
> 
> Without this, the DRM driver will test for a bus format on the connector's 
> display_info structure in ingenic_drm_encoder_atomic_check and return EINVAL. 
> There have previously been indications that this should not need to be done, 
> but I see that other drivers do similar things (for example, ti-tfp410.c).

I think this is specific to the ingenic DRM driver, so yeah it may be needed in your case.

> 
> It also seems to be appropriate to set the input_bus_format on the platform-
> specific HDMI driver; otherwise, I doubt that appropriate bus encodings will 
> be chosen in the Synopsys driver.

It does but when not provided, it doesn't use it.

It's handled in drm_atomic_bridge_chain_select_bus_fmts() :
	if (conn->display_info.num_bus_formats &&
		    conn->display_info.bus_formats)
		out_bus_fmts[0] = conn->display_info.bus_formats[0];
	else
		out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;

> 
> [...]
> 
>>> Attempting to set a mode using...
>>>
>>> modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
>>>
>>> ...yields the following:
>>>
>>> failed to set mode: Permission denied
>>> setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
>>
>> This is weird, the command line is ok, is it the same for all modes ?
> 
> Testing against 5.8-rc3 with the above changes seems to have moved the needle 
> slightly. Although I still get "Input not supported" from my monitor, running 
> modetest now gives a different error:
> 
> modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
> 
> ...now yields this:
> 
> setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
> failed to set gamma: Invalid argument

This is because you don't provide the gamma setup ioctl, it's not a fatal error at all.
It should be warning since it's optional.

Did you check all modes ?

> 
> There also seems to be a card1, but I get the same result with that, and they 
> both seem to produce similar output with modetest without the -s option.
> 
> Anyway, progress is rather slow trying to figure out the obstruction here, so 
> any advice would still be appreciated.
> 
> Thanks in advance,
> 
> Paul
> 
> 

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
