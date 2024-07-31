Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81826943359
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3CA10E658;
	Wed, 31 Jul 2024 15:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dTRdwyhw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4345710E1AB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 08:05:13 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ef2c109eabso70620911fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 01:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722413111; x=1723017911; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5AIBrVWMaILudYSg3LS+y6+xXUKHdVV6FqJ9tnRk/tk=;
 b=dTRdwyhwN3muVwEL8UsvI38IQWWv2QxX5WUKDRC5C/tfBfuKVby/dRptuKebgL5e9c
 u8pTctIsIGCYU3d31CnDI17vSs1rQJsSL3HizGA7hXXP05IV/CjPQNM8a/cxEdUnURxL
 yFlQOiGeH5NAbv7XHtyehEETT3yTbUvAuBR2liUTEz6C0cS3aYDOo3i3ix9jbV+6ATlH
 sqqAxDsRvZxde2cJEtYDqirl+cdLiN2/oNdSiXxQ3jGspMeS4uK6YzryfbFEVZDL3KUW
 otJ1O+36nVGYv3/QtoAMP+0bHBCfDn34A7y/KRRZFyUD0r76XC2yOqVWHDV1a9sNG2L9
 ctPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722413111; x=1723017911;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5AIBrVWMaILudYSg3LS+y6+xXUKHdVV6FqJ9tnRk/tk=;
 b=dBGsFHEKbJGKzxxlEJA0rekMJgj9zfn0hIstqUussHY0vpJ7c4SRTgJWRCWe6QNKM3
 cXN0QQaIGxTAFX3fZSSXTH2MJG1TALup9WVi0l2U3qWIdDLGRWahq9eKUD1oKjH6GHtD
 Fj7kFrG93a1ucBy0gRugLjuzCElshGBXWkgr3pLaGDsLm1PjtwiSfnVV+c/AkQdX40zN
 vzyQ3MmZWtx0siSBDG2DUFy/QwapRCHRsjjPBwcD7677+000UbAOel3Izv6mqwsqM8RR
 NZaQKQQbDdxh/7NJIEGQsXSQ0FBVhDlYVPT7NW5piITbW8di+Pe3fDauncUzcSHTbKJI
 9F4w==
X-Gm-Message-State: AOJu0Yza3lnEmwiDPCzt9EPSMkLbBEfjyJa9y6DHOmGm0kUFhs2f5jQA
 tj6X1oHTOCknP9r7P/4ybLYLhcvXCOu9Kn6rsawnNPMWDxPoXUbxPTjVDU45CLwFMKiLvk9HUPn
 5gfGuAmPi49wItNbFi9TYy6AFn0g=
X-Google-Smtp-Source: AGHT+IHtQBOmuSYaor3TEz9kgid+gSQR/+DkbS4t7jnG7rNL3ADxuHuWXKXArXxb4mxVfNkXZ6u/GsRzR/F7rFXEOq4=
X-Received: by 2002:a2e:a314:0:b0:2ef:2f37:345b with SMTP id
 38308e7fff4ca-2f12ee1b1bbmr89366251fa.30.1722413110801; Wed, 31 Jul 2024
 01:05:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240731073605.9857-1-riyandhiman14@gmail.com>
 <2024073127-babbling-antiquely-22a2@gregkh>
In-Reply-To: <2024073127-babbling-antiquely-22a2@gregkh>
From: Riyan Dhiman <riyandhiman14@gmail.com>
Date: Wed, 31 Jul 2024 13:34:56 +0530
Message-ID: <CAAjz0Qahd96tQEpbWPXiGQ7Frku3sXpKQ6BfTWzqxcf4ApSYEA@mail.gmail.com>
Subject: Re: [PATCH] staging: vme_user: vme_bridge.h: Fix mutex without
 comment warning
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000a03f29061e868d17"
X-Mailman-Approved-At: Wed, 31 Jul 2024 15:30:09 +0000
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

--000000000000a03f29061e868d17
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for reviewing my patch. I received your feedback:
> Are you sure about all of these?  Please document them individually and
> put the proof of that in the changelog text.

I'd like to clarify a few points to ensure I address your concerns
correctly:

