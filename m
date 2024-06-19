Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3690EF5D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 15:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48BAB10E735;
	Wed, 19 Jun 2024 13:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Np+IrezL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86CC10E735;
 Wed, 19 Jun 2024 13:50:18 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2c31144881eso5366313a91.1; 
 Wed, 19 Jun 2024 06:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718805018; x=1719409818; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2ZTQnv09PBqGC+05GHEbv1DDrULxaj/6Q8hEp1369So=;
 b=Np+IrezLtiEf/h43Fynf6qDMO3Z9caqw7o8c8mVnlMy6PeL7UDFePTjPFZCO2h640i
 NydIzXvgSD1QWVe2RqRjgaUKUDCWbhh7IgTSkxuN6yOQwYGbsCCNiQ6ZUlTyB//unFh4
 Cjb1p71pLDeyGtdYBoX8hRV5lB1Mrn3ETY28YckPlyQ+/j1ppsOyd6IoNBGA/EQUIS7S
 kqT7gv0EuT1nJFIs3dRVZDzdEyt8rMzGo/1y7Lcd1YSjGC2IEZrVtwIqg5KFqV8huJT/
 mCrmtEOAwF6D+q+OdpR8cCpH+BduMlNL0RfpP47MPgiI5AoRYxGKmRqnvAa92D6wBHsI
 UC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718805018; x=1719409818;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2ZTQnv09PBqGC+05GHEbv1DDrULxaj/6Q8hEp1369So=;
 b=KCHti9H8eDZjMEwHtkifCVC3836cqhTM+nDhFzF3kMGnTX8JsHeW9TD0fWqoXfPdFL
 znpyhtsPl3ReGckoo3TYBNxsOoFPDIuVXkeF4s8x20pvwxkvZq9IWjyNK0uLybVWtugd
 +2hPu5ajFuxkmZGlLNMJ0vyrzJercqgbnzDjZXxKeqRar8UXGAK1hq+PqHU8C1OiNDX9
 XdQYyJW9N6lSipx8l5WVc4AXifxkAARaVQedwmnOk7O5yp6KOaRWH8OFNkUtDXje78ai
 ODEOYg3TXAvIG9+VRwKBcZblj3oJkydr/1FrDUScqr3PAyw2GVRpT9SIor256mzdMW/i
 V7xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaQOl60x39xzYbM4ndaZNtouHlKiSYu9ByzfQz0jy7wWB0W13a0jGcIFjNvJwV9ybUWvlNsWjSXZa2zO5R4G6YLqKxVXljiS7VW7jgyQ==
X-Gm-Message-State: AOJu0YxPU2xwI86ERETH9k0KLR6EUo3H0QQAnB66/3mVIzCu6YBYFKU2
 vS0pFt9+TJEGKIL00pEWa6T/xWi62pmSG6EPUXr2CgfssXpPsIEEmBWsVLHULmuK1HfzFsdxXma
 kyFhWcgc7bIimgitFxhI7UaQuCa0=
X-Google-Smtp-Source: AGHT+IG+EvjSwtHF5waL+ZwqlIuQEUJpqivfp1yeEtKYVKZW125eUYnfAcDvUfWdFV1Joj5SA9tawyCp/iqpv6kF8T0=
X-Received: by 2002:a17:90a:c70e:b0:2c3:1234:8bbb with SMTP id
 98e67ed59e1d1-2c7b5d7bfaamr2652814a91.38.1718805017816; Wed, 19 Jun 2024
 06:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
 <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
 <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
 <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
In-Reply-To: <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jun 2024 09:50:05 -0400
Message-ID: <CADnq5_OXUKj=bfK0NOAhOzmhYCSnQXbxHbwLOaBQ6wFX033Wgw@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/amdgpu: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Doug Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Candice Li <candice.li@amd.com>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Victor Lu <victorchengchi.lu@amd.com>, amd-gfx@lists.freedesktop.org, 
 chenxuebing <chenxb_99091@126.com>, linux-kernel@vger.kernel.org
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

