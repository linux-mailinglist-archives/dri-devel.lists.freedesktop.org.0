Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2525559BC17
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:57:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBE814A2C1;
	Mon, 22 Aug 2022 08:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C761B14A74B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:57:30 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so3065145lfo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:from:to:cc;
 bh=km5sUamP86E8C09XJHKxgEiMfglAtrZZbG1g5902shE=;
 b=mwGXlYgDeWHtuPn9+fhwIJNDqqHi8U0Oa0bWBgUL0Pbm+koLCTIPmRarbN1Oymcs0I
 SDfpo2ECZWgwI4vygb2X5IDoOgTCZjxIg4IpTyrvEQjdnc1lMuMus4OLkA6+XlAYwM+Z
 Pnf8dUh88dY9XcFpuW7He6W90OMS3nhfkZiZQO32NhwBDZFy2wj50RlGLCtIdSYk8O0J
 gYAhXHNfrNkcs551GsKFFXTYVhTCEi0LdUgiMNrHszzn7owT3jIs6T5wlZqm2YMvIoEq
 4+9/bDaQqImDHTeGGCcek8UN+CgEjQEKBQnJAG8cERkQgla7jsQJ9Lgo9f2eC07o9ToI
 L3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc;
 bh=km5sUamP86E8C09XJHKxgEiMfglAtrZZbG1g5902shE=;
 b=p/954plosquUJGtUcUgdz8Opbcp80MadO3unQzUXXG7siTQojvMqZP7dHQJth10qta
 3/vcjLyBkSKf5O9/+pu6SR2pGpMoiYEtyF16ha7EEKnB3aYB/ZhVFwm4bObhN5+S0Cie
 sn2vNxf2kxk6NZfV++sBmI8bDcYQuVQWFhzAdWrOhcxUqnMvBpyURFxYl9Ys7m9dmXsg
 AOum5Y/vEMMQC5E2ilBiE/v09HTf6l9Qs6llFz4H9UE5MeGQS7LKy9sYNqyhqzTHTAeD
 oHJfeYvCKsMluC1MNODEhxQj3qvvi9j0BdKOtkO3L6WAtzJf775TCraVdAH94xgrGfJu
 W1Tw==
X-Gm-Message-State: ACgBeo0WMk8hlCanUXmVvkHfobWUArK99xEQoTKe9WBCVagi6PKCpmW2
 rXtRS0DOFU+9J1w/k5+QB8w=
X-Google-Smtp-Source: AA6agR69A81MYkmHldVuGgogi1ujKmdM8pAvTqfRMtvZzTU6zcjS+6Uua5ug7h2YyUbaP4GpRzjM5A==
X-Received: by 2002:a05:6512:3f19:b0:48a:874f:534 with SMTP id
 y25-20020a0565123f1900b0048a874f0534mr6494951lfa.446.1661158648923; 
 Mon, 22 Aug 2022 01:57:28 -0700 (PDT)
Received: from [10.10.53.53] (81-18-220-16.static.chello.pl. [81.18.220.16])
 by smtp.googlemail.com with ESMTPSA id
 d16-20020a0565123d1000b0048ae518364dsm946326lfv.148.2022.08.22.01.57.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 01:57:28 -0700 (PDT)
From: Mateusz Kwiatkowski <kfyatek@gmail.com>
X-Google-Original-From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Message-ID: <9a15b1cf-692c-1b0d-02a6-316cbd954525@gmail.com>
Date: Mon, 22 Aug 2022 10:57:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 00/35] drm: Analog TV Improvements
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <987d6114-5fcb-d668-3b0d-ad6d8723dfdb@tronnes.org>
 <20220822074800.qzyctchqn5usr55g@houat>
In-Reply-To: <20220822074800.qzyctchqn5usr55g@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

