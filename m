Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1007BAE35
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 23:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE53910E3F1;
	Thu,  5 Oct 2023 21:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2E510E3F1;
 Thu,  5 Oct 2023 21:57:11 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1dcfb21f9d9so933407fac.0; 
 Thu, 05 Oct 2023 14:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696543031; x=1697147831; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CAYKChfRdgudPucMl+HqonIt/5AX5oN5CCdBSnTYy0c=;
 b=ZkDj3AgWaCULGl54QKEYHH9hUfc7piUyoQi9vIlt9yT+U4qC9E1rJu13U5rhRLpH4j
 aDvx2hmkiTdiz1+6w0X/1yyQOJSa2duCE6vCCEAgjD+lF56aMFrWUam9tHIs6h2P0NXd
 Ec5ZvVWXDGaVDdbYnkIDSfoQwwT08wQjfcmKakYhUuT8SbjtWKaVDFuyC7oJ/GtORRF4
 7LJsN1pEY6NA80BMtMc5d8geSOt7mNA5obfIZhlrjmELFx7DMv4s4LkpsNsbyO/92Jd3
 Xd0hzYdbkiFojg3+tsRVq2kEVjGfGV/qEZoV1oZd4zUihAhK8wNhZhI3hDznJhhxuuS2
 OZ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696543031; x=1697147831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CAYKChfRdgudPucMl+HqonIt/5AX5oN5CCdBSnTYy0c=;
 b=egGAlYKbCKrFYUSBH9XR92gfvl9RspsO30/XBV/4B4EEcQd1VwkB/iTnF9qvSpZbjp
 zyHK2O4BtSkJRlJ4LfgHXekMkBE88Ef05qDq0K/IqQ0AiT28v6EoMp0i9Tn6TIONBBa8
 1M1CZELs6ZEKaFKM13hJA9h4AN2iwHkhrschCD+OBtrnM/swWrugB9OSiOKA/xUK+Ipr
 ghiMTosNYQo55nqjSKPCBw+KM6gWJjaSm4xXgKBUtCbpGHRt8sZQcV9P0K21X0GxjNMq
 USHx4EabzteoVKn11gPPBZC7L8pyEfA0DJkJcjOfhHUyuPzIYblUDv2UyW6Kzx1uUIe5
 RxWA==
X-Gm-Message-State: AOJu0YyPsRPebwB/4DlLwvfvxHijAF/crEqkyuM/ZFvc4c7pY547rsBu
 8fpkVYa0XbSoM5ZRz8n/ssMHsFNCTL8QN6m61ZM=
X-Google-Smtp-Source: AGHT+IE7Mh8ZxS9AEdUoRo8DfhqsdjKx0m14eBvMkDCkjbKr9ARO/M6kPfpebfea3wIhcrXCtgeKYHTEYOpyT1BJiWU=
X-Received: by 2002:a05:6870:888b:b0:1bb:8842:7b5c with SMTP id
 m11-20020a056870888b00b001bb88427b5cmr7517247oam.43.1696543030835; Thu, 05
 Oct 2023 14:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20231003232952.work.158-kees@kernel.org>
 <ca2006f4-a038-460d-a9ca-d14dca8e4a8b@gmail.com>
In-Reply-To: <ca2006f4-a038-460d-a9ca-d14dca8e4a8b@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Oct 2023 17:56:59 -0400
Message-ID: <CADnq5_MfkVQNU268wg1b6AStnELjvrpgU4Xrf_k-Qa2KsXGcmg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Annotate struct amdgpu_bo_list with
 __counted_by
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: llvm@lists.linux.dev, Kees Cook <keescook@chromium.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tom Rix <trix@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Oct 5, 2023 at 10:32=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> Am 04.10.23 um 01:29 schrieb Kees Cook:
> > Prepare for the coming implementation by GCC and Clang of the __counted=
_by
> > attribute. Flexible array members annotated with __counted_by can have
> > their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> > array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > functions).
> >
> > As found with Coccinelle[1], add __counted_by for struct amdgpu_bo_list=
.
> > Additionally, since the element count member must be set before accessi=
ng
> > the annotated flexible array member, move its initialization earlier.
> >
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> > Cc: Luben Tuikov <luben.tuikov@amd.com>
> > Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: linux-hardening@vger.kernel.org
> > Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/exampl=
es/counted_by.cocci [1]
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.c
> > index 6f5b641b631e..781e5c5ce04d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> > @@ -84,6 +84,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev,=
 struct drm_file *filp,
> >
> >       kref_init(&list->refcount);
> >
> > +     list->num_entries =3D num_entries;
> >       array =3D list->entries;
> >
> >       for (i =3D 0; i < num_entries; ++i) {
> > @@ -129,7 +130,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *ade=
v, struct drm_file *filp,
> >       }
> >
> >       list->first_userptr =3D first_userptr;
> > -     list->num_entries =3D num_entries;
> >       sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
> >            amdgpu_bo_list_entry_cmp, NULL);
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_bo_list.h
> > index 6a703be45d04..555cd6d877c3 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> > @@ -56,7 +56,7 @@ struct amdgpu_bo_list {
> >        */
> >       struct mutex bo_list_mutex;
> >
> > -     struct amdgpu_bo_list_entry entries[];
> > +     struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
> >   };
> >
> >   int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,
>
