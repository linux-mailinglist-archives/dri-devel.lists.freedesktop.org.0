Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABC1B1A8A3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 19:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB9710E123;
	Mon,  4 Aug 2025 17:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Srpntk7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC26C10E123;
 Mon,  4 Aug 2025 17:30:23 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76624ecc7efso368488b3a.0; 
 Mon, 04 Aug 2025 10:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754328623; x=1754933423; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SLzSdAQKIpitpeuYQXseME87py2KuxJucUYdGOZhU5Q=;
 b=Srpntk7orvq48OANb4BwaWXnt99ZItfz6EiQy0SeJDSJ8fYL9YT+zo+VZ2B3QHMLVZ
 4XVrLhBhi8ffrjuNRGik0u46LO62m/Y9ZJ6FXAR8goDq0g4lIveTlZMKMnqw82F3+ctM
 pIAFZuxTH+XWarRJ4HS+50hxVAxOHLh0w7lt4T6Junzm8ozcbeNK8c9rp+1Jqn5Z6YPd
 SHvBAMnLFMqOiN1LCllRrT2s/Kf2+PIdXo1Pz7/IhD94lSz+cx4PR1u4OuBAGXzvCbtr
 MxEuqs9ma7O261qVzF7ETkXWeYAceqihrX7sKY4ph6Tx/3QcGTfwtryIdYRbfQ6AFyqr
 iajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754328623; x=1754933423;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SLzSdAQKIpitpeuYQXseME87py2KuxJucUYdGOZhU5Q=;
 b=snSc5IVG6uD6toMMpF/jyrv5brwh3GUh8JXXOa3k4CEn+PxIeavSVyec0pcwTm+dO5
 rAQihDM33Mu0lXumIl/RREZCE+G70al1LqfX3e/A0EyWbkPYE0an9HLvAAwPNgNnBZKt
 FzydqUhiHd/fZ9zhXTJizVxOkvbhWsttKEZs/fRmUFhol+xBFhUNxFSQbx5aXh43PTcD
 LAhZ6UQ7kMDDw1d86z7guGE59txd7RowSSKC9r8gUq+Pwyak2nZC8LTjSdJfFOjQeLDy
 SY3zvkViIPbMIQNHexFoGSU3/4qcDEyReoHdZVIKfiubKgzRLR9Mow6URZbpeugzAweK
 WYHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkLRW3QMiqjOrTNJeinhTVYxNvH+NEB3f7kxWQMx+tFtui2GcGmkQIixehhzLd1xAcHmnrMQ3IHQru@lists.freedesktop.org,
 AJvYcCXLRSvzlCcrsEpxQ4MUH2fNx2v5yn9he8v6FbYJ5zpwWC/pBL+nhHQLCf3tzr5Rl4HWr1gze9G3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyT0fNwsOQQt/TXGPFFUWjnaO2SsMDwrWC67kjbQTcN4t/sT1A7
 CGTo4f3meSMS/0Jp2EC2HMstY6RdRqoW1a9X7dnw/jqFVrNYvifAsWU8aNcAsz08S8UJhx34v3N
 eJty7dKlunxH1Eh4t31ulW2rusj/aJEU=
X-Gm-Gg: ASbGncvSz0fCIqMhFtk2vY3dRzWPgwNVNVRQZ83fttiPAD3Fbx7x3nc3dr19TUeeDCy
 FPXlcKF50MuwWJw/NcGzL0RPPioqnbxr2vU/OMbL0r0t1bk4sv/oejmtDPpaYkNpxxDdFvzKxfh
 V7/L6q1388qgsXQYyvp3LXkexWI7BR+DU846P88EMhwTr1xb6zIXGMKREfOJRC+RM3YJK4/auRL
 aA2XaK+
X-Google-Smtp-Source: AGHT+IFZ20MgIBvuCvlifETgR+OlOWEtQA0X/jTfhalbOjDjtuNoHqO373XlhluQ8kwPZ5qeVUlUBHY2ymIKIu2w3O8=
X-Received: by 2002:a17:902:dad0:b0:240:9dcd:94c0 with SMTP id
 d9443c01a7336-24246f2d73bmr66352445ad.2.1754328623188; Mon, 04 Aug 2025
 10:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250801-amdgfx10-v1-1-e1dcbe18d84e@ethancedwards.com>
 <CADnq5_N+bQppUAD-qR8QC8M6nW+oRF8+7z=Qakcxc=a6Z8q4Gg@mail.gmail.com>
 <c82931b5-0de2-4e45-a80b-3a90b0cc98a2@suswa.mountain>
 <CADnq5_Mk3FO_tvxFo+fJgqskVc7qtGv74VM6EStx_BcVpahXEQ@mail.gmail.com>
 <fda8103d-cac8-4c00-a78e-6eb27141d9ea@suswa.mountain>
 <CADnq5_PdgH7yPZ9UNw3iXvuQAAUmuKpMh-E8NLri_q5Zn8deWQ@mail.gmail.com>
