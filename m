Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02570D13CDA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 16:51:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BB810E406;
	Mon, 12 Jan 2026 15:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GMLe0T4d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA5310E406
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 15:51:42 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47d3ba3a4deso38323105e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1768233100; x=1768837900;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1YBdriqSbA26joXvD6tId8mTiM9ZaMqguGEZkXna6SI=;
 b=GMLe0T4dsm5g5R0fCH58WBJeTyZF7SwWKHzdHxtjtt+QeB3ecvSy7jxRlvpChaZwJu
 yXLxrnmEQHhpZund8AYmO5u379EFsmusODTOla/eIVYp5j2n+kqLhy/D3soTFQglWLEh
 MNRKZCFjSGfC7OFcET0YUIoK0wBVBE3vbEUji9sdo2PXhDeAq7C1581sUh32WhAXTc5p
 AOHkskjD73dTmK8tsAnuRkGdYf5qiw0uiT1XxpzEPF1DwhMgZFnCPatgrLqLLeJ1qX8q
 Dc3OR6hWl8VdzY/1irDxVRqtZWbTDD5klopQmpFDlLohgGU5s0N00am6mz/GuqK5KLBV
 nBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768233100; x=1768837900;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1YBdriqSbA26joXvD6tId8mTiM9ZaMqguGEZkXna6SI=;
 b=EMJ5wpdLneKQUonVcxsK1gqTUlY5dYBru56mz8qMLjqI+Kudq0f278n1glPjpUlc7K
 sqXDUZ/V7VA+kgjp7COPLYO7N+0uhFUkMDoiQ/lUtqIXOCLpqRm1j/q+IgsUsPxdSIGn
 r8J99J58p2Q92bX82ROBZXhsmYo7wLC/Za/zXvtnKf0Jh7GbrenDWbaXEnHDiWrfro8n
 gY6CHvx0bpFLwkwVx4j9rCibxQFpKHfZz/irb+dEQBXi/T+sTpqQz6c4Ppqqzw5RsKny
 3XcKa+SJmNDeWZI/DLVZi7fpXOOkikJoDUphlQtXxhs96Qppk+rlcjzwhw9YsmYAxnf0
 iABw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB1HozvcHhjQEJbibH2HE/bl5g0iNvALoAStQUZwG6FDfomvfDKGUUFlJTKwQoMwhe/RwA0GPULQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyE509c7L/MQltWTu2u5bFbPhXb1mWODY0vJY+grhZlBGZlgZc4
 ZLR1hCeHQR5wS2tPTKyUYGBB9+f85e5jZZFrhnbZgVuemnx61bV9p7cNcmvZ/VjaX4QUSHrVlJ4
 wDQD+auBPToodJDdwrBO46LXYQQv1BH7n/+xiqjwU
X-Gm-Gg: AY/fxX70h+XHINHYj/SvKfpunlQVLX25RMsK5A+qwNtCE9RvWWU1m85xIQLwpP4RLx3
 Ki5ze9dPYTnFxJfW+LD9jXzDVw8G/AYdloQADyDsYVWaBciCS6EAn5tgaWiZ70If4THDLp0OF5g
 9otN7EnHD/8h+CvUaU5BMAyOoZseHXsHPH9BFXczaT2JCqYaffIEl45LQ85P8TPMKkuO29IVWsf
 jxFLflLEkcZ9R+nZR402C8C2IrZTtzSyltS91LMakeexJE1hlnDFGfv3kAk1DSBwfJR8ISThBvp
 B3f0fHSh5Rz+wjml3veiCYDGjQ==
X-Google-Smtp-Source: AGHT+IE1pQgBaZquuX/XKz8T0CDn1RSRnDzQprnwWqneydobfqD7c64FHKD25IGPW3AhdPRqiMI7RpDTM5drdZGoHX0=
X-Received: by 2002:a05:600c:190e:b0:479:3a88:de60 with SMTP id
 5b1f17b1804b1-47d84b3fa79mr187462085e9.37.1768233100201; Mon, 12 Jan 2026
 07:51:40 -0800 (PST)
MIME-Version: 1.0
References: <20260109130801.1239558-1-boris.brezillon@collabora.com>
 <20260109130801.1239558-9-boris.brezillon@collabora.com>
 <c86e341d-0dd2-4a97-b047-f62f2aa64c7e@arm.com>
 <20260112153953.61eb20dc@fedora>
 <CAH5fLggS-sgKYRvnraRsOoYysVnYoDdhmiu1jbdWv132BBcWAA@mail.gmail.com>
 <20260112164908.02d25584@fedora>
