Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D649AC2D5A
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 06:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2489E10E03C;
	Sat, 24 May 2025 04:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JhbRUkyi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB07C10E03C
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 04:43:27 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-601ab204085so2785616a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 21:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748061806; x=1748666606; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=agx7E2tqYg8nlXb6bV1LDAiFCWtjBFaHYYJTfo96xx8=;
 b=JhbRUkyi+RvgmrkwS/zdjdDVcXUmC4TA0nCLy1xTOcto/p3pKuTwDBOG7JrxO1CIQ+
 MHQtR2lJN25dQnW0vKijwqPzsHoP/RgA50eph1EEu/UDpywbW3P8gGIBTWP9BpLSnA0C
 r5YS/vgvddc5yQlzUEsSnQsLXr8AVVq5UqQqg4tDRiPjTvuWWs/QEee6NsuKmaR5WroI
 YrbZG5TRt8JHKgQoLBo8HVg0ECzajJE/m6xZAKQm50d25AWO5yD/aoiu3KatCo52cKss
 Uu8eNUpTKMSyK9vX1wQnP8N1kIHa5YmBqtBoGRJ2tex2+DcZPENYzK6PJAX21G0LM7Cv
 L3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748061806; x=1748666606;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=agx7E2tqYg8nlXb6bV1LDAiFCWtjBFaHYYJTfo96xx8=;
 b=dVYwlWfuvaa7mfIc1mKGdZPtPMSlFhPuiOQ2mjCMXR/sa29/TQ8B4dwIzF8YBoX8rp
 KSCLNE97pEmtjWidSx9hwe+tPHGG03/VdcjeFXKz12sTDKA4/Q7RiLZafGTUsql6Tx04
 QooLn1fDOhUfgcILjgVQoRMVauqs0zjcrW75wN5Zj9VVWhr54TLTzKJZHl3awfKrLnAI
 8LbAnooO609BeqThJ6kleASefcGacXoF2fA36Pjo8md3My4h1xcfer5FJm5kcDSc1+Bq
 lc/ALX9mppjBIy1IaYjn7mCNj3HhKTzqPDiTU6140IvHiHB+eBWrL6riR2As+l7lhEWD
 YRTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxl8mlFhVVnXn/H3vHmZ/oNgTvbT1aw8ovjUR5gBsPD4X15aVeclj4Q31ebC9dZlEIQmmPJhmTMkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzV+uXrUU3klDHQSh0Ss8hj+xbiYXKWWce+2DJuW+CmnXVuPLrR
 Q/8E43CRvslKysX6bCtBcmU5prX5AIhIKU/13hgV4nxvPh7a5+Q17/DUe1KX9baTikZ+J39XlX5
 Heq8XyQrhPtpax56dMpXXvnLCJ0yngrQ=
X-Gm-Gg: ASbGncvtrKzb19sCzj8+k7OSRWnt1j8KZv42aeG/2ZGp5BXSqhGa+s3FC0llsKllHpt
 YbzhXN+Lu4iSE/U80+L253obUWGLh5k1J5dz08EbFmxRXAB1of7WQdcj5oRR/szmcZ3vfRHuMUi
 YiNOXl9GPBtunl922yBOkLFY1PasuTBjWJLotyPiKCuAdDwio3hKatNzhmixb7K9wmz+Q=
X-Google-Smtp-Source: AGHT+IHtn6hcMdK8sScE0cdhr7wy5WiIikSUiiWWgNzIyxJsAZFEFYzM7GD1MNfA6oJCkt6jSD8scBIB1HSEy3+z9K8=
X-Received: by 2002:a17:907:7f86:b0:ad5:4cde:fb97 with SMTP id
 a640c23a62f3a-ad64e8c5edemr470536466b.29.1748061806098; Fri, 23 May 2025
 21:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
 <87ecwfczcw.fsf@trenco.lwn.net>
In-Reply-To: <87ecwfczcw.fsf@trenco.lwn.net>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sat, 24 May 2025 00:43:15 -0400
X-Gm-Features: AX0GCFuseIwL0dXjwT3ewnsdeXuTjEEhveNsAfmz1Jgu77w82_0YH4VFWha-JHY
Message-ID: <CAC0Z3JuJvoHywQ-sMtGRWvmX54-H6EjQbFCNZd4dxjtOGhih3g@mail.gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
To: Jonathan Corbet <corbet@lwn.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="000000000000ff7b480635da5a1a"
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

