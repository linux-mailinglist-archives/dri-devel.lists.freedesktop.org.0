Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F005A49EC2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:28:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B2110ECF6;
	Fri, 28 Feb 2025 16:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WTin4uE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039CE10ECF6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740760116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2jvTSCB1Zvo+t6Y+On0YfNf1Uk5+D33UHPs4eU3gaLA=;
 b=WTin4uE4Y2XkvxfDZdJ94+SxK2WdA9uHr2X39oWPI0eXlu3g9nZl3U53ZK1u2jqixf0awO
 xw29DRjqB/1B2nwcknvfgJpLeAJ3Hx0fHOqtbDF3pcAb+UPNS8G3ckjDVdIQKKmunvG/DE
 nyosbfgIT2J48FR2rv8VBR0OY9vACls=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-r4J6WptwORmTykvVfwBGtw-1; Fri, 28 Feb 2025 11:28:35 -0500
X-MC-Unique: r4J6WptwORmTykvVfwBGtw-1
X-Mimecast-MFC-AGG-ID: r4J6WptwORmTykvVfwBGtw_1740760113
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6f2c7746509so34554407b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:28:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740760113; x=1741364913;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2jvTSCB1Zvo+t6Y+On0YfNf1Uk5+D33UHPs4eU3gaLA=;
 b=PzVZ3ZNMEGTfyP81AMu9kXXtCeNKQyn+Ewd7+3OGkAFNBnGDbVkwBXb73+U6LL3Bni
 jNNwU3zizu2mvYbFjV7vpeNrBuuxzO3VdjBsx5iIx5WxOGyc60xztFRAoVR1VxruJZYB
 W4wXdp1mKskeDuqaDOpERyLb2Rqs3I9e2MaE4gBuCi8HP3M+p2Jzk/pYCiXWhw8LzMds
 x3uGFKaLTLIKVK9GJFv/Ksjzcdw09QGhhOqmJF6gTolxD6ZxZHY0wn6vqHg+7SvZJb+H
 Cet0Z04c5NHK3qiBfvHUQ6mCua/BBLZR46L0IUDRgWDEVSWfhJZQ3lfR3lY1vtQ546Vc
 8SAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Hgm0wkyFU1L4kX3Ihw9rIUq05MZSMptzMPzS1v3DFPgwSAsjKPdjGL7j7aybafTcRcqNUY0ldJQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZAn9yiqYmMILqHtGcCCNbEUGL0pr5PYy3Mb/nMi+XFjQdeMBE
 8flIf7WgJ0HsuO9KL+JJ7vRXrK9pTrohH2QBsgzuEFF2LjeEjxROio1sf0++7vnMZg9ktoQvnpm
 R5ey7Mb0ITnAhlsrPeJSyAL5OQYPyfS3hgp12QkY47reAusrpOe7Gj10Cxpto1pOd8uiDY8AvhW
 vg/9PqUvJQTR9IfAYzaIOFCmKK70PToZJSmcnJ0CY6
X-Gm-Gg: ASbGncsSc+ry19I8U3DspdnMrDhq/Og2tBqFFoqCjWX8f+8WC/GM4tuy4ciYinJnPC7
 rob/aRdaa5Rs3IbNxHre3Z2yKiHFPYlGDM7bIdqIlPA+EJlOyvGDluR0OjPPVnLAedIydcDs=
X-Received: by 2002:a05:690c:6912:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fd49f9f4d7mr54416667b3.3.1740760112853; 
 Fri, 28 Feb 2025 08:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU2sup9GNK1LWwwBqjdwItjNq7pnXhiurqbTWlEnyDa/HUS9FkJ8ETHeM/vdAcMRk/Fgejo9bTujtuSkB6A8E=
X-Received: by 2002:a05:690c:6912:b0:6fb:9389:3cde with SMTP id
 00721157ae682-6fd49f9f4d7mr54415677b3.3.1740760111667; Fri, 28 Feb 2025
 08:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-8-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-8-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:28:20 -0500
X-Gm-Features: AQ5f1Jp_u5F0r8PukJ813zLg5UrkPRK89MfjPOWspyqG0di6jE3nBSzSCvSOU8g
Message-ID: <CAN9Xe3Thzs9BYdd9zKh3oK+TozLQt5gE7hOE1fxPqLOBuGG7bg@mail.gmail.com>
Subject: Re: [PATCH 07/10] drm/gem-framebuffer: Use dma_buf from GEM object
 instance
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g4ZM2DSyPaQ9L0m7ZgJjIFmQ2ZXH1NNj2m0wjRaII_o_1740760113
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000186bce062f364c5d"
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

