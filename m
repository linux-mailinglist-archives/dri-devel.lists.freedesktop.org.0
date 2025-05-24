Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE18AC3097
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 19:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3534710E03F;
	Sat, 24 May 2025 17:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CCO1YO9L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC5BE10E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:30:03 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-ad572ba1347so136588066b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748107802; x=1748712602; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=00TehUiWPWLPM89rC0BU0IUyhYAhGxPyi+BBsh4A3zI=;
 b=CCO1YO9LdmQPf9DfX0y7xEDw+go0BUZODT5OPklQWBNFuR8Atu2RuB7/38dyGGNjrC
 qjY3373WKmbVo9uxVg7qVAx4jj5EhJfonCDl9irK7JxEFMYHWFOxWdWWH9EQVFPomMD/
 /j0o9ZBpX4w8rHz7ccStfoxUvfMWBNnV0MoVzFSwLuAG0zzmMv6jFEX4PVGCX8DCaPwc
 GcNcGzmw058yN9ZFsIiLnzHdT58uFJewXb4XYRk2ECcU1QE7Vu9My/y8/AtB+BMNusje
 WtU4y/7nUyFUEvVmE4RtkYbi0PDSnEaFmFULq0vlFdu37rLxgq7eLpyuyzvLPgpzSSXF
 CGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748107802; x=1748712602;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00TehUiWPWLPM89rC0BU0IUyhYAhGxPyi+BBsh4A3zI=;
 b=VSDbvInMvtE7ngtSF0IO0uYeEZGWiRkVtL5P1k9A39qHufiu30N0kt3K5uPhEDf4LU
 AzNWqfcPl51c268FhVr36mSDCdEJoC72+TZY35BrapqBJTrSgXH5cXkbMQpVMjwCLYUF
 uCupjIP3HhZmYRfW0PSQEHlvlDWjakvrq9A8K0pBikzh0P32NDd5jVSeBmq/3isOsGo1
 IR4gzSJkftWllm27YJZKB5JXMSu2GRy1T6LdAE/pwrcZnhCo04STymzuPJRpgPYZlbwZ
 +j6tibTdMxTEER9Y/Qsyp8q96BNZFuMWJBS5O4+IZZNyygdQcu1k3g85QnTTGWsHnnoe
 Ljgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUY1lLyHZeyzQzNfRnzKgKwzJBmD1O9T1oLubFTItMhbtTygxLgjMi5vdo3Nnp3VXKaY+lxO1Xd3D0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKpIYVzQPI9mBDv4vLhYR2+a05eVWlhIW56v+5d4zaMEJMNKMB
 L7RpIdgsdHaJ9j47nMgTMNnAbEEmI62d4zLNh3njgT/9w/dCKoP7R5H99aYoD1RTihEKFkV1Sl4
 Lgq3h60MWc+VS53CmnTYodoAJ57hDPuk=
X-Gm-Gg: ASbGncsfsNt16awM03BvEztIp61WW4bDrFVdiMJv8OimVs/OClu/TgwQbmvr7IebU0R
 LNIrHhRy10fIoLBMjrpXgET7V/XyzrK576TDQSABG4qp99CH35r9YipxXXYJYMrJnFVKhTu2cGJ
 LPxln/j4zy28/f9OK/OGampPFTYcYichEpXK2/VUAxvdJdEXsn5GoRjGbxdABJO0ainiBR8foFm
 0Nf
X-Google-Smtp-Source: AGHT+IG0bDCgVCiT9TzEB80VKtaQCi3qcKa+d4iU+xMYpTm7F6x8ZYtyKjxyTBX1cXyjxCgokVqu0EV4e2TpeseGJ34=
X-Received: by 2002:a17:907:2cc4:b0:ad8:55d8:38bc with SMTP id
 a640c23a62f3a-ad85b1de6cbmr294064366b.43.1748107801657; Sat, 24 May 2025
 10:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
 <87ecwfczcw.fsf@trenco.lwn.net>
In-Reply-To: <87ecwfczcw.fsf@trenco.lwn.net>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sat, 24 May 2025 13:29:50 -0400
X-Gm-Features: AX0GCFuPI40ylHG9QpDhjWs7Ft0lP1IWaOk51BOvOB6A2s8VqXXDakWz_zC3ero
Message-ID: <CAC0Z3JueSw5S6pE6yUic2m9oLJkdjw_khJ3rkpDcx5C7+jhfpw@mail.gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
To: Jonathan Corbet <corbet@lwn.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000008c07e20635e510cf"
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

--0000000000008c07e20635e510cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I have added the fix and sent another version (v2)
of the patch.

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

--0000000000008c07e20635e510cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the feedback. I have added the fix and sent ano=
ther version (v2) of the patch. <br><br><a href=3D"https://lore.kernel.org/=
all/20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com/">https://lore.ker=
nel.org/all/20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com/</a><br><b=
r>best regards,<br>Abdulrasaq</div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 23, 2025 at =
7:58=E2=80=AFAM Jonathan Corbet &lt;<a href=3D"mailto:corbet@lwn.net">corbe=
t@lwn.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Abdulrasaq Lawani &lt;<a href=3D"mailto:abdulrasaqolawani@gmail.=
com" target=3D"_blank">abdulrasaqolawani@gmail.com</a>&gt; writes:<br>
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

--0000000000008c07e20635e510cf--
