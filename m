Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7302AEF07C
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 10:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C703810E51C;
	Tue,  1 Jul 2025 08:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OWn1LUWt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8996F10E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 08:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751357216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/xLK3zn6hnNDwcaFv8tczFp10l9/ZMwRevm7NRDXVYA=;
 b=OWn1LUWth0xDcEPG/oo+QIU1aBo+zUj7KVIgY1qpnNrThZqaN1MuGlOBb5k/M7sHYUESpm
 4R+78ABytnq5xhES5lmk4+6b0F+jwFOlAcEAjPe4QUvRh5YCxHRkFIzb+rBoyqhE9ZYZZr
 eyVsTKef1ASBoEuMYZPSwV3vAg0pGIY=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-MJmPuJccN6OVTuuYpONpdg-1; Tue, 01 Jul 2025 04:06:55 -0400
X-MC-Unique: MJmPuJccN6OVTuuYpONpdg-1
X-Mimecast-MFC-AGG-ID: MJmPuJccN6OVTuuYpONpdg_1751357214
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-3132e7266d3so3106265a91.2
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jul 2025 01:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751357214; x=1751962014;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/xLK3zn6hnNDwcaFv8tczFp10l9/ZMwRevm7NRDXVYA=;
 b=V6tDVmjut2DKhJxInIH6IgT1C0nK6iimE2HgZ5yVQTXrG9KOcxDRrTzgsr/5XLI4fU
 /2d4rCt1xd3NNIq7TGUFoT9xJFA4VhaM0kO0IZoJgK+EaITnVm93mZFJQl0l//l04eH3
 yZitshL0Wz2jAP3QTTmhKZbXhdvqWE6XRcLOdfNXk9eOaH6XQ8zGOv8vKUyrPdWZYcJh
 9nPCQ/rbx5moHx59JsUUzAo4x48ZWlKAusxqs1KCmX7+Laco/cX4WWDRTfS6WBnTnk86
 HK3a/AGUpCpwgSyWNFd/mHIgt+IJpQFB9Y+DVe7jYf+IZuSXdsM4/ErLlFWutn4xiFhs
 BoeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUnmkgeLjGz6hzHQY3FMNCGxlIOvUHi+bl36d+PTP2GGTfrnrEubXbESaqy2IwXERBUI9HFaqK400=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWUYcpXbtS7H12vWEGOVVMyPHXp6r/T6oTZLx1x4CuXebBfrzW
 7c7hfXuI93KWsz/jEzE22ic4ZBPm2ZqJTQvtK1Qg/ogv6zAk/dMpMKun3js4jkDkSy14BqlCLZ+
 51qV3Fs025I9g3sta2sylHU/vwleKbUr/uFAnVjh2sOYqCejCqLbqyH9rimP0xL+DG+/ZYxwJ5C
 gAx7uAMcDBgpQi1JQzIQj0q8chCNSugFZbDCkITaZRD6rz
X-Gm-Gg: ASbGncvE1cM701Fyd4HtUyk99LrazZqYFlLpiHE1wJEc14gClk6ra3oPtV4j4dx+0dP
 rlNheemMUTaLVyxwFPHJESbSiXbJr48dM0R6BFVRwkBFrJ4d5dlRsgLD9XKwk4MYSHCdkWd0HuF
 8SIw==
X-Received: by 2002:a17:90a:e7d0:b0:311:a314:c2d1 with SMTP id
 98e67ed59e1d1-318c910dd2amr21627771a91.6.1751357214186; 
 Tue, 01 Jul 2025 01:06:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnPC7dxHW1zo1ojXv0A3+oYFSOsb2eKLl2v85+jsxM/Gh14AF4yL16yb/X0R8sTooo30Idk4IynWvdgK97ZxE=
X-Received: by 2002:a17:90a:e7d0:b0:311:a314:c2d1 with SMTP id
 98e67ed59e1d1-318c910dd2amr21627730a91.6.1751357213713; Tue, 01 Jul 2025
 01:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
 <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
In-Reply-To: <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 1 Jul 2025 18:06:42 +1000
X-Gm-Features: Ac12FXxXfpBXAeVSqi2RcEI9hELPChB3FlteEOITqF5PoK6jsBCqVxmbsPeC3lw
Message-ID: <CAMwc25q-kBRGDrphU+iAyqENZhgdRtEnSrR9z6b5bQ_JFzzK2g@mail.gmail.com>
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Dave Chinner <david@fromorbit.com>, 
 Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zEjBXC6GKvT4zyY_7o4o55eF_PBeyErnkhjaj3BnK_Y_1751357214
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

