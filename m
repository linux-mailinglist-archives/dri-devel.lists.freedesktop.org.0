Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE560FB30
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 17:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A486B10E66C;
	Thu, 27 Oct 2022 15:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5911D10E66D;
 Thu, 27 Oct 2022 15:08:21 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id r187so2416996oia.8;
 Thu, 27 Oct 2022 08:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oFxxpy4mBiTGbA8Urb6+jYa8httGkN9zEAwB6ejK4z8=;
 b=dL4yheaZKoLLsvZtD/rudYwoTWO8Shubm5iG7FPLSygXtdr26GXTz05D5DuTt/Evqk
 RreJ93OzYNoKPsffbuWIpmUbsJ25GLe9eKcbsVaIT+LabbpvjqyTowQvGRbvzCaIWh2D
 MuvmGsfL726UZicv+IDU2w/KqyxSwLVF+PZFFbzTvaPKKot5S0aSFWO3sKnj1UwjAwYJ
 s++Zci6pvj+rGFI93s+TdbqtSdApiQKGW+Jxbu5qD7XYuuYYczwJ0File3bcvCaeWHnU
 roObsi/1IfIljPXJsDXrPXr+pu9hd/ejGs56h7+PucXtXTNd4m6tRkHCRj5ZKj0CqPUW
 GBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oFxxpy4mBiTGbA8Urb6+jYa8httGkN9zEAwB6ejK4z8=;
 b=SRjGQXCbx6Pru2hpGiBA11c4v9IBpf8MeLT3tRdGcd5/bG4Qn5aEAZCJTxyEOtFka0
 413siIxVyRodHImUzDMv+PbPHHyjf+rM19w124cM04qD5a4Xg2MuJhIXZjd7EB5guRVt
 fsY+9skIKVqehi64M5M7Daqqx0uwHQc18PAg7p9bZyQa+4MGGhfBAV/fWfvDTZ+7goXU
 HKIMbeGyw9MzH+kU1gOuJ2Do7+QyCCEpDyy3CvnmtD6gsACxGWsxzOEq8WYnwzDlBaab
 Wn2zhkQrFgbOdHx0x5DX1YbRl2MgX1QfUXqdGIYzi14QrEpLBbR18ocDMxXvfX41CEv1
 Lmlw==
X-Gm-Message-State: ACrzQf1/mEKhSpQpLllrSwo6mtwmxM4k6pWTRcoVVsg8VNd3i57fiqUh
 8PpUwESf4vH5ynXSM+fcwgDyI93quFBxSfbow/4=
X-Google-Smtp-Source: AMsMyM5vwkSQkE9dbmNDc08RzSLZSkdC3RvNYZ0ZBIFc68Fo09rzMFXbz0CbHnOq248p5lXxu6g+7lg8e3PpBMIjAJo=
X-Received: by 2002:a05:6808:30a5:b0:359:bee8:9957 with SMTP id
 bl37-20020a05680830a500b00359bee89957mr1707418oib.38.1666883300401; Thu, 27
 Oct 2022 08:08:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <20221026081711.zj7h2rpfd4kfkpqe@houat>
In-Reply-To: <20221026081711.zj7h2rpfd4kfkpqe@houat>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 27 Oct 2022 08:08:28 -0700
Message-ID: <CAF6AEGs3j7wmjM10o2Dpw4mgTJC7L4SXHPZkJm_DjeQVG5H_vA@mail.gmail.com>
Subject: Re: Must-Pass Test Suite for KMS drivers
To: maxime@cerno.tech
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Arkadiusz Hiler <arek@hiler.eu>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 26, 2022 at 1:17 AM <maxime@cerno.tech> wrote:
>
> Hi Rob,
>
> On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> > On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > > I've discussing the idea for the past year to add an IGT test suite that
> > > all well-behaved KMS drivers must pass.
> > >
> > > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > > that are being used to validate that the drivers are sane.
> > >
> > > We should probably start building up the test list, and eventually
> > > mandate that all tests pass for all the new KMS drivers we would merge
> > > in the kernel, and be run by KCi or similar.
> >
> > Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> > first, that already gives us a mechanism similar to what we use in
> > mesa to track pass/fail/flake
>
> I'm not sure it's a dependency per-se, and I believe both can (and
> should) happen separately.

Basically my reasoning is that getting IGT green is a process that so
far is consisting of equal parts IGT test fixes, to clear out
lingering i915'isms, etc, and driver fixes.  Yes, you could do this
manually but the drm/ci approach seems like it would make it easier to
track, so it is easier to see what tests are being run on which hw,
and what the pass/fail/flake status is.  And the expectation files can
also be updated as we uprev the igt version being used in CI.

I could be biased by how CI has been deployed (IMHO, successfully) in
mesa.. my experience there doesn't make me see any value in a
"mustpass" list.  But does make me see value in automating and
tracking status.  Obviously we want all the tests to pass, but getting
there is going to be a process.  Tracking that progress is the thing
that is useful now.

BR,
-R

> AFAIU, the CI patches are here to track which tests are supposed to be
> working and which aren't so that we can track regressions.
>
> The list I was talking about is here to identify issues in the first
> place. All tests must pass, and if one fails it should be considered a
> hard failure.
>
> This would be eligible for CI only for drivers which have been known to
> pass them all already, but we wouldn't need to track which ones can fail
> or not, all of them must.
>
> > Beyond that, I think some of the igt tests need to get more stable
> > before we could consider a "mustpass" list.
>
> I agree that IGT tests could get more stable on ARM platforms, but it's
> also a chicken-and-egg issue. If no-one is using them regularly on ARM,
> then they'll never get fixed.
>
> > The kms_lease tests seem to fail on msm due to bad assumptions in the
> > test about which CRTCs primary planes can attach to. The legacy-cursor
> > crc tests seem a bit racy (there was a patch posted for that, not sure
> > if it landed yet), etc.
>
> And this is fine, we can merge that list without them, and if and when
> they get stable, we'll add them later.
>
> > The best thing to do is actually start running CI and tracking xfails
> > and flakes ;-)
>
> Again, I wouldn't oppose them.
>
> The issue I'm trying to solve is that there's just no way to know, at
> the moment:
>
>   - When you're running IGT, which tests are relevant for your platform
>     exactly.
>
>   - If some of them fail, is it expected for them to fail or not. The
>     ci/ patch you mentioned help for that a bit, but only for platforms
>     where someone already did that work. When you want to do that work
>     in the first place, it's extremely tedious and obscure.
>
>   - And if some of them fail, is it something that I should actually fix
>     or not.
>
> The mustpass list addresses all those issues by providing a baseline.
>
> Maxime
