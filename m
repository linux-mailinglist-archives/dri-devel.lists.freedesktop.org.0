Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BEA0B930
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:13:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD94B10E111;
	Mon, 13 Jan 2025 14:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eWAB+Eoc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B31410E111
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 14:13:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2CE71A40FF4
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 14:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116A6C4CEE5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 14:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736777611;
 bh=uJ+YPR9rDl6BRcO6LD+GuY5BEFTvr6gj/XmUN79Dvg0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eWAB+Eocyewz8BxwMh1UtBoaZVIpV3SJ3jhrMF5AkhUzv0pB2jyLG9Z7sRuvjTLeH
 nknAvlSeD1/bnZvtjduNx1XYtMKtu8tisjA8r7ZgUMKfCvVgWEN1yyY1IUc8cdsdpT
 padJka9hZ2NAIHFiswFrQJp7oSDI59XkXqfmGKM7y3Sj17ihvDwD1RVkyAE2gjcbPs
 IzejabphhceFIItGTfPw4wQilnf6MtUv8web3nBOK3lxAcUU3pFUjs9aQNzTBbr00a
 7wYlpdG/P1O+yp07A+hz82LoUyrC2EMuiPQmv29omRqCPSHrGuP2cIoiryBsGIglRu
 I3NAhOlZv7NdQ==
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa67ac42819so626837066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 06:13:30 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX1/obutilinmRooKgin0VBsFlgYYOd30vvzrzuiDlJuY3Yq8vUZD/VteX/pulY/iwlg1nuOK96DGU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTbeS4ot+SRr6vI3k4rwH8JW3pHOwShGPV94+mhvDY23GTWgBz
 qKvhOkreizDK329QF8koqXrwYAZb1f7q2Oa9B79VzO6A19EL7ti9NJMguBU81jaMWCHbkiqaZSD
 s8PtcIv4wnCluX2Zkq3HMHaUrWJA=
X-Google-Smtp-Source: AGHT+IET6PpTD+AGjDBipiJDqcifcxJlAHJOwQzR2HLqCqZOKE/wWGn42Xu9sfDIuezeVDRGs4lzHydK9oj3voEc4Y8=
X-Received: by 2002:a17:907:3e91:b0:aaf:74b3:80db with SMTP id
 a640c23a62f3a-ab2ab670608mr1751450066b.3.1736777609506; Mon, 13 Jan 2025
 06:13:29 -0800 (PST)
MIME-Version: 1.0
References: <20241111132149.1113736-1-chenhuacai@loongson.cn>
 <87o72lde9r.fsf@intel.com>
 <CAAhV-H6-yB5d8gXEH9TPHuzx0BJT+g8OCUmwTfSTTtqxfmcHDA@mail.gmail.com>
In-Reply-To: <CAAhV-H6-yB5d8gXEH9TPHuzx0BJT+g8OCUmwTfSTTtqxfmcHDA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 13 Jan 2025 22:13:18 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7m0+-bHp0z0V+uySvBfPym4nMBCCTc5V80mYTfXjpuFA@mail.gmail.com>
X-Gm-Features: AbW1kvYBkUTij32tGBbF0vMyjWI5U27z_8i76ew8CDf9ghGTUx_ZV7HP19iQLK4
Message-ID: <CAAhV-H7m0+-bHp0z0V+uySvBfPym4nMBCCTc5V80mYTfXjpuFA@mail.gmail.com>
Subject: Re: [PATCH] drm: Remove redundant statement in
 drm_crtc_helper_set_mode()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
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

Hi, Dave,

Gentle ping, can this patch be merged into 6.14?

Huacai

On Mon, Nov 25, 2024 at 2:00=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org>=
 wrote:
>
> On Mon, Nov 11, 2024 at 10:41=E2=80=AFPM Jani Nikula
> <jani.nikula@linux.intel.com> wrote:
> >
> > On Mon, 11 Nov 2024, Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > Commit dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers=
")
> > > removes the drm_bridge_mode_fixup() call in drm_crtc_helper_set_mode(=
),
> > > which makes the subsequent "encoder_funcs =3D encoder->helper_private=
" be
> > > redundant, so remove it.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers=
")
> >
> > IMO not necessary because nothing's broken, it's just redundant.
> Maintainer is free to keep or remove the Cc and Fixes tag. :)
>
> Huacai
>
> >
> > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> >
> > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > ---
> > >  drivers/gpu/drm/drm_crtc_helper.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_=
crtc_helper.c
> > > index 0955f1c385dd..39497493f74c 100644
> > > --- a/drivers/gpu/drm/drm_crtc_helper.c
> > > +++ b/drivers/gpu/drm/drm_crtc_helper.c
> > > @@ -334,7 +334,6 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *cr=
tc,
> > >               if (!encoder_funcs)
> > >                       continue;
> > >
> > > -             encoder_funcs =3D encoder->helper_private;
> > >               if (encoder_funcs->mode_fixup) {
> > >                       if (!(ret =3D encoder_funcs->mode_fixup(encoder=
, mode,
> > >                                                             adjusted_=
mode))) {
> >
> > --
> > Jani Nikula, Intel
