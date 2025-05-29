Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D55BAC7A71
	for <lists+dri-devel@lfdr.de>; Thu, 29 May 2025 10:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52F8810E1EE;
	Thu, 29 May 2025 08:53:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.dnamail.fi (unknown [83.102.40.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BEF10E6DA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 00:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.dnamail.fi (Postfix) with ESMTP id 030482113FDF;
 Thu, 29 May 2025 03:06:26 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id FeNXvAyyUUHF; Thu, 29 May 2025 03:06:25 +0300 (EEST)
Received: from [192.168.101.100] (87-92-117-50.bb.dnainternet.fi
 [87.92.117.50])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: oak@dnamail.internal)
 by smtp.dnamail.fi (Postfix) with ESMTPSA id DF7062113E1E;
 Thu, 29 May 2025 03:06:19 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi DF7062113E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
 s=2025-03; t=1748477185;
 bh=BZKDqUvThCOAsLsVDcty5d/tHWRd3GqWTcJQtTI+Mi0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eoZYNd1yt78GjS8EQZJYPsyHaSm81kCdpTimmnS96+BjmIeyul+6p/u+KStqFAhxt
 gWcdMt+eLw95zitTVoUhCA4wpOSkTEbQ2aoLgcKMtrX1doK66+hQTG/KsytLuD72qB
 PsW+ryyvKgn9rYlddxsmwTHll37+dXTv3ukY/vMRyfMKFbTSTWMts5P559ypmGh/s/
 l76t4gbnbrS1snA2anlyhyK7dUi8iyg+FGpf+41MINMb47HLyHg9Y96VyKNo6lt5Cp
 3RtU2jo9+3uyV+IS0ZHsJKw1H9xtsE1hOBlqLNuJM2RnbYGr83sSVVTRSL7XoPYspX
 SJDad9yEg9RHQ==
Message-ID: <65b78057-c490-46a3-92a7-350d314d604e@helsinkinet.fi>
Date: Thu, 29 May 2025 03:06:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 0/3] Atari DRM driver
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Michael Schmitz <schmitzmic@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <cover.1669406380.git.geert@linux-m68k.org>
 <a9883a81-d909-09c5-708b-d598e030380e@physik.fu-berlin.de>
 <CAMuHMdWHUnWBN7ddBow+fqmt8W--9wFe5x_YMeRg7GQ=BNAL2Q@mail.gmail.com>
 <74946b31-6166-44b0-b2a7-b0633f014b60@helsinkinet.fi>
 <CAMuHMdXSWiM_xofyfgpoc0Jj8a_PwRR_tFe79t8=-X85-7WZug@mail.gmail.com>
 <beed53f4-b0d6-4d1d-b5ec-2694d2b5d47a@helsinkinet.fi>
 <CAMuHMdUSADF51tBbGV=_nsxqyXgfNZcgDNGxuZ4F+tvYs9Q2aw@mail.gmail.com>
 <72078ec9-25a0-42d5-b7da-b0a974033f86@helsinkinet.fi>
 <CAMuHMdXDdrMewGgeghr3cwtaBvieguYOC4GZ-EXZmA+w5S4bpw@mail.gmail.com>
Content-Language: en-US
From: Eero Tamminen <oak@helsinkinet.fi>
In-Reply-To: <CAMuHMdXDdrMewGgeghr3cwtaBvieguYOC4GZ-EXZmA+w5S4bpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 29 May 2025 08:52:55 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On 28.5.2025 11.57, Geert Uytterhoeven wrote:
> On Wed, 28 May 2025 at 00:47, Eero Tamminen <oak@helsinkinet.fi> wrote:
>> I did boot testing on Hatari emulator with a minimal kernel config
>> having atari_drm enabled, atafb disabled, FB & boot logo enabled.
>>
>> Under Falcon emulation:
>> - RGB/VGA => works fine
>> - Mono monitor => panic
>>     "Kernel panic - not syncing: can't set default video mode"
 >>
>> Under TT emulation:
>> - RGB/VGA => boots, but console is black[1] (palette issue?)
>> - Mono monitor => looks OKish[2], but has constant warnings:
>> -----------------------------------
>> WARNING: CPU: 0 PID: 1 at drivers/gpu/drm/drm_atomic_helper.c:1720
>> drm_atomic_helper_wait_for_vblanks+0x1a0/0x1ee
>> [CRTC:35:crtc-0] vblank wait timed out
> 
> I am not sure this is a bug in atari-drm, or just an issue when using
> DRM on slow machines.

This does not trigger with -Os built "atafb" kernel, but happens even 
with -O2 built "atari-drm" kernel.  Something related to the higher (71) 
HZ of the mono monitors?

(I don't think it relates to TT mono monitor's larger 1280x960 
resolution, because it happens also with ST mono monitor 640x400 one.)

Btw. both kernels include:
$ grep ^CONFIG.*WATCH .config
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_SOFT_WATCHDOG=y
CONFIG_WQ_WATCHDOG=y

>> -----------------------------------
>>
>> Under 030 ST/STe emulation:
>> - RGB/VGA => boots, but console is black (palette issue?)
>> - Mono monitor => looks OK, but has constant slowpath warnings with:
>>     "[CRTC:35:crtc-0] vblank wait timed out"
>>
>> => Any advice on the issues?
> 
> Are these regression in atari-drm, or do they happen with atafb, too?

Only the "can't set default video" issue in Falcon mono mode happens 
also with "atafb".

It has neither the above vblank timeout issue in mono mode, nor 
black-on-black color issue in color mode (on TT and 030 ST).

...
>> However, -O2 build has the downside that the resulting kernel Oopses
>> once it reaches user-space, if 030 data cache emulation is enabled:
>> ----------------------------------------------------------------
>> Run /init as init process
>> ...
>> Instruction fault at 0x0041a256
>> BAD KERNEL BUSERR
> 
> Interesting...

There were some extra config differences between my builds for 6.15 
"atafb" and your "atari-drm-wip-rebasing" branch.

After removing the ones I could:
--------------------------------
$ diff -ub .config.old .config | grep '^[-+]C'
-CONFIG_I2C_HELPER_AUTO=y
-CONFIG_LOGO=y
-CONFIG_LOGO_LINUX_MONO=y
-CONFIG_LOGO_LINUX_VGA16=y
-------------------------------

Bus error issue went away.

=> Could there be some issue with how logo and "atari-drm" code 
interact, which could manifest when reaching user-space?


Note: I haven't tried enabling logo with "atafb" + -O2 build. I could 
try that later on.


	- Eero

