Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199479A5F0E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 10:48:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACAA10E448;
	Mon, 21 Oct 2024 08:48:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B4B10E448
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:48:00 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-6e3a97a6010so46543217b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 01:48:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729500478; x=1730105278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DM6Iuw5UL8tiK41PCOOby51LdLIXS4iYff8u62S6/mM=;
 b=JRZcCkpVtsADPwfMWgOIyq61EhkrF+br/8GFQ2/1pQ/fLPOZ7SoEWO64w6enZr4Zkh
 JLqpPW0bAGboM4ly7XmotQLRT39g4NxAghhU9YV3o9VtVDL4jbCF0MR38xjI3QLaGlZE
 0/ZKF2W3wUz0S80N6/FNXvAe519H6S18WmB9eAa4P2rNkqULD84oxZpBiStNV89VGlx7
 5R01VZhLVm4Opivk/S8JwJTJf7TIQKBXtZP3GT52vA9YwVuYC9FbyVK7AZPVws9Gb8rH
 LZ3fcJhOX6+u4dl1tzFeg5wBjXOLObww9MFc8gwEwitDwycvNDr0epTGfPXV2R8P6itK
 Bfbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsqMT87elU928nw70xgexUeKCv4qfuJDEPHnc7do2AUsJgpKUkx2NIse+0X1YVB7/vHNxtJvpdIe4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzhZw1oGWVzRs+D15hyWmUaiFKdRsCZJ6lfSKQqOODlmZU2zeY
 eadOlwcn0/4XzX3VUiofafeAFaO5CZGxBLnu/cd0fkIpgNbSapThmflLvfZ1
X-Google-Smtp-Source: AGHT+IFapIj0sJUN0VNWAwdXys4A2VGaj4rj2HtUZGCkRSUKYzUT4j7rdl2GaYuNZY4lEXKO87kRWQ==
X-Received: by 2002:a05:690c:89:b0:6db:4536:8591 with SMTP id
 00721157ae682-6e5bfd4cc32mr89138997b3.28.1729500477563; 
 Mon, 21 Oct 2024 01:47:57 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-6e5f5ccb70asm5941297b3.79.2024.10.21.01.47.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 01:47:56 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6e34339d41bso36312567b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 01:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW6GISlFsbiBtN6nFWD5a0OINyfxFrSQzP33hlOsJ2x5x8qc7QZCoNk/JSd1HIYIWFn659lfrTzbzo=@lists.freedesktop.org
X-Received: by 2002:a05:690c:f89:b0:6db:d586:72d4 with SMTP id
 00721157ae682-6e5bfc5cf10mr82802697b3.18.1729500475632; Mon, 21 Oct 2024
 01:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <8c2df6a903f87d4932586b25f1d3bd548fe8e6d1.1729180470.git.geert+renesas@glider.be>
 <20241018131035.GA20602@pendragon.ideasonboard.com>
 <CAMuHMdVrahM9GYDX4FBZ31YBUZWm67-KoG-EBTDL8LU9bv2qsg@mail.gmail.com>
 <2024101855-judo-tattered-bc3c@gregkh>
 <20241018142522.GA28934@pendragon.ideasonboard.com>
 <2024101837-crushed-emphasis-b496@gregkh>
 <20241020143629.GC28934@pendragon.ideasonboard.com>
 <2024102119-oversweet-labored-aa07@gregkh>
 <CAMuHMdUWAQKRy6F-zyCK6efhSYDRo2Go-f-=t2kRnPQoNdw0og@mail.gmail.com>
 <2024102137-repost-visiting-323d@gregkh>
 <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
In-Reply-To: <CAMuHMdWOLD13hzERAgaH5zg5FsVZZZnQoFdkRzv+E6r6BTAixA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Oct 2024 10:47:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
Message-ID: <CAMuHMdXXokfQziiE9_5oYpcUsWVn6i-0v__D0U1cbRkV4K9jqA@mail.gmail.com>
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

