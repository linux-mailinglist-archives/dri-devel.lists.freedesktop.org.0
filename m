Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9425F5AF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 10:51:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB8589FEA;
	Mon,  7 Sep 2020 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C440189FEA;
 Mon,  7 Sep 2020 08:51:43 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l17so11925162edq.12;
 Mon, 07 Sep 2020 01:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vZFK4W6iAAZOZWydUY/UK+/VjgY7HPnaQzN5OZF/D1o=;
 b=WoH69jlMy4fN1/2ZxpTSfGf4z/G0ceJf1K/6x+4srfk76KZ0qwZ2wAqu7USu09Wvff
 tjFDIMlGJ/wqAECW+jhFSbgBdIvazS1NYLv0GDCqgdQd7NNrbqfq4WJwFaPhRngozWoA
 hVLI0CbTSqAEXQFPhXOcqo/WY2DGVbRY9N+l1v105vypfdqmNY+sy+5y83sYE0Du1Mlm
 KiDfA3LjSLLL986lBANOLtNhCmqcJhMwQpGMGGwuP4Rjwji4+lXyyOQJtAS2o5ZHc0R8
 aakuG56BpfcH1ZXJYtW1PWrQHSyqzJ6C5mBFoJzU+Emgath93QCuiCay5gZdnmPVApBm
 uz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vZFK4W6iAAZOZWydUY/UK+/VjgY7HPnaQzN5OZF/D1o=;
 b=mCUU/ADkLRPs8iiYkdCrNwmYX3TkBnKpw5t6EA3t5adAhgqzP4ZscM13iQ4ChluUjN
 mnDUo6bvyWZldKpmRxTKvoIN13CaIPjPXWiSiZJN+A/2Ld1ab5KZnuopP2gBMlDRsjyy
 1sB/4X9goY8b8zVDav3Dz7peFZ8M5Kym5UwoKtJ0o6kGF/lKZpXbtgJLTxI9VazbtNST
 DnvU3SD0KCoey+ebLld4IC3s3tBvY9n7to984+sGQitJ2hxNErVATw52bOdpoa97JW9+
 P8TFMYpiwtk68u+2xKBK5frTf98PLa8I+kbTPAZ/V61VckcHN29eIxwUjfqkKsgLKr7s
 H5LQ==
X-Gm-Message-State: AOAM532pjgz67pOeDN5wR+Wa5Qkr8iexON0eMbyhHIV/69etJm3X3euO
 1WRqp4zkQoxzhiKBtJ9o9xvXxBEiwIHiPi/Ca+Y=
X-Google-Smtp-Source: ABdhPJzpNDvzbfGgOAetDptbl2bW4tp8edW/7S6FfNlaOH26Zmubs/VZdvV9vap3jKhvqzjLTWCUij+C2ka/ZhtSUF8=
X-Received: by 2002:a05:6402:1d93:: with SMTP id
 dk19mr20610602edb.198.1599468702504; 
 Mon, 07 Sep 2020 01:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
In-Reply-To: <20200904160709.123970-1-bas@basnieuwenhuizen.nl>
From: =?UTF-8?Q?Ernst_Sj=C3=B6strand?= <ernstp@gmail.com>
Date: Mon, 7 Sep 2020 10:51:31 +0200
Message-ID: <CAD=4a=UAfoBBUTAxNPu709Q1JbjjwCivmFirC7Ka7DNzM3cSTA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] amd/display: Add GFX9+ modifier support.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1312812581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1312812581==
Content-Type: multipart/alternative; boundary="000000000000d79d4505aeb55316"

--000000000000d79d4505aeb55316
Content-Type: text/plain; charset="UTF-8"

Den fre 4 sep. 2020 kl 18:07 skrev Bas Nieuwenhuizen <
bas@basnieuwenhuizen.nl>:

> This adds modifier support to radeonsi.
>

Wouldn't it be more correct to say that this adds modifier support to
amdgpu (and enables it to work with radeonsi OpenGL)
or something like that?

//E


> It has been tested on
>
> - VEGA10, RAVEN, NAVI14
> - weston, sway, X with xf86-video-amdgpu (i.e. legacy path still works)
>
> and includes some basic testing of the layout code.
>
> The main goal is to keep it somewhat simple and regression free, so
> on the display side this series only exposes what the current GPU
> can render to. While we could expose more I think that is more
> suitable for follow-up work as the benefit would be minimal and
> there are some more design discussion there to discuss that are
> orthogonal from the initial implementation.
>
> Similarly this series only exposes 32-bpp displayable DCC in the cases
> that radeonsi would use it and any extra capabilities here should be
> future work.
>
> I believe these are by far the most complicated modifiers we've seen
> up till now, mostly related to
>
> - GPU identification for cases where it matters wrt tiling.
> - Every generation having tiling layout changes
> - Compression settings.
>
> I believe the complexity is necessary as every layout should be different
> and all layouts should be the best in some situation (though not all
> combinations of GPU parameters will actually have an existing GPU).
>
> That said, on the render side the number of modifiers actually listed for
> a given GPU is ~10, and in the current implementation that is the same
> for the display side. (we could expose more actually differing layouts
> on the display side for cross-GPU compatibility, but I consider that
> out of scope for this initial work).
>
> This series can be found on
> https://github.com/BNieuwenhuizen/linux/tree/modifiers
>
> An userspace implementation in radeonsi can be found on
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6176
>
> v2:
>
> Per suggestion from Daniel Vetter I added logic to get the tiling_flags at
> addfb2 time and convert them into modifiers for GFX9+.  Furthermore, the
> DCC
> constant econding modifers only get exposed on RAVEN2 and newer.
>
> Bas Nieuwenhuizen (11):
>   drm/amd/display: Do not silently accept DCC for multiplane formats.
>   drm/amd: Init modifier field of helper fb.
>   drm/amd/display: Honor the offset for plane 0.
>   drm/fourcc:  Add AMD DRM modifiers.
>   drm/amd/display: Store tiling_flags in the framebuffer.
>   drm/amd/display: Convert tiling_flags to modifiers.
>   drm/amd/display: Refactor surface tiling setup.
>   drm/amd/display: Set DC options from modifiers.
>   drm/amd/display: Add formats for DCC with 2/3 planes.
>   drm/amd/display: Expose modifiers.
>   drm/amd/display: Clean up GFX9 tiling_flags path.
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   | 169 +++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c        |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h      |   3 +
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 754 ++++++++++++++----
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   2 -
>  include/uapi/drm/drm_fourcc.h                 | 115 +++
>  6 files changed, 880 insertions(+), 165 deletions(-)
>
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
>

