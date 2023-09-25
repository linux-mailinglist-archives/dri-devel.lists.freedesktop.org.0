Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E757AE68A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 09:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3FD210E363;
	Tue, 26 Sep 2023 07:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F7B10E177
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 12:26:02 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so105197401fa.2
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695644761; x=1696249561;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PHQtmkC30hHt8gZTCHxr3dlXHasR3Xn3ytbl/PY+/Ew=;
 b=TLCf+nkCG/6GSGjga1+xNolfJKNBTKXRdDzQTn4DnpFBscsTbaxIpM3OoajDcZPxc/
 0+StMsPVIjTk/15PwlFS+ysFuFsMq3EoeE9ZzKWTBWvDn0s7isIPOX1wUSqyU9SMdZrI
 K0OmNnoJOSCQCPKvdYPDyIlAuPOQN85iMpM24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695644761; x=1696249561;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PHQtmkC30hHt8gZTCHxr3dlXHasR3Xn3ytbl/PY+/Ew=;
 b=tGW8RnIEicAm1PDghmKni/uOe+Xkkaa3JBoXd/yW3ly05IHVzI3geY8r+8LspMJmoD
 ku2hUEK35/2icwQSZk5ksRG4vVbya/LFcCWZFdn8RtV75ttaG2mVW72pxpCserhdgoR5
 5mQ3ZCPuo5JkAL00qvdDLlMj59Q/TeMLyftr7i3btIR5XWob3TaqJDwf9Nslv+C2DeEN
 +Y1vuPTfWdXOfNGvmaKSx5meIoEbpFg6tjygcmba8jb6/QF7yLp+4GyrZYo96uMzASD1
 mIDlrAlnkFiONReEkBqChuBc5Tz7Vw81wh8I1qSk1j2vndYv+YO/l2iQNQORPuWvj0ZB
 PeFQ==
X-Gm-Message-State: AOJu0Yyb+uh20ScAwUbJrbRGuitO6nHSdcIdKycW/fiakLY+lkiewzcr
 kUzuUKwSfsMV7IqQOkbhUkJkLNz+bvjjkPpPlZImrg==
X-Google-Smtp-Source: AGHT+IGZCNZ9eBOi1VqGUJn+t3MoRNNaVKfcCgqitzoKciij9C/hsreaDhYL+k6TNJ9oew+U7aTavwRFySg2mlDzED0=
X-Received: by 2002:a2e:8913:0:b0:2bf:fd6c:ddfc with SMTP id
 d19-20020a2e8913000000b002bffd6cddfcmr5346131lji.45.1695644760790; Mon, 25
 Sep 2023 05:26:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230925092249.2228743-1-hmazur@chromium.org>
 <298927114c054dfaca41e94520470a4c9430e6e8.camel@mediatek.com>
In-Reply-To: <298927114c054dfaca41e94520470a4c9430e6e8.camel@mediatek.com>
From: Hubert Mazur <hmazur@chromium.org>
Date: Mon, 25 Sep 2023 14:25:49 +0200
Message-ID: <CANV1CBHHyLbVbrUmv0nxSwgpqK1SiE5iDW-svzXGTejvg44rGA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Check GEM buffer size
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Content-Type: multipart/alternative; boundary="000000000000a1ebb906062e0f81"
X-Mailman-Approved-At: Tue, 26 Sep 2023 07:15:08 +0000
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
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mikrawczyk@google.com" <mikrawczyk@google.com>,
 "upstream@semihalf.com" <upstream@semihalf.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "djkurtz@chromium.org" <djkurtz@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000a1ebb906062e0f81
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 11:40=E2=80=AFAM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89=
) <ck.hu@mediatek.com> wrote:

> Hi, Hubert:
>
> On Mon, 2023-09-25 at 09:22 +0000, Hubert Mazur wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  The buffer size is derived from parameters supplied by the
> > userspace.
> > Having the size equal 0 causes allocation failure leading to kernel
> > panic.
>
> The size is calculated by width and height, and drm_mode_create_dumb()
> has checked the width and height, so the size would not be 0. So this
> patch is redundant.
>

Ah, you are right, I had an inner checkout which required this fix.
Let's abandon this patch.
Thanks for the review!
Regards,
Hubert

Regards,
> CK
>
> >
> > Fix this by checking if size equals 0.
> >
> > Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC
> > MT8173.")
> >
> > Signed-off-by: Hubert Mazur <hmazur@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > index 9f364df52478..3b985b99d5c6 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > @@ -62,6 +62,11 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct
> > drm_device *dev,
> >       struct drm_gem_object *obj;
> >       int ret;
> >
> > +     if (size =3D=3D 0) {
> > +             DRM_ERROR("Invalid allocation size: %zu", size);
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> >       mtk_gem =3D mtk_drm_gem_init(dev, size);
> >       if (IS_ERR(mtk_gem))
> >               return ERR_CAST(mtk_gem);
> > --
> > 2.42.0.515.g380fc7ccd1-goog
>

--000000000000a1ebb906062e0f81
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 25, 2023 at 11:40=E2=80=
=AFAM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=89) &lt;<a href=3D"mailto:ck.hu@media=
tek.com">ck.hu@mediatek.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hi, Hubert:<br>
<br>
On Mon, 2023-09-25 at 09:22 +0000, Hubert Mazur wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
&gt; External email : Please do not click links or open attachments until<b=
r>
&gt; you have verified the sender or the content.<br>
&gt;=C2=A0 The buffer size is derived from parameters supplied by the<br>
&gt; userspace.<br>
&gt; Having the size equal 0 causes allocation failure leading to kernel<br=
>
&gt; panic.<br>
<br>
The size is calculated by width and height, and drm_mode_create_dumb()<br>
has checked the width and height, so the size would not be 0. So this<br>
patch is redundant.<br></blockquote><div>=C2=A0<br>Ah, you are right, I had=
 an inner checkout which required this fix.<br>Let&#39;s abandon this patch=
.<br>Thanks for the review!<br>Regards,<br>Hubert<br><br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
Regards,<br>
CK<br>
<br>
&gt; <br>
&gt; Fix this by checking if size equals 0.<br>
&gt; <br>
&gt; Fixes: 119f5173628a (&quot;drm/mediatek: Add DRM Driver for Mediatek S=
oC<br>
&gt; MT8173.&quot;)<br>
&gt; <br>
&gt; Signed-off-by: Hubert Mazur &lt;<a href=3D"mailto:hmazur@chromium.org"=
 target=3D"_blank">hmazur@chromium.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>
&gt; b/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>
&gt; index 9f364df52478..3b985b99d5c6 100644<br>
&gt; --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>
&gt; +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>
&gt; @@ -62,6 +62,11 @@ struct mtk_drm_gem_obj *mtk_drm_gem_create(struct<b=
r>
&gt; drm_device *dev,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_gem_object *obj;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (size =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;Inval=
id allocation size: %zu&quot;, size);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-EINVA=
L);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_gem =3D mtk_drm_gem_init(dev, size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(mtk_gem))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_CAST(=
mtk_gem);<br>
&gt; -- <br>
&gt; 2.42.0.515.g380fc7ccd1-goog<br>
</blockquote></div></div>

--000000000000a1ebb906062e0f81--
