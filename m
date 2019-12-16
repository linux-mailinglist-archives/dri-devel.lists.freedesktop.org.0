Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BDE11FCFC
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 03:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07F4F89F06;
	Mon, 16 Dec 2019 02:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DE589F06;
 Mon, 16 Dec 2019 02:51:44 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id 59so1550006uap.12;
 Sun, 15 Dec 2019 18:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dt2N4SwdmDzKos7KOOuigco4w8TfoOXTqKozyp0A0x4=;
 b=eN3zEZj0WJFI6jBrvhlDydESyJ54sA6i7pO0dzNumgwquUT3cBMjt1kPXWPgLW3+KC
 O/9cPuh7+SCcZCEVWKiGl4Zs9dGE8yqQ02w1E4WnmdJIooJX5r/HWWSIZx+LYM5Gx8sh
 xZDmQj8fadMEQ0zsMW/4hfBKtzJZPbpfh2uo7OJsFUVjE2IYzjqoSxRffWaas85lHWYs
 FEeNRuQmA3WgSTH4Z+N/uv1NtKIesr1j4ANKbjbW9iGkgLYKCOrL1DwbXDVVlVbLyvEn
 pfLgUfG/9SZl0ixCu+Dk5YzqDa1nfiw3FzWVGQzdDb33P+zB6JVF4Vc2J9YNJw5Xj6yO
 8v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dt2N4SwdmDzKos7KOOuigco4w8TfoOXTqKozyp0A0x4=;
 b=lAWWmWyZLCkAEaz6na+JGK7gniRMawhd4q83xMtAiiZbojH9fNb/vv9k2MX+XKd9tG
 msBmfEV6KmscXkinWYB+Kc1Ou59KWZpzfHuwny3pQaJmYls72bt1aLhrIzb4SwCR7431
 5SXR48pDNMOhLirndxK/Qu1Rng3X/jbIO4YcanC3x/ogqlg7YAYcPzCxMXflgHBeYZcs
 c1Y5E21dyhftTaT7nKY9z8TsPcR78jUv04VQiXVNyRyKJOfenTKydFHlZcYB+YBC7n8h
 B/HOl+g203dmj+2svG6+3L1n6d4yJDCeLXK5EKmwRLCSSv5dqL769qz5xwGMOG5+Y/vy
 5YMg==
X-Gm-Message-State: APjAAAXgjKyCJdrAH93BKbc19PeoeTRENEDiYEvyVU98XpI+MeUEKxWN
 Jaq8OtLljlg5A0Qbc0zoHKFXvfgicmKke/wZmcs=
X-Google-Smtp-Source: APXvYqw3MpWIVLjyYNcUhZRmQiQ0xpTyg++SgIZJzbsAahqWonhwopXbf6c/t0aPRJJxhF5A45bTkX9URI3HMonCQGo=
X-Received: by 2002:ab0:7027:: with SMTP id u7mr21346813ual.94.1576464703537; 
 Sun, 15 Dec 2019 18:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Dec 2019 10:51:32 +0800
Message-ID: <CAKGbVbvj5zK9gVDQ3+0=xmF5pOUOSJzZ6jaGKHoCqwjYz+UiEQ@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
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
Cc: lima@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks for adding this.

As the license, it's up to you, I think it's OK for now.

For the code, I think you may need some lock to protect the time records as
there are two kernel threads gp/pp will try to mark GPU busy and several
interrupts try to mark GPU idle.

Regards,
Qiang


On Mon, Dec 16, 2019 at 5:12 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This is my attempt at adding devfreq (and cooling device) support to
> the lima driver.
> I didn't have much time to do in-depth testing. However, I'm sending
> this out early because there are many SoCs with Mali-400/450 GPU so
> I want to avoid duplicating the work with somebody else.
>
> The code is derived from panfrost_devfreq.c which is why I kept the
> Collabora copyright in lima_devfreq.c. Please let me know if I should
> drop this or how I can make it more clear that I "borrowed" the code
> from panfrost.
>
> I am seeking comments in two general areas:
> - regarding the integration into the existing lima code
> - for the actual devfreq code (I had to adapt the panfrost code
>   slightly, because lima uses a bus and a GPU/core clock)
>
> My own TODO list includes "more" testing on various Amlogic SoCs.
> So far I have tested this on Meson8b and Meson8m2 (which both have a
> GPU OPP table defined). However, I still need to test this on a GXL
> board (which is currently missing the GPU OPP table).
>
>
> Martin Blumenstingl (1):
>   drm/lima: Add optional devfreq support
>
>  drivers/gpu/drm/lima/Kconfig        |   1 +
>  drivers/gpu/drm/lima/Makefile       |   3 +-
>  drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
>  drivers/gpu/drm/lima/lima_device.c  |   4 +
>  drivers/gpu/drm/lima/lima_device.h  |  11 ++
>  drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
>  drivers/gpu/drm/lima/lima_sched.c   |   7 ++
>  drivers/gpu/drm/lima/lima_sched.h   |   3 +
>  9 files changed, 217 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>
> --
> 2.24.1
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
