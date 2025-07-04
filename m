Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9EEAF95E0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 16:45:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D42910E347;
	Fri,  4 Jul 2025 14:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="BDqzQZj/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEEA10E2C0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 14:45:37 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b2c2c762a89so804816a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jul 2025 07:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1751640337; x=1752245137;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A1u882bTZaBlNbQF70fQyh68QKkZjL/9FFzj6TYcNXc=;
 b=BDqzQZj/Ktdsj1MtxpozXtwl4FBVpLupseSPpE1tr9rGeDZQpG1HLzf63apVu48Xlo
 bJVRzbnl6MQAAjGnmAxcSygxM3rdxgGZ5BSPYoEtqZm0UW+ijLlP7SMR4PBitQYEWJWu
 7UB1pjhrNrC4YK4hkoPjzdIqqcWit+uP9xfFqQ0oN4C940E3QD8Pah9XFWXwgafkoXcC
 AW4/5tJRrSkvLoOs77tsJzhxSKDJaQxXPvLazzywfs4IrNOnb2a8MUoI1Gm6bYA/i4wg
 XgQlQ8w3m7+tpHNkTppikZLLlrWWb86+aN8QKV4JezVs9R9+h/BESfRf2606kTIuLQDF
 xbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751640337; x=1752245137;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A1u882bTZaBlNbQF70fQyh68QKkZjL/9FFzj6TYcNXc=;
 b=WVcTRJNCqUoV5Eaav2gztB206+XQNp7MOmWFEK7HkmNCuK4YEelfHbDq8CboUDY7aT
 2DbcWyyIgkzX7zDMb05VL782fqF2v4cEArWqkZ+SvwSMeusImEyW1G2yzC1TqCf72Uw5
 BIhlXSrdwRpX+n/e3Eu2POke6kNmif9bETlNGuwaqBSPybW+3VRhEigDwk/rXzKrZm9t
 sUeL5pMTUAlISoSjzeKPcN5PvHV9VTJ4LccWrGcmhcxbYDlTMfZozwAIDeKoyd+/XtBw
 y90Odr+AnC33ad9VjR72kNmqcDCKLfkJkrvH3ZYt3f1Iq41e/ZjDVwRLU5+mrz05ncIM
 gxxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZTA8SvIxTNiHDxN5RVuLQyVu49qEiiC49v3D5wUd1UQ6fqrppizjCsDj6dt4bSE/BLIyp36LJC5E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMMyYUbRVT+zKzHtLRvSUfSoZKZ9maPmpDYKEoTG7isNusvyz3
 nojpsoYll1K6AJEK+oiUFlx2NT+rmE69ave4I5FiqpnNV1V6K+mV/jheMnvtVd9L0zHIxILoHzP
 Vh1+xKUtiNJrwm+6iSk98WaxHeI5EBXQzBQ418G1h4w==
X-Gm-Gg: ASbGncuj3Txoj3OG0MfPBMImPf1bCBNO3VQNaWHdwnidkrH1KWjdcu3U0YLa/Vu6PI5
 TJQ/BxUvIsEiTPitldUk3kEtVMF1k0iRUTex8ysJm0Fs7JoS8NVvho+ybzh3M1sgKB/LkcfasyI
 0AkR42JTD5IfM+XGOCDBFcd0kYzy6yJz+AYU2EDOtZ1A==
X-Google-Smtp-Source: AGHT+IFE+yv591JOXkxuPGYMye16HhEQGCR5VYcxW6mER86RwHIkU9xfNHWggn685H4q9CSnv8VbGDICEAwocpQMumY=
X-Received: by 2002:a17:90b:2e88:b0:2fc:3264:3666 with SMTP id
 98e67ed59e1d1-31aac5644f9mr4591015a91.30.1751640336758; Fri, 04 Jul 2025
 07:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250703223658.1457-1-jajones@nvidia.com>
In-Reply-To: <20250703223658.1457-1-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 4 Jul 2025 10:45:25 -0400
X-Gm-Features: Ac12FXw9T_zBjyFMiMV4zO_jHr6dZUt9iKFeQ3aC8vzlI0jTgJplKjwGyLH3z84
Message-ID: <CAOFGe94OaQ0raM_c-AHsmmNE8WkdMVqvpTDdPaCEJ9d4Xy1uOA@mail.gmail.com>
Subject: Re: [RFC 0/4] Add Format Modifiers for NVIDIA Blackwell chipsets
To: James Jones <jajones@nvidia.com>
Cc: David Airlie <airlied@gmail.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, 
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Content-Type: multipart/alternative; boundary="0000000000000c0d9e06391b8c69"
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

--0000000000000c0d9e06391b8c69
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James Jones <jajones@nvidia.com> wro=
te:

