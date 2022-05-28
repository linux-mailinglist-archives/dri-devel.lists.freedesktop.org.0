Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B10536E1D
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 20:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B192E10E978;
	Sat, 28 May 2022 18:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967F310E978
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 18:59:19 +0000 (UTC)
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MeCd5-1nMnQo1LoV-00bIfD for <dri-devel@lists.freedesktop.org>; Sat, 28 May
 2022 20:59:17 +0200
Received: by mail-yb1-f171.google.com with SMTP id e184so3514941ybf.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 11:59:17 -0700 (PDT)
X-Gm-Message-State: AOAM533K1QwWBlKvvJKlvGbZDEF0KV3tC7Ttkr7V+wCO63VnkQGhrcIT
 NgPqgh9PVQr3kYzaWblUJyFGqmyde8BFc09dJJY=
X-Google-Smtp-Source: ABdhPJx2zeBqlc7izpQrrVjwF/YZ2kHUCwcBggRscS5P/bQsa9aebzHk1lh9EW0TvmxFzizAFsLT6XOMLriNEeOtaNI=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr45525900ybx.472.1653764356125; Sat, 28
 May 2022 11:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
In-Reply-To: <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 28 May 2022 20:58:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
Message-ID: <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:LzWbPV8KJu7w1Ixjsf2CODbWnTewoiZ4vY4G3D+Hfdawz7t3UHS
 DcfsNU7eR3A0w1U56LusgDBHl2PCdmJLPSKRG5GapqnUFdWfWoEB/pdeANVe2gVgiCAu+cb
 plBtopIjZHVL7WtzqHK9E01JUTK75ncLO5DcAV9RXPYrThEc51RHl5jxN9IbuxNZwldrpop
 Q7vGdvpnlGOOYfUBOecnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:l4KsybSomfE=:PPuuz2LExAjtw3OnHIySqs
 2jJvO0xQO6lVBaeIMCSOUnCZLC5Vwcd0M83lx7bBjfGw4uqrXYdDkrqhhlt81KI1DSVi3Hjqb
 nZQBoXn7upcvgPFRjLCW+LsykpRySyonEV4QNtlZkvJkAvZnjjkWzOfsDEa8aClEino+PRrvR
 24ur9rP9BRHw4omr8WfUjvEm1E1pUmzgdgvc7Cm1qmE8vLzcOq5K1JvSwGJZh4bv9ZCPW+A+/
 XvMTlVeGli/acmGA/EAtV4g0OuWxh8U+n3Y2Nvf67XrAL0DVU5z67Qy0hyowRYHdxMp+8FYGc
 gbwm7U9GZrPy5IowGzrIKwU0ldqjTBCq0IPm82VK5NnHtq8iorK4RKl8KJ6xUh+tDz+PxP5G/
 A30FR+VVM1CjxPpcwbmqxqFbnNA4YFSxUrCg+b2nDSXMyfM9Ugbf0ETcF3MyzROu7edPc/cSG
 H4ypo5fNkXR1NdgFvoWq+p9oyHAR1MMWXDJBKYHMQfY3lYCISdtBuH68xCq5kEXGaVbzzPbhm
 6ClO06EXASlIz7VXlGq8H5zdfQK/zk4QMd2KM/Xt3mBjGbsQqU7vpcGYj9d49BZPs1amp4MBM
 zW+wHs8RQJF6+XsuCFpRhVJw8xlaEknWwNOHq1CGIHtH8xiUUrbue9fDoOxhEjbjX0GEdLVnr
 nDSaOkOXJ52rADdnUE3v3DMk/6tEbmS8aTwS6Nxva7j6WbkcFmnR433KvI5Pa01+nTQ5QD42P
 E8fqHHe7mU16Hvx0GpztD8EleuXDoBFCrlkzVw==
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Viresh Kumar <vireshk@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 28, 2022 at 8:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Not very much tested, and I have no idea what it is that triggers this
> only on spear3xx_defconfig.
>
> Some ARM ABI issue that is triggered by some very particular ARM
> compiler flag enabled by that config?

It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
option, you the kernel is built for the old 'OABI' that forces all non-packed
struct members to be at least 16-bit aligned.

I think Russell still uses OABI kernels on his oldest machines, but it is
incompatible with all modern user space and should probably not be
in the defconfig.

Your patch looks like the correct solution to me.

      Arnd
