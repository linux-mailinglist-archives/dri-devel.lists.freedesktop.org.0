Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA460784EE9
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 04:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E2E10E046;
	Wed, 23 Aug 2023 02:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511E10E046
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 02:54:09 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-99bed101b70so662661866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 19:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20221208.gappssmtp.com; s=20221208; t=1692759248; x=1693364048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XeJhEOpqI+Sapl1gp37QHefUbFHCIU6cNGj86oy/Muk=;
 b=313cu8yhEtsemPEw3HoBFWGPlWJ9KzzLygwJFq+5diN0GjVcHbt14lvoVCwXZTxV4T
 bcZ2mPSUG/0BploHgZrjKtws2MXTJAZu/7TQMGJ3WnTtG7/fnRYGGadt2SoBcXE09/NJ
 eJizcyPofGl9gwdE3RqEK4SwvmEA8pbW/tCfUvi+k+BTJEnd50uc6Ywif0IOhI1Q6MiX
 lL2Q9nEJh57jmfp26K3cSWwAwifDHaAMs3bvMDlyyQnNER31Z7Wi0mGCzBdSZxyuPeWV
 EMfs5UrbNw7vLI9W5YRDftOpXQKIlzGBF6qN9gruGyJFAYBaKqUZ6fLxedz0j9bjiLo4
 3i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692759248; x=1693364048;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XeJhEOpqI+Sapl1gp37QHefUbFHCIU6cNGj86oy/Muk=;
 b=TkM+dT+0LaZXNR8xzk8HQ1mxU1skZ0GQ+jelYlAsd+eX1ZxwKlpy0C6jb+QEBdiYWR
 K1dpkDw0C1ELgK4WHUYOkCPcrQemIH6wgbwD8p6MG70C1Idn0S/dhTi47kNbRSkLb/D1
 P//1NsNFhZp4kdmKMhDJHUr2SyMMFgo5AocVD97DzcXJJMxL4mlpWoy+eQceDrLIyEC3
 A3ltZGxIGxM2hpLL4I0ANTTOd9qzWk1B0GEqaxqHF/q6w/WCt1f9kErPW7QJAEd9Rvz9
 Kay17+dgVXEGi6NWxOhSD/BRfbAt7Q2q8pfE1dfL5q1SSxrwF/BMUlei9tQRgUhjUh8f
 edzw==
X-Gm-Message-State: AOJu0YxDVk31zKrKNerBOPB8qh5UVkL11G3TJUhWWQk7NISKJRVeLLHv
 1E6owFpceojVrpQvbkav/r6a0qe1Sy52JCJmzysE3Q==
X-Google-Smtp-Source: AGHT+IHA6qbqFLjnXGlDD40nhiWKKJ0V0zd+E4dwxdPH4sb0/QbIpExJxT7M1CcBmsZvQm1XwPopv2Sx87N173ZWKak=
X-Received: by 2002:a17:906:31c1:b0:99d:a6b9:fd04 with SMTP id
 f1-20020a17090631c100b0099da6b9fd04mr8541494ejf.46.1692759248005; Tue, 22 Aug
 2023 19:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230822234139.11185-1-dakr@redhat.com>
In-Reply-To: <20230822234139.11185-1-dakr@redhat.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Tue, 22 Aug 2023 21:53:56 -0500
Message-ID: <CAOFGe978DoPqTqoFAMv84fcuyLR47fkGZ3NCn4dyD69i4QoobQ@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next] drm/nouveau: uapi: don't pass NO_PREFETCH
 flag implicitly
To: Danilo Krummrich <dakr@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000aafd9f06038e391c"
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bskeggs@redhat.com, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000aafd9f06038e391c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 6:41=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:

