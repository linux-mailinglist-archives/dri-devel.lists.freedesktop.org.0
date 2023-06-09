Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5482772947A
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 11:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C31210E67C;
	Fri,  9 Jun 2023 09:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CB310E671
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 09:14:55 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-75d528d0811so151953385a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 02:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686302094; x=1688894094;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gENaG5N8g73lKb5I06MaDggWSlew/LshaOaIaY4yMts=;
 b=YQTYgTFkgFnWeUXVHmUQtPZ16IGv2JpdCmq/sWpvLgNkeoNJF/M1MwicRKGWOV68js
 YWlUGrdmuPmoVyCdwoNaQY5/HY/SNvUk6eOEcZtO4fnaZ6Sm9FB5t9UeMNexCeSMOG1k
 npPv4q7mG1bgp+CTnwP4up4+rkrLjRyjgLPuiUV+Ap5nzuAFMG6+E/s5hmmWSC7MKlGi
 2ex+Bvny45FYv/Aw0Z3+vWwF49TSU5OyBfDIZxRQpVzVFkjG0lbaO/oGrQeN2l5Fwnz8
 2H4lVqiaunEaUx8JVpzfbqIdG/17CDliFwv6EojHHdhVefwHeSzwOAAxotz1EEg2S5ML
 BrIg==
X-Gm-Message-State: AC+VfDwjFu1/SxDRReqykVpvL+Gz6oCLDqxSpUazLne5sYDbiJh8jWy7
 y/rjL2tg75Xgsr1zyOginvCbTCE8cZ3pWA==
X-Google-Smtp-Source: ACHHUZ6E8QWXYz4nejEr3ZsVFUDkog3mEIQMKCWVWJRu0NwroC6AQxh7oMzRe5blcJefwLhcu5IGeg==
X-Received: by 2002:a05:620a:6606:b0:75b:23a1:3613 with SMTP id
 qf6-20020a05620a660600b0075b23a13613mr607925qkn.36.1686302093809; 
 Fri, 09 Jun 2023 02:14:53 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
 [209.85.222.174]) by smtp.gmail.com with ESMTPSA id
 x14-20020ae9f80e000000b0074d60b697a6sm924117qkh.12.2023.06.09.02.14.52
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 02:14:52 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-75d3f2c9d13so150593085a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 02:14:52 -0700 (PDT)
X-Received: by 2002:a05:620a:c0b:b0:75b:23a1:3609 with SMTP id
 l11-20020a05620a0c0b00b0075b23a13609mr558649qki.26.1686302091956; Fri, 09 Jun
 2023 02:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-31-tzimmermann@suse.de>
 <CAMuHMdVP2hrgXaZvASnHJ4M+VXaTCtfbeVXrq2dsEJqcs3G6ZA@mail.gmail.com>
 <e5d88ca8-66fe-b5ee-cb6b-2dc8f3a3fb26@suse.de>
 <CAMuHMdWBUKTgfCD9VLDFh_Tm1J-NJQHpxODs-TuYM7V-dtmGjA@mail.gmail.com>
 <873532eurg.fsf@minerva.mail-host-address-is-not-set>
 <77252bc9-e08e-fcee-d140-2b78ab768b42@suse.de>
 <CAMuHMdWUkZDcYfndf1A+cgcN5Fz1hmst4LrpA7iYCFqWSRTNDA@mail.gmail.com>
 <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
In-Reply-To: <4df23439-462f-47da-890d-2dd2092eea35@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jun 2023 11:14:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
Message-ID: <CAMuHMdWrTairp5h-fmkG9+xwzna+T4QmPuMeshd0UB8ZhQF8Sg@mail.gmail.com>
Subject: Re: [PATCH 30/30] fbdev: Make support for userspace interfaces
 configurable
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: daniel.thompson@linaro.org, lee@kernel.org, linux-sh@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Fri, Jun 9, 2023 at 10:00=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Am 09.06.23 um 09:29 schrieb Geert Uytterhoeven:
> > On Fri, Jun 9, 2023 at 9:09=E2=80=AFAM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Am 08.06.23 um 01:07 schrieb Javier Martinez Canillas:
> >>> Geert Uytterhoeven <geert@linux-m68k.org> writes:
> >>>> On Wed, Jun 7, 2023 at 5:15=E2=80=AFPM Thomas Zimmermann <tzimmerman=
n@suse.de> wrote:
> >>>>> Am 07.06.23 um 10:48 schrieb Geert Uytterhoeven:
> >>>>>> On Mon, Jun 5, 2023 at 4:48=E2=80=AFPM Thomas Zimmermann <tzimmerm=
ann@suse.de> wrote:
> >>>>>>> --- a/drivers/video/fbdev/Kconfig
> >>>>>>> +++ b/drivers/video/fbdev/Kconfig
> >>>>>>> @@ -57,6 +57,15 @@ config FIRMWARE_EDID
> >>>>>>>              combination with certain motherboards and monitors a=
re known to
> >>>>>>>              suffer from this problem.
> >>>>>>>
> >>>>>>> +config FB_DEVICE
> >>>>>>> +        bool "Provide legacy /dev/fb* device"
> >>>>>>
> >>>>>> Perhaps "default y if !DRM", although that does not help for a
> >>>>>> mixed drm/fbdev kernel build?
> >>>>>
> >>>>> We could simply set it to "default y".  But OTOH is it worth making=
 it a
> >>>>> default? Distributions will set it to the value they need/want. The=
 very
