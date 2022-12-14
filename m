Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9F464CCD5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:07:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBF110E40F;
	Wed, 14 Dec 2022 15:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA4610E40F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:07:06 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-381662c78a9so239902427b3.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 07:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TR/KFpeiUC9gRpsBXc0Ne5FWmMcPN8h9/1WoJtjqPZg=;
 b=RhmOG4FRPRW8RWD1rLEc2W8E6w8/jYkK+F02IPmQVSsUY1/V/TXka9PDV/CzD8LUTl
 dF9eE6xLEPZo4rl13p5hpX9jgFjcn96AU153g1aol1LYUzhAku8/8lnlDd5bznbSC/fZ
 EXg3vKmUKuiDcvEmSgIuKMySG5jfeuiweW/sf9ig7ZK26slzwRxwJbOhdUBCQ7DC8Aes
 76mtOW9ovrwfxOjE+TUKPX4P70Ubv71aKVWIPzRUHAw9FhD2SwREZDtiLW8NySyfL7lk
 3AZ9m8c4EjoV+p8RvJnJA8Wjrx4Nv3uElLkiXkw7mYfOb1gJkbc0wQA3IxcG9b7KbfcR
 xxsw==
X-Gm-Message-State: ANoB5pk7FMA8WTZGcA5dKVcZVqepcvGXepCCQ6IwoSfaG4yHgGG+L2I+
 QgyHIR7XP8XJblqObm0MJmRWz5ocaoLVEg==
X-Google-Smtp-Source: AA0mqf7gMy+CUlKiuB+f0EP+BH92RBQylE9fJlSq0CDuuVvLz73sZJs9mrDSxfTwJ+w6BghI3XX2+Q==
X-Received: by 2002:a05:7500:6812:b0:ea:915c:78ec with SMTP id
 hd18-20020a057500681200b000ea915c78ecmr2512100gab.42.1671030425405; 
 Wed, 14 Dec 2022 07:07:05 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05620a248f00b006fbae4a5f59sm3947050qkn.41.2022.12.14.07.07.04
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 07:07:04 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-3bfd998fa53so55677b3.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 07:07:04 -0800 (PST)
X-Received: by 2002:a81:a8a:0:b0:37e:6806:a5f9 with SMTP id
 132-20020a810a8a000000b0037e6806a5f9mr12506156ywk.47.1671030423737; Wed, 14
 Dec 2022 07:07:03 -0800 (PST)
MIME-Version: 1.0
References: <6398848e.170a0220.f8e8e.d44f@mx.google.com>
 <Y5itf0+yNIQa6fU4@sirena.org.uk>
 <CAMuHMdW4RNFspMheq1JGUkCm+s1oM90Q_4vPH1XX9ZRAxrmPdA@mail.gmail.com>
 <ea3d5e98-8901-1f9c-b27d-3c65e7969c41@collabora.com>
 <CAMuHMdVGK=WDXqtJ_NgBJf_g=wQJ0V+dQ_b0RztafpxoRW=v5Q@mail.gmail.com>
 <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
In-Reply-To: <fea3d246-d1d5-450f-6e9e-1ab63a91a053@collabora.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Dec 2022 16:06:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9NagbF2mqByLFA1qBUiBsRuYuWGUMJ=QcmLnGuX_3CA@mail.gmail.com>
Message-ID: <CAMuHMdV9NagbF2mqByLFA1qBUiBsRuYuWGUMJ=QcmLnGuX_3CA@mail.gmail.com>
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

