Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5002B57CEC
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50076E5D3;
	Thu, 27 Jun 2019 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822006E453
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 15:00:08 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id z75so1349184pgz.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 08:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pG5zF/k+TZojS6kKRwCZY5DdYLORP5z098TXVUnSvi0=;
 b=ro/0/Gz1bCz4ImMeMNA5g94POHRUCOpx/SzJd2vxLciMaqw78kU5UCzQ36b3IDtuEO
 DfC1xc8lr6i874Y5a7/EC4ydxOuf+t+3GQ+7Ooe5Al1GwWveGCOKinYt4V5EMiiahu7t
 o1K8b9JPqdHFjyYM7ceXbGHmTdz4rHHYEuFGPMGyXo194gB46pUG0/ls3T4OwgAvMiKh
 oVUtrYdEqEX6Efdn7lWklo3Y6FnJLtxcBrgVrBebW0dL72QO4L2EsRWMWY0CKZEC/E07
 05OzhQIGnOgeTayqK110yHbNf9ZKNBgN2igTJNrp1sM/vI94/8ee0i9rTPMReAusz0RV
 scIQ==
X-Gm-Message-State: APjAAAU1TAkrYrQQ9QJ/OzMQskKXTsdUc+Z1S7MvFRAtj/0mi/RnAabr
 vpzIKPeyHi3Ulo3v1szMAA39IcrQNcPTMH9b9kQ=
X-Google-Smtp-Source: APXvYqwvRmDLDBkB8DCNWt//dQHhY11n4g79nRXMmAMWG1wFCWn0/D1HomswsBhF6NbIjQ62YiEbFS3pSHaPaxlIJjc=
X-Received: by 2002:a63:e018:: with SMTP id e24mr3330445pgh.361.1561561207846; 
 Wed, 26 Jun 2019 08:00:07 -0700 (PDT)
MIME-Version: 1.0
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
 <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
 <20190625085534.xf2ullyju3ewbgik@holly.lan>
 <CAFaGBPnH=75=wJRM4EX9MYR8MSehEa2_hBEOsqo-DZvD6c6f_A@mail.gmail.com>
 <20190626105614.ujmryi7qou2ra7aq@holly.lan>
 <20190626145624.GC22348@xo-6d-61-c0.localdomain>
In-Reply-To: <20190626145624.GC22348@xo-6d-61-c0.localdomain>
From: Brian Dodge <bdodge09@gmail.com>
Date: Wed, 26 Jun 2019 10:59:55 -0400
Message-ID: <CAFaGBPmF2gDNEy_Ok_Ky9GR7XEyVUdhG=BYGXEMCN1Tq2eHo6g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: backlight: fix vendor prefix for
 ArcticSand arcxcnn driver bindings
To: Pavel Machek <pavel@ucw.cz>
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pG5zF/k+TZojS6kKRwCZY5DdYLORP5z098TXVUnSvi0=;
 b=bSISKBDEDN8NzL4CMPg8eqpjh+rBSBtS70XCsaTPukBbR7hga5eyLR6OsNwXsMix/D
 /W19tizx9NuzKQdzbRsZb/W8QfNYTwohGOx0zrL1/4x3UpObXPRWbS8RT5o5NLT6eE13
 qZDdxKxFE9sRZxgmJ+CoMRl9T5XS0wmxA8vAw3DV8GAcVU11XYLP5Cc7QNwOuc6s2Iyf
 GvjaKGTpOsK5M/hkVg0M55u3wN5wSI3z7R7p01O0N1QS4upNrijsXSu3Iiu2sAvhC9ln
 lcCau91QReddO+DMKT2xh82vlKLQ1RfCbC1KCbDJnFc/pi+qfJbGVH55Bg+Qq+k+Pk4x
 /xzA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 jacek.anaszewski@gmail.com, pbacon@psemi.com, lee.jones@linaro.org,
 linux-leds@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2112663020=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2112663020==
Content-Type: multipart/alternative; boundary="00000000000016bf57058c3b4dba"

--00000000000016bf57058c3b4dba
Content-Type: text/plain; charset="UTF-8"

Is there a standard way to format to-be-deprecated items in the bindings?


On Wed, Jun 26, 2019, 10:56 AM Pavel Machek <pavel@ucw.cz> wrote:

> On Wed 2019-06-26 11:56:14, Daniel Thompson wrote:
> > On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:
> > > I would like to deprecate the old prefix in the future after
> communicating
> > > with all chip customers, which is why the old prefix is not documented
> in
> > > the new bindings.
> >
> > Deprecation is fine (by me at least) it's just that I'm not sure that
> > removing the documentation for the deprecated bindings is the right way
> > to do it. What is the prior art here?
>
> I believe we should keep the docs.
>
>                                                                 Pavel
>

--00000000000016bf57058c3b4dba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Is there a standard way to format to-be-deprecated items =
in the bindings?<div dir=3D"auto"><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 26, 2019, 10:56 AM =
Pavel Machek &lt;<a href=3D"mailto:pavel@ucw.cz">pavel@ucw.cz</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Wed 2019-06-26 11:56:14, Danie=
l Thompson wrote:<br>
&gt; On Tue, Jun 25, 2019 at 07:44:06AM -0400, Brian Dodge wrote:<br>
&gt; &gt; I would like to deprecate the old prefix in the future after comm=
unicating<br>
&gt; &gt; with all chip customers, which is why the old prefix is not docum=
ented in<br>
&gt; &gt; the new bindings.<br>
&gt; <br>
&gt; Deprecation is fine (by me at least) it&#39;s just that I&#39;m not su=
re that<br>
&gt; removing the documentation for the deprecated bindings is the right wa=
y<br>
&gt; to do it. What is the prior art here?<br>
<br>
I believe we should keep the docs.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Pavel<br>
</blockquote></div>

--00000000000016bf57058c3b4dba--

--===============2112663020==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2112663020==--
