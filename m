Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF96712A735
	for <lists+dri-devel@lfdr.de>; Wed, 25 Dec 2019 11:19:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AEB89FA9;
	Wed, 25 Dec 2019 10:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B105689DFE
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Dec 2019 02:43:35 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z193so20489326iof.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2019 18:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FkHC2/wKSq+9T5DT5vcW7QSWQ50wf/NgZ+c4oz1aKDA=;
 b=e6PvdaMDArS01x+rA/4rEgHHyXQsEFQXUOMD/qzLDQrnSXPSlWFSAdHQsTe0vLl8WF
 e0cTzroSXFXt9qt1oN02/Sc77IBkDZp+CB9BdRmrIly84ZjTXQLLyM9p0IvfvXfoA5Zq
 9QgYD/O52UanjFitZwCweHULYup2Q6LTFUPffwMtGvIlzgX+rPqcOSwmTC9rvdtHtO01
 GQrXIWc8mx0B/jXqK2GaJdwWvlr2LZCX7dwek0E6qz+diWVFYU6qVTrVgJdSNb2wDBiP
 /8lljXXwr1/WJrUPGSVCBWgg1QFc2CzJzOBww0WpYQix9nshkGv/Je7FMky0G7U3MONI
 jWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FkHC2/wKSq+9T5DT5vcW7QSWQ50wf/NgZ+c4oz1aKDA=;
 b=rDEzH25wODaN+o4DkJ1qJqOX+1daZYVdfPGkH/Kl5rvVPvdqkMqNqVniLkbcHRdzIE
 U2EE4o9Us7/eI9japbhUXPQ5G4nYSlL7FKQnrRE0Drh3MsCs7A+ARHAUs6sez/1Q1+d5
 +w3egDYeRYK/+laINBdEFNHCFTVq1tR8l1L7dLFJYDFOkEPMfIsL+tT6r92vFx0+LT1q
 B2nVM0ItbMF6+9yv5jDVOhEYlorSzXcPQPQ1FstvNcOBegOq0VFtLMhHwAf/taAcQGNt
 3rWUGTDJVAQAFVtYFpbHDKBu9KUThTZs1KibQopniHsGSwbEL9KO+AgakB9iRr4IvsWF
 dqHQ==
X-Gm-Message-State: APjAAAW+nU/STGxVUYVLrlXTMuad0NVeDZJ/jifktga3c8Akv8YtEh27
 5g/lvTMnoWIvkxMXpRWF93HndZ2EbK0YSzqEc/G6kQ==
X-Google-Smtp-Source: APXvYqz/0WFXNV4ZzBRCqXZrnJBy/QW94PrShVgM6ynZkJrS23cwrC84TmMofRqykXALcWGmbp7pTVRXuLAtiW0t6y0=
X-Received: by 2002:a02:85e8:: with SMTP id d95mr30755183jai.92.1577241814680; 
 Tue, 24 Dec 2019 18:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20191211154901.176256-1-markyacoub@google.com>
 <1577240723.3440.1.camel@mtksdaap41>
In-Reply-To: <1577240723.3440.1.camel@mtksdaap41>
From: Mark Yacoub <markyacoub@google.com>
Date: Tue, 24 Dec 2019 21:43:22 -0500
Message-ID: <CAC0gqY4RFuvbDBiaGCLxNST0xdzER59s+EdYuJ-pVKz3TEFD6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Return from mtk_ovl_layer_config after
 mtk_ovl_layer_off
To: CK Hu <ck.hu@mediatek.com>
X-Mailman-Approved-At: Wed, 25 Dec 2019 10:19:18 +0000
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
Cc: Daniele Castagna <dcastagna@chromium.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0304124183=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0304124183==
Content-Type: multipart/alternative; boundary="000000000000171bb6059a7e3ae1"

--000000000000171bb6059a7e3ae1
Content-Type: text/plain; charset="UTF-8"

Thanks for the update!

On Tue, Dec 24, 2019, 9:25 PM CK Hu <ck.hu@mediatek.com> wrote:

> Hi, Mark:
>
> On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:
> > drm/mediatek: return if plane pending state is disabled.
> >
> > If the plane pending state is disabled, call mtk_ovl_layer_off then
> > return.
> > This guarantees that that the state is valid for all operations when the
> > pending state is enabled.
>
> For this series, applied to mediatek-drm-next-5.6 [1], thanks.
>
> [1]
>
> https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6
>
> Regards,
> CK
>
> >
> > Suggested-by: Sean Paul <seanpaul@chromium.org>
> > To: CK Hu <ck.hu@mediatek.com>
> > To: dri-devel@lists.freedesktop.org
> > Cc: Daniele Castagna <dcastagna@chromium.org>
> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-mediatek@lists.infradead.org
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > index 4a55bb6e2213..526b595eeff9 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> > @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct
> mtk_ddp_comp *comp, unsigned int idx,
> >       unsigned int src_size = (pending->height << 16) | pending->width;
> >       unsigned int con;
> >
> > -     if (!pending->enable)
> > +     if (!pending->enable) {
> >               mtk_ovl_layer_off(comp, idx);
> > +             return;
> > +     }
> >
> >       con = ovl_fmt_convert(ovl, fmt);
> >       if (idx != 0)
> > @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp
> *comp, unsigned int idx,
> >       writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
> >       writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
> >
> > -     if (pending->enable)
> > -             mtk_ovl_layer_on(comp, idx);
> > +     mtk_ovl_layer_on(comp, idx);
> >  }
> >
> >  static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
>
>

