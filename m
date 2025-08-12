Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBE9B22D96
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 18:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEE210E61B;
	Tue, 12 Aug 2025 16:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VNne9xsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2D010E61B;
 Tue, 12 Aug 2025 16:30:31 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-76c03c6ded2so544833b3a.0; 
 Tue, 12 Aug 2025 09:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755016231; x=1755621031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8T/1xH98koL02eKJOzZQVca6m36I5E4mnDKNc4f/Gc0=;
 b=VNne9xsMsXksONcO3ooscMRhcAttFz0i36sGpdYIFyfObpswzNSuHMWt2zjQb/47Tg
 e+rb6em9KqEJz4GH5w6MVPZji7OVoSTQNf9uzG7CrsWE5Nq9mMgt256vgZ0vPN7zRFUg
 OS+qpbicRUfOSW3LfwZnWf/YhzifYA1eFqq5WZ/MlzdkR/kHey87dYTISfJ7C1cMCDTP
 K9mBCwKXfSB7eO4i5jU+xL7FfnlvawoIzNs+luxQNE1VCTqPGi5eJhXo95ZX1Kg9RKoy
 x2Wsz9Yz9V5qtFgZWRi0mCfD2e08BRyIJBqb8q5MXDczotK14wFaDFddRMM+3OfjEDn0
 YNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755016231; x=1755621031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8T/1xH98koL02eKJOzZQVca6m36I5E4mnDKNc4f/Gc0=;
 b=ITpL/2qJmkbU0cFwoc8SlIkzI/dhPP2riNQboqSzq3F3MW9+H+GqoTfbYkunJB/hOT
 w/DgySs/sjz2ipllu0hvrwPGhNct5hRMQzNPQ8YVfHpaF/EXqMDyFu+KHbf8koFWTM0q
 yRBEP3hr8KhZsdCftxWunTrGMPoCtIo4EMSm3LhCFs34p1dGTcTnWjQW9y1FPjoF9VIr
 He+d6lkFfOCcP5IjMxXuV9N1O2KfZPEwJG4+nThjmDxL24tsn1ObFcaaXPbvhp7tZney
 AF4ighBFxBP2HJMLPHWMR6wCvIiy6GFkGtO6enmPL6UsA9lYMTITB7ZgiT3fOOI2HYhe
 +5YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7cNK280twtxxVxhzP0OqitZ+mBVEWXck/ddBkIdf0IHeCAdn9Ip+6w4wSRb6bAtJJEvUNmj3KQKeo@lists.freedesktop.org,
 AJvYcCXz+UaMB14yTNZxBKY+3xjSL/upqxxuzoKL30k+zjI4I5p3Sac/q9xoeDr3ym4GGBMqSO30BZzR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwB6rYL6zih2sJiix4fGIWiQuTPAPPVhSf/yGufJ6pWod7aI10p
 JNJnFwY1XCveTs330k6ykSS/TxdODn6caiGPlHfDxcICzHJx5rDZ6kHpQ6bViji4sVaRcG87rAU
 mcEO5XooOaM3CeyeJawAaF3Dl+hjJIq4=
X-Gm-Gg: ASbGncvyl/aNaFKTtlAGZ9e4h4DwBd6LJ1Cg/GinIWNTLhGEu7cxPMOdZzXfK9j4nK0
 +9HSvuvdMbw824bE64tHgQAdYpfyk9cknunPpqDTzYQeh2uzHIt8tyrc3HhQFBd/8Oic+KaM3LH
 PZb3FUVP96dtmxrnVi0FNavWLs7qaORokJxcPlz3oblbH7VKwOBl947FKcy25zLCUALmHm0cySO
 08SoLo=
X-Google-Smtp-Source: AGHT+IF6LenLB7j3sb0DjrhGCwQFdll3J05cq7yX/orGvMVj4rpQ84UCdUaSMteeycXpCZf2PJiFy6FVwOGq6PrKN7s=
X-Received: by 2002:a17:903:2281:b0:240:711f:2068 with SMTP id
 d9443c01a7336-24306d87e8cmr13447905ad.7.1755016231149; Tue, 12 Aug 2025
 09:30:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250812031603.463355-1-zhao.xichao@vivo.com>
 <0811e8e8-5990-4880-a2cc-f9bd6b3ec4bd@amd.com>
In-Reply-To: <0811e8e8-5990-4880-a2cc-f9bd6b3ec4bd@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 12 Aug 2025 12:30:19 -0400
X-Gm-Features: Ac12FXwysyVxVP_3MLSXv30V9nQuvTxCQ2luc4NpmdCvnL8zlEQC9gaSc1twh5g
Message-ID: <CADnq5_ON4rM2LRAw88iyBCTVJ+nB61-EZy2vxLVc48oxk=Gbew@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: replace min/max nesting with clamp()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, alexander.deucher@amd.com,
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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

On Tue, Aug 12, 2025 at 2:49=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 12.08.25 05:16, Xichao Zhao wrote:
> > The clamp() macro explicitly expresses the intent of constraining
> > a value within bounds.Therefore, replacing min(max(a, b), c) and
> > max(min(a,b),c) with clamp(val, lo, hi) can improve code readability.
> >
> > Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >  drivers/gpu/drm/radeon/radeon_display.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/=
radeon/radeon_display.c
> > index b4bf5dfeea2d..d66c1a30df95 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -926,10 +926,10 @@ static void avivo_get_fb_ref_div(unsigned nom, un=
signed den, unsigned post_div,
> >                                unsigned *fb_div, unsigned *ref_div)
> >  {
> >       /* limit reference * post divider to a maximum */
> > -     ref_div_max =3D max(min(100 / post_div, ref_div_max), 1u);
> > +     ref_div_max =3D clamp(100 / post_div, 1u, ref_div_max);
> >
> >       /* get matching reference and feedback divider */
> > -     *ref_div =3D min(max(den/post_div, 1u), ref_div_max);
> > +     *ref_div =3D clamp(den / post_div, 1u, ref_div_max);
> >       *fb_div =3D DIV_ROUND_CLOSEST(nom * *ref_div * post_div, den);
> >
> >       /* limit fb divider to its maximum */
>