--000000000000d79d4505aeb55316
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,helvetica,sans-serif"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Den fre 4 sep. 2020 kl 18:07=
 skrev Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl">bas=
@basnieuwenhuizen.nl</a>&gt;:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">This adds modifier support to radeonsi.<br></blockquote><div>=
<br></div><div><div style=3D"font-family:arial,helvetica,sans-serif" class=
=3D"gmail_default">Wouldn&#39;t it be more correct to say that this adds mo=
difier support to amdgpu (and enables it to work with radeonsi OpenGL)</div=
><div style=3D"font-family:arial,helvetica,sans-serif" class=3D"gmail_defau=
lt">or something like that?</div></div><div><br></div><div><div style=3D"fo=
nt-family:arial,helvetica,sans-serif" class=3D"gmail_default">//E</div></di=
v><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
It has been tested on<br>
<br>
- VEGA10, RAVEN, NAVI14<br>
- weston, sway, X with xf86-video-amdgpu (i.e. legacy path still works)<br>
<br>
and includes some basic testing of the layout code.<br>
<br>
The main goal is to keep it somewhat simple and regression free, so<br>
on the display side this series only exposes what the current GPU<br>
can render to. While we could expose more I think that is more<br>
suitable for follow-up work as the benefit would be minimal and<br>
there are some more design discussion there to discuss that are<br>
orthogonal from the initial implementation.<br>
<br>
Similarly this series only exposes 32-bpp displayable DCC in the cases<br>
that radeonsi would use it and any extra capabilities here should be<br>
future work.<br>
<br>
I believe these are by far the most complicated modifiers we&#39;ve seen<br=
>
up till now, mostly related to<br>
<br>
- GPU identification for cases where it matters wrt tiling.<br>
- Every generation having tiling layout changes<br>
- Compression settings.<br>
<br>
I believe the complexity is necessary as every layout should be different<b=
r>
and all layouts should be the best in some situation (though not all<br>
combinations of GPU parameters will actually have an existing GPU).<br>
<br>
That said, on the render side the number of modifiers actually listed for<b=
r>
a given GPU is ~10, and in the current implementation that is the same<br>
for the display side. (we could expose more actually differing layouts<br>
on the display side for cross-GPU compatibility, but I consider that<br>
out of scope for this initial work).<br>
<br>
This series can be found on<br>
<a href=3D"https://github.com/BNieuwenhuizen/linux/tree/modifiers" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/BNieuwenhuizen/linux/tree/m=
odifiers</a><br>
<br>
An userspace implementation in radeonsi can be found on<br>
<a href=3D"https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6176" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/mesa/me=
sa/-/merge_requests/6176</a><br>
<br>
v2:<br>
<br>
Per suggestion from Daniel Vetter I added logic to get the tiling_flags at<=
br>
addfb2 time and convert them into modifiers for GFX9+.=C2=A0 Furthermore, t=
he DCC<br>
constant econding modifers only get exposed on RAVEN2 and newer.<br>
<br>
Bas Nieuwenhuizen (11):<br>
=C2=A0 drm/amd/display: Do not silently accept DCC for multiplane formats.<=
br>
=C2=A0 drm/amd: Init modifier field of helper fb.<br>
=C2=A0 drm/amd/display: Honor the offset for plane 0.<br>
=C2=A0 drm/fourcc:=C2=A0 Add AMD DRM modifiers.<br>
=C2=A0 drm/amd/display: Store tiling_flags in the framebuffer.<br>
=C2=A0 drm/amd/display: Convert tiling_flags to modifiers.<br>
=C2=A0 drm/amd/display: Refactor surface tiling setup.<br>
=C2=A0 drm/amd/display: Set DC options from modifiers.<br>
=C2=A0 drm/amd/display: Add formats for DCC with 2/3 planes.<br>
=C2=A0 drm/amd/display: Expose modifiers.<br>
=C2=A0 drm/amd/display: Clean up GFX9 tiling_flags path.<br>
<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_display.c=C2=A0 =C2=A0| 169 +++-<br=
>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
=C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +<br>
=C2=A0.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 754 ++++++++++++++---=
-<br>
=C2=A0.../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |=C2=A0 =C2=A02 -<br>
=C2=A0include/uapi/drm/drm_fourcc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 115 +++<br>
=C2=A06 files changed, 880 insertions(+), 165 deletions(-)<br>
<br>
-- <br>
2.28.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org" target=3D"_blank">amd-gfx@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/amd-gfx</a><br>
</blockquote></div></div>

--000000000000d79d4505aeb55316--

--===============1312812581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1312812581==--
