Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B110CA49E99
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:20:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11FE110ECEB;
	Fri, 28 Feb 2025 16:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="a702qU5I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF53910ECEB
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740759611;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5m7bHXJpcRA7MV5qkLKcp/PNlkDRS/AvjVv0PL9l5uI=;
 b=a702qU5IoRLrJK60eTUZYC68qBRuGh6CcWCOQ4f3gRhURAliP1wUqHYYWreXrsvx0c9QE/
 rnfknWjLOBM1V22fw2RJ2LJOtjCeUnDd8ndQE3b5KnxlJfPHNopA4tO4nBndudfD1fvpRc
 uJ5HjpGCSAm+3veDtHAsQNdAy06neGk=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-TEnibjlROZKL8iv6yr6NRQ-1; Fri, 28 Feb 2025 11:20:10 -0500
X-MC-Unique: TEnibjlROZKL8iv6yr6NRQ-1
X-Mimecast-MFC-AGG-ID: TEnibjlROZKL8iv6yr6NRQ_1740759609
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fd409170c7so19290507b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759609; x=1741364409;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5m7bHXJpcRA7MV5qkLKcp/PNlkDRS/AvjVv0PL9l5uI=;
 b=GmvEMTbyOlmcKjDj9wYST3r2Ug76RcmJ+YbnDODS1yO/0nqJwshjLZ3zCimR26ay8P
 Nzg27PJ7A9y9f8XCLdU2cvjjeOQRrSAMxQyD7rpF33PMJpQwSc9qZdqPYlSkIIa4JEkx
 i0IV5iXl0Gfu4ZnvNrWvhOvuL2vt15FulhG7lAMd7N+1CFQUNpRBc5dr1u7H4G1BNYZi
 dURJuajntu1SwaNcDc9FeURlv4Ver8vlByGab2YXp+ml4KwyG/QwpD6n7VvdIEnY9Oz/
 oDpvfojsdGfvlMb00ZxdzNlFYJ+IvN2RNhofzxdAFfUIOyRHlqtbQ5nYo2IT5RS93/x3
 o2Ig==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4PWoBys2rUB7kQgSoxuiCByn47Jsef5MLubTgoxRR40ASY9nu6+9QJZRfMrHsk0zLbtEnAysVNf0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD5BYvZzau4knEe5I5SebPRWlsP1i1dTR5Dif1SQOy3zx2CEHK
 pM0UOSIKBsS3KcuFMYLuoPHbH9CRPM8ekVTpZ1xEklIeZlx3+QEctlbEGnu2Sne1La+iNijSgRT
 0ueQPAr24qKzN8aBBGHrd5BMYlX2Teny8/v5HNvPJW6teDNfQGJpPFivxFhWtVp5cqYs7q9gczj
 zslVrh6NlTVIvXgmK9VZHFwy7kYned13A90XtQxQOW
X-Gm-Gg: ASbGncv6hjvfPkJ9JlcQAXBtVmaNngnND/VBvAEemb8On1z9wTOdjqPdLkOJjYSEftD
 v9fPPDLCa8tgYv3Vlh/GQyZBp2v5mVb1aahB5Rj6uLHTCk3BvZLyVgHejbY4/tFWt2IYMAQM=
X-Received: by 2002:a05:690c:4442:b0:6fd:3d82:f900 with SMTP id
 00721157ae682-6fd49fff2demr51947247b3.20.1740759609619; 
 Fri, 28 Feb 2025 08:20:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEL4thYHSyUIYwOZs5inY91JgXsW5OGHJghQA9qxj/C5Snu2iQk1c1wr4x2d9Svv9/dBAvJYwiiI+jsGAUE9Ik=
X-Received: by 2002:a05:690c:4442:b0:6fd:3d82:f900 with SMTP id
 00721157ae682-6fd49fff2demr51946997b3.20.1740759609366; Fri, 28 Feb 2025
 08:20:09 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-10-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-10-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:19:58 -0500
X-Gm-Features: AQ5f1JpZJqz9eCJ7OH1VSnGz1cPIHDq_bmJ6xxUUFotEDzhQsuWlE8QS-7LHO68
Message-ID: <CAN9Xe3QG46qXcCUfHJWMJOYFfOKcgpY0www3pCXV3zPHv_s9fA@mail.gmail.com>
Subject: Re: [PATCH 09/10] drm/mipi-dbi: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oTMuRs2R8qol6YfLk95Uv9_ns8HFCvdwkMtaSexxhCY_1740759609
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000027f27b062f362e39"
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

--00000000000027f27b062f362e39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c
> b/drivers/gpu/drm/drm_mipi_dbi.c
> index 34bca7567576..89e05a5bed1d 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -218,7 +218,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map
> *src, struct drm_framebuffer *
>         switch (fb->format->format) {
>         case DRM_FORMAT_RGB565:
>                 if (swap)
> -                       drm_fb_swab(&dst_map, NULL, src, fb, clip,
> !gem->import_attach,
> +                       drm_fb_swab(&dst_map, NULL, src, fb, clip,
> !drm_gem_is_imported(gem),
>                                     fmtcnv_state);
>                 else
>                         drm_fb_memcpy(&dst_map, NULL, src, fb, clip);
> --
> 2.48.1
>
>

--00000000000027f27b062f362e39
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Reviewed-by: Anusha Srivatsa &lt;<a href=3D"mailto:as=
rivats@redhat.com">asrivats@redhat.com</a>&gt;</div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:t=
zimmermann@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Instead of testing import_attach for=
 imported GEM buffers, invoke<br>
drm_gem_is_imported() to do the test.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_mipi_dbi.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.=
c<br>
index 34bca7567576..89e05a5bed1d 100644<br>
--- a/drivers/gpu/drm/drm_mipi_dbi.c<br>
+++ b/drivers/gpu/drm/drm_mipi_dbi.c<br>
@@ -218,7 +218,7 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src,=
 struct drm_framebuffer *<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (fb-&gt;format-&gt;format) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DRM_FORMAT_RGB565:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (swap)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_fb_swab(&amp;dst_map, NULL, src, fb, clip, !gem-&gt;import_at=
tach,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0drm_fb_swab(&amp;dst_map, NULL, src, fb, clip, !drm_gem_is_import=
ed(gem),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fmtcnv_state);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drm_fb_memcpy(&amp;dst_map, NULL, src, fb, clip);<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--00000000000027f27b062f362e39--

