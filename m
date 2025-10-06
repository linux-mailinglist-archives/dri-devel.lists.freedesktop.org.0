Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB5DBBDDFB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37B0C89D39;
	Mon,  6 Oct 2025 11:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="tIYY59ZD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D82E89D39
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:32:05 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-421851bca51so3188654f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 04:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759750324; x=1760355124;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y/iplxlQaUF8uqw0GCctn3zVGsmGXni/N09PaEXMmYs=;
 b=tIYY59ZDZE803JyE7DV2L1R223GuAmZMVUCV6izqqz8TqKnRJ6xNhQpqRlVTcPEHrk
 DDxmPgi3sHiULO590TgwPP8fxhkCIHEEM3vIgujLS+W1r+v9wkWtLoAKsj39ZoZYHSoc
 cT7lY5nMyKCKi2fjB+H9GkowWD/HpHwFeGbnJJO7dCmYyhR1P1S4xSmTm/3WISudIsj7
 f9HZzpfX9tcvqv6qd45l1ES87qEgUzcvO7vjyfPzOxYQGLIp00kfsgaP1ubaZv+p5RNh
 UgB4IUkt8u7xrv5jlIrE8lhD9DgadB0a+bcuSjNMYFHSj0GZMuVA9HwyKsmr+so4b15p
 1oug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759750324; x=1760355124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y/iplxlQaUF8uqw0GCctn3zVGsmGXni/N09PaEXMmYs=;
 b=aRYxgu4rdHkhXlKiZUeCR8znOYV5itmPXsGAnMhsstWW7/eeT1n15iB+yBZYbQqQrl
 vpSdUS8qZc7pio/1TfhzjRdx9eTOEMpYdqE5YVRv/Ha5KqimIj5RstUH8LU1VSBI4UIr
 A+8kHrvRGQf3flEjN35C3mpKmIMTkkn3Dm8i+3n7vghsGVfvz3XlQAjvLl+weX4o7ldg
 grYuqBJcFPZPRbNAGjSQb02amoANdKun51MAvh3N34CW8eJydZc/m3y/KD1g+wwEiIZW
 cnYKNlYN5YXDmIg9E5MXiYu7wwWa2eTSDt0CCpMME8XRaNz0NJv11+5pPl1E3wMLZtOM
 /mWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVW86rxQlB3d/3vboa5koRJ789/UP24uQvyPHmDwWFVuiUUz5Ab/gJsYmBNpYk44M+FuIafwdL2+s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6ahBygyVEmCrTcrSdCvX1/LgZANzZmP3rbo4bdE7WXpcGgzKE
 4oM4K7yXLxFFgfnWVbmzMXto4ran4VXgXF0Ed5wV17KhCa7jgmLuXrFURQRSA5pp7rTBrnr4ODX
 F00kW09Grfushm4s4p7H6ilzH+cesZjn4eKOQDBpz
X-Gm-Gg: ASbGncsp5CeCsoELEroPdW8KAPOa8a0192toRLkEvK3j9x5+3fCgHsSNYke1XC8xZdC
 QKt/t4PsqhSa9e9ICSEZ9mqwTSWuf6kzF5zq05cmD4vIOGfDXbJO1fqFmvMtDLF1VnHmmsw2rmf
 LlrFT0hMI0AZzGhdF86chGFQHtSv2XskMyY6n6AQxIHu0WHxpzTq2EdT5cMuy4oO8dLnUY+Smfq
 bUzS+OliswYUnp2tE68swktfim2pjZepIveDBcmA4Fd/uZMq9sDN0uVDAmIFo+w9Mgt
X-Google-Smtp-Source: AGHT+IEpcDh84YyWa1tix4lg1Lgg/ufNvs/pYCPALMjra1LwuR3L8KEoSkoDlyjotjeH075DbkRbgqHtaaCqmySaT6E=
X-Received: by 2002:a05:6000:2504:b0:3ec:db0a:464c with SMTP id
 ffacd0b85a97d-425671c0c34mr8407405f8f.44.1759750323713; Mon, 06 Oct 2025
 04:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
 <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com>
 <20251001171346.482142eb@fedora>
In-Reply-To: <20251001171346.482142eb@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Oct 2025 13:31:51 +0200
X-Gm-Features: AS18NWBfjVHmU8SAlY0Z3pTGNokzUnHoTpGuc0sQ1pu2DdT7lAdZynJQkD-YV-o
Message-ID: <CAH5fLgjteqdWVBfzU_2iq2v=9MV9rD+s3z6i2ZjrmqBUq6_byQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Wed, Oct 1, 2025 at 5:13=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 1 Oct 2025 16:42:35 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Wed, Oct 1, 2025 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> > >
> > > On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote:
> > > > +/*
> > > > + * Must be called with GEM mutex held. After releasing GEM mutex,
> > > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > > + */
> > > > +static void
> > > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > > +{
> > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_=
gpuvm_bo,
> > > > +                                               kref);
> > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > +
> > > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > > +     }
> > > > +
> > > > +     list_del(&vm_bo->list.entry.gem);
> > > > +}
> > > > +
> > > > +/*
> > > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer_fre=
e_locked().
> > > > + */
> > > > +static void
> > > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > > +{
> > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > +
> > > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > > +}
> > > > +
> > > > +static void
> > > > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > > > +{
> > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct drm_=
gpuvm_bo,
> > > > +                                               kref);
> > > > +
> > > > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > > > +     drm_gpuvm_bo_defer_free_locked(kref);
> > > > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > > > +
> > > > +     /*
> > > > +      * It's important that the GEM stays alive for the duration i=
n which we
> > > > +      * hold the mutex, but the instant we add the vm_bo to bo_def=
er,
> > > > +      * another thread might call drm_gpuvm_bo_deferred_cleanup() =
and put
> > > > +      * the GEM. Therefore, to avoid kfreeing a mutex we are holdi=
ng, we add
> > > > +      * the vm_bo to bo_defer *after* releasing the GEM's mutex.
> > > > +      */
> > > > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > > > +}
> > >
> > > So, you're splitting drm_gpuvm_bo_defer_free() into two functions, on=
e doing the
> > > work that is required to be called with the gpuva lock held and one t=
hat does
> > > the work that does not require a lock, which makes perfect sense.
> > >
> > > However, the naming chosen for the two functions, i.e.
> > > drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_locked=
() is
> > > confusing:
> > >
> > > What you mean semantically mean is "do part 1 with lock held" and "do=
 part 2
> > > without lock held", but the the chosen names suggest that both functi=
ons are
> > > identical, with the only difference that one takes the lock internall=
y and the
> > > other one requires the caller to take the lock.
> > >
> > > It's probably better to name them after what they do and not what the=
y're part
> > > of. If you prefer the latter, that's fine with me too, but please cho=
ose a name
> > > that makes this circumstance obvious.
> >
> > Fair point. Do you have naming suggestions? Otherwise I can name them
> > drm_gpuvm_bo_defer_free_part1() and drm_gpuvm_bo_defer_free_part2().
> > :)
>
> drm_gpuvm_bo_free_deferral_extract_locked() and
> drm_gpuvm_bo_free_deferral_enqueue()? Definitely not short names though.

With those names I have to do some additional line breaks. How about:

drm_gpuvm_bo_into_zombie()
drm_gpuvm_bo_defer_zombie()

leaning on the zombie terminology I already added for the
drm_gpuvm_bo_is_zombie() function.

Alice
