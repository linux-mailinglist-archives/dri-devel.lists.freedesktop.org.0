Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE2850EFC
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 09:40:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A90110EABA;
	Mon, 12 Feb 2024 08:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lSPOfdVP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DBA210EAB4;
 Mon, 12 Feb 2024 08:40:16 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a3850ce741bso276266266b.3; 
 Mon, 12 Feb 2024 00:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707727214; x=1708332014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2xx3qmM5DQGb345GrWzFVJ1pSbmuD2ER1Bx8oiyhcA=;
 b=lSPOfdVPY4Y+2dcTLfo6Q4+yWigQEDB2tD3h4q6wNboI9Kwch538cGesqU8/wjVieO
 BLyWSHJEhwq4JTiBbcL+5KyOgtUsSmmsgX8ZopcWtYTu5yyT1RS9ETWmP26JmWECXIVH
 CvJgJKN6jj1YWmqvQjB/gWjlp2SdZhNTHOe8mModZUn+yC/4Qmomw1nMNXKAknnu5ew9
 rRegLXzEGp0cwghcqMbf7pi+7elNmWiYtgNMUXFI/2uAcqwS28A0lS0s2IwohtBM9FPu
 xtMlcYCjK6lhart58GnrLGGcXXc18ZjtOG2kW9840pHMUcWTwJm5N6X5bm9eGKhPsnTw
 m8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707727214; x=1708332014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k2xx3qmM5DQGb345GrWzFVJ1pSbmuD2ER1Bx8oiyhcA=;
 b=T2OOCz7hApsfmn29O9Z+MEZIx2GlArhZPyQzO0crBR5sTOXYHQkpd02NdT3wFB+gkc
 Cl0w/iaADCclduDVz4aaQFgjmNaOo2tyKOh8Png03JQxhaCTiwx6V0x1h8zU/RBHmQyE
 fdfj2mPL2v4TKPsN/K62cea9pV9zlD2PiqNHQnpSx0m/TuyIZrf/DB9kGLxIfR+WmGpA
 1WWcIGXLRW91bdFlGUAl5GL7q7zqJY6rA6UN7enlHo7mKnUldAIE73yngghWjQo4AVRN
 wjjSAEKPPB9a4jzwfnqxXf3GAW6XNVvVGymZpKrepW5sTBrw4Q3efDPguqPyNDK27v4y
 3B3A==
X-Gm-Message-State: AOJu0YzZ8SDgy4WPWtSMqdgiZ9QcP22Gauo97b04ENLTtbf2LLnrmnzQ
 uAKjKLmP0/+EWqtwpSGuzM0CKamyD51hdDTu7/2+EM23wP+R++citOvbW/WBrN1GbO/fnPwLYQb
 hcsOy2b5HnQqH5QJsjOfDOuQVUA0gFQIqwyI=
X-Google-Smtp-Source: AGHT+IGHu8Gu6lx/Z58M3WTUbZ2FP4tKJEXJaK+dLgiGcDi7Ai/qCtNWUA3mugM69D/IODos2t/68TUhBhZndZsFhU4=
X-Received: by 2002:a17:906:195b:b0:a3c:aace:1649 with SMTP id
 b27-20020a170906195b00b00a3caace1649mr937573eje.26.1707727214079; Mon, 12 Feb
 2024 00:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20240124025947.2110659-1-nunes.erico@gmail.com>
 <CAKGbVbtAe5jnAwb7O8epq3g4FqLC-ggof3D=5gO9hJf5OuH0OQ@mail.gmail.com>
In-Reply-To: <CAKGbVbtAe5jnAwb7O8epq3g4FqLC-ggof3D=5gO9hJf5OuH0OQ@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 12 Feb 2024 16:40:02 +0800
Message-ID: <CAKGbVbvOcAmiUPUQak3VA_2=KeAQZryG=vTTn7pydjmSSLwBPA@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] drm/lima: fixes and improvements to error recovery
To: Erico Nunes <nunes.erico@gmail.com>
Cc: anarsoul@gmail.com, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, lima@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org
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

applied to drm-misc-next

On Tue, Jan 30, 2024 at 9:07=E2=80=AFAM Qiang Yu <yuq825@gmail.com> wrote:
>
> Serial is Reviewed-by: QIang Yu <yuq825@gmail.com>
>
> On Wed, Jan 24, 2024 at 11:00=E2=80=AFAM Erico Nunes <nunes.erico@gmail.c=
om> wrote:
> >
> > v1 reference:
> > https://patchwork.kernel.org/project/dri-devel/cover/20240117031212.110=
4034-1-nunes.erico@gmail.com/
> >
> > Changes v1 -> v2:
> > - Dropped patch 1 which aimed to fix
> > https://gitlab.freedesktop.org/mesa/mesa/-/issues/8415 .
> > That will require more testing and an actual fix to the irq/timeout
> > handler race. It can be solved separately so I am deferring it to a
> > followup patch and keeping that issue open.
> >
> > - Added patches 2 and 4 to cover "reset time out" and bus stop bit to
> > hard reset in gp as well.
> >
> > - Added handling of all processors in synchronize_irq in patch 5 to
> > cover multiple pp. Dropped unnecessary duplicate fence in patch 5.
> >
> > - Added patch 7 in v2. After some discussion in patch 4 (v1), it seems
> > to be reasonable to bump our timeout value so that we further decrease
> > the chance of users actually hitting any of these timeouts by default.
> >
> > - Reworked patch 8 in v2. Since I broadened the work to not only focus
> > in pp anymore, I also included the change to the other blocks as well.
> >
> > - Collected some reviews and acks in unmodified patches.
> >
> >
> > Erico Nunes (8):
> >   drm/lima: reset async_reset on pp hard reset
> >   drm/lima: reset async_reset on gp hard reset
> >   drm/lima: set pp bus_stop bit before hard reset
> >   drm/lima: set gp bus_stop bit before hard reset
> >   drm/lima: handle spurious timeouts due to high irq latency
> >   drm/lima: remove guilty drm_sched context handling
> >   drm/lima: increase default job timeout to 10s
> >   drm/lima: standardize debug messages by ip name
> >
> >  drivers/gpu/drm/lima/lima_ctx.c      |  2 +-
> >  drivers/gpu/drm/lima/lima_ctx.h      |  1 -
> >  drivers/gpu/drm/lima/lima_gp.c       | 39 +++++++++++++++++++++-------
> >  drivers/gpu/drm/lima/lima_l2_cache.c |  6 +++--
> >  drivers/gpu/drm/lima/lima_mmu.c      | 18 ++++++-------
> >  drivers/gpu/drm/lima/lima_pmu.c      |  3 ++-
> >  drivers/gpu/drm/lima/lima_pp.c       | 37 ++++++++++++++++++++------
> >  drivers/gpu/drm/lima/lima_sched.c    | 38 ++++++++++++++++++++++-----
> >  drivers/gpu/drm/lima/lima_sched.h    |  3 +--
> >  9 files changed, 107 insertions(+), 40 deletions(-)
> >
> > --
> > 2.43.0
> >
