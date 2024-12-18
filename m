Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF1F9F6813
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:18:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09B510E318;
	Wed, 18 Dec 2024 14:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="X/W92h7h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED0310EB95
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:18:16 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436249df846so45564575e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 06:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1734531495; x=1735136295; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cOSusqsktfDuxu16rk7M+LG/oRYwLBrKmcYhe7v+/9Q=;
 b=X/W92h7h/rKiC8i+hUximNYyvJ+U8LbsSoOFMbS/G8SC14QfeOV8bsffjQgTqHH/Hm
 PleQR+m91nXL7pPGbNZnkdgqokqh7KBK3XwCIVKqY8OkTNiqNcLtSXM5NdfMBP1r9DQ0
 mMGHuO0lLBELQnjdrJ/XOKsO+MRBP2QkE9wKwzfPjvDxNUwya0WjrfIXSzt6U4K4muqH
 D2AW0boqkdsItritXGVFUnWh5ILq7yUMDMt/apdLwB82Rd/Yl7X+R2tAv93BriYyjzCB
 vlKc7+rxnvIIMm8+r0Ukf/1c6gK5XxiopX8wK8apNcjWZagsX8FoYECv5h4BjN78wOh/
 nZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734531495; x=1735136295;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cOSusqsktfDuxu16rk7M+LG/oRYwLBrKmcYhe7v+/9Q=;
 b=KtHQTCImzvMM4jLwMMaCuxBc+ngvDgZe7iLVT9ZOzZRVLxd5iU3vzU4jbIxRGFg6Cp
 IBxIZm5fkkyzl3PWtDddEiSc3eVDcHk9I4V+TWwL4AHOkyJjJ2LcRbPhPRlxrnzr05Ow
 mHrLE2ojWIFJ2WhwhFmhhJ/T/kBchherOQmLyN84RXRJOAYYFxcVfYClh4ewjLsLMx6z
 yoe+lcQBljaNqs2R9cF9w2QGK/KeLS5xrQ4U1CvrSVautTriZqzmdi7i7y3SOlQl+KDu
 3F0WpXbkk80mWbbRv0qwpOqpHJeEC5tzEkxCBQkpaMswk/+PMgA3kRHNBJrZRL2gk5s6
 RsTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNcS49qVQ45RcGevr+1Za5t7t3dW00A/DPwfDUKmNMN5cVY5lEAPzGKjyXkQwfBsW8yXuLAP3gOHc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpPM/VtuPxpQSdWHIu6BC6lNF0RIuze0VQrndn7Ingy1eNk1zM
 3qHN8T88iei+moKODu+AMlUOxpQJ/WuMbkBtyRI962dhDUGxpuQOSYFaO9bL1mU=
X-Gm-Gg: ASbGncthV4bV2SwH/a2U8K1P33V2Uo6RZjPj9X9rrzH5resn+7lhmjOHpYaQiKOuCpI
 m5irK9HjHA0RQ3ZKk+nBCE5UDJp2RHI6uypqmMrRzi+fIJbYjWACJH0aMgcD45NvMFqM5Ri7VVC
 D6V/8WVVFl7lI44nwHJq5byqlsZBwXaHwRhH4EYivONyQNznLHNFcmHTd4ontVmEy0EohCjAEmW
 SjsD7I0fOprjKH5k/m1/gG9Sre3CCEkRrdRQi15cQgWZ6a1hUrAA4LwXQ==
X-Google-Smtp-Source: AGHT+IEaISJLNAKw87VA5njzUdMOysTz70EmeTh0tRvEzKJXALSuN6Rh9dx9COPILxnSQjSbHjZIBw==
X-Received: by 2002:a05:600c:1c99:b0:431:5aea:95f with SMTP id
 5b1f17b1804b1-4365536e479mr28298645e9.16.1734531494753; 
 Wed, 18 Dec 2024 06:18:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b013ecsm21888165e9.16.2024.12.18.06.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 06:18:14 -0800 (PST)
Date: Wed, 18 Dec 2024 15:18:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v9 0/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Message-ID: <Z2LZozgxxQuusHVS@pathway.suse.cz>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
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

On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
> On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> > Hi Jocelyn,
> > 
> > On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> > > > On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> > > > > > On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > > > drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> > > > > > > This is not a full replacement to fbcon, as it will only print the kmsg.
> > > > > > > It will never handle user input, or a terminal because this is better done in userspace.
> > > > > > > 
> > > > > > > If you're curious on how it looks like, I've put a small demo here:
> > > > > > > https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> > > > > > > 
> > > > > > > Design decisions:
> > > > > > >      * It uses the drm_client API, so it should work on all drm drivers from the start.
> > > > > > >      * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
> > > > > > >        It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
> > > > > > >      * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
> > > > > > 
> > > > > > I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> > > > > > Unfortunately I don't see any kernel messages, and my monitor complains
> > > > > > about no signal. Does this require special support from the driver?
> > > > > 
> > > > > It doesn't require a special support from the driver. But as it is the
> > > > > first drm client other than fbdev emulation, I'm not surprised it's
> > > > > broken on some driver.
> > > > > I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
> > > > > (Qualcomm SDM845/freedreno), without requiring driver changes.
> > > > > 
> > > > > Do you have a serial console on this device, to check if there is
> > > > > something in kmsg?
> > > > 
> > > > Nothing interesting to see. Compared to the fbdev client:
> > > > 
> > > >        rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
> > > >        [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
> > > >        rcar-du feb00000.display: [drm] Device feb00000.display probed
> > > >       -Console: switching to colour frame buffer device 240x67
> > > >       -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
> > > > 
> > > > I did verify (by adding my own debug prints) that the code does
> > > > get to the success case in drm_log_register().
> > > > Thanks!
> > > 
> > > Maybe you need to add console=drm_log to your kernel command line, so
> > > the kernel will actually use this console.
> > 
> > Thanks, that does the trick!
> > 
> > Note that I do not need to specify any console= kernel command line
> > parameter for the fbdev console.
> 
> Yes, the fbcon console is tty0, which is hardcoded for historical reason.
> Some architectures use add_preferred_console() to enable specific consoles,
> I'm not sure it's allowed to use that from the drm_log_register() code.

add_preferred_console() is used when the console should get enabled
intentionally. I would split the intentions into two categories:

  + requested by the end-user on the command line, see
       __add_preferred_console(..., true) in console_setup()

  + enabled by default by a hardware definition (manufacture), see
       add_preferred_console() in:

	+ of_console_check(): generic solution via device tree
	+ acpi_parse_spcr(): generic solution via SPCR table
	+ *: hardcoded in few more HW-specific drivers

add_preferred_console() causes the console will always get enabled
when it is successfully initialized.

So, should the "drm_log" console get always enabled?


> I will still send a patch to add update the Kconfig help for drm_log, as
> this command line argument is required to have it working.

I guess that the drm_log consoles should get enabled only when
requested by the user => documenting the command line parameter
is the right solution here.

Best Regards,
Petr
