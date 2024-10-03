Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7CF98F16C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 16:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F35510E862;
	Thu,  3 Oct 2024 14:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k80TYtd1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1EC010E862;
 Thu,  3 Oct 2024 14:31:03 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-7c3d8105646so41506a12.2; 
 Thu, 03 Oct 2024 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727965863; x=1728570663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6GWsPuyO7eiVtI5Yq1OrqwVQGfqKX2+l2pbM1VOTnc=;
 b=k80TYtd12gw5SPz1yd8ESt1ZmLOESlP5utxoGnbbBgHrkd7R2cc1D1Qc+XEgWXQ3TI
 eQ9Q/dGx2IKyahf0YyCyr3fhxHWoF0BjixqQ3W/ktxlFutr9oDreS3rN9k0xI8uRFeHz
 cyEqc8ZL6axPCmVAOn5nZF8xGZhtB8THnkUSerY9io8hxU7nM7YtsDZ49Pt2GgTqXatv
 fglK+jzFavGodADt9LO5QTdLcf9dY8xQq+Qt+ZzPGvUN2Psrq3I7mnWO8Wiwoari6Rzw
 TfB75u/QO8Nu484SyqCrc+XoVbZlJgZfqsfFac/b+aex4ghQDJ097vbcTW75pUnBTK+a
 BVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727965863; x=1728570663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L6GWsPuyO7eiVtI5Yq1OrqwVQGfqKX2+l2pbM1VOTnc=;
 b=k9unF35Kn93eG0dtnISRAShIvUXFP1+uH6yqAhBRQ7RxrzPX6iBXb2kYi9QuSJVR07
 wq4dS3Fur1tkPn/h0C0vPv11s5Q3TlVtYH2GqrDUkB81bS93O2IlXuuwfTK6jRtulJCG
 iW0Bnq/hO1H+cHVPAVtXCPjPRbJ5OiWNkOzRyS+JtHBfGd0mTkVKONGWNVL8xIrgU0NZ
 xvXMCyQQDqjM/23qQkYMIZwTVkTlORIiILgw5vLj4C3vGCySl5f5dBUJ0fBg0hDjIJ8h
 kcu4PsxAJrwkoLXTjpF4jBRvdzoNpJCcttf5kcJSB/4mHoW9jwmY7kxE67L3aihDEmbM
 HsBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVErDjC//qes5mCvV7c2+7d/CZP/l6OhZwAKEOElyGjFT+q0OgiAi5nJeCvQ6A5D4mtzn6cUMDY@lists.freedesktop.org,
 AJvYcCVXZzPAbnxm5VSsD+QaubjccqJyct/fOyEvjFoOfdHV+UTdr/X8nrHTgG6cSRV5n3Rms5Lafgiu13LF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuiSOxS2J7/i27G7PTPij8G2ZVdshjGEh06PoBiZHDPrWPN4Dr
 llE1XUBxUeSqcTQK7LxH/UlhncwQbm46QTb4y1YInfcLsqLArik5dW6OCb7+poxbIxtVXzKJ5NZ
 EEzfTD9O+MHfmsDpeKWz0xS5vxz0=
X-Google-Smtp-Source: AGHT+IHgk4lnbQzZRLNA83q4AzzEtRY6b5eh7Vd/ZM/vfllF40D+lBPBUt5Iwy9xLn69MSwgx/fIAxt/+QKtmP7+fZA=
X-Received: by 2002:a17:90a:e2d5:b0:2e1:682b:361e with SMTP id
 98e67ed59e1d1-2e184a5a874mr3358673a91.4.1727965862995; Thu, 03 Oct 2024
 07:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <7b3ea9a6-575e-4fe5-98d9-6e53803188fa@amd.com>
 <20241002130149.1607979-1-Igor.A.Artemiev@mcst.ru>
 <20241003-271275e284694a8c82dac508-pchelkin@ispras.ru>
