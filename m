Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F69AF95D0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:43:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406FD10EA5B;
	Fri,  4 Jul 2025 14:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="DORmh+Rg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F6A10E355
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:43:34 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-3138e64b3fcso838466a91.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1751640214; x=1752245014;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vn6bCmRua5DYjfILn0ta/T+xkjF8oOK9cNx0rj83eK8=;
 b=DORmh+Rg3fM7Np6SvRCFPKjOOSFYS5X/0pRzw4ehCMR9ysCWCJbmm5Nj4JwvBQUKgO
 IQEed2WPMru0P1N8VKoDXmlVXsfonmfEZgVMnGySSGuiHX2BjUPXEcQ3jPC/kbu4mLid
 WDzdipLHr4xG8p8HG1/ryDTWG2HrA8jzfUzNvQkUtLMZ4GzOpKpCKZn2HtKTmTPb9Efz
 lYEelJgcUgalCdFLcJcVuonmTjOg2B5qwRDlBgxkcafmwY+cuufpf4TyzBp3RfuSDNNe
 nPhklIWp+oioT8Y5XAo/nWRVQTSkDNAb0JWhbWwfHuyxakLNmu+APYzTFb0AMxXNcT2I
 JbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751640214; x=1752245014;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vn6bCmRua5DYjfILn0ta/T+xkjF8oOK9cNx0rj83eK8=;
 b=BfDgbgvI58173qAirsE7dzJ5WV8J2LF7qEQDQN9aJlvfMeQQWIQqQ1mNN6rQd5aotQ
 WD/PKFCqRT2h49vzxRriqhyMR17cpBlkLHtzEJpj2IkBKzIuCSZzrFXn7LzAvAO4Yk8U
 iYmbflpaHqyx9K06VWixDFibOCxw/feh3OBQBPPSpmnYuhUA6RZh5YKul2xB3wG6XDtc
 UlQoqmc7DvfD4+g4UK91sdI52vGX3/eZPvSnpNJfTBDuTxNFUqtvRZFGX1Dab5CkimHH
 tw3YXp0ZHnQxPKGNPvdRGc/+ogqXHCyhdOCHGw+/3nF9EWSjm9DW1pE8B8zbErMl0F7r
 ucCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyQ77SlTcwFKBbKRS9rK0NXh1RMWUHRXMZXbbCKd+b004zwxOojkkWmyGLVemSjCdQ2nu2WWavPDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGvi3uDmbefl9Mwpxhe2zU9yFzmXPX/4sWEuYQS7UZzHcskAO5
 /6m2s3SfEzTI4pYDrpCH0VGs9VbG8GSm6CKSeGvz0w7oKRHKR5N6GOuqdsx9Z8WP083HzFO89BP
 w9n74WaPJlBBNtHbfg2yhtoznCvvZfOQ3BxloND1ZkA==
X-Gm-Gg: ASbGncvnrLSVqtct87Hik9YHeV/GmYVBRi9xQblBWk0r+v5rnyGyykaELMUZpwu1HYY
 C4oOYPUn/8W9+2zGBZjFdEunRVeX0g04/wwGsGMA7ZAg/TOSDX+mEy/YI3iMCbLmOCjQr6e8Jh1
 J/aeK7v3LV1iDdvGDyGvT/3cFAfby/r8YEt/AAYTycaA==
X-Google-Smtp-Source: AGHT+IHdcIRn18V0kMfMIu61weSzB4CUMUGh9zLW9eggHOPRwJO9GOssNKaFhz2eElWceSnMcbWpR+TU9xN1Mh1VHXM=
X-Received: by 2002:a17:90b:2b4c:b0:312:1c83:58e7 with SMTP id
 98e67ed59e1d1-31aadcad1f9mr3169067a91.1.1751640214096; Fri, 04 Jul 2025
 07:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250703223658.1457-1-jajones@nvidia.com>
 <20250703223658.1457-5-jajones@nvidia.com>
 <CAOFGe95mU1P-BeMXM506Jmdr66b1poFyFquxQr_s9KoEDbqVcQ@mail.gmail.com>
 <059f71ee-0fd8-4546-882c-73d0c1d031e2@nvidia.com>