> Currently, NO_PREFETCH is passed implicitly through
> drm_nouveau_gem_pushbuf_push::length and drm_nouveau_exec_push::va_len.
>
> Since this is a direct representation of how the HW is programmed it
> isn't really future proof for a uAPI. Hence, fix this up for the new
> uAPI and split up the va_len field of struct drm_nouveau_exec_push,
> such that we keep 32bit for va_len and 32bit for flags.
>
> For drm_nouveau_gem_pushbuf_push::length at least provide
> NOUVEAU_GEM_PUSHBUF_NO_PREFETCH to indicate the bit shift.
>
> While at it, fix up nv50_dma_push() as well, such that the caller
> doesn't need to encode the NO_PREFETCH flag into the length parameter.
>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dma.c  |  7 +++++--
>  drivers/gpu/drm/nouveau/nouveau_dma.h  |  8 ++++++--
>  drivers/gpu/drm/nouveau/nouveau_exec.c | 15 ++++++++++++---
>  drivers/gpu/drm/nouveau/nouveau_gem.c  |  6 ++++--
>  include/uapi/drm/nouveau_drm.h         |  8 +++++++-
>  5 files changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c
> b/drivers/gpu/drm/nouveau/nouveau_dma.c
> index b90cac6d5772..059925e5db6a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dma.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dma.c
> @@ -69,16 +69,19 @@ READ_GET(struct nouveau_channel *chan, uint64_t
> *prev_get, int *timeout)
>  }
>
>  void
> -nv50_dma_push(struct nouveau_channel *chan, u64 offset, int length)
> +nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,
> +             bool prefetch)
>  {
>         struct nvif_user *user =3D &chan->drm->client.device.user;
>         struct nouveau_bo *pb =3D chan->push.buffer;
>         int ip =3D (chan->dma.ib_put * 2) + chan->dma.ib_base;
>
>         BUG_ON(chan->dma.ib_free < 1);
> +       WARN_ON(length > NV50_DMA_PUSH_MAX_LENGTH);
>
>         nouveau_bo_wr32(pb, ip++, lower_32_bits(offset));
> -       nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8);
> +       nouveau_bo_wr32(pb, ip++, upper_32_bits(offset) | length << 8 |
> +                       (prefetch ? 0 : (1 << 31)));
>

It feels a bit weird to be inverting this bit twice. IDK that it matters,
though.


