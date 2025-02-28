Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32887A49E86
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 17:18:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC8C10ECED;
	Fri, 28 Feb 2025 16:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d6lTUbWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F02C10ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740759524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kofrCo3OJR3qKMAb+vNId3FjwaLwOcS6nmxAbEztzRQ=;
 b=d6lTUbWjvbn0UzWfaKAfDWa3I2F4EqjB12groMZITas4v+8i5wmuImUwRAj/bgIHMop2Lw
 S7kohmdzHxJvRUwu2Gb2p2v0LWOogr/ZtkPk4Qr8QmK9QKtg2HFjVVDbMrySM8DfrgcdLj
 i5lXloCrr/ILFhl64UDxReND6RNeDPQ=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-xe8jSoCNMH-I-9MF1qMxkQ-1; Fri, 28 Feb 2025 11:18:42 -0500
X-MC-Unique: xe8jSoCNMH-I-9MF1qMxkQ-1
X-Mimecast-MFC-AGG-ID: xe8jSoCNMH-I-9MF1qMxkQ_1740759522
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-6fd409170c7so19271627b3.1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 08:18:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740759522; x=1741364322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kofrCo3OJR3qKMAb+vNId3FjwaLwOcS6nmxAbEztzRQ=;
 b=a5bNKmnRQksGU+IRQmBnDoSBOatP/7D2XN2kQ4OPIWmA8M9gtDtrZO5KJrhVnkP/mT
 iSn3Y3DhAfpBrpAKzMPt5s7Ajus6u0D3nOJz15cbjOE+iiUzz24DCglzBo52tvbm9FLF
 82vLlR7LlS2sbEiEPqX8bu3WgOC3QKKb6acbnKY2ENcuXFbC6cld3jBcETnqfOvv9tgh
 ws4+nRoROzAeTi2esof4uKnNE//TgTyNdaMYtgRG43hNRb5cpw/J/TWSJ8JjNY8vTM2X
 VH6Ukp2i/+yebREw6A3CH2CfxufY084CYxGtuYXRpBmRPbpEsk+/3QPxPdvNfuLPH8Ra
 uh5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb3x7UviWhcySVUAMlS4M11EMi3OV+sItBa9SbGp5UQV87TEgXC3jjgX2oQsO1zzV2+8Wv3Sf1+9s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFOGaFOFem+do/9oE9wGiTA8FzFCbtVJ28bcfLDlI7MeBJX1Rn
 wYp1zD2i9lY7F9Iomd4ANxSGecFuxHcZrn5lWho2ig9N9EZIMnYSq4IZZNV9kuER4wDPWWM4S9Y
 pwIrc5CD37YjUNB5FEGemPjVIcA/JJJX3l6K0nwocyTyGHEwWkW/QMLQCYuFCYVArZeZJFYuY5j
 HhxfM6kzoXoeVnpdj1q7604nxjThb1Zvbiw/8fY1c4
X-Gm-Gg: ASbGncs4MlH9hHmbwvxahPWu/2gOS3t7z3ts2C423WIQpol7YpWIp0/Ihi++ZmzIKG9
 eapbvGox/PHsfDfnWiK71ay7U+7fhaajYTVhP0TB03L2Oue4tDr1/gx/BieSLNVUi6SyUv+c=
X-Received: by 2002:a05:690c:6912:b0:6f9:9891:7a7f with SMTP id
 00721157ae682-6fd4a0c2c51mr52639937b3.25.1740759522254; 
 Fri, 28 Feb 2025 08:18:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEj9OoRs84N+jz47v+46kMfKhJHBy+v+NjyC9uWpGRWc185N+MouseZsvGNVo0XUxfF2oMD+8mrNAaECszoh0c=
X-Received: by 2002:a05:690c:6912:b0:6f9:9891:7a7f with SMTP id
 00721157ae682-6fd4a0c2c51mr52639737b3.25.1740759522010; Fri, 28 Feb 2025
 08:18:42 -0800 (PST)
MIME-Version: 1.0
References: <20250226172457.217725-1-tzimmermann@suse.de>
 <20250226172457.217725-9-tzimmermann@suse.de>
In-Reply-To: <20250226172457.217725-9-tzimmermann@suse.de>
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Fri, 28 Feb 2025 11:18:30 -0500
X-Gm-Features: AQ5f1JqQTDWa2XzdIZsVd18Bmn-f3Am1wdWZEOPzlpL1M1b-U2MjkDHVHMeesvQ
Message-ID: <CAN9Xe3QeSKYrowMPqrJ980uRoiehgmzZJVrzXembkK6sgwScyQ@mail.gmail.com>
Subject: Re: [PATCH 08/10] drm/fb-dma-helper: Test for imported buffers with
 drm_gem_is_imported()
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, javierm@redhat.com, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RpoDT5InuCtC1TLSMbf12yvTJ0fJwRV6HMFEHs6lLrU_1740759522
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f2fda8062f362816"
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

--000000000000f2fda8062f362816
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 12:28=E2=80=AFPM Thomas Zimmermann <tzimmermann@sus=
e.de>
wrote:

> Instead of testing import_attach for imported GEM buffers, invoke
> drm_gem_is_imported() to do the test.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_fb_dma_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c
> b/drivers/gpu/drm/drm_fb_dma_helper.c
> index e1d61a65210b..2c4dc7ebc0c3 100644
> --- a/drivers/gpu/drm/drm_fb_dma_helper.c
> +++ b/drivers/gpu/drm/drm_fb_dma_helper.c
> @@ -178,7 +178,7 @@ int drm_fb_dma_get_scanout_buffer(struct drm_plane
> *plane,
>         dma_obj =3D drm_fb_dma_get_gem_obj(fb, 0);
>
>         /* Buffer should be accessible from the CPU */
> -       if (dma_obj->base.import_attach)
> +       if (drm_gem_is_imported(&dma_obj->base))
>                 return -ENODEV;
>
>
Reviewed-by: Anusha Srivatsa <asrivats@redhat.com>

        /* Buffer should be already mapped to CPU */
> --
> 2.48.1
>
>

--000000000000f2fda8062f362816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 26,=
 2025 at 12:28=E2=80=AFPM Thomas Zimmermann &lt;<a href=3D"mailto:tzimmerma=
nn@suse.de">tzimmermann@suse.de</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Instead of testing import_attach for impor=
ted GEM buffers, invoke<br>
drm_gem_is_imported() to do the test.<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;<a href=3D"mailto:tzimmermann@suse.de"=
 target=3D"_blank">tzimmermann@suse.de</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/drm_fb_dma_helper.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_d=
ma_helper.c<br>
index e1d61a65210b..2c4dc7ebc0c3 100644<br>
--- a/drivers/gpu/drm/drm_fb_dma_helper.c<br>
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c<br>
@@ -178,7 +178,7 @@ int drm_fb_dma_get_scanout_buffer(struct drm_plane *pla=
ne,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dma_obj =3D drm_fb_dma_get_gem_obj(fb, 0);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Buffer should be accessible from the CPU */<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dma_obj-&gt;base.import_attach)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_gem_is_imported(&amp;dma_obj-&gt;base))=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Anusha Srivatsa &lt;<a hr=
ef=3D"mailto:asrivats@redhat.com">asrivats@redhat.com</a>&gt; <br></div><di=
v><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Buffer should be already mapped to CPU */<br=
>
-- <br>
2.48.1<br>
<br>
</blockquote></div></div>

--000000000000f2fda8062f362816--