On Tue, Jul 1, 2025 at 5:22=E2=80=AFPM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 30.06.25 23:33, David Airlie wrote:
> > On Mon, Jun 30, 2025 at 8:24=E2=80=AFPM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 30.06.25 06:49, Dave Airlie wrote:
> >>> From: Dave Airlie <airlied@redhat.com>
> >>>
> >>> This just adds the obj cgroup pointer to the bo and tt structs,
> >>> and sets it between them.
> >>>
> >>> Signed-off-by: Dave Airlie <airlied@redhat.com>
> >>> ---
> >>>  drivers/gpu/drm/ttm/ttm_tt.c | 1 +
> >>>  include/drm/ttm/ttm_bo.h     | 6 ++++++
> >>>  include/drm/ttm/ttm_tt.h     | 2 ++
> >>>  3 files changed, 9 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_t=
t.c
> >>> index 8f38de3b2f1c..0c54d5e2bfdd 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> >>> @@ -162,6 +162,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm=
,
> >>>       ttm->caching =3D caching;
> >>>       ttm->restore =3D NULL;
> >>>       ttm->backup =3D NULL;
> >>> +     ttm->objcg =3D bo->objcg;
> >>>  }
> >>>
> >>>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> >>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> >>> index 099dc2604baa..f26ec0a0273f 100644
> >>> --- a/include/drm/ttm/ttm_bo.h
> >>> +++ b/include/drm/ttm/ttm_bo.h
> >>> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
> >>>        * reservation lock.
> >>>        */
> >>>       struct sg_table *sg;
> >>> +
> >>> +     /**
> >>> +      * @objcg: object cgroup to charge this to if it ends up using =
system memory.
> >>> +      * NULL means don't charge.
> >>> +      */
> >>> +     struct obj_cgroup *objcg;
> >>>  };
> >>>
> >>>  #define TTM_BO_MAP_IOMEM_MASK 0x80
> >>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> >>> index 15d4019685f6..c13fea4c2915 100644
> >>> --- a/include/drm/ttm/ttm_tt.h
> >>> +++ b/include/drm/ttm/ttm_tt.h
> >>> @@ -126,6 +126,8 @@ struct ttm_tt {
> >>>       enum ttm_caching caching;
> >>>       /** @restore: Partial restoration from backup state. TTM privat=
e */
> >>>       struct ttm_pool_tt_restore *restore;
> >>> +     /** @objcg: Object cgroup for this TT allocation */
> >>> +     struct obj_cgroup *objcg;
> >>>  };
> >>
> >> We should probably keep that out of the pool and account the memory to=
 the BO instead.
> >>
> >
> > I tried that like 2-3 patch posting iterations ago, you suggested it
> > then, it didn't work. It has to be done at the pool level, I think it
> > was due to swap handling.
>
> When you do it at the pool level the swap/shrink handling is broken as we=
ll, just not for amdgpu.
>
> See xe_bo_shrink() and drivers/gpu/drm/xe/xe_shrinker.c on how XE does it=
.

I've read all of that, but I don't think it needs changing yet, though
I do think I probably need to do a bit more work on the ttm
backup/restore paths to account things, but again we suffer from the
what happens if your cgroup runs out of space on a restore path,
similiar to eviction.

Blocking the problems we can solve now on the problems we've no idea
how to solve means nobody gets experience with solving anything.

> So the best we can do is to do it at the resource level because that is c=
ommon for everybody.
>
> This doesn't takes swapping on amdgpu into account, but that should not b=
e that relevant since we wanted to remove that and switch to the XE approac=
h anyway.

I don't understand, we cannot do it at the resource level, I sent
patches to try, they don't fundamentally work properly, so it isn't
going to fly. We can solve it at the pool level, so we should, if we
somehow rearchitect things later to solve it at the resource level,
but I feel we'd have to make swap handling operate at the resource
level instead of tt level to have any chance.

Swapping via the backup/restore paths should be accounted properly,
since moving pages out to swap one way cgroups can reduce the memory
usage, if we can't account that swapped pages aren't removed from the
page count, then it isn't going to work properly.

Dave.