>
>         chan->dma.ib_put =3D (chan->dma.ib_put + 1) & chan->dma.ib_max;
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h
> b/drivers/gpu/drm/nouveau/nouveau_dma.h
> index 035a709c7be1..fb471c357336 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dma.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
> @@ -31,7 +31,8 @@
>  #include "nouveau_chan.h"
>
>  int nouveau_dma_wait(struct nouveau_channel *, int slots, int size);
> -void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);
> +void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
> +                  bool prefetch);
>
>  /*
>   * There's a hw race condition where you can't jump to your PUT offset,
> @@ -45,6 +46,9 @@ void nv50_dma_push(struct nouveau_channel *, u64 addr,
> int length);
>   */
>  #define NOUVEAU_DMA_SKIPS (128 / 4)
>
> +/* Maximum push buffer size. */
> +#define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
> +
>  /* Object handles - for stuff that's doesn't use handle =3D=3D oclass. *=
/
>  enum {
>         NvDmaFB         =3D 0x80000002,
> @@ -89,7 +93,7 @@ FIRE_RING(struct nouveau_channel *chan)
>
>         if (chan->dma.ib_max) {
>                 nv50_dma_push(chan, chan->push.addr + (chan->dma.put << 2=
),
> -                             (chan->dma.cur - chan->dma.put) << 2);
> +                             (chan->dma.cur - chan->dma.put) << 2, true)=
;
>         } else {
>                 WRITE_PUT(chan->dma.cur);
>         }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c
> b/drivers/gpu/drm/nouveau/nouveau_exec.c
> index 0f927adda4ed..a123b07b2adf 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_exec.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
> @@ -164,8 +164,10 @@ nouveau_exec_job_run(struct nouveau_job *job)
>         }
>
>         for (i =3D 0; i < exec_job->push.count; i++) {
> -               nv50_dma_push(chan, exec_job->push.s[i].va,
> -                             exec_job->push.s[i].va_len);
> +               struct drm_nouveau_exec_push *p =3D &exec_job->push.s[i];
> +               bool prefetch =3D !(p->flags &
> DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH);
> +
> +               nv50_dma_push(chan, p->va, p->va_len, prefetch);
>         }
>
>         ret =3D nouveau_fence_emit(fence, chan);
> @@ -223,7 +225,14 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob=
,
>  {
>         struct nouveau_exec_job *job;
>         struct nouveau_job_args args =3D {};
> -       int ret;
> +       int i, ret;
> +
> +       for (i =3D 0; i < __args->push.count; i++) {
> +               struct drm_nouveau_exec_push *p =3D &__args->push.s[i];
> +
> +               if (p->va_len > NV50_DMA_PUSH_MAX_LENGTH)
> +                       return -EINVAL;
>

This can probably be wrapped in unlikely().  Also, it'd be nice if we
printed an error message like we do if you try to push too many things.

Looks good. Thanks!

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>


> +       }
>
>         job =3D *pjob =3D kzalloc(sizeof(*job), GFP_KERNEL);
>         if (!job)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index f39360870c70..2f3dc4d71657 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -856,9 +856,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev,
> void *data,
>                 for (i =3D 0; i < req->nr_push; i++) {
>                         struct nouveau_vma *vma =3D (void *)(unsigned lon=
g)
>                                 bo[push[i].bo_index].user_priv;
> +                       u64 addr =3D vma->addr + push[i].offset;
> +                       u32 length =3D push[i].length &
> ~NOUVEAU_GEM_PUSHBUF_NO_PREFETCH;
> +                       bool prefetch =3D !(push[i].length &
> NOUVEAU_GEM_PUSHBUF_NO_PREFETCH);
>
> -                       nv50_dma_push(chan, vma->addr + push[i].offset,
> -                                     push[i].length);
> +                       nv50_dma_push(chan, addr, length, prefetch);
>                 }
>         } else
>         if (drm->client.device.info.chipset >=3D 0x25) {
> diff --git a/include/uapi/drm/nouveau_drm.h
> b/include/uapi/drm/nouveau_drm.h
> index b1ad9d5ffce8..8f16724b5d05 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -138,6 +138,7 @@ struct drm_nouveau_gem_pushbuf_push {
>         __u32 pad;
>         __u64 offset;
>         __u64 length;
> +#define NOUVEAU_GEM_PUSHBUF_NO_PREFETCH (1 << 23)
>  };
>
>  struct drm_nouveau_gem_pushbuf {
> @@ -338,7 +339,12 @@ struct drm_nouveau_exec_push {
>         /**
>          * @va_len: the length of the push buffer mapping
>          */
> -       __u64 va_len;
> +       __u32 va_len;
> +       /**
> +        * flags: the flags for this push buffer mapping
> +        */
> +       __u32 flags;
> +#define DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH 0x1
>  };
>
>  /**
>
> base-commit: ad1367f831f8743746a1f49705c28e36a7c95525
> --
> 2.41.0
>
>

--000000000000aafd9f06038e391c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Aug 22, 2023 at 6:41=E2=80=AFPM Danilo Krummrich &lt;<a href=
=3D"mailto:dakr@redhat.com">dakr@redhat.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Currently, NO_PREFETCH is passed=
 implicitly through<br>
drm_nouveau_gem_pushbuf_push::length and drm_nouveau_exec_push::va_len.<br>
<br>
Since this is a direct representation of how the HW is programmed it<br>
isn&#39;t really future proof for a uAPI. Hence, fix this up for the new<br=
>
uAPI and split up the va_len field of struct drm_nouveau_exec_push,<br>
such that we keep 32bit for va_len and 32bit for flags.<br>
<br>
For drm_nouveau_gem_pushbuf_push::length at least provide<br>
NOUVEAU_GEM_PUSHBUF_NO_PREFETCH to indicate the bit shift.<br>
<br>
While at it, fix up nv50_dma_push() as well, such that the caller<br>
doesn&#39;t need to encode the NO_PREFETCH flag into the length parameter.<=
br>
<br>
Signed-off-by: Danilo Krummrich &lt;<a href=3D"mailto:dakr@redhat.com" targ=
et=3D"_blank">dakr@redhat.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_dma.c=C2=A0 |=C2=A0 7 +++++--<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_dma.h=C2=A0 |=C2=A0 8 ++++++--<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_exec.c | 15 ++++++++++++---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c=C2=A0 |=C2=A0 6 ++++--<br>
=C2=A0include/uapi/drm/nouveau_drm.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 8 +++++++-<br>
=C2=A05 files changed, 34 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.c b/drivers/gpu/drm/nouvea=
u/nouveau_dma.c<br>
index b90cac6d5772..059925e5db6a 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_dma.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.c<br>
@@ -69,16 +69,19 @@ READ_GET(struct nouveau_channel *chan, uint64_t *prev_g=
et, int *timeout)<br>
=C2=A0}<br>
<br>
=C2=A0void<br>
-nv50_dma_push(struct nouveau_channel *chan, u64 offset, int length)<br>
+nv50_dma_push(struct nouveau_channel *chan, u64 offset, u32 length,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool prefetch)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nvif_user *user =3D &amp;chan-&gt;drm-&g=
t;client.device.user;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_bo *pb =3D chan-&gt;push.buffer;=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ip =3D (chan-&gt;dma.ib_put * 2) + chan-&gt=
;dma.ib_base;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG_ON(chan-&gt;dma.ib_free &lt; 1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(length &gt; NV50_DMA_PUSH_MAX_LENGTH);<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nouveau_bo_wr32(pb, ip++, lower_32_bits(offset)=
);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_bo_wr32(pb, ip++, upper_32_bits(offset)=
 | length &lt;&lt; 8);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_bo_wr32(pb, ip++, upper_32_bits(offset)=
 | length &lt;&lt; 8 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(prefetch ? 0 : (1 &lt;&lt; 31)));<br></blockquote><div><br></div=
><div>It feels a bit weird to be inverting this bit twice. IDK that it matt=
ers, though.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chan-&gt;dma.ib_put =3D (chan-&gt;dma.ib_put + =
1) &amp; chan-&gt;dma.ib_max;<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouvea=
u/nouveau_dma.h<br>
index 035a709c7be1..fb471c357336 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h<br>
@@ -31,7 +31,8 @@<br>
=C2=A0#include &quot;nouveau_chan.h&quot;<br>
<br>
=C2=A0int nouveau_dma_wait(struct nouveau_channel *, int slots, int size);<=
br>
-void nv50_dma_push(struct nouveau_channel *, u64 addr, int length);<br>
+void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool prefet=
ch);<br>
<br>
=C2=A0/*<br>
=C2=A0 * There&#39;s a hw race condition where you can&#39;t jump to your P=
UT offset,<br>
@@ -45,6 +46,9 @@ void nv50_dma_push(struct nouveau_channel *, u64 addr, in=
t length);<br>
=C2=A0 */<br>
=C2=A0#define NOUVEAU_DMA_SKIPS (128 / 4)<br>
<br>
+/* Maximum push buffer size. */<br>
+#define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff<br>
+<br>
=C2=A0/* Object handles - for stuff that&#39;s doesn&#39;t use handle =3D=
=3D oclass. */<br>
=C2=A0enum {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 NvDmaFB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0x=
80000002,<br>
@@ -89,7 +93,7 @@ FIRE_RING(struct nouveau_channel *chan)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chan-&gt;dma.ib_max) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nv50_dma_push(chan,=
 chan-&gt;push.addr + (chan-&gt;dma.put &lt;&lt; 2),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(chan-&gt;dma.cur - chan-&gt;dma.put) &lt;&l=
t; 2);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(chan-&gt;dma.cur - chan-&gt;dma.put) &lt;&l=
t; 2, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 WRITE_PUT(chan-&gt;=
dma.cur);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouve=
au/nouveau_exec.c<br>
index 0f927adda4ed..a123b07b2adf 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c<br>
@@ -164,8 +164,10 @@ nouveau_exec_job_run(struct nouveau_job *job)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; exec_job-&gt;push.count; i=
++) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv50_dma_push(chan,=
 exec_job-&gt;push.s[i].va,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exec_job-&gt;push.s[i].va_len);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_nouveau_=
