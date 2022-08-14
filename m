Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5559202A
	for <lists+dri-devel@lfdr.de>; Sun, 14 Aug 2022 16:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1B818A185;
	Sun, 14 Aug 2022 14:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F2A113E2F
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 14:27:40 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id g5so8584584ybg.11
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Aug 2022 07:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=BDAVIhnSkgENDUQ7IfYC3/2QkAEAsNSSEneZku1M24s=;
 b=p0gfoBw4ZgOT1ksw69dVgdZR0JT7daeCJ16dH8wcxMLnRGqjA3uhDchB1lA7TQfaYX
 BrQw9XUmookElN0tbP/iD4tNxHbscwSregEaqi3xk9KU+HnauYP7IDU38X3ZZJGiM3hc
 2cUIIAVEHjFscy2B3j5HOgzkZTsMCx9rw/txu7rZ55uaJm4jlwQc7RspbXg/YAloW0C/
 0svWUNrFbrZiZ7KzaV5kWEWoFtC/V4k27Ur2X/IFi253YZhnsFFyEBoQ+jjOu06CSB77
 L5qDaCYzVqdwx8ZM/qx64yS4r691EzmylMr4OT3lTcBSK98a1Kt2wCd0iOF2OHsyy1IV
 Yv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=BDAVIhnSkgENDUQ7IfYC3/2QkAEAsNSSEneZku1M24s=;
 b=rknhdlTCLGkGwfJqRytwPpKIbnXTqTycN7U325rJfYm9hEZGPiECzoNKGHIBgJYq6D
 FZwXmeeBMcuCDkZPqcVU2JeiPkGg8Vr0vzoROE2jrLfMMXBPj7Ea8K0geQjz6IIexa6g
 uVC3OIcxUHSxEEKC6HPTRg0z5uHDqfUuDo+LI+45//aTCexIlzWDg2TPWo8H1ik/xSk6
 KNdfo0sSOlPMPwEB5faeIXiAdQCfIS5XrNp4j45/WtSKOLqK2OIPAun78yQFkW/JUAps
 K6rgTmUcXtr2WvRcnVnvd7NUznF8J/wKxRK3DoKe47hrax5153bhymfTvvMwci+3og3o
 qeWQ==
X-Gm-Message-State: ACgBeo2JKMgJ0ps+NzTmDrFRYmKISKt95svhEKvQ9/BNWXcWy9gfGaj3
 DbqkAe2pF8pi4d3M1OY2U4zRkwD0yUkEE415lH2jOQ==
X-Google-Smtp-Source: AA6agR5oRn4CSLlwRnezXr30VfLoZdKWLSMB++KAjfSH1Z47K3NbFei2uLb/C/FS4mNgtaqJbSfnADfGVfrcqLFcy4o=
X-Received: by 2002:a25:cb05:0:b0:67c:29a8:cb9c with SMTP id
 b5-20020a25cb05000000b0067c29a8cb9cmr9640988ybg.135.1660487259148; Sun, 14
 Aug 2022 07:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <5b6d3e7f-c638-fdc7-5080-44d34abed610@ideasonboard.com>
 <a3ed3a2c-86ce-1c85-e8aa-c08b54ad1a43@gmail.com>
 <CAMSo37XdZSZUHLWJj373DdtOBA9=uD8SJ7ywWCYF2pU1i4cB_g@mail.gmail.com>
 <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com>
In-Reply-To: <ed4fe238-4fcd-1253-658f-18fe1e1f13b0@gmail.com>
From: Yongqin Liu <yongqin.liu@linaro.org>
Date: Sun, 14 Aug 2022 22:27:27 +0800
Message-ID: <CAMSo37V3U5nYng77jzSnKH73CTLhGYQJu11Q5wRt289se5nFJw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
To: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
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
Cc: "Bajjuri, Praneeth" <praneeth@ti.com>, tomba@kernel.org, airlied@linux.ie,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, merlijn@wizzup.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tony@atomide.com, linux-omap@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, IvayIo

Thanks very much for the reply!

