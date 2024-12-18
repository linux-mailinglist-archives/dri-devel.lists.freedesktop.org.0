Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35B39F6AE2
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 17:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F74089209;
	Wed, 18 Dec 2024 16:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Oc3dh+hn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E17E89209
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 16:18:55 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361815b96cso44993445e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 08:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1734538734; x=1735143534; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2F/lV3ZsB3pFwOUjTRc+ff2pMc0UkGP98ZvptGRnH0s=;
 b=Oc3dh+hnFgFNQITDrYMfOnab/Ako20C1zlOMIgqZnDBRwHiGTeqabNvvKMY73N5G5b
 2H76nsjNn0DBJ1REmHflIGDZWBZn0nGTsK9Tfr8e7wI2sXdAg3DiaTUXoRW7X+5MLiAl
 WRk7GKgdH9dteh6Bmh9Y1udHjRjrkU9rJOoKZB8++DvNqa+3E0QACWADSRdAnOQDVOul
 YSiqF6bwLDIoHRj6hC6ZVBeOKqqUGOlmdl4/HeTCYJG3SsvXQpxl6yldSxt5Y9mPG6tk
 1HxdjyTxtbHadXwUBlE5QOecSNYqRsf8crD0Y6dTALRbIWjT5wthGdco/pGfLYi+rNa8
 hn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734538734; x=1735143534;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2F/lV3ZsB3pFwOUjTRc+ff2pMc0UkGP98ZvptGRnH0s=;
 b=W933orTUCZDM+7zFrubT3IDtCJQNYyNhEn+ioBd3O3bH9F9rR61dF6NyFvANHsI9Gd
 2fQ5RJAQLxkWRb20+uiYQAgp7Q3jenpIssyUTNMQIhqWF8JUFzM4nHVBon3f+ZMb7VOd
 G5j7lv4Fae7i3h2EZah7tCySNDXwmPEOq1S7cJpfyNnBJRG12UQ2xwgMszFEx/aecvtI
 SltlNyOZ2YI/7jkutbYPAnKoy/UE/wKPzWktWiS1Qb/2nif/fd/+YWvgfZ9q1nSzpLXp
 JBPQe5E7BxEJfmxiqevlWcvtpP7sBjnAuh5+ZYEcjikH84v8K4c4x8jB1QQ6ygwBfDJp
 uvWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7WOBnoDt+AgOUuUhTpa9SECz3cFYlCcAUCcvuIOki4nJEJgqU69d3fK7mMW+fIPyHoRFeJkEuSR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySHebTxbi+PgHunSvsFTJcdTE+BHT+Z571ZxgsoKkrK0EJTP3A
 /L5khGubDV/Asa63SP7u218mNZ0LU6GDf+LRG1Qa3dEdGWpe3O6MqzA+LrzyJzs=
X-Gm-Gg: ASbGnctsrvBDw0Pi5UiXo1i/th4kOTZRwRvsPCKgnGQh7n1LuJN6OZ0Np/nACVoucMz
 SQ6vPZUM6zaFZtD5YHSV96LQ9W1aabRt5/rg7pK0ZCg4RcTBMQZNJC+cGEk6Evr/hn+QNquOZri
 gMMQEPINdOQDG6m7J2FgskW6dX1ce6mhKZwcP9EzLmG9sGOhTM34KtnKwbnFVf5bnDhwsdwrSJF
 jJgVs/ood1N44ObuSrnL+TEPlzt11cZ7xooIG3yr9wpQ4ucVr13PKN24A==
X-Google-Smtp-Source: AGHT+IGbLZPQJZ7twfayueNyTQTfh3891vx9Xx4c1+gL7vqeJ0Pt+ex5MYh+nnDIfzfuGdUl/DFOPQ==
X-Received: by 2002:a05:6000:4a13:b0:386:1cd3:8a09 with SMTP id
 ffacd0b85a97d-38a19adeff4mr231262f8f.1.1734538733524; 
 Wed, 18 Dec 2024 08:18:53 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c806cbd8sm14251086f8f.109.2024.12.18.08.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 08:18:53 -0800 (PST)
