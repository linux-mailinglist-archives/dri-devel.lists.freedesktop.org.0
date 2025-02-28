Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA3FA49E64
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:12:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E8C10ECE9;
	Fri, 28 Feb 2025 16:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IWcEmkS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F01810ECE9
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740759165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i9el9oPKDs9MtWW7RJ7v4nCpP/VZt9njG+oFz4px/TQ=;
 b=IWcEmkS/9FVntqoDO9CgKd39TyVUDQTheP/FKZYPOlK3vr9dJ3dIMGK6KdhrDN3ENUqSc5
 uvJXoXuNVfgqrEBgGKSKsgCFfhvkh4sv73dMp/H/OvTsvO6vsnxvTD68BB6AsnOpbuiQ+i
 IzPxIp0XGYxuH0M13Iw2sYFhnXx5eaY=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-D8beHuDZPIGRPL9g0-FWbQ-1; Fri, 28 Feb 2025 11:12:44 -0500
X-MC-Unique: D8beHuDZPIGRPL9g0-FWbQ-1
X-Mimecast-MFC-AGG-ID: D8beHuDZPIGRPL9g0-FWbQ_1740759163
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6f788a1de55so29141927b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:12:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759163; x=1741363963;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i9el9oPKDs9MtWW7RJ7v4nCpP/VZt9njG+oFz4px/TQ=;
 b=Q+hem4hF+1mpd2XfGdYPf4Zq98sj4KRsnL8VS9IE75EUr4IHBw2bTrVImsuiepBdUo
 WHIQgzRLYNhCFRBoEiprVDlmIMNUmDTg8gQO4kUySxvuHY6Ux3u1xHIF5NH3+pOl/Nrt
 n8pRsOlrqiKG7AJ+0rgvDsvwZzZjLL1n7p7GSeKzsAkGAhtZw/by4Av73QDicPFYwJKt
 n0tlm34d9K/XvUWUBkgBWB7yiQ7VxVI0nadM9sIGUhlMjReyJ+LNzzk5EjpFf/2SPOjn
 uVUVPSxFzfOrn1AHBI/6RZByqouWuKDau2mztwBTKwoiObsQGMoFet3cdPTiPV8LzEAt
 R3Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVPwyQ2FY8XhpmuqaVWR4plBZTT+/ctBpfC8G22+raDhOokTSXyGZolZvMTkWNUH1m2qcrFuc8QjM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp7pLFsz3GO/BI8BhVDkWXczJ7rcu/5cfeGIcLsiToHzcuoixZ
 6OrcjkAu14NgxdjhdXl1VGXVSlIcavXY7TyHsyD8Q32VRaDestbAY/G9cx/FjkcupSjP/N3T2os
 uZp/wS4499j1I8zenfAEUCiersZcjiU5gGnfIotasB0eKIpqez4RdkvoO29FlBc3sLadUiKUOt3
 lzJk5V8aZt4IM97r0nlxHjgJuep+Muk/mzsUCfClt0
X-Gm-Gg: ASbGncvXzbd4KvYtWXetYEZIRwwdvl59myR9Gy6ObbpEaPIsrE1pP1mpxJ5FN5hpEwf
 6RbRoKwiaYxpKpWhVRU2++YLTWOTrkfwp3zBWYgc/+kXgMlLyCFvOen28gmER1KIYpNeI5Ss=
X-Received: by 2002:a05:690c:a82:b0:6ef:4fba:8153 with SMTP id
 00721157ae682-6fd4a05ac8cmr55340117b3.10.1740759163604; 
 Fri, 28 Feb 2025 08:12:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh31iSayEEReVP7pERza6PxyCFmdtd1Bp1nDo7CmZisNccldtsSwKSANVs1zYqSNwQBJuo4OHBoR5+b6aMU88=
X-Received: by 2002:a05:690c:a82:b0:6ef:4fba:8153 with SMTP id
 00721157ae682-6fd4a05ac8cmr55339907b3.10.1740759163409; Fri, 28 Feb 2025
 08:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-4-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-4-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:12:32 -0500
X-Gm-Features: AQ5f1JrF98lBS3hf3DKjP2DL5P89qDJH10R2Pjf-B1VThrEuJrS50w8HWO59oT0
Message-ID: <CAN9Xe3SVKVa06OTz1efVUuBEdGY_i-pOnD6kjaEqN1+k6z=UVQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] drm/gem-dma: Use dma_buf from GEM object instance
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C2bSgiG12ImuuFsQDsfgSXQEt7km9-DXQaALYVSkKTg_1740759163
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000932a71062f361371"
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

--000000000000932a71062f361371
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Avoid dereferencing struct drm_gem_object.import_attach for the
> imported dma-buf. The dma_buf field in the GEM object instance refers
> to the same buffer. Prepares to make import_attach optional.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c
> b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 4f0320df858f..b7f033d4352a 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -230,7 +230,7 @@ void drm_gem_dma_free(struct drm_gem_dma_object
> *dma_obj)
>
>         if (drm_gem_is_imported(gem_obj)) {
>                 if (dma_obj->vaddr)
> -
>  dma_buf_vunmap_unlocked(gem_obj->import_attach->dmabuf, &map);
> +                       dma_buf_vunmap_unlocked(gem_obj->dma_buf, &map);
>                 drm_prime_gem_destroy(gem_obj, dma_obj->sgt);
>         } else if (dma_obj->vaddr) {
>                 if (dma_obj->map_noncoherent)
>

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>


> --
> 2.48.1
>
>

--000000000000932a71062f361371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerma=
nn@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Avoid dereferencing struct drm_gem_object.=
import_attach for the<br>
imported dma-buf. The dma_buf field in the GEM object instance refers<br>
to the same buffer. Prepares to make import_attach optional.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem=
_dma_helper.c<br>
index 4f0320df858f..b7f033d4352a 100644<br>
--- a/drivers/gpu/drm/drm_gem_dma_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c<br>
@@ -230,7 +230,7 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_ob=
j)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm_gem_is_imported(gem_obj)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dma_obj-&gt;vad=
dr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dma_buf_vunmap_unlocked(gem_obj-&gt;import_attach-&gt;dmabuf, &am=
p;map);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dma_buf_vunmap_unlocked(gem_obj-&gt;dma_buf, &amp;map);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_prime_gem_destr=
oy(gem_obj, dma_obj-&gt;sgt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (dma_obj-&gt;vaddr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dma_obj-&gt;map=
_noncoherent)<br></blockquote><div><br></div><div>Reviewed-by: Anusha Sriva=
tsa &lt;<a href=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt;<=
/div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000932a71062f361371--

