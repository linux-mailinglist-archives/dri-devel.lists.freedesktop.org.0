Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0989BACE0F4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 17:09:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D202B10E128;
	Wed,  4 Jun 2025 15:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HrMKuExW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C253710E755
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 15:09:27 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-31306794b30so151153a91.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749049767; x=1749654567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rp7b9UWglKz6wOi8/Z6EppjceiKVGJSk3hfX62HZXNw=;
 b=HrMKuExWFA71YRqQBUqGE/GcxLOYAiAHZLL0gTZhdRdsaezGjsUWXA5ke/yAkLolQb
 Hm4LnFzvFDeZh7nr08ZX23OatMpQFibLC5hiU12Q2Q+nh+41L1GykET2wmOsBcE1hsYH
 y43YnYI0HE7MTX0LfmAdMjr2ZqurZA3tsRhrZme+Z9Hudq3CXwtene60HIfduZd1mIT6
 Qkw7h/5hndPyG0EbKaKjYcJz9k0rEkUg2w5bi4sFu3Fs+BzUeuJ0PzXKZd72B5YYgG9u
 PcNsqZNmX1EYGOfFmBf/kSzqR3qZTPBjLxcNBdsAuTyiCX1l511vjH2oUyJrUPn74b+C
 91aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749049767; x=1749654567;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rp7b9UWglKz6wOi8/Z6EppjceiKVGJSk3hfX62HZXNw=;
 b=EtZGlQwzTe31IXVqRNCcTfhWr2yj7V2cmJSMNnqwZdB2t9m80j41DXUnsm6rElrNlD
 9Gg5ixpwPMyNSRrvIeq1iN2Ki/kRV/HL1lfqu58sy92V2sV9Cl6Y6VjysidKwK/mHjmZ
 jmY6AnFVt1MaMH5tqt2uksFvmpcmRjFDm8img7jH7goOrz1sNkhKhCSXM8ucVo93Icez
 AcdLIdkLiSj3R6OgmuFiqiEaJDhRGpD4yXOhfbRD0U4Lv8E9ODbipmVatccx9O/THyYa
 ZXpwJLfboPNzFJxmgyJRYEnUYUaQOWKB+MLHZ0L1TBcsx/R9jPDR0lpOJYsHsT9OI4V2
 yPqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyNsh0Y9NKgfqzVdSHwo/fr/0rqfS+SUxTTNfp7CG2PnTMVnRTak63oeLUwYbRgarIkNB0ksH45Kw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwipPycESUw1oXspYzztfI08NkZR0RmR6SlCDf2hSxYPP5PEpEK
 YK5Y0GTl3/Ad3Km7LK7VwzHWIPuaeHBGFPleVFSe+TULy+9JD7c9SNo6pbs8MVc7OeHAAVZIlsB
 4ecgFmFMVfmt9DHvJsz2aL9EXDCS7Stc=
X-Gm-Gg: ASbGncsto8WjOQQOEyCBXMSzQjv+MfFf/wJ37H+iLiC+evUy1dnPI7gosCHe8iZn4eL
 +6Lghjg4ZjFVTg3RRph/cZctfx07NNz5EBx5Z00aqP/cFRr4+OhOLh/2xNuRKuUEiD4vC90RXhK
 fvlPs7UPIduE6vVKBhXrvFpNb7JA75T2AE9uyNeW7mvbfF
X-Google-Smtp-Source: AGHT+IGthoBbpaqBJcrGYHMDUW3KcRg4ercfQBsQMliy5ivIZJikYWNyrmxDmSk4vIwwl3Qj5v5xi3blOFwndRjH62w=
X-Received: by 2002:a17:90b:48c6:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-3130cabf1f7mr1711680a91.0.1749049767203; Wed, 04 Jun 2025
 08:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250530200918.391912-1-aurabindo.pillai@amd.com>
 <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
 <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
 <CADnq5_PHv+yxYqH8QxjMorn=PBpLekmLkW4XNNYaCN0iMLjZQw@mail.gmail.com>
 <2025060410-skinning-unguided-a3de@gregkh>
 <od2jpxazsa6ee6fqom7owcgh53lz3wjjjk4scoe2mxjzrytl7f@jwwwxfuo4pkj>
