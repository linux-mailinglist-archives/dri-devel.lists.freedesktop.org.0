Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF5AF840E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 01:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0F510E906;
	Thu,  3 Jul 2025 23:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="xeNy7Syo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E9410E14F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 23:22:41 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-311d5fdf1f0so467269a91.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 16:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1751584961; x=1752189761;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GMW6M+V/LFsEoODHF+S9taxspEfmPDDPydPh061xQUs=;
 b=xeNy7SyoeYM4gqurZKmb9kMV51oqCafMJWaDWl5tvCeQhfkAK7kI+Pge3WSo3TtAhT
 ljwov3CUlMz8c213j2533HfGltrlAuzDdOmy3o32+n9OXvnV0mbcPTTqVHlmBLaqGdnj
 sCaPsreJyVReSyBzalTEPAZmmh6XqWedi6vCN/m84EzSfy7TkH1nzp7Ac9b2mOxa1fxi
 ZYxOiXb5IBKzFfPC9SRmQPVff9JCm0/k1p3H+gxsktRmcpbyF6/lzt3iYiDaePdFYM01
 xSQCgf0Qp5AZGykJyIBHLryWQ4w+IPBSqNaMsFQvHYSKS8fizpEX9s5xmzxYJM3DJNyc
 c03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751584961; x=1752189761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMW6M+V/LFsEoODHF+S9taxspEfmPDDPydPh061xQUs=;
 b=b1HdmNpaiSbns1J8/y1YjhBS2QaYRd5IcUyBeZNAhLa/GOGXdTcBd3HYmhEF9jgAbf
 hEh5i5FGlV8Al6L3wRDUTlQfqKJZKcPZP6d7QOu+1JfRVEP/riCnadqNOlgzJIuFmY2a
 cxZPUrAlcfL2QWgKzKmVCky38cVoQ8rZhAvQN8HeOpQj0d32ZhkVgGyPCMXpfrddb+IN
 q98hRaqQehPH4O8s2tkUGkTOEf6EszT2qyfhgi4JlSdMneHd9IhmTJz2ypRDGtFdjZq7
 V3jWP7tWGnMP8CzcwtCejVCrqtZmc6w95pHx31uEmPV7ujB5FhTvTfrmqCgpv16zMQMe
 jlkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFeEq+Gol6B19dzSnp70BgD/o/ZuvfBO/kpJrzDMAHOmrN+crB6vTE5Wi+943uevU3b98b0VtIH0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHEya9p6t9wGA9CoVj8NHyUL1m4nDt/+FvNBs+BqDQ42hRV1HF
 Ba9fIyzxqPxRsX71CK9IPwdu9FXNQDsGFmzThTVHHVU5R/yrWuISChmPg8XRt0F2v1curS/EX8B
 aAj2qEbnX5i9qQ/sfNM6Lke9WLVkMGg3ad3thA2/K/g==
X-Gm-Gg: ASbGncuhociMy8g9/p18NWuBk2DGouHdPK3tZbW4vXh7LyPX9wogSytXNh0McG6OCb9
 wuHsx5kNagJWNpDd5lhaSjaCNmDswE8tlgiooEP8tuBB7ueOC1FmbYmLmS6Dxt/DooXRv4fwLt7
 h+Bv8J+Knal4sBPqyk5uabLojYnaxQ/BYQwuf8A1TImQ==
X-Google-Smtp-Source: AGHT+IE+L3oo42If4uhFm+T4u2yS2Y/S7jenERYCKsdq6VEwx8/DHIC6vdTrwTRR186WUHOaaeDop0rFhN9Vv2K7oKs=
X-Received: by 2002:a17:90b:2590:b0:313:2754:5910 with SMTP id
 98e67ed59e1d1-31aac46204dmr678209a91.15.1751584961080; Thu, 03 Jul 2025
 16:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250703223658.1457-1-jajones@nvidia.com>
 <20250703223658.1457-5-jajones@nvidia.com>
