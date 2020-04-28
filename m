Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A811BBE0D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B526E3DB;
	Tue, 28 Apr 2020 12:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F57889E1A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 01:50:13 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id c16so18732150ilr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 18:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YaU2/bqOvJmu7nLilC8+VupwXIvHjzZj2IVAUbftdD4=;
 b=LTmjYe+3f178ZF4clJJuPpBT7YtcpC7y5+2/uzqzQk/G8phBpOZffIcitsRVkfIOKz
 Q+0HU9FejJxbnVW/51H8EKzj8xiheF6sNol3rwcl6rgaj7SepAvQJDSAbWRLjjLITmf3
 0py8OO9jNrVSn0kxsr544EA238G/OdWPX+w/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YaU2/bqOvJmu7nLilC8+VupwXIvHjzZj2IVAUbftdD4=;
 b=KGOWTxmZ6MoJmDstbTtYQiODUptSkEtLxqnzVm2PtOHXrgXaaYvWozOvYtle6Hg0Kb
 6M/irz4rEJrs+2A0g2X6NA0BIvIURD5QLRdBIxcgTVf7sz1OJSEynnT/tRUBMrxeCsJb
 Cz97/rLcUSFaQhHw/2m0ItikCSJ762j4duK2x07DouwJkAr43X5n2av+Pt+17HRJQQ3M
 np0ofZzuX/ljzq9s2q+V1Fa4Hin9rBgKALxS8vTQHnCAhw88AC/yyZzNBWIod/UDe74B
 LQIQgPZmgbMADn+DlwWqDlrFPDFSVim+/T6UN2mcAqcVVx6WWVGZud+Q/k4l33nX0dGi
 DFFg==
X-Gm-Message-State: AGi0PuYXNlv6DuqvM5KS8BCwJS+SjjCNgTbzTVQgwicbS7NcrqMmVbci
 aoq06viSzo1JJiVbgacZpd4BaTSyCRI=
X-Google-Smtp-Source: APiQypJy6H5hxU3adIx9DhAopD1s9ObvOGOzNEMjvPXRtBxeCq2EVnlSbll+RnCTfc7XAAEM9wbgrA==
X-Received: by 2002:a92:5c57:: with SMTP id q84mr24508823ilb.203.1588038611614; 
 Mon, 27 Apr 2020 18:50:11 -0700 (PDT)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id y15sm6041306ilg.21.2020.04.27.18.50.10
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 18:50:10 -0700 (PDT)
Received: by mail-il1-f169.google.com with SMTP id r2so18743069ilo.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 18:50:10 -0700 (PDT)
X-Received: by 2002:a05:6e02:68e:: with SMTP id
 o14mr22143273ils.33.1588038610055; 
 Mon, 27 Apr 2020 18:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200420060834.44461-1-amistry@google.com>
 <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
In-Reply-To: <CAAOTY_81qB+WJN_2-ZNqM63NOp+Es1qEmsp2qje2bfePg1O5Vw@mail.gmail.com>
From: "Anand K. Mistry" <amistry@chromium.org>
Date: Tue, 28 Apr 2020 11:49:59 +1000
X-Gmail-Original-Message-ID: <CAATStaOR6UcXFsYD8zmbmAyVGYctDEqzJiuhtE-_vi_1PdBKqQ@mail.gmail.com>
Message-ID: <CAATStaOR6UcXFsYD8zmbmAyVGYctDEqzJiuhtE-_vi_1PdBKqQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: stop iterating dma addresses when
 sg_dma_len() == 0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1097220324=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1097220324==
Content-Type: multipart/alternative; boundary="0000000000003e780205a4500d5c"

--0000000000003e780205a4500d5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 26 Apr 2020 at 18:04, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote=
:

