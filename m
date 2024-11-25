Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C39D7B65
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 07:01:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45A010E2C9;
	Mon, 25 Nov 2024 06:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CHdOEcvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CDA10E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 06:01:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 8F763A412B9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 05:59:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42877C4CED8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 06:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732514467;
 bh=ds4/aIVpFugEaz01RU1zBg4z2TBBiIBiP/DOzbNMUUo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CHdOEcvu6wgykl3uA30G62WbHdqi2kmwdkeNByfPgwPGgniPvMGyCY4Ntir5oV7vx
 RmHWYYU3lfZslNLUqR0pmg/yV0v0op0qSKI/XR+fPaID+Y9VC/p3vDnOqmQZVoLN2B
 rfhpwxI3nmjRzooSIPUWLWU0ZyNYo2o6B2CMRRsWQO6AtisIifftpf/yF5wKvr+yaz
 10jdvT1NgL3LTbm1rxUHktgIPJJ8esFsROimDVgUfCnuY+js6Qu8nbubt3nyc6V37x
 idkREMt0En8RA7Zfblpq47ZV5AVw/UZ1Skqsdu8Rtia+XVepkJ+oEgN1BhPUbP/j/C
 sKhwYbwu9Uq7Q==
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-aa54adcb894so102676666b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 22:01:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUvSfJCV37UUEXQ0rikm5tt5oljn4vWnB0XutnepWk4E4HbvYbz0bsZFtB7Djnvo/NoLfQcICbd8Yw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0DbPjLI3V/UlkTd97Jo4OEYL8i13TYrIpVT+wE2bUpXMBVhB5
 1Qd5Vh7qjvbVCgJX922fkx7p9hegEML1uBKRCgb62yjHFt7Mu4XH6oc1IW6STMik9w9+H9HYObR
 88ftThJNIiky33gNmA2e919UNvNw=
X-Google-Smtp-Source: AGHT+IEYvuYtvwBciN7RBO1996CaeS0ilOCn3sjf6md8ykfPv7xm0jCk2L9dVBduCLSsyCujMYpWmJ/hg7BuvCbO5qk=
X-Received: by 2002:a17:906:308d:b0:aa5:2573:e38c with SMTP id
 a640c23a62f3a-aa52573e658mr840628466b.16.1732514465650; Sun, 24 Nov 2024
 22:01:05 -0800 (PST)
MIME-Version: 1.0
References: <20241111132149.1113736-1-chenhuacai@loongson.cn>
 <87o72lde9r.fsf@intel.com>
In-Reply-To: <87o72lde9r.fsf@intel.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 25 Nov 2024 14:00:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6-yB5d8gXEH9TPHuzx0BJT+g8OCUmwTfSTTtqxfmcHDA@mail.gmail.com>
Message-ID: <CAAhV-H6-yB5d8gXEH9TPHuzx0BJT+g8OCUmwTfSTTtqxfmcHDA@mail.gmail.com>
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

On Mon, Nov 11, 2024 at 10:41=E2=80=AFPM Jani Nikula
<jani.nikula@linux.intel.com> wrote:
>
> On Mon, 11 Nov 2024, Huacai Chen <chenhuacai@loongson.cn> wrote:
> > Commit dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers")
> > removes the drm_bridge_mode_fixup() call in drm_crtc_helper_set_mode(),
> > which makes the subsequent "encoder_funcs =3D encoder->helper_private" =
be
> > redundant, so remove it.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: dbbfaf5f2641a ("drm: Remove bridge support from legacy helpers")
>
> IMO not necessary because nothing's broken, it's just redundant.
Maintainer is free to keep or remove the Cc and Fixes tag. :)

Huacai

>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > ---
> >  drivers/gpu/drm/drm_crtc_helper.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_cr=
tc_helper.c
> > index 0955f1c385dd..39497493f74c 100644
> > --- a/drivers/gpu/drm/drm_crtc_helper.c
> > +++ b/drivers/gpu/drm/drm_crtc_helper.c
> > @@ -334,7 +334,6 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc=
,
> >               if (!encoder_funcs)
> >                       continue;
> >
> > -             encoder_funcs =3D encoder->helper_private;
> >               if (encoder_funcs->mode_fixup) {
> >                       if (!(ret =3D encoder_funcs->mode_fixup(encoder, =
mode,
> >                                                             adjusted_mo=
de))) {
>
> --
> Jani Nikula, Intel
