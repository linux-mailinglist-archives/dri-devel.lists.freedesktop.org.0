Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1CF160EF3
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 10:40:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EE16E8F6;
	Mon, 17 Feb 2020 09:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BECAF6E8F6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 09:40:16 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m16so18761056wrx.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2020 01:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=EdGaBU8GlJ6+ebYPZm4D4Vc7OdrOdEupdVUC3PA0Kqo=;
 b=BoQAZyr8xOTBI0RUTUiHGsWUtX+8Sm0amUe8cGzYu5tJfdtFVHs9zztlOFMNafaGgp
 KKt5JQvfKHybXwQoJOHDprRLpdz9teh+d2MuWWgP+QE08V/TXBFbhm02ChVCFZg26UEQ
 4jeAJhtl3lhaYxuvxqAZYEL2mvlcTWuaon8MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EdGaBU8GlJ6+ebYPZm4D4Vc7OdrOdEupdVUC3PA0Kqo=;
 b=sWGRRos7XGBjiaLjV6b7OxdeAc0OdWb51f8E5o1ARkwkIOQms2+/H8h65YkcVSYKgR
 T4gZQmlaYi36ihYrVg6+VcYiKeYPUI91n5I3xCd+zpjdE/zxLkLxFFeHqrJGfmTZJwVF
 dN4e+eUkbOdGm5vtnAR3B6CY+AOyAXO/dM7Zz9e5xg/1kBBa020Ai792aed9Hr5asrq7
 8WgpIAYgbCK1x9j+8EI0/HZsUgUUVhTPsW7dJZwzxh1hh8VL6VGJ3l3DE3Pj9HmYmL9t
 F4r0ln3jUUKA8Bwh5+9tdFWypzehd3LBLIACOh6IlrMcL/qbsqKWHm/b9PupdUeSlr9F
 tpzA==
X-Gm-Message-State: APjAAAV9Qc8wEniowpejqy1/i+NTecG6y/lQhqv5M8R+R8wctANZK9Jy
 gcdaCPTQ/SN8f+NtbXiwoX3Pjg==
X-Google-Smtp-Source: APXvYqyuAnblXVnD2DvknIFKJVMC6EHEvV94UyIJPFqVnR9IZiqiH76ZLehdtxNtlRbUPoI6nckRAA==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr21765197wru.398.1581932415164; 
 Mon, 17 Feb 2020 01:40:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm19372384wmh.4.2020.02.17.01.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 01:40:14 -0800 (PST)
Date: Mon, 17 Feb 2020 10:40:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Subject: Re: [RFC 0/9] Regmap over USB for Multifunction USB Device (gpio,
 display, ...)
Message-ID: <20200217094012.GI2363188@phenom.ffwll.local>
References: <20200216172117.49832-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200216172117.49832-1-noralf@tronnes.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: balbi@kernel.org, broonie@kernel.org, lee.jones@linaro.org,
 linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 16, 2020 at 06:21:08PM +0100, Noralf Tr=F8nnes wrote:
> Hi,
> =

> A while back I had the idea to turn a Raspberry Pi Zero into a $5
> USB to HDMI/SDTV/DSI/DPI display adapter.
> =

> Thinking about how to represent the display to the driver I realised
> that hardware use registers as API. And Linux does have a generic
> register abstraction: regmap. Furthermore this means that if I can do a
> regmap over USB implementation, it will be easy to do other functions
> like gpio, adc and others. After a few iterations trying to understand
> the USB subsystem and satisfying driver requirements, I now have
> something that looks promising.
> =

> I'm sending out an early version hoping to get feedback especially on
> the core parts that handles regmap and interrupts.
> =

> Overview:
> =

>           USB Host          :         USB Device
>                             :
>             --------------  :  ------------------
> ----------  | mfd: mud   |  :  | f_mud          |  ----------
> | Driver |  --------------  :  |                |  | Driver |
> ----------  | regmap-usb |  :  | (mud_regmap)   |  ----------
>             --------------  :  ------------------
> =

> =

> I've attached 2 drivers:
> - gpio/pinctrl: is more or less finished
> - display: needs a lot more work
> =

> =

> USB3 device
> I've only tested this with usb2 devices (Pi, BBB) so I should get myself
> a usb3 gadget capable board. My searching didn't turn up much, so this
> seems to be quite rare. ROCK960 has USB 3.0 type C OTG but the price is
> $139 which is a bit expensive for this hobby project. Does anyone know
> of a cheap board?
> =