In-Reply-To: <20241003-271275e284694a8c82dac508-pchelkin@ispras.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 3 Oct 2024 10:30:50 -0400
Message-ID: <CADnq5_O3bb38L=rh1OxYj0jdqq21wRM9C7uX35xTkSvm=UQu4Q@mail.gmail.com>
Subject: Re: [lvc-project] [PATCH v2] drm/amd/pm: check return value of
 amdgpu_irq_add_id()
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Igor Artemiev <Igor.A.Artemiev@mcst.ru>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Simona Vetter <simona@ffwll.ch>, Kenneth Feng <kenneth.feng@amd.com>,
 lvc-project@linuxtesting.org, 
 Xinhui Pan <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

On Thu, Oct 3, 2024 at 10:28=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> On Wed, 02. Oct 16:01, Igor Artemiev wrote:
> > amdgpu_irq_ad_id() may fail and the irq handlers will not be registered=
.
> > This patch adds error code check.
> >
> > Found by Linux Verification Center (linuxtesting.org) with static
> > analysis tool SVACE.
> >
> > Signed-off-by: Igor Artemiev <Igor.A.Artemiev@mcst.ru>
> > ---
> > v2: Remove the cast to struct amdgpu_device as Christian K=C3=B6nig
> > <christian.koenig@amd.com> suggested.
> >
> >  .../drm/amd/pm/powerplay/hwmgr/smu_helper.c   | 19 ++++++++++++++++---
> >  1 file changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c b/driv=
ers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> > index 79a566f3564a..50a3085c00aa 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu_helper.c
> > @@ -647,28 +647,41 @@ int smu9_register_irq_handlers(struct pp_hwmgr *h=
wmgr)
> >  {
> >       struct amdgpu_irq_src *source =3D
> >               kzalloc(sizeof(struct amdgpu_irq_src), GFP_KERNEL);
> > +     int ret;
> >
> >       if (!source)
> >               return -ENOMEM;
> >
> >       source->funcs =3D &smu9_irq_funcs;
> >
> > -     amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> > +     ret =3D amdgpu_irq_add_id(hwmgr->adev,
> >                       SOC15_IH_CLIENTID_THM,
> >                       THM_9_0__SRCID__THM_DIG_THERM_L2H,
> >                       source);
> > -     amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> > +     if (ret)
> > +             goto err;
> > +
> > +     ret =3D amdgpu_irq_add_id(hwmgr->adev,
> >                       SOC15_IH_CLIENTID_THM,
> >                       THM_9_0__SRCID__THM_DIG_THERM_H2L,
> >                       source);
> > +     if (ret)
> > +             goto err;
> >
> >       /* Register CTF(GPIO_19) interrupt */
> > -     amdgpu_irq_add_id((struct amdgpu_device *)(hwmgr->adev),
> > +     ret =3D amdgpu_irq_add_id(hwmgr->adev,
> >                       SOC15_IH_CLIENTID_ROM_SMUIO,
> >                       SMUIO_9_0__SRCID__SMUIO_GPIO19,
> >                       source);
> > +     if (ret)
> > +             goto err;
> >
> >       return 0;
> > +
> > +err:
> > +     kfree(source);
>
> Oh, the calltrace looks like:
>
> hwmgr_sw_init()
>   phm_register_irq_handlers()
>     ->register_irq_handlers()
>     smu9_register_irq_handlers()
>
> And the return value of phm_register_irq_handlers() is not processed and
> the error is not reported anywhere, so I guess there is a risk of
> use-after-free: the source pointer may have been already registered by
> some of amdgpu_irq_add_id() calls before the error occured.
>
> The similar code exists in smu7_register_irq_handlers(), maybe should be
> fixed as well.
>
> Alex, is https://gitlab.freedesktop.org/agd5f/linux a public repo this
> patch should go in? I'd suggest to drop the patch and ask Igor to do a
> complete fix or, if dropping is not possible now, fix it by another patch=
.
> For the latter one I can do this myself but it would be nice to refer to
> the current patch via a git hash (it's probably not published yet in your
> repo).

Dropped.  Thanks.

Alex

>
> > +
> > +     return ret;
> >  }
> >
> >  void *smu_atom_get_data_table(void *dev, uint32_t table, uint16_t *siz=
e,
> > --
> > 2.39.2
