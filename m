Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 710496F9D69
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 03:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3643610E08F;
	Mon,  8 May 2023 01:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA20410E08F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 01:31:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f137dbaa4fso4527899e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 18:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683509497; x=1686101497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zW1uDpPbKcKSnJGi8ru2oHll+hIh35+vjVLEkSqK8pw=;
 b=Ghw26ZkMaLU5npuQFSTBKPFW0j0aAh7idJS5tMS6AD4rMG3xSnvjCZ6B5hohHAoXWL
 d4FJUOlPSSeKpWf47jDc35CT14+RyjhbLJGvaqWWE+5uom7CQQEBvkz+YgUusHv1nufM
 YuCdn9PBUJQiOiVrBypkCbPbWhgK494WD8+Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683509497; x=1686101497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zW1uDpPbKcKSnJGi8ru2oHll+hIh35+vjVLEkSqK8pw=;
 b=Hmmilff2pghnzTXmUZ+gYFokiU6QKDbdJW+Esy7IuGcVg+QA+nOKWvJWn4/hQKb1j5
 YRoeED5ZUU1PUaSHH7+VI3eVaWmtrDa0yxxQBeyt4btkFa0ndre3wyrdkUWRkC/N5B32
 GpOT1bMQgJ6FGa4LnB1iqAk13HHp/vKyY6wWp1TbOiE4/rKBKNng6PyaL/O8GIXsa0Ei
 3HO4wiv3Dog84gNLG3CNpG5dgOGFcqqdLsCun1QfaDgCqUqa8375aI+cGduMl/i3OIaY
 gLtQRGluI4+rPaSMPhj3wF7AsDGolWElCKvOfKgdcezynJAcdy7bh2Ah37lR6cRTWV3a
 VPzQ==
X-Gm-Message-State: AC+VfDyJ30Ts9+WBQVSdDDwEmVYqU2YYE8rrKfpAGr4h3S2DOqnOb61+
 +ismNfS5ZCpvk4BadliZncbc8yXZopbOPkNGpWuCHw==
X-Google-Smtp-Source: ACHHUZ4R78h5kEUNNHCyB+AETcVWAe5UTAs7IifWDinXozRj1wQ+N9BEtc7GycW3Azl1N0RlrlECxQ==
X-Received: by 2002:ac2:5f10:0:b0:4ef:ed40:a6db with SMTP id
 16-20020ac25f10000000b004efed40a6dbmr2152195lfq.33.1683509497033; 
 Sun, 07 May 2023 18:31:37 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 v6-20020a056512048600b004f13d358c4esm1114245lfq.22.2023.05.07.18.31.36
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 May 2023 18:31:36 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-4f14865fcc0so8661e87.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 18:31:36 -0700 (PDT)
X-Received: by 2002:a05:6512:3458:b0:4f0:10e6:b51 with SMTP id
 j24-20020a056512345800b004f010e60b51mr168523lfr.4.1683509495999; Sun, 07 May
 2023 18:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230425080240.3582324-1-brpol@chromium.org>
 <ZEpIKnDwy/XNEnfY@phenom.ffwll.local>
 <CALWYx-an3X0zeNyC-1ehR7WTni43YVgUevLN+c+BCEkcysjTpA@mail.gmail.com>
In-Reply-To: <CALWYx-an3X0zeNyC-1ehR7WTni43YVgUevLN+c+BCEkcysjTpA@mail.gmail.com>
From: Brandon Ross Pollack <brpol@chromium.org>
Date: Mon, 8 May 2023 10:31:24 +0900
X-Gmail-Original-Message-ID: <CALWYx-YhB_kWRksA8GX=YZdu1j4ArN4CpdDwVB7y_MzweYUaVw@mail.gmail.com>
Message-ID: <CALWYx-YhB_kWRksA8GX=YZdu1j4ArN4CpdDwVB7y_MzweYUaVw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: vkms: clarify devres managed refernce
 cleanup
To: Daniel Vetter <daniel@ffwll.ch>
Content-Type: multipart/alternative; boundary="0000000000007cbdbd05fb249911"
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000007cbdbd05fb249911
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Seems it might be best just to have you do this, Daniel.  Thanks for the
review :)

On Fri, Apr 28, 2023 at 11:53=E2=80=AFAM Brandon Ross Pollack <brpol@chromi=
um.org>
wrote:

> On Thu, Apr 27, 2023 at 7:02=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> w=
rote:
> >
> > On Tue, Apr 25, 2023 at 08:02:40AM +0000, Brandon Pollack wrote:
> > > added documentation to drm_dev_unregister clarifying that devres
> managed
> > > devices allocated with devm_drm_dev_alloc do not require calls to
> > > drm_dev_put.
> > >
> > > Signed-off-by: Brandon Pollack <brpol@chromium.org>
> > >
> > > ---
> > >
> > > This is my first patch to any tree.  I've tried my best to read as ma=
ny
> > > kernel docs etc as possible (wip). This took me a moment to realize s=
o
> I
> > > figured it was as good a candidate as any for a first patch (at the
> very
> > > least to make sure I have the whole patching process figured out).  I
> > > hope to make more janitorial changes as I continue to learn leading u=
p
> > > to the work I hope to do.
> > >
> > > We're hoping to add multiple display hotplug output support to VKMS f=
or
> > > testing purposes.  Some work has been done already, but we'll be taki=
ng
> > > over moving forward.  Our intent is to remain involved and assist in
> > > maintaining these changes.
> > >
> > > Looking forward to your comments/advice (now and henceforth!)
> >
> > Looking good!
> >
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >
> > Since you're @chromium.org I'm assuming that one of the cros committers
> > will push this to drm-misc-next. If not please holler.
> > -Daniel
>
> I'm actually working in relative isolation on this (I'm located in
> Tokyo) so please go ahead.  I'll get in touch with some of those folks
> soon :)
>
> >
> > > ---
> > >  drivers/gpu/drm/drm_drv.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index cee0cc522ed9..12687dd9e1ac 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -969,7 +969,9 @@ EXPORT_SYMBOL(drm_dev_register);
> > >   *
> > >   * Unregister the DRM device from the system. This does the reverse =
of
> > >   * drm_dev_register() but does not deallocate the device. The caller
> must call
> > > - * drm_dev_put() to drop their final reference.
> > > + * drm_dev_put() to drop their final reference, unless it is managed
> with devres
> > > + * (as devices allocated with devm_drm_dev_alloc() are), in which
> case there is
> > > + * already an unwind action registered.
> > >   *
> > >   * A special form of unregistering for hotpluggable devices is
> drm_dev_unplug(),
> > >   * which can be called while there are still open users of @dev.
> > > --
> > > 2.40.0.634.g4ca3ef3211-goog
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>

