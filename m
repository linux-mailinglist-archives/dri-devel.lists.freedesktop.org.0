Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC011B3F209
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 03:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449BC10E030;
	Tue,  2 Sep 2025 01:57:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KH4FlpPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38AA10E030
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 01:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756778256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qXmmJ+viLP3oc3bL0dWAhXPupqgIlHsuLVkrNuCGzvo=;
 b=KH4FlpPQ/BueNQeVhXjGdIqkQZuooXD87h6hlDHmsxjrZJDQGyBt5p0V1uUsmmZ5nN1FIF
 tWVWMgPE5OOAEyTUPJi+PF4MEFsPLphm3JV7XGAMfcXx3jAgC9Q0qFWurSWNmMtl8i3uwp
 cAiSi2QaR6gDQeWkA9S9yl5JUfjUoOA=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-_okSUjayN4yHfJwFilLcfw-1; Mon, 01 Sep 2025 21:57:35 -0400
X-MC-Unique: _okSUjayN4yHfJwFilLcfw-1
X-Mimecast-MFC-AGG-ID: _okSUjayN4yHfJwFilLcfw_1756778254
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-327594fd627so4955046a91.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 18:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756778254; x=1757383054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qXmmJ+viLP3oc3bL0dWAhXPupqgIlHsuLVkrNuCGzvo=;
 b=V0pDf49qnHMTEktrl9rjamupimft3SXhHSik0n/1/TCk9QBHAKE0xFSHJlwaRUIYC9
 X7OY8CQF/YMfCjQb/8ah8QI79s6Ewi9IEw6BBNK7NxEJjcEzGW0w8wGzftL7xnOOmkLU
 2S46rfBsrAu0n4O/13QsxTZKMDCgnBlxe+ZyokyUikqKSeFlF/YKZ7bhpPeWxBzFdExF
 XqdNpGsYhv39cfeRhP443DjG520MWTzwNHPepuNot+BtFV171PVBgRyGbIbyS9VIW/t8
 4J4d4cfvkOMc+BjbAa5WsZOnwAC1tXGXSr9juJU1OB6GSXTAuOnsORDQAViW7eoXaAuD
 HiIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAm8hswFYWx2XeR0RkFIf0ldYnpjCqk+1urumIOVPEWiiInLLVOCa5B9lVy7EsOi9cDEuS0Ouow6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywV5xmPs5tmCEI09PgFqa8Fhx7tHsJoidakM1rNLmMg+I5ca8D
 jynIogzrzqY/CWybJQmqbEc65OQpAa+QblMyq6I+Tf0h/gUBjiB2rWrE0k0vFKA99b01T5mMhGe
 dx2zdDgYrQpUZZPt0QUpi4LuJhFtCtFuPwGk6PQ1m4WtkxvgZsTGd7ls7dIBoAFoRirvQp4duTA
 WGJtzKbDHKHCzA0qpNVoM8qHOheyFTWF1RePKMrU1KkW9G
X-Gm-Gg: ASbGncvaCkf2iDDrb8POkBlOjjWAJV2VyvYXZWE3ZYE0P5nOLIJzble14Ft1oRZh89c
 06mDK74SyUbLz6TXXPknyLlInXca0W30G2Q0RtfU8dSe+VAv+IweL+K7v3JvHO2Tg5ZMNKI4IJ/
 9L2piMBbbYTBXndncqskg=
X-Received: by 2002:a17:90b:38d0:b0:327:aaeb:e806 with SMTP id
 98e67ed59e1d1-328156bab50mr10832578a91.22.1756778254268; 
 Mon, 01 Sep 2025 18:57:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFL+yC24A0zidXa7vI6FzYsKlA362IDTf5kqGu/GeWNpPvu23+KQZGfigUnIlNRu+SAXa4dflBt8zY+fjeakCM=
X-Received: by 2002:a17:90b:38d0:b0:327:aaeb:e806 with SMTP id
 98e67ed59e1d1-328156bab50mr10832556a91.22.1756778253870; Mon, 01 Sep 2025
 18:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250901045618.1853752-1-airlied@gmail.com>
 <700e88048fd7dc58c3d5a3d91f80595a2f8c3353.camel@linux.intel.com>
 <CAMwc25rLxWtz06SaGAfW5T1NPCwxmXSJEy-=MQ9JNwEfHRQaQQ@mail.gmail.com>