> Noralf.

Pretty cool idea, and the drm side looks really tiny (after all your
drm_client work that is). I think the important feedback here is for the
usb and regmap stuff, that's totally out of my area. I've commented on the
drm_client patch, but that's just minor stuff, imo looks good.

Cheers, Daniel

> =

> =

> Noralf Tr=F8nnes (9):
>   regmap: Add USB support
>   mfd: Add driver for Multifunction USB Device
>   usb: gadget: function: Add Multifunction USB Device support
>   pinctrl: Add Multifunction USB Device pinctrl driver
>   usb: gadget: function: mud: Add gpio support
>   regmap: Speed up _regmap_raw_write_impl() for large buffers
>   drm: Add Multifunction USB Device display driver
>   drm/client: Add drm_client_init_from_id() and drm_client_modeset_set()
>   usb: gadget: function: mud: Add display support
> =

>  drivers/base/regmap/Kconfig              |    8 +-
>  drivers/base/regmap/Makefile             |    1 +
>  drivers/base/regmap/regmap-usb.c         | 1026 ++++++++++++++++++
>  drivers/base/regmap/regmap.c             |   10 +-
>  drivers/gpu/drm/Kconfig                  |    2 +
>  drivers/gpu/drm/Makefile                 |    1 +
>  drivers/gpu/drm/drm_client.c             |   37 +
>  drivers/gpu/drm/drm_client_modeset.c     |   52 +
>  drivers/gpu/drm/mud/Kconfig              |   18 +
>  drivers/gpu/drm/mud/Makefile             |    4 +
>  drivers/gpu/drm/mud/mud_drm.c            | 1198 ++++++++++++++++++++++
>  drivers/gpu/drm/mud/mud_drm.h            |  137 +++
>  drivers/gpu/drm/mud/mud_drm_gadget.c     |  889 ++++++++++++++++
>  drivers/mfd/Kconfig                      |    8 +
>  drivers/mfd/Makefile                     |    1 +
>  drivers/mfd/mud.c                        |  580 +++++++++++
>  drivers/pinctrl/Kconfig                  |    9 +
>  drivers/pinctrl/Makefile                 |    1 +
>  drivers/pinctrl/pinctrl-mud.c            |  657 ++++++++++++
>  drivers/pinctrl/pinctrl-mud.h            |   89 ++
>  drivers/usb/gadget/Kconfig               |   36 +
>  drivers/usb/gadget/function/Makefile     |    6 +
>  drivers/usb/gadget/function/f_mud.c      |  913 +++++++++++++++++
>  drivers/usb/gadget/function/f_mud.h      |  210 ++++
>  drivers/usb/gadget/function/f_mud_drm.c  |  181 ++++
>  drivers/usb/gadget/function/f_mud_pins.c |  962 +++++++++++++++++
>  drivers/usb/gadget/function/mud_regmap.c |  936 +++++++++++++++++
>  include/drm/drm_client.h                 |    4 +
>  include/linux/mfd/mud.h                  |   16 +
>  include/linux/regmap.h                   |   23 +
>  include/linux/regmap_usb.h               |   97 ++
>  31 files changed, 8107 insertions(+), 5 deletions(-)
>  create mode 100644 drivers/base/regmap/regmap-usb.c
>  create mode 100644 drivers/gpu/drm/mud/Kconfig
>  create mode 100644 drivers/gpu/drm/mud/Makefile
>  create mode 100644 drivers/gpu/drm/mud/mud_drm.c
>  create mode 100644 drivers/gpu/drm/mud/mud_drm.h
>  create mode 100644 drivers/gpu/drm/mud/mud_drm_gadget.c
>  create mode 100644 drivers/mfd/mud.c
>  create mode 100644 drivers/pinctrl/pinctrl-mud.c
>  create mode 100644 drivers/pinctrl/pinctrl-mud.h
>  create mode 100644 drivers/usb/gadget/function/f_mud.c
>  create mode 100644 drivers/usb/gadget/function/f_mud.h
>  create mode 100644 drivers/usb/gadget/function/f_mud_drm.c
>  create mode 100644 drivers/usb/gadget/function/f_mud_pins.c
>  create mode 100644 drivers/usb/gadget/function/mud_regmap.c
>  create mode 100644 include/linux/mfd/mud.h
>  create mode 100644 include/linux/regmap_usb.h
> =

> -- =

> 2.23.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
