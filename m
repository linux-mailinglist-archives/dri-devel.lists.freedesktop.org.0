Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84C890EF72
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 15:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC6710E26E;
	Wed, 19 Jun 2024 13:53:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KkL9ObhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5DF10E252;
 Wed, 19 Jun 2024 13:53:24 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-70109d34a16so5836133b3a.2; 
 Wed, 19 Jun 2024 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718805204; x=1719410004; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=raeXeI6lwsevNLvXbd1wYh1qsMJosT/xi6mC5/F+he0=;
 b=KkL9ObhBoJHJIuNhP6wzfWuxCTN0phh4VUiYKPGXYhp14G/KIYYU5LWwZYYEL4oTbK
 CfbHlCvve/vkagwBAsPYUenxocIITkZMkvl1nl1KyIBR4xUBzVxroxdWo+yYs/6uzeAm
 qCm81GFd5aMEMmAQafMY7OPvvD3XrOX6ZgL7KUS6luMDzoOTxCNJBTV9lQwv8i/ua9Gh
 DLHSwIAeN9xWedZfFNJAMzxKGK+MZCbDjjbbNJ2mDfl/3Gvmyw3gyQBylBWPlrYfEV+c
 ygRW+36Uy9QkviHc+Cm1JjXCJq0ONdZKAWAnYWlNYoM0FqHNSnZvaoVFcX+/8muFhqB7
 jecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718805204; x=1719410004;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=raeXeI6lwsevNLvXbd1wYh1qsMJosT/xi6mC5/F+he0=;
 b=FT36JwsgTLnjD6yDIxLhrdIzlX6IK13jrl5va5SuCPBDkOVsfLjIjTaRLTq5kb0K6V
 mKlK3Bt81+/ankhy56iCj183ZId7iRAoneYJUEkhCQ2dtJjQv0JzlA/KX0TXWpyI/zsI
 OZf3wD6A9ZgXTIVJCBcgmWcVD6t+tFx2p0uojH/sFjsT9ZJLbD02JttOXAaoakTQL5Od
 2AOzivmY32TVNgl61va2ELaSv4K9dpd+jzkNmtj1F3opIJsniflayEomVN0hH16WiP2m
 k3XsmIzTzXsih1to0/b+Wy7lec5mc+Be2cjBPqWAvipvlErIVA194M2X7XTp9s5030Q0
 BAvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTnqk643fw8iCKYnrq2pIn0lKacw98UVn/G+WIO/k0TQz0zAuu46O+qwjBOF1HgqS0925wuLEFDdemc9TEYWxeBJUcAx+A0WblDhMlQg==
X-Gm-Message-State: AOJu0Yx6vFx9RHxnGNUXc2z1uHLxXRQm6WReBKEjp8QRJ4DHAqMPUx5w
 dNiDOe2t5JqBmbVr/GpKsIOrvpChLA6RVIX+L53Ot8ak3IMumwtPJ9enkNBxPwxDRM4BKTB8trN
 g/WlrXyP9JRs2xDQFQ3Jt+gbUKDA=
X-Google-Smtp-Source: AGHT+IGfmLwqL/WkyQUnXfiuN9AiOOQ44qs6v6SXVcDXsEMS0iiTxBl8WlPuS7Nozytf9SFo6IkiWknJVQCz/uGDszY=
X-Received: by 2002:a05:6a20:9313:b0:1b8:5c3c:794f with SMTP id
 adf61e73a8af0-1bcbb3a0026mr2432960637.10.1718805203901; Wed, 19 Jun 2024
 06:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
 <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
 <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
 <CAD=FV=X=9PV+zbmd2S-TBBxq+yQZ2D+-cCHjFX-gm-f+DyXXiQ@mail.gmail.com>
 <CADnq5_OXUKj=bfK0NOAhOzmhYCSnQXbxHbwLOaBQ6wFX033Wgw@mail.gmail.com>
In-Reply-To: <CADnq5_OXUKj=bfK0NOAhOzmhYCSnQXbxHbwLOaBQ6wFX033Wgw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jun 2024 09:53:12 -0400
Message-ID: <CADnq5_O1EGj-_xx7LuiXSVY7MSmfS7_1-hqShFk6Deu1wsBwOA@mail.gmail.com>
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

