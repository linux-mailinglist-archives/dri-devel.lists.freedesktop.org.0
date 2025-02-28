Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BAA49EBC
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDB410ECFE;
	Fri, 28 Feb 2025 16:27:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HA000p/+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D707910ECF5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740760024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pKER4kzbm9UtoCdB2Z9lFkUQuLXb5H7tj/VZtnMrAjY=;
 b=HA000p/+JcnaLy8kFHVzj8XIIJUlT5jMvvWERJwaHryflj++yhCupFDwIO1ap6v8i2Zzye
 vdfrpJL85QvEWcz73Smyr2WqWPQQPBOWtMSdbsEqdHMK8h7OydhTJrTXCb1yuRWb1nVsyv
 LJ0atL6vaam3sKPoo14BeHI2J+4qPcE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-d_sP0GXwO2WBgw5e1Zk7vw-1; Fri, 28 Feb 2025 11:27:02 -0500
X-MC-Unique: d_sP0GXwO2WBgw5e1Zk7vw-1
X-Mimecast-MFC-AGG-ID: d_sP0GXwO2WBgw5e1Zk7vw_1740760022
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-6fd010df0f4so36570967b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740760022; x=1741364822;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pKER4kzbm9UtoCdB2Z9lFkUQuLXb5H7tj/VZtnMrAjY=;
 b=jRzpAsnwat3ZPg1QY8EJEAuQjbX1cf04yIiBrURs+781bLNbRnG397EXRWLaCf5uQd
 Vt+cZs9+Qmo3V98o2/vVzaLG5NTDEiOxPwRgVuwLtYBxrgJFncB8qlesmEn4C/ZYVeLZ
 4CQ4bSXJYiVHPjNvjGgJMVq5oA2elde6G1pjJIHaqO8PmHbnjwc4DOvX/2aN6ibORxT1
 kOufFnwsSu4kdp2ov30TlIpjMlOrRUryMaEjg/NwlUsrCeEIcHaB8EBGId8zjgefgbDg
 vgY/LE9g6XGFYWuWcyuIkpLyg4vFgVw6aD7zUXbvH6+FbgSxCDFEu9BHNoSFCwSei3A4
 9ydw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUybl1bbfvpta+8VTC7YPkKQrrLzG613+M7/oPDj3WPjaEIgzvzARRsTE2tnOCr3owdjMBvlU4VCvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYY2WHA6eEz3dva6meIy2ReEqKBqq5DwsmwFB3G7AwTTcYE1Lu
 baFiI9ETDHFu/M2tnAafapUoWMQJR+JZM7+nttAFZDxhus4pHQrXCJASuojSxhFwP/58cTwJE54
 mf7UneA/i4idB8aNQ/u7Gir4iHjJKj/tTDt0UCNRbrC5rQH1wFYCJRqXWMk9JeDElfpYgH8pz3m
 fcLMZNPRGryu76M1m3p9+iwbYXo6NGTjybgRpL132H
X-Gm-Gg: ASbGnctOEddsKxgLc21O08ho1rVkWqO3bRsTOtnYyyL34AuXLCNAmSP4DgOncv2zhhj
 aRLayoE/2ffxby4mNF442Rkrl3dXt/ifFB+Fk34xptmXr1u/OO1yeBYJY8a+tCnQJOhdWQrA=
X-Received: by 2002:a05:690c:3708:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6fd4a1b56d0mr54407007b3.29.1740760021774; 
 Fri, 28 Feb 2025 08:27:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT2O6YUB+A2cao4TvxGimuD22gnK3sLBLsCrkLnO/OZWJ8vKkmBVWAoJ2/CHGTA0nuEqPoPbAU1ihV4w3RMic=
X-Received: by 2002:a05:690c:3708:b0:6f9:447d:d1a2 with SMTP id
 00721157ae682-6fd4a1b56d0mr54406727b3.29.1740760021535; Fri, 28 Feb 2025
 08:27:01 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-6-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-6-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:26:50 -0500
X-Gm-Features: AQ5f1Jo-G3iEnuDsBJIQsw-QJow-l8A9JvivJbttZudPMk5n4hZ3PBavUmRARuA
Message-ID: <CAN9Xe3QU_goD8ca9_dCew3V=U22SUbVmOri1p+fwiicJKNa6wQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/gem-shmem: Use dma_buf from GEM object instance
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0UROoCEjnz3scwjqrc75kEPzXjsEb3KkE-fgGsrfrhY_1740760022
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b92bc3062f3646b4"
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

--000000000000b92bc3062f3646b4
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
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c
> b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 7722cd720248..d99dee67353a 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -339,10 +339,10 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object
> *shmem,
>         int ret =3D 0;
>
>         if (drm_gem_is_imported(obj)) {
> -               ret =3D dma_buf_vmap(obj->import_attach->dmabuf, map);
> +               ret =3D dma_buf_vmap(obj->dma_buf, map);
>                 if (!ret) {
>                         if (drm_WARN_ON(obj->dev, map->is_iomem)) {
> -                               dma_buf_vunmap(obj->import_attach->dmabuf=
,
> map);
> +                               dma_buf_vunmap(obj->dma_buf, map);
>                                 return -EIO;
>                         }
>                 }
> @@ -405,7 +405,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object
> *shmem,
>         struct drm_gem_object *obj =3D &shmem->base;
>
>         if (drm_gem_is_imported(obj)) {
> -               dma_buf_vunmap(obj->import_attach->dmabuf, map);
> +               dma_buf_vunmap(obj->dma_buf, map);
>         } else {
>                 dma_resv_assert_held(shmem->base.resv);
>
> --
> 2.48.1
>
>

--000000000000b92bc3062f3646b4
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
=C2=A0drivers/gpu/drm/drm_gem_shmem_helper.c | 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_g=
em_shmem_helper.c<br>
index 7722cd720248..d99dee67353a 100644<br>
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c<br>
@@ -339,10 +339,10 @@ int drm_gem_shmem_vmap(struct drm_gem_shmem_object *s=
hmem,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm_gem_is_imported(obj)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_vma=
p(obj-&gt;import_attach-&gt;dmabuf, map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D dma_buf_vma=
p(obj-&gt;dma_buf, map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (drm_WARN_ON(obj-&gt;dev, map-&gt;is_iomem)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_vunmap(obj-&gt;import_attach-=
&gt;dmabuf, map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_vunmap(obj-&gt;dma_buf, map);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -405,7 +405,7 @@ void drm_gem_shmem_vunmap(struct drm_gem_shmem_object *=
shmem,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *obj =3D &amp;shmem-&gt;b=
ase;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm_gem_is_imported(obj)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_vunmap(obj-=
&gt;import_attach-&gt;dmabuf, map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_buf_vunmap(obj-=
&gt;dma_buf, map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_resv_assert_hel=
d(shmem-&gt;base.resv);<br>
<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000b92bc3062f3646b4--