On Mon, Oct 21, 2024 at 10:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, Oct 21, 2024 at 9:27=E2=80=AFAM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> > On Mon, Oct 21, 2024 at 08:58:30AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Oct 21, 2024 at 8:39=E2=80=AFAM Greg KH <gregkh@linuxfoundati=
on.org> wrote:
> > > > On Sun, Oct 20, 2024 at 05:36:29PM +0300, Laurent Pinchart wrote:
> > > > > On Fri, Oct 18, 2024 at 04:31:21PM +0200, Greg KH wrote:
> > > > > > On Fri, Oct 18, 2024 at 05:25:22PM +0300, Laurent Pinchart wrot=
e:
> > > > > > > On Fri, Oct 18, 2024 at 04:09:26PM +0200, Greg KH wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 03:36:48PM +0200, Geert Uytterhoeve=
n wrote:
> > > > > > > > > On Fri, Oct 18, 2024 at 3:10=E2=80=AFPM Laurent Pinchart =
wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 09:45:52AM +0200, Geert Uytterh=
oeven wrote:
> > > > > > > > > > > Each bridge instance creates up to four auxiliary dev=
ices with different
> > > > > > > > > > > names.  However, their IDs are always zero, causing d=
uplicate filename
> > > > > > > > > > > errors when a system has multiple bridges:
> > > > > > > > > > >
> > > > > > > > > > >     sysfs: cannot create duplicate filename '/bus/aux=
iliary/devices/ti_sn65dsi86.gpio.0'
> > > > > > > > > > >
> > > > > > > > > > > Fix this by using a unique instance ID per bridge ins=
tance.
> > > > > > > > > >
> > > > > > > > > > Isn't this something that should be handled by the AUX =
core ? The code
> > > > > > > > > > below would otherwise need to be duplicated by all driv=
ers, which seems
> > > > > > > > > > a burden we should avoid.
> > > > > > > > >
> > > > > > > > > According to the documentation, this is the responsibilit=
y of the caller
> > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/l=
inux/auxiliary_bus.h#L81
> > > > > > > > > I believe this is the same for platform devices.
> > > > > > > > > See also the example at
> > > > > > > > > https://elixir.bootlin.com/linux/v6.11.4/source/include/l=
inux/auxiliary_bus.h#L116
> > > > > > > > >
> > > > > > > > > Note: the platform bus supports PLATFORM_DEVID_AUTO, but =
the auxiliary
> > > > > > > > > bus does not.
> > > > > > > >
> > > > > > > > Yes, it does not as it's up to the caller to create a uniqu=
e name, like
> > > > > > > > your patch here does.  I'd argue that platform should also =
not do
> > > > > > > > automatic device ids, but that's a different argument :)
> > > > > > >
> > > > > > > __auxiliary_device_add() creates the device name with
> > > > > > >
> > > > > > >   dev_set_name(dev, "%s.%s.%d", modname, auxdev->name, auxdev=
->id);
> > > > > > >
> > > > > > > I'm not calling for a PLATFORM_DEVID_AUTO-like feature here, =
but
> > > > > > > shouldn't the first component of the device name use the pare=
nt's name
> > > > > > > instead of the module name ?
> > > > > >
> > > > > > Why would the parent's name not be the module name?  That name =
is
> > > > > > guaranteed unique in the system.  If you want "uniqueness" with=
in the
> > > > > > driver/module, use the name and id field please.
> > > > > >
> > > > > > That's worked well so far, but to be fair, aux devices are pret=
ty new.
> > > > > > What problem is this naming scheme causing?
> > > > >
> > > > > Auxiliary devices are created as children of a parent device. Whe=
n
> > > > > multiple instances of the same parent type exist, this will be re=
flected
> > > > > in the /sys/devices/ devices tree hierarchy without any issue. Th=
e
> > > > > problem comes from the fact the the auxiliary devices need a uniq=
ue name
> > > > > for /sys/bus/auxialiary/devices/, where we somehow have to differ=
enciate
> > > > > devices of identical types.
> > > > >
> > > > > Essentially, we're trying to summarize a whole hierarchy (path in
> > > > > /sys/devices/) into a single string. There are different ways to =
solve
> > > > > this. For platform devices, we use a device ID. For I2C devices, =
we use
> > > > > the parent's bus number. Other buses use different schemes.
> > > > >
> > > > > Geert's patch implements a mechanism in the ti-sn65dsi86 driver t=
o
> > > > > handle this, and assign an id managed by the parent. In a sense w=
e could
> > > > > consider this to be similar to what is done for I2C, where the bu=
s
> > > > > number is also a property of the parent. However, the big differe=
nce is
> > > > > that the I2C bus number is managed by the I2C subsystem, while he=
re the
> > > > > id is managed by the ti-sn65dsi86 driver, not by the auxiliary de=
vice
> > > > > core. This would require duplicating the same mechanism in every =
single
> > > > > driver creating auxiliary devices. This strikes me as a fairly ba=
d idea.
> > > > > The problem should be solved by the core, not by individual drive=
rs.
> > > >
> > > > The "id" is just a unique number, it is "managed" by the thing that=
 is
> > > > creating the devices themselves, not the aux core code.  I don't se=
e why
> > > > the i2c bus number has to match the same number that the ti driver
> > > > creates, it could be anything, as long as it doesn't match anything=
 else
> > > > currently created by that driver.
> > >
> > > Laurent does not say it has to match the i2c bus number.
> > > He does think the auxilliary bus should provide a mechanism to
> > > allocate these IDs (e.g. usin g AUX_DEVID_AUTO?).
> >
> > As this is the first subsystem to ask for such a thing, I didn't think
> > it was needed, but the aux subsystem is new :)
> >
> > > However, using i2c_client->adapter->nr instead of ida_alloc()
> > > in the TI driver does sound like a good idea to me...
> >
> > Great!

> With the I2C adapter numbers, that becomes:
>
>     /sys/bus/auxiliary/devices
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.1
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.gpio.4
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.pwm.4
>     =E2=94=9C=E2=94=80=E2=94=80 ti_sn65dsi86.aux.4
>     =E2=94=94=E2=94=80=E2=94=80 ti_sn65dsi86.bridge.4
>
> > adapter->nr instead like other aux subsystems already do.

Unfortunately the devil is in the details, as usual: there can be
multiple instances of the sn65dsi86 bridge on a single I2C bus,
so adapter->nr is not guaranteed to generate a unique name.

Changing the auxiliary bus to use the parent's name instead of the
module name, as suggested by Laurent, would fix that.

modname

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