--000000000000186bce062f364c5d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Avoid dereferencing struct drm_gem_object.import_attach for the
> imported dma-buf. The dma_buf field in the GEM object instance refers
> to the same buffer. Prepares to make import_attach optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 2bf606ba24cd..0fbeb686e561 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -419,7 +419,6 @@ EXPORT_SYMBOL(drm_gem_fb_vunmap);
>  static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, enum
> dma_data_direction dir,
>                                         unsigned int num_planes)
>  {
> -       struct dma_buf_attachment *import_attach;
>         struct drm_gem_object *obj;
>         int ret;
>
> @@ -428,10 +427,9 @@ static void __drm_gem_fb_end_cpu_access(struct
> drm_framebuffer *fb, enum dma_dat
>                 obj =3D drm_gem_fb_get_obj(fb, num_planes);
>                 if (!obj)
>                         continue;
> -               import_attach =3D obj->import_attach;
>                 if (!drm_gem_is_imported(obj))
>                         continue;
> -               ret =3D dma_buf_end_cpu_access(import_attach->dmabuf, dir=
);
> +               ret =3D dma_buf_end_cpu_access(obj->dma_buf, dir);
>                 if (ret)
>                         drm_err(fb->dev, "dma_buf_end_cpu_access(%u, %d)
> failed: %d\n",
>                                 ret, num_planes, dir);
> @@ -454,7 +452,6 @@ static void __drm_gem_fb_end_cpu_access(struct
> drm_framebuffer *fb, enum dma_dat
>   */
>  int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum
> dma_data_direction dir)
>  {
> -       struct dma_buf_attachment *import_attach;
>         struct drm_gem_object *obj;
>         unsigned int i;
>         int ret;
> @@ -465,10 +462,9 @@ int drm_gem_fb_begin_cpu_access(struct
> drm_framebuffer *fb, enum dma_data_direct
>                         ret =3D -EINVAL;
>                         goto err___drm_gem_fb_end_cpu_access;
>                 }
> -               import_attach =3D obj->import_attach;
>                 if (!drm_gem_is_imported(obj))
>                         continue;
> -               ret =3D dma_buf_begin_cpu_access(import_attach->dmabuf, d=
ir);
> +               ret =3D dma_buf_begin_cpu_access(obj->dma_buf, dir);
>                 if (ret)
>                         goto err___drm_gem_fb_end_cpu_access;
>         }
> --
> 2.48.1
>
>

--000000000000186bce062f364c5d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Anusha Srivatsa &lt;<a href=3D"mailto:as=
rivats@redhat.com">asrivats@redhat.com</a>&gt;</div><div><br></div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a h=
ref=3D"mailto:tzimmermann@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Avoid dereferencing s=
truct drm_gem_object.import_attach for the<br>
imported dma-buf. The dma_buf field in the GEM object instance refers<br>
to the same buffer. Prepares to make import_attach optional.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_gem_framebuffer_helper.c | 8 ++------<br>
=C2=A01 file changed, 2 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm=
/drm_gem_framebuffer_helper.c<br>
index 2bf606ba24cd..0fbeb686e561 100644<br>
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c<br>
@@ -419,7 +419,6 @@ EXPORT_SYMBOL(drm_gem_fb_vunmap);<br>
=C2=A0static void __drm_gem_fb_end_cpu_access(struct drm_framebuffer *fb, e=
num dma_data_direction dir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned=
 int num_planes)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_attachment *import_attach;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
<br>
@@ -428,10 +427,9 @@ static void __drm_gem_fb_end_cpu_access(struct drm_fra=
mebuffer *fb, enum dma_dat<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 obj =3D drm_gem_fb_=
get_obj(fb, num_planes);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import_attach =3D o=
bj-&gt;import_attach;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!drm_gem_is_imp=
orted(obj))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_end=
_cpu_access(import_attach-&gt;dmabuf, dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_end=
_cpu_access(obj-&gt;dma_buf, dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drm_err(fb-&gt;dev, &quot;dma_buf_end_cpu_access(%u, %d) failed:=
 %d\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret, num_planes, dir);<br>
@@ -454,7 +452,6 @@ static void __drm_gem_fb_end_cpu_access(struct drm_fram=
ebuffer *fb, enum dma_dat<br>
=C2=A0 */<br>
=C2=A0int drm_gem_fb_begin_cpu_access(struct drm_framebuffer *fb, enum dma_=
data_direction dir)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_buf_attachment *import_attach;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret;<br>
@@ -465,10 +462,9 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer=
 *fb, enum dma_data_direct<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ret =3D -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err___drm_gem_fb_end_cpu_access;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0import_attach =3D o=
bj-&gt;import_attach;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!drm_gem_is_imp=
orted(obj))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_beg=
in_cpu_access(import_attach-&gt;dmabuf, dir);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_beg=
in_cpu_access(obj-&gt;dma_buf, dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err___drm_gem_fb_end_cpu_access;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000186bce062f364c5d--