In-Reply-To: <20260112164908.02d25584@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 12 Jan 2026 16:51:26 +0100
X-Gm-Features: AZwV_QjfSf7dQUis0EsIQ-8XR7qDOwTLVMLQgRYUD-iwvn2dveK5oVBUuJWFyEE
Message-ID: <CAH5fLgj_mGHjk81ZVS2o+Q-+UY3PhZ-ech1BzjDewUvGHaeWBA@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] drm/panthor: Track the number of mmap on a BO
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 kernel@collabora.com
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

On Mon, Jan 12, 2026 at 4:49=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon, 12 Jan 2026 16:19:52 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Mon, Jan 12, 2026 at 3:40=E2=80=AFPM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > On Mon, 12 Jan 2026 12:33:33 +0000
> > > Steven Price <steven.price@arm.com> wrote:
> > >
> > > > On 09/01/2026 13:08, Boris Brezillon wrote:
> > > > > +static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > > > +{
> > > > > +   struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_priva=
te_data);
> > > > > +
> > > > > +   if (drm_gem_is_imported(&bo->base))
> > > > > +           goto out;
> > > > > +
> > > > > +   if (refcount_dec_not_one(&bo->cmap.mmap_count))
> > > > > +           goto out;
> > > > > +
> > > > > +   dma_resv_lock(bo->base.resv, NULL);
> > > > > +   if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> > > > > +           refcount_set(&bo->cmap.mmap_count, 0);
> > > > > +   dma_resv_unlock(bo->base.resv);
> > > >
> > > > I don't think this logic is safe. Holding the resv_lock doesn't pro=
tect
> > > > against another thread doing a refcount_inc_not_zero() without hold=
ing
> > > > the lock.
> > > >
> > > > I think you can just replace the if() part with a refcount_dec() ca=
ll,
> > > > the lock AFAICT is needed because the following patch wants to be s=
ure
> > > > that !!mmap_count is stable when resv_lock is held.
> > >
> > > I wish I could, but refcount_dec() doesn't let me do the 1 -> 0 witho=
ut
> > > complaining :P.
> >
> > I'm pretty sure that refcount_dec() is fine with 1->0.
>
> That's not what [1] says. refcount_dec_and_test() is okay though, but
> it'd force us to do a
>
>         (void)refcount_dec_and_test()
>
> and detail why it's okay to ignore the returned value. Not too sure
> which one is better.

You're right, I mixed it up with refcount_dec_and_test().

> > > > I also feel you should invert the conditino for refcount_dec_not_on=
e,
> > > > leading to the following which I feel is easier to read:
> > > >
> > > > static void panthor_gem_vm_close(struct vm_area_struct *vma)
> > > > {
> > > >       [...]
> > > >
> > > >       if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> > > >               dma_resv_lock(bo->base.resv, NULL);
> > > >               refcount_dec(&bo->cmap.mmap_count);
> > > >               dma_resv_unlock(bo->base.resv);
> > > >       }
> > >
> > > The best I can do is:
> > >
> > >         if (!refcount_dec_not_one(&bo->cmap.mmap_count)) {
> > >                 dma_resv_lock(bo->base.resv, NULL);
> > >                 if (!refcount_dec_not_one(&bo->cmap.mmap_count))
> > >                         refcount_set(&bo->cmap.mmap_count, 0);
> > >                 dma_resv_unlock(bo->base.resv);
> > >         }
> > >
> > > so we only take the lock when absolutely needed, but the 1 -> 0
> > > transition still has to be done with "if (dec_not_one) set(0)".
> >
> > Why not just use atomic_t and use the atomic inc/dec operations? They
> > don't have saturation, but also do not require treating zero
> > specially.
>
> I had suggested using atomics back when I was reviewing the
> shmem-shrinker stuff to avoid this exact same issue. I can't find the
> thread anymore and I can't remember the rationale either (probably that
> saturation detection was useful, still), but the decision was to use a
> refcount_t. I don't mind using atomics here, but I'd rather not be
> blocked on that when/if I try to move that code into a common lib.
>
> [1]https://elixir.bootlin.com/linux/v6.19-rc4/source/include/linux/refcou=
nt.h#L460

It's just a suggestion - no need to block on it.

It sounds like refcount_t should have an refcount_inc_maybe_first()
where 0->1 is ok.

Alice

Alice
