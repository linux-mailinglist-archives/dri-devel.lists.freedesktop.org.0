Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09A557016E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 13:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD61D8D2E2;
	Mon, 11 Jul 2022 11:59:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EEC8D2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 11:59:42 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id g9so181687qvq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/I/U0YnC1LrEaVGVv4SvhKsv3VnfbWrBQRKUKtDAa0I=;
 b=H2pfudO2VUNERvxffPAzDK8i8ubyTZCUm7k+Q2uf6oOhrNy2WACfPFZvnD27RjoD+C
 9NAU+s3O/FMraHnRzs975e1rhvF6NhE4phrbRoaFcWfKHkFuNsTgoaGzUUBIOxo088xW
 QDy/FSOWD7LOX9g4QPdsmdYitGB6xRPqX8sZLBxSdAkx1Bp+H02LB/wvH/KwT28f9Ayp
 w3qrMJYnNV+X+OoEH5MWHQ4LOgomVn/vQKUK/y3gKRs+/QX9Xn6ALOJ7Gm4cQSFj0XAY
 HVHnjncyUtoU3/t1YE7ZNM2FgznKBC+TuC7MY2o6jB6LE3CiMw/JPlpkRoMnjutT9z2X
 zJcw==
X-Gm-Message-State: AJIora+ZVm7hoCHIN85yuNFopmsydlQdk5TpCafYgXUCilrXAFwyVtcO
 2qAP+WYhP/57RIPO89lgSnXvO5cAtKHLLw==
X-Google-Smtp-Source: AGRyM1u4tHkHzdKOiP38g5gnzlGFzsKrHx/cdmEGnOfpIggjyyPHoUvvP+Q9Esw4Ub7UpZKCqmDeNQ==
X-Received: by 2002:a05:6214:1948:b0:472:fad3:9663 with SMTP id
 q8-20020a056214194800b00472fad39663mr13093525qvk.37.1657540780938; 
 Mon, 11 Jul 2022 04:59:40 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 y11-20020a05620a44cb00b006a37eb728cfsm6378622qkp.1.2022.07.11.04.59.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 04:59:40 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-31caffa4a45so46288977b3.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 04:59:40 -0700 (PDT)
X-Received: by 2002:a81:98d:0:b0:31c:921c:9783 with SMTP id
 135-20020a81098d000000b0031c921c9783mr18708130ywj.316.1657540779907; Mon, 11
 Jul 2022 04:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1657301107.git.geert@linux-m68k.org>
 <68923c8a129b6c2a70b570103679a1cf7876bbc2.1657301107.git.geert@linux-m68k.org>
 <ef2aada2-96e4-c2e4-645f-39bc9094e93a@suse.de>
 <20220711093513.wilv6e6aqcuyg52w@houat>
 <43d75dce-988a-0a95-cb0a-0d0a7c81ca63@suse.de>
 <20220711114206.sawqdl54ibuxsxp4@houat>
In-Reply-To: <20220711114206.sawqdl54ibuxsxp4@houat>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Jul 2022 13:59:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com>
Message-ID: <CAMuHMdXbFHWWQoryXihVsSrC5ZzHEV-YYR_eLvNmSAw8Y61TQg@mail.gmail.com>
Subject: Re: [PATCH 4/5] drm/modes: Add support for driver-specific named modes
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Jul 11, 2022 at 1:42 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Mon, Jul 11, 2022 at 01:11:14PM +0200, Thomas Zimmermann wrote:
> > Am 11.07.22 um 11:35 schrieb Maxime Ripard:
> > > On Mon, Jul 11, 2022 at 11:03:38AM +0200, Thomas Zimmermann wrote:
> > > > Am 08.07.22 um 20:21 schrieb Geert Uytterhoeven:
> > > > > The mode parsing code recognizes named modes only if they are explicitly
> > > > > listed in the internal whitelist, which is currently limited to "NTSC"
> > > > > and "PAL".
> > > > >
> > > > > Provide a mechanism for drivers to override this list to support custom
> > > > > mode names.
> > > > >
> > > > > Ideally, this list should just come from the driver's actual list of
> > > > > modes, but connector->probed_modes is not yet populated at the time of
> > > > > parsing.
> > > >
> > > > I've looked for code that uses these names, couldn't find any. How is this
> > > > being used in practice? For example, if I say "PAL" on the command line, is
> > > > there DRM code that fills in the PAL mode parameters?
> > >
> > > We have some code to deal with this in sun4i:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/sun4i/sun4i_tv.c#L292
> > >
> > > It's a bit off topic, but for TV standards, I'm still not sure what the
> > > best course of action is. There's several interactions that make this a
> > > bit troublesome:
> > >
> > >    * Some TV standards differ by their mode (ie, PAL vs NSTC), but some
> > >      other differ by parameters that are not part of drm_display_mode
> > >      (NTSC vs NSTC-J where the only difference is the black and blanking
> > >      signal levels for example).
> > >
> > >    * The mode names allow to provide a fairly convenient way to add that
> > >      extra information, but the userspace is free to create its own mode
> > >      and might omit the mode name entirely.
> > >
> > > So in the code above, if the name has been preserved we match by name,
> > > but we fall back to matching by mode if it hasn't been, which in this
> > > case means that we have no way to differentiate between NTSC, NTSC-J,
> > > PAL-M in this case.
> > >
> > > We have some patches downstream for the RaspberryPi that has the TV
> > > standard as a property. There's a few extra logic required for the
> > > userspace (like setting the PAL property, with the NTSC mode) so I'm not
> > > sure it's preferable.
> > >
> > > Or we could do something like a property to try that standard, and
> > > another that reports the one we actually chose.
> > >
> > > > And another question I have is whether this whitelist belongs into the
> > > > driver at all. Standard modes exist independent from drivers or hardware.
> > > > Shouldn't there simply be a global list of all possible mode names? Drivers
> > > > would filter out the unsupported modes anyway.
> > >
> > > We should totally do something like that, yeah
> >
> > That sun code already looks like sometihng the DRM core/helpers should be
> > doing. And if we want to support named modes well, there's a long list of
> > modes in Wikipedia.
> >
> > https://en.wikipedia.org/wiki/Video_Graphics_Array#/media/File:Vector_Video_Standards2.svg
>
> Yeah, and NTSC is missing :)

And that diagram is about the "digital" variant of PAL.
If you go the analog route, the only fixed parts are vfreq/hfreq,
number of lines, and synchronization. Other parameters like overscan
can vary.  The actual dot clock can vary wildly: while there is an
upper limit due to bandwidth limitations, you can come up with an
almost infinite number of video modes that can be called PAL, which
is one of the reasons why I don't want hardware-specific variants to
end up in a global video mode database.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
