Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31770B3DA9D
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:03:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 851AC10E37C;
	Mon,  1 Sep 2025 07:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GhrJ62Fk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F6B10E0C6
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 17:15:43 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e96e45e47daso2398932276.3
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756660543; x=1757265343; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yT6DmHgcuRShj8hMbSm6QJ3m1mrz3Tm3KlSksR1Ir8c=;
 b=GhrJ62FkOyiGaOkTQGd2FrYim2ipDCKbD1vK9+p7NrkCIjjDUAHK2a02CrzQASgPGL
 ty+ZcrvGkmSOmFgek6zi7HAuzigMFK6JMOATZxSf0sAz+JLdWKT/e8TDQzlDUV/7IWFc
 jw8lA9SQOuj/Vc2NGH/AaN/RuCxQZNI5zdJCRNQtqRrjhNFY49HggvPay2wAuUgKSl/+
 Pa5ZuQwNjhZFry/oupHuQ1ic0MBAIpBSfg93Bm2Nr8sQUYkdSsBkNn0Pq63P0aAmQ6eV
 o/t0XKhsMEPt0qbHxWVlXHzVAZHK6t/Hh4itJCzBRNy7S0PobXDt6ctcLGx6iP4CsfOm
 mC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756660543; x=1757265343;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yT6DmHgcuRShj8hMbSm6QJ3m1mrz3Tm3KlSksR1Ir8c=;
 b=tXIKqqqqO7R34jLZqV55IucWwUrAQPUoVmvXE6IaWzE/lZNmKcnD8W+W2ldAKXrgaG
 Fhvva4hWSkicNsJZBBnzv0y4e686eEtzviUzq0tzAholTIdUpnvpNfHEMj+oWd8lOAnx
 EfIGPvqqJ8f6Zao3mFh9ZOiIwtc0TAj4Iam7YueT+lehxWOm+qNPEawmxhB03nDsu6+4
 5vvF+sqIWxv9AUZ/MCL4MfN3euHBDIWVdldgUcyaQ2LK6xDF+uPH23sUkhVqxWq6WwO7
 x9IkBH4kRNm1qfVBx2HkKgE3C7WeQslgJzV2PD55Y8KqIiSL94Y5MR7ck1/Ns3jPgYcm
 GjeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMNajJXvsKC2JF3v+GyVf4aSa3nFgi5nZJRlu5sSDbSl8e3G8Lhfeh3L5LDz528m2c/ecjdheWGBI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+taAOC86LSjfkOh8qFhziE4wUbWV6DD5WW6WTkUAiVOPTSEiL
 XnLFQTlVFxCpOrqyAl0LKUbAWcrlAVv7Z6pcUh8kdUlwBbZkK5rdKEhvkH8USTh0NRx2YfzcYxq
 BTsmhElcDCeLexJ42XSNnKyGmiPKwDCc=
X-Gm-Gg: ASbGncsLxB+FQOMFyN5+lmRDXNkreA8ON/JXIrdNEWemMev6eqdVaccymzKmAKHPxiF
 U6NHbJOsdLQNnhJbcHyt7JXEMnFNpiUvAFCU0oulmJlJEpUtj197rlfR5IPeSKAsN6Yw2imzng3
 jT/W+DkcJYPh492ijMdj2ZxhQ9JHAlgV4kBSR2HolR0aGWOU9Eu7jKrh8S34tFsAB67XtxIOcKu
 yp20nHejqEfNIRAkEo8tJoVUUAWPCljR9CyoIseGw==
X-Google-Smtp-Source: AGHT+IF9QsF4Gg5QIJiPzEyXVcPuMNLHMDcGOOCW+e09+hT5m8fiz+bO3NotbFN5TU1MIwkXI4urvT6IZLY1Walyg/c=
X-Received: by 2002:a05:690c:a059:b0:721:1fda:e316 with SMTP id
 00721157ae682-7227650069fmr49276357b3.29.1756660542561; Sun, 31 Aug 2025
 10:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250831141522.7813-1-mohin24khertz@gmail.com>
 <72852085-9f20-48b8-b51a-c41df915bff0@infradead.org>
In-Reply-To: <72852085-9f20-48b8-b51a-c41df915bff0@infradead.org>
From: Mohin Nadaf <mohin24khertz@gmail.com>
Date: Sun, 31 Aug 2025 22:45:04 +0530
X-Gm-Features: Ac12FXzCQHWbb82H_COPeWTws5eH53kwUEK3JhvTG5DLubSeK4BAOy0feWzhJVg
Message-ID: <CAHTVRczWCe9opsNr9w-xobzUYjpWEhHNY1BEnt3DBfganwik=Q@mail.gmail.com>
Subject: Re: [PATCH] docs: gpu: fix spelling error in drm-uapi.rst
To: Randy Dunlap <rdunlap@infradead.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev
Content-Type: multipart/alternative; boundary="000000000000a15ff7063dac67a0"
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

