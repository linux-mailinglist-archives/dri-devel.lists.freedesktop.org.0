Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B131A611
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 03:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A7CD6E7BD;
	Sat, 11 May 2019 01:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CF26E7BD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 01:09:27 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id e19so5933254iob.3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 18:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dqmq9WGVMgbP1nQthV9rRR/9O17BEpxJgG7Ph+QrKIo=;
 b=jNt4awBBRwtp6CLIM3IxeUWmFDIZUOV1Uqc3rXr1i2yRDihg94TWC/elCqE8/Nv/90
 ueGZfBq+NbzuTAxxuuDWDUdkblKfDlAL3XZhKWZ6f8F3+ZKk0U1vwahezvbptdmKVd5w
 nkDUDUlmkaH9zXKL8dVFZTH/tI1Fhhs+0s4PgR0eot9qXaHrX2vyFxIqUKZIc1ix05y0
 eNM8nCEN2bQ26B5UqWV9YzdcZ+a07dzA8d+TSEqaTknWv5wS3uRjF207CcUjmFBZQao1
 H89K0Se2HClgxz9BjUTsv9J/lyfh7Yi6kkjYWxAJNXC6kviGGcQCW9b2WkhmOKG3LBBT
 DJ9Q==
X-Gm-Message-State: APjAAAXmSlzoAL49RQzKP+QJSPIG6Ll9o/qO+hZA8gwI3QC2FyFXE1rv
 i5yJEdcIJqz1uFlxFDWKnWdEg6tFl59WIZwyHf0=
X-Google-Smtp-Source: APXvYqxUTKbsdM7r9JHIEnmcyF7hCoXRt8zTuDbdSeJoV2kt29qGJR1KOnSLlgIkxMfX/lsNErbe1uqE+6/bWjfoJlk=
X-Received: by 2002:a6b:b408:: with SMTP id d8mr8510326iof.12.1557536965805;
 Fri, 10 May 2019 18:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190510141316.1746-1-christian.koenig@amd.com>
 <20190510141316.1746-4-christian.koenig@amd.com>
In-Reply-To: <20190510141316.1746-4-christian.koenig@amd.com>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 10 May 2019 21:08:49 -0400
Message-ID: <CAAxE2A4kePQ-_Bu8E5T6WHvM0tR912FRbf2qsJct4nhiP9R6gw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/amdgpu: stop removing BOs from the LRU during CS
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=dqmq9WGVMgbP1nQthV9rRR/9O17BEpxJgG7Ph+QrKIo=;
 b=M4uNHW/JcsPLf6DWgE8/NnfIWC1+k1hkO4vy7LSeoIZRzF3y0F7wFwfoujJY1KsTy4
 Ldppxz9SrDUzM+KKJOsQWzSfvEb8pOtewdVKu4J8WApuvQSGBz/cgxSfDaXRJiDvoWAH
 NnrpTmhjslc5BcGu6n0WPiGZfysWN+u9IJKxXUEOs5vXufLH1F43cRRzr38E/IJyNr7I
 DL/rnsbskSCalv6b4iULmb2jkt3Ska8ujJj8RwNM/qhfmAsFWKjtL1/LuQvIyArXYJ9A
 8EzaNH1sRlUFppVT30zmrLce2J5c7pO5HNh6gYevzslFI2bAE/+Q6MJMP7e6BxjpaMxT
 Arnw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Prike.Liang@amd.com, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0179465184=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0179465184==
Content-Type: multipart/alternative; boundary="000000000000924b07058892552d"

--000000000000924b07058892552d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This patch series doesn't help with the OOM errors due to GDS. Reproducible
with:

AMD_DEBUG=3Dtestgdsmm glxgears & AMD_DEBUG=3Dtestgdsmm glxgears

Marek


On Fri, May 10, 2019 at 10:13 AM Christian K=C3=B6nig <
ckoenig.leichtzumerken@gmail.com> wrote:

> This avoids OOM situations when we have lots of threads
> submitting at the same time.
>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index a1d6a0721e53..8828d30cd409 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct
> amdgpu_cs_parser *p,
>         }
>
>         r =3D ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
> -                                  &duplicates, true);
> +                                  &duplicates, false);
>         if (unlikely(r !=3D 0)) {
>                 if (r !=3D -ERESTARTSYS)
>                         DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--000000000000924b07058892552d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>This pa=
tch series doesn&#39;t help with the OOM errors due to GDS. Reproducible wi=
th:</div><div><br></div><div>AMD_DEBUG=3Dtestgdsmm glxgears &amp; AMD_DEBUG=
=3Dtestgdsmm glxgears</div><div><br></div><div>Marek</div><div><br></div></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, May 10, 2019 at 10:13 AM Christian K=C3=B6nig &lt;<a href=3D"ma=
ilto:ckoenig.leichtzumerken@gmail.com" target=3D"_blank">ckoenig.leichtzume=
rken@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">This avoids OOM situations when we have lots of threads<br>
submitting at the same time.<br>
<br>
Signed-off-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@=
amd.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c<br>
index a1d6a0721e53..8828d30cd409 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
@@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser=
 *p,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D ttm_eu_reserve_buffers(&amp;p-&gt;ticket,=
 &amp;p-&gt;validated, true,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;duplicates, true);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;duplicates, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (unlikely(r !=3D 0)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r !=3D -ERESTAR=
TSYS)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 DRM_ERROR(&quot;ttm_eu_reserve_buffers failed.\n&quot;);<br>
-- <br>
2.17.1<br>
<br>
_______________________________________________<br>
dri-devel mailing list<br>
<a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">dri-de=
vel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/dri-devel</a></blockquote></div>

--000000000000924b07058892552d--

--===============0179465184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0179465184==--