Date: Wed, 18 Dec 2024 17:18:50 +0100
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
Message-ID: <Z2L16iXZ-BD4RliW@pathway.suse.cz>
References: <20241204160014.1171469-1-jfalempe@redhat.com>
 <CAMuHMdU925NiJDy4fOcQhA=jp8=79rZ3h5-TYxCjzkGwqQdKOg@mail.gmail.com>
 <301714d8-0723-4881-83e8-24523c121bfe@redhat.com>
 <CAMuHMdXxwv2WgeAoO5w41cRpXgVBr0PhrgCP3A0X_nsFVM+6Gg@mail.gmail.com>
 <d4c249fa-624e-4f73-9aed-e04b405b4079@redhat.com>
 <CAMuHMdXEK-2u3th=5QVd6-pkBj_JhgEfFAe_ocGEAz=Dyi_h+g@mail.gmail.com>
 <f407194f-ae8e-4e0d-96af-9984e8f2123c@redhat.com>
 <Z2LZozgxxQuusHVS@pathway.suse.cz>
 <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffa47056-994c-487a-b3ea-92c049c11b81@redhat.com>
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

On Wed 2024-12-18 15:58:46, Jocelyn Falempe wrote:
> On 18/12/2024 15:18, Petr Mladek wrote:
> > On Wed 2024-12-18 12:41:39, Jocelyn Falempe wrote:
> > > On 18/12/2024 12:00, Geert Uytterhoeven wrote:
> > > > Hi Jocelyn,
> > > > 
> > > > On Wed, Dec 18, 2024 at 11:14 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > On 17/12/2024 15:54, Geert Uytterhoeven wrote:
> > > > > > On Tue, Dec 17, 2024 at 3:46 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > > > On 17/12/2024 15:19, Geert Uytterhoeven wrote:
> > > > > > > > On Wed, Dec 4, 2024 at 6:41 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
> > > > > > > > > drm_log is a simple logger that uses the drm_client API to print the kmsg boot log on the screen.
> > > > > > > > > This is not a full replacement to fbcon, as it will only print the kmsg.
> > > > > > > > > It will never handle user input, or a terminal because this is better done in userspace.
> > > > > > > > > 
> > > > > > > > > If you're curious on how it looks like, I've put a small demo here:
> > > > > > > > > https://people.redhat.com/jfalempe/drm_log/drm_log_draft_boot_v2.mp4
> > > > > > > > > 
> > > > > > > > > Design decisions:
> > > > > > > > >       * It uses the drm_client API, so it should work on all drm drivers from the start.
> > > > > > > > >       * It doesn't scroll the message, that way it doesn't need to redraw the whole screen for each new message.
> > > > > > > > >         It also means it doesn't have to keep drawn messages in memory, to redraw them when scrolling.
> > > > > > > > >       * It uses the new non-blocking console API, so it should work well with PREEMPT_RT
> > > > > > > > 
> > > > > > > > I gave this a try on Koelsch (R-Car M2-W), using rcar-du.
> > > > > > > > Unfortunately I don't see any kernel messages, and my monitor complains
> > > > > > > > about no signal. Does this require special support from the driver?
> > > > > > > 
> > > > > > > It doesn't require a special support from the driver. But as it is the
> > > > > > > first drm client other than fbdev emulation, I'm not surprised it's
> > > > > > > broken on some driver.
> > > > > > > I know it works on virtio-gpu, nouveau, amdgpu, and even on a OnePlus 6
> > > > > > > (Qualcomm SDM845/freedreno), without requiring driver changes.
> > > > > > > 
> > > > > > > Do you have a serial console on this device, to check if there is
> > > > > > > something in kmsg?
> > > > > > 
> > > > > > Nothing interesting to see. Compared to the fbdev client:
> > > > > > 
> > > > > >         rcar-du feb00000.display: [drm] Registered 2 planes with drm panic
> > > > > >         [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
> > > > > >         rcar-du feb00000.display: [drm] Device feb00000.display probed
> > > > > >        -Console: switching to colour frame buffer device 240x67
> > > > > >        -rcar-du feb00000.display: [drm] fb0: rcar-dudrmfb frame buffer device
> > > > > > 
> > > > > > I did verify (by adding my own debug prints) that the code does
> > > > > > get to the success case in drm_log_register().
> > > > > > Thanks!
> > > > > 
> > > > > Maybe you need to add console=drm_log to your kernel command line, so
> > > > > the kernel will actually use this console.
> > > > 
> > > > Thanks, that does the trick!
> > > > 
> > > > Note that I do not need to specify any console= kernel command line
> > > > parameter for the fbdev console.
> > > 
> > > Yes, the fbcon console is tty0, which is hardcoded for historical reason.
> > > Some architectures use add_preferred_console() to enable specific consoles,
> > > I'm not sure it's allowed to use that from the drm_log_register() code.
> > 
> > add_preferred_console() is used when the console should get enabled
> > intentionally. I would split the intentions into two categories:
> > 
> >    + requested by the end-user on the command line, see
> >         __add_preferred_console(..., true) in console_setup()
> > 
> >    + enabled by default by a hardware definition (manufacture), see
> >         add_preferred_console() in:
> > 
> > 	+ of_console_check(): generic solution via device tree
> > 	+ acpi_parse_spcr(): generic solution via SPCR table
> > 	+ *: hardcoded in few more HW-specific drivers
> > 
> > add_preferred_console() causes the console will always get enabled
> > when it is successfully initialized.
> > 
> > So, should the "drm_log" console get always enabled?
> 
> drm_log is a replacement for fbcon, which is always enabled, so I think it
> should also be always enabled. Otherwise you won't get any console as fbcon
> is no more available.

IMHO, it is not true that "fbcon" is always enabled. For example,
if you mention "console=ttyS0,115200" on the command line then only
the serial console is enabled.

Honestly, I do not understand completely the connection between the
drm drivers and the console subsystem.

My understanding is that fbcon is registered via the very old and
generic VT (Virtual Terminal) layer, see do_fbcon_takeover().

As a result, it gets registered/enabled by default when there is
no other console defined on the command line or an
add_preferred_console() call.

It is this code:

void register_console(struct console *newcon)
{
[...]
	/*
	 * See if we want to enable this console driver by default.
	 *
	 * Nope when a console is preferred by the command line, device
	 * tree, or SPCR.
	 *
	 * The first real console with tty binding (driver) wins. More
	 * consoles might get enabled before the right one is found.
	 *
	 * Note that a console with tty binding will have CON_CONSDEV
	 * flag set and will be first in the list.
	 */
	if (preferred_console < 0) {
		if (hlist_empty(&console_list) || !console_first()->device ||
		    console_first()->flags & CON_BOOT) {
			try_enable_default_console(newcon);
		}
	}
[...]
}

Note that try_enable_default_console(newcon) fails only when
newcon->setup() fails. It means that the given console is almost
always enabled when this function is called.

The important thing here might be the check of "!console_first()->device".
It causes, that register_console() stop calling
try_enable_default_console(newcon) when there is at least one console
with the tty binding registered.

IMHO, this is the reason why "fbcon" is enabled by default. It is
the first registered driver with the tty binding.

Also this might be the reason why "drm_log" is _not_ enabled by
default. I guess that drm_log_register() is called too late.
I guess that there already is enabled another console driver with
tty binding at that time, most likely the serial console.

Could you please confirm this?
What console is enabled when console=drm_log is not used, please?


> drm_log doesn't really fit in the architecture/hardware model, because drm
> drivers are available for a wide range of architecture, and a GPU can do
> either fbdev/fbcon or drm_log.
> > 
> > > I will still send a patch to add update the Kconfig help for drm_log, as
> > > this command line argument is required to have it working.
> > 
> > I guess that the drm_log consoles should get enabled only when
> > requested by the user => documenting the command line parameter
> > is the right solution here.
> 
> Most embedded linux specify the console on the command line, but for
> laptop/desktop distributions, it's not the case as fbcon is the default
> since the beginning.
> 
> I see a few options here:
> 1) Use add_preferred_console("drm_log") if DRM_CLIENT_LOG is enabled for
> x86_64 and maybe arm64, so at least the main users are covered.
> 2) Have a DRM_CLIENT_LOG_PREFERRED_CONSOLE config, so that it's easier to
> setup than changing the kernel command line.

I guess that you plan to call add_preferred_console() in this case.
It is not the same as "fbcon" now:

1. It would cause that "drm_log" will always be enabled. It won't be
   possible to override it on the command line.

2. It will set "preferred_console". As a result,
   try_enable_default_console(newcon) will never be called.
   => there won't be any console when "drm_log" initialization
   fails and drm_log_register() is not called from some reason.

> 3) Use the kernel command line.


An ideal solution would be to allow calling drm_log_register() so
that it can be registered as the first console driver by
try_enable_default_console().

If this is not possible than we should think hard about it.
The console registration rules are already very complicated.
And we should think twice before adding any other twist
in the logic.

Best Regards,
Petr
