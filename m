Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8337415EC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 18:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796BA10E0AD;
	Wed, 28 Jun 2023 16:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6F610E0AD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 16:00:30 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-991b7a4d2e8so448178966b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1687968026; x=1690560026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sC0OX7H8eqhRUB/Bw7rKQScq57n3i9I71mmWVcybeEc=;
 b=UXaOHtOV6Z32ISC5j9YdO3ZE8wzTA9hBOubhMGPkIChPDJKIUiJOGCSWdGiYoXBJE6
 1NeYS5x4jFTp4l48yb3Hs+DFX7BGyOzFHPAxI/e9UjVJv7YoqGtuzH9ibeFwgNlhTuam
 IO/SfiAnpaxKVyqNFROaceygZcsiUK0s1Dfv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687968026; x=1690560026;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sC0OX7H8eqhRUB/Bw7rKQScq57n3i9I71mmWVcybeEc=;
 b=He7GCJtkfuuPaDBBjE18wOs5MedKs7qNZMTH9+w7zRCLXF8venL81IjEbx46DA3dfh
 R1d/v2ypGcfyJkHh8EV6cAfMlMwBOWMtMTqyKJBGDTUFEnbmLDKDRZ0WqGc9fpBDtQ3m
 nlBMcx2VCUublaUuSaOQ7Ts+wQEe9nRtKCL6drs9jGU0pdHymLbfr9RcAt+E/xC4BhQ+
 v94yy3HZug0V7lGU8BFDK32VHgl1yuURvIz0MHV4YMjNwmUvyi66iln40I47xIfTu1oW
 WGZMwT/ST7Mtpdv8cvLo/QGsMo64ZuIZEv1tgpl2a+VvmsjoEV2C/9pXK+imp49cEiZA
 RBXQ==
X-Gm-Message-State: AC+VfDyfqXMA9dkhnhl6QhcqoCUM11GGudVuIgHzgb0MQYhCP1RpBr83
 4TLy/hXVFlpcYsUssItDVfjhyTWWH9+oFQfdnvXxKg==
X-Google-Smtp-Source: ACHHUZ5ICnfDCE0DVyPKsRnf6r4Chs45BOZKu/4QEwyqSU0S9IpCMi74HkFPiDdGKg5StX1VMF4SjQ==
X-Received: by 2002:a17:906:db0e:b0:982:a2dd:4543 with SMTP id
 xj14-20020a170906db0e00b00982a2dd4543mr30050942ejb.18.1687968025931; 
 Wed, 28 Jun 2023 09:00:25 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 gv18-20020a170906f11200b0098e0a937a6asm5264895ejb.69.2023.06.28.09.00.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jun 2023 09:00:25 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-51bcf75c4acso11655a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 09:00:25 -0700 (PDT)
X-Received: by 2002:a50:baaf:0:b0:510:b2b7:8a78 with SMTP id
 x44-20020a50baaf000000b00510b2b78a78mr60371ede.5.1687968025334; Wed, 28 Jun
 2023 09:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230613174306.1208-1-gurchetansingh@chromium.org>
 <e4c1ad5b-bee0-cdd7-a85a-2229a8e32eb4@collabora.com>
In-Reply-To: <e4c1ad5b-bee0-cdd7-a85a-2229a8e32eb4@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 28 Jun 2023 09:00:12 -0700
X-Gmail-Original-Message-ID: <CAAfnVBnKcZSXXmAYC+oni_wsaokBWyU16mYC_5sDVFaLtno=0Q@mail.gmail.com>
Message-ID: <CAAfnVBnKcZSXXmAYC+oni_wsaokBWyU16mYC_5sDVFaLtno=0Q@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: conditionally allocate virtio_gpu_fence
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Type: multipart/alternative; boundary="0000000000008b532505ff32ae67"
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
Cc: acourbot@chromium.org, dri-devel@lists.freedesktop.org, kraxel@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008b532505ff32ae67
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 3:02=E2=80=AFPM Dmitry Osipenko <
dmitry.osipenko@collabora.com> wrote:

> On 6/13/23 20:43, Gurchetan Singh wrote:
> > We don't want to create a fence for every command submission.  It's
> > only necessary when userspace provides a waitable token for submission.
> > This could be:
> >
> > 1) bo_handles, to be used with VIRTGPU_WAIT
> > 2) out_fence_fd, to be used with dma_fence apis
> > 3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
> >    + DRM event API
> > 4) syncobjs in the future
> >
> > The use case for just submitting a command to the host, and expecting
> > no response.  For example, gfxstream has GFXSTREAM_CONTEXT_PING that
> > just wakes up the host side worker threads.  There's also
> > CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.
> >
> > This prevents the need to signal the automatically created
> > virtio_gpu_fence.
> >
> > Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c
> b/drivers/gpu/drm/virtio/virtgpu_submit.c
> > index cf3c04b16a7a..add106c06ab2 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_submit.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c
> > @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct
> virtio_gpu_submit *submit,
> >
> >       memset(submit, 0, sizeof(*submit));
> >
> > -     out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);
> > -     if (!out_fence)
> > -             return -ENOMEM;
> > +     if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
> > +             ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
> > +             (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
> > +             exbuf->num_bo_handles)
> > +             out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx,
> ring_idx);
> > +     else
> > +             out_fence =3D NULL;
> >
> >       err =3D virtio_gpu_fence_event_create(dev, file, out_fence,
> ring_idx);
> >       if (err) {
>
> Looks okay, code indentation may be improved a tad to make it more
> eye-friendly:
>
> +       if ((exbuf->flags & VIRTGPU_EXECBUF_FENCE_FD_OUT) ||
> +          ((exbuf->flags & VIRTGPU_EXECBUF_RING_IDX) &&
> (vfpriv->ring_idx_mask & BIT_ULL(ring_idx))) ||
> +            exbuf->num_bo_handles)
> +               out_fence =3D virtio_gpu_fence_alloc(vgdev, fence_ctx,
> ring_idx);
> +       else
> +               out_fence =3D NULL;
>
> Checkpatch will complain about this variant, but the complaint can be
> ignored in this case.
>

Added you r-b and fixed indent in v2.


>
> --
> Best regards,
> Dmitry
>
>

--0000000000008b532505ff32ae67
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 19, 2023 at 3:02=E2=80=AF=
PM Dmitry Osipenko &lt;<a href=3D"mailto:dmitry.osipenko@collabora.com">dmi=
try.osipenko@collabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 6/13/23 20:43, Gurchetan Singh wrote:<br>
&gt; We don&#39;t want to create a fence for every command submission.=C2=
=A0 It&#39;s<br>
&gt; only necessary when userspace provides a waitable token for submission=
.<br>
&gt; This could be:<br>
&gt; <br>
&gt; 1) bo_handles, to be used with VIRTGPU_WAIT<br>
&gt; 2) out_fence_fd, to be used with dma_fence apis<br>
&gt; 3) a ring_idx provided with VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK<br>
&gt;=C2=A0 =C2=A0 + DRM event API<br>
&gt; 4) syncobjs in the future<br>
&gt; <br>
&gt; The use case for just submitting a command to the host, and expecting<=
br>
&gt; no response.=C2=A0 For example, gfxstream has GFXSTREAM_CONTEXT_PING t=
hat<br>
&gt; just wakes up the host side worker threads.=C2=A0 There&#39;s also<br>
&gt; CROSS_DOMAIN_CMD_SEND which just sends data to the Wayland server.<br>
&gt; <br>
&gt; This prevents the need to signal the automatically created<br>
&gt; virtio_gpu_fence.<br>
&gt; <br>
&gt; Signed-off-by: Gurchetan Singh &lt;<a href=3D"mailto:gurchetansingh@ch=
romium.org" target=3D"_blank">gurchetansingh@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/virtio/virtgpu_submit.c | 10 +++++++---<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/virtio/virtgpu_submit.c b/drivers/gpu/drm=
/virtio/virtgpu_submit.c<br>
&gt; index cf3c04b16a7a..add106c06ab2 100644<br>
&gt; --- a/drivers/gpu/drm/virtio/virtgpu_submit.c<br>
&gt; +++ b/drivers/gpu/drm/virtio/virtgpu_submit.c<br>
&gt; @@ -168,9 +168,13 @@ static int virtio_gpu_init_submit(struct virtio_g=
pu_submit *submit,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0memset(submit, 0, sizeof(*submit));<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0out_fence =3D virtio_gpu_fence_alloc(vgdev, fence=
_ctx, ring_idx);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!out_fence)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((exbuf-&gt;flags &amp; VIRTGPU_EXECBUF_FENCE_=
FD_OUT) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((exbuf-&gt;flags &am=
p; VIRTGPU_EXECBUF_RING_IDX) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(vfpriv-&gt;ring_idx_=
mask &amp; BIT_ULL(ring_idx))) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exbuf-&gt;num_bo_hand=
les)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D virtio_=
gpu_fence_alloc(vgdev, fence_ctx, ring_idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D NULL;<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D virtio_gpu_fence_event_create(dev, f=
ile, out_fence, ring_idx);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (err) {<br>
<br>
Looks okay, code indentation may be improved a tad to make it more eye-frie=
ndly:<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ((exbuf-&gt;flags &amp; VIRTGPU_EXECBUF_FENC=
E_FD_OUT) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((exbuf-&gt;flags &amp; VIRTGPU_EXECBUF=
_RING_IDX) &amp;&amp; (vfpriv-&gt;ring_idx_mask &amp; BIT_ULL(ring_idx))) |=
|<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exbuf-&gt;num_bo_handles)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D virti=
o_gpu_fence_alloc(vgdev, fence_ctx, ring_idx);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0out_fence =3D NULL;=
<br>
<br>
Checkpatch will complain about this variant, but the complaint can be ignor=
ed in this case.<br></blockquote><div><br></div><div>Added you r-b and fixe=
d indent in v2.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
-- <br>
Best regards,<br>
Dmitry<br>
<br>
</blockquote></div></div>

--0000000000008b532505ff32ae67--