--000000000000a15ff7063dac67a0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for pointing this out, Randy. I have checked the lore link and
confirmed that the same typo fix was already submitted on Aug 21st. I
apologize for the duplicate submission. I should have checked recent
patches before sending. I will verify existing patches in git log and
lore.kernel.org before submitting future patches.

Regards,
Mohin Nadaf

On Sun, Aug 31, 2025 at 10:05=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:

>
>
> On 8/31/25 7:15 AM, mohin24khertz@gmail.com wrote:
> > From: Mohin Nadaf <mohin24khertz@gmail.com>
> >
> > Fix typo 'unpriviledged' -> 'unprivileged' in DRM UAPI
> > documentation describing error codes for operations
> > requiring elevated privileges.
> >
> > Signed-off-by: Mohin Nadaf <mohin24khertz@gmail.com>
> > ---
> >  Documentation/gpu/drm-uapi.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst
> b/Documentation/gpu/drm-uapi.rst
> > index 843facf01b2d..7435664a1ffe 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -535,7 +535,7 @@ ENOSPC:
> >  EPERM/EACCES:
> >          Returned for an operation that is valid, but needs more
> privileges.
> >          E.g. root-only or much more common, DRM master-only operations
> return
> > -        this when called by unpriviledged clients. There's no clear
> > +        this when called by unprivileged clients. There's no clear
> >          difference between EACCES and EPERM.
> >
> >  ENODEV:
>
> Hi,
>
> There was a patch for this on Aug. 21, 2025, but I don't know if it has
> been
> applied/merged anywhere yet.  It could be in one of the DRM git trees --
> I don't know.
>
> https://gitlab.freedesktop.org/drm/misc/kernel.git
> or
> https://gitlab.freedesktop.org/drm/kernel.git
>
>
> https://lore.kernel.org/all/20250821025957.22546-3-rakuram.e96@gmail.com/
>
> thanks.
> --
> ~Randy
>
>

--000000000000a15ff7063dac67a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for pointing this out, Randy. I have checked the=
 lore link and confirmed that the same typo fix was already submitted on Au=
g 21st. I apologize for the duplicate submission. I should have checked rec=
ent patches before sending. I will verify existing patches in git log and <=
a href=3D"http://lore.kernel.org">lore.kernel.org</a> before submitting fut=
ure patches. <br><br>Regards, <br>Mohin Nadaf</div><br><div class=3D"gmail_=
quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, =
Aug 31, 2025 at 10:05=E2=80=AFPM Randy Dunlap &lt;<a href=3D"mailto:rdunlap=
@infradead.org">rdunlap@infradead.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/31/25 7:15 AM, <a href=3D"mailto:mohin24khertz@gmail.com" target=3D"_b=
lank">mohin24khertz@gmail.com</a> wrote:<br>
&gt; From: Mohin Nadaf &lt;<a href=3D"mailto:mohin24khertz@gmail.com" targe=
t=3D"_blank">mohin24khertz@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Fix typo &#39;unpriviledged&#39; -&gt; &#39;unprivileged&#39; in DRM U=
API<br>
&gt; documentation describing error codes for operations<br>
&gt; requiring elevated privileges.<br>
&gt; <br>
&gt; Signed-off-by: Mohin Nadaf &lt;<a href=3D"mailto:mohin24khertz@gmail.c=
om" target=3D"_blank">mohin24khertz@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/gpu/drm-uapi.rst | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-ua=
pi.rst<br>
&gt; index 843facf01b2d..7435664a1ffe 100644<br>
&gt; --- a/Documentation/gpu/drm-uapi.rst<br>
&gt; +++ b/Documentation/gpu/drm-uapi.rst<br>
&gt; @@ -535,7 +535,7 @@ ENOSPC:<br>
&gt;=C2=A0 EPERM/EACCES:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Returned for an operation that is va=
lid, but needs more privileges.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E.g. root-only or much more common, =
DRM master-only operations return<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 this when called by unpriviledged clients=
. There&#39;s no clear<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 this when called by unprivileged clients.=
 There&#39;s no clear<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 difference between EACCES and EPERM.=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ENODEV:<br>
<br>
Hi,<br>
<br>
There was a patch for this on Aug. 21, 2025, but I don&#39;t know if it has=
 been<br>
applied/merged anywhere yet.=C2=A0 It could be in one of the DRM git trees =
--<br>
I don&#39;t know.<br>
<br>
<a href=3D"https://gitlab.freedesktop.org/drm/misc/kernel.git" rel=3D"noref=
errer" target=3D"_blank">https://gitlab.freedesktop.org/drm/misc/kernel.git=
</a><br>
or<br>
<a href=3D"https://gitlab.freedesktop.org/drm/kernel.git" rel=3D"noreferrer=
" target=3D"_blank">https://gitlab.freedesktop.org/drm/kernel.git</a><br>
<br>
<br>
<a href=3D"https://lore.kernel.org/all/20250821025957.22546-3-rakuram.e96@g=
mail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/all=
/20250821025957.22546-3-rakuram.e96@gmail.com/</a><br>
<br>
thanks.<br>
-- <br>
~Randy<br>
<br>
</blockquote></div>

--000000000000a15ff7063dac67a0--
