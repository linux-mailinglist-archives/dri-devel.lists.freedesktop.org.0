Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0B17E2F0E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 22:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5943D899D4;
	Mon,  6 Nov 2023 21:37:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C084B10E43D;
 Mon,  6 Nov 2023 21:37:26 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1ef370c2e1aso2995888fac.2; 
 Mon, 06 Nov 2023 13:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699306646; x=1699911446; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OphoK9q7a6dBe49RqxvB+ZhnnNOavYr9X32u348/Dmw=;
 b=FjYW8/DWLO2YXzkb4vmfB7/Zva+IdXozzA81QFd6nPVdFk5jCaVuymrkZLz6Bt4+E3
 dhItHNz/FXYIJgYFiuoN9PiDf87szWOup5Ya/LqwN1/lnV5/Y3eN4ycR1giGcZnkuCEv
 +YT91WWWr/Csm9rYzJVr8JHM2IUZDYn9emg2zJ0GwAwbC4L3jVvTbDew8HB3mWAxPy83
 Ao6SAHaPaggtSfqUbU7sdEDoejr6soKrAWsN7UcRmhLPQhH7K6tj0mln47nkv/NmaZ5a
 04qWjFCmQoMMFBiSyNBtqH6Xwdy6qj4YRgT7nkGnCep8oomrMRt32kTEFJGop6BG+6S7
 fSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699306646; x=1699911446;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OphoK9q7a6dBe49RqxvB+ZhnnNOavYr9X32u348/Dmw=;
 b=UXlS/CRybx/HkrydDlVIBipmC9cj8XJrZPmPfdejxkAGF58UGXE9I8np6SR+RX70R3
 ch4lR9u5pPU3Byt0B/qIvoL0fz3gaqVfXj8rpwpSyj8m87xvbQqazQC0EpmRvdMYuUvN
 zBds7yBUVHaFFmeaAWb0gEC/oRgYlbwnmiRWMas0HoLLgLyi9FnVXcbPIyB10pbcE3aF
 kebsumdIAStua2TR58LyO4WPL3wJzwx3XHB/MpC19PIjufR2HZ06/I+QOI8BXRZwABH3
 I4C4Gtnu7muQNQU62Y8QmyAYPcGR6CC2raC7MutM49nOvCz/gkUcmQF/SE9YVQeSBFym
 XH7w==
X-Gm-Message-State: AOJu0Yz0HpSlMw4sJ0031RIeuOifDX14J/FhLZVVvaitcgZj9fPMWZ9x
 akmmzoDS6lZq7HAZxf81d7OcDzSmArehWp5czc1OO//H
X-Google-Smtp-Source: AGHT+IEP1XqEthoQJtfpl0npA4ae93Dzz/ImFHkuNMcwaOYVT9bgazTQ4NPqNXzu0dmR/IWccQ3n4KaVPdI0Je829g8=
X-Received: by 2002:a05:6871:339e:b0:1e9:b0fa:de48 with SMTP id
 ng30-20020a056871339e00b001e9b0fade48mr1089412oac.47.1699306645891; Mon, 06
 Nov 2023 13:37:25 -0800 (PST)
MIME-Version: 1.0
References: <20231103155013.332367-1-singhabhinav9051571833@gmail.com>
 <CADnq5_OkWD3YmCKgXbtk=Gnba3AgAiAWp2z_nzHQvRfEOsdXVg@mail.gmail.com>
 <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
In-Reply-To: <3b92b89b-ca72-4012-b4f2-0b19e4ba9153@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Nov 2023 16:37:14 -0500
Message-ID: <CADnq5_PXRN+PL4wp+sWOXs2L5nQiRmfrw4065R1TE4YKw-ZeUA@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: Fix warning using plain integer as NULL
To: Abhinav Singh <singhabhinav9051571833@gmail.com>
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, linux-kernel-mentees@lists.linuxfoundation.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 6, 2023 at 4:20=E2=80=AFPM Abhinav Singh
<singhabhinav9051571833@gmail.com> wrote:
>
> On 11/7/23 00:25, Alex Deucher wrote:
> > Applied.  This matches what we already do in the other clear state head=
ers.
> >
> > Alex
> >
> > On Fri, Nov 3, 2023 at 12:00=E2=80=AFPM Abhinav Singh
> > <singhabhinav9051571833@gmail.com> wrote:
> >>
> >> sparse static analysis tools generate a warning with this message
> >> "Using plain integer as NULL pointer". In this case this warning is
> >> being shown because we are trying to intialize a pointer to NULL using
> >> integer value 0.
> >>
> >> Signed-off-by: Abhinav Singh <singhabhinav9051571833@gmail.com>
> >> ---
> >>   drivers/gpu/drm/radeon/clearstate_evergreen.h | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/radeon/clearstate_evergreen.h b/drivers/g=
pu/drm/radeon/clearstate_evergreen.h
> >> index 63a1ffbb3ced..3b645558f133 100644
> >> --- a/drivers/gpu/drm/radeon/clearstate_evergreen.h
> >> +++ b/drivers/gpu/drm/radeon/clearstate_evergreen.h
> >> @@ -1049,7 +1049,7 @@ static const struct cs_extent_def SECT_CONTEXT_d=
efs[] =3D
> >>       {SECT_CONTEXT_def_5, 0x0000a29e, 5 },
> >>       {SECT_CONTEXT_def_6, 0x0000a2a5, 56 },
> >>       {SECT_CONTEXT_def_7, 0x0000a2de, 290 },
> >> -    { 0, 0, 0 }
> >> +    { NULL, 0, 0 }
> >>   };
> >>   static const u32 SECT_CLEAR_def_1[] =3D
> >>   {
> >> @@ -1060,7 +1060,7 @@ static const u32 SECT_CLEAR_def_1[] =3D
> >>   static const struct cs_extent_def SECT_CLEAR_defs[] =3D
> >>   {
> >>       {SECT_CLEAR_def_1, 0x0000ffc0, 3 },
> >> -    { 0, 0, 0 }
> >> +    { NULL, 0, 0 }
> >>   };
> >>   static const u32 SECT_CTRLCONST_def_1[] =3D
> >>   {
> >> @@ -1070,11 +1070,11 @@ static const u32 SECT_CTRLCONST_def_1[] =3D
> >>   static const struct cs_extent_def SECT_CTRLCONST_defs[] =3D
> >>   {
> >>       {SECT_CTRLCONST_def_1, 0x0000f3fc, 2 },
> >> -    { 0, 0, 0 }
> >> +    { NULL, 0, 0 }
> >>   };
> >>   static const struct cs_section_def evergreen_cs_data[] =3D {
> >>       { SECT_CONTEXT_defs, SECT_CONTEXT },
> >>       { SECT_CLEAR_defs, SECT_CLEAR },
> >>       { SECT_CTRLCONST_defs, SECT_CTRLCONST },
> >> -    { 0, SECT_NONE }
> >> +    { NULL, SECT_NONE }
> >>   };
> >> --
> >> 2.39.2
> >>
> Hi Alex, thanks for looking into this. By applied you mean this patch is
> accepted and it has been merged?

Yes.  Once it makes it through our CI system, it will show up in my
drm-next tree.

Alex