1. By "document them individually", do you mean I should submit
separate patches for each mutex documentation change?

2. Regarding the "proof" for the changelog text, could you please elaborate
on what kind of proof you 're looking for? Should I include:
 - References to the code where these mutexes are used?
 - Explanations of the race conditions these mutexes prevent?
 - Citations from the driver's design documentation (if available)?

3. Is there a preferred format or level of detail you'd like to see in the
changelog for each documentation change?

Thank you for your time and assistance.

Regards,
Riyan Dhiman

On Wed, Jul 31, 2024 at 1:14=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:

> On Wed, Jul 31, 2024 at 01:06:05PM +0530, Riyan Dhiman wrote:
> > Adhere to Linux kernel coding style
> >
> > Reported by checkpatch:
> >
> > CHECK: mutex definition without comment
> >
> > Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> > ---
> >  drivers/staging/vme_user/vme_bridge.h | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/vme_user/vme_bridge.h
> b/drivers/staging/vme_user/vme_bridge.h
> > index 9bdc41bb6602..0b1f05944f0d 100644
> > --- a/drivers/staging/vme_user/vme_bridge.h
> > +++ b/drivers/staging/vme_user/vme_bridge.h
> > @@ -28,6 +28,7 @@ struct vme_master_resource {
> >  struct vme_slave_resource {
> >       struct list_head list;
> >       struct vme_bridge *parent;
> > +     /* Locking for VME slave resources */
>
> Are you sure about all of these?  Please document them individually and
> put the proof of that in the changelog text.
>
> thanks,
>
> greg k-h
>

--000000000000a03f29061e868d17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><div>Thank you for r=
eviewing my patch. I received your feedback:</div><div>&gt; Are you sure ab=
out all of these?=C2=A0 Please document them individually and</div>&gt; put=
 the proof of that in the changelog text.<div><br></div><div>I&#39;d like t=
o clarify a few points to ensure I address your concerns correctly:</div><d=
iv><br></div><div>1. By &quot;document them individually&quot;, do you mean=
 I should submit separate=C2=A0patches for each mutex documentation change?=
</div><div><br></div><div>2. Regarding the &quot;proof&quot; for the change=
log text, could you please elaborate on what kind of proof you &#39;re look=
ing for? Should I include:</div><div>=C2=A0- References to the code where t=
hese mutexes are used?</div><div>=C2=A0- Explanations of the race condition=
s these mutexes prevent?</div><div>=C2=A0- Citations from the driver&#39;s =
design documentation (if available)?</div><div><br></div><div>3. Is there a=
 preferred format or level of detail you&#39;d like to see in the changelog=
 for each documentation change?</div><div><br></div><div>Thank you for your=
 time and assistance.</div><div><br></div><div>Regards,</div><div>Riyan Dhi=
man</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Wed, Jul 31, 2024 at 1:14=E2=80=AFPM Greg KH &lt;<a href=3D"mai=
lto:gregkh@linuxfoundation.org">gregkh@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jul 31, 2=
024 at 01:06:05PM +0530, Riyan Dhiman wrote:<br>
&gt; Adhere to Linux kernel coding style<br>
&gt; <br>
&gt; Reported by checkpatch:<br>
&gt; <br>
&gt; CHECK: mutex definition without comment<br>
&gt; <br>
&gt; Signed-off-by: Riyan Dhiman &lt;<a href=3D"mailto:riyandhiman14@gmail.=
com" target=3D"_blank">riyandhiman14@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/staging/vme_user/vme_bridge.h | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/v=
me_user/vme_bridge.h<br>
&gt; index 9bdc41bb6602..0b1f05944f0d 100644<br>
&gt; --- a/drivers/staging/vme_user/vme_bridge.h<br>
&gt; +++ b/drivers/staging/vme_user/vme_bridge.h<br>
&gt; @@ -28,6 +28,7 @@ struct vme_master_resource {<br>
&gt;=C2=A0 struct vme_slave_resource {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head list;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct vme_bridge *parent;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Locking for VME slave resources */<br>
<br>
Are you sure about all of these?=C2=A0 Please document them individually an=
d<br>
put the proof of that in the changelog text.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div></div>

--000000000000a03f29061e868d17--
