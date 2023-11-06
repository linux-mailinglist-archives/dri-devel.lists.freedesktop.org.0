Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3387E27D7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 15:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABEC810E340;
	Mon,  6 Nov 2023 14:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD1910E340;
 Mon,  6 Nov 2023 14:57:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-544455a4b56so3516749a12.1; 
 Mon, 06 Nov 2023 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699282664; x=1699887464; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ehVrC+1P8e5AEmYrp4ZCeRLJM0fpVHdaJr9KAfopYRg=;
 b=B/LzDqY8OTT47fSVrExD54MR1as60CM1oDLdOL+bSnTrUKSeFfgiJl3ZpzKpG/iSsH
 zkMIQypRCtfYglLZmGUKZAPO0uxBWYhIMDFJZjygF13XADwbuJ60gUsHcrGccT9FJs+2
 i7fyOsO5VBNc3/6h4Zc1pSdqDmwpv4mxW1AzGY/TObNtw4Bs6nZ2BqwjAURfnG6JKM5d
 Jdzj5r23u+mwdVv2pDQGYTfpYRn9n0a9OffKAxUSl3jD/J8tmhWsqf3k10RfBHqVX3D+
 tTxAnAw76R31hncl8qA6V46yd2bG2TCcaacVAh/v6PwIisSfogI+FKTCQbWL3m1ne12P
 Uo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699282664; x=1699887464;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ehVrC+1P8e5AEmYrp4ZCeRLJM0fpVHdaJr9KAfopYRg=;
 b=iv1ZMIaT5ID3soskROheNmF5vUcCet273+iQFBUhB3Q5M5vh0A0pQdDTMCfig6fL9J
 BWZ5CksPObpO7kOzEd1pPirV3z84M8Oulk8cfjxToyiCh2nHoXByjg1A4GVtyf4afYSa
 +QiFgSs8aN4cooM4yIR8OcPWwi0/zrjMGiCMLrI29W26SzzvGMWkFAvfBB6bjRuefgSz
 uiCcoAmiOAXxzWYpmtEn9aWcJ9RBgjLh5Ca+OX7fPPIeMqRWQIj1430SOmVLpt60KpLX
 3ZFTIuhPVyGvkPSPoH7FAXUH1JIGJkXuclUVmuX3p5agx7FHmCQ+mAPW55GujPlhhfjc
 ab8g==
X-Gm-Message-State: AOJu0YzeRfiQTFhEuzI8uVbIiDQqj2e2gicJ+DJZgGQ+QyQWbpIjULV6
 002dSkLZuE1+z3QRouqsobpDOVH2MgG8MysjOSc=
X-Google-Smtp-Source: AGHT+IFyTv/H4PrYKF0fWcdKoQ6kH+86VkYrm/Xp8DktmWlwAYZry8O4lIUBodarPv3n9W8TJWHIIA+ILxbIR7lSfAk=
X-Received: by 2002:a05:6402:299:b0:53f:731a:e513 with SMTP id
 l25-20020a056402029900b0053f731ae513mr22341941edv.25.1699282663498; Mon, 06
 Nov 2023 06:57:43 -0800 (PST)
MIME-Version: 1.0
References: <CAGWvnynOWoKT1EWkL8ELfRVxSUjm-hBQnnjb-w2Gq-tmOFm0Hg@mail.gmail.com>
 <1807db8f-2ba6-0838-1d4c-39ff4cb7a34d@linux.intel.com>
 <uqzfduftpqlq35pdndovsqtmksjpxr5ei2utz45lwjhnsgchxh@grbzyctiig7w>
 <bd34dffe-86ba-bf1a-b12f-33611da0a7ca@linux.intel.com>
 <5lfrhdpkwhpgzipgngojs3tyqfqbesifzu5nf4l5q3nhfdhcf2@25nmiq7tfrew>
In-Reply-To: <5lfrhdpkwhpgzipgngojs3tyqfqbesifzu5nf4l5q3nhfdhcf2@25nmiq7tfrew>
From: David Edelsohn <dje.gcc@gmail.com>
Date: Mon, 6 Nov 2023 09:57:32 -0500
Message-ID: <CAGWvnykNuRg=ryONaSg5-dbP-gngGeOb3Nq1Vfq56M824E3Xdg@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Maxime Ripard <mripard@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000087e66206097d1308"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dim-tools@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--00000000000087e66206097d1308
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 5:55=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:

> On Mon, Nov 06, 2023 at 11:37:34AM +0100, Thomas Hellstr=C3=B6m wrote:
> > On 11/6/23 11:20, Maxime Ripard wrote:
> > > On Mon, Nov 06, 2023 at 11:01:51AM +0100, Thomas Hellstr=C3=B6m wrote=
:
> > > > Hi, David.
> > > >
> > > > On 11/3/23 17:37, David Edelsohn wrote:
> > > > > Dual-license drm_gpuvm to GPL-2.0 OR MIT.
> > > > > diff --git a/drivers/gpu/drm/drm_gpuvm.c
> b/drivers/gpu/drm/drm_gpuvm.c
> > > > > index 02ce6baacdad..08c088319652 100644 ---
> > > > > a/drivers/gpu/drm/drm_gpuvm.c <
> https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.=
c?id=3D6f2eeef4a0aa9791bbba9d353641a6e067bb86c1
> >
> > > > > +++ b/drivers/gpu/drm/drm_gpuvm.c <
> https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.=
c?id=3Df7749a549b4f4db0c02e6b3d3800ea400dd76c12
> >
> > > > > @@ -1,4 +1,4 @@
> > > > > -// SPDX-License-Identifier: GPL-2.0-only
> > > > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > > > /*
> > > > > * Copyright (c) 2022 Red Hat.
> > > > > *
> > > > > The above SPDX License Identifier change is incorrect and no long=
er
> > > > > valid. The change misunderstood the syntax of SPDX license
> identifiers
> > > > > and boolean operations. GPL-2.0-only is the name of the license
> and means
> > > > > GPL 2.0 only, as opposed to GPL 2.0 or later. The "only" does not
> > > > > refer to restrictions on other licenses in the identifier and
> should not
> > > > > have been
> > > > > removed. The hyphens designated that the name was a single unit.
> > > > > The SPDX License Identifier boolean operators, such as OR, are a
> > > > > separate layer
> > > > > of syntax.
> > > > > The SPDX License Identifier should be
> > > > > GPL-2.0-only OR MIT
> > > > > Thanks, David
> > > > The author has acked the change / relicensing, which is also
> described in
> > > > the commit title so could you please elaborate why you think it is
> not
> > > > valid?
> > > I think their point isn't so much about the license itself but rather
> > > the SPDX syntax to express it.
> > >
> > > Maxime
> >
> > Hm. There are a pretty large number of these in drm with the same synta=
x:
> >
> > SPDX-License-Identifier: GPL-2.0 OR MIT
> >
> > So I read it as whe shouldn't have change "Licence A" to "Licence B OR
> > C" but instead should have changed it to "Licence A OR C", hence the
> > *change* (rather than the syntax) would no longer be valid.
> >
> > Perhaps I have had too little coffee this morning.
> >
> > I'd appreciate if David could clarify.
>
> Either way, one of the issue is that GPL-2.0 was deprecated in favour of
> GPL-2.0-only
>
> https://spdx.org/licenses/GPL-2.0.html
>
> So you effectively changed the preferred syntax to the deprecated one in
> the process of adding the new license.
>
> I think that's what David was saying, but there might be something else :=
)
>

Yes, that is what I was trying to express.

And thanks for posting the patch to correct the name of the identifier.
I'm not requesting that all uses of the deprecated identifier be changed in
the Linux kernel, but it would be good to not regress.

Thanks, David

--00000000000087e66206097d1308
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Nov 6, 2023 at 5:55=E2=80=AFAM Ma=
xime Ripard &lt;<a href=3D"mailto:mripard@kernel.org">mripard@kernel.org</a=
>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, Nov 06, 2023 at 11:37:34AM +0100, Thomas He=
llstr=C3=B6m wrote:<br>
&gt; On 11/6/23 11:20, Maxime Ripard wrote:<br>
&gt; &gt; On Mon, Nov 06, 2023 at 11:01:51AM +0100, Thomas Hellstr=C3=B6m w=
rote:<br>
&gt; &gt; &gt; Hi, David.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; On 11/3/23 17:37, David Edelsohn wrote:<br>
&gt; &gt; &gt; &gt; Dual-license drm_gpuvm to GPL-2.0 OR MIT.<br>
&gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/=
drm/drm_gpuvm.c<br>
&gt; &gt; &gt; &gt; index 02ce6baacdad..08c088319652 100644 ---<br>
&gt; &gt; &gt; &gt; a/drivers/gpu/drm/drm_gpuvm.c &lt;<a href=3D"https://cg=
it.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3D6f2ee=
ef4a0aa9791bbba9d353641a6e067bb86c1" rel=3D"noreferrer" target=3D"_blank">h=
ttps://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?i=
d=3D6f2eeef4a0aa9791bbba9d353641a6e067bb86c1</a>&gt;<br>
&gt; &gt; &gt; &gt; +++ b/drivers/gpu/drm/drm_gpuvm.c &lt;<a href=3D"https:=
//cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm.c?id=3Df=
7749a549b4f4db0c02e6b3d3800ea400dd76c12" rel=3D"noreferrer" target=3D"_blan=
k">https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/drm_gpuvm=
.c?id=3Df7749a549b4f4db0c02e6b3d3800ea400dd76c12</a>&gt;<br>
&gt; &gt; &gt; &gt; @@ -1,4 +1,4 @@<br>
&gt; &gt; &gt; &gt; -// SPDX-License-Identifier: GPL-2.0-only<br>
&gt; &gt; &gt; &gt; +// SPDX-License-Identifier: GPL-2.0 OR MIT<br>
&gt; &gt; &gt; &gt; /*<br>
&gt; &gt; &gt; &gt; * Copyright (c) 2022 Red Hat.<br>
&gt; &gt; &gt; &gt; *<br>
&gt; &gt; &gt; &gt; The above SPDX License Identifier change is incorrect a=
nd no longer<br>
&gt; &gt; &gt; &gt; valid. The change misunderstood the syntax of SPDX lice=
nse identifiers<br>
&gt; &gt; &gt; &gt; and boolean operations. GPL-2.0-only is the name of the=
 license and means<br>
&gt; &gt; &gt; &gt; GPL 2.0 only, as opposed to GPL 2.0 or later. The &quot=
;only&quot; does not<br>
&gt; &gt; &gt; &gt; refer to restrictions on other licenses in the identifi=
er and should not<br>
&gt; &gt; &gt; &gt; have been<br>
&gt; &gt; &gt; &gt; removed. The hyphens designated that the name was a sin=
gle unit.<br>
&gt; &gt; &gt; &gt; The SPDX License Identifier boolean operators, such as =
OR, are a<br>
&gt; &gt; &gt; &gt; separate layer<br>
&gt; &gt; &gt; &gt; of syntax.<br>
&gt; &gt; &gt; &gt; The SPDX License Identifier should be<br>
&gt; &gt; &gt; &gt; GPL-2.0-only OR MIT<br>
&gt; &gt; &gt; &gt; Thanks, David<br>
&gt; &gt; &gt; The author has acked the change / relicensing, which is also=
 described in<br>
&gt; &gt; &gt; the commit title so could you please elaborate why you think=
 it is not<br>
&gt; &gt; &gt; valid?<br>
&gt; &gt; I think their point isn&#39;t so much about the license itself bu=
t rather<br>
&gt; &gt; the SPDX syntax to express it.<br>
&gt; &gt; <br>
&gt; &gt; Maxime<br>
&gt; <br>
&gt; Hm. There are a pretty large number of these in drm with the same synt=
ax:<br>
&gt; <br>
&gt; SPDX-License-Identifier: GPL-2.0 OR MIT<br>
&gt; <br>
&gt; So I read it as whe shouldn&#39;t have change &quot;Licence A&quot; to=
 &quot;Licence B OR<br>
&gt; C&quot; but instead should have changed it to &quot;Licence A OR C&quo=
t;, hence the<br>
&gt; *change* (rather than the syntax) would no longer be valid.<br>
&gt; <br>
&gt; Perhaps I have had too little coffee this morning.<br>
&gt; <br>
&gt; I&#39;d appreciate if David could clarify.<br>
<br>
Either way, one of the issue is that GPL-2.0 was deprecated in favour of<br=
>
GPL-2.0-only<br>
<br>
<a href=3D"https://spdx.org/licenses/GPL-2.0.html" rel=3D"noreferrer" targe=
t=3D"_blank">https://spdx.org/licenses/GPL-2.0.html</a><br>
<br>
So you effectively changed the preferred syntax to the deprecated one in<br=
>
the process of adding the new license.<br>
<br>
I think that&#39;s what David was saying, but there might be something else=
 :)<br></blockquote><div><br></div><div>Yes, that is what I was trying to e=
xpress.</div><div><br></div><div>And thanks for posting the patch to correc=
t the name of the identifier.=C2=A0 I&#39;m not requesting that all uses of=
 the deprecated identifier be changed in the Linux kernel, but it would be =
good to not regress.</div><div><br></div><div>Thanks, David</div><div>=C2=
=A0</div></div></div>

--00000000000087e66206097d1308--
