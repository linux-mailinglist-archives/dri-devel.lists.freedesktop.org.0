Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133E28D68EE
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 20:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC4D10E24E;
	Fri, 31 May 2024 18:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KByvOkge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0FD10E1E0;
 Fri, 31 May 2024 18:20:42 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1f48b825d8cso18802385ad.2; 
 Fri, 31 May 2024 11:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717179641; x=1717784441; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6doFFCcSTAte6ymfy+Igul1WrbfPbryjlzogNwwZ8rc=;
 b=KByvOkgelkyTTjr13iphr0LyK/pQJzkOZ64UqfiaGZ34c251dbkJjAfA0RscNlhG3B
 BeTass4/qx5pUFnqbe1DieHDvwfZwJpnIvMSSgUq9BgjTYId3vBIPgrGdHsDcS7lrqxv
 q/49R535+i/YZEL1uQpnA3BbL5szmhYERLxlKHZo78VOCSmJPjPAE5swHmgI10teC0sW
 wif4ptBWoSq+NL8IAh62CpqdRPkLvEcvtq9swd+OJUYJETC53+/3mHxmlt5lqdIoY0ce
 wUlSgFMOxE3aYE7jlQshYoJRfi3aZEdSOuP39QJPfi7l57K+7bCvZQcv2lAlYGV7+Kew
 NmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717179641; x=1717784441;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6doFFCcSTAte6ymfy+Igul1WrbfPbryjlzogNwwZ8rc=;
 b=xCcEnE4RwxP/29HAHXBCjjbB7MMFYMuMUqzTKCaRnHLoqdduci5OVU8oFYwojCjoRf
 F0mzGEUK0j//ma9lu2LNV3qBEOtyoYzv7jjYeOEcUPzlCdVeQ6UkqqMJtjkwta/MY0Iz
 QPj1ua6pn9bLU7bfl3yFFNBMq7ukMyyg2o8j+znu8oo2LjEfT5Q4/McuNBqFrwHa0ZiW
 2Yt7Ynlf6d/RDIqwFlds79gjf2E1Eq/4mEed804GTaMKa4uwyoXjB2xQ6fFl41hnu49e
 RuOASCMXx+wHP9pCP78Hg3GnXAu2zg0TITYzdIfnZOl1QIlpKFWDMq1Ple9SehWIti8+
 PpFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyp9fxtOWjqkUjzDq+edXy1syZbolm7TcLLUDomb6TWJDecxXGonFaWksTCxeYT6o5UBr2QW/R/t/wufs6lu44mGQ73kPgtU/eIUEGZxm74gEnJfFQsnLzU2HMlC1O9F/LnAQFZBaXb641cfovsw==
X-Gm-Message-State: AOJu0YwCQ5v78/lMCQXJfz0lBKzmJNmcyt/6r02Sat3NDmIVaTNeijEO
 H3wCkr9OSFhqCY70BwQbQukSIX445CfI89AWnOcu0mjmQqAXhLmY7pyJXo8JgTjl5mtUUEi9pRr
 pjF2HFWf4VR8vFReH/k0RcI6OogsNdw==
X-Google-Smtp-Source: AGHT+IFm/2TDsh9LMWk94O1lQr2/13xsjHvxYZ/V/XYrcs9yi3UE8PDmZqtliFdCgZmSTEh5hgjlk0ut9L+Hwo3E9co=
X-Received: by 2002:a17:902:f7c5:b0:1f4:8363:a6fc with SMTP id
 d9443c01a7336-1f6370203aemr24549975ad.25.1717179641457; Fri, 31 May 2024
 11:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240531093211.498880-1-colin.i.king@gmail.com>
 <833fac2c-91f9-4e9a-9b9e-da2db955a488@infradead.org>
In-Reply-To: <833fac2c-91f9-4e9a-9b9e-da2db955a488@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 31 May 2024 14:20:29 -0400
Message-ID: <CADnq5_NCA31yex7Ye=hoVbMkpCzbgpBJvGrGub+AQ1jQBcCeCA@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix a handful of spelling mistakes
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Colin Ian King <colin.i.king@gmail.com>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Alex Hung <alex.hung@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

