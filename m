Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4150AC3099
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 19:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A3C10E0D9;
	Sat, 24 May 2025 17:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hU41fjwd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8938C10E0D9
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 17:31:56 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso127884066b.1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 May 2025 10:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748107915; x=1748712715; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3muuOBomqmGYsR3+RjrO2qpG6zVTerFKINZi/3mhwco=;
 b=hU41fjwd3OBvTh+LsDLAmvulrOwqFwVxvw1g9hewmyKnkVOYSBLVb2Lk/j2mrvQFCI
 u3TUfjIWbPU+udBc+5WLwbKcc5Ip/AUea50Q8/l8/+xDsd29VGt9Qw5/xsyHJ2LI0AkU
 kw7AIdNDQjk3t6zWgXbhSow0dgYukDaQAAV19jVaY4ejtF+QFPS1R7u7nOgPa8R17cf2
 Ei5xZ8yvQYiITQFkd6S+cBiCLd2lur5l8kcW5cHI/t0+1B1BNHKUi2KWAflHbRTfO5p0
 JG6MSyTF5BcSBn5W+dBrJE/KGqnwPCZWrl5Rt45mulZtV9UVXdiyd8xtDNf0MNuvEhsH
 3vKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748107915; x=1748712715;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3muuOBomqmGYsR3+RjrO2qpG6zVTerFKINZi/3mhwco=;
 b=lwDaPWlIvZC9FhuORwuwVyO4GZ/3eF++koiWqgcSuicxEYt+TFa0a4QnpmvMjdm6lT
 smOch09Zlw923c+bZ9HwQRqmn1/2Bpp8J5z4WyYZf+TDwUCe5GWTNSHyNxsX5PzcZfE7
 Sb0RDsM0z0GAgCSLm+BEdqhaHhDyqJ/UmM8gBkKfApks7H2lrevhX8M1wnSsbV9N+5lP
 wp5BVB1Ul3mrYE2vFAiAC5y1LpwCS7+osxQKk3Z3MgaRPZ9YIR0WO/pIVrt8+3I7rgNS
 3Z0dS1fZtrSQoh0Z8IC3D4+/qoLi6htzogDZxdiGm0J9sp/mYzbcaBtAGny0h6qQAmZx
 N/tA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlKcL46BAPYbYPKOjrth9/5shXyPhCNYFecdgsUNsDD0a2R84DUx9aApCQY8gR/k8/fVozL/CCKcE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfwjWyjj+4BIUE3Zsmt9IXXutRERyLwBlp0/P56nUvHJAW5oVH
 bPBjzhJSEvqb73MxI/bKCJDuRfW6l9HKrUfOpnQimFbl2MlrfcPlTBzqY8eV1Jq8pZvCCn+/V1x
 2gh8ifl2OOgm7h3Lm8cyWcI3QE421Fvo=
X-Gm-Gg: ASbGncv3aiJHJlE46iNJkSJvd1yIRK25RngL1/O5LAwhCvfiPHvXrCpoGQU8Je1Az0N
 PKECLCLFHZsdxaeBmEex8zwAhWq4pu0yjq7fcwL83qqFJzqLoh8spOvnsHZmWsd4evAfowPEilo
 KHEOt6zYKLIaOp2RIOxIczE2Qw80Cc6uyyqq//pGtx/S4avj2ggT1qpU9x4of+xNaRLQ==
X-Google-Smtp-Source: AGHT+IGfMObHIIh8iyseaBep38OXAjVgheQo/BFlIdMXk0SRcRvjxZsHf4jOMFtfcI02zh0Jg2RhpiGM7NLp13ukMmQ=
X-Received: by 2002:a17:907:6d0c:b0:ad5:1fe2:d392 with SMTP id
 a640c23a62f3a-ad85b1301ddmr275943466b.29.1748107914868; Sat, 24 May 2025
 10:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
 <87ecwfczcw.fsf@trenco.lwn.net>
In-Reply-To: <87ecwfczcw.fsf@trenco.lwn.net>
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sat, 24 May 2025 13:31:44 -0400
X-Gm-Features: AX0GCFsvuVRCbwa3qHwLnBcM3qoG6voC2UthnHT8INXHMCxDCyBYT3es23WhGe4
Message-ID: <CAC0Z3JtFNJ7eUGG4bSKMSx_kTe0MUfz8GeKpXRCX6_HznEubtA@mail.gmail.com>
Subject: Re: [PATCH] drm: add overview diagram for drm stack
To: Jonathan Corbet <corbet@lwn.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000004b7ebe0635e517ce"
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

--0000000000004b7ebe0635e517ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback. I have added the fix and sent another version (v2)
of the patch.

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

--0000000000004b7ebe0635e517ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Thanks for the feedback. I have adde=
d the fix and sent another version (v2) of the patch.=C2=A0</div><div><br><=
/div><div>best regards,</div><div>Abdulrasaq</div></div><br></div><br><div =
class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, May 23, 2025 at 7:58=E2=80=AFAM Jonathan Corbet &lt;<a href=
=3D"mailto:corbet@lwn.net">corbet@lwn.net</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Abdulrasaq Lawani &lt;<a href=3D"m=
ailto:abdulrasaqolawani@gmail.com" target=3D"_blank">abdulrasaqolawani@gmai=
l.com</a>&gt; writes:<br>
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

--0000000000004b7ebe0635e517ce--
