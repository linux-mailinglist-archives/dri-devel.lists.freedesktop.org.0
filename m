Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02041A49E80
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:17:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A0E10ECE6;
	Fri, 28 Feb 2025 16:17:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dQudWkMv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C36F10ECE6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740759442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dUaS54h6Xub23DPE1aeeIMXNmXfaD+ypmt8M5iYWPkY=;
 b=dQudWkMvafH/Ybb6WzsuNa+C4YkXvDAcK2Rf051G8bjWMTgocThDotXrEC/jslxHf7rmeM
 StkJZ/WZ1cN965XLegVIHvoBwE0BLQ7gWc7q2d+CM+sfacjn5qmdfLOxLGafUGh1Blkkqq
 jgUi0cm+9z5t7st46S+TGMQD9R0YeAA=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-bgv3QNWCNqOzqetM2-QMiA-1; Fri, 28 Feb 2025 11:17:19 -0500
X-MC-Unique: bgv3QNWCNqOzqetM2-QMiA-1
X-Mimecast-MFC-AGG-ID: bgv3QNWCNqOzqetM2-QMiA_1740759438
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-6fd44edad57so23987527b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759438; x=1741364238;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUaS54h6Xub23DPE1aeeIMXNmXfaD+ypmt8M5iYWPkY=;
 b=LZhTT1dUXBQ0ag7gWDeGVysnuPOUtKuzVmAqH9GSwIoD3Zwu3nhlg73R/MHj14s6fO
 +5DCwpGys/jUlzqAxLBuiopNDm5/UCtSJj9lOjrmQhyYAYD5Zcf4UGngzCLI4tLCUAFb
 7eC88MZ2qkQ/DI75BnpQmmw5qsFUru0vDOZIc6LHl1Y9l2RmnCnDo60oZFh1/ZeiIura
 7aW61bbqk8PSRE8fSGRwrTRPVo2ztdeHt+0h72coHuTRcAFfuEzF7AUhyxBxn9Rr4ZMM
 p2dgdT8un6hyN/gCVH6RcF0ElSM7f87ZZZtkvB/Ta8CWHk9ctWWDtpTulVVjwwZ4gFtY
 +g+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8Pe7nPV6Yu81RoUJfGdzBH3SftJbm4IDLulUWSt7/cVl6nsoQFlUj02gAhnK//i9fSMqZNQENB18=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRwpfLyQHG/dqpMT1+G4kOlFBpSR469CWl9YKhgtUo3cdJi8GW
 JFVH8uydZ8EZtQHm0gwYl1n8HzwIsUSs3XPB5XPf2C8Jpc9OvhPKxbQNOu3SbhNMUjgt8sJ1AHk
 HfOrhl6W7XBcg07hXE1ko/1D65XXhGoGeflTeln3w8naqb+khO5+o6afdilJ36wH2Is62o0IfWK
 5AzV7NCO5Yn64P239axLD/FT9dl4PVri3XLsS8KVhR
X-Gm-Gg: ASbGncvQca4jU7RJK+UbudghYUA38TfpRsrbMVbn/TTu/DibtQa/Cpr2CMzbIszDm9/
 Vrgp659W1p6qmco99B2EiEqmWoMv01xUkfkRJerh4x3smYk8kXEzh7vRyyVVZQGxZVlDc2/A=
X-Received: by 2002:a05:690c:28b:b0:6fd:4718:9bde with SMTP id
 00721157ae682-6fd49fd005fmr45290747b3.9.1740759438493; 
 Fri, 28 Feb 2025 08:17:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrOEpx8MZxurk6ZASgMeri5+M4wCUS6SIUbiMNjlKJpIOOSoYaIUupLJztTE+g5NcUnPIV8316qfYjJI4WSM4=
X-Received: by 2002:a05:690c:28b:b0:6fd:4718:9bde with SMTP id
 00721157ae682-6fd49fd005fmr45290607b3.9.1740759438265; Fri, 28 Feb 2025
 08:17:18 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-7-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-7-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:17:06 -0500
X-Gm-Features: AQ5f1JpUI9O2XX8tC2R8-OiPHhTAoia1QJ1w1VE7Im_DOtXOtaSF7uvU_kSSHq4
Message-ID: <CAN9Xe3TGnY4e_9t_iDNOLxQW1KETp2Zxcg=p7pAD3W8ebTOgCQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] drm/gem-framebuffer: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SRdUbOn63lblbnU8kMaG5RcEm-G6nkCGeyQCZo-Heew_1740759438
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f52a71062f36230f"
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

--000000000000f52a71062f36230f
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
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> index 185534f56bab..2bf606ba24cd 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -429,7 +429,7 @@ static void __drm_gem_fb_end_cpu_access(struct
> drm_framebuffer *fb, enum dma_dat
>                 if (!obj)
>                         continue;
>                 import_attach =3D obj->import_attach;
> -               if (!import_attach)
> +               if (!drm_gem_is_imported(obj))
>                         continue;
>                 ret =3D dma_buf_end_cpu_access(import_attach->dmabuf, dir=
);
>                 if (ret)
> @@ -466,7 +466,7 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffe=
r
> *fb, enum dma_data_direct
>                         goto err___drm_gem_fb_end_cpu_access;
>                 }
>                 import_attach =3D obj->import_attach;
> -               if (!import_attach)
> +               if (!drm_gem_is_imported(obj))
>                         continue;
>                 ret =3D dma_buf_begin_cpu_access(import_attach->dmabuf, d=
ir);
>                 if (ret)
> --
> 2.48.1
>
>

--000000000000f52a71062f36230f
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
=C2=A0drivers/gpu/drm/drm_gem_framebuffer_helper.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm=
/drm_gem_framebuffer_helper.c<br>
index 185534f56bab..2bf606ba24cd 100644<br>
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c<br>
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c<br>
@@ -429,7 +429,7 @@ static void __drm_gem_fb_end_cpu_access(struct drm_fram=
ebuffer *fb, enum dma_dat<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!obj)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import_attach =3D o=
bj-&gt;import_attach;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!import_attach)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_gem_is_imp=
orted(obj))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_buf_end=
_cpu_access(import_attach-&gt;dmabuf, dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
@@ -466,7 +466,7 @@ int drm_gem_fb_begin_cpu_access(struct drm_framebuffer =
*fb, enum dma_data_direct<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err___drm_gem_fb_end_cpu_access;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import_attach =3D o=
bj-&gt;import_attach;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!import_attach)=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!drm_gem_is_imp=
orted(obj))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 continue;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D dma_buf_beg=
in_cpu_access(import_attach-&gt;dmabuf, dir);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000f52a71062f36230f--

