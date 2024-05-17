Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C628C8989
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8310E135;
	Fri, 17 May 2024 15:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hp82z1Gm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D339810E0DE;
 Fri, 17 May 2024 15:46:28 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1eeabda8590so12153425ad.0; 
 Fri, 17 May 2024 08:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715960788; x=1716565588; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DgpuDYI8j+33tJ7Dk5uqzFwntZEb5ZpRgbewCzVqOoQ=;
 b=Hp82z1Gm0pb15NPEWPe+hL/lplITZSKkkHcAUUIoBXVmItMzAVqmnatp2tJx/3A9Zc
 b/VW1HcS5V8UTRP/V2EvRg4gJuaCdb6CD80PCD0RdfIUVcuCbWISP2+4CGgUTFx7SYuT
 iwGhOBAjTDKgVJUZolfRdfqjiznIFgaa96CQX28RKcElP2ffc7MdnnT2KbhMOiPmUqc4
 wF9ORtQ9cJyjh3OBvTGL+m0ikUs+NBdXT8fpuBru2Zkp2F1rt9cMAF/2nO9G0gZq7WV1
 7KIPAmSV2ltcDZ5Go4BY5j/JxSaE53nOh32bF8h9KBKOFEgYhzD2Jc2q3YlTOfQ1kjxV
 TpBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715960788; x=1716565588;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DgpuDYI8j+33tJ7Dk5uqzFwntZEb5ZpRgbewCzVqOoQ=;
 b=I/71tBWVxUzdH9FJXoRkr4pZnwGZxYw6Bt4Q7gfaCGUISiYSmLSjta61kucB2pzoYy
 jhSgPc5k+EOg1lemQdbi5gUfVda5GOBTv1NHEgmZboWj7V+8MZVpCmD3yJglE0qCG2YT
 LUvuw9O8+b24ARDPzXN17ujBHwkL2JtyaMAWZIdnFmAjM6/o08cYXvV0mjZFHPSj9XYj
 RbZuuD3uFZiNuU64DdacDlGNgGzmajfCVboyVV5Tl4A04iaemd6c1f6z7yS7wLJl/KWG
 bKvm58b7cnnCcVC0RhUfuG4v0uf0p73ezyoAOAooCCJKw9Smmym75slvAg1zTuF/8Q5L
 j2Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzqp9vOC/G0SvYJoSOzGv23qikw2i4rc9okrTiu+G9OOUrgRKOu4yyb0UTslJJm6WtcHNiKt43hQWQ9S6Xuvd6IcsYlVisJbAJ5IflN2Ymsc4/sF1PzZzpj91n8XItFYQVxVkChIVdPRDtEDtxqw==
X-Gm-Message-State: AOJu0Yzt2TK3tTpgGKS12XdQ/TelBqPJo760ZuTwjjugQAEUzEnagmXg
 JEAfq2sjtyMC6ThjzssdFdIFBxE3wuzdF3TbTgH6Uthi8FbG4hD4QoY4t3mt6MqJm5UF+yRdHl7
 tcr/iZy00947nSLaS4/lcibkSWbw=
X-Google-Smtp-Source: AGHT+IG4waejpOf/qZLwoj5ZE1TOjOYuV5JPU5s1UwIqmRNmcsyC3TIfxfK361yvR3M1Lc0rBKgAs5yjmvxDuRVdaMQ=
X-Received: by 2002:a17:90b:4f45:b0:2b1:534f:ea09 with SMTP id
 98e67ed59e1d1-2b6cc76d27amr21340210a91.23.1715960788222; Fri, 17 May 2024
 08:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240516115721.1.I8d413e641239c059d018d46cc569048b813a5d9b@changeid>
 <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
In-Reply-To: <9dd1cfd1-fe13-4434-a7cc-e14113dcaf53@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 May 2024 11:46:16 -0400
Message-ID: <CADnq5_NGLrrFmFHFX2bC7naByJGofEiYQyWvRP6CO4BDFo52TQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tim Van Patten <timvp@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 alexander.deucher@amd.com, prathyushi.nangia@amd.com, 
 Tim Van Patten <timvp@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Ikshwaku Chauhan <ikshwaku.chauhan@amd.com>, Le Ma <le.ma@amd.com>, 
 Lijo Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Shaoyun.liu" <Shaoyun.liu@amd.com>, 
 Shiwu Zhang <shiwu.zhang@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
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

On Fri, May 17, 2024 at 2:35=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 16.05.24 um 19:57 schrieb Tim Van Patten:
> > From: Tim Van Patten <timvp@google.com>
> >
> > The following commit updated gmc->noretry from 0 to 1 for GC HW IP
> > 9.3.0:
> >
> >      commit 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=3D1")
> >
> > This causes the device to hang when a page fault occurs, until the
> > device is rebooted. Instead, revert back to gmc->noretry=3D0 so the dev=
ice
> > is still responsive.
>
> Wait a second. Why does the device hang on a page fault? That shouldn't
> happen independent of noretry.
>
> So that strongly sounds like this is just hiding a bug elsewhere.

Fair enough, but this is also the only gfx9 APU which defaults to
noretry=3D1, all of the rest are dGPUs.  I'd argue it should align with
the other GFX9 APUs or they should all enable noretry=3D1.

Alex

>
> Regards,
> Christian.
>
> >
> > Fixes: 5f3854f1f4e2 ("drm/amdgpu: add more cases to noretry=3D1")
> > Signed-off-by: Tim Van Patten <timvp@google.com>
> > ---
> >
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_gmc.c
> > index be4629cdac049..bff54a20835f1 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c
> > @@ -876,7 +876,6 @@ void amdgpu_gmc_noretry_set(struct amdgpu_device *a=
dev)
> >       struct amdgpu_gmc *gmc =3D &adev->gmc;
> >       uint32_t gc_ver =3D amdgpu_ip_version(adev, GC_HWIP, 0);
> >       bool noretry_default =3D (gc_ver =3D=3D IP_VERSION(9, 0, 1) ||
> > -                             gc_ver =3D=3D IP_VERSION(9, 3, 0) ||
> >                               gc_ver =3D=3D IP_VERSION(9, 4, 0) ||
> >                               gc_ver =3D=3D IP_VERSION(9, 4, 1) ||
> >                               gc_ver =3D=3D IP_VERSION(9, 4, 2) ||
>