> >>>>> few people that build their own kernels to get certain fbdev driver=
s
> >>>>> will certainly be able to enable the option by hand as well.
> >>>>
> >>>> Defaulting to "n" (the default) means causing regressions when these
> >>>> few people use an existing defconfig.
> >>>>
> >>>
> >>> Having "dfault y if !DRM" makes sense to me. I guess is a corner case=
 but
> >>> at least it won't silently be disabled for users that only want fbdev=
 as
> >>> Geert mentioned.
> >>
> >> IMHO the rational behind such conditionals are mostly what "we make up
> >> here in the discussion", but not something based on real-world feedbac=
k.
> >> So I'd strongly prefer a clear n or y setting here.
> >>
> >>>
> >>> I wouldn't call it a regression though, because AFAIK the Kconfig opt=
ions
> >>> are not a stable API ?
> >>
> >> IIRC in the past there have been concerns about changing Kconfig
> >> defaults. If we go with "default n", we'd apparently do something simi=
lar.
> >>
> >>>
> >>>>>> Or reserve "FB" for real fbdev drivers, and introduce a new FB_COR=
E,
> >>>>>> to be selected by both FB and DRM_FBDEV_EMULATION?
> >>>>>> Then FB_DEVICE can depend on FB_CORE, and default to y if FB.
> >>>
> >>> Funny that you mention because it's exactly what I attempted in the p=
ast:
> >>>
> >>> https://lore.kernel.org/all/20210827100531.1578604-1-javierm@redhat.c=
om/T/#u
> >>>
> >>>>>
> >>>>> That wouldn't work. In Tumbleweed, we still have efifb and vesafb
> >>>>> enabled under certain conditions; merely for the kernel console. We=
'd
> >>>>> have to enable CONFIG_FB, which would bring back the device.
> >>>>
> >>>> "Default y" does not mean that you cannot disable FB_DEVICE, so
> >>>> you are not forced to bring back the device?
> >>>
> >>> I think we can have both to make the kernel more configurable:
> >>>
> >>> 1) Allow to only disable fbdev user-space APIs (/dev/fb?, /proc/fb, e=
tc),
> >>>      which is what the series is doing with the new FB_DEVICE config =
symbol.
> >>>
> >>> 2) Allow to disable all "native" fbdev drivers and only keep the DRM =
fbdev
> >>>      emulation layer. That's what my series attempted to do with the =
FB_CORE
> >>>      Kconfig symbol.
> >>>
> >>> I believe that there are use cases for both, for example as Thomas' s=
aid
> >>> many distros are disabling all the fbdev drivers and their user-space=
 only
> >>> requires DRM/KMS, so makes sense to not expose any fbdev uAPI at all.
> >>>
> >>> But may be that other users want the opposite, they have an old user-=
space
> >>> that requires fbdev, but is running on newer hardware that only have =
a DRM
> >>> driver. So they will want DRM fbdev emulation but none fbdev driver a=
t all.
> >>>
> >>> That's why I think that FB_DEVICE and FB_CORE are complementary and w=
e can
> >>> support any combination of the two, if you agree there are uses for e=
ither.
> >>
> >> I still don't understand the value of such an extra compile-time optio=
n?
> >>    Either you have fbdev userspace, then you want the device; or you
> >> don't then it's better to disable it entirely. I don't see much of a
> >> difference between DRM and fbdev drivers here.
> >
> > If you have DRM and are running a Linux desktop, you are probably
> > using DRM userspace.
> > If you have fbdev, and are using graphics, you have no choice but
> > using an fbdev userspace.
> >
> > So with FB_CORE, you can have default y if you have a real fbdev driver=
,
> > and default n if you have only DRM drivers.
> >
> >> I'd also question the argument that there's even fbdev userspace out
> >> there. It was never popular in it's heyday and definitely hasn't
> >> improved since then. Even the 3 people who still ask for fbdev support
> >
> > There's X.org, DirectFB, SDL, ...
>
> None of these examples has a dependency on fbdev. They can freely switch
> backends and have moved to DRM. Anything program utilizing these
> examples has no dependency on fbdev either.

Indeed, these examples do not depend on fbdev, it's the other way
around.  How does it help if your userspace now also supports DRM,
but you are using an fbdev graphics driver?  The DRM drivers do not
cover all graphics hardware yet.

> When I say "userspace" in this context, it's the one old program that
> supports nothing but fbdev. TBH I'm having problems to come up with
> examples.

Even if you cannot find such an old program, that doesn't matter much,
if you are using an fbdev graphics driver...

> > What do you think low-end embedded devices with an out-of-tree[*]
> > fbdev driver are using?
>
> And those do not count either. IIRC Android used to be built on top of
> fbdev devices. I'm not sure if they have moved to DRM by now. But
> embedded uses dedicated kernels and kernel configs.  It's easy for them
> to set FB_DEVICE=3Dy.  We're not going to take away the fbdev device enti=
rely.

The point is that we do not suddenly disable functionality that users
may depend on. While "make oldconfig" will show users the new
FB_DEVICE question, (and hopefully they'll notice), "make olddefconfig"
and "make <foo>_defconfig" won't, possibly causing regressions.
Without a suitable default, you should IMHO at least update all
defconfigs that enable any fbdev drivers.

I guess you do remember the fall-out from f611b1e7624ccdbd ("drm:
Avoid circular dependencies for CONFIG_FB"), after which lots of defconfigs
had to gain CONFIG_FB=3Dy?

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
