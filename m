Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8C524A95E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 00:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60906E862;
	Wed, 19 Aug 2020 22:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A77F6E862
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 22:26:17 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id v22so119993edy.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K5/ZhAUbWTr4qOS5nAsBeTdHY0GebadiEmVWINBI6vM=;
 b=Sh3tR5KyAoPHE3Ua9YWxEI2U76rt6iOx845Fz+PoMf5KKgyxq1hdnD9mvs0wYDdJLu
 NJrCOK8hCWxwWgPtnFzkopxR+bEABklL3i1El3PgOV5Kgv/n/76Ns+acPtKQ8lSy8Ybt
 G7bK+LOwdpMuFaBXjLem512Ks8gOmYjgT8h+DIbJCIuADgvjGlZpKTUIt+69MMzdRnGp
 Zj//C6/oDB5Yk/fBP2GE5lCmWI5znSq+hE7f/UJM/VKj0zMxMNqRUuSborWNFHOJMOzf
 xYshI9d8uok4u22D/Fg8il0i2FWENEsgl1rtAQhQwUkNH3XTq/GBt1ZDKNQuMWa86H94
 LyHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K5/ZhAUbWTr4qOS5nAsBeTdHY0GebadiEmVWINBI6vM=;
 b=QJCdb8n2Q7CLplIRltG3u3A1ZaaNxWvFPrvcSHeaRyKcZELS0+/kr8tb3mNiTn23Ss
 Gs/hsqsbupyQ9PDnhwygWIrGVpLIFYHc3tUOP3aoaOcP9Ekd96jR7YlOB6xxjSdg18bU
 X6bV1U3lFtR+RfLLdnLMdQjz+3SzSm46wWbScW5kMAuufJQAlJTxWLXKNQ3ksktynKYm
 LodkLi6QBaEsXOhhOEYjXshdpU7SSDVBPaKbzBZLW5pbpJYAeTxos8uL3dMcZLFK1xH7
 V+krw7CiY8sR5gHdP0BuVmWe1RAJGfzrpCu9kaCQlVmQb+8vn9BM7boEfrvIs8BHp9Gz
 vheA==
X-Gm-Message-State: AOAM533xGD0m9HYcGp8XRo1BjCM+Tj5crMYaIPra0qwpqTM6Uxs4yjwl
 83Ly19EQkYnyipkAdxQmjj+gCeCmm/2mJb2f8NACJw==
X-Google-Smtp-Source: ABdhPJwZC3gxrb6Lv7XMhy4GIljitMx33rqSYtyOQGvtLTSSNUZgeD5Ds8FwAtSNmbMxFdQBtGwPdXfjBKSe1DOAUeY=
X-Received: by 2002:a50:d655:: with SMTP id c21mr174602edj.49.1597875975591;
 Wed, 19 Aug 2020 15:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <1940005.XIBaf5lNV5@jeremy> <7086465.UhkgK7rEtT@jason>
 <32cb6f50-1fe1-1484-0512-04590882d35a@baylibre.com> <3158508.CFMi0AOM4G@jason>
 <CAAEAJfBHBqT9Lv5zMaizJLnz=L5+Z3RvYoDf=Ex09_PDSUGe5g@mail.gmail.com>
 <4362AD3D-B072-480E-B424-28A7C9F8061B@goldelico.com>
In-Reply-To: <4362AD3D-B072-480E-B424-28A7C9F8061B@goldelico.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Wed, 19 Aug 2020 19:26:03 -0300
Message-ID: <CAAEAJfBxJLyS-EaE82c4Oq3-EFongDmAtYnPtfMLKLL3KAiFxA@mail.gmail.com>
Subject: Re: drm/bridge: Synopsys DW-HDMI bridge driver for the Ingenic JZ4780
 (was Re: Specialising the Synopsys DW-HDMI bridge driver for the
 Ingenic JZ4780)
To: "H. Nikolaus Schaller" <hns@goldelico.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Paul Boddie <paul@boddie.org.uk>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Paul Cercueil <paul@crapouillou.net>,
 MIPS Creator CI20 Development <mips-creator-ci20-dev@googlegroups.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Aug 2020 at 15:50, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> Hi Ezequiel,
