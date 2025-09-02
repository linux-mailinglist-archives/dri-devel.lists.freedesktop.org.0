Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 401AAB3F1DC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 03:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2222A10E558;
	Tue,  2 Sep 2025 01:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DdHXGY/r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E4310E558
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 01:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756776153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7jwMJleJNZACe76OHAr2kgsbXWFI3H9veTE8yHeTJ30=;
 b=DdHXGY/rE5nsc/ZuBA0TaEIyfMOwsGauoJdu8gI1xxVlxxGQV3TDWkXZAq0qFF8dfa41x+
 av4TEkBPXG7HPPtkIx2M+vjFaRAwiIeTF+03RhKHZ82xiFpKudqiGhFGXgMwbaXAgZaHpi
 NChNm6rl8v+Qplbefffm/BN8F3XY+5M=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-EN3BJlmfPnCkGRuSLWETMA-1; Mon, 01 Sep 2025 21:22:30 -0400
X-MC-Unique: EN3BJlmfPnCkGRuSLWETMA-1
X-Mimecast-MFC-AGG-ID: EN3BJlmfPnCkGRuSLWETMA_1756776149
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b4cf03610fdso5076856a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 18:22:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756776149; x=1757380949;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jwMJleJNZACe76OHAr2kgsbXWFI3H9veTE8yHeTJ30=;
 b=Gh7kYmoM80gsgJcDv9jui/RHczk6t0VHu1aqSgQrJnziIqpK+ReW1sLjgRr9PLo4Qx
 AMqtTPnVWgg9gsFcpDyXOlrP8RTP7s+DUTjxSy3WHwzFVeUmujxW9JoScTE6DNGMNaht
 OjU9DJHIbjByUce5ExVkTPF9jBdJmiCCuDyqOCc+85Bt4pPlCIJAP+lpIOfOqvFESmP1
 XVbUq88CQcRjMx7gj3okUH/xPngmQ2Y1oYRKyzA8W69hodhO3K5MGsN8f8/8npkCf+vg
 UQKCjeOBDttqUosFhE1nixGUYBpe2VhAm294WvFvXovq/5KTAZ4SbOU/cApf0dO6CaKb
 Bkpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnEmQo8zGJC8b9BuPHRLe2lIp3hjIRbmRvPUFbArU7qT3j2I6TJVizSnS0BiTGhwUfJC/Im1v1cJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1qrdmVJyE5cxkPcCoBuDBnb9dXOj1BmlQMgcLEbss36g+dYbU
 sj0z4byQrjq6VNsxHhSRE9UDtZbEr56Wzf2xZy/pa/dw5r5CiBg78gGj9dIOIyZnvnN5H388SXF
 Ilij1rjnMNLvxYBEBfUNKMrnGmOFrt97m9/gmyLehaOYCyLhp64EiW6eR0047XKRbfRoMgImw3z
 aLK/kf58/oMde4d75jpPAJcMswbAIo/mro19nP5+2pvyhgTd9Cc5y+
X-Gm-Gg: ASbGncvZGFvyRh8p7iCEa3UMy/2yMvqVv5wko1RbTh1xpHpUVuk0xucWT9UFelweIko
 RyBrxo/yPmZInPG/B6mlTCZGIFabXBJLV4IetCTIXKYLUCpCg9QZxXDSjeFTtf8C2CYd0U04aSJ
 fu2UKsOo6e5/+jZyDUwqg=
X-Received: by 2002:a17:903:41c9:b0:249:147:95bb with SMTP id
 d9443c01a7336-249448de13fmr106188175ad.13.1756776148841; 
 Mon, 01 Sep 2025 18:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaSNiKFFjzVeP4+fDJ/BC461VhTkYDpg1tyD+/pGTw9K7iG11k9/g1Vi/oI5B0XcIeXNHJdz2qLbKIXFJaMcU=
X-Received: by 2002:a17:903:41c9:b0:249:147:95bb with SMTP id
 d9443c01a7336-249448de13fmr106187995ad.13.1756776148488; Mon, 01 Sep 2025
 18:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250901045618.1853752-1-airlied@gmail.com>
 <700e88048fd7dc58c3d5a3d91f80595a2f8c3353.camel@linux.intel.com>
In-Reply-To: <700e88048fd7dc58c3d5a3d91f80595a2f8c3353.camel@linux.intel.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 2 Sep 2025 11:22:17 +1000
X-Gm-Features: Ac12FXwbRgCAWv_PEgpwqyFBUFjeib-ckcfKPkDaYhZooMmeIl-RXGupHhTfCPI
Message-ID: <CAMwc25rLxWtz06SaGAfW5T1NPCwxmXSJEy-=MQ9JNwEfHRQaQQ@mail.gmail.com>
Subject: Re: [PATCH] amdgpu/ttm: make sure exported objects are populated
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Christian Koenig <christian.koenig@amd.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SOgCxbtJ-SFVZ_i_rc-B7laNcK9FaB7ciZwEvcYDUSg_1756776149
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

On Mon, Sep 1, 2025 at 6:02=E2=80=AFPM Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Mon, 2025-09-01 at 14:56 +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > While discussing cgroups we noticed a problem where you could export
> > a BO to a dma-buf without having it ever being backed or accounted
> > for.
> >
> > This meant in low memory situations or eventually with cgroups, a
> > lower privledged process might cause the compositor to try and
> > allocate
> > a lot of memory on it's behalf and this could fail. At least make
> > sure the exporter has managed to allocate the RAM at least once
> > before exporting the object.
>
> With a shmem analogy, let's say process A creates a shmem object and
> doesn't populate it. It's then shared with process B which faults in
> the pages or otherwise causes it to be populated. Will this patch
> ensure we behave the same WRT memory usage accounting?
>

I wandered down a few holes, but with cgroup v2, owner pays seems to
be how it works.

They use the inode which records the cgroup owner who created it.

cgroups v1 did it the other way, but I think we should ignore that.


> Also some concerns below.
>
> I think we'd want to have the caller (driver) provide the
> ttm_operation_ctx. The driver may want to subclass or call
> interruptible.

Indeed, might make more sense, though I think we should only be
calling this after creating an object in most cases,
>
>
> > +
> > +     int ret;
> > +
> > +     if (!bo->ttm)
> > +             return 0;
> > +
> > +     if (bo->ttm && ttm_tt_is_populated(bo->ttm))
> > +             return 0;
> > +
>
> bo->ttm is not safe to reference without the bo lock. Nor is the
> ttm_tt_is_populated stable without the bo lock since you may race with
> a swapout / shrink.

Indeed, I was probably being a bit hacky here, I'll always reserve first.

Dave.
>
> Thanks,
> Thomas
>
>
> > +     ret =3D ttm_bo_reserve(bo, false, false, NULL);
> > +     if (ret !=3D 0)
> > +             return ret;
> > +
> > +     ret =3D ttm_bo_populate(bo, bo->resource->placement &
> > TTM_PL_FLAG_MEMCG, &ctx);
> > +     ttm_bo_unreserve(bo);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(ttm_bo_setup_export);
> > diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> > index c33b3667ae76..5cdd89da9ef5 100644
> > --- a/include/drm/ttm/ttm_bo.h
> > +++ b/include/drm/ttm/ttm_bo.h
> > @@ -473,6 +473,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object
> > *bo);
> >  int ttm_bo_populate(struct ttm_buffer_object *bo,
> >                   bool memcg_account,
> >                   struct ttm_operation_ctx *ctx);
> > +int ttm_bo_setup_export(struct ttm_buffer_object *bo);
> >
> >  /* Driver LRU walk helpers initially targeted for shrinking. */
> >
>