In-Reply-To: <20250703223658.1457-5-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Thu, 3 Jul 2025 19:22:29 -0400
X-Gm-Features: Ac12FXyPaIJ54obxQNsHxJu3vwpxkxNMLhHqBqPz7mzNbZWark38mWZ0HP8rQ9g
Message-ID: <CAOFGe95mU1P-BeMXM506Jmdr66b1poFyFquxQr_s9KoEDbqVcQ@mail.gmail.com>
Subject: Re: [RFC 4/4] drm: define NVIDIA DRM format modifiers for GB20x
To: James Jones <jajones@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Content-Type: multipart/alternative; boundary="0000000000006641d406390ea7f9"
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

--0000000000006641d406390ea7f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James Jones <jajones@nvidia.com> wro=
te:

> The layout of bits within the individual tiles
> (referred to as sectors in the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> changed for some formats starting in Blackwell 2
> GPUs. To denote the difference, extend the sector
> field in the parametric format modifier definition
> used to generate modifier values for NVIDIA
> hardware.
>
> Without this change, it would be impossible to
> differentiate the two layouts based on modifiers,
> and as a result software could attempt to share
> surfaces directly between pre-GB20x and GB20x
> cards, resulting in corruption when the surface
> was accessed on one of the GPUs after being
> populated with content by the other.
>
> Of note: This change causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
> evaluate its "s" parameter twice, with the side
> effects that entails. I surveyed all usage of the
> modifier in the kernel and Mesa code, and that
> does not appear to be problematic in any current
> usage, but I thought it was worth calling out.
>
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 46 +++++++++++++++++++++--------------
>  1 file changed, 28 insertions(+), 18 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index 052e5fdd1d3b..348b2f1c1cb7 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -909,8 +909,10 @@ extern "C" {
>  #define __fourcc_mod_nvidia_pkind_shift 12
>  #define __fourcc_mod_nvidia_kgen_mask 0x3ULL
>  #define __fourcc_mod_nvidia_kgen_shift 20
> -#define __fourcc_mod_nvidia_slayout_mask 0x1ULL
> -#define __fourcc_mod_nvidia_slayout_shift 22
> +#define __fourcc_mod_nvidia_slayout_low_mask 0x1ULL
> +#define __fourcc_mod_nvidia_slayout_low_shift 22
> +#define __fourcc_mod_nvidia_slayout_high_mask 0x2ULL
> +#define __fourcc_mod_nvidia_slayout_high_shift 25
>  #define __fourcc_mod_nvidia_comp_mask 0x7ULL
>  #define __fourcc_mod_nvidia_comp_shift 23
>
> @@ -973,14 +975,16 @@ extern "C" {
>   *               2 =3D Gob Height 8, Turing+ Page Kind mapping
>   *               3 =3D Reserved for future use.
>   *
> - * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a
> further
> - *             bit remapping step that occurs at an even lower level tha=
n
> the
> - *             page kind and block linear swizzles.  This causes the
> layout of
> - *             surfaces mapped in those SOC's GPUs to be incompatible
> with the
> - *             equivalent mapping on other GPUs in the same system.
> + * 22:22 s     Sector layout.  There is a further bit remapping step tha=
t
> occurs
> + * 26:26       at an even lower level than the page kind and block linea=
r
> + *             swizzles.  This causes the bit arrangement of surfaces in
> memory
> + *             to differ subtly, and prevents direct sharing of surfaces
> between
> + *             GPUs with different layouts.
>   *
> - *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout.
> - *               1 =3D Desktop GPU and Tegra Xavier+ Layout
> + *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout
> + *               1 =3D Pre-GB20x, Tegra Xavier-Orin, GB10 Layout
> + *               2 =3D GB20x(Blackwell 2)+ Layout for some pixel/texel s=
izes
>

I'm not sure I like just lumping all of blackwell together. Blackwell is
the same as Turing for 32, 64, and 128-bit formats. It's only different on
8 and 16 and those aren't the same. The way we modeled this for NVK is to
have Turing, Blackwell8Bit, and Blackwell16Bit GOBTypes. I think I'd prefer
the modifiers take a similar form.

Technically, this isn't strictly necessary as there is always a format and
formats with different element sizes aren't compatible so a driver can
always look at format+modifier.  However, it is a better model of the
hardware.

~Faith Ekstrand



> + *               3 =3D reserved for future use.
>   *
>   * 25:23 c     Lossless Framebuffer Compression type.
>   *
> @@ -995,7 +999,7 @@ extern "C" {
>   *               6 =3D Reserved for future use
>   *               7 =3D Reserved for future use
>   *
> - * 55:26 -     Reserved for future use.  Must be zero.
> + * 55:27 -     Reserved for future use.  Must be zero.
>   */
>  #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
>         fourcc_mod_code(NVIDIA, \
> @@ -1006,8 +1010,10 @@ extern "C" {
>                           __fourcc_mod_nvidia_pkind_shift) | \
>                          (((g) & __fourcc_mod_nvidia_kgen_mask) << \
>                           __fourcc_mod_nvidia_kgen_shift) | \
> -                        (((s) & __fourcc_mod_nvidia_slayout_mask) << \
> -                         __fourcc_mod_nvidia_slayout_shift) | \
> +                        (((s) & __fourcc_mod_nvidia_slayout_low_mask) <<=
 \
> +                         __fourcc_mod_nvidia_slayout_low_shift) | \
> +                        (((s) & __fourcc_mod_nvidia_slayout_high_mask) <=
<
> \
> +                         __fourcc_mod_nvidia_slayout_high_shift) | \
>                          (((c) & __fourcc_mod_nvidia_comp_mask) << \
>                           __fourcc_mod_nvidia_comp_shift)))
>
> @@ -1037,12 +1043,6 @@ __DRM_FOURCC_MKNVHELPER_FUNC(pkind)
>   */
>  __DRM_FOURCC_MKNVHELPER_FUNC(kgen)
>
> -/*
> - * Get the sector layout specified by mod:
> - * static inline __u64 drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
> - */
> -__DRM_FOURCC_MKNVHELPER_FUNC(slayout)
> -
>  /*
>   * Get the lossless framebuffer compression specified by mod:
>   * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mod)
> @@ -1051,6 +1051,16 @@ __DRM_FOURCC_MKNVHELPER_FUNC(comp)
>
>  #undef __DRM_FOURCC_MKNVHELPER_FUNC
>
> +/* Get the sector layout specified by mod: */
> +static inline __u64
> +drm_fourcc_nvidia_format_mod_slayout(__u64 mod)
> +{
> +       return ((mod >> __fourcc_mod_nvidia_slayout_low_shift) &
> +               __fourcc_mod_nvidia_slayout_low_mask) |
> +               ((mod >> __fourcc_mod_nvidia_slayout_high_shift) &
> +                __fourcc_mod_nvidia_slayout_high_mask);
> +}
> +
>  /* To grandfather in prior block linear format modifiers to the above
> layout,
>   * the page kind "0", which corresponds to "pitch/linear" and hence is
> unusable
>   * with block-linear layouts, is remapped within drivers to the value
> 0xfe,
> --
> 2.49.0
>
>

--0000000000006641d406390ea7f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James =
Jones &lt;<a href=3D"mailto:jajones@nvidia.com">jajones@nvidia.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The layou=
t of bits within the individual tiles<br>
(referred to as sectors in the<br>
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)<br>
changed for some formats starting in Blackwell 2<br>
GPUs. To denote the difference, extend the sector<br>
field in the parametric format modifier definition<br>
used to generate modifier values for NVIDIA<br>
hardware.<br>
<br>
Without this change, it would be impossible to<br>
differentiate the two layouts based on modifiers,<br>
and as a result software could attempt to share<br>
surfaces directly between pre-GB20x and GB20x<br>
cards, resulting in corruption when the surface<br>
was accessed on one of the GPUs after being<br>
populated with content by the other.<br>
<br>
Of note: This change causes the<br>
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to<br>
evaluate its &quot;s&quot; parameter twice, with the side<br>
effects that entails. I surveyed all usage of the<br>
modifier in the kernel and Mesa code, and that<br>
does not appear to be problematic in any current<br>
usage, but I thought it was worth calling out.<br>
<br>
Signed-off-by: James Jones &lt;<a href=3D"mailto:jajones@nvidia.com" target=
=3D"_blank">jajones@nvidia.com</a>&gt;<br>
---<br>
=C2=A0include/uapi/drm/drm_fourcc.h | 46 +++++++++++++++++++++-------------=
-<br>
=C2=A01 file changed, 28 insertions(+), 18 deletions(-)<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index 052e5fdd1d3b..348b2f1c1cb7 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -909,8 +909,10 @@ extern &quot;C&quot; {<br>
=C2=A0#define __fourcc_mod_nvidia_pkind_shift 12<br>
=C2=A0#define __fourcc_mod_nvidia_kgen_mask 0x3ULL<br>
=C2=A0#define __fourcc_mod_nvidia_kgen_shift 20<br>
-#define __fourcc_mod_nvidia_slayout_mask 0x1ULL<br>
-#define __fourcc_mod_nvidia_slayout_shift 22<br>
+#define __fourcc_mod_nvidia_slayout_low_mask 0x1ULL<br>
+#define __fourcc_mod_nvidia_slayout_low_shift 22<br>
+#define __fourcc_mod_nvidia_slayout_high_mask 0x2ULL<br>
+#define __fourcc_mod_nvidia_slayout_high_shift 25<br>
=C2=A0#define __fourcc_mod_nvidia_comp_mask 0x7ULL<br>
=C2=A0#define __fourcc_mod_nvidia_comp_shift 23<br>
<br>
@@ -973,14 +975,16 @@ extern &quot;C&quot; {<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 =3D Gob He=
ight 8, Turing+ Page Kind mapping<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =3D Reserv=
ed for future use.<br>
=C2=A0 *<br>
- * 22:22 s=C2=A0 =C2=A0 =C2=A0Sector layout.=C2=A0 On Tegra GPUs prior to =
Xavier, there is a further<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit remapping step that =
occurs at an even lower level than the<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page kind and block line=
ar swizzles.=C2=A0 This causes the layout of<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0surfaces mapped in those=
 SOC&#39;s GPUs to be incompatible with the<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0equivalent mapping on ot=
her GPUs in the same system.<br>
+ * 22:22 s=C2=A0 =C2=A0 =C2=A0Sector layout.=C2=A0 There is a further bit =
remapping step that occurs<br>
+ * 26:26=C2=A0 =C2=A0 =C2=A0 =C2=A0at an even lower level than the page ki=
nd and block linear<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0swizzles.=C2=A0 This cau=
ses the bit arrangement of surfaces in memory<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to differ subtly, and pr=
events direct sharing of surfaces between<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPUs with different layo=
uts.<br>
=C2=A0 *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =3D Tegra K1 - =
Tegra Parker/TX2 Layout.<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =3D Desktop GPU=
 and Tegra Xavier+ Layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =3D Tegra K1 - =
Tegra Parker/TX2 Layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =3D Pre-GB20x, =
Tegra Xavier-Orin, GB10 Layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 =3D GB20x(Black=
well 2)+ Layout for some pixel/texel sizes<br></blockquote><div><br></div><=
div>I&#39;m not sure I like just lumping all of blackwell together. Blackwe=
ll is the same as Turing for 32, 64, and 128-bit formats. It&#39;s only dif=
ferent on 8 and 16 and those aren&#39;t the same. The way we modeled this f=
or NVK is to have Turing, Blackwell8Bit, and Blackwell16Bit=C2=A0GOBTypes. =
I think I&#39;d prefer the modifiers take a similar form.</div><div><br></d=
iv><div>Technically, this isn&#39;t strictly necessary as there is always a=
 format and formats with different element sizes aren&#39;t compatible so a=
 driver can always look at format+modifier.=C2=A0 However, it is a better m=
odel of the hardware.</div><div><br></div><div>~Faith Ekstrand</div><div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =3D reserved fo=
r future use.<br>
=C2=A0 *<br>
=C2=A0 * 25:23 c=C2=A0 =C2=A0 =C2=A0Lossless Framebuffer Compression type.<=
br>
=C2=A0 *<br>
@@ -995,7 +999,7 @@ extern &quot;C&quot; {<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06 =3D Reserv=
ed for future use<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 =3D Reserv=
ed for future use<br>
=C2=A0 *<br>
- * 55:26 -=C2=A0 =C2=A0 =C2=A0Reserved for future use.=C2=A0 Must be zero.=
<br>
+ * 55:27 -=C2=A0 =C2=A0 =C2=A0Reserved for future use.=C2=A0 Must be zero.=
<br>
=C2=A0 */<br>
=C2=A0#define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fourcc_mod_code(NVIDIA, \<br>
@@ -1006,8 +1010,10 @@ extern &quot;C&quot; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidia_pkind_shift) | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(((g) &amp; __fourcc_mod_nvidia_kgen_mask) &lt;&lt; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidia_kgen_shift) | \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (((s) &amp; __fourcc_mod_nvidia_slayout_mask) &lt;&lt; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_shift) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (((s) &amp; __fourcc_mod_nvidia_slayout_low_mask) &lt;&lt; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_low_shift) | \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 (((s) &amp; __fourcc_mod_nvidia_slayout_high_mask) &lt;&lt; \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia_slayout_high_shift) | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(((c) &amp; __fourcc_mod_nvidia_comp_mask) &lt;&lt; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidia_comp_shift)))<br>
<br>
@@ -1037,12 +1043,6 @@ __DRM_FOURCC_MKNVHELPER_FUNC(pkind)<br>
=C2=A0 */<br>
=C2=A0__DRM_FOURCC_MKNVHELPER_FUNC(kgen)<br>
<br>
-/*<br>
- * Get the sector layout specified by mod:<br>
- * static inline __u64 drm_fourcc_nvidia_format_mod_slayout(__u64 mod)<br>
- */<br>
-__DRM_FOURCC_MKNVHELPER_FUNC(slayout)<br>
-<br>
=C2=A0/*<br>
=C2=A0 * Get the lossless framebuffer compression specified by mod:<br>
=C2=A0 * static inline __u64 drm_fourcc_nvidia_format_mod_kgen(__u64 mod)<b=
r>
@@ -1051,6 +1051,16 @@ __DRM_FOURCC_MKNVHELPER_FUNC(comp)<br>
<br>
=C2=A0#undef __DRM_FOURCC_MKNVHELPER_FUNC<br>
<br>
+/* Get the sector layout specified by mod: */<br>
+static inline __u64<br>
+drm_fourcc_nvidia_format_mod_slayout(__u64 mod)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ((mod &gt;&gt; __fourcc_mod_nvidia_slayo=
ut_low_shift) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__fourcc_mod_nvidia=
_slayout_low_mask) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((mod &gt;&gt; __fo=
urcc_mod_nvidia_slayout_high_shift) &amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fourcc_mod_nvidi=
a_slayout_high_mask);<br>
+}<br>
+<br>
=C2=A0/* To grandfather in prior block linear format modifiers to the above=
 layout,<br>
=C2=A0 * the page kind &quot;0&quot;, which corresponds to &quot;pitch/line=
ar&quot; and hence is unusable<br>
=C2=A0 * with block-linear layouts, is remapped within drivers to the value=
 0xfe,<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000006641d406390ea7f9--
