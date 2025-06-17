Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D7ADCFC7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 16:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0833F10E3E4;
	Tue, 17 Jun 2025 14:29:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="GBFG2IZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A611E10E3E4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 14:29:46 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2e8f84653c3so1125756fac.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 07:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1750170586; x=1750775386; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dlugau6BcPVrajseJnCKfCldwBrEYWiC/PheHQbfxo4=;
 b=GBFG2IZgN5RANHMROV+6Y40M+T4WG49C56hrTF1oa/4cS4qo41OussbxIIScHc3Adn
 Ji536A7ZOrJOpTW826Sy9MD9PhLtbNXIXUfe6x1nU8f9C/X4ONTYjQ2a8CoCwgz0btM8
 lw9zdIRhUSS2z2Fc8Ls9zYlBLovS1Fof3umKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750170586; x=1750775386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dlugau6BcPVrajseJnCKfCldwBrEYWiC/PheHQbfxo4=;
 b=hNBGhQJ3sfQZLIbGIlSavgEQEvZ28sS97P9mUv/RKXv8wfgT1qbQ9UiIpixQMHaIuA
 aXR6H5VGHMlRKNSSfLNojKHQKCOfWgUsLF74YgX3rHomFRr6mGe7Z3vHuIzUoV6hHpJP
 fYvSQBK1bpYv83XrrIb0Uw4CVv15DfWkZsaU0wmcSJ1T9fLYVWdgX/BnwKznUyVdjwa1
 qDkjqwp1Zc6tDI6hw0u2ksEu4dzKGCGLKQD/dUYjD2PuO5cppi7eoQjpovrK0FlPcLSo
 TMCH4KFGYfYIIgkfDG/obTu9NyIFoFPpc+ZKm6i+OfhxiPB1O0zN/8otwG+ebhHCTNt0
 kXYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXr+QwdlHPtDYfm/dD0oADzv90uvDOWUxdhNBaecgSKtmmZhGmWcO/kUcO4s9PIc7HSxt6w9EDoTtg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkhFfZdRW6zSkVA77IbP93R+asyrXpi7mBotYxr2BvPvvi6qBp
 GnRTDwJwludN1OT0LM+t0R6wtZ99oo+pDR1FWgdu1sxTNo0XcQYIzY5K/Dbcss7+cVpcmmxnHzG
 deXK9BzpoEb9H+F09Hg3XIJnuXFTAyi57MIZIengajQ==
X-Gm-Gg: ASbGnct0r19e7SQMa7KhtHjfT3hYLPDfbUfdaEO0WopkAoWAzAO7Hin84bJsZeX198U
 eetq0FpYOxWVuCytdYSYGaMZixtcw8B6MksLR6EVeG44XtPgD4bMxuaafMY3o5IVy5TIOxM9+HI
 n6qI9L2T/OBnbG5pq/18RqpmMGLhbZmq0QPXdiAVyAS6yE9KgzUKd2UZSUW/IRDwX4yEgJBDv/
X-Google-Smtp-Source: AGHT+IFyiePpIRajQ1VVnoTjkaCcsivDWXseqUhTgO0P+bIqoiA3o8bEmORekxiaUasu5VUZqN/F8kA0Mez+gmytsnE=
X-Received: by 2002:a05:6870:6e16:b0:2e8:f5d6:2247 with SMTP id
 586e51a60fabf-2eaf08ddd2dmr8206113fac.32.1750170585820; Tue, 17 Jun 2025
 07:29:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
 <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
 <aEwxTkK3w19L1_T2@phenom.ffwll.local> <aFF3dvM1Ibu2gVM3@phenom.ffwll.local>
In-Reply-To: <aFF3dvM1Ibu2gVM3@phenom.ffwll.local>
From: Simona Vetter <simona.vetter@ffwll.ch>
Date: Tue, 17 Jun 2025 16:29:34 +0200
X-Gm-Features: AX0GCFti66cDmFMbSYhbfDm0e5eAQACLno683DOdE8DfRi_bezb9xCAKtlGV5-E
Message-ID: <CAKMK7uFd+18By9SAOUdKn0NzoPXO15DWbnhMBnYaE_36OuYd7w@mail.gmail.com>
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com, tursulin@ursulin.net,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
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

On Tue, 17 Jun 2025 at 16:11, Simona Vetter <simona.vetter@ffwll.ch> wrote:
>
> On Fri, Jun 13, 2025 at 04:10:22PM +0200, Simona Vetter wrote:
> > On Fri, Jun 13, 2025 at 04:04:46PM +0200, Simona Vetter wrote:
> > > On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian K=C3=B6nig wrote:
> > > > It is possible through flink or IOCTLs like MODE_GETFB2 to create
> > > > multiple handles for the same underlying GEM object.
> > > >
> > > > But in prime we explicitely don't want to have multiple handles for=
 the
> > > > same DMA-buf. So just ignore it if a DMA-buf is exported with anoth=
er
> > > > handle.
> > > >
> > > > This was made obvious by removing the extra check in
> > > > drm_gem_prime_handle_to_dmabuf() to not add the handle if we could =
already
> > > > find it in the housekeeping structures.
> > > >
> > > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > ---
> > > >  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
> > > >  1 file changed, 11 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prim=
e.c
> > > > index 1d93b44c00c4..f5f30d947b61 100644
> > > > --- a/drivers/gpu/drm/drm_prime.c
> > > > +++ b/drivers/gpu/drm/drm_prime.c
> > > > @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm=
_prime_file_private *prime_fpriv,
> > > >
> > > >           rb =3D *p;
> > > >           pos =3D rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> > > > +
> > > > +         /*
> > > > +          * Just ignore the new handle if we already have an handl=
e for
> > > > +          * this DMA-buf.
> > > > +          */
> > > > +         if (dma_buf =3D=3D pos->dma_buf) {
> > > > +                 dma_buf_put(dma_buf);
> > > > +                 kfree(member);
> > > > +                 return 0;
> > >
> > > This feels a bit brittle, because this case should only be possible w=
hen
> > > called from drm_gem_prime_handle_to_dmabuf and not from
> > > drm_gem_prime_fd_to_handle() (where it would indicate a real race and
> > > hence bug in our code).
> > >
> > > I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this =
case.
> >
> > Simplest would be to return -EEXISTS here and then either silence that
> > errno or warn about it in the two call sites. Not pretty, but everythin=
g
> > else looks worse.
>
> Did you send a v2 for this one? I think we should at least sort out the
> regression and then figure out the longer-standing issue. Not even sure
> that's a regression from the r-b tree conversion or whether that goes bac=
k
> to my original linke-list walk code.

Yeah I think flink or any of the other buffer handle duplication
tricks just mess things up in funny ways. But as long as userspace
doesn't do those, it should be all fine I think ...
-Sima

> > > Otherwise yes this is the functional change that I've missed :-/ Note=
 that
> > > there's no race in the original code, because it's all protected by t=
he
> > > file_priv->prime.lock. Which means I think you're claim that you've o=
nly
> > > widened the race with your patch is wrong.
> > >
> > > Cheers, Sima
> > >
> > > > +
> > > > +         }
> > > >           if (dma_buf > pos->dma_buf)
> > > >                   p =3D &rb->rb_right;
> > > >           else
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > Simona Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> > --
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
> --
> Simona Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