> Hi, Anand:
>
> Anand K Mistry <amistry@chromium.org> =E6=96=BC 2020=E5=B9=B44=E6=9C=8820=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:09=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > If dma_map_sg() merges pages when creating the mapping, only the first
> > entries will have a valid sg_dma_address() and sg_dma_len(), followed b=
y
> > entries with sg_dma_len() =3D=3D 0.
> >
> > Signed-off-by: Anand K Mistry <amistry@google.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > index b04a3c2b111e09..f8fd8b98c30e3d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> > @@ -224,6 +224,9 @@ struct drm_gem_object
> *mtk_gem_prime_import_sg_table(struct drm_device *dev,
> >
> >         expected =3D sg_dma_address(sg->sgl);
> >         for_each_sg(sg->sgl, s, sg->nents, i) {
> > +               if (!sg_dma_len(s))
> > +                       break;
>
> I think this should be 'continue'
>

scatterlist.h has the comment:
/*
 * These macros should be used after a dma_map_sg call has been done
 * to get bus addresses of each of the SG entries and their lengths.
 * You should only work with the number of sg entries dma_map_sg
 * returns, or alternatively stop on the first sg_dma_len(sg) which
 * is 0.
 */

So breaking on the first sg_dma_len(sg) =3D=3D 0 appears to be (one of) the
documented approach.


> Regards,
> Chun-Kuang.
>
> > +
> >                 if (sg_dma_address(s) !=3D expected) {
> >                         DRM_ERROR("sg_table is not contiguous");
> >                         ret =3D -EINVAL;
> > --
> > 2.26.1.301.g55bc3eb7cb9-goog
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

--0000000000003e780205a4500d5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sun, 26 Apr 2020 at 18:04, Chun-Kuang =
Hu &lt;<a href=3D"mailto:chunkuang.hu@kernel.org">chunkuang.hu@kernel.org</=
a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hi, Anand:<br>
<br>
Anand K Mistry &lt;<a href=3D"mailto:amistry@chromium.org" target=3D"_blank=
">amistry@chromium.org</a>&gt; =E6=96=BC 2020=E5=B9=B44=E6=9C=8820=E6=97=A5=
 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=882:09=E5=AF=AB=E9=81=93=EF=BC=9A<br>
&gt;<br>
&gt; If dma_map_sg() merges pages when creating the mapping, only the first=
<br>
&gt; entries will have a valid sg_dma_address() and sg_dma_len(), followed =
by<br>
&gt; entries with sg_dma_len() =3D=3D 0.<br>
&gt;<br>
&gt; Signed-off-by: Anand K Mistry &lt;<a href=3D"mailto:amistry@google.com=
" target=3D"_blank">amistry@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/=
mediatek/mtk_drm_gem.c<br>
&gt; index b04a3c2b111e09..f8fd8b98c30e3d 100644<br>
&gt; --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>
&gt; +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c<br>
&gt; @@ -224,6 +224,9 @@ struct drm_gem_object *mtk_gem_prime_import_sg_tab=
le(struct drm_device *dev,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected =3D sg_dma_address(sg-&gt;sg=
l);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_sg(sg-&gt;sgl, s, sg-&gt;nen=
ts, i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!sg_dma_le=
n(s))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0break;<br>
<br>
I think this should be &#39;continue&#39;<br></blockquote><div><br></div>sc=
atterlist.h has the comment:<br>/*<br>=C2=A0* These macros should be used a=
fter a dma_map_sg call has been done<br>=C2=A0* to get bus addresses of eac=
h of the SG entries and their lengths.<br>=C2=A0* You should only work with=
 the number of sg entries dma_map_sg<br>=C2=A0* returns, or alternatively s=
top on the first sg_dma_len(sg) which<br>=C2=A0* is 0.<br>=C2=A0*/<div>=C2=
=A0</div><div>So breaking on the first=C2=A0sg_dma_len(sg) =3D=3D 0 appears=
 to be (one of) the documented approach.</div><div><br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Chun-Kuang.<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (sg_dm=
a_address(s) !=3D expected) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0DRM_ERROR(&quot;sg_table is not contiguous&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br>
&gt; --<br>
&gt; 2.26.1.301.g55bc3eb7cb9-goog<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Linux-mediatek mailing list<br>
&gt; <a href=3D"mailto:Linux-mediatek@lists.infradead.org" target=3D"_blank=
">Linux-mediatek@lists.infradead.org</a><br>
&gt; <a href=3D"http://lists.infradead.org/mailman/listinfo/linux-mediatek"=
 rel=3D"noreferrer" target=3D"_blank">http://lists.infradead.org/mailman/li=
stinfo/linux-mediatek</a><br>
</blockquote></div></div>

--0000000000003e780205a4500d5c--

--===============1097220324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1097220324==--