> The layout of bits within the individual tiles (referred to as
> sectors in the DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> changed for some formats starting in Blackwell 2 GPUs. New format
> modifiers are needed to denote the difference and prevent direct
> sharing of these incompatible buffers with older GPUs.
>
> This patch series proposes first adding some helper macros and
> inline functions to drm_fourcc.h to make the NVIDIA block-linear
> format modifiers easier to work with given the proposed solution
> makes them harder to parse, then extending the existing sector type
> field in the parametric format modifier macro
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() by another bit to
> accommodate the new layout type.
>
> There are a few ways the parameteric format modifier definition
> could have been altered to handle the new layouts:
>
> -The GOB Height and Page Kind field has a reserved value that could
>  have been used. However, the GOB height and page kind enums did
>  not change relative to prior chips, so this is sort of a lie.
>  However, this is the least-invasive change.
>
> -An entirely new field could have been added. This seems
>  inappropriate given the presence of an existing appropriate field.
>  The advantage here is it avoids splitting the sector layout field
>  across two bitfields.
>
> The proposed approach is the logically consistent one, but has the
> downside of being the most complex, and that it causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its
> 's' parameter twice. However, I believe the added helper functions
> and macros address the complexity, and I have audited the relevant
> code and do not believe the double evaluation should cause any
> problems in practice.
>

I think we'll converge pretty quickly on the last patch. I'm less sure
about the first 3. While I like the idea of having static inlines for
modifiers that are shared by everybody, we can't actually use them from NVK
because our image layout code is in rust and bindgen can't generate
bindings for inlines so we're going to end up re-typing that all anyway.

Also, I'm not seeing a patch to fix KMS to advertise the correct modifiers.
Were you planning to type that or should I ask Lyude or Ben?

~Faith


> James Jones (4):
>   drm: macros defining fields of NVIDIA modifiers
>   drm: add inline helper funcs for NVIDIA modifiers
>   drm/nouveau: use format modifier helper funcs
>   drm: define NVIDIA DRM format modifiers for GB20x
>
>  drivers/gpu/drm/nouveau/nouveau_display.c |  12 ++-
>  include/uapi/drm/drm_fourcc.h             | 100 ++++++++++++++++++----
>  2 files changed, 92 insertions(+), 20 deletions(-)
>
> --
> 2.49.0
>
>

--0000000000000c0d9e06391b8c69
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Jul 3, 2025 at 6:34=E2=80=AFPM James =
Jones &lt;<a href=3D"mailto:jajones@nvidia.com">jajones@nvidia.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The layou=
t of bits within the individual tiles (referred to as<br>
sectors in the DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)<br>
changed for some formats starting in Blackwell 2 GPUs. New format<br>
modifiers are needed to denote the difference and prevent direct<br>
sharing of these incompatible buffers with older GPUs.<br>
<br>
This patch series proposes first adding some helper macros and<br>
inline functions to drm_fourcc.h to make the NVIDIA block-linear<br>
format modifiers easier to work with given the proposed solution<br>
makes them harder to parse, then extending the existing sector type<br>
field in the parametric format modifier macro<br>
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() by another bit to<br>
accommodate the new layout type.<br>
<br>
There are a few ways the parameteric format modifier definition<br>
could have been altered to handle the new layouts:<br>
<br>
-The GOB Height and Page Kind field has a reserved value that could<br>
=C2=A0have been used. However, the GOB height and page kind enums did<br>
=C2=A0not change relative to prior chips, so this is sort of a lie.<br>
=C2=A0However, this is the least-invasive change.<br>
<br>
-An entirely new field could have been added. This seems<br>
=C2=A0inappropriate given the presence of an existing appropriate field.<br=
>
=C2=A0The advantage here is it avoids splitting the sector layout field<br>
=C2=A0across two bitfields.<br>
<br>
The proposed approach is the logically consistent one, but has the<br>
downside of being the most complex, and that it causes the<br>
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to evaluate its<br>
&#39;s&#39; parameter twice. However, I believe the added helper functions<=
br>
and macros address the complexity, and I have audited the relevant<br>
code and do not believe the double evaluation should cause any<br>
problems in practice.<br></blockquote><div><br></div><div>I think we&#39;ll=
 converge pretty quickly on the last patch. I&#39;m less sure about the fir=
st 3. While I like the idea of having static inlines for modifiers that are=
 shared by everybody, we can&#39;t actually use them from NVK because our i=
mage layout code is in rust and bindgen can&#39;t generate bindings for inl=
ines so we&#39;re going to end up re-typing that all anyway.</div><div><br>=
</div><div>Also, I&#39;m not seeing a patch to fix KMS to advertise the cor=
rect modifiers. Were you planning to type that or should I ask Lyude or Ben=
?</div><div><br></div><div>~Faith</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
James Jones (4):<br>
=C2=A0 drm: macros defining fields of NVIDIA modifiers<br>
=C2=A0 drm: add inline helper funcs for NVIDIA modifiers<br>
=C2=A0 drm/nouveau: use format modifier helper funcs<br>
=C2=A0 drm: define NVIDIA DRM format modifiers for GB20x<br>
<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_display.c |=C2=A0 12 ++-<br>
=C2=A0include/uapi/drm/drm_fourcc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 100 ++++++++++++++++++----<br>
=C2=A02 files changed, 92 insertions(+), 20 deletions(-)<br>
<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div></div>

--0000000000000c0d9e06391b8c69--