--0000000000007cbdbd05fb249911
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Seems it might be best just to have you do this, Daniel.=
=C2=A0 Thanks for the review :)</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Fri, Apr 28, 2023 at 11:53=E2=80=AFAM Bra=
ndon Ross Pollack &lt;<a href=3D"mailto:brpol@chromium.org">brpol@chromium.=
org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Thu, Apr 27, 2023 at 7:02=E2=80=AFPM Daniel Vetter &lt;<a href=3D"mai=
lto:daniel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt;<br>
&gt; On Tue, Apr 25, 2023 at 08:02:40AM +0000, Brandon Pollack wrote:<br>
&gt; &gt; added documentation to drm_dev_unregister clarifying that devres =
managed<br>
&gt; &gt; devices allocated with devm_drm_dev_alloc do not require calls to=
<br>
&gt; &gt; drm_dev_put.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Brandon Pollack &lt;<a href=3D"mailto:brpol@chromi=
um.org" target=3D"_blank">brpol@chromium.org</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; This is my first patch to any tree.=C2=A0 I&#39;ve tried my best =
to read as many<br>
&gt; &gt; kernel docs etc as possible (wip). This took me a moment to reali=
ze so I<br>
&gt; &gt; figured it was as good a candidate as any for a first patch (at t=
he very<br>
&gt; &gt; least to make sure I have the whole patching process figured out)=
.=C2=A0 I<br>
&gt; &gt; hope to make more janitorial changes as I continue to learn leadi=
ng up<br>
&gt; &gt; to the work I hope to do.<br>
&gt; &gt;<br>
&gt; &gt; We&#39;re hoping to add multiple display hotplug output support t=
o VKMS for<br>
&gt; &gt; testing purposes.=C2=A0 Some work has been done already, but we&#=
39;ll be taking<br>
&gt; &gt; over moving forward.=C2=A0 Our intent is to remain involved and a=
ssist in<br>
&gt; &gt; maintaining these changes.<br>
&gt; &gt;<br>
&gt; &gt; Looking forward to your comments/advice (now and henceforth!)<br>
&gt;<br>
&gt; Looking good!<br>
&gt;<br>
&gt; Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.c=
h" target=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt;<br>
&gt; Since you&#39;re @<a href=3D"http://chromium.org" rel=3D"noreferrer" t=
arget=3D"_blank">chromium.org</a> I&#39;m assuming that one of the cros com=
mitters<br>
&gt; will push this to drm-misc-next. If not please holler.<br>
&gt; -Daniel<br>
<br>
I&#39;m actually working in relative isolation on this (I&#39;m located in<=
br>
Tokyo) so please go ahead.=C2=A0 I&#39;ll get in touch with some of those f=
olks<br>
soon :)<br>
<br>
&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/drm_drv.c | 4 +++-<br>
&gt; &gt;=C2=A0 1 file changed, 3 insertions(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.=
c<br>
&gt; &gt; index cee0cc522ed9..12687dd9e1ac 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/drm_drv.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/drm_drv.c<br>
&gt; &gt; @@ -969,7 +969,9 @@ EXPORT_SYMBOL(drm_dev_register);<br>
&gt; &gt;=C2=A0 =C2=A0*<br>
&gt; &gt;=C2=A0 =C2=A0* Unregister the DRM device from the system. This doe=
s the reverse of<br>
&gt; &gt;=C2=A0 =C2=A0* drm_dev_register() but does not deallocate the devi=
ce. The caller must call<br>
&gt; &gt; - * drm_dev_put() to drop their final reference.<br>
&gt; &gt; + * drm_dev_put() to drop their final reference, unless it is man=
aged with devres<br>
&gt; &gt; + * (as devices allocated with devm_drm_dev_alloc() are), in whic=
h case there is<br>
&gt; &gt; + * already an unwind action registered.<br>
&gt; &gt;=C2=A0 =C2=A0*<br>
&gt; &gt;=C2=A0 =C2=A0* A special form of unregistering for hotpluggable de=
vices is drm_dev_unplug(),<br>
&gt; &gt;=C2=A0 =C2=A0* which can be called while there are still open user=
s of @dev.<br>
&gt; &gt; --<br>
&gt; &gt; 2.40.0.634.g4ca3ef3211-goog<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Daniel Vetter<br>
&gt; Software Engineer, Intel Corporation<br>
&gt; <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">=
http://blog.ffwll.ch</a><br>
</blockquote></div>

--0000000000007cbdbd05fb249911--
