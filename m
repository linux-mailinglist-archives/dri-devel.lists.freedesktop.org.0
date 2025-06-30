Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D91E3AEE978
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 23:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE97D10E163;
	Mon, 30 Jun 2025 21:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BcAxkr2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07A910E163
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 21:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751319206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uRipfUvynsYJW+L/c2yDmraeLEE+XADK7p9pX6mD7Z0=;
 b=BcAxkr2VFu2/niquzeGs7FS176v9bXyYTQeTwXbOIGWPbuEJMCk6YWh5K0F13LSTNZ97Td
 THni193VsA/kTDmPaipNDs6RSJy2zxFOq90Nw0FMqCxB3XUBwqaK3O10AXiDiOxQ8NycWv
 ytP1R4Gr45xk7/IYqfBmbiEKnl5FtYc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-ymgunY19M4a3yed0r44w3Q-1; Mon, 30 Jun 2025 17:33:24 -0400
X-MC-Unique: ymgunY19M4a3yed0r44w3Q-1
X-Mimecast-MFC-AGG-ID: ymgunY19M4a3yed0r44w3Q_1751319203
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-313f8835f29so3260079a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 14:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751319203; x=1751924003;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uRipfUvynsYJW+L/c2yDmraeLEE+XADK7p9pX6mD7Z0=;
 b=xG1gbZ3xJCeLZuge7A7gxkye6fYc7MdrG2B/KPeM8BLPVm7RxY2ZP+x+0xhGwnrIrb
 XnnHgc3YHteEJ9sdmVNmgEfecjFGS+14rHHsBUQPjVvAfHp9TZKGG68Eun2Zx/2Smzeu
 SlUvp8rs9/F/8ufDFiIJISHFVTdajKsXKjbzNnpA+abdUKyiCzxCLPqqhhQbWsksqA1B
 x9a86E1bZserp955zW/o5KPXQLOYP1Ng9BJ9Lq2LHHCa+bJcWou2OeZonV//L+8iuB24
 +cRGxPip3mf22N5DjC30XOxEoxT/mmBc0ftMbCRavqNVQYG8PdPICzheuLSXepXVizqI
 1cGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBw9NJE7k21DTW41EUjw7mdV6n0AF0ow9pIxdwUUVETbbbp95kD6/RNY6iVdUSNGJ6aMj699+6kh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdN2ILiyIUwWnwt1hv1CA3Kw6WxqOKXtJGUJWBju5pv2P7FxrG
 sPseOUj/NKEVak/qmr7zXxQ5ApdXux05g6cVSEUr1JiO3iOt9kqbLVzX3LgXYXAVyVlDpWtKiKa
 TyrQro6WLvYB90DRC6Ib02vZ9Cml82FCWgzPzkE9i6ECLOemk48pRmuNCsxVRIx3TDqhtKnmZb5
 nE8oKHaXfK09AXnURrxZEEeEMcbg85zJ2hFgsNbbKfc6bR
X-Gm-Gg: ASbGnctHXCroPvC6y8hXyI4HGLI3BIhZXGCiNfUPvuqwmPp43saYO/avQhcuDYL1j0J
 oAIpMN/2ug2S2odYSXL79VeaJCwezkTh8DTVnIGOys+/yIc0RSx53X3afKq+KbBmott1+4ncVg4
 Pbyw==
X-Received: by 2002:a17:90b:3fce:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-318c9264529mr17622125a91.23.1751319203447; 
 Mon, 30 Jun 2025 14:33:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqg2o51zhq56WLv69kYGV3nNVs9+TdNBjRo711c3QDSRCQaV4A3ogK5nXmt2zDPVPgcWOZOtQQmh0PYqdHM6A=
X-Received: by 2002:a17:90b:3fce:b0:312:1d2d:18df with SMTP id
 98e67ed59e1d1-318c9264529mr17622104a91.23.1751319203070; Mon, 30 Jun 2025
 14:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
In-Reply-To: <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 1 Jul 2025 07:33:11 +1000
X-Gm-Features: Ac12FXxt4yS2fvwtwEW5S1tZQdP1QGKqfCcJBug37YhiJtl9z2hpJMi6DWlAL0Q
Message-ID: <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DKegK7k2jn8-UqV_DGG_lqeZ6o5MVNJ4vSTfvbY4TpA_1751319203
X-Mimecast-Originator: redhat.com
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

On Mon, Jun 30, 2025 at 8:24=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 30.06.25 06:49, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This just adds the obj cgroup pointer to the bo and tt structs,
> > and sets it between them.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_tt.c | 1 +
> >  include/drm/ttm/ttm_bo.h     | 6 ++++++
> >  include/drm/ttm/ttm_tt.h     | 2 ++
> >  3 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.=
c
> > index 8f38de3b2f1c..0c54d5e2bfdd 100644
> > --- a/drivers/gpu/drm/ttm/ttm_tt.c
> > +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> > @@ -162,6 +162,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
> >       ttm->caching =3D caching;
> >       ttm->restore =3D NULL;
> >       ttm->backup =3D NULL;
> > +     ttm->objcg =3D bo->objcg;
> >  }
> >
> >  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index 099dc2604baa..f26ec0a0273f 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -135,6 +135,12 @@ struct ttm_buffer_object {
> >        * reservation lock.
> >        */
> >       struct sg_table *sg;
> > +
> > +     /**
> > +      * @objcg: object cgroup to charge this to if it ends up using sy=
stem memory.
> > +      * NULL means don't charge.
> > +      */
> > +     struct obj_cgroup *objcg;
> >  };
> >
> >  #define TTM_BO_MAP_IOMEM_MASK 0x80
> > diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> > index 15d4019685f6..c13fea4c2915 100644
> > --- a/include/drm/ttm/ttm_tt.h
> > +++ b/include/drm/ttm/ttm_tt.h
> > @@ -126,6 +126,8 @@ struct ttm_tt {
> >       enum ttm_caching caching;
> >       /** @restore: Partial restoration from backup state. TTM private =
*/
> >       struct ttm_pool_tt_restore *restore;
> > +     /** @objcg: Object cgroup for this TT allocation */
> > +     struct obj_cgroup *objcg;
> >  };
>
> We should probably keep that out of the pool and account the memory to th=
e BO instead.
>

I tried that like 2-3 patch posting iterations ago, you suggested it
then, it didn't work. It has to be done at the pool level, I think it
was due to swap handling.

Dave.