exec_push *p =3D &amp;exec_job-&gt;push.s[i];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool prefetch =3D !=
(p-&gt;flags &amp; DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nv50_dma_push(chan,=
 p-&gt;va, p-&gt;va_len, prefetch);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nouveau_fence_emit(fence, chan);<br>
@@ -223,7 +225,14 @@ nouveau_exec_job_init(struct nouveau_exec_job **pjob,<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_exec_job *job;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_job_args args =3D {};<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i, ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; __args-&gt;push.count; i++=
) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_nouveau_=
exec_push *p =3D &amp;__args-&gt;push.s[i];<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p-&gt;va_len &g=
t; NV50_DMA_PUSH_MAX_LENGTH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br></blockquote><div><br></div><div>This can prob=
ably be wrapped in unlikely().=C2=A0 Also, it&#39;d be nice if we printed a=
n error message like we do if you try to push too many things.</div><div><b=
r></div><div>Looks good. Thanks!</div><div><br></div><div>Reviewed-by: Fait=
h Ekstrand &lt;<a href=3D"mailto:faith.ekstrand@collabora.com">faith.ekstra=
nd@collabora.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 job =3D *pjob =3D kzalloc(sizeof(*job), GFP_KER=
NEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!job)<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c<br>
index f39360870c70..2f3dc4d71657 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c<br>
@@ -856,9 +856,11 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void=
 *data,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; req-&gt;nr_push; i++) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 struct nouveau_vma *vma =3D (void *)(unsigned long)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bo[push[i].bo_index].user_priv;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u64 addr =3D vma-&gt;addr + push[i].offset;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0u32 length =3D push[i].length &amp; ~NOUVEAU_GEM_PUSHBUF_NO_PREFE=
