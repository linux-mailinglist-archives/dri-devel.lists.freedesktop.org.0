Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A9AC9A05
	for <lists+dri-devel@lfdr.de>; Sat, 31 May 2025 10:19:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34BD310E8C3;
	Sat, 31 May 2025 08:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.dnamail.fi (sender001.dnamail.fi [83.102.40.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEBC810E766
 for <dri-devel@lists.freedesktop.org>; Thu, 29 May 2025 19:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp.dnamail.fi (Postfix) with ESMTP id CD0EA211393D;
 Thu, 29 May 2025 22:19:57 +0300 (EEST)
X-Virus-Scanned: X-Virus-Scanned: amavis at smtp.dnamail.fi
Received: from smtp.dnamail.fi ([83.102.40.178])
 by localhost (dmail-psmtp01.s.dnaip.fi [127.0.0.1]) (amavis, port 10024)
 with ESMTP id R2DvHawcQluJ; Thu, 29 May 2025 22:19:57 +0300 (EEST)
Received: from [192.168.101.100] (87-92-65-114.bb.dnainternet.fi
 [87.92.65.114])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: oak@dnamail.internal)
 by smtp.dnamail.fi (Postfix) with ESMTPSA id 7393E2113E0A;
 Thu, 29 May 2025 22:19:56 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.dnamail.fi 7393E2113E0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helsinkinet.fi;
 s=2025-03; t=1748546397;
 bh=T6/thmnsvAPaYL6Mmn5QwFZIvsfMsLdacMPabk7GeAY=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=Cow9HLQuYkWJRifFxNE9Vt0XBOOfI59mFJnz7XOY1aQtLlEEFuVzUpIQ4bf2fuayy
 DOmYslcvJyYqgcTloR/gFIcQpY+GuhLLizON1b5Fm/pfK/jYzT93oPwvFc0YSG3TJF
 JT1SJDYsLw8Ru7MDfimgcOCZl9ZwlJ/ir97aezm2v9CsSHeSl7YV18DDsfOvijquKJ
 R5UzmdGcU6jJ8j1sQxYZbSXP8xDPj0iRTRe2oQh6uPujhj0Ezxn4FB3pf1cHOVeTA9
 VvpTUEqWWBkTre5ZzydiJYE1z3yCDlrfgycVFQzA0XEXfeNh+8nb+t45TtDXUJkVSK
 JBrbf1SthkrwA==
Message-ID: <2aa2efc0-9099-4b8a-b359-acab004e7495@helsinkinet.fi>
Date: Thu, 29 May 2025 22:19:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 0/3] Atari DRM driver
From: Eero Tamminen <oak@helsinkinet.fi>
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
 <65b78057-c490-46a3-92a7-350d314d604e@helsinkinet.fi>
Content-Language: en-US
In-Reply-To: <65b78057-c490-46a3-92a7-350d314d604e@helsinkinet.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 31 May 2025 08:18:51 +0000
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

Hi,

On 29.5.2025 3.06, Eero Tamminen wrote:
> On 28.5.2025 11.57, Geert Uytterhoeven wrote:
> There were some extra config differences between my builds for 6.15 
> "atafb" and your "atari-drm-wip-rebasing" branch.
> 
> After removing the ones I could:
> --------------------------------
> $ diff -ub .config.old .config | grep '^[-+]C'
> -CONFIG_I2C_HELPER_AUTO=y
> -CONFIG_LOGO=y
> -CONFIG_LOGO_LINUX_MONO=y
> -CONFIG_LOGO_LINUX_VGA16=y
> -------------------------------
> 
> Bus error issue went away.
> 
> => Could there be some issue with how logo and "atari-drm" code 
> interact, which could manifest when reaching user-space?
> 
> Note: I haven't tried enabling logo with "atafb" + -O2 build. I could 
> try that later on.

Tried that now.  Enabling logo config options for "atafb" kernel did not 
cause bus error with -O2.  It did not show logo though, the area where 
the logo was shown with "atari-drm", was just black.

=> No conclusive result on whether logo triggers the bus error.


As to boot time with minimal kernel booting on (emulated) 32Mhz Falcon, 
according to /proc/uptime...

"-Os" kernel build:
- atafb:     11.87s
- atari-drm: 21.04s

=> Nearly 80% slower.

"-O2" kernel build:
- atafb:     10.35s
- atari-drm: 11.42s

=> Only 10% slower.

I.e. difference in -Os / -O2 boot time is clearly due to "atari-drm" driver.


	- Eero