In-Reply-To: <od2jpxazsa6ee6fqom7owcgh53lz3wjjjk4scoe2mxjzrytl7f@jwwwxfuo4pkj>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jun 2025 11:09:15 -0400
X-Gm-Features: AX0GCFt2PBa2_eEVwZO7kfuI3uEXaUUmdBuNz1Ww735Vt7eI_4g4qnI1dSIpmks
Message-ID: <CADnq5_OdFQhokdysSHdeBca=UViCcqKWmfbedMAadWFWBiNE=Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, 
 stable@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 4, 2025 at 10:55=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Alex,
>
> On Wed, Jun 04, 2025 at 03:29:58PM +0200, Greg KH wrote:
> > On Wed, Jun 04, 2025 at 09:15:14AM -0400, Alex Deucher wrote:
> > > On Wed, Jun 4, 2025 at 5:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > <u.kleine-koenig@baylibre.com> wrote:
> > > > On Fri, May 30, 2025 at 04:14:09PM -0400, Alex Deucher wrote:
> > > > > Already included in my -fixes PR for this week:
> > > > > https://lists.freedesktop.org/archives/amd-gfx/2025-May/125350.ht=
ml
> > > >
> > > > Note the way this was done isn't maximally friendly to our stable
> > > > maintainers though.
> > > >
> > > > The commit in your tree (1b824eef269db44d068bbc0de74c94a8e8f9ce02) =
is a
> > > > tad better than the patch that Aurabindo sent as it has:
> > > >
> > > >         This reverts commit cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0=
d ...
> > > >
> > > > which at least is a known commit and has Cc: stable.
> > > >
> > > > However this is still a bit confusing as commit cfb2d41831ee has no=
 Cc:
> > > > stable, but a duplicate in mainline: f1c6be3999d2 that has Cc: stab=
le.
> > > >
> > > > So f1c6be3999d2 was backported to 6.14.7 (commit
> > > > 4ec308a4104bc71a431c75cc9babf49303645617), 6.12.29 (commit
> > > > 468034a06a6e8043c5b50f9cd0cac730a6e497b5) and 6.6.91 (commit
> > > > c8a91debb020298c74bba0b9b6ed720fa98dc4a9). But it might not be obvi=
ous
> > > > that 1b824eef269db44d068bbc0de74c94a8e8f9ce02 needs backporting to =
trees
> > > > that don't contain cfb2d41831ee (or a backport of it).
> > > >
> > > > Please keep an eye on that change that it gets properly backported.
>
> I'm not sure if my mail was already enough to ensure that
> 1b824eef269db44d068bbc0de74c94a8e8f9ce02 will be backported to stable,
> so that request still stands.
>
> > > DRM patches land in -next first since that is where the developers
> > > work and then bug fixes get cherry-picked to -fixes.  When a patch is
> > > cherry-picked to -fixes, we use cherry-pick -x to keep the reference
> > > to the original commit and then add stable CC's as needed.  See this
> > > thread for background:
> > > https://lore.kernel.org/dri-devel/871px5iwbx.fsf@intel.com/T/#t
>
> Yeah I thought so. The problem isn't per se that there are duplicates,
> but that they are not handled with the needed care. I don't know about
> Greg's tooling, but my confusion would have been greatly reduced if you
> reverted f1c6be3999d2 instead of cfb2d41831ee. That is the older commit
> (with POV =3D mainline) and the one that has the relevant information (Cc=
:
> stable and the link to cfb2d41831ee).

The revert cc'd stable so it should go to stable.  You can check the
cherry-picked commits to see what patches they were cherry-picked from
to see if you need to apply them to stable kernels.

>
> Getting this wrong is just a big waste of time and patience (or if the
> backport is missed results in systems breaking for problems that are
> already known and fixed).

Tons of patches end up getting cherry-picked to stable without anyone
even asking for them via Sasha's scripts.  Won't this cause the same
problem?

Alex