TCH;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bool prefetch =3D !(push[i].length &amp; NOUVEAU_GEM_PUSHBUF_NO_P=
REFETCH);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nv50_dma_push(chan, vma-&gt;addr + push[i].offset,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0push[i].length);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nv50_dma_push(chan, addr, length, prefetch);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm-&gt;<a href=3D"http://client.device.inf=
o" target=3D"_blank">client.device.info</a>.chipset &gt;=3D 0x25) {<br>
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.=
h<br>
index b1ad9d5ffce8..8f16724b5d05 100644<br>
--- a/include/uapi/drm/nouveau_drm.h<br>
+++ b/include/uapi/drm/nouveau_drm.h<br>
@@ -138,6 +138,7 @@ struct drm_nouveau_gem_pushbuf_push {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u32 pad;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 offset;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 __u64 length;<br>
+#define NOUVEAU_GEM_PUSHBUF_NO_PREFETCH (1 &lt;&lt; 23)<br>
=C2=A0};<br>
<br>
=C2=A0struct drm_nouveau_gem_pushbuf {<br>
@@ -338,7 +339,12 @@ struct drm_nouveau_exec_push {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /**<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* @va_len: the length of the push buffer =
mapping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0__u64 va_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 va_len;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/**<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * flags: the flags for this push buffer mappin=
g<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0__u32 flags;<br>
+#define DRM_NOUVEAU_EXEC_PUSH_NO_PREFETCH 0x1<br>
=C2=A0};<br>
<br>
=C2=A0/**<br>
<br>
base-commit: ad1367f831f8743746a1f49705c28e36a7c95525<br>
-- <br>
2.41.0<br>
<br>
</blockquote></div></div>

--000000000000aafd9f06038e391c--
