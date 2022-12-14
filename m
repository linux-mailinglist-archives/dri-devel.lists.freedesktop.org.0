Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A3164CBCC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 15:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4BD10E402;
	Wed, 14 Dec 2022 14:03:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC2610E402
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 14:03:51 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-40b40ff39f1so199335317b3.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 06:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2Ppa4oLKdAQL4oGsIxNKU1jwlXuu49XPnf0pPCL/ZIA=;
 b=Kc5GIS93kqdCgi/YcTfrokQvDrojY2wyxNRDCmaGihpF8CzthE9EI1t87/qsAutLqw
 YShXIr7t/+OQZe0XUliTPKvKi+X/UUvwINYTTobSOkGBBKvefrQBIHckiZJLKzYna/hf
 zBQhE50KmIO1QiKELhLpxtL7Pv+gbmh0C3+Ah7AubHQpkW5Fs+LRpKM0kRd8HmiMoBqX
 qHzAgS48kHT1uEYkVUgkgVrUskL6+triUoDNyB2Mf6CYgH2zD3T75P1PsXA81eKTgsmG
 /l2uoRX0vitEKbzcDZePb7tuZtzKgYKgev1jzTTW8Y1bBF2lTONofPKvXwpNz+DEFreO
 GF4w==
X-Gm-Message-State: ANoB5plG8KDKoaC5V3EH+82h9HydTLuhugOHHAQEmdrxBCT3V6sjGDOM
 tkcP8b2u5pIiDyt6ew+mKwcbHA7bodBVaQ==
X-Google-Smtp-Source: AA0mqf4HK/kik+TvFUCVgV3n64OJ+moyfo+UJRJP2+zMzW5qVEFKebXxr2NoS6A2MZ6U6ePaD9sEWg==
X-Received: by 2002:a05:7500:3c81:b0:eb:b82:4c31 with SMTP id
 ls1-20020a0575003c8100b000eb0b824c31mr2693930gab.47.1671026630417; 
 Wed, 14 Dec 2022 06:03:50 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com.
 [209.85.219.178]) by smtp.gmail.com with ESMTPSA id
 195-20020a370ccc000000b006fec1c0754csm9814386qkm.87.2022.12.14.06.03.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 06:03:50 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id o127so21495729yba.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 06:03:50 -0800 (PST)
X-Received: by 2002:a25:7104:0:b0:702:90b4:2e24 with SMTP id
 m4-20020a257104000000b0070290b42e24mr13563159ybc.365.1671026624646; Wed, 14
 Dec 2022 06:03:44 -0800 (PST)
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
In-Reply-To: <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 15:03:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
Message-ID: <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
Subject: Re: renesas/master bisection:
 igt-kms-rockchip.kms_vblank.pipe-A-wait-forked on rk3399-gru-kevin
To: Guillaume Tucker <guillaume.tucker@collabora.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Brian Norris <briannorris@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 kernelci@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guillaume,

On Wed, Dec 14, 2022 at 1:54 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> On 14/12/2022 11:06, Geert Uytterhoeven wrote:
> > On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
> >> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> >> The KernelCI bisection bot found regressions in at least two KMS tests
> >> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> >> merged up mainline:
> >>
> >>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
> >>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
> >>
> >> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> >> PSR-exit to disable transition").  I'm not *100%* sure I trust the
> >> bisection but it sure is suspicous that two separate bisects for related
> >> issues landed on the same commit.
> >
> > ... which is an old commit, added in v5.19-rc2, and which did not
> > enter through the renesas tree at all?
>
> Do you mean this report shouldn't have been sent to you?

Exactly.

> FYI The renesas tree got rebased and inherited a regression which
> got bisected.

Renesas/master is (usually) never rebased.
So when did this rebase happen, and why is it relevant?

>  The same thing probably happened to other trees.

Indeed, I expect any tree that merged v5.19-rc2 or later to contain
this regression.  That doesn't mean it's a good idea to tell all
consumers of v5.19-rc2 and later they got a regression (and make it
sound like the problem was introduced in their trees).

> Yes it would be good to have 2nd order regressions based on a
> reference branch (e.g. mainline in this case) in KernelCI but

Sorry, I don't know what is a "2nd order regression".

> that's for next year.  Regardless, it found a commit and the
> bisection looks legit.

Good. So please report it to the relevant parties.

While bisecting, as soon as you happen to arrive at a commit
that is already upstream...

    > git bisect start
    > # good: [997b2d66ff4e40ef6a5acf76452e8c21104416f7] Merge branch
'renesas-next' into renesas-devel
    > git bisect good 997b2d66ff4e40ef6a5acf76452e8c21104416f7
    > # bad: [710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e] Merge tag
'v6.1' into renesas-devel
    > git bisect bad 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
    > # bad: [044610f8e4155ec0374f7c8307b725b7d01d750c] Merge tag
'ata-6.0-rc2' of
git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
    > git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
(which happens here  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^)

... there is no point in "blaming" any of the bisection points before.

The git command to check this is (assumed "linus" is a remote pointing
to Linus' tree):

    git branch -a --contains 044610f8e4155ec0374f7c8307b725b7d01d750c
linus/master

You can use similar commands to find the maintainer's tree for commits
that are in linux-next and in a for-next branch, but not yet upstream.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