On Sat, 13 Aug 2022 at 14:58, Ivaylo Dimitrov
<ivo.g.dimitrov.75@gmail.com> wrote:
>
> Hi Liu,
>
> On 12.08.22 =D0=B3. 7:35 =D1=87., Yongqin Liu wrote:
> > Hi, Ivaylo, Tomi
> >
> > We have one X15 Android AOSP master build, it could not have the home
> > screen displayed
> > on the hdmi monitor connected with this change, with the following
> > message printed on the serial console
> >      [  607.404205] omapdrm omapdrm.0: Failed to setup plane plane-0
> >      [  607.410522] omapdrm omapdrm.0: Failed to setup plane plane-1
> >      [  607.416381] omapdrm omapdrm.0: Failed to setup plane plane-2
> >      [  607.422088] omapdrm omapdrm.0: Failed to setup plane plane-3
> >
> >     # for details, please check the link here: http://ix.io/47m1
> >
> > It will work with home screen displayed on the hdmi monitor if this
> > change is reverted.
> >
> > Is this the broken problem you talked about here?
> >
> > And could you please give some suggestions on how to have the x15
> > Android build work with this change?
> >
>
> Make sure scanout (i.e. those to be displayed) buffers are actually
> allocated as such - OMAP_BO_SCANOUT flag must be set when calling
> omap_bo_new().

I am not familiar with this area, I am sorry if I asked quite silly questio=
ns:(
I googled omap_bo_new, and found it's a function of libdrm here[1], is
it what you meant here?

If it's the omap_bo_new that we should pass OMAP_BO_SCANOUT when it is call=
ed,
then is it the correct way to update omap_bo_new to add the OMAP_BO_SCANOUT=
 flag
before it calls omap_bo_new_impl?

And another question is that, since the userspace(libdrm) will be used
to work with different kernel versions,
like the old 4.14, 4.19, etc, do you think there will be problem to
pass  OMAP_BO_SCANOUT
from the userspace side with the old kernels(which does not have this chang=
e)?
does this change need to be backported to the old kernel versions?

And the last question is that, omap_bo_new might be called by some
property binaries what not everyone
could get the source to update, for such case what's your suggestions?

[1]: https://gitlab.freedesktop.org/mesa/drm/-/blob/main/omap/omap_drm.c#L2=
27

Thanks,
Yongqin Liu
> > On Thu, 17 Feb 2022 at 23:29, Ivaylo Dimitrov
> > <ivo.g.dimitrov.75@gmail.com> wrote:
> >>
> >>
> >>
> >> On 17.02.22 =D0=B3. 14:46 =D1=87., Tomi Valkeinen wrote:
> >>> Hi,
> >>>
> >>> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
> >>>> On devices with DMM, all allocations are done through either DMM or
> >>>> TILER.
> >>>> DMM/TILER being a limited resource means that such allocations will =
start
> >>>> to fail before actual free memory is exhausted. What is even worse i=
s
> >>>> that
> >>>> with time DMM/TILER space gets fragmented to the point that even if =
we
> >>>> have
> >>>> enough free DMM/TILER space and free memory, allocation fails becaus=
e
> >>>> there
> >>>> is no big enough free block in DMM/TILER space.
> >>>>
> >>>> Such failures can be easily observed with OMAP xorg DDX, for example=
 -
> >>>> starting few GUI applications (so buffers for their windows are
> >>>> allocated)
> >>>> and then rotating landscape<->portrait while closing and opening new
> >>>> windows soon results in allocation failures.
> >>>>
> >>>> Fix that by mapping buffers through DMM/TILER only when really neede=
d,
> >>>> like, for scanout buffers.
> >>>
> >>> Doesn't this break users that get a buffer from omapdrm and expect it=
 to
> >>> be contiguous?
> >>>
> >>
> >> If you mean dumb buffer, then no, this does not break users as dumb
> >> buffers are allocated as scanout:
> >>
> >> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/omapdrm=
/omap_gem.c#L603
> >>
> >> If you mean omap_bo allocated buffers, then if users want
> >> linear(scanout) buffer, then they request it explicitly by passing
> >> OMAP_BO_SCANOUT.
> >>
> >> Ivo
> >
> >
> >



--=20
Best Regards,
Yongqin Liu
---------------------------------------------------------------
#mailing list
linaro-android@lists.linaro.org
http://lists.linaro.org/mailman/listinfo/linaro-android
