Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EBBACDEC6
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 15:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48A410E799;
	Wed,  4 Jun 2025 13:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="boNdv8mY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6398410E799
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 13:15:28 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-312cdbc67c9so364484a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749042928; x=1749647728; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nCYLMPKdnlJAYQpTMAISS2z8W8fxShU0rt9Uc0iK4rE=;
 b=boNdv8mYgH691zuuUJmdMMrNjaHnT4r1haNCwMC6MOQuuFFhiDC1pxO9a1zjU0B/s6
 ARl3UfTPPSWOU7AlUjFu+O7SSyYHyy8rfKplaOu8f/bTLNMv6UEnivCPYqwVoB9nuhDj
 D/TiHTS9FkqHpNlWsi8wF0ZWQNsupaoOCIuWwGsKoJxSYKY6SA7/56xadE9jEs/wj2Cm
 okOV320kLGHYWRfg3iTqsktcnDaJ7sHHOj40OyJz6XPoXg5ICw8sdLxpNVEHl7WPr3D1
 IcZ7lVQeHyFNZ7jzo5cmvnIrfTUTA70v6oXC+wa/ErbekbnPA2J+dTBWy+Sro+Z80G1g
 iD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749042928; x=1749647728;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nCYLMPKdnlJAYQpTMAISS2z8W8fxShU0rt9Uc0iK4rE=;
 b=GO+sMQKrm8gvQAuPhhG65hTP93M4j100bV3qH+K67fR2BK3zDeRjV3yyY8sPQLF4qV
 +tTw6434LnOXP7UBWYUTKHZeQwuVPkonyK4s7RMKSwsUxmQ8KX5PFpQ2vnq4dq8pXjpT
 fIPQUrkAjiKQU3sK5Op+hvePC9n6b+uoTIrS37w2va+/PJBPDMdalrzU4xaFufHo5QbH
 efEivGCu5dIcJYDuZzBCZbQqyJSozXGVt7WOR/r4wJSNBYRGj7OuT18613FJSrQvhevB
 MwXh6wIaH4xofLEpgxOKCJyv3Aud1U+W/oaSJt2pcZkDKik/PSqlxaQ4nps0pSj5iVII
 rX+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpjjuqpr6clAq9UUyObLlxbEG21j5SXu9803oArao/z1UdP/0mh0ScLiWNmGnTmEtO5QqUj5cfNSI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx02HMiiCqHF7cpQJ201wwdceefI1U+TQ/PN/og9nUHHFCKh+pJ
 au4R8Ky0yW+VLmixl3KmAhnCTXWwOkmJ851Og/e0Qt32anaOCDtqF7Ukpm3ROP5JgvSt9cuwVTO
 /vr+U6PSRW9LWd/kZCYV/EsT1yQlwDuA=
X-Gm-Gg: ASbGncuQgx54v4LwqRuFn058hM8sdF8rlfTCHs3EZztwjcJ/YeSoMmpZcr707LgNKf/
 2WqvWJkHNk+2IWaJFoqTBzGsPaLiQ4sEswsoWtYx/rvz1E9qSEt+zGJSr+b4UeOPKTJKp0bOAB4
 bGQFiVyZxBUcaFjsasqKmZDtetaiNJ5qGvIvchD47N9OHb
X-Google-Smtp-Source: AGHT+IGRHI4o8ybBMUjDV6E0tY5UJVBxXL9jqEzcy9tCSWUQBQmpNBLSLxj/yZy+6XAHVSmlV5mVgJkFbvSw+wtCLvI=
X-Received: by 2002:a17:90b:5287:b0:312:1d2d:18f8 with SMTP id
 98e67ed59e1d1-3130ce4c202mr1598982a91.7.1749042927752; Wed, 04 Jun 2025
 06:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250530200918.391912-1-aurabindo.pillai@amd.com>
 <CADnq5_P1Wf+QmV7Xivk7j-0uSsZHD3VcoROUoSoRa2oYmcO2jw@mail.gmail.com>
 <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
In-Reply-To: <jn3rvqffhemwjltd6z5ssa2lfpszsw4w7c4kjmkqqbum6zqvmi@pv6x2rkbeys6>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 Jun 2025 09:15:14 -0400
X-Gm-Features: AX0GCFuEm4P-A96ElLoHLpKmMRORb3VPwCvqqXCZ8vKe0FEZcQbZ3Cs2mXrc2wY
Message-ID: <CADnq5_PHv+yxYqH8QxjMorn=PBpLekmLkW4XNNYaCN0iMLjZQw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/amd/display: more liberal vmin/vmax update
 for freesync"
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>, stable@vger.kernel.org, 
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
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

On Wed, Jun 4, 2025 at 5:40=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Alex,
>
> On Fri, May 30, 2025 at 04:14:09PM -0400, Alex Deucher wrote:
> > On Fri, May 30, 2025 at 4:09=E2=80=AFPM Aurabindo Pillai
> > <aurabindo.pillai@amd.com> wrote:
> > >
> > > This reverts commit 219898d29c438d8ec34a5560fac4ea8f6b8d4f20 since it
> > > causes regressions on certain configs. Revert until the issue can be
> > > isolated and debugged.
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4238
> > > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Already included in my -fixes PR for this week:
> > https://lists.freedesktop.org/archives/amd-gfx/2025-May/125350.html
>
> Note the way this was done isn't maximally friendly to our stable
> maintainers though.
>
> The commit in your tree (1b824eef269db44d068bbc0de74c94a8e8f9ce02) is a
> tad better than the patch that Aurabindo sent as it has:
>
>         This reverts commit cfb2d41831ee5647a4ae0ea7c24971a92d5dfa0d ...
>
> which at least is a known commit and has Cc: stable.
>
> However this is still a bit confusing as commit cfb2d41831ee has no Cc:
> stable, but a duplicate in mainline: f1c6be3999d2 that has Cc: stable.
>
> So f1c6be3999d2 was backported to 6.14.7 (commit
> 4ec308a4104bc71a431c75cc9babf49303645617), 6.12.29 (commit
> 468034a06a6e8043c5b50f9cd0cac730a6e497b5) and 6.6.91 (commit
> c8a91debb020298c74bba0b9b6ed720fa98dc4a9). But it might not be obvious
> that 1b824eef269db44d068bbc0de74c94a8e8f9ce02 needs backporting to trees
> that don't contain cfb2d41831ee (or a backport of it).
>
> Please keep an eye on that change that it gets properly backported.

DRM patches land in -next first since that is where the developers
work and then bug fixes get cherry-picked to -fixes.  When a patch is
cherry-picked to -fixes, we use cherry-pick -x to keep the reference
to the original commit and then add stable CC's as needed.  See this
thread for background:
https://lore.kernel.org/dri-devel/871px5iwbx.fsf@intel.com/T/#t

Alex

>
> Best regards
> Uwe
