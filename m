Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4089890DED1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 00:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C6A610E7D7;
	Tue, 18 Jun 2024 21:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Tx7WrC8p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAE0410E7D7;
 Tue, 18 Jun 2024 21:59:55 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-6bfd4b88608so4277389a12.1; 
 Tue, 18 Jun 2024 14:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718747995; x=1719352795; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EU04kyl3dHWSxH/GsSb9jqBAdB+bRNmG9gEcHnqB7Kc=;
 b=Tx7WrC8p0lzm1ZqsHX7xis8PHBYBs3RhkuhhTDwWj0mftxvGPgoEFTaxUrHW34XNmc
 74aJGUnKLVomCJuXA1JS/6skaGwjka7b4/btgzYZJ0KZiBM8jdkkU+Nbsj/ePov6gl9E
 XgeWHJD9xup9HKU3HUewP4Acxfg6DuihZklvnNuZEe8sOVDZi5FwGp4Jwr3Uf2m8uCO1
 MgbFpRLTjtjln39+APiONd6JZbBdLBwW7onfIf/cjxjX9dDTrje/FfDNvvhu85dIoNTR
 wAeStNs5eObs05NJG0hc0xFIzGFHmgAWwU0NEijOYXPl5MPkfp31RUa3Dzp/R02um7dt
 tQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718747995; x=1719352795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EU04kyl3dHWSxH/GsSb9jqBAdB+bRNmG9gEcHnqB7Kc=;
 b=pt9Hby+oqBB7CMLKkyvuW1lmR4wkU5Uvw6GgpT/BzYAEBUD8Qp+0zJeCt88iFSkjvU
 niwLIkWqHu8fJqh4dKilo6SIpo942IZNvH7I8SD5nDlvep9Kw6Sdu30osehjd7VbSfb3
 2IfnmHGi6HSP0sLiTvkG+nosc7sUm8WZOFf2rRNbi2o696iGGoto6kPytijSFAoRHH2k
 51J67QrVVeq8+XSzhPuN71dGlb1ZxNcPkwEPzqdQQFQ/wNQd2YTAoOGDXqX7qaAw5Q5C
 xBadB3fhbjSp1SdHPU0zvccV0wP0jmeMchK4RgN4oasaCQdpApqbLwt1HVwjZHFn/yJs
 n7OA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7Xga2DsxE/zgSySBsTG4nFVf+qSS+1rvj+UqE3mg+KPTPtN84UhuT9IkKIBfZ0TofH6qB2aYcEJTGfN/8UsNaXcHlvmfdq2Ksr7JXig==
X-Gm-Message-State: AOJu0YyZguqI9+HYerblLYffT/JWqeF9egePYX7H0GeQf4vlOhfV2P4l
 U9MJZ30RH4Gm/1UTUzmB/Z+ivlpT/jK78slU1oqw5/wIFy7zVAlljK1H01rnra1mywWbNpKuPqt
 NAhgcqqtbGb/44oJWBKZetvXBZDc=
X-Google-Smtp-Source: AGHT+IGUaN7fpnj3ApZQ62pMjYcLw04OWKvr2yhL4FC1FgiK4tzz22/Z/RNOhLM8SD08NUIzF7HXcASRVABBvHBJOJA=
X-Received: by 2002:a17:90a:d484:b0:2c2:c799:eb20 with SMTP id
 98e67ed59e1d1-2c7b5c982demr1066657a91.23.1718747994883; Tue, 18 Jun 2024
 14:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240612222435.3188234-1-dianders@chromium.org>
 <20240612152752.v2.8.I27914059cc822b52db9bf72b4013b525b60e06fd@changeid>
 <CADnq5_PbqE0E2pP26mGD94cdc=tLZZsF10e7ZZWeC5AU-LS8vw@mail.gmail.com>
 <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
In-Reply-To: <CAD=FV=XJAiVGFn_Tqs_JNo1fQKFys3m=hH9MwmMot93gkdg=Qw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Jun 2024 17:59:42 -0400
Message-ID: <CADnq5_M+H_h1Me_O3u=R3q52PgYcCwwY9Mr8_R1eX0G7HvBp2w@mail.gmail.com>
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

On Tue, Jun 18, 2024 at 5:40=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
>
> On Mon, Jun 17, 2024 at 8:01=E2=80=AFAM Alex Deucher <alexdeucher@gmail.c=
om> wrote:
> >
> > On Wed, Jun 12, 2024 at 6:37=E2=80=AFPM Douglas Anderson <dianders@chro=
mium.org> wrote:
> > >
> > > Based on grepping through the source code this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown
> > > time. Among other things, this means that if a panel is in use that i=
t
> > > won't be cleanly powered off at system shutdown time.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case
> > > of OS shutdown/restart comes straight out of the kernel doc "driver
> > > instance overview" in drm_drv.c.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Xinhui Pan <Xinhui.Pan@amd.com>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > ---
> > > This commit is only compile-time tested.
> > >
> > > ...and further, I'd say that this patch is more of a plea for help
> > > than a patch I think is actually right. I'm _fairly_ certain that
> > > drm/amdgpu needs this call at shutdown time but the logic is a bit
> > > hard for me to follow. I'd appreciate if anyone who actually knows
> > > what this should look like could illuminate me, or perhaps even just
> > > post a patch themselves!
> >
> > I'm not sure this patch makes sense or not.  The driver doesn't really
> > do a formal tear down in its shutdown routine, it just quiesces the
> > hardware.  What are the actual requirements of the shutdown function?
> > In the past when we did a full driver tear down in shutdown, it
> > delayed the shutdown sequence and users complained.
>
> The "inspiration" for this patch is to handle panels properly.
> Specifically, panels often have several power/enable signals going to
> them and often have requirements that these signals are powered off in
> the proper order with the proper delays between them. While we can't
> always do so when the system crashes / reboots in an uncontrolled way,
> panel manufacturers / HW Engineers get upset if we don't power things
> off properly during an orderly shutdown/reboot. When panels are
> powered off badly it can cause garbage on the screen and, so I've been
> told, can even cause long term damage to the panels over time.
>
> In Linux, some panel drivers have tried to ensure a proper poweroff of
> the panel by handling the shutdown() call themselves. However, this is
> ugly and panel maintainers want panel drivers to stop doing it. We
> have removed the code doing this from most panels now [1]. Instead the
> assumption is that the DRM modeset drivers should be calling
> drm_atomic_helper_shutdown() which will make sure panels get an
> orderly shutdown.
>
> For a lot more details, see the cover letter [2] which then contains
> links to even more discussions about the topic.
>
> [1] https://lore.kernel.org/r/20240605002401.2848541-1-dianders@chromium.=
org
> [2] https://lore.kernel.org/r/20240612222435.3188234-1-dianders@chromium.=
org

I don't think it's an issue.  We quiesce the hardware as if we were
about to suspend the system (e.g., S3).  For the display hardware we
call drm_atomic_helper_suspend() as part of that sequence.

Alex