In-Reply-To: <CADnq5_PdgH7yPZ9UNw3iXvuQAAUmuKpMh-E8NLri_q5Zn8deWQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Aug 2025 13:30:11 -0400
X-Gm-Features: Ac12FXxD2PpS4lnNplG4DQJ0xJ3EfdL5wo8BVjrF54ogM83r4Sh11WcvrG_W1eo
Message-ID: <CADnq5_NMdi2=H8JBO-R249UhOWPeQ-_+syCq99XECDbV8iDhFA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/gfx10: remove redundant repeated null checks
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Ethan Carter Edwards <ethan@ethancedwards.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

Applied all three patches with a slight tweak to the commit messages
to make it clearer what is changing.

Alex

On Mon, Aug 4, 2025 at 1:25=E2=80=AFPM Alex Deucher <alexdeucher@gmail.com>=
 wrote:
>
> On Mon, Aug 4, 2025 at 1:15=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> >
> > On Mon, Aug 04, 2025 at 11:08:57AM -0400, Alex Deucher wrote:
> > > On Mon, Aug 4, 2025 at 10:49=E2=80=AFAM Dan Carpenter <dan.carpenter@=
linaro.org> wrote:
> > > >
> > > > On Mon, Aug 04, 2025 at 10:32:43AM -0400, Alex Deucher wrote:
> > > > > On Sat, Aug 2, 2025 at 4:22=E2=80=AFAM Ethan Carter Edwards
> > > > > <ethan@ethancedwards.com> wrote:
> > > > > >
> > > > > > The repeated checks on grbm_soft_reset are unnecessary. Remove =
them.
> > > > > >
> > > > >
> > > > > These are not NULL checks and they are necessary.  The code is
> > > > > checking if any bits are set in that register.  If not, then we c=
an
> > > > > skip that code as there is nothing to do.
> > > > >
> > > >
> > > > It's not a null check, but it is a nested check and it's a local
> > > > variable so the patch is correct enough.  At this point we know tha=
t
> > > > grbm_soft_reset can't be zero.
> > >
> > > It can be 0 as far as I can see.  If none of the GRBM_STATUS bits are
> > > set, then we never set any of the bits in grbm_soft_reset.
> > >
> >
> > You're missing the first check...
> >
> > drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> >   7657          if (grbm_soft_reset) {
> >                     ^^^^^^^^^^^^^^^
> > Checked.
> >
> >   7658                  /* stop the rlc */
> >   7659                  gfx_v10_0_rlc_stop(adev);
> >   7660
> >   7661                  /* Disable GFX parsing/prefetching */
> >   7662                  gfx_v10_0_cp_gfx_enable(adev, false);
> >   7663
> >   7664                  /* Disable MEC parsing/prefetching */
> >   7665                  gfx_v10_0_cp_compute_enable(adev, false);
> >   7666
> >   7667                  if (grbm_soft_reset) {
> >                             ^^^^^^^^^^^^^^^
> > Unnecessary.
>
> Yes, sorry, my brain processed this as the first check.
>
> Alex
>
> >
> >   7668                          tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT=
_RESET);
> >   7669                          tmp |=3D grbm_soft_reset;
> >   7670                          dev_info(adev->dev, "GRBM_SOFT_RESET=3D=
0x%08X\n", tmp);
> >   7671                          WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, =
tmp);
> >   7672                          tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT=
_RESET);
> >   7673
> >   7674                          udelay(50);
> >   7675
> >   7676                          tmp &=3D ~grbm_soft_reset;
> >   7677                          WREG32_SOC15(GC, 0, mmGRBM_SOFT_RESET, =
tmp);
> >   7678                          tmp =3D RREG32_SOC15(GC, 0, mmGRBM_SOFT=
_RESET);
> >   7679                  }
> >   7680
> >   7681                  /* Wait a little for things to settle down */
> >   7682                  udelay(50);
> >   7683          }
> >   7684          return 0;
> >
> > regards,
> > dan carpenter
> >
