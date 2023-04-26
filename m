Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E456A6EF7FF
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A325810E0BE;
	Wed, 26 Apr 2023 15:52:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915AE10E03E;
 Wed, 26 Apr 2023 15:52:54 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5058181d58dso12916025a12.1; 
 Wed, 26 Apr 2023 08:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682524371; x=1685116371;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gABdNoBQv2Hrc1pUZTmiVw5F9jBmJV1MMoJgLWi/XZA=;
 b=GqsNl5Twk/99N1s48fkiGv2laOc2hw2OWz2AdePEXbFh8BghOXtEO9aT6XwldkomAE
 llfdRnXwqDzmegbNe9QG70eIWBaMYBKxZ/gSL1YSmqfURVaaumMmkMsMLZSVuSpgpKuQ
 u/IwW3MVAuPv63GeeFBrV9hqqvcqDNa1ScZWaqmmP6wFjzwH1CnTPZC5oIzbYxYdj4mz
 3DIz/BcoCcu5uXPpDX5R1ZIrd4eyL/ntHdeHFdE+wqY6V36EWg2fhi6KoYc3P6e1zgJJ
 smXicZMYa5Uep76U3jjw94S1nynsnggq55sFYtFAzEXq5G8AScwLo5RrkzXG5efDx9hB
 1izQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682524371; x=1685116371;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gABdNoBQv2Hrc1pUZTmiVw5F9jBmJV1MMoJgLWi/XZA=;
 b=baH+gWN/vcchl52/u8dTiFo8vv6f7/DXC4I0qDDX7q+jeFRiIrvHFPZi54NhRPFwhu
 zrbyojARwNPjQtwqxFwYPVErJmX7NKM1bwLsnLb9rhSJvCU5NK/1wqJ9srN+a4Wy/aZ+
 aAFeR2Ok5S+UBvx5q1eluViWwGFXtqfWvqXtZuO/pKEZjwaxxcgHi/wZcu0OFlrKeE83
 yaIEfzG+G6kVIcz2liEE2DA8LnILqVNhz8ERsR5Dz1caanyyjRIjoKBi/jdVIWwA0059
 tyPNnGtCGiABS7ckhG5/xkelF+6oD7yvhObFijo0UfgjApQR5UCHkYYLS4yIVKXauK3c
 iyhg==
X-Gm-Message-State: AAQBX9d/y5jj55O+aVsg5ndKRWQ+wi+VhWp9AOjXloMeffw+oGh2iaeq
 jrVV1MADgGxNH+ze0xcdg9N0AhsiFpfW42n5pEY=
X-Google-Smtp-Source: AKy350YNu6z5amjFs04tWArL/aDQfFIztO3kMVSpoqMhuDZzh04ku7pYeBLdDFxcLPkMMGbLXBw886R27Gu2mpP5X7I=
X-Received: by 2002:a05:6402:890:b0:502:70e9:2c14 with SMTP id
 e16-20020a056402089000b0050270e92c14mr18673423edy.29.1682524370564; Wed, 26
 Apr 2023 08:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230424014324.218531-1-andrealmeid@igalia.com>
 <d7264c5a-29b4-0fb3-153b-673a8a73d635@amd.com>
 <CAAxE2A6Soq28ACV-m1OzG8CA-_VWp+N2wapsABzm2Nda=Qe+yA@mail.gmail.com>
 <784561bb-0937-befc-3774-892d6f6a4318@mailbox.org>
 <CAAxE2A6iuuVA7zjHM8YcTGMpEWuYV=hGRR1YW6W-qXHwAg9w7w@mail.gmail.com>
 <19406ec5-79d6-e9e6-fbdd-eb2f4a872fc4@amd.com>
 <5262c73e-e77c-91f7-e49e-a9c3571e2cc9@mailbox.org>
 <f5bf590a-5d3f-03f2-531c-057cf8760000@amd.com>
 <CAAxE2A4capwpc40F49cgZBC9jJisODqNjTe0cM_pS7si5EkW3g@mail.gmail.com>
 <9087ef09-e617-dcf3-343e-162f79dc3e51@mailbox.org>
In-Reply-To: <9087ef09-e617-dcf3-343e-162f79dc3e51@mailbox.org>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Wed, 26 Apr 2023 11:52:14 -0400
Message-ID: <CAAxE2A7tvs6f_vywBx9J64ZR03_XBVDiYE1OETa-UG7TxNmEiA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark contexts guilty for any reset type
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Type: multipart/alternative; boundary="0000000000006efcb805fa3f3b4a"
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, kernel-dev@igalia.com,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000006efcb805fa3f3b4a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Perhaps I should clarify this. There are GL and Vulkan features that if any
app uses them and its shaders are killed, the next IB will hang. One of
them is Draw Indirect - if a shader is killed before storing the vertex
count and instance count in memory, the next draw will hang with a high
probability. No such app can be allowed to continue executing after a reset=
.

