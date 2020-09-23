Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F25427646C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 01:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C3C6EA16;
	Wed, 23 Sep 2020 23:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com
 [IPv6:2607:f8b0:4864:20::a44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12CFD6EA16
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 23:25:17 +0000 (UTC)
Received: by mail-vk1-xa44.google.com with SMTP id t189so429806vka.10
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 16:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=igFosv3WHmZdFWzvJm5qSZpEZaXrR05wtVSmYLWQPio=;
 b=RxDcOkouxfb96CzAOBTyyNO+peLSevHCEfGS1Vku/cz4ys8d+JIagVDFcDSZKz123I
 ZKXDIoyFtK/N6fDlX/gR9a2ixS6z+RcPVI1Vw9mm+BqfNWYBdWKrvGjv51BQteTl0SqT
 PKUwM3kl/85jbZXeiJwAj4JegIUoaTBGagHTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=igFosv3WHmZdFWzvJm5qSZpEZaXrR05wtVSmYLWQPio=;
 b=pZNwsmVSUxBaPjzRoI1Cufq2k93ISev7yruQRMg8SQ6wRJdk0Qo465fFwAAM8ZRY/v
 3BemjIm0PBD6+crKaYGAxI5IcEBLx2qKO9MO/jICIwHb1SVw8HAzqblR+Qm2SfD5MdM+
 ZL+mQ80CNr8xNFxUYI+7rUSJu0HiSGQVn9DRJhqhfO0JrH42Mq9wgo8ggmPViA5SYfpY
 lNJCIdeqvIQjdmDYlJ7UZQ8Ym2I7vhQUIskcByxa03FzdQ6V324HUDO6aYj0+iTkBBVe
 ceyCMkgp9Um/txBSw/Kj5i/cuvmdhi5grEGPigcBJOfpdD5s7DDCvA6d4n60/T9Pq/DK
 BbGQ==
X-Gm-Message-State: AOAM531aExWRKZnuBXYSXm4qnFSn/EW0gyOHUBT8iDb9wkK6i+baECwx
 URhVRcx9/UXwZfeQgtOgvrdLhvFjUSqicA==
X-Google-Smtp-Source: ABdhPJy60RaL13LUAulOpZ6SMYwMb9fmCfJrHlU+o+nxO1+JQIylTm1AyRc0pOuiTaQfRiNZjndGWg==
X-Received: by 2002:a1f:f884:: with SMTP id w126mr2286883vkh.1.1600903515866; 
 Wed, 23 Sep 2020 16:25:15 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id r14sm184033uao.14.2020.09.23.16.25.14
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 16:25:15 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id y190so1024303vsy.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 16:25:14 -0700 (PDT)
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr2221819vsp.34.1600903514424; 
 Wed, 23 Sep 2020 16:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200922203107.2932-1-vicencb@gmail.com>
In-Reply-To: <20200922203107.2932-1-vicencb@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 23 Sep 2020 16:25:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VrTzYibXrkVTgMuQa1ZXk64s5UnDtrtLs8rBayxmnKOQ@mail.gmail.com>
Message-ID: <CAD=FV=VrTzYibXrkVTgMuQa1ZXk64s5UnDtrtLs8rBayxmnKOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: rockchip: hdmi: enable higher resolutions
 than FHD
To: Vicente Bergas <vicencb@gmail.com>
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
Cc: crj <algea.cao@rock-chips.com>, David Airlie <airlied@linux.ie>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Yan <andy.yan@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 22, 2020 at 1:31 PM Vicente Bergas <vicencb@gmail.com> wrote:
>
> This patch series enable a QHD HDMI monitor to work at native resolution.
> Tested on a Sapphire board with RK3399 connected to a Q27q-10 monitor at 2560x1440@60
>
> Changes since v1:
> Use alternative clock rounding code proposed by Doug Anderson
>
> Vicente Bergas (3):
>   drm: rockchip: hdmi: fix clock rounding code
>   drm: rockchip: hdmi: allow any clock that is within the range
>   drm: rockchip: hdmi: add higher pixel clock frequencies
>
>  drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 8 +++++++-
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 7 ++-----
>  2 files changed, 9 insertions(+), 6 deletions(-)

So I haven't looked at all this code in over a year and that was
mostly just a quick re-hash of the work I did years and years ago...
...but:

1. On rk3288, which also uses dw-hdmi, things get super complicated
because of the PLL sharing on the Rockchip platform.  I don't _think_
this has all been worked out, has it?  Specifically there is only one
"free" PLL but two VOPs, so if you have two displays (like eDP and
HDMI), one of those two has to make due with a very limited set of
pixel clocks that it can make.  On downstream Chrome OS tree we made
the simplifying assumption that the internal panel was going to be the
one to suffer (so we had to futz around w/ non-standard pixels clocks
for all our panels) and added some not-so-generic code to then give
the HDMI VOP full control of one of the PLLs.  Without these tricks
then you really shouldn't be advertising a lot of clock rates because
the PLL won't be guaranteed to make them.  I've never had time to find
a wonderful solution myself and I've tried (at least 3 times) to
convince others to solve this but failed.  :(

2. In order to get all the clock rates working reliably across a large
number of monitors on rk3288, I spent a lot of time tweaking all these
parameters, and it mattered.  You can see what's in the downstream
tree at:

https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c

Those numbers came from me staring at pages and pages or hardcoded
numbers for different display modes until my eyes bled and then coming
up with a script:

https://chromium.googlesource.com/chromiumos/platform/drm-tests/+/f806cb7d7f14dd17087ae8ebed67bd3589708812/rk3288_hdmitables.py

You are certainly free to totally ignore all that, but I figured I'd
at last point you at it in case it helped make your rates more
reliable.  I spent many hours in a lab tweaking settings of dw_hdmi
and various PLL settings for rk3288 to make sure we could actually
produce a low enough jitter signal that plugging into a random monitor
would actually work.

NOTE: I only enabled this on rk3288.  All rk3399 Chromebooks only
supported DP out (through Type C), so I have zero idea about HDMI
support on rk3399 or any other Rockchip SoCs and whether any of my
work would actually be relevant there...


Though I would have liked to get everything resolved with upstream
last year, I just wasn't able to find the time to do it.  I at least
(hopefully) documented this in:

https://crbug.com/970892

In any case, I'll probably step aside now and let upstream folks
decide how they want to move forward.  I don't think I have enough
skin ihe game these days to really make stink about whatever you guys
decide to do.  ;-)


-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