--000000000000171bb6059a7e3ae1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks for the update!</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 24, 2019, 9:25 PM CK Hu=
 &lt;<a href=3D"mailto:ck.hu@mediatek.com">ck.hu@mediatek.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi, Mark:<br>
<br>
On Wed, 2019-12-11 at 10:49 -0500, Mark Yacoub wrote:<br>
&gt; drm/mediatek: return if plane pending state is disabled.<br>
&gt; <br>
&gt; If the plane pending state is disabled, call mtk_ovl_layer_off then<br=
>
&gt; return.<br>
&gt; This guarantees that that the state is valid for all operations when t=
he<br>
&gt; pending state is enabled.<br>
<br>
For this series, applied to mediatek-drm-next-5.6 [1], thanks.<br>
<br>
[1]<br>
<a href=3D"https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek=
-drm-next-5.6" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gith=
ub.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6</a><br>
<br>
Regards,<br>
CK<br>
<br>
&gt; <br>
&gt; Suggested-by: Sean Paul &lt;<a href=3D"mailto:seanpaul@chromium.org" t=
arget=3D"_blank" rel=3D"noreferrer">seanpaul@chromium.org</a>&gt;<br>
&gt; To: CK Hu &lt;<a href=3D"mailto:ck.hu@mediatek.com" target=3D"_blank" =
rel=3D"noreferrer">ck.hu@mediatek.com</a>&gt;<br>
&gt; To: <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blan=
k" rel=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br>
&gt; Cc: Daniele Castagna &lt;<a href=3D"mailto:dcastagna@chromium.org" tar=
get=3D"_blank" rel=3D"noreferrer">dcastagna@chromium.org</a>&gt;<br>
&gt; Cc: Philipp Zabel &lt;<a href=3D"mailto:p.zabel@pengutronix.de" target=
=3D"_blank" rel=3D"noreferrer">p.zabel@pengutronix.de</a>&gt;<br>
&gt; Cc: David Airlie &lt;<a href=3D"mailto:airlied@linux.ie" target=3D"_bl=
ank" rel=3D"noreferrer">airlied@linux.ie</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel@ffwll.ch" target=3D"_bl=
ank" rel=3D"noreferrer">daniel@ffwll.ch</a>&gt;<br>
&gt; Cc: Matthias Brugger &lt;<a href=3D"mailto:matthias.bgg@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">matthias.bgg@gmail.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:linux-arm-kernel@lists.infradead.org" target=3D"=
_blank" rel=3D"noreferrer">linux-arm-kernel@lists.infradead.org</a><br>
&gt; Cc: <a href=3D"mailto:linux-mediatek@lists.infradead.org" target=3D"_b=
lank" rel=3D"noreferrer">linux-mediatek@lists.infradead.org</a><br>
&gt; Signed-off-by: Mark Yacoub &lt;<a href=3D"mailto:markyacoub@google.com=
" target=3D"_blank" rel=3D"noreferrer">markyacoub@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm=
/mediatek/mtk_disp_ovl.c<br>
&gt; index 4a55bb6e2213..526b595eeff9 100644<br>
&gt; --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c<br>
&gt; +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c<br>
&gt; @@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_c=
omp *comp, unsigned int idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int src_size =3D (pending-&gt;heigh=
t &lt;&lt; 16) | pending-&gt;width;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int con;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!pending-&gt;enable)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pending-&gt;enable) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_ovl_layer_of=
f(comp, idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0con =3D ovl_fmt_convert(ovl, fmt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (idx !=3D 0)<br>
&gt; @@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_co=
mp *comp, unsigned int idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(offset, comp-&gt;regs + DISP_=
REG_OVL_OFFSET(idx));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0writel_relaxed(addr, comp-&gt;regs + DISP_RE=
G_OVL_ADDR(ovl, idx));<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (pending-&gt;enable)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mtk_ovl_layer_on(comp=
, idx);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0mtk_ovl_layer_on(comp, idx);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)<br>
<br>
</blockquote></div>

--000000000000171bb6059a7e3ae1--

--===============0304124183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0304124183==--
