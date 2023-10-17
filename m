Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBD7CCC04
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 21:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5396410E31A;
	Tue, 17 Oct 2023 19:16:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B01F310E32A;
 Tue, 17 Oct 2023 19:16:45 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-3b2b1af964dso3310328b6e.1; 
 Tue, 17 Oct 2023 12:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697570205; x=1698175005; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TGZYojggqQbM5RJB0rXps/zzaRkQmOODgh9YifgaQs=;
 b=eDOPmTDGh6SXC9a+xDCcwqwHgqYm601xsUqBWX1mDZWWVIS0nmUVQWFzx5zxPSLf4B
 Ae1Ml3nIl/yy7L7xQrVkCrRlw70kbdvv5qgNkyup/Wy1JNep25Y9Z4I+JG70CFKcmgFX
 3i01RGJQWT/gfSyuDEOR34FrQc0AdIKQE6908nj1h3SEFxz7oojK2w3gxqcClEo62Zj+
 3artwTKVLl5metJzM2DZ5O4k646G2cNuz/HPt4pMASZ6DPMYJVJyLRFsrThVyByW0VHF
 VxCyv1C24iWSyl3n94/fcaZN4WSubGU7LWsxwCYKIvY7v2BvZbHnK9zUxJ2qxo8pkxzV
 bGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697570205; x=1698175005;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TGZYojggqQbM5RJB0rXps/zzaRkQmOODgh9YifgaQs=;
 b=gP7VS6fTO/YI8J5sSDlHc9zzAIHHNAyPED8F95SQoABRMyHmIaDM7HpZxskOpftUmw
 fL1howRHHnTH+/Xgv8i8N3I9Gv7kwQimyrDTMqun7bjnCZeMy3neu2H5hGw4WKTQXxzG
 VgsgSUNC66kAa5UKcVviSM9BQFB3N/tYCob0nbekaTYJJ+7vKszQ9t4qXcvSdbQQjU1R
 +klIIMVNVC4ZaeUcFxbctTUYcXqLn7oaV5x6rcLPPu3KB02JaVVFa+wDPL8CnTjmHrDd
 FfGYowjaqfxnwsDenJ5+2aUgxzD9OqqD5oHmL42X3CBIjWxmvHPkODoWucC+CbiqOBVV
 Ge5Q==
X-Gm-Message-State: AOJu0YwRmlSzZO6J44xhRFrkSt7STDq/wfdbkPZ4aDyKHexWWKF9sGrC
 tWPin81UJE5OUjib1f7QrNZcqGWQ/KdExrwPxRw=
X-Google-Smtp-Source: AGHT+IHWCM0hKlRAuUvh2ShFSvPcKBlBYG7cFfYTqu/tnNPuiW8geHRJA4n0eKhfLHX3vy5utLHuXz0fRi3c4v0IIRE=
X-Received: by 2002:a54:450a:0:b0:3ae:2362:7137 with SMTP id
 l10-20020a54450a000000b003ae23627137mr3025481oil.59.1697570204850; Tue, 17
 Oct 2023 12:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20231017035656.8211-1-luben.tuikov@amd.com>
 <CADnq5_NyhWLmSbtmeaHv7RRXhEc+C4XTPZ-U57zrpw3N3nObCg@mail.gmail.com>
 <b66ea9a2-0a46-434a-8d56-06f7388d837a@amd.com>
In-Reply-To: <b66ea9a2-0a46-434a-8d56-06f7388d837a@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Oct 2023 15:16:33 -0400
Message-ID: <CADnq5_N1qy4nk8hR6=iKXQAhKvdXsZw5NGaFyUbL5hzTks5hVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amdgpu: Unset context priority is now invalid
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>,
 AMD Graphics <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 17, 2023 at 10:27=E2=80=AFAM Luben Tuikov <luben.tuikov@amd.com=
> wrote:
>
> On 2023-10-17 09:22, Alex Deucher wrote:
> > On Tue, Oct 17, 2023 at 12:52=E2=80=AFAM Luben Tuikov <luben.tuikov@amd=
.com> wrote:
> >>
> >> A context priority value of AMD_CTX_PRIORITY_UNSET is now invalid--ins=
tead of
> >> carrying it around and passing it to the Direct Rendering Manager--and=
 it
> >> becomes AMD_CTX_PRIORITY_NORMAL in amdgpu_ctx_ioctl(), the gateway to =
context
> >> creation.
> >>
> >> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ctx.c
> >> index 0dc9c655c4fbdb..092962b93064fc 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> >> @@ -47,7 +47,6 @@ const unsigned int amdgpu_ctx_num_entities[AMDGPU_HW=
_IP_NUM] =3D {
> >>  bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
> >>  {
> >>         switch (ctx_prio) {
> >> -       case AMDGPU_CTX_PRIORITY_UNSET:
> >>         case AMDGPU_CTX_PRIORITY_VERY_LOW:
> >>         case AMDGPU_CTX_PRIORITY_LOW:
> >>         case AMDGPU_CTX_PRIORITY_NORMAL:
> >> @@ -55,6 +54,7 @@ bool amdgpu_ctx_priority_is_valid(int32_t ctx_prio)
> >>         case AMDGPU_CTX_PRIORITY_VERY_HIGH:
> >>                 return true;
> >>         default:
> >> +       case AMDGPU_CTX_PRIORITY_UNSET:
> >>                 return false;
> >
> > I  don't recall if any userspace uses this, but this would break
> > userspace if it does.
>
> This is shielded from user space in the following manner,
> 1) amdgpu_ctx_priority_is_valid() is called from amdgpu_ctx_ioctl() and
>    if amdgpu_ctx_priority_is_valid() returns false, we set the priority t=
o NORMAL.
>    See the 2nd patch.

Ah, I see.  Thanks.  Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>


> 2) It is also called from amdgpu_ctx_priority_permit(), which is called
>    from amdgpu_ctx_init() which is called from amdgpu_ctx_alloc() which
>    is called from amdgpu_ctx_ioctl(), _after_ the call described above,
>    and thus priority is now NORMAL.
>
> Plus I'm typing this on a running system with 6.6.0 + those two patches.
>
> User space can send us down UNSET, but we set it to NORMAL.
>
> Can I get an R-B?
>
> >
> > Alex
> >
> >>         }
> >>  }
> >>
> >> base-commit: dc9b2e683bcba017588b9aaad80f442ad004a48f
> >> --
> >> 2.42.0
> >>
>
> --
> Regards,
> Luben
>
