Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 440BA4C399E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 00:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660D910E93B;
	Thu, 24 Feb 2022 23:22:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67A610E93B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 23:22:11 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id m3so5004653eda.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 15:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hBtvP/9XjsowHRrANwhoZx8Loh4md6KhGASfdFGGEVQ=;
 b=BnTp37StniyEb5uTYQEUJI/4jeyQVrctV4ax+SI33PGzVzgMhTk84kFjt8JjGdWtZn
 Kc6lceim/Dp6HQK6GeFgyxiL7D54B1uxU+QCh9GcOLH7dX76g4OcnxquQnw5WDh92bGM
 zFsJQe8upV9lcJ8k8ltCEARYFjo3MZhs59GgHoqX+pC32cI07jVh/NB4+caNg2K8LyDt
 EkeaDsTiDykkclIp/78/s/Bvy4z6MD0+O75bALp1dhO7DsQx7viJIzS5q55Nqea9CceJ
 UVUwwbYDCGwYjGLF/6XVuDl1TAAyvQWEBGkxQFslzNwD/6D6tn95j9KdDKKft08RTWNk
 yD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hBtvP/9XjsowHRrANwhoZx8Loh4md6KhGASfdFGGEVQ=;
 b=bLpb6dkXG6DwOVYzicTeEp1wCrXsZIjjOtm5NGCL6716TAFK+4tQW2SItiUomfxM3x
 WhfiodXeu6+4jub/tu/A+xVzCYSYAb3xWfD/4HEzw/x+ljak4FIi6qTDCGl/IGtE0psI
 rCIJ5/EASG/G1wpYY2Pms4WV4hEMh+IFWEUrGeImbzFGRIFEX34pkKh3PIpEWKuDki2i
 JlPwe9CPH+4w859t4VsRzUTnAGq4PijVyB6oH4LWo1nqFK6r+4A8ypYYBnjJ3XlaGTUT
 1ND43cKTJdoLsbXyCnUs/zNzGD/dyqSUBAV5u9RTdpm6oCCXKo6xafa0o1DZdm9+CNp9
 zV+w==
X-Gm-Message-State: AOAM532hNZettttvtTz5K7Tmqc8lPTA33wwe8UCsS54t3PlJu5hdDc84
 LvZIllYorGbyke1VPKQqaERNmM/ZoiIuJ3A1UFImTg==
X-Google-Smtp-Source: ABdhPJyGRUA9m4Ag+xflkOpJ+7TZ82V1LZpgqzdBRbPQOFUhUjbSdM1AcUDNDbnEhFUUPnaWLyQwtCpHixVk4ASn4NQ=
X-Received: by 2002:a05:6402:5ce:b0:412:be81:a9d6 with SMTP id
 n14-20020a05640205ce00b00412be81a9d6mr4659481edx.272.1645744930120; Thu, 24
 Feb 2022 15:22:10 -0800 (PST)
MIME-Version: 1.0
References: <20220223105600.1132593-1-maxime@cerno.tech>
 <20220223105600.1132593-3-maxime@cerno.tech>
 <CAGS_qxqNU+rGFuALEpmqqmtD+LsTQ4R3_WWL3M70Ar-_af6OnA@mail.gmail.com>
 <20220224225422.98298C340E9@smtp.kernel.org>
In-Reply-To: <20220224225422.98298C340E9@smtp.kernel.org>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 24 Feb 2022 15:21:57 -0800
Message-ID: <CAGS_qxrDs5RYa4nxNR2ghsyBhgVyMHApi+GJKzGxF7FvNHe9dQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] clk: Introduce Kunit Tests for the framework
To: Stephen Boyd <sboyd@kernel.org>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Mike Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Phil Elwell <phil@raspberrypi.com>, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 24, 2022 at 2:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Daniel Latypov (2022-02-23 14:50:59)
> > On Wed, Feb 23, 2022 at 2:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > >
> > > Let's test various parts of the rate-related clock API with the kunit
> > > testing framework.
> > >
> > > Cc: kunit-dev@googlegroups.com
> > > Suggested-by: Stephen Boyd <sboyd@kernel.org>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> >
> > Tested-by: Daniel Latypov <dlatypov@google.com>
> >
> > Looks good to me on the KUnit side.
> > Two small nits below.
> >
> > FYI, I computed the incremental coverage for this series, i.e.:
> > 1) applied the full series
> > 2) computed the absolute coverage
> >
> > $  ./tools/testing/kunit/kunit.py run  --kunitconfig=drivers/clk
> > --make_options=CC=/usr/bin/gcc-6 --kconfig_add=CONFIG_DEBUG_KERNEL=y
> > --kconfig_add=CONFIG_DEBUG_INFO=y --kconfig_add=CONFIG_GCOV=y
> > $ lcov -t "clk_tests" -o coverage.info -c -d .kunit/ --gcov-tool=/usr/bin/gcov-6
>
> This is cool. Thanks! Is it possible to add some 'coverage' command to
> kunit so we don't have to recall this invocation?

This is documented at
https://www.kernel.org/doc/html/latest/dev-tools/kunit/running_tips.html#generating-code-coverage-reports-under-uml
It also includes pointers on how to use lcov to process the .gcda files.
I wrote it before --kconfig_add existed, so it just looks a bit different.

The main blockers to directly supporting this in kunit.py are
1.) this only works on UML
2.) it needs gcc-6 or lower (and the kernel's min version is 5.1, iirc)...
3.) in kernels older than 5.14, this requires some more hacks to get
working. So for the large portion of us stuck dealing with somewhat
older kernels, we'd have to do stuff manually anyway.

For #1, we'd need different kconfig options and kunit.py's QEMU would
need some sort of userspace (busybox should be sufficient).
For #2, I don't recall what the precise issues were anymore. But I
think there were some more issues in gcc 8 or 9... :(

>
> >
> > 3) intersected that with the total diff
>
> This would also be cool to do automatically with a revision range.

Hmm, can you elaborate?
I assume you mean other revision ranges beyond this patch set?

My script roughly looks like

$ incremental_cli --diff_file=a.diff --lcov_file=coverage.info
I can generate a.diff in any way I want.

For these numbers I did
$ git diff clk-next/clk-next > a.diff
But I could do
$ git diff HEAD~3 > a.diff
or anything else.

Just need to make sure the endpoint of the range is the one we
generated coverage at so the line #s match up.

So if you have some specific requests, I can get those generated as well.

I would share my incremental_cli script, but it depends on some
internal code (an LCOV parser).
I don't quite understand how to use lcov's --diff option, but maybe it
supports this?
I just saw "to merge coverage data from different source code levels"
in the man page and figured it wasn't relevant.

>
> >
> > Incremental coverage for 3/9 files in --diff_file
> > Total incremental: 99.29% coverage (281/283 lines)
> >   drivers/clk/clk.c: 84.62% coverage (11/13 lines)
> >   drivers/clk/clk_test.c: 100.00% coverage (269/269 lines)
> >   include/linux/clk.h: 100.00% coverage (1/1 lines)
> >
> > Missing lines are drivers/clk/clk.c:2397-8, i.e. this part of the diff:
> > +       if (ret) {
> > +               /* rollback the changes */
> > +               clk->min_rate = old_min; <- 2397
> > +               clk->max_rate = old_max; <- 2398
> >
> > These are from before and were just moved around.
>
> We could trigger a failure in the provider when the rate is set, and
> then we could call round_rate() again and make sure the boundaries from
> before are maintained.