On Wed, Dec 14, 2022 at 3:16 PM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
> On 14/12/2022 15:03, Geert Uytterhoeven wrote:
> > On Wed, Dec 14, 2022 at 1:54 PM Guillaume Tucker
> > <guillaume.tucker@collabora.com> wrote:
> >> On 14/12/2022 11:06, Geert Uytterhoeven wrote:
> >>> On Tue, Dec 13, 2022 at 5:58 PM Mark Brown <broonie@kernel.org> wrote:
> >>>> On Tue, Dec 13, 2022 at 05:56:30AM -0800, KernelCI bot wrote:
> >>>> The KernelCI bisection bot found regressions in at least two KMS tests
> >>>> in the Renesas tree on rk3399-gru-kevin just after the Renesas tree
> >>>> merged up mainline:
> >>>>
> >>>>    igt-kms-rockchip.kms_vblank.pipe-A-wait-forked
> >>>>    igt-kms-rockchip.kms_vblank.pipe-A-query-busy
> >>>>
> >>>> which it bisected to ca871659ec16 ("drm/bridge: analogix_dp: Support
> >>>> PSR-exit to disable transition").  I'm not *100%* sure I trust the
> >>>> bisection but it sure is suspicous that two separate bisects for related
> >>>> issues landed on the same commit.
> >>>
> >>> ... which is an old commit, added in v5.19-rc2, and which did not
> >>> enter through the renesas tree at all?
> >>
> >> Do you mean this report shouldn't have been sent to you?
> >
> > Exactly.

> As you can see, Geert is not listed there.

Sorry, it was indeed not sent explicitly to me, but I was mentioned,
so I noticed.

> >> FYI The renesas tree got rebased and inherited a regression which
> >> got bisected.
> >
> > Renesas/master is (usually) never rebased.
> > So when did this rebase happen, and why is it relevant?
>
> Sorry then I guess it wasn't rebased but if mainline was merged
> into the branch then it inherited the regressions from mainline
> at that point.

Yep.

> >>  The same thing probably happened to other trees.
> >
> > Indeed, I expect any tree that merged v5.19-rc2 or later to contain
> > this regression.  That doesn't mean it's a good idea to tell all
> > consumers of v5.19-rc2 and later they got a regression (and make it
> > sound like the problem was introduced in their trees).
>
> No, the issues aren't reported more than once.  And again, the
> tree used to do the bisection is not relevant as what matters is
> the commit that it found.
>
> >> Yes it would be good to have 2nd order regressions based on a
> >> reference branch (e.g. mainline in this case) in KernelCI but
> >
> > Sorry, I don't know what is a "2nd order regression".
>
> Regressions are basically a delta between results in a given
> revision and the previous one on the same branch (new failures).
> What I call "2nd order" regressions are a delta of these
> regressions compared to another reference branch.  For example,
> regressions that are in a particular tree and aren't also in
> mainline such as the one at hand which isn't specific to renesas.

This regression must also be present in mainline (in v6.1).

> >> that's for next year.  Regardless, it found a commit and the
> >> bisection looks legit.
> >
> > Good. So please report it to the relevant parties.
> >
> > While bisecting, as soon as you happen to arrive at a commit
> > that is already upstream...
> >
> >     > git bisect start
> >     > # good: [997b2d66ff4e40ef6a5acf76452e8c21104416f7] Merge branch
> > 'renesas-next' into renesas-devel
> >     > git bisect good 997b2d66ff4e40ef6a5acf76452e8c21104416f7
> >     > # bad: [710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e] Merge tag
> > 'v6.1' into renesas-devel
> >     > git bisect bad 710ce3a8a6fbfcd81d8ad361dc9d43c6a785f25e
> >     > # bad: [044610f8e4155ec0374f7c8307b725b7d01d750c] Merge tag
> > 'ata-6.0-rc2' of
> > git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/libata
> >     > git bisect bad 044610f8e4155ec0374f7c8307b725b7d01d750c
> > (which happens here  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^)
> >
> > ... there is no point in "blaming" any of the bisection points before.
> >
> > The git command to check this is (assumed "linus" is a remote pointing
> > to Linus' tree):
> >
> >     git branch -a --contains 044610f8e4155ec0374f7c8307b725b7d01d750c
> > linus/master
> >
> > You can use similar commands to find the maintainer's tree for commits
> > that are in linux-next and in a for-next branch, but not yet upstream.
>
> I think it won't be to implement this as soon as we start
> tracking regressions specific to each tree since we'll have valid
> good/bad revisions that are relevant to the tree in the first
> place (if I understand correctly what you mean here).

My point is that regressions should be reported against the tree where
they truly originated, not against a random tree that merged upstream.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
