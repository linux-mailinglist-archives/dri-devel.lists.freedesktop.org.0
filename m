Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500839A5BD9
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 08:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40C10E419;
	Mon, 21 Oct 2024 06:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8EB10E419
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 06:58:48 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e2908e8d45eso3519027276.2
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 23:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729493926; x=1730098726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mw4gCFszl8BI2I4oOchG1aUb7I960rlClLXb8gkgCdU=;
 b=I1q41XCeXpMBq3kZeeA9U56tnvuvHomlZ0lj+Tbw1AeqkukDIjAS2iaDdW3bDEZdpo
 zFrVL3G80oPCJuEEr+uh+ztsWVo5AxMUVZXgMPFjd5LJwQ8esgPHrjTFDImJQPC52OJE
 Zc/sRuhX94lJaCd4inLC0ugu56jpRi7jzUMTZPgTzh4eQZPxPNwSjgUU2Ht0q0F1PiWe
 jeujwlWHxuuFKsN5O+G/DpvyeB3RvKRpZC+3z7BrCs0ut0K2KvzzlsoceulUISd2LBV2
 +8CQp6CdS7tjWSNyWGvOU1BPB16SNRWXOLoY3f1BtatwfvxLDo4MsVlnn4lD9BIuwxvQ
 AvSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6VpVYUKj5uvy2toV9YoUGGFX15lNZFMJu1pkJjhRI4hp/TmbE5Afd01wwwSiDpmbUR9AWRPKhuX4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3f5l/4ynwEl+v3meZsB4+eXYkHh8mAo7H5wQo1UQnBTAjuzLd
 GQQvPo6t8BpNO110FMN0VoXxP4AnR/obGy5a2l0d273WLqwZ+BGebwqrrcuV
X-Google-Smtp-Source: AGHT+IHUVcYzx50f4UvJrChEpnILNqvMyj6d5rEo7IXQHs1JB3oJpSnu9sAv8CAfV1aMtWPvdcHsaw==
X-Received: by 2002:a05:6902:2412:b0:e28:f6ba:b68d with SMTP id
 3f1490d57ef6-e2bb11de47bmr9028829276.5.1729493925738; 
 Sun, 20 Oct 2024 23:58:45 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e2bdc96ae0bsm606326276.8.2024.10.20.23.58.43
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Oct 2024 23:58:44 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6e34339d41bso35503087b3.0
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Oct 2024 23:58:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVo6JjWi2jfedFHGno+8pp49VO+nMyeYoCALU+AaH+yGaL3WV9Qyz2nFYMKNDjPHtp5+sjiUsBpHrA=@lists.freedesktop.org
X-Received: by 2002:a05:690c:4b01:b0:6e2:1062:9b90 with SMTP id
 00721157ae682-6e5bfd89b4dmr103732537b3.44.1729493923434; Sun, 20 Oct 2024
 23:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
In-Reply-To: <2024102119-oversweet-labored-aa07@gregkh>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 08:58:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
Message-ID: <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix multiple instances
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Greg,

On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrote:
> > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeven wrot=
e:
> > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart wrote:
> > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterhoeven =
wrote:
> > > > > > > > Each bridge instance creates up to four auxiliary devices w=
ith different
> > > > > > > > names.  However, their IDs are always zero, causing duplica=
te filename
> > > > > > > > errors when a system has multiple bridges:
> > > > > > > >
> > > > > > > >     sysfs: cannot create duplicate filename '/bus/auxiliary=
/devices/ti_sn65dsi86.gpio.0'
> > > > > > > >
> > > > > > > > Fix this by using a unique instance ID per bridge instance.
> > > > > > >
> > > > > > > Isn't this something that should be handled by the AUX core ?=
 The code
> > > > > > > below would otherwise need to be duplicated by all drivers, w=
hich seems
> > > > > > > a burden we should avoid.
> > > > > >
> > > > > > According to the documentation, this is the responsibility of t=
he caller
> > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/a=
uxiliary_bus.h#L81
> > > > > > I believe this is the same for platform devices.
> > > > > > See also the example at
> > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/linux/a=
uxiliary_bus.h#L116
> > > > > >
> > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but the au=
xiliary
> > > > > > bus does not.
> > > > >
> > > > > Yes, it does not as it's up to the caller to create a unique name=
, like
> > > > > your patch here does.  I'd argue that platform should also not do
> > > > > automatic device ids, but that's a different argument :)
> > > >
> > > > __auxiliary_device_add() creates the device name with
> > > >
> > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev->id);
> > > >
> > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, but
> > > > shouldn't the first component of the device name use the parent's n=
ame
> > > > instead of the module name ?
> > >
> > > Why would the parent's name not be the module name?  That name is
> > > guaranteed unique in the system.  If you want "uniqueness" within the
> > > driver/module, use the name and id field please.
> > >
> > > That's worked well so far, but to be fair, aux devices are pretty new=
.
> > > What problem is this naming scheme causing?
> >
> > Auxiliary devices are created as children of a parent device. When
> > multiple instances of the same parent type exist, this will be reflecte=
d
> > in the /sys/devices/ devices tree hierarchy without any issue. The
> > problem comes from the fact the the auxiliary devices need a unique nam=
e
> > for /sys/bus/auxialiary/devices/, where we somehow have to differenciat=
e
> > devices of identical types.
> >
> > Essentially, we're trying to summarize a whole hierarchy (path in
> > /sys/devices/) into a single string. There are different ways to solve
> > this. For platform devices, we use a device ID. For I2C devices, we use
> > the parent's bus number. Other buses use different schemes.
> >
> > Geert's patch implements a mechanism in the ti-sn65dsi86 driver to
> > handle this, and assign an id managed by the parent. In a sense we coul=
d
> > consider this to be similar to what is done for I2C, where the bus
> > number is also a property of the parent. However, the big difference is
> > that the I2C bus number is managed by the I2C subsystem, while here the
> > id is managed by the ti-sn65dsi86 driver, not by the auxiliary device
> > core. This would require duplicating the same mechanism in every single
> > driver creating auxiliary devices. This strikes me as a fairly bad idea=
.
> > The problem should be solved by the core, not by individual drivers.
>
> The "id" is just a unique number, it is "managed" by the thing that is
> creating the devices themselves, not the aux core code.  I don't see why
> the i2c bus number has to match the same number that the ti driver
> creates, it could be anything, as long as it doesn't match anything else
> currently created by that driver.

Laurent does not say it has to match the i2c bus number.
He does think the auxilliary bus should provide a mechanism to
allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).

However, using i2c_client->adapter->nr instead of ida_alloc()
in the TI driver does sound like a good idea to me...

> If we had the aux core code create the id, it would just use a unique
> counter, and that would not reflect any mapping to anything, so I don't
> see how that is any different here.

And then we would get something like:

/sys/bus/auxiliary/devices
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.0
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.2
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.3
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.5
=E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.6
=E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.7

Which is similar to the first approach I tried (calling ida_alloc() in
ti_sn65dsi86_add_aux_device() instead of ti_sn65dsi86_probe()).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
