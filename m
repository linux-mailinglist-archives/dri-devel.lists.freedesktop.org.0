Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9659CA71931
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 15:47:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB80E10E6E4;
	Wed, 26 Mar 2025 14:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VcpthBU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01A010E6E4
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 14:46:57 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d5bb2ae4d3so6129565ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 07:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743000415; x=1743605215; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yIzY6JuPtPbu1sd31VEp2X/O3x/UgKedEbGz6vT002k=;
 b=VcpthBU1NNHzbR3Pym0E+l62tAH3rLQy4I/ymr0P2OCeFu4oeRJELNfKzkPChFQ9Kf
 pl03n8YsbY9IQSdoLIz5y3oCA7D+o+hTBNMdZtXfUOc0u5YrM8SypgeFswUx0lo78eIh
 Zf+K9prVatbq+0WRMP1kCg/3xVRU0WhaR/ZC32tt6atVGq7oSTWo0bruAdP9ZfvziLnF
 BmEAX7D2/LMzzZEhIsCuo8RGnlOGCmWZxVGNYdVYlerC9WJVim6rtjIdxu1zNq8FugRv
 GjlexX/ia9qhnfKxLTP6nslwgHGGHCjY3pXFNZVhNareoIuC0JUKBCPH+qz+XATNv3kB
 oPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743000415; x=1743605215;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yIzY6JuPtPbu1sd31VEp2X/O3x/UgKedEbGz6vT002k=;
 b=vS6FsXKL7H+3zx2/v13LKuf3tEgQZhAhzzbVR8Ch19iBk1EhvVYM0RxjhptgJoegU3
 8fVDkwQqgwobvWcWg+2ulQnzpf4fjoVKZhLjIWolEUwqf+C0lfBOpH2ZC8ETgYrpkIq+
 JTZJ62n6hS+ENmtzRy58RdF1TcY/70zNoSHNA3YIB/kZaiU1G9hm2F2ZQwv8dKr8FtXs
 VC1EgwlY9jgsNhbiK5CqLIkmwGf9z4jQnPPDWgNYPHucqtbzU15SGKba0gx3sNiKekQ5
 wVJIeAtAFe9bB5jfq4iipn9Lx87PQCrOizOP6kze131axFoY9GFyXc9Oozuw5eCel/z4
 imnA==
X-Gm-Message-State: AOJu0Yx/KNehy8bi9fj26Br5pCFu0Tpu/gWVtFxnW3t6MB7+IopGhDbR
 i26SxFgY7eueOwrymbMp+plkOGLxFy0jsg4TqPOrqwAPEYtEztLZvd2I+1r1J5BmzmoDL4qQqPz
 E9VtHMe4sj57SiTh6TgPaE+Umjo4n36oX
X-Gm-Gg: ASbGncuHHn2CqObzJh9/OmWsqKiAjYGip6y9VS+icL4msn1L1N22qYEVe8W4RmUltJr
 GbWyqN4y2pbFl7glCaWJSeXzzuTgbqbZ2BJ5zwa4Pt5TWPjlgq8nfxZ4fjwvHg3leqHpMqlaJqZ
 Y2ngezkO1Inb8NM6dpfizqGjm74Nd1GRIL+G7irhdl4kARMqGUS+0NN+k=
X-Google-Smtp-Source: AGHT+IH8ychrG0Yq2ngyD0ecOqCO0RE/LXSO0aLcakG9T0PKFMWXaArBnOsdvh7pxztVoJ5s0s/eUYqjpz4S8ZEnOmM=
X-Received: by 2002:a05:6e02:260f:b0:3d3:ced4:db9b with SMTP id
 e9e14a558f8ab-3d5960bf801mr234679015ab.5.1743000415399; Wed, 26 Mar 2025
 07:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250326143903.24380-1-robdclark@gmail.com>
 <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
In-Reply-To: <342ee079-ee0e-470d-afd2-c2870115b489@amd.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 26 Mar 2025 07:46:43 -0700
X-Gm-Features: AQ5f1Jot6jmzcgenF9qhrGVKGty_zzWylGXQwExIfmbDgtMjYHnUNBwSawcKJxY
Message-ID: <CAF6AEGu2Ax+u3QmD2VADwh4A4s5TAmP5Lq4DcYYadKP4csH-=g@mail.gmail.com>
Subject: Re: [PATCH] drm/syncobj: Extend EXPORT_SYNC_FILE for timeline syncobjs
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Rob Clark <robdclark@chromium.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>, 
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
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

On Wed, Mar 26, 2025 at 7:41=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 26.03.25 um 15:39 schrieb Rob Clark:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add support for exporting a dma_fence fd for a specific point on a
> > timeline.
>
> Looks good on first glance. What's the userspace use case?

Timeline syncobj support for vtest/vpipe[1][2].. since core
virglrender and drm native ctx works in terms of fences (since in the
VM case, everything is a fence below the guest kernel uabi), we need
to be able to turn a point on a timeline back into a fence fd.  (Plus
it seemed like an odd omission from the existing uabi.)

BR,
-R

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33433
[2] https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/805

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/drm_syncobj.c | 8 ++++++--
> >  include/uapi/drm/drm.h        | 2 ++
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncob=
j.c
> > index 4f2ab8a7b50f..eb7a2dd2e261 100644
> > --- a/drivers/gpu/drm/drm_syncobj.c
> > +++ b/drivers/gpu/drm/drm_syncobj.c
> > @@ -762,7 +762,7 @@ static int drm_syncobj_import_sync_file_fence(struc=
t drm_file *file_private,
> >  }
> >
> >  static int drm_syncobj_export_sync_file(struct drm_file *file_private,
> > -                                     int handle, int *p_fd)
> > +                                     int handle, u64 point, int *p_fd)
> >  {
> >       int ret;
> >       struct dma_fence *fence;
> > @@ -772,7 +772,7 @@ static int drm_syncobj_export_sync_file(struct drm_=
file *file_private,
> >       if (fd < 0)
> >               return fd;
> >
> > -     ret =3D drm_syncobj_find_fence(file_private, handle, 0, 0, &fence=
);
> > +     ret =3D drm_syncobj_find_fence(file_private, handle, point, 0, &f=
ence);
> >       if (ret)
> >               goto err_put_fd;
> >
> > @@ -882,8 +882,12 @@ drm_syncobj_handle_to_fd_ioctl(struct drm_device *=
dev, void *data,
> >
> >       if (args->flags & DRM_SYNCOBJ_HANDLE_TO_FD_FLAGS_EXPORT_SYNC_FILE=
)
> >               return drm_syncobj_export_sync_file(file_private, args->h=
andle,
> > +                                                 args->point,
> >                                                   &args->fd);
> >
> > +     if (args->point)
> > +             return -EINVAL;
> > +
> >       return drm_syncobj_handle_to_fd(file_private, args->handle,
> >                                       &args->fd);
> >  }
> > diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> > index 7fba37b94401..c71a8f4439f2 100644
> > --- a/include/uapi/drm/drm.h
> > +++ b/include/uapi/drm/drm.h
> > @@ -912,6 +912,8 @@ struct drm_syncobj_handle {
> >
> >       __s32 fd;
> >       __u32 pad;
> > +
> > +     __u64 point;
> >  };
> >
> >  struct drm_syncobj_transfer {
>
