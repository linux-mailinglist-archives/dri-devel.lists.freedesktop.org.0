Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6FACC179
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F66910E05B;
	Tue,  3 Jun 2025 07:52:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KF6CDlG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD8910E05B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748937136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kNF0NhrnpBjr+OpZEdo0is+XI4BKTJF/oCeQEIwTPXM=;
 b=KF6CDlG77wLzpzeFWZWIlXd+5fzQAftZdDwZZL6POmbHfxtfTPfecYua+apyraxfQsvnwi
 GtnWKGidgsXh3Ui+kRRBenKEQbfCgYSOlsgki04FAWPSoIGQQeV87WwfoMEISTHsEcxvda
 qjRBy63ZESCc85apbTd4R7Fu8bLShoo=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-aAgxwNzRO1-9VpgnWCMa0g-1; Tue, 03 Jun 2025 03:52:15 -0400
X-MC-Unique: aAgxwNzRO1-9VpgnWCMa0g-1
X-Mimecast-MFC-AGG-ID: aAgxwNzRO1-9VpgnWCMa0g_1748937134
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b2c3e576201so5208130a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748937134; x=1749541934;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNF0NhrnpBjr+OpZEdo0is+XI4BKTJF/oCeQEIwTPXM=;
 b=Nz94gV8aVspHRL98XtoQmCNchIL88YRyhV4tLfMBMzvB4lL1kHnBHnp/KDJAOYg4Xj
 qS/EFGw+ip0q0HknY9B70aSGgPYw1engqq+xoTYO5YZyiaDkRd2QWmhtrAXqu1hndKyN
 x5roQQFdHwyU5GKuv28uuQZkFMO5UPg/ZleL/H2JDxqvtI56Iysb4ELLpSlh2YtJydc4
 59X9e815WrD2QmCb0nXU3SqK27s0SdLWW07moN6t2ur2Ro1K6fdepdRIabtfD3um6Q5W
 DgvQVXQFqayszqXBuHCfnc/sKK4LF3zkznuiEl2KJA73TEbn9ffSPAdbrsji5I0vIsMp
 i6rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWF56aVREQKMckfS6RZYHJrmKD8BOp2OJvNM/pEtSqK1KAwKgWRVHA5t6HcWLN+qY+QG85u8m+IwI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBiVKFI6uWSpfJhLgtjJ15X/79A4IOk5+1cwfDElbOSQQLo02c
 +RALYtnlW66dmXX6XwMYRZNLAur6ZmwZld04WReJgdG7S9lAeABmgpWERuhbrnJFPhBwG1uopwy
 2nCKdkwwWGh+94KW/ozibvYZ+0gEnasSR+as7IpaNIyVjB88lx4Du8qQTRbwywVkgHUsjTmZ9Vh
 sfYoLx7SGUArRyz27m9t+NpKK4wVV9oSTzWDtEMQlA6QqW
X-Gm-Gg: ASbGncsTzJnTWHk7v77I/8C7319O7fBw8/FHGyu/FxSRoArzogrjnMU/duKW0y8wCeR
 u/j4pT1omwvMeWXP6oxz43Iuy4yW2owT5LwkJozTZ/18bRQFhzJ/PANf920JIHLzrN/Y=
X-Received: by 2002:a17:90b:4d:b0:30c:4bac:1da1 with SMTP id
 98e67ed59e1d1-312e8039bacmr2401867a91.17.1748937134432; 
 Tue, 03 Jun 2025 00:52:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4Oq0aIlV5JuNb84EiPzwMe/C0ymr+Kif1yRfiNa1Qf7WYrXg88PIZrkgKisXAJAFGcLE8Zk+SPInbXc2lmFE=
X-Received: by 2002:a17:90b:4d:b0:30c:4bac:1da1 with SMTP id
 98e67ed59e1d1-312e8039bacmr2401841a91.17.1748937134062; Tue, 03 Jun 2025
 00:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250602204013.1104258-1-airlied@gmail.com>
 <92e31f45-1f8c-4081-8865-a2aee7a2935e@amd.com>
In-Reply-To: <92e31f45-1f8c-4081-8865-a2aee7a2935e@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 3 Jun 2025 17:52:01 +1000
X-Gm-Features: AX0GCFvncOKGk_3HJDmMNK5Uiq7Yb8JwoeX7xV-eElpcdkocE8hNuCSPb6ZHV6g
Message-ID: <CAMwc25oAjBwnpE4CfAPu4SvUia8QRVe0Q3dN-msXVXeEw1UDtA@mail.gmail.com>
Subject: Re: [PATCH] ttm/pool: allow debugfs dumps for numa pools.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Op079jz1sHc8zwjWc-gtvdC94wZvs5T1XlKVqbYVhTU_1748937134
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

On Tue, Jun 3, 2025 at 5:47=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 6/2/25 22:40, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > Currently you can't see per-device numa aware pools properly.
> >
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Any follow up patch to wire this up in amdgpu?

Just seems to work, at least I tested it on a 4 node MI300A system
this morning and

/sys/kernel/debug/dri/*/ttm_page_pool seems to reflect the correct pools.

Dave.

>
> Regards,
> Christian.
>
> > ---
> >  drivers/gpu/drm/ttm/ttm_pool.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index ccc3b9a13e9e..43b69d061dff 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -1253,7 +1253,7 @@ int ttm_pool_debugfs(struct ttm_pool *pool, struc=
t seq_file *m)
> >  {
> >       unsigned int i;
> >
> > -     if (!pool->use_dma_alloc) {
> > +     if (!pool->use_dma_alloc && pool->nid =3D=3D NUMA_NO_NODE) {
> >               seq_puts(m, "unused\n");
> >               return 0;
> >       }
> > @@ -1262,7 +1262,12 @@ int ttm_pool_debugfs(struct ttm_pool *pool, stru=
ct seq_file *m)
> >
> >       spin_lock(&shrinker_lock);
> >       for (i =3D 0; i < TTM_NUM_CACHING_TYPES; ++i) {
> > -             seq_puts(m, "DMA ");
> > +             if (!ttm_pool_select_type(pool, i, 0))
> > +                     continue;
> > +             if (pool->use_dma_alloc)
> > +                     seq_puts(m, "DMA ");
> > +             else
> > +                     seq_printf(m, "N%d ", pool->nid);
> >               switch (i) {
> >               case ttm_cached:
> >                       seq_puts(m, "\t:");
>