Marek

On Wed, Apr 26, 2023 at 5:51=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@=
mailbox.org>
wrote:

> On 4/25/23 21:11, Marek Ol=C5=A1=C3=A1k wrote:
> > The last 3 comments in this thread contain arguments that are false and
> were specifically pointed out as false 6 comments ago: Soft resets are ju=
st
> as fatal as hard resets. There is nothing better about soft resets. If th=
e
> VRAM is lost completely, that's a different story, and if the hard reset =
is
> 100% unreliable, that's also a different story, but other than those two
> outliers, there is no difference between the two from the user point view=
.
> Both can repeatedly hang if you don't prevent the app that caused the han=
g
> from using the GPU even if the app is not robust. The robustness context
> type doesn't matter here. By definition, no guilty app can continue after=
 a
> reset, and no innocent apps affected by a reset can continue either becau=
se
> those can now hang too. That's how destructive all resets are. Personal
> anecdotes that the soft reset is better are just that, anecdotes.
>
> You're trying to frame the situation as black or white, but reality is
> shades of grey.
>
>
> There's a similar situation with kernel Oopsen: In principle it's not saf=
e
> to continue executing the kernel after it hits an Oops, since it might be
> in an inconsistent state, which could result in any kind of misbehaviour.
> Still, the default behaviour is to continue executing, and in most cases =
it
> turns out fine. Users which cannot accept the residual risk can choose to
> make the kernel panic when it hits an Oops (either via CONFIG_PANIC_ON_OO=
PS
> at build time, or via oops=3Dpanic on the kernel command line). A kernel
> panic means that the machine basically freezes from a user PoV, which wou=
ld
> be worse as the default behaviour for most users (because it would e.g.
> incur a higher risk of losing filesystem data).
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer
>
>

--0000000000006efcb805fa3f3b4a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Perhaps I should clarify this. There are GL and Vulka=
n features that if any app uses them and its shaders are killed, the next I=
B will hang. One of them is Draw Indirect - if a shader is killed before st=
oring the vertex count and instance count in memory, the next draw will han=
g with a high probability. No such app can be allowed to continue executing=
 after a reset.</div><div><br></div><div>Marek</div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 26, 2023 at=
 5:51=E2=80=AFAM Michel D=C3=A4nzer &lt;<a href=3D"mailto:michel.daenzer@ma=
ilbox.org">michel.daenzer@mailbox.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 4/25/23 21:11, Marek Ol=C5=A1=C3=A1=
k wrote:<br>
&gt; The last 3 comments in this thread contain arguments that are false an=
d were specifically pointed out as false 6 comments ago: Soft resets are ju=
st as fatal as hard resets. There is nothing better about soft resets. If t=
he VRAM is lost completely, that&#39;s a different story, and if the hard r=
eset is 100% unreliable, that&#39;s also a different story, but other than =
those two outliers, there is no difference between the two from the user po=
int view. Both can repeatedly hang if you don&#39;t prevent the app that ca=
used the hang from using the GPU even if the app is not robust. The robustn=
ess context type doesn&#39;t matter here. By definition, no guilty app can =
continue after a reset, and no innocent apps affected by a reset can contin=
ue either because those can now hang too. That&#39;s how destructive all re=
sets are. Personal anecdotes that the soft reset is better are just that, a=
necdotes.<br>
<br>
You&#39;re trying to frame the situation as black or white, but reality is =
shades of grey.<br>
<br>
<br>
There&#39;s a similar situation with kernel Oopsen: In principle it&#39;s n=
ot safe to continue executing the kernel after it hits an Oops, since it mi=
ght be in an inconsistent state, which could result in any kind of misbehav=
iour. Still, the default behaviour is to continue executing, and in most ca=
ses it turns out fine. Users which cannot accept the residual risk can choo=
se to make the kernel panic when it hits an Oops (either via CONFIG_PANIC_O=
N_OOPS at build time, or via oops=3Dpanic on the kernel command line). A ke=
rnel panic means that the machine basically freezes from a user PoV, which =
would be worse as the default behaviour for most users (because it would e.=
g. incur a higher risk of losing filesystem data).<br>
<br>
<br>
-- <br>
Earthling Michel D=C3=A4nzer=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http=
s://redhat.com" rel=3D"noreferrer" target=3D"_blank">https://redhat.com</a>=
<br>
Libre software enthusiast=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Mesa and Xwayland developer<br>
<br>
</blockquote></div>

--0000000000006efcb805fa3f3b4a--