On Wed, Jun 19, 2024 at 9:50=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Tue, Jun 18, 2024 at 7:53=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Jun 18, 2024 at 3:00=E2=80=AFPM Alex Deucher <alexdeucher@gmail=
.com> wrote:
> > >
> > > On Tue, Jun 18, 2024 at 5:40=E2=80=AFPM Doug Anderson <dianders@chrom=
ium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > >
> > > > On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeucher@g=
mail.com> wrote:
> > > > >
> > > > > On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <diander=
s@chromium.org> wrote:
> > > > > >
> > > > > > Based on grepping through the source code this driver appears t=
o be
> > > > > > missing a call to drm_atomic_helper_shutdown() at system shutdo=
wn
> > > > > > time. Among other things, this means that if a panel is in use =
that it
> > > > > > won't be cleanly powered off at system shutdown time.
> > > > > >
> > > > > > The fact that we should call drm_atomic_helper_shutdown() in th=
e case
> > > > > > of OS shutdown/restart comes straight out of the kernel doc "dr=
iver
> > > > > > instance overview" in drm_drv.c.
> > > > > >
> > > > > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > > > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > ---
> > > > > > This commit is only compile-time tested.
> > > > > >
> > > > > > ...and further, I'd say that this patch is more of a plea for h=
elp
> > > > > > than a patch I think is actually right. I'm _fairly_ certain th=
at
> > > > > > drm/amdgpu needs this call at shutdown time but the logic is a =
bit
> > > > > > hard for me to follow. I'd appreciate if anyone who actually kn=
ows
> > > > > > what this should look like could illuminate me, or perhaps even=
 just
> > > > > > post a patch themselves!
> > > > >
> > > > > I'm not sure this patch makes sense or not.  The driver doesn't r=
eally
> > > > > do a formal tear down in its shutdown routine, it just quiesces t=
he
> > > > > hardware.  What are the actual requirements of the shutdown funct=
ion?
> > > > > In the past when we did a full driver tear down in shutdown, it
> > > > > delayed the shutdown sequence and users complained.
> > > >
> > > > The "inspiration" for this patch is to handle panels properly.
> > > > Specifically, panels often have several power/enable signals going =
to
> > > > them and often have requirements that these signals are powered off=
 in
> > > > the proper order with the proper delays between them. While we can'=
t
> > > > always do so when the system crashes / reboots in an uncontrolled w=
ay,
> > > > panel manufacturers / HW Engineers get upset if we don't power thin=
gs
> > > > off properly during an orderly shutdown/reboot. When panels are
> > > > powered off badly it can cause garbage on the screen and, so I've b=
een
> > > > told, can even cause long term damage to the panels over time.
> > > >
> > > > In Linux, some panel drivers have tried to ensure a proper poweroff=
 of
> > > > the panel by handling the shutdown() call themselves. However, this=
 is
> > > > ugly and panel maintainers want panel drivers to stop doing it. We
> > > > have removed the code doing this from most panels now [1]. Instead =
the
> > > > assumption is that the DRM modeset drivers should be calling
> > > > drm_atomic_helper_shutdown() which will make sure panels get an
> > > > orderly shutdown.
> > > >
> > > > For a lot more details, see the cover letter [2] which then contain=
s
> > > > links to even more discussions about the topic.
> > > >
> > > > [1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@chr=
omium.org
> > > > [2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders@chr=
omium.org
> > >
> > > I don't think it's an issue.  We quiesce the hardware as if we were
> > > about to suspend the system (e.g., S3).  For the display hardware we
> > > call drm_atomic_helper_suspend() as part of that sequence.
> >
> > OK. It's no skin off my teeth and we can drop this patch if you're
> > convinced it's not needed. From the point of view of someone who has
> > no experience with this driver it seems weird to me that it would use
> > drm_atomic_helper_suspend() at shutdown time instead of the documented
> > drm_atomic_helper_shutdown(), but if it works for everyone then I'm
> > not gonna complain.
>
> I think the problem is that it is not clear exactly what the
> expectations are around the PCI shutdown callback.  The documentation
> says:
>
> "Hook into reboot_notifier_list (kernel/sys.c). Intended to stop any
> idling DMA operations. Useful for enabling wake-on-lan (NIC) or
> changing the power state of a device before reboot. e.g.
> drivers/net/e100.c."

Arguably, there is no requirement to even touch the display hardware
at all.  In theory you could just leave the display hardware as is in
the current state.  The system will either be rebooting or powering
down anyway.

Alex

>
> We tried a full driver teardown in the shutdown callback and it added
> a lot of latency that really wasn't needed since the system was just
> going into a reboot or power down.  The best middle ground was to just
> leverage our hw level suspend code to quiesce the hardware.  Adding
> complexity to call drm_atomic_helper_suspend() vs
> drm_atomic_helper_shutdown() doesn't seem worth it since the functions
> do pretty much the same thing (both call
> drm_atomic_helper_disable_all()).  Maybe it's better to update the
> documentation to recommend drm_atomic_helper_suspend() if drivers want
> to leverage their suspend code?
>
> Alex
