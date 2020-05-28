Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E011E66BD
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 17:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D786E563;
	Thu, 28 May 2020 15:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD84B6E563
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 15:50:22 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id 5so3275063pjd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 08:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpqDAl6DQGsZ1y1jgyrpbeWW+TuMISihNRtJ7vDX0OM=;
 b=CKIc32f1IxNUshNnB1ZnH5uFGhjUvncdH/SIyuJBtrPqEPepUYHu8g7Hlvunx0q+rl
 mQ/XnGF8KdiOPXijoYinbv+IYeL4Mtp0Q0GnIZR86WWVcneeaNuWr8VJ8ctvfc3LzeFN
 w3bszRZ036axNZ89x6Ec3mp1j9oSI7VkhZvFsjmREeKvs3bGofj8/7jncWi5WQ0k1pEI
 +BCnqN97VRKvnz5IlCuH+ZRTrlZ1dlmV4HiDZ0TUGRZXOaHD7sOz7S+T+hGUbgHuGCbU
 k781cuyMFSv1PrhA55gApuEd3rHyf8y2DPat7hfYGm9F/CbELYfLw/OjxLFtpOw+DHO8
 ienQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpqDAl6DQGsZ1y1jgyrpbeWW+TuMISihNRtJ7vDX0OM=;
 b=U+9uL4cA1fnaD3b/jOJa2/hvLK/NNa8LtGywoPqDoBinKciqkK0I3tUVy7DcRjPc50
 9LKUaproPRPvP/eBk5zFH4ZYN2eM4Qm6ORbdcbiLAp/mFdySAA/Hprt821gcYjRlDpD5
 0AZlU/ueaubzFqXf2ta/K54xPgwCIyapii5PMgk2Yfrp6G0e5vAiwWawzql2VK8HGxNX
 D3nJieVrlED5x3mdVeV+a3ZbjCZVK3snZQoCK4I/ql9vVY7DZr5zgWxv9KbQlF0xUVlh
 5AA0eTJvqHn6JVx1zrk1JSnzFOEVZHFG5jplXtZ4/jB0qis9AUDj5Z57KU7AvmT/Q3Gw
 NfZw==
X-Gm-Message-State: AOAM530o2x+eEjpRzQadv/xdXSHBMac8iZA6qPWSPJDLKznjvR6UAJLy
 ete0VswsqgmptRSdnglc2CuN+Ufv/qoLiSFGUfiyJQ==
X-Google-Smtp-Source: ABdhPJwct+vz8FKK7KANyni+6D5RN/TqM3eNQWzV363qXEvCmMqzpV4DV3kLqo0hUK071Des53cln2QdvnfxYFaTjS0=
X-Received: by 2002:a17:90a:17ed:: with SMTP id
 q100mr4154592pja.80.1590681022406; 
 Thu, 28 May 2020 08:50:22 -0700 (PDT)
MIME-Version: 1.0
References: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
In-Reply-To: <WOsdNGp0dhyp8Modsrt7DYpd0fVk7Yk264FISQ1Yls30bhlSXbxzgKTpmOCJ9H2WV1XHyUjCXu7nwBOWQ6n1NCbIcVl1-1IZ4rMMGN1dN-U=@emersion.fr>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Thu, 28 May 2020 11:49:46 -0400
Message-ID: <CAAxE2A4NCo_KMkemUOHKbZ7P=GR4p-zwhpmP7Get18x4Ydb-Gg@mail.gmail.com>
Subject: Re: [PATCH v3] drm/fourcc: document modifier uniqueness requirements
To: Simon Ser <contact@emersion.fr>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1812494183=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1812494183==
Content-Type: multipart/alternative; boundary="0000000000004aa3a405a6b74955"

--0000000000004aa3a405a6b74955
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On most hardware, there is a minimum pitch alignment for linear and any
greater multiple of the alignment is fine.

On Navi, the pitch in bytes for linear must be align(width * bpp / 8, 256).
That's because the hw computes the pitch from the width and doesn't allow
setting a custom pitch. For that reason, multi-GPU sharing might not be
possible if the other GPU doesn't align the pitch in exactly the same way.

Marek

On Thu, May 28, 2020 at 10:38 AM Simon Ser <contact@emersion.fr> wrote:

> There have suggestions to bake pitch alignment, address alignement,
> contiguous memory or other placement (hidden VRAM, GTT/BAR, etc)
> constraints into modifiers. Last time this was brought up it seemed
> like the consensus was to not allow this. Document this in drm_fourcc.h.
>
> There are several reasons for this.
>
> - Encoding all of these constraints in the modifiers would explode the
>   search space pretty quickly (we only have 64 bits to work with).
> - Modifiers need to be unambiguous: a buffer can only have a single
>   modifier.
> - Modifier users aren't expected to parse modifiers.
>
> v2: add paragraph about aliases (Daniel)
>
> v3: fix unrelated changes sent with the patch
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Daniel Stone <daniel@fooishbar.org>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Marek Ol=C5=A1=C3=A1k <maraeo@gmail.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 490143500a50..f41fcb1ed63d 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -58,6 +58,21 @@ extern "C" {
>   * may preserve meaning - such as number of planes - from the fourcc cod=
e,
>   * whereas others may not.
>   *
> + * Modifiers must uniquely encode buffer layout. In other words, a buffe=
r
> must
> + * match only a single modifier. A modifier must not be a subset of
> layouts of
> + * another modifier. For instance, it's incorrect to encode pitch
> alignment in
> + * a modifier: a buffer may match a 64-pixel aligned modifier and a
> 32-pixel
> + * aligned modifier. That said, modifiers can have implicit minimal
> + * requirements.
> + *
> + * For modifiers where the combination of fourcc code and modifier can
> alias,
> + * a canonical pair needs to be defined and used by all drivers. An
> example
> + * is AFBC, where both ARGB and ABGR have the exact same compressed
> layout.
> + *
> + * Users see modifiers as opaque tokens they can check for equality and
> + * intersect. Users musn't need to know to reason about the modifier val=
ue
> + * (i.e. users are not expected to extract information out of the
> modifier).
> + *
>   * Vendors should document their modifier usage in as much detail as
>   * possible, to ensure maximum compatibility across devices, drivers and
>   * applications.
> --
> 2.26.2
>
>
>

--0000000000004aa3a405a6b74955
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On most hardware, there is a minimum pitch alignment =
for linear and any greater multiple of the alignment is fine.</div><div><br=
></div><div>On Navi, the pitch in bytes for linear must be align(width * bp=
p / 8, 256). That&#39;s because the hw computes the pitch from the width an=
d doesn&#39;t allow setting a custom pitch. For that reason, multi-GPU shar=
ing might not be possible if the other GPU doesn&#39;t align the pitch in e=
xactly the same way.<br></div><div><br></div><div>Marek<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Ma=
y 28, 2020 at 10:38 AM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr"=
>contact@emersion.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">There have suggestions to bake pitch alignment, address=
 alignement,<br>
contiguous memory or other placement (hidden VRAM, GTT/BAR, etc)<br>
constraints into modifiers. Last time this was brought up it seemed<br>
like the consensus was to not allow this. Document this in drm_fourcc.h.<br=
>
<br>
There are several reasons for this.<br>
<br>
- Encoding all of these constraints in the modifiers would explode the<br>
=C2=A0 search space pretty quickly (we only have 64 bits to work with).<br>
- Modifiers need to be unambiguous: a buffer can only have a single<br>
=C2=A0 modifier.<br>
- Modifier users aren&#39;t expected to parse modifiers.<br>
<br>
v2: add paragraph about aliases (Daniel)<br>
<br>
v3: fix unrelated changes sent with the patch<br>
<br>
Signed-off-by: Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr" target=
=3D"_blank">contact@emersion.fr</a>&gt;<br>
Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" ta=
rget=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
Cc: Daniel Stone &lt;<a href=3D"mailto:daniel@fooishbar.org" target=3D"_bla=
nk">daniel@fooishbar.org</a>&gt;<br>
Cc: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=
=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
Cc: Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_blank">=
airlied@gmail.com</a>&gt;<br>
Cc: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:maraeo@gmail.com" target=3D=
"_blank">maraeo@gmail.com</a>&gt;<br>
---<br>
=C2=A0include/uapi/drm/drm_fourcc.h | 15 +++++++++++++++<br>
=C2=A01 file changed, 15 insertions(+)<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index 490143500a50..f41fcb1ed63d 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -58,6 +58,21 @@ extern &quot;C&quot; {<br>
=C2=A0 * may preserve meaning - such as number of planes - from the fourcc =
code,<br>
=C2=A0 * whereas others may not.<br>
=C2=A0 *<br>
+ * Modifiers must uniquely encode buffer layout. In other words, a buffer =
must<br>
+ * match only a single modifier. A modifier must not be a subset of layout=
s of<br>
+ * another modifier. For instance, it&#39;s incorrect to encode pitch alig=
nment in<br>
+ * a modifier: a buffer may match a 64-pixel aligned modifier and a 32-pix=
el<br>
+ * aligned modifier. That said, modifiers can have implicit minimal<br>
+ * requirements.<br>
+ *<br>
+ * For modifiers where the combination of fourcc code and modifier can ali=
as,<br>
+ * a canonical pair needs to be defined and used by all drivers. An exampl=
e<br>
+ * is AFBC, where both ARGB and ABGR have the exact same compressed layout=
.<br>
+ *<br>
+ * Users see modifiers as opaque tokens they can check for equality and<br=
>
+ * intersect. Users musn&#39;t need to know to reason about the modifier v=
alue<br>
+ * (i.e. users are not expected to extract information out of the modifier=
).<br>
+ *<br>
=C2=A0 * Vendors should document their modifier usage in as much detail as<=
br>
=C2=A0 * possible, to ensure maximum compatibility across devices, drivers =
and<br>
=C2=A0 * applications.<br>
-- <br>
2.26.2<br>
<br>
<br>
</blockquote></div>

--0000000000004aa3a405a6b74955--

--===============1812494183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1812494183==--