--000000000000ff7b480635da5a1a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I have added the fixes and sent another version
(v2) of the patch.

https://lore.kernel.org/all/20250523-drm-doc-updates-v2-0-e517df152cf6@gmai=
l.com/

best regards,
Abdulrasaq

On Fri, May 23, 2025 at 7:58=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:

> Abdulrasaq Lawani <abdulrasaqolawani@gmail.com> writes:
>
> > Add an overview diagram of Linux DRM architecture for
> > graphics and compute to introduction.rst
> >
> > ---
> > Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
> > ---
> >  Documentation/gpu/introduction.rst | 38
> +++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 37 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/introduction.rst
> b/Documentation/gpu/introduction.rst
> > index
> 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c5265b1431f=
a18110a7a
> 100644
> > --- a/Documentation/gpu/introduction.rst
> > +++ b/Documentation/gpu/introduction.rst
> > @@ -14,7 +14,43 @@ including the TTM memory manager, output
> configuration and mode setting,
> >  and the new vblank internals, in addition to all the regular features
> >  found in current kernels.
> >
> > -[Insert diagram of typical DRM stack here]
> > +Overview of the Linux DRM Architecture
> > +-----------------------------------------------
> > ++-----------------------------+
> > +|     User-space Apps         |
> > +| (Games, Browsers, ML, etc.) |
> > ++-----------------------------+
>
> [...]
>
> Please actually build the docs after a change like this and look at the
> results; they will not be what you expect here.  You need to put that
> diagram into a literal block.
>
> Thanks,
>
> jon
>

--000000000000ff7b480635da5a1a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks for the feedback. I have added the fixes and s=
ent another version (v2) of the patch.=C2=A0</div><div><br></div><div><a hr=
ef=3D"https://lore.kernel.org/all/20250523-drm-doc-updates-v2-0-e517df152cf=
6@gmail.com/">https://lore.kernel.org/all/20250523-drm-doc-updates-v2-0-e51=
7df152cf6@gmail.com/</a></div><div><br></div><div>best regards,</div><div>A=
bdulrasaq</div></div><br><div class=3D"gmail_quote gmail_quote_container"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 23, 2025 at 7:58=E2=80=AFA=
M Jonathan Corbet &lt;<a href=3D"mailto:corbet@lwn.net">corbet@lwn.net</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Abdul=
rasaq Lawani &lt;<a href=3D"mailto:abdulrasaqolawani@gmail.com" target=3D"_=
blank">abdulrasaqolawani@gmail.com</a>&gt; writes:<br>
<br>
&gt; Add an overview diagram of Linux DRM architecture for<br>
&gt; graphics and compute to introduction.rst<br>
&gt;<br>
&gt; ---<br>
&gt; Signed-off-by: Abdulrasaq Lawani &lt;<a href=3D"mailto:abdulrasaqolawa=
ni@gmail.com" target=3D"_blank">abdulrasaqolawani@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/gpu/introduction.rst | 38 ++++++++++++++++++++++++=
+++++++++++++-<br>
&gt;=C2=A0 1 file changed, 37 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/in=
troduction.rst<br>
&gt; index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c5=
265b1431fa18110a7a 100644<br>
&gt; --- a/Documentation/gpu/introduction.rst<br>
&gt; +++ b/Documentation/gpu/introduction.rst<br>
&gt; @@ -14,7 +14,43 @@ including the TTM memory manager, output configurat=
ion and mode setting,<br>
&gt;=C2=A0 and the new vblank internals, in addition to all the regular fea=
tures<br>
&gt;=C2=A0 found in current kernels.<br>
&gt;=C2=A0 <br>
&gt; -[Insert diagram of typical DRM stack here]<br>
&gt; +Overview of the Linux DRM Architecture<br>
&gt; +-----------------------------------------------<br>
&gt; ++-----------------------------+<br>
&gt; +|=C2=A0 =C2=A0 =C2=A0User-space Apps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
&gt; +| (Games, Browsers, ML, etc.) |<br>
&gt; ++-----------------------------+<br>
<br>
[...]<br>
<br>
Please actually build the docs after a change like this and look at the<br>
results; they will not be what you expect here.=C2=A0 You need to put that<=
br>
diagram into a literal block.<br>
<br>
Thanks,<br>
<br>
jon<br>
</blockquote></div>

--000000000000ff7b480635da5a1a--