In-Reply-To: <059f71ee-0fd8-4546-882c-73d0c1d031e2@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 4 Jul 2025 10:43:22 -0400
X-Gm-Features: Ac12FXxEZUT0365_MDde1Q0o_4cABUR4YwcQpJSE1p3kkItxfHFR-1R3k8qRnc8
Message-ID: <CAOFGe94Hb=_qdiC=Bwjp+gu4EmO-JYsU7PRo9rp3JNRxsbS3aA@mail.gmail.com>
Subject: Re: [RFC 4/4] drm: define NVIDIA DRM format modifiers for GB20x
To: James Jones <jajones@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000bc635706391b8492"
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

--000000000000bc635706391b8492
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 12:54=E2=80=AFAM James Jones <jajones@nvidia.com> wr=
ote:

> On 7/3/25 16:22, Faith Ekstrand wrote:
> > On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James Jones <jajones@nvidia.com
> > <mailto:jajones@nvidia.com>> wrote:
> >
> >     The layout of bits within the individual tiles
> >     (referred to as sectors in the
> >     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> >     changed for some formats starting in Blackwell 2
> >     GPUs. To denote the difference, extend the sector
> >     field in the parametric format modifier definition
> >     used to generate modifier values for NVIDIA
> >     hardware.
> >
> >     Without this change, it would be impossible to
> >     differentiate the two layouts based on modifiers,
> >     and as a result software could attempt to share
> >     surfaces directly between pre-GB20x and GB20x
> >     cards, resulting in corruption when the surface
> >     was accessed on one of the GPUs after being
> >     populated with content by the other.
> >
> >     Of note: This change causes the
> >     DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
> >     evaluate its "s" parameter twice, with the side
> >     effects that entails. I surveyed all usage of the
> >     modifier in the kernel and Mesa code, and that
> >     does not appear to be problematic in any current
> >     usage, but I thought it was worth calling out.
> >
> >     Signed-off-by: James Jones <jajones@nvidia.com
> >     <mailto:jajones@nvidia.com>>
> >     ---
> >       include/uapi/drm/drm_fourcc.h | 46
> +++++++++++++++++++++--------------
> >       1 file changed, 28 insertions(+), 18 deletions(-)
> >
> >     diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/
> >     drm_fourcc.h
> >     index 052e5fdd1d3b..348b2f1c1cb7 100644
> >     --- a/include/uapi/drm/drm_fourcc.h
> >     +++ b/include/uapi/drm/drm_fourcc.h
> >     @@ -909,8 +909,10 @@ extern "C" {
> >       #define __fourcc_mod_nvidia_pkind_shift 12
> >       #define __fourcc_mod_nvidia_kgen_mask 0x3ULL
> >       #define __fourcc_mod_nvidia_kgen_shift 20
> >     -#define __fourcc_mod_nvidia_slayout_mask 0x1ULL
> >     -#define __fourcc_mod_nvidia_slayout_shift 22
> >     +#define __fourcc_mod_nvidia_slayout_low_mask 0x1ULL
> >     +#define __fourcc_mod_nvidia_slayout_low_shift 22
> >     +#define __fourcc_mod_nvidia_slayout_high_mask 0x2ULL
> >     +#define __fourcc_mod_nvidia_slayout_high_shift 25
> >       #define __fourcc_mod_nvidia_comp_mask 0x7ULL
> >       #define __fourcc_mod_nvidia_comp_shift 23
> >
> >     @@ -973,14 +975,16 @@ extern "C" {
> >        *               2 =3D Gob Height 8, Turing+ Page Kind mapping
> >        *               3 =3D Reserved for future use.
> >        *
> >     - * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, ther=
e
> >     is a further
> >     - *             bit remapping step that occurs at an even lower
> >     level than the
> >     - *             page kind and block linear swizzles.  This causes
> >     the layout of
> >     - *             surfaces mapped in those SOC's GPUs to be
> >     incompatible with the
> >     - *             equivalent mapping on other GPUs in the same system=
.
> >     + * 22:22 s     Sector layout.  There is a further bit remapping
> >     step that occurs
> >     + * 26:26       at an even lower level than the page kind and block
> >     linear
> >     + *             swizzles.  This causes the bit arrangement of
> >     surfaces in memory
> >     + *             to differ subtly, and prevents direct sharing of
> >     surfaces between
> >     + *             GPUs with different layouts.
> >        *
> >     - *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout.
> >     - *               1 =3D Desktop GPU and Tegra Xavier+ Layout
> >     + *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout
> >     + *               1 =3D Pre-GB20x, Tegra Xavier-Orin, GB10 Layout
> >     + *               2 =3D GB20x(Blackwell 2)+ Layout for some pixel/
> >     texel sizes
> >
> >
> > I'm not sure I like just lumping all of blackwell together. Blackwell i=
s
> > the same as Turing for 32, 64, and 128-bit formats. It's only different
> > on 8 and 16 and those aren't the same. The way we modeled this for NVK
> > is to have Turing, Blackwell8Bit, and Blackwell16Bit GOBTypes. I think
> > I'd prefer the modifiers take a similar form.
> >
> > Technically, this isn't strictly necessary as there is always a format
> > and formats with different element sizes aren't compatible so a driver
> > can always look at format+modifier.  However, it is a better model of
> > the hardware.
>
> Yeah, my thinking was drivers would only use sector layout 2 for those 8
> and 16-bit formats, and still return sector layout 1 modifiers for other
> formats, so I think we're in agreement there. I could update the comment
> to make that clearer.
>
> You also want one sector layout for 8-bit and one for 16-bit (E.g., 2 =3D=
=3D
> GB20x 8-bit and 3 =3D=3D GB20x 16-bit)? I guess there are some cases wher=
e
> that would be useful. I just hate to burn extra values, but I don't feel
> strongly. I'll add that in the next iteration if no one objects.
>

That was my thinking, yeah. They're definitely different sector layouts and
it's more clear if we make them explicitly GB20x 8-bit and GB20x 16-bit.
That way no one tries to use it for 32-bit or higher. I'm not too worried
about burning an extra couple bits. We can reserve an extra one or two for
sector layout now easily enough while we're shuffling things anyway.


> Whatever design we settle on, I think it should be a goal to allow
> pre-GB20x cards to continue sharing e.g., 32-bit surfaces directly with
> GB20x cards. Some users are going to want to mix cards like that at some
> point.
>

Agreed.

~Faith


> Thanks,
> -James
>
> > ~Faith Ekstrand
> >
> >     + *               3 =3D reserved for future use.
> >        *
> >        * 25:23 c     Lossless Framebuffer Compression type.
> >        *
> >     @@ -995,7 +999,7 @@ extern "C" {
> >        *               6 =3D Reserved for future use
> >        *               7 =3D Reserved for future use
> >        *
> >     - * 55:26 -     Reserved for future use.  Must be zero.
> >     + * 55:27 -     Reserved for future use.  Must be zero.
> >        */
> >       #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
> >              fourcc_mod_code(NVIDIA, \
> >     @@ -1006,8 +1010,10 @@ extern "C" {
> >                                __fourcc_mod_nvidia_pkind_shift) | \
> >                               (((g) & __fourcc_mod_nvidia_kgen_mask) <<=
 \
> >                                __fourcc_mod_nvidia_kgen_shift) | \
> >     -                        (((s) & __fourcc_mod_nvidia_slayout_mask)
> << \
> >     -                         __fourcc_mod_nvidia_slayout_shift) | \
> >     +                        (((s) &
> >     __fourcc_mod_nvidia_slayout_low_mask) << \
> >     +                         __fourcc_mod_nvidia_slayout_low_shift) | =
\
> >     +                        (((s) &
> >     __fourcc_mod_nvidia_slayout_high_mask) << \
> >     +                         __fourcc_mod_nvidia_slayout_high_shift) |=
 \
> >                               (((c) & __fourcc_mod_nvidia_comp_mask) <<=
 \
> >                                __fourcc_mod_nvidia_comp_shift)))
> >
> >     @@ -1037,12 +1043,6 @@ __DRM_FOURCC_MKNVHELPER_FUNC(pkind)
> >        */
> >       __DRM_FOURCC_MKNVHELPER_FUNC(kgen)
> >
> >     -/*
> >     - * Get the sector layout specified by mod:
> >     - * static inline __u64 drm_fourcc_nvidia_format_mod_slayout(__u64
> mod)
> >     - */
> >     -__DRM_FOURCC_MKNVHELPER_FUNC(slayout)
> >     -
> >       /*
> >        * Get the lossless framebuffer compression specified by mod:
> >        * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mo=
d)
> >     @@ -1051,6 +1051,16 @@ __DRM_FOURCC_MKNVHELPER_FUNC(comp)
> >
> >       #undef __DRM_FOURCC_MKNVHELPER_FUNC
> >
> >     +/* Get the sector layout specified by mod: */
> >     +static inline __u64
> >     +drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
> >     +{
> >     +       return ((mod >> __fourcc_mod_nvidia_slayout_low_shift) &
> >     +               __fourcc_mod_nvidia_slayout_low_mask) |
> >     +               ((mod >> __fourcc_mod_nvidia_slayout_high_shift) &
> >     +                __fourcc_mod_nvidia_slayout_high_mask);
> >     +}
> >     +
> >       /* To grandfather in prior block linear format modifiers to the
> >     above layout,
> >        * the page kind "0", which corresponds to "pitch/linear" and
> >     hence is unusable
> >        * with block-linear layouts, is remapped within drivers to the
> >     value 0xfe,
> >     --
> >     2.49.0
> >
>
>

--000000000000bc635706391b8492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Jul 4, 2025 at 12:54=E2=80=AFAM James Jones=
 &lt;<a href=3D"mailto:jajones@nvidia.com" target=3D"_blank">jajones@nvidia=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 7/3/25 16:22, Faith Ekstrand wrote:<br>
&gt; On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James Jones &lt;<a href=3D"mail=
to:jajones@nvidia.com" target=3D"_blank">jajones@nvidia.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jajones@nvidia.com" target=3D"_blank">jaj=
ones@nvidia.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The layout of bits within the individual tiles<br>
&gt;=C2=A0 =C2=A0 =C2=A0(referred to as sectors in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)<br>
&gt;=C2=A0 =C2=A0 =C2=A0changed for some formats starting in Blackwell 2<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0GPUs. To denote the difference, extend the sector<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0field in the parametric format modifier definition<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0used to generate modifier values for NVIDIA<br>
&gt;=C2=A0 =C2=A0 =C2=A0hardware.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Without this change, it would be impossible to<br>
&gt;=C2=A0 =C2=A0 =C2=A0differentiate the two layouts based on modifiers,<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0and as a result software could attempt to share<br>
&gt;=C2=A0 =C2=A0 =C2=A0surfaces directly between pre-GB20x and GB20x<br>
&gt;=C2=A0 =C2=A0 =C2=A0cards, resulting in corruption when the surface<br>
&gt;=C2=A0 =C2=A0 =C2=A0was accessed on one of the GPUs after being<br>
&gt;=C2=A0 =C2=A0 =C2=A0populated with content by the other.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Of note: This change causes the<br>
&gt;=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0evaluate its &quot;s&quot; parameter twice, with th=
e side<br>
&gt;=C2=A0 =C2=A0 =C2=A0effects that entails. I surveyed all usage of the<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0modifier in the kernel and Mesa code, and that<br>
&gt;=C2=A0 =C2=A0 =C2=A0does not appear to be problematic in any current<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0usage, but I thought it was worth calling out.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: James Jones &lt;<a href=3D"mailto:ja=
jones@nvidia.com" target=3D"_blank">jajones@nvidia.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jajones@nvidia.com" ta=
rget=3D"_blank">jajones@nvidia.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0include/uapi/drm/drm_fourcc.h | 46 +++++++++=
++++++++++++--------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 28 insertions(+), 18 deletio=
ns(-)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/include/uapi/drm/drm_fourcc.h b/includ=
e/uapi/drm/<br>
&gt;=C2=A0 =C2=A0 =C2=A0drm_fourcc.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 052e5fdd1d3b..348b2f1c1cb7 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/include/uapi/drm/drm_fourcc.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/include/uapi/drm/drm_fourcc.h<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -909,8 +909,10 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define __fourcc_mod_nvidia_pkind_shift 12<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define __fourcc_mod_nvidia_kgen_mask 0x3ULL=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define __fourcc_mod_nvidia_kgen_shift 20<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-#define __fourcc_mod_nvidia_slayout_mask 0x1ULL<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0-#define __fourcc_mod_nvidia_slayout_shift 22<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define __fourcc_mod_nvidia_slayout_low_mask 0x1UL=
L<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define __fourcc_mod_nvidia_slayout_low_shift 22<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+#define __fourcc_mod_nvidia_slayout_high_mask 0x2U=
LL<br>
&gt;=C2=A0 =C2=A0 =C2=A0+#define __fourcc_mod_nvidia_slayout_high_shift 25<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define __fourcc_mod_nvidia_comp_mask 0x7ULL=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define __fourcc_mod_nvidia_comp_shift 23<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -973,14 +975,16 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A02 =3D Gob Height 8, Turing+ Page Kind mapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A03 =3D Reserved for future use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0- * 22:22 s=C2=A0 =C2=A0 =C2=A0Sector layout.=C2=A0=
 On Tegra GPUs prior to Xavier, there<br>
&gt;=C2=A0 =C2=A0 =C2=A0is a further<br>
&gt;=C2=A0 =C2=A0 =C2=A0- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
bit remapping step that occurs at an even lower<br>
&gt;=C2=A0 =C2=A0 =C2=A0level than the<br>
&gt;=C2=A0 =C2=A0 =C2=A0- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
page kind and block linear swizzles.=C2=A0 This causes<br>
&gt;=C2=A0 =C2=A0 =C2=A0the layout of<br>
&gt;=C2=A0 =C2=A0 =C2=A0- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
surfaces mapped in those SOC&#39;s GPUs to be<br>
&gt;=C2=A0 =C2=A0 =C2=A0incompatible with the<br>
&gt;=C2=A0 =C2=A0 =C2=A0- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
equivalent mapping on other GPUs in the same system.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * 22:22 s=C2=A0 =C2=A0 =C2=A0Sector layout.=C2=A0=
 There is a further bit remapping<br>
&gt;=C2=A0 =C2=A0 =C2=A0step that occurs<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * 26:26=C2=A0 =C2=A0 =C2=A0 =C2=A0at an even lowe=
r level than the page kind and block<br>
&gt;=C2=A0 =C2=A0 =C2=A0linear<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
swizzles.=C2=A0 This causes the bit arrangement of<br>
&gt;=C2=A0 =C2=A0 =C2=A0surfaces in memory<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
to differ subtly, and prevents direct sharing of<br>
&gt;=C2=A0 =C2=A0 =C2=A0surfaces between<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
GPUs with different layouts.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 =3D Tegra K1 - Tegra Parker/TX2 Layout.<br>
&gt;=C2=A0 =C2=A0 =C2=A0- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A01 =3D Desktop GPU and Tegra Xavier+ Layout<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A00 =3D Tegra K1 - Tegra Parker/TX2 Layout<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A01 =3D Pre-GB20x, Tegra Xavier-Orin, GB10 Layout<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A02 =3D GB20x(Blackwell 2)+ Layout for some pixel/<br>
&gt;=C2=A0 =C2=A0 =C2=A0texel sizes<br>
&gt; <br>
&gt; <br>
&gt; I&#39;m not sure I like just lumping all of blackwell together. Blackw=
ell is <br>
&gt; the same as Turing for 32, 64, and 128-bit formats. It&#39;s only diff=
erent <br>
&gt; on 8 and 16 and those aren&#39;t the same. The way we modeled this for=
 NVK <br>
&gt; is to have Turing, Blackwell8Bit, and Blackwell16Bit=C2=A0GOBTypes. I =
think <br>
&gt; I&#39;d prefer the modifiers take a similar form.<br>
&gt; <br>
&gt; Technically, this isn&#39;t strictly necessary as there is always a fo=
rmat <br>
&gt; and formats with different element sizes aren&#39;t compatible so a dr=
iver <br>
&gt; can always look at format+modifier.=C2=A0 However, it is a better mode=
l of <br>
&gt; the hardware.<br>
<br>
Yeah, my thinking was drivers would only use sector layout 2 for those 8 <b=
r>
and 16-bit formats, and still return sector layout 1 modifiers for other <b=
r>
formats, so I think we&#39;re in agreement there. I could update the commen=
t <br>
to make that clearer.<br>
<br>
You also want one sector layout for 8-bit and one for 16-bit (E.g., 2 =3D=
=3D <br>
GB20x 8-bit and 3 =3D=3D GB20x 16-bit)? I guess there are some cases where =
<br>
that would be useful. I just hate to burn extra values, but I don&#39;t fee=
l <br>
strongly. I&#39;ll add that in the next iteration if no one objects.<br></b=
lockquote><div><br></div><div>That was my thinking, yeah. They&#39;re defin=
itely different sector layouts and it&#39;s more clear if we make them expl=
icitly GB20x 8-bit and GB20x 16-bit. That way no one tries to use it for 32=
-bit or higher. I&#39;m not too worried about burning an extra=C2=A0couple =
bits. We can reserve an extra one or two for sector layout now easily enoug=
h while we&#39;re shuffling things anyway.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
Whatever design we settle on, I think it should be a goal to allow <br>
pre-GB20x cards to continue sharing e.g., 32-bit surfaces directly with <br=
>
GB20x cards. Some users are going to want to mix cards like that at some <b=
r>
point.<br></blockquote><div><br></div><div>Agreed.</div><div><br></div><div=
>~Faith</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
Thanks,<br>
-James<br>
<br>
&gt; ~Faith Ekstrand<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A03 =3D reserved for future use.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 25:23 c=C2=A0 =C2=A0 =C2=A0Lossless Frame=
buffer Compression type.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -995,7 +999,7 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A06 =3D Reserved for future use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A07 =3D Reserved for future use<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt;=C2=A0 =C2=A0 =C2=A0- * 55:26 -=C2=A0 =C2=A0 =C2=A0Reserved for future =
use.=C2=A0 Must be zero.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ * 55:27 -=C2=A0 =C2=A0 =C2=A0Reserved for future =
use.=C2=A0 Must be zero.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2=
D(c, s, g, k, h) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fourcc_mod_code(NVIDIA=
, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1006,8 +1010,10 @@ extern &quot;C&quot; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidia_pkind_shift) =
| \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((g) &amp; __fourcc_mod_nvidia_kg=
en_mask) &lt;&lt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidia_kgen_shift) |=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((s) &amp; __fourcc_mod_nvidia_slayout_=
mask) &lt;&lt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_shift)=
 | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((s) &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_low_mask) &lt;&lt; \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_low_sh=
ift) | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((s) &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_high_mask) &lt;&lt; \<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_high_s=
hift) | \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((c) &amp; __fourcc_mod_nvidia_co=
mp_mask) &lt;&lt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidia_comp_shift)))=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1037,12 +1043,6 @@ __DRM_FOURCC_MKNVHELPER_FUNC=
(pkind)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0__DRM_FOURCC_MKNVHELPER_FUNC(kgen)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0- * Get the sector layout specified by mod:<br>
&gt;=C2=A0 =C2=A0 =C2=A0- * static inline __u64 drm_fourcc_nvidia_format_mo=
d_slayout(__u64 mod)<br>
&gt;=C2=A0 =C2=A0 =C2=A0- */<br>
&gt;=C2=A0 =C2=A0 =C2=A0-__DRM_FOURCC_MKNVHELPER_FUNC(slayout)<br>
&gt;=C2=A0 =C2=A0 =C2=A0-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Get the lossless framebuffer compression =
specified by mod:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * static inline __u64 drm_fourcc_nvidia_for=
mat_mod_kgen(__u64 mod)<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -1051,6 +1051,16 @@ __DRM_FOURCC_MKNVHELPER_FUNC=
(comp)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#undef __DRM_FOURCC_MKNVHELPER_FUNC<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0+/* Get the sector layout specified by mod: */<br>
&gt;=C2=A0 =C2=A0 =C2=A0+static inline __u64<br>
&gt;=C2=A0 =C2=A0 =C2=A0+drm_fourcc_nvidia_format_mod_slayout(__u64 mod)<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0+{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((mod &gt;&gt; _=
_fourcc_mod_nvidia_slayout_low_shift) &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__fourcc_mod_nvidia_slayout_low_mask) |<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0((mod &gt;&gt; __fourcc_mod_nvidia_slayout_high_shift) &amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __fourcc_mod_nvidia_slayout_high_mask);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* To grandfather in prior block linear form=
at modifiers to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0above layout,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the page kind &quot;0&quot;, which corres=
ponds to &quot;pitch/linear&quot; and<br>
&gt;=C2=A0 =C2=A0 =C2=A0hence is unusable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * with block-linear layouts, is remapped wi=
thin drivers to the<br>
&gt;=C2=A0 =C2=A0 =C2=A0value 0xfe,<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.49.0<br>
&gt; <br>
<br>
</blockquote></div></div>
</div>

--000000000000bc635706391b8492--
