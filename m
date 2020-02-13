Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBC015D367
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4405D6E51B;
	Fri, 14 Feb 2020 08:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74ECA6E3EB
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 20:08:27 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id n18so8067154ljo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 12:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BGyZT7dbwMQ7jRrV7OPOX8exFdqWmXNOVwOPlJZyRbk=;
 b=Q7Nd/9vPTfJrYfCbCnUoPbPOpTzh3mz2xPJW1hQXDfbva2G/ahXsRqzD1wUuPZ0P3d
 +VywfqW7xB0c1jzTKa7NJz6yLxoDyvNlvg34cVn9HgdBE0NIoNuEjhR1q5M5tg+WKX1s
 VR/cE6zJ0oW3d9yoa95wrCDl733BktZ0XiN5OqGki05JxaBJP9SLsgtvO6NIKNtbC2QN
 laeEw6HaaasnQGqEFM8QClPBWowIpVDKLEz5clAkkVrjEM5nZOWjCb0qr8FpJMzm7oWl
 MBgsia3Si3eM8ZVXJqbn+jwHsq5CG7Hr1ZPF2HhnxEJvtGIJfwYCRkECqsnu3hYJRJai
 b5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BGyZT7dbwMQ7jRrV7OPOX8exFdqWmXNOVwOPlJZyRbk=;
 b=ptZShrm5empg5MWUiIXTfeKjU+g+8wK4Zwog06g0pgQ1cY8w6EHieGXLEiam9VYi6Y
 nkBhtC6rProZdWlQ/LOorDCNLWVL2gZGmdYVPKwXnywgVmbu0PIgDOBLpON6FgFkKAfx
 ARFDfSw7R8RwtmoUaSJgYRut6payK2fgtK7i1EW8adw62UFVW1rKOUQlIUIHTOTgrmFD
 uwlFYZEXm34tCLXQEY/9bjPw9j17nDRBuTcM71bCk+DJwCGsmqsw0ED79tIiKIFRrKZi
 ZnKAC/cMS9UqXKHxha3/agGjGI6zwnzzBKnoSJwzwSyFl/Jx1M5rh3O0zOBFYsvJwfhz
 GcIw==
X-Gm-Message-State: APjAAAUozXBdZEzj9llYwouqF+He7EWSZh8sWpGWelCw7mAsbDuz+m04
 IaLtLA8U9QC3H/iEOK1Y0UOIPDHYZ4+dYQ==
X-Google-Smtp-Source: APXvYqztD+iqwv6Xp+koxjrHW1aZ2Qay9QARoJlk+46QWn4zlAo+rJAYb4gEbYwOOYOAAItaIZGLEw==
X-Received: by 2002:a2e:98c6:: with SMTP id s6mr12200884ljj.14.1581624505681; 
 Thu, 13 Feb 2020 12:08:25 -0800 (PST)
Received: from kedthinkpad ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id d20sm2132164ljg.95.2020.02.13.12.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 12:08:24 -0800 (PST)
Date: Thu, 13 Feb 2020 22:08:23 +0200
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 2/2] ARM: sun7i: dts: Add LVDS panel support on A20
Message-ID: <20200213200823.GA28336@kedthinkpad>
References: <20200210195633.GA21832@kedthinkpad>
 <20200212222355.17141-2-andrey.lebedev@gmail.com>
 <20200213094304.hf3glhgmquypxpyf@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213094304.hf3glhgmquypxpyf@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Fri, 14 Feb 2020 08:07:58 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrey Lebedev <andrey@lebedev.lt>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 10:43:04AM +0100, Maxime Ripard wrote:
> On Thu, Feb 13, 2020 at 12:23:57AM +0200, andrey.lebedev@gmail.com wrote:
> > From: Andrey Lebedev <andrey@lebedev.lt>
> >
> > Define pins for LVDS channels 0 and 1, configure reset line for tcon0 and
> > provide sample LVDS panel, connected to tcon0.
> >
> > Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
> 
> And this prefix should be ARM: dts: sun7i ;)

Ah, thanks, I think I've got the pattern now!

> > +			/omit-if-no-ref/
> > +			lcd_lvds0_pins: lcd_lvds0_pins {
> 
> underscores in the node names will create a dtc warning at
> compilation, you should use lcd-lvds0-pins instead.

You're right, I wasn't following the naming convention here. dtc doesn't
produce any warning on this though. Fixed that anyway.

> This will create a spurious warning message for TCON1, since we
> adjusted the driver to tell it supports LVDS, but there's no LVDS
> reset line, so we need to make it finer grained.

Yes, I can attribute two of the messages in my dmesg log [1] to this
("Missing LVDS properties" and "LVDS output disabled". "sun4i-tcon
1c0d000.lcd-controller" is indeed tcon1). And yes, I can see how they
can be confusing to someone.

I'd need some pointers on how to deal with that though (if we want to do
it in this scope).

[1] excerpt from kernel boot log:

[    4.890975] sun4i-drm display-engine: bound 1e00000.display-frontend (ops sun4i_frontend_driver_exit [sun4i_frontend])
[    4.902032] sun4i-drm display-engine: bound 1e20000.display-frontend (ops sun4i_frontend_driver_exit [sun4i_frontend])
[    4.913467] sun4i-drm display-engine: bound 1e60000.display-backend (ops sun4i_backend_ops [sun4i_backend])
[    4.923806] sun4i-drm display-engine: bound 1e40000.display-backend (ops sun4i_backend_ops [sun4i_backend])
[    4.934451] sun4i-drm display-engine: bound 1c0c000.lcd-controller (ops sun4i_tcon_platform_driver_exit [sun4i_tcon])
[    4.945254] sun4i-tcon 1c0d000.lcd-controller: Missing LVDS properties, Please upgrade your DT
[    4.953935] sun4i-tcon 1c0d000.lcd-controller: LVDS output disabled
[    4.960857] sun4i-drm display-engine: No panel or bridge found... RGB output disabled
[    4.968845] sun4i-drm display-engine: bound 1c0d000.lcd-controller (ops sun4i_tcon_platform_driver_exit [sun4i_tcon])
[    5.080874] sun4i-drm display-engine: bound 1c16000.hdmi (ops sun4i_hdmi_driver_exit [sun4i_drm_hdmi])
[    5.110087] [drm] Initialized sun4i-drm 1.0.0 20150629 for display-engine on minor 0
[    5.763064] sun4i-drm display-engine: fb0: sun4i-drmdrmfb frame buffer device


-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
