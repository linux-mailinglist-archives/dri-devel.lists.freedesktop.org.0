Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCE0536E5D
	for <lists+dri-devel@lfdr.de>; Sat, 28 May 2022 22:31:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C681C10E2B0;
	Sat, 28 May 2022 20:31:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BD510E2B0
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 20:31:46 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t5so9136002edc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 13:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1kBeURXP1GB/kHBU8GORq7J0BLUBtbdZ3DIpYlBaTc=;
 b=DjAdbu7azasbs7NwcB/7SaHAszgGECqjn47oqs1k4xlPedT4RzvCX0QqPq7lBkKL8h
 kCDd8EbrgSMsdYPGW3kd71I2wnB1fj5aTc/XMHG5vhBWAJyMC5IrsfUpAp0qTXGDSYTv
 IHcvWUBdT5BZzPhVuRmnJn+4dngxb6cwXB33Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1kBeURXP1GB/kHBU8GORq7J0BLUBtbdZ3DIpYlBaTc=;
 b=ycGQgCp6E+2UcrNuqU3rlATwMtRpoYvPquf32l0hP0TQr4iqoXOknEzDZ/crdy8p/L
 oNr3GpzKTfK3CNqD7Xf1TRPo05MNAt7KsK1vZeGjjD6oFZ56WzenS2dMHU1IyYI4Ud/J
 vCld/yZBPC3quFlovaQTiRlCFmpNSA33o7Gn2MYzpA97hl2nEEGMyp05bqgBTW+JuR3G
 eaMQ+HT/BckMxhDc8bYkTuin4PUegTbD5ZMuBLTK13QECs7ILQilgBNOSOoEB+b7meFn
 1b2WP+9WACsUvCS+C9mV2btq55vL9VF9L6RGRrI6kDWGPoc1d0CBrJYCzthhMGQPlT/j
 CTvg==
X-Gm-Message-State: AOAM532gZAPJS/GH8UWynaa3Zy2kRCq92KHjhDJFlX9xkd1LUzNcZDDt
 vHW/dFyGo0eooIMFab0RHvtuwbjEeqk3fd4tnCw=
X-Google-Smtp-Source: ABdhPJwEseNtBkaWYt3tMImjFQ98ehkkVao1bG9/sqq6Q8hXlK+35DRATBXjM/M8g6LGUfCo0c8SFA==
X-Received: by 2002:a05:6402:2d2:b0:42b:aeaf:dae7 with SMTP id
 b18-20020a05640202d200b0042baeafdae7mr22389660edx.301.1653769904940; 
 Sat, 28 May 2022 13:31:44 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50]) by smtp.gmail.com with ESMTPSA id
 ay21-20020a170906d29500b006feba4ef020sm2575723ejb.180.2022.05.28.13.31.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 May 2022 13:31:42 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id p19so4403812wmg.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 May 2022 13:31:41 -0700 (PDT)
X-Received: by 2002:a1c:7207:0:b0:397:66ee:9d71 with SMTP id
 n7-20020a1c7207000000b0039766ee9d71mr12380873wmc.8.1653769900324; Sat, 28 May
 2022 13:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <YpCUzStDnSgQLNFN@debian>
 <CAHk-=wg0uGAX5DYZq+tY2KeUAR8DtR91YE1y9CkPMKkKOyE4jg@mail.gmail.com>
 <CADVatmNGPbSdRNQuwJEWAaPtqb3vBYRjvsuBpoRUnhEHj=X5GQ@mail.gmail.com>
 <CAHk-=wisQd8yiPX=SsK3eFiakKo713hq4SyqPWsJ-oyAmLFefQ@mail.gmail.com>
 <YpIR67FMtTGCwARZ@debian>
 <CAHk-=wjuyHE=1wLgHncub8FfgeyYqfWYsy4-YrhAvq9991h_Aw@mail.gmail.com>
 <CAHk-=wi_hJV0V=Ecg2dzbe2P_H1XKTu6VP_AtCH6u=tis31ayg@mail.gmail.com>
 <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0-QyOQiieEvM0yQb43XbCtPmeao8UvoAsdFnjCxYPz7Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 28 May 2022 13:31:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
Message-ID: <CAHk-=whfmwzjF4eBPYS6pHFqHVzJF3m=2h=gRWSRyHks8V=ABA@mail.gmail.com>
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Viresh Kumar <vireshk@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, SoC Team <soc@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 28, 2022 at 11:59 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> It's CONFIG_ARM_AEABI, which is normally set everywhere. Without this
> option, you the kernel is built for the old 'OABI' that forces all non-packed
> struct members to be at least 16-bit aligned.

Looks like forced word (32 bit) alignment to me.

I wonder how many other structures that messes up, but I committed the
EDID fix for now.

This has presumably been broken for a long time, but maybe the
affected targets don't typically use EDID and kernel modesetting, and
only use some fixed display setup instead.

Those structure definitions go back a _loong_ time (from a quick 'git
blame' I see November 2008).

But despite that, I did not mark my fix 'cc:stable' because I don't
know if any of those machines affected by this bad arm ABI issue could
possibly care.

At least my tree hopefully now builds on them, with the BUILD_BUG_ON()
that uncovered this.

                   Linus