I tried testing and reviewing your changes properly over the last weekend, but
ultimately ran into this ("flip_done timed out" etc.) issue and was unable to
mitigate it, at least so far. This seems to pop up every time I try to change
modes in any way (either change the TV norm, or just try doing
"xrandr --output Composite-1 --off" followed by bringing it back on; it also
means that the Pi goes unusable when the DE's screen saving routine kicks in).

I'm using a Pi 4, and it works with the rpi-5.13.y branch
https://github.com/raspberrypi/linux, but seemingly nothing newer.
I specifically tried rpi-5.14.y, rpi-5.15.y and rpi-5.19.y - rpi-5.15.y,
which is the current main branch in Raspberry Pi OS, seems to be broken since
forever; at least since my patches (originally written for 5.10) landed there.

I'll try identifying the issue further, possibly later today, and maybe check
the rpi-6.0.y branch as well.

Best regards,
Mateusz Kwiatkowski

W dniu 22.08.2022 o 09:48, Maxime Ripard pisze:
> Hi,
>
> On Sun, Aug 21, 2022 at 06:33:12PM +0200, Noralf Trønnes wrote:
>> Den 29.07.2022 18.34, skrev Maxime Ripard:
>>> Hi,
>>>
>>> Here's a series aiming at improving the command line named modes support,
>>> and more importantly how we deal with all the analog TV variants.
>>>
>>> The named modes support were initially introduced to allow to specify the
>>> analog TV mode to be used.
>>>
>>> However, this was causing multiple issues:
>>>
>>>   * The mode name parsed on the command line was passed directly to the
>>>     driver, which had to figure out which mode it was suppose to match;
>>>
>>>   * Figuring that out wasn't really easy, since the video= argument or what
>>>     the userspace might not even have a name in the first place, but
>>>     instead could have passed a mode with the same timings;
>>>
>>>   * The fallback to matching on the timings was mostly working as long as
>>>     we were supporting one 525 lines (most likely NSTC) and one 625 lines
>>>     (PAL), but couldn't differentiate between two modes with the same
>>>     timings (NTSC vs PAL-M vs NSTC-J for example); 
>>>
>>>   * There was also some overlap with the tv mode property registered by 
>>>     drm_mode_create_tv_properties(), but named modes weren't interacting
>>>     with that property at all.
>>>
>>>   * Even though that property was generic, its possible values were
>>>     specific to each drivers, which made some generic support difficult.
>>>
>>> Thus, I chose to tackle in multiple steps:
>>>
>>>   * A new TV norm property was introduced, with generic values, each driver
>>>     reporting through a bitmask what standard it supports to the userspace;
>>>
>>>   * This option was added to the command line parsing code to be able to
>>>     specify it on the kernel command line, and new atomic_check and reset
>>>     helpers were created to integrate properly into atomic KMS;
>>>
>>>   * The named mode parsing code is now creating a proper display mode for
>>>     the given named mode, and the TV standard will thus be part of the
>>>     connector state;
>>>
>>>   * Two drivers were converted and tested for now (vc4 and sun4i), with
>>>     some backward compatibility code to translate the old TV mode to the
>>>     new TV mode;
>>>
>>> Unit tests were created along the way. Nouveau, ch7006 and gud are
>>> currently broken for now since I expect that work to be reworked fairly
>>> significantly. I'm also not entirely sure about how to migrate GUD to the
>>> new property.
>>>
>>> Let me know what you think,
>>> Maxime
>>>
>> I don't know if it's related to this patchset or not, but I do get this:
>>
>> pi@pi4t:~ $ sudo dmesg -C && sudo modprobe -r vc4 && sudo modprobe vc4
>> && dmesg
>> [  430.066211] Console: switching to colour dummy device 80x30
>> [  431.294788] vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
>> [  431.295115] vc4-drm gpu: bound fec13000.vec (ops vc4_vec_ops [vc4])
>> [  431.295467] vc4-drm gpu: bound fe004000.txp (ops vc4_txp_ops [vc4])
>> [  431.295804] vc4-drm gpu: bound fec12000.pixelvalve (ops vc4_crtc_ops
>> [vc4])
>> [  431.298895] [drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0
>> [  441.444250] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
>> timed out
>> [  441.446529] Console: switching to colour frame buffer device 90x30
>> [  451.684321] vc4-drm gpu: [drm] *ERROR* flip_done timed out
>> [  451.684347] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] commit wait
>> timed out
>> [  461.924255] vc4-drm gpu: [drm] *ERROR* flip_done timed out
>> [  461.924281] vc4-drm gpu: [drm] *ERROR* [CONNECTOR:45:Composite-1]
>> commit wait timed out
>> [  472.164006] vc4-drm gpu: [drm] *ERROR* flip_done timed out
>> [  472.164031] vc4-drm gpu: [drm] *ERROR* [PLANE:61:plane-1] commit wait
>> timed out
>> [  482.403877] vc4-drm gpu: [drm] *ERROR* flip_done timed out
>> [  482.403903] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
>> [  492.643799] vc4-drm gpu: [drm] *ERROR* [CRTC:68:crtc-1] flip_done
>> timed out
>> [  492.647073] vc4-drm gpu: [drm] fb0: vc4drmfb frame buffer device
> Module unloading/reloading has been janky for a while.
>
> I've fixed it up recently but it doesn't surprise me that there's still
> some situation that won't work. Is it on a Pi3?
>
> Maxime


