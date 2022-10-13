Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF955FD653
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 10:40:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7610E513;
	Thu, 13 Oct 2022 08:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36DA510E4DD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 08:39:51 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id s3so568028qtn.12
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Oct 2022 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JW7cYSWMs3X1JnJ995reAiHAbwdAMxhVS43f0d8AqhQ=;
 b=oL3hQnvFeLfSGMmM2SCC15Dwx0GOUEc5+iuaqSVi06nDz8CeYIKY9kxzFzKq6l8wue
 /Aa91o9CSKGRPR68pLf6UX5i1EISLLv5en1MqYIn9q3lLUvcuJ+rOt4azIMOSrgoHO6W
 nLAcxW/9qFfckBzRnEUelkBSEO5KCQid4XgrnBbYgyF/yn7MyDKmLjkNooxt86E+o3Z2
 sl7DouwkLFZ3xvBKJs8by/H1Arf7eExWVdfTbr3sR8xUwnRIzRwKDDb0en/8FsD0Oj8c
 Z90aCQ135DlxnleiGZRDhR0T+LlHvVEKosaoxtqFU5BQyhK+soGYIT39+RgpgYQLzZZI
 dToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JW7cYSWMs3X1JnJ995reAiHAbwdAMxhVS43f0d8AqhQ=;
 b=LmfqRdrd5/lfojqk55MieAAXg8dRwV37e/LXNg77IITW8O2UGzzhx5fVN66KRjObDs
 /AzjgHHpdFbGEcFBCfmwC2wCeBMGOMXGGblJwr7Rdk3pd4PWH4PfK4MjIFswYKTT6xQR
 iyQRDyjQPrmJbBUQvddT0Fh1EXsjkQWKfHidFQ61dzWyzHKvl9LpOCzLLACE85SDRtfP
 fZlnald5kPmM0yRPErC4U1nVPKisRZNW9f1FJMleJdP+I3/Hq2q0umUYdaAnXyf928l7
 sh32DPHTl9ZmZxy6mDWxaT+HkATuMeq30vWL1aXrQ/4xboB8kxHCZYB1Inq1XE6iN31q
 SEnQ==
X-Gm-Message-State: ACrzQf1zJk+bHzOk331proOoOWvVkoC2xKJmb/ubz043ChqLaMHBZTSM
 JkH0RDijW0dKMni9bv0tKPkF1G80UWd92MxELbvFlw==
X-Google-Smtp-Source: AMsMyM56gJDYUOKGS/SHpb2PTuu8b7YWZEjvXE6zuhxY1qdvLW/FufuVCozDc9G5x58SukgeScmeLrfL1zf+3XlL4rQ=
X-Received: by 2002:ac8:5acf:0:b0:39c:d4d8:3f75 with SMTP id
 d15-20020ac85acf000000b0039cd4d83f75mr86889qtd.579.1665650389977; Thu, 13 Oct
 2022 01:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20221012191226.1646315-1-greenjustin@chromium.org>
In-Reply-To: <20221012191226.1646315-1-greenjustin@chromium.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 13 Oct 2022 09:39:38 +0100
Message-ID: <CAPj87rPftXR6v=Z44Y7EKkF2w6Hh_sEueW_m0z1qmi0iH+moHw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/mediatek: Add AFBC support to Mediatek DRM driver
To: Justin Green <greenjustin@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000d0a77705eae673d8"
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000d0a77705eae673d8
Content-Type: text/plain; charset="UTF-8"

Hi Justin,

On Wed, 12 Oct 2022 at 20:12, Justin Green <greenjustin@chromium.org> wrote:

