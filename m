Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A1E1D8B05
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 00:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BED316E49F;
	Mon, 18 May 2020 22:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909A6E49F;
 Mon, 18 May 2020 22:35:58 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id m7so4817307plt.5;
 Mon, 18 May 2020 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mfAW18+azOaRLKQwdw2OH359zGyKgAyGJxrSb3RPujM=;
 b=MG1ZfaHSeaRymkrPQU62cgmxH/2uylYLvmmO9og6TbMelX4G53rCvY/UKtSLRK3PmE
 26Xg4KABmqt+zGydOShoZX0fWklL09/4yk4oohvFz3ed8FWEWc0U6N/mhM/SX7sNyWql
 2TLlZJqhFlnbF2ua+dQ3efRFwY7MXPkIIQ9+JHJaBWjd88EWVzSWnFx6zunfrI3cNavU
 0Nj9K4iMquF7lzVloaI5il2pMw7y+Gt5j6C7kDNyk3dOiKmprKSwNhswo8rYnW7bNTSX
 tGjxa7Gr2DxenrOtCqGzmgf8qW+2wNK2V0iOshzf7iAfc/bbYFyS9SDd1CxBEbqZc61l
 kcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mfAW18+azOaRLKQwdw2OH359zGyKgAyGJxrSb3RPujM=;
 b=M9mX20D7Peq+VWif+rsPxBBXhPu/icQ5wjf8+fqYo6M6SRXM1NAl06cQAsH9iYJz98
 Dq1NOh4RYqSoeYdaVxA4xbiQPzxYP3DjEZ3jyEI5d+eZ8xEIlNCjOycyLc8ftVnIpvcC
 DW8L+8JJ7IHmgXkkoHOsRFxquNUoVCVhsUkSwTit/VfH4V2t6aHXX64A+y2L5OyCzE7M
 kniHWPRBmYzZLe4B+YWEvTTcwKryUqE6PO7qFe4pX78uQbgsS3t8G4ENVEoCC1ZLQuKq
 5MZ8ylMa4xgJmjXSSA1zH7BitxT3kX/R7TMAS5lv8qn88sTGWqVBt+wm9k+fs+pygCNx
 whag==
X-Gm-Message-State: AOAM5335Yq0l6zCgB0YCfPRpaWc3QGCJIvrLMYTrqRA8a4Ok/MeVtcXX
 1xOtfCT4i7KV+XGSpfMDBKKQgDjV6jC7vXIhta0=
X-Google-Smtp-Source: ABdhPJznGTRKT9ufZQjwegFQghrNIqUvaywioi4WTB0wEbibjK24jj0RZ5kf1R/BD5jxlgQVC+bJ3LOXFbMvnpxwubU=
X-Received: by 2002:a17:902:bb8f:: with SMTP id
 m15mr18754385pls.5.1589841357598; 
 Mon, 18 May 2020 15:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200507142726.25751-1-sashal@kernel.org>
 <20200507142726.25751-33-sashal@kernel.org>
In-Reply-To: <20200507142726.25751-33-sashal@kernel.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 18 May 2020 18:35:19 -0400
Message-ID: <CAAxE2A4cWMctuCzm-ftdzDT=p9d5973XSZAstC0-OuJ0WE9ASQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 5.6 33/50] drm/amdgpu: bump version for invalidate
 L2 before SDMA IBs
To: Sasha Levin <sashal@kernel.org>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable@vger.kernel.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0240792463=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0240792463==
Content-Type: multipart/alternative; boundary="0000000000005e774a05a5f3c99b"

--0000000000005e774a05a5f3c99b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sasha,

I disagree with this. Bumping the driver version will have implications on
other new features, because it's like an ABI barrier exposing new
functionality.

Marek

On Thu, May 7, 2020 at 10:28 AM Sasha Levin <sashal@kernel.org> wrote:

> From: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
>
> [ Upstream commit 9017a4897a20658f010bebea825262963c10afa6 ]
>
> This fixes GPU hangs due to cache coherency issues.
> Bump the driver version. Split out from the original patch.
>
> Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Tested-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com=
>
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 42f4febe24c6d..8d45a2b662aeb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -85,9 +85,10 @@
>   * - 3.34.0 - Non-DC can flip correctly between buffers with different
> pitches
>   * - 3.35.0 - Add drm_amdgpu_info_device::tcc_disabled_mask
>   * - 3.36.0 - Allow reading more status registers on si/cik
> + * - 3.37.0 - L2 is invalidated before SDMA IBs, needed for correctness
>   */
>  #define KMS_DRIVER_MAJOR       3
> -#define KMS_DRIVER_MINOR       36
> +#define KMS_DRIVER_MINOR       37
>  #define KMS_DRIVER_PATCHLEVEL  0
>
>  int amdgpu_vram_limit =3D 0;
> --
> 2.20.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--0000000000005e774a05a5f3c99b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:Calibri,Arial,Helvetica,sans-ser=
if;font-size:12pt;color:rgb(0,0,0)">Hi Sasha,</div><div style=3D"font-famil=
y:Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)"><br><=
/div><div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size=
:12pt;color:rgb(0,0,0)">I
 disagree with this. Bumping the driver version will have implications=20
on other new features, because it&#39;s like an ABI barrier exposing new=20
functionality.</div><div style=3D"font-family:Calibri,Arial,Helvetica,sans-=
serif;font-size:12pt;color:rgb(0,0,0)"><br></div><div style=3D"font-family:=
Calibri,Arial,Helvetica,sans-serif;font-size:12pt;color:rgb(0,0,0)">Marek<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Thu, May 7, 2020 at 10:28 AM Sasha Levin &lt;<a href=3D"mailto:s=
ashal@kernel.org">sashal@kernel.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Marek Ol=C5=A1=C3=A1k &lt;<a href=
=3D"mailto:marek.olsak@amd.com" target=3D"_blank">marek.olsak@amd.com</a>&g=
t;<br>
<br>
[ Upstream commit 9017a4897a20658f010bebea825262963c10afa6 ]<br>
<br>
This fixes GPU hangs due to cache coherency issues.<br>
Bump the driver version. Split out from the original patch.<br>
<br>
Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.olsak@amd.=
com" target=3D"_blank">marek.olsak@amd.com</a>&gt;<br>
Reviewed-by: Christian K=C3=B6nig &lt;<a href=3D"mailto:christian.koenig@am=
d.com" target=3D"_blank">christian.koenig@amd.com</a>&gt;<br>
Tested-by: Pierre-Eric Pelloux-Prayer &lt;<a href=3D"mailto:pierre-eric.pel=
loux-prayer@amd.com" target=3D"_blank">pierre-eric.pelloux-prayer@amd.com</=
a>&gt;<br>
Signed-off-by: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com=
" target=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
Signed-off-by: Sasha Levin &lt;<a href=3D"mailto:sashal@kernel.org" target=
=3D"_blank">sashal@kernel.org</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_drv.c<br>
index 42f4febe24c6d..8d45a2b662aeb 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
@@ -85,9 +85,10 @@<br>
=C2=A0 * - 3.34.0 - Non-DC can flip correctly between buffers with differen=
t pitches<br>
=C2=A0 * - 3.35.0 - Add drm_amdgpu_info_device::tcc_disabled_mask<br>
=C2=A0 * - 3.36.0 - Allow reading more status registers on si/cik<br>
+ * - 3.37.0 - L2 is invalidated before SDMA IBs, needed for correctness<br=
>
=C2=A0 */<br>
=C2=A0#define KMS_DRIVER_MAJOR=C2=A0 =C2=A0 =C2=A0 =C2=A03<br>
-#define KMS_DRIVER_MINOR=C2=A0 =C2=A0 =C2=A0 =C2=A036<br>
+#define KMS_DRIVER_MINOR=C2=A0 =C2=A0 =C2=A0 =C2=A037<br>
=C2=A0#define KMS_DRIVER_PATCHLEVEL=C2=A0 0<br>
<br>
=C2=A0int amdgpu_vram_limit =3D 0;<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a><br>
</blockquote></div>

--0000000000005e774a05a5f3c99b--

--===============0240792463==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0240792463==--
