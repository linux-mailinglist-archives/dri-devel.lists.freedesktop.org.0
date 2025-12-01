Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62FAC994B2
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 23:06:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DB110E4A1;
	Mon,  1 Dec 2025 22:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H5EHaymI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF2D10E4A1
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 22:06:09 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-9352cbe2e14so1173574241.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Dec 2025 14:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764626768; x=1765231568; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RjsD19aCUMHa2E8WfpptbpfT6kxnKtjPzjy54H5oDQE=;
 b=H5EHaymIlaSPNLcf7vUveQdOxN4b1dcwKKAkVSOztWcTlHsaY2z79s6Svq4/DqlYom
 9zfhyzpKCSL527V83lebPE+svlNKvGh4mCQ9l9LgOJi6uSNVDPKTSfubyZL1dRfZo2za
 7IfxudyqwVualE4WS4nfaMfUjLMWdwJHxskPweRKTLaAALEeGwFXoD1jMq/DdpO22e0a
 EWETpMNq8cEIsF/KJbGV56lu4EJK2zxNxXRHxHYKfZZgvcD/Y9+BxuT2TdzJwnsL7uPF
 AHxoOfghnJM5ntbqfrqWBcBsdnjHFWMP1gnu3RqFW5iMNFRAFq3uuMfZYV3dtk/NxoSC
 Pp9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764626768; x=1765231568;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RjsD19aCUMHa2E8WfpptbpfT6kxnKtjPzjy54H5oDQE=;
 b=xGCgmI2hZE9tzmLc4p6EySgNaTx10ZbgmXCTjf10iOV20Q9ec2F3M5g2ghIzmlQgKQ
 InRlQzdWFuPgFiIeFJBLc/YPiLlTmSdB8lmMBl5cDiE2hWMrNE+JHXDm/xNoGnBDNfpP
 eLjqt5K2SW0vUf0l08TOJgNmzULVrFZKx54LVbFv+/abU4cOynxROH+1sjtICTdN8PFv
 QuLyyuLzrh1lu4fYkEwBb+QXk2RHOdD6VL1ioWxqfhZ4nKedzpgxCcOp6dwpScwhgWa+
 mwSuCmR/ImtaqQawlgr6NA82LW1Z9TH3UFBiKwbnyTAkHnB8r05G8LTvemiSWR3gX0e2
 kbvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4YLY4mLbtdeMgq9ELlVJnHFQoWFNEnt89sOZ4JrFThbGQsJuXHFib+9zMGuo/4pb4oYbPJbO9uzM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxVHUIHxLuAatxxFJXN0UWDtyx8EJEjLUnRL/22SiyPXlCYzQr
 z3og6wkSdPp2lAxBug0D9CnQ6ZVtEHKeGv+cejc6WcBpwcMktArw0HSfKeL/VmYDWVtBongg7mn
 P5mbFQBKBSqMfoHFG9OBL0qAoH12VrxI=
X-Gm-Gg: ASbGncsnAHewnJcRpxyVuVo9hmYJYniJbg2TqizqLSFaZ5WIrBZx56akKhLITko3hmE
 puLi6M8cmB+XI81ovl6U0gTt2ImnacBh8nnvhHK6+duvQM25ktbA8J+iIwwPH14142AdFDkDLQ9
 YexLazK5CxZu4NIs9USQLvRd6wwYERYarb9cAE/WrrzppXNSwn2aV9qRHPOaZ5lKhZb7Re7pJpJ
 TfVEjwEpXDT2dmKc5CSlNmn0YdF+6tq2eRoKbU2dICA0tVoyBiBPtQJHQxKNCERQ44HcQ==
X-Google-Smtp-Source: AGHT+IHy9MubOTLG2etzaabSpxtKy1Lb/AjgjOqAEtXPMeO1sBbpyDe9CCi6vq0uRyBGY3AdXltB4if2OEMaCAYo1tg=
X-Received: by 2002:a05:6102:5805:b0:5db:c987:d8f4 with SMTP id
 ada2fe7eead31-5e22421c58amr9629989137.7.1764626767957; Mon, 01 Dec 2025
 14:06:07 -0800 (PST)
MIME-Version: 1.0
References: <20251122090343.81243-1-21cnbao@gmail.com> <aSiB-UsunuE7u295@milan>
 <CAGsJ_4z21fN2KSg6jt_qveYgrKZw1Vsi_kb+uhed=RJAbujMHw@mail.gmail.com>
 <aS13J6U-QMOrwwbs@milan>