> @@ -226,6 +249,32 @@ int mtk_ovl_layer_check(struct device *dev, unsigned
> int idx,
>         if (state->fb->format->is_yuv && rotation != 0)
>                 return -EINVAL;
>
> +       if (state->fb->modifier) {
>

Please spell this out explicitly as DRM_FORMAT_MOD_LINEAR. For some reason,
we specify that 0 is explicitly block-linear, whilst INVALID ('unknown
layout, figure it out by magic') is a non-zero value. So != 0 isn't a check
for 'was a modifier explicitly specified', even if != 0 is almost always
'is this buffer non-linear'.

+               unsigned long long modifier;
> +               unsigned int fourcc;
>

u64, u32, but ...


> +               if (!ovl->data->supports_afbc)
> +                       return -EINVAL;
> +
> +               modifier = state->fb->modifier;
> +
> +               if (modifier !=
> DRM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |
> +
>  AFBC_FORMAT_MOD_SPLIT |
> +
>  AFBC_FORMAT_MOD_SPARSE))
> +                       return -EINVAL;
> +
> +               fourcc = state->fb->format->format;
> +               if (fourcc != DRM_FORMAT_BGRA8888 &&
> +                   fourcc != DRM_FORMAT_ABGR8888 &&
> +                   fourcc != DRM_FORMAT_ARGB8888 &&
> +                   fourcc != DRM_FORMAT_XRGB8888 &&
> +                   fourcc != DRM_FORMAT_XBGR8888 &&
> +                   fourcc != DRM_FORMAT_RGB888 &&
> +                   fourcc != DRM_FORMAT_BGR888)
> +                       return -EINVAL;


The core shouldn't allow a framebuffer to be created with a format/modifier
pair which wasn't advertised, so these checks can be dropped. Except that
it's never advertised.

mtk_plane_init() passes a set of formats and modifiers to
drm_universal_plane_init(); the AFBC modifier needs to be added here, as
well as LINEAR and INVALID. Then you'll need to set the
format_mod_supported() hook on the plane to filter out format/modifier
pairs. After that, you should see (e.g. with drm_info) that you get an
IN_FORMATS blob which advertises DRM_FORMAT_MOD_ARM_AFBC(...) as well as
linear for DRM_FORMAT_XRGB8888, but only linear for DRM_FORMAT_RGB565.

After doing that, you should see framebuffer creation fail for unsupported
pairings, e.g. RGB565 + AFBC.


>  +       bool is_afbc = pending->modifier;


... != DRM_FORMAT_MOD_LINEAR


> @@ -52,6 +53,7 @@ static void mtk_plane_reset(struct drm_plane *plane)
>
>         state->base.plane = plane;
>         state->pending.format = DRM_FORMAT_RGB565;
> +       state->pending.modifier = 0;
>

= DRM_FORMAT_MOD_LINEAR


> @@ -120,21 +122,52 @@ static void mtk_plane_update_new_state(struct
> drm_plane_state *new_state,
>         struct drm_gem_object *gem;
>         struct mtk_drm_gem_obj *mtk_gem;
>         unsigned int pitch, format;
> +       unsigned long long modifier;
>

u64


> +       if (!modifier) {
>

modifier == DRM_FORMAT_MOD_LINEAR

Cheers,
Daniel

--000000000000d0a77705eae673d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Justin,</div><div dir=3D"ltr"><br></div><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 Oct 2022 =
at 20:12, Justin Green &lt;<a href=3D"mailto:greenjustin@chromium.org">gree=
njustin@chromium.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">@@ -226,6 +249,32 @@ int mtk_ovl_layer_check(struct dev=
ice *dev, unsigned int idx,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (state-&gt;fb-&gt;format-&gt;is_yuv &amp;&am=
p; rotation !=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (state-&gt;fb-&gt;modifier) {<br></blockquot=
e><div><br></div><div>Please spell this out explicitly as DRM_FORMAT_MOD_LI=
NEAR. For some reason, we specify that 0 is explicitly block-linear, whilst=
 INVALID (&#39;unknown layout, figure it out by magic&#39;) is a non-zero v=
alue. So !=3D 0 isn&#39;t a check for &#39;was a modifier explicitly specif=
ied&#39;, even if !=3D 0 is almost always &#39;is this buffer non-linear&#3=
9;.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long long =
modifier;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int fourcc=
;<br></blockquote><div><br></div><div>u64, u32, but ...</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ovl-&gt;data-&gt;supports_afbc)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0modifier =3D state-=
&gt;fb-&gt;modifier;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (modifier !=3D D=
RM_FORMAT_MOD_ARM_AFBC(AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AFBC_FORMAT_MOD_SPLIT |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AFBC_FORMAT_MOD_SPARSE))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourcc =3D state-&g=
t;fb-&gt;format-&gt;format;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (fourcc !=3D DRM=
_FORMAT_BGRA8888 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourc=
c !=3D DRM_FORMAT_ABGR8888 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourc=
c !=3D DRM_FORMAT_ARGB8888 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourc=
c !=3D DRM_FORMAT_XRGB8888 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourc=
c !=3D DRM_FORMAT_XBGR8888 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourc=
c !=3D DRM_FORMAT_RGB888 &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fourc=
c !=3D DRM_FORMAT_BGR888)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;</blockquote><div><br></div><div>The core shouldn&=
#39;t allow a framebuffer to be created with a format/modifier pair which w=
asn&#39;t advertised, so these checks can be dropped. Except that it&#39;s =
never advertised.</div><div><br></div><div>mtk_plane_init() passes a set of=
 formats and modifiers to drm_universal_plane_init(); the AFBC modifier nee=
ds to be added here, as well as LINEAR and INVALID. Then you&#39;ll need to=
 set the format_mod_supported() hook on the plane to filter out format/modi=
fier pairs. After that, you should see (e.g. with drm_info) that you get an=
 IN_FORMATS blob which advertises DRM_FORMAT_MOD_ARM_AFBC(...) as well as l=
inear for DRM_FORMAT_XRGB8888, but only linear for DRM_FORMAT_RGB565.</div>=
<div><br></div><div>After doing that, you should see framebuffer creation f=
ail for unsupported pairings, e.g. RGB565=C2=A0+ AFBC.</div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0bool is_afbc =3D pending-&gt;modifier;</blockquote><div><br></=
div><div>... !=3D DRM_FORMAT_MOD_LINEAR</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">@@ -52,6 +53,7 @@ static void mtk_plan=
e_reset(struct drm_plane *plane)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;base.plane =3D plane;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 state-&gt;pending.format =3D DRM_FORMAT_RGB565;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0state-&gt;pending.modifier =3D 0;<br></blockquo=
te><div><br></div><div>=3D DRM_FORMAT_MOD_LINEAR</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">@@ -120,21 +122,52 @@ static =
void mtk_plane_update_new_state(struct drm_plane_state *new_state,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct drm_gem_object *gem;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct mtk_drm_gem_obj *mtk_gem;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int pitch, format;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long long modifier;<br></blockquote><d=
iv><br></div><div>u64</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!modifier) {<br></blockq=
uote><div><br></div><div>modifier =3D=3D DRM_FORMAT_MOD_LINEAR</div><div>=
=C2=A0</div><div>Cheers,</div><div>Daniel</div></div></div>

--000000000000d0a77705eae673d8--