>
> > Am 19.08.2020 um 12:21 schrieb Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>:
> >
> > Hello,
> >
> > First of all, I'd like to thank everyone for the great work
> > on ingenic-drm. The driver is in very good shape
> > and a pleasure to work with.
> >
> > Yesterday, I checked out branch "paulb-jz4780-ci20-hdmi-5.8-rc5",
> > from git.goldelico.com/letux-kernel.git, rebased it on v5.9-rc1,
> > and then run weston over HDMI (how often
> > weston runs on mips, uh? :)
>
> Wow!
>
> > The edid of my monitor is properly read
> > and modetest reports all modes.
> >
> > I've only tested the primary plane, for some reason
> > the overlay is not working as expected, but it must
> > be probably some minor thing.
> >
> > As for the bus format, I have just added a skip
> > for CONNECTOR_HDMIA types in the encoder
> > atomic check. And then MEDIA_BUS_FMT_RGB888_1X24
> > is hardcoded if there are no bus formats negotiated
>
> Cool!
>
> > Paul et al, if you guys can rebase your work on v5.9-rc1
> > and Cc I will be happy to review and test the patches.
>
> I have tried our latest letux-5.9-rc1 tree (with Pauls fixes)
> on my setup but screen remains black and the kernel was stuck
> after showing "login:" and reported
>
> [  490.680469] rcu: INFO: rcu_preempt self-detected stall on CPU
>
> Maybe, can you share your rebased tree to clearly identify the
> subtle differences? Maybe I have broken something by the rebase.
>

Sure.

Please give this a try and let me know if it works for you.

I've cleaned and squashed your changes, hopefully
I've kept the correct authorship for all of them.

https://gitlab.collabora.com/linux/0day/-/commits/jz4780-drm-hdmi-v5.9-rc1

This should be enough to get an fbcon, launch weston, etc.
However, there are few things that still don't look right.
Seems planes X,Y offset is not working, and also enabling
a second plane results in both planes going black for good.

This needs some more investigation, but seems at least a good start.

Thanks again for all the good work,
Ezequiel


> > Cheers & thanks again,
> > Eze
>
> Thanks and best regards,
> Nikolaus
>
>
> >
> >
> >
> >
> > On Tue, 7 Jul 2020 at 04:27, Paul Boddie <paul@boddie.org.uk> wrote:
> >>
> >> On Monday, 6 July 2020 14:12:24 CEST Neil Armstrong wrote:
> >>>
> >>> On 06/07/2020 01:57, Paul Boddie wrote:
> >>>>
> >>>> It also seems to be appropriate to set the input_bus_format on the
> >>>> platform- specific HDMI driver; otherwise, I doubt that appropriate bus
> >>>> encodings will be chosen in the Synopsys driver.
> >>>
> >>> It does but when not provided, it doesn't use it.
> >>>
> >>> It's handled in drm_atomic_bridge_chain_select_bus_fmts() :
> >>>      if (conn->display_info.num_bus_formats &&
> >>>                  conn->display_info.bus_formats)
> >>>              out_bus_fmts[0] = conn->display_info.bus_formats[0];
> >>>      else
> >>>              out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
> >>
> >> OK. I thought I'd seen this somewhere, but I had started to think that
> >> input_bus_format would remain initialised (presumably to zero) and this would
> >> then cause the Synopsys driver to not change the bus format to the actual
> >> default.
> >>
> >> [...]
> >>
> >>>> Testing against 5.8-rc3 with the above changes seems to have moved the
> >>>> needle slightly. Although I still get "Input not supported" from my
> >>>> monitor, running modetest now gives a different error:
> >>>>
> >>>> modetest -D /dev/dri/card0 -M ingenic-drm -s 34@32:1280x1024-60.02
> >>>>
> >>>> ...now yields this:
> >>>>
> >>>> setting mode 1280x1024-60.02Hz@XR24 on connectors 34, crtc 32
> >>>> failed to set gamma: Invalid argument
> >>>
> >>> This is because you don't provide the gamma setup ioctl, it's not a fatal
> >>> error at all. It should be warning since it's optional.
> >>>
> >>> Did you check all modes ?
> >>
> >> I have checked a few more. Currently, testing them is awkward because it
> >> involves switching my monitor to DVI input, getting "Input Not Supported",
> >> unplugging the cable, and then the hotplug event has most likely caused a bad
> >> pointer dereference in ingenic_drm_crtc_atomic_flush and thus a kernel panic.
> >>
> >> So, I'll try and fix this panic, which appears to be due to the DRM driver
> >> accessing a null framebuffer pointer (presumably having been invalidated
> >> elsewhere upon unplugging), and see if I can't get some more information about
> >> the state of the peripherals.
> >>
> >> Paul
> >>
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