In-Reply-To: <aS13J6U-QMOrwwbs@milan>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 2 Dec 2025 06:05:56 +0800
X-Gm-Features: AWmQ_bmgxK1g1aP9fycsrkY4ZrS4yYO9pthpUyw8iDWG0FYFC6_bJ-WYcNubwhU
Message-ID: <CAGsJ_4yGLdhk84Ent8VRcE4_2Am_U=bXTVdV2LHDBtD2OZs8xg@mail.gmail.com>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
To: Uladzislau Rezki <urezki@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>, 
 Maxime Ripard <mripard@kernel.org>
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

On Mon, Dec 1, 2025 at 7:08=E2=80=AFPM Uladzislau Rezki <urezki@gmail.com> =
wrote:
>
> On Fri, Nov 28, 2025 at 04:43:54AM +0800, Barry Song wrote:
> > > >
> > > > +     /*
> > > > +      * Some users may allocate pages from high-order down to orde=
r 0.
> > > > +      * We roughly check if the first page is a compound page. If =
so,
> > > > +      * there is a chance to batch multiple pages together.
> > > > +      */
> > > >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > > > -                     page_shift =3D=3D PAGE_SHIFT)
> > > > +                     (page_shift =3D=3D PAGE_SHIFT && !PageCompoun=
d(pages[0])))
> > > >
> > > Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:
> >
> > This is not the case for vmalloc, but applies to dma-bufs that are allo=
cated
> > using alloc_pages() with GFP_COMP.
> >
> > #define LOW_ORDER_GFP (GFP_HIGHUSER | __GFP_ZERO)
> > #define HIGH_ORDER_GFP  (((GFP_HIGHUSER | __GFP_ZERO | __GFP_NOWARN \
> >                                 | __GFP_NORETRY) & ~__GFP_RECLAIM) \
> >                                 | __GFP_COMP)
> >
> > >
> > > /*
> > >  * See __vmalloc_node_range() for a clear list of supported vmalloc f=
lags.
> > >  * This gfp lists all flags currently passed through vmalloc. Current=
ly,
> > >  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Bot=
h drm
> > >  * and BPF also use GFP_USER. Additionally, various users pass
> > >  * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
> > >  */
> > > #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |=
\
> > >                                __GFP_NOFAIL |  __GFP_ZERO | __GFP_NOR=
ETRY |\
> > >                                GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOU=
NT |\
> > >                                GFP_USER | __GFP_NOLOCKDEP)
> > >
> > > Could you please clarify when PageCompound(pages[0]) returns true?
> > >
> >
> > In this case, dma-buf attempts to allocate as many compound high-order =
pages
> > as possible, falling back to 0-order allocations if necessary.
> >
> OK, it is folio who uses it.
>
> > Then, dma_buf_vmap() is called by the GPU drivers:
> >
> >  1    404  drivers/accel/amdxdna/amdxdna_gem.c <<amdxdna_gem_obj_vmap>>
> >              dma_buf_vmap(abo->dma_buf, map);
> >    2   1568  drivers/dma-buf/dma-buf.c <<dma_buf_vmap_unlocked>>
> >              ret =3D dma_buf_vmap(dmabuf, map);
> >    3    354  drivers/gpu/drm/drm_gem_shmem_helper.c
> > <<drm_gem_shmem_vmap_locked>>
> >              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> >    4     85  drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> > <<etnaviv_gem_prime_vmap_impl>>
> >              ret =3D dma_buf_vmap(etnaviv_obj->base.import_attach->dmab=
uf, &map);
> >    5    433  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c <<map_external>>
> >              ret =3D dma_buf_vmap(bo->tbo.base.dma_buf, map);
> >    6     88  drivers/gpu/drm/vmwgfx/vmwgfx_gem.c <<vmw_gem_vmap>>
> >              ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> >
> Thank you for clarification. That would be good to reflect it in the
> commit message. Also, please note that:

Sure.

>
> >       if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> > -                     page_shift =3D=3D PAGE_SHIFT)
> > +                     (page_shift =3D=3D PAGE_SHIFT && !PageCompound(pa=
ges[0])))
> >
> we rely on page_shift =3D=3D PAGE_SHIFT condition for the non-sleep vmall=
oc()
> allocations(GFP_ATOMIC, GFP_NOWAIT), so we go via vmap_small_pages_range_=
noflush()
> path. Your patch adds !PageCompound(pages[0]) also. It is not a problem
> since it is vmap() path but we need to comment that.

Sure. Would the following work?

        /*
         * For vmap(), users may allocate pages from high orders down
to order 0,
         * while always using PAGE_SHIFT as the page_shift.
         * We first check whether the initial page is a compound page. If s=
o,
         * there may be an opportunity to batch multiple pages together.
         */
        if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
                        (page_shift =3D=3D PAGE_SHIFT && !PageCompound(page=
s[0])))
                return vmap_small_pages_range_noflush(addr, end, prot, page=
s);

Thanks
Barry
