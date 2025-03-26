Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBB0A717FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF33310E6D7;
	Wed, 26 Mar 2025 14:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JJx4/Bvt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EB910E6D7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:03:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BC0E5A4120D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66742C4CEE5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742997783;
 bh=ZxD1L/4SWMjBXyNugknHic6RT5sTa3y09SyW3uPduyI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JJx4/BvtvOnfQQhMCZvCC30cmIdIaTU603jr/TLaivl/oWVl7aSpiR6blXDVCDAHT
 rHnEXAcQ6OTWyFbtpSnNANubpxbJ841mg9EqDwIzwuasYiNp4wJIokd6cI7Xzuw0kc
 tfbArprUjmJCuOsJg2DtvM+nkVGBfoJlwftiokOy3lsr7Uv1cbZpnqjqSYSserWBM1
 HrvafsM0t8sHgv3zxRchR8450EpbEvHhUTq3bKdjSOMZCAi39wONpaHHmcALhPwidY
 AnM/1IH1DrZ6pnEHZupwyJk/XOXFZFD0OVcoov5zdlMtu6B05wWxLY7eHr3qNSfTfE
 kus2vdN0/mwuA==
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ac25520a289so1215254166b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 07:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXeSp/RKQYAwUwGkUeSBHY8V2Xj3CJrrCJkBGUs+uf5K4PP4mRjJUbO0pjCNoP/+gM+wGqUV3TFq/E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNyp+lzd1KhyO5QoKxA1ZRmgo2VrNfjQpUBpWYUCszUpWLGWEX
 hHV8P+MjRT36nf/4V6Q9PzKFQ7gSuwkPYgmeRv5lNp2xugNU4fjgCz6rVG0TPaiOUezh2+JqT/1
 mwF18iB/IPepDqezZok3pj3aFwYU=
X-Google-Smtp-Source: AGHT+IEOs7txicHdgnCHkM7VD2ojvnRpIL9jOkNJTMWkxL8LJTYmiutPKIpoUtBk1oN/TX3nugrzxpNbfsyQruDHFfc=
X-Received: by 2002:a17:907:97c2:b0:ac6:ba92:79c9 with SMTP id
 a640c23a62f3a-ac6ba927fdbmr764161466b.18.1742997781816; Wed, 26 Mar 2025
 07:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20241111132149.1113736-1-chenhuacai@loongson.cn>
 <87o72lde9r.fsf@intel.com>
 <CAAhV-H6-yB5d8gXEH9TPHuzx0BJT+g8OCUmwTfSTTtqxfmcHDA@mail.gmail.com>
 <CAAhV-H7m0+-bHp0z0V+uySvBfPym4nMBCCTc5V80mYTfXjpuFA@mail.gmail.com>
In-Reply-To: <CAAhV-H7m0+-bHp0z0V+uySvBfPym4nMBCCTc5V80mYTfXjpuFA@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 26 Mar 2025 22:02:50 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6AecMYG0t-Ldxy68fm-_Wk4VjcdFfc-s6xwEeddUn-Ew@mail.gmail.com>
X-Gm-Features: AQ5f1JqAcbK99JZmna9O9PUlkNaNGzhBcul1c78t3rzI4dtNkJnBRRtx6Z5UClk
Message-ID: <CAAhV-H6AecMYG0t-Ldxy68fm-_Wk4VjcdFfc-s6xwEeddUn-Ew@mail.gmail.com>
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

Gentle ping, can this patch be merged into 6.15?

Huacai

On Mon, Jan 13, 2025 at 10:13=E2=80=AFPM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Dave,
>
> Gentle ping, can this patch be merged into 6.14?
>
> Huacai
>
> On Mon, Nov 25, 2024 at 2:00=E2=80=AFPM Huacai Chen <chenhuacai@kernel.or=
g> wrote:
> >
> > On Mon, Nov 11, 2024 at 10:41=E2=80=AFPM Jani Nikula
> > <jani.nikula@linux.intel.com> wrote:
> > >
> > > On Mon, 11 Nov 2024, Huacai Chen <chenhuacai@loongson.cn> wrote:
> > > > Commit dbbfaf5f2641a ("drm: Remove bridge support from legacy helpe=
rs")
> > > > removes the drm_bridge_mode_fixup() call in drm_crtc_helper_set_mod=
e(),
> > > > which makes the subsequent "encoder_funcs =3D encoder->helper_priva=
te" be
> > > > redundant, so remove it.
> > > >
> > > > Cc: stable@vger.kernel.org
> > > > Fixes: dbbfaf5f2641a ("drm: Remove bridge support from legacy helpe=
rs")
> > >
> > > IMO not necessary because nothing's broken, it's just redundant.
> > Maintainer is free to keep or remove the Cc and Fixes tag. :)
> >
> > Huacai
> >
> > >
> > > Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> > >
> > > > Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> > > > ---
> > > >  drivers/gpu/drm/drm_crtc_helper.c | 1 -
> > > >  1 file changed, 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/dr=
m_crtc_helper.c
> > > > index 0955f1c385dd..39497493f74c 100644
> > > > --- a/drivers/gpu/drm/drm_crtc_helper.c
> > > > +++ b/drivers/gpu/drm/drm_crtc_helper.c
> > > > @@ -334,7 +334,6 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *=
crtc,
> > > >               if (!encoder_funcs)
> > > >                       continue;
> > > >
> > > > -             encoder_funcs =3D encoder->helper_private;
> > > >               if (encoder_funcs->mode_fixup) {
> > > >                       if (!(ret =3D encoder_funcs->mode_fixup(encod=
er, mode,
> > > >                                                             adjuste=
d_mode))) {
> > >
> > > --
> > > Jani Nikula, Intel
