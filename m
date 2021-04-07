Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E347835605D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Apr 2021 02:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68AC36E03C;
	Wed,  7 Apr 2021 00:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E776E03C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Apr 2021 00:34:18 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id r8so8077639lfp.10
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 17:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=acgMnWshKo2qHEqQO12CZW0f1ufeHa9EX/5nU3oUNsQ=;
 b=lcv4aqeZyGO/ZZI05AYasNM4ItGj5gFvBl3zYHle1z4O2Pv0P5oPG6WoGdMjC8qdf+
 nLCIdEXIGf7Ta03j928FfLJSJ144+YgBOyTWluyNZi1F/LplPZGbt8abDhv0B2nmkLv8
 SimmsLx68Tk5ymhn123aRy6y+0pLFWNIVCB3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acgMnWshKo2qHEqQO12CZW0f1ufeHa9EX/5nU3oUNsQ=;
 b=FyrumdwwyH+I8tI7OUEQn3D3n92ZMgVvfbjpC4LjmE8IjIDju4GElbBgeD/mTmEDMx
 A3uZVCEeUtbLaYaM7Ts2uY79Mq+b3zWu7/b5uJcTlqx0aTvCtki1aJEr1LnMitcCDSad
 Cb8zXiyUgmwNi9mwJarK0V6E1j4q+42EXbuWVFo8HSLRV1DGnoaax6V1AkETuJU6i1iu
 MjmTDK/WB79pJTfUUNo6RuKQ2ffFe+gcUcoFtbVy9d47rRL9PQE2bIiLERbJFmckrQRI
 F2yxbaFxqyc+Cbr8gR652/hgcUaj3he/iC1fHp3wIm40TrbGxq7Bn6/nzB3NoLqI6iHH
 xpqg==
X-Gm-Message-State: AOAM531r1mL1eMQ7tg4C6i+gsNhNszP6PGbomVdNlhU2xSDCSzDmfJTn
 gQHOjhmXFn8RqmE4Fu1+DEyxD9t3af49Asy/
X-Google-Smtp-Source: ABdhPJzFKA40C/kIkwYOijrSVNOt71RLl/8GAkXICy8Vz3EIdh4hFbA3ZXwCspIgSu/0rolpCuKyJw==
X-Received: by 2002:a05:6512:38d2:: with SMTP id
 p18mr569459lft.323.1617755656873; 
 Tue, 06 Apr 2021 17:34:16 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id t17sm2367739lfe.30.2021.04.06.17.34.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 17:34:16 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id b4so25602148lfi.6
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Apr 2021 17:34:16 -0700 (PDT)
X-Received: by 2002:ac2:568b:: with SMTP id 11mr555845lfr.509.1617755655784;
 Tue, 06 Apr 2021 17:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210401065324.vb44nfodohcgrdex@sirius.home.kraxel.org>
 <20210406203625.1727955-1-vivek.kasireddy@intel.com>
In-Reply-To: <20210406203625.1727955-1-vivek.kasireddy@intel.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Tue, 6 Apr 2021 17:34:03 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
Message-ID: <CAAfnVB=NUjUUUcABQhR3AhQPtdDu9uHZCsi+9Q90babp2AfOpg@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Create Dumb BOs as guest Blobs (v2)
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0995844294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0995844294==
Content-Type: multipart/alternative; boundary="00000000000032d32505bf571711"

--00000000000032d32505bf571711
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 6, 2021 at 1:47 PM Vivek Kasireddy <vivek.kasireddy@intel.com>
wrote:

> If support for Blob resources is available, then dumb BOs created
> by the driver can be considered as guest Blobs.
>
> v2: Don't skip transfer and flush commands as part of plane update
> as the device may have created a shared mapping. (Gerd)
>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_gem.c    | 8 ++++++++
>  drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++
>  2 files changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c
> b/drivers/gpu/drm/virtio/virtgpu_gem.c
> index 8502400b2f9c..5f49fb1cce65 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
> @@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file
> *file_priv,
>  {
>         struct drm_gem_object *gobj;
>         struct virtio_gpu_object_params params = { 0 };
> +       struct virtio_gpu_device *vgdev = dev->dev_private;
>         int ret;
>         uint32_t pitch;
>
> @@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file
> *file_priv,
>         params.height = args->height;
>         params.size = args->size;
>         params.dumb = true;
> +
> +       if (vgdev->has_resource_blob) {
> +               params.blob_mem = VIRTGPU_BLOB_MEM_GUEST;
> +               params.blob_flags = VIRTGPU_BLOB_FLAG_USE_SHAREABLE;
>

This creates some log spam with crosvm + virgl_3d + vanilla linux, since
transfers don't work for guest blobs.  Two options:

a) Add vgdev->has_virgl_3d check and don't create a guest blob in that case.
b) The interactions between TRANSFER_TO_HOST_2D and VIRTGPU_BLOB_MEM_GUEST
are a bit under-defined in the spec.  Though since you don't have a host
side resource, you can safely skip the transfer and crosvm can be modified
to do the right thing in case of RESOURCE_FLUSH.

