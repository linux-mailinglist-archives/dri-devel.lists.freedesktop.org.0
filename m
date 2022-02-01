Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A984A5899
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 09:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5110E1EB;
	Tue,  1 Feb 2022 08:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE6B893BC
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Feb 2022 08:38:50 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id t199so15264952oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Feb 2022 00:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GaNMBS8erWAUdjZRyVjICW/2VNsiklNXAamHHGSoKQU=;
 b=HABYAYhUrYZjmmyqCihiIlAUb0ufUo8qHSInxKtuQBJMtUSoTtIMq5LhxK09AevQU3
 o85MeHKnBAV19IFBL44gSC/conhVnm5Za9cn2P0v0T3KcfcX+maC+A+WnLIOBaSwJzL8
 mZijpnqkky9MAhwFlW2m8M2UauTJQ+cHbAgpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GaNMBS8erWAUdjZRyVjICW/2VNsiklNXAamHHGSoKQU=;
 b=GTQ5f0on927wEmnChxbRk+YmwL5jyQWR3d0wL/d17l9qnZr19O8UA+CG+2wbzDkvXD
 Uj9/WVmml/zLO3aw293s/TPVzF/bbVKgVTHdgmrevqbllWaXEU0xz69ho5Y1PUhzDgoU
 pY/39Sg3wxTG+joAgeUw9niQopvXrnJR4at79LsZNeIER4SNAi58B7aNkoFgjR+3MQMk
 pxA4MyRzmLjvhw6wI4eVGwCYu0RXjHklVUPx22ILTiM1lDVQ3HsM4YJNWB131M/TfX40
 udy+q0bUgoXJZf8Y2UfbojhK0FtHJFczOr4u9NusyOf8eU5oOB9LNe0EgEMAo2D8AQjg
 IhXg==
X-Gm-Message-State: AOAM532f4AatqX+mnbhHV4Ibq5EOzA7CmGS99Ebvl3ZcrgujHzVJgpOe
 DDSW/2YUzXuIY+gQc8R0lG77r1bEOPCopnMRUYnowA==
X-Google-Smtp-Source: ABdhPJziRYIIAKS82JUTrBVu7riWjIYtqJDF+RJ45wmejZddSiqO3gkTl5ef/yc3pbMhI2xP1ibF0MrIHBEZx8oHtXk=
X-Received: by 2002:a54:4803:: with SMTP id j3mr521011oij.279.1643704729863;
 Tue, 01 Feb 2022 00:38:49 -0800 (PST)
MIME-Version: 1.0
References: <20220131201225.2324984-1-javierm@redhat.com>
 <tIMIWqepcZGntnez-1ss4Kn4K8btXnzDRL7EWd19-745WK90YIC19E_4di9RNvB3gtx-PzWEjBEGQLPNJE_x0T1yyyaWFCoFcCiG4StR9RU=@emersion.fr>
 <wuXPJN-K-rvjoV51c4EBmTBScov8rcJTPoYmlfHe04_-4wD1khVxo9HnUsP7UFd5m4AkzGSw2hXe_c77jbSRhjEJ0JZIYwuvuIkcv_KsR-Y=@emersion.fr>
 <CAMuHMdXKZ=BkvVqdpiNPNJgxm9SzQ3Z0n4SqV2-4oPRveybd6g@mail.gmail.com>
 <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
In-Reply-To: <qmhzv6kqs6QdAOP3bNB39glOpc8eeJ6flgjfjcaBniT-shDKZkxo5uB71weGOUKxPE6dq_WBhtHmY5vMmuYwqMoHgtMWnX0ESE5R1Y5g5F8=@emersion.fr>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 1 Feb 2022 09:38:38 +0100
Message-ID: <CAKMK7uGPuhrDf8fdDgfuPt5rzO30Rm54T7GvWb203NRbVoVDgw@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED displays
To: Simon Ser <contact@emersion.fr>
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
Cc: Linux PWM List <linux-pwm@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 1, 2022 at 9:34 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Tuesday, February 1st, 2022 at 09:26, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > What's the story with the Rn formats?
> >
> > The comments say "n bpp Red", while this is a monochrome (even
> > inverted) display?
>
> I don't think the color matters that much. "Red" was picked just because it was
> an arbitrary color, to make the difference with e.g. C8. Or am I mistaken?

The red comes from gl, where with shaders it really doesn't matter
what meaning you attach to channels, but really just how many you
have. So 2-channel formats are called RxGx, 3-channel RxGxBx,
4-channel RxGxBxAx and single-channel Rx. And we use drm_fourcc for
interop in general, hence why these exist.

We should probably make a comment that this really isn't a red channel
when used for display it's a greyscale/intensity format. Aside from
that documentation gap I think reusing Rx formats for
greyscale/intensity for display makes perfect sense.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