In-Reply-To: <CAMwc25rLxWtz06SaGAfW5T1NPCwxmXSJEy-=MQ9JNwEfHRQaQQ@mail.gmail.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 2 Sep 2025 11:57:22 +1000
X-Gm-Features: Ac12FXwb930tuo9rYckupqGchJ2VspReD_B2VUjfh3Sht653DjYytlmHhDKy1UQ
Message-ID: <CAMwc25r2JBM1jL9y257zR57C4hZH4ZB-Z39a92mp76qStEUqAQ@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/ttm: make sure exported objects are populated
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Christian Koenig <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7c_3qpVqJ-GOFjdPO4FUrpokrTEEdgl9n-m6C6h7j2k_1756778254
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

On Tue, Sep 2, 2025 at 11:22=E2=80=AFAM David Airlie <airlied@redhat.com> w=
rote:
>
> On Mon, Sep 1, 2025 at 6:02=E2=80=AFPM Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Mon, 2025-09-01 at 14:56 +1000, Dave Airlie wrote:
> > > From: Dave Airlie <airlied@redhat.com>
> > >
> > > While discussing cgroups we noticed a problem where you could export
> > > a BO to a dma-buf without having it ever being backed or accounted
> > > for.
> > >
> > > This meant in low memory situations or eventually with cgroups, a
> > > lower privledged process might cause the compositor to try and
> > > allocate
> > > a lot of memory on it's behalf and this could fail. At least make
> > > sure the exporter has managed to allocate the RAM at least once
> > > before exporting the object.
> >
> > With a shmem analogy, let's say process A creates a shmem object and
> > doesn't populate it. It's then shared with process B which faults in
> > the pages or otherwise causes it to be populated. Will this patch
> > ensure we behave the same WRT memory usage accounting?
> >
>
> I wandered down a few holes, but with cgroup v2, owner pays seems to
> be how it works.
>
> They use the inode which records the cgroup owner who created it.
>
> cgroups v1 did it the other way, but I think we should ignore that.
>

Also it does the allocations at fault time, however since we share our
buffers with hw and higher privilege apps like compositors, allowing
one process to ENOMEM those seems like a bad plan.

This doesn't fully stop it, but at least makes sure the originating
process can allocate the backing store.

Dave.

>
> > Also some concerns below.
> >
> > I think we'd want to have the caller (driver) provide the
> > ttm_operation_ctx. The driver may want to subclass or call
> > interruptible.
>
> Indeed, might make more sense, though I think we should only be
> calling this after creating an object in most cases,
> >
> >
> > > +
> > > +     int ret;
> > > +
> > > +     if (!bo->ttm)
> > > +             return 0;
> > > +
> > > +     if (bo->ttm && ttm_tt_is_populated(bo->ttm))
> > > +             return 0;
> > > +
> >
> > bo->ttm is not safe to reference without the bo lock. Nor is the
> > ttm_tt_is_populated stable without the bo lock since you may race with
> > a swapout / shrink.
>
> Indeed, I was probably being a bit hacky here, I'll always reserve first.
>
> Dave.
> >
> > Thanks,
> > Thomas
> >
> >
> > > +     ret =3D ttm_bo_reserve(bo, false, false, NULL);
> > > +     if (ret !=3D 0)
> > > +             return ret;
> > > +
> > > +     ret =3D ttm_bo_populate(bo, bo->resource->placement &
> > > TTM_PL_FLAG_MEMCG, &ctx);
> > > +     ttm_bo_unreserve(bo);
> > > +     return ret;
> > > +}
> > > +EXPORT_SYMBOL(ttm_bo_setup_export);
> > > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > > index c33b3667ae76..5cdd89da9ef5 100644
> > > --- a/include/drm/ttm/ttm_bo.h
> > > +++ b/include/drm/ttm/ttm_bo.h
> > > @@ -473,6 +473,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object
> > > *bo);
> > >  int ttm_bo_populate(struct ttm_buffer_object *bo,
> > >                   bool memcg_account,
> > >                   struct ttm_operation_ctx *ctx);
> > > +int ttm_bo_setup_export(struct ttm_buffer_object *bo);
> > >
> > >  /* Driver LRU walk helpers initially targeted for shrinking. */
> > >
> >