Applied.  Thanks!

Alex

On Fri, May 31, 2024 at 11:37=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 5/31/24 2:32 AM, Colin Ian King wrote:
> > There are a few spelling mistakes in dml2_printf messages. Fix them.
> >
> > Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>
>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>
> Thanks.
>
> > ---
> >  .../dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c      | 6 +++---
> >  .../display/dc/dml2/dml21/src/dml2_core/dml2_core_shared.c  | 6 +++---
> >  2 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dm=
l2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_c=
ore/dml2_core_dcn4_calcs.c
> > index 8062144a5a6d..e7e6751f4477 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_dcn4_calcs.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_dcn4_calcs.c
> > @@ -5731,7 +5731,7 @@ static bool CalculatePrefetchSchedule(struct dml2=
_core_internal_scratch *scratch
> >               dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->Tim=
eForFetchingVM);
> >               dml2_printf("DML: Tr0: %fus - time to fetch first row of =
data pagetables\n", s->TimeForFetchingRowInVBlank);
> >               dml2_printf("DML: Tsw: %fus =3D time to fetch enough pixe=
l data and cursor data to feed the scalers init position and detile\n", (do=
uble)s->LinesToRequestPrefetchPixelData * s->LineTime);
> > -             dml2_printf("DML: To: %fus - time for propogation from sc=
aler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (d=
ouble)p->myPipe->HTotal)) * s->LineTime);
> > +             dml2_printf("DML: To: %fus - time for propagation from sc=
aler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (d=
ouble)p->myPipe->HTotal)) * s->LineTime);
> >               dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tp=
re - To > 0\n");
> >               dml2_printf("DML: Tslack(pre): %fus - time left over in s=
chedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeF=
orFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScale=
r) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->=
TSetup);
> >               dml2_printf("DML: row_bytes =3D dpte_row_bytes (per_pipe)=
 =3D PixelPTEBytesPerRow =3D : %u\n", p->PixelPTEBytesPerRow);
> > @@ -8268,7 +8268,7 @@ static bool dml_core_mode_support(struct dml2_cor=
e_calcs_mode_support_ex *in_out
> >       dml2_printf("DML::%s: mode_lib->ms.DCFCLK =3D %f\n", __func__, mo=
de_lib->ms.DCFCLK);
> >       dml2_printf("DML::%s: mode_lib->ms.FabricClock =3D %f\n", __func_=
_, mode_lib->ms.FabricClock);
> >       dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz =3D %f\n", __fun=
c__, mode_lib->ms.uclk_freq_mhz);
> > -     dml2_printf("DML::%s: urgent latency tolarance =3D %f\n", __func_=
_, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kb=
ytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)=
));
> > +     dml2_printf("DML::%s: urgent latency tolerance =3D %f\n", __func_=
_, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kb=
ytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)=
));
> >  #endif
> >
> >       mode_lib->ms.support.OutstandingRequestsSupport =3D true;
> > @@ -11089,7 +11089,7 @@ static bool dml_core_mode_programming(struct dm=
l2_core_calcs_mode_programming_ex
> >                               if (display_cfg->plane_descriptors[k].imm=
ediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] =3D=3D false) =
{
> >                                       mode_lib->mp.ImmediateFlipSupport=
ed =3D false;
> >  #ifdef __DML_VBA_DEBUG__
> > -                                     dml2_printf("DML::%s: Pipe %0d no=
t supporing iflip!\n", __func__, k);
> > +                                     dml2_printf("DML::%s: Pipe %0d no=
t supporting iflip!\n", __func__, k);
> >  #endif
> >                               }
> >                       }
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dm=
l2_core_shared.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/=
dml2_core_shared.c
> > index f2e2250d28d3..6eb3fec87ec1 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_shared.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_shared.c
> > @@ -1988,7 +1988,7 @@ bool dml2_core_shared_mode_support(struct dml2_co=
re_calcs_mode_support_ex *in_ou
> >       dml2_printf("DML::%s: mode_lib->ms.FabricClock =3D %f\n", __func_=
_, mode_lib->ms.FabricClock);
> >       dml2_printf("DML::%s: mode_lib->ms.uclk_freq_mhz =3D %f\n", __fun=
c__, mode_lib->ms.uclk_freq_mhz);
> >       dml2_printf("DML::%s: max_urgent_latency_us =3D %f\n", __func__, =
mode_lib->ms.support.max_urgent_latency_us);
> > -     dml2_printf("DML::%s: urgent latency tolarance =3D %f\n", __func_=
_, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kb=
ytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)=
));
> > +     dml2_printf("DML::%s: urgent latency tolerance =3D %f\n", __func_=
_, ((mode_lib->ip.rob_buffer_size_kbytes - mode_lib->ip.pixel_chunk_size_kb=
ytes) * 1024 / (mode_lib->ms.DCFCLK * mode_lib->soc.return_bus_width_bytes)=
));
> >  #endif
> >
> >       mode_lib->ms.support.OutstandingRequestsSupport =3D true;
> > @@ -8131,7 +8131,7 @@ static bool CalculatePrefetchSchedule(struct dml2=
_core_internal_scratch *scratch
> >               dml2_printf("DML: Tvm: %fus - time to fetch vm\n", s->Tim=
eForFetchingVM);
> >               dml2_printf("DML: Tr0: %fus - time to fetch first row of =
data pagetables\n", s->TimeForFetchingRowInVBlank);
> >               dml2_printf("DML: Tsw: %fus =3D time to fetch enough pixe=
l data and cursor data to feed the scalers init position and detile\n", (do=
uble)s->LinesToRequestPrefetchPixelData * s->LineTime);
> > -             dml2_printf("DML: To: %fus - time for propogation from sc=
aler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (d=
ouble)p->myPipe->HTotal)) * s->LineTime);
> > +             dml2_printf("DML: To: %fus - time for propagation from sc=
aler to optc\n", (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScaler) / (d=
ouble)p->myPipe->HTotal)) * s->LineTime);
> >               dml2_printf("DML: Tvstartup - TSetup - Tcalc - TWait - Tp=
re - To > 0\n");
> >               dml2_printf("DML: Tslack(pre): %fus - time left over in s=
chedule\n", p->VStartup * s->LineTime - s->TimeForFetchingVM - 2 * s->TimeF=
orFetchingRowInVBlank - (*p->DSTYAfterScaler + ((double)(*p->DSTXAfterScale=
r) / (double)p->myPipe->HTotal)) * s->LineTime - p->TWait - p->TCalc - *p->=
TSetup);
> >               dml2_printf("DML: row_bytes =3D dpte_row_bytes (per_pipe)=
 =3D PixelPTEBytesPerRow =3D : %u\n", p->PixelPTEBytesPerRow);
> > @@ -10959,7 +10959,7 @@ bool dml2_core_shared_mode_programming(struct d=
ml2_core_calcs_mode_programming_e
> >                               if (display_cfg->plane_descriptors[k].imm=
ediate_flip && mode_lib->mp.ImmediateFlipSupportedForPipe[k] =3D=3D false) =
{
> >                                       mode_lib->mp.ImmediateFlipSupport=
ed =3D false;
> >  #ifdef __DML_VBA_DEBUG__
> > -                                     dml2_printf("DML::%s: Pipe %0d no=
t supporing iflip!\n", __func__, k);
> > +                                     dml2_printf("DML::%s: Pipe %0d no=
t supporting iflip!\n", __func__, k);
> >  #endif
> >                               }
> >                       }
>
> --
> #Randy
> https://people.kernel.org/tglx/notes-about-netiquette
> https://subspace.kernel.org/etiquette.html