On Tue, Jun 18, 2024 at 7:53=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Jun 18, 2024 at 3:00=E2=80=AFPM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Tue, Jun 18, 2024 at 5:40=E2=80=AFPM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > >
> > > On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeucher@gma=
il.com> wrote:
> > > >
> > > > On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <dianders@=
chromium.org> wrote:
> > > > >
> > > > > Based on grepping through the source code this driver appears to =
be
> > > > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > > > time. Among other things, this means that if a panel is in use th=
at it
> > > > > won't be cleanly powered off at system shutdown time.
> > > > >
> > > > > The fact that we should call drm_atomic_helper_shutdown() in the =
case
> > > > > of OS shutdown/restart comes straight out of the kernel doc "driv=
er
> > > > > instance overview" in drm_drv.c.
> > > > >
> > > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > ---
> > > > > This commit is only compile-time tested.
> > > > >
> > > > > ...and further, I'd say that this patch is more of a plea for hel=
p
> > > > > than a patch I think is actually right. I'm _fairly_ certain that
> > > > > drm/amdgpu needs this call at shutdown time but the logic is a bi=
t
> > > > > hard for me to follow. I'd appreciate if anyone who actually know=
s
> > > > > what this should look like could illuminate me, or perhaps even j=
ust
> > > > > post a patch themselves!
> > > >
> > > > I'm not sure this patch makes sense or not.  The driver doesn't rea=
lly
> > > > do a formal tear down in its shutdown routine, it just quiesces the
> > > > hardware.  What are the actual requirements of the shutdown functio=
n?
> > > > In the past when we did a full driver tear down in shutdown, it
> > > > delayed the shutdown sequence and users complained.
> > >
> > > The "inspiration" for this patch is to handle panels properly.
> > > Specifically, panels often have several power/enable signals going to
> > > them and often have requirements that these signals are powered off i=
n
> > > the proper order with the proper delays between them. While we can't
> > > always do so when the system crashes / reboots in an uncontrolled way=
,
> > > panel manufacturers / HW Engineers get upset if we don't power things
> > > off properly during an orderly shutdown/reboot. When panels are
> > > powered off badly it can cause garbage on the screen and, so I've bee=
n
> > > told, can even cause long term damage to the panels over time.
> > >
> > > In Linux, some panel drivers have tried to ensure a proper poweroff o=
f
> > > the panel by handling the shutdown() call themselves. However, this i=
s
> > > ugly and panel maintainers want panel drivers to stop doing it. We
> > > have removed the code doing this from most panels now [1]. Instead th=
e
> > > assumption is that the DRM modeset drivers should be calling
> > > drm_atomic_helper_shutdown() which will make sure panels get an
> > > orderly shutdown.
> > >
> > > For a lot more details, see the cover letter [2] which then contains
> > > links to even more discussions about the topic.
> > >
> > > [1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@chrom=
ium.org
> > > [2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders@chrom=
ium.org
> >
> > I don't think it's an issue.  We quiesce the hardware as if we were
> > about to suspend the system (e.g., S3).  For the display hardware we
> > call drm_atomic_helper_suspend() as part of that sequence.
>
> OK. It's no skin off my teeth and we can drop this patch if you're
> convinced it's not needed. From the point of view of someone who has
> no experience with this driver it seems weird to me that it would use
> drm_atomic_helper_suspend() at shutdown time instead of the documented
> drm_atomic_helper_shutdown(), but if it works for everyone then I'm
> not gonna complain.

I think the problem is that it is not clear exactly what the
expectations are around the PCI shutdown callback.  The documentation
says:

"Hook into reboot_notifier_list (kernel/sys.c). Intended to stop any
idling DMA operations. Useful for enabling wake-on-lan (NIC) or
changing the power state of a device before reboot. e.g.
drivers/net/e100.c."

We tried a full driver teardown in the shutdown callback and it added
a lot of latency that really wasn't needed since the system was just
going into a reboot or power down.  The best middle ground was to just
leverage our hw level suspend code to quiesce the hardware.  Adding
complexity to call drm_atomic_helper_suspend() vs
drm_atomic_helper_shutdown() doesn't seem worth it since the functions
do pretty much the same thing (both call
drm_atomic_helper_disable_all()).  Maybe it's better to update the
documentation to recommend drm_atomic_helper_suspend() if drivers want
to leverage their suspend code?

Alex