It makes a ton of sense to have a explicit udmabuf-like flag
("BLOB_FLAG_CREATE_GUEST_HANDLE" or "BLOB_FLAG_HANDLE_FROM_GUEST" -- want
to host OS agnostic -- any other ideas?), especially with 3d mode.  For
now, implicit udmabuf + dumb should be fine since the QEMU patches have
been floating around for a while and should land soon for future use cases.



> +               params.blob = true;
> +       }
>



> +
>         ret = virtio_gpu_gem_create(file_priv, dev, &params, &gobj,
>                                     &args->handle);
>         if (ret)
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c
> b/drivers/gpu/drm/virtio/virtgpu_object.c
> index 4ff1ec28e630..f648b0e24447 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device
> *vgdev,
>         }
>
>         if (params->blob) {
> +               if (params->blob_mem == VIRTGPU_BLOB_MEM_GUEST)
> +                       bo->guest_blob = true;
> +
>                 virtio_gpu_cmd_resource_create_blob(vgdev, bo, params,
>                                                     ents, nents);
>         } else if (params->virgl) {
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--00000000000032d32505bf571711
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 6, 2021 at 1:47 PM Vivek =
Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.com" target=3D"_blank=
">vivek.kasireddy@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">If support for Blob resources is available, then=
 dumb BOs created<br>
by the driver can be considered as guest Blobs.<br>
<br>
v2: Don&#39;t skip transfer and flush commands as part of plane update<br>
as the device may have created a shared mapping. (Gerd)<br>
<br>
Cc: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank=
">kraxel@redhat.com</a>&gt;<br>
Signed-off-by: Vivek Kasireddy &lt;<a href=3D"mailto:vivek.kasireddy@intel.=
com" target=3D"_blank">vivek.kasireddy@intel.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_gem.c=C2=A0 =C2=A0 | 8 ++++++++<br>
=C2=A0drivers/gpu/drm/virtio/virtgpu_object.c | 3 +++<br>
=C2=A02 files changed, 11 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/=
virtgpu_gem.c<br>
index 8502400b2f9c..5f49fb1cce65 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_gem.c<br>
@@ -64,6 +64,7 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_pri=
v,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *gobj;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct virtio_gpu_object_params params =3D { 0 =
};<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct virtio_gpu_device *vgdev =3D dev-&gt;dev=
_private;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t pitch;<br>
<br>
@@ -79,6 +80,13 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_pr=
iv,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 params.height =3D args-&gt;height;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 params.size =3D args-&gt;size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 params.dumb =3D true;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (vgdev-&gt;has_resource_blob) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.blob_mem =3D=
 VIRTGPU_BLOB_MEM_GUEST;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.blob_flags =
=3D VIRTGPU_BLOB_FLAG_USE_SHAREABLE;<br></blockquote><div><br></div><div>Th=
is creates some log spam with crosvm=C2=A0+ virgl_3d + vanilla linux, since=
 transfers don&#39;t work for guest blobs.=C2=A0 Two options:</div><div><br=
></div><div>a) Add vgdev-&gt;has_virgl_3d check and don&#39;t create a gues=
t blob in that case.</div><div>b) The interactions between TRANSFER_TO_HOST=
_2D and VIRTGPU_BLOB_MEM_GUEST are a bit under-defined in the spec.=C2=A0 T=
hough since you don&#39;t have a host side resource, you can safely skip th=
e transfer and crosvm can be modified to do the right thing in case of RESO=
URCE_FLUSH.=C2=A0=C2=A0</div><div><br></div><div>It makes a ton of sense to=
 have a explicit udmabuf-like flag (&quot;BLOB_FLAG_CREATE_GUEST_HANDLE&quo=
t; or &quot;BLOB_FLAG_HANDLE_FROM_GUEST&quot; -- want to host OS agnostic -=
- any other ideas?), especially with 3d mode.=C2=A0 For now, implicit udmab=
uf + dumb should be fine since the QEMU patches have been floating around f=
or a while and should land soon for future use cases.<br></div><div><br></d=
iv><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0params.blob =3D tru=
e;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D virtio_gpu_gem_create(file_priv, dev, &=
amp;params, &amp;gobj,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;args-&gt;handle);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virt=
io/virtgpu_object.c<br>
index 4ff1ec28e630..f648b0e24447 100644<br>
--- a/drivers/gpu/drm/virtio/virtgpu_object.c<br>
+++ b/drivers/gpu/drm/virtio/virtgpu_object.c<br>
@@ -254,6 +254,9 @@ int virtio_gpu_object_create(struct virtio_gpu_device *=
vgdev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (params-&gt;blob) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (params-&gt;blob=
_mem =3D=3D VIRTGPU_BLOB_MEM_GUEST)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bo-&gt;guest_blob =3D true;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_gpu_cmd_reso=
urce_create_blob(vgdev, bo, params,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ents, nents);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (params-&gt;virgl) {<br>
-- <br>
2.26.2<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a><br>
</blockquote></div></div>

--00000000000032d32505bf571711--

--===============0995844294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0995844294==--
