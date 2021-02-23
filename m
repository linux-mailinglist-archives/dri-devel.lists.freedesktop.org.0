Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA23D32231B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 01:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C0D89F97;
	Tue, 23 Feb 2021 00:26:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D9289F92
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 00:26:10 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id a7so15280618iok.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=basnieuwenhuizen.nl; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzRtbCl5Ig4uAvDMrC6pwV2zzQ3A5kDBGhuZrN+504I=;
 b=UMMDONkhdKq6QWIJFdpeF9Y2ty9to5LbR/qmgzAQ14q2/7Y49dzV2+jCnT110Tsqnv
 aDcAiy/GfTmetK+Fy1T6L88OT28mUEHbRjOUxGa9FdZpkqG/iSdZJ8PzISFCUp/hlPz2
 we9WNCE71GDtwyEd640vs0xtJydflgMMnfoNxta01gmsn9Sqbk12Hv65deQo+OnzUO7C
 Pjj0yCpumTUaN+Mp/fKI0ROQlsCl2ELjVYTvzwXDY3nzWQebyn2w5G5L3T+vRduuuob/
 CX6jcmjX6OiVLkMR/J1LHI2q3vfnmcZvkQds/BN1RKGwRdrumqJKqLBB/G+TSdn6cb6l
 wCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzRtbCl5Ig4uAvDMrC6pwV2zzQ3A5kDBGhuZrN+504I=;
 b=JRu9lao01FLbV4Ghg9OlnfyVbg58MN7MK2rNfsBkucdQUSEaFUs7NR4x/D0d2T/s/4
 xuGaQtw54jOyeqqG4rrVNW0V4v7bUp0xsXTQAMh2/oRSVbupps78JznXDtPa11bxT0cq
 mJpDC9vawND78x8D5ZB7CxaWLqK7KR1VvimUq2pspb8OGVxxfe6fUheThath5U73So6g
 8KkxV1/9Ptic6FaEHMK8j+nhk+la6lU7MbutlyqVFJngO1P8L/Qb8/poHl8wveGbsJTb
 jB1baKUl/UNYPrz7s9R+yOteL53c1rJPbiaZPVbDYXG7LT+qdl99JYzFMb+V3EMyPhvo
 w3Og==
X-Gm-Message-State: AOAM5320ZnTNUoRwVKTSYK9qZF+NsN9meV7Hj75NZ7ZQKMGxSRgi9Tpt
 lb7F5EMmoLNf4gR7do2MSmeHODzRAkC//APBReCseQ==
X-Google-Smtp-Source: ABdhPJxGfcoL03kZgdPNPcVj2HgB4NkjrnAsM1gy991MEVFpjebg60Wdm64yNorqMzQk1vo7pclH13UM+IeLx5hGVD8=
X-Received: by 2002:a5d:89c5:: with SMTP id a5mr18406556iot.98.1614039969596; 
 Mon, 22 Feb 2021 16:26:09 -0800 (PST)
MIME-Version: 1.0
References: <1614021931-4386-1-git-send-email-jrdr.linux@gmail.com>
 <32vjVDssCxltB75h5jHin2U3-cvNjmd_HFnRLiKohhbXkTfZea3hw2Knd80SgcHoyIFldMNwqh49t28hMBvta0HeWed1L0q_efLJ8QCgNw8=@emersion.fr>
 <20210222234457.GA36153@24bbad8f3778>
 <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
In-Reply-To: <yHvp7KbQD2pF5dR6krMc_Zuq9a8GxkYSSiIpjBenuiCjwpFmFxpAOpfzhp0DfHQhH2Z3P81-CGpwmmXp0zjifT93vBXXYd5kJsSucQgXFZI=@emersion.fr>
From: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Date: Tue, 23 Feb 2021 01:25:59 +0100
Message-ID: <CAP+8YyGdr0jkf5_K8ofKMzZn5Koy_vkxyKKHkyVDqDz2sWvL_g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/display: initialize the variable 'i'
To: Simon Ser <contact@emersion.fr>
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
Cc: stylon.wang@amd.com, sunpeng.li@amd.com, Bhawanpreet.Lakha@amd.com,
 dri-devel@lists.freedesktop.org, Rodrigo.Siqueira@amd.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, Nathan Chancellor <nathan@kernel.org>,
 airlied@linux.ie, aurabindo.pillai@amd.com,
 Souptick Joarder <jrdr.linux@gmail.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1299328213=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1299328213==
Content-Type: multipart/alternative; boundary="0000000000000a998005bbf5f75f"

--0000000000000a998005bbf5f75f
Content-Type: text/plain; charset="UTF-8"

I think Alex moved to gitlab for his branches

On Tue, Feb 23, 2021, 12:50 AM Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, February 23rd, 2021 at 12:44 AM, Nathan Chancellor <
> nathan@kernel.org> wrote:
>
> > On Mon, Feb 22, 2021 at 11:05:17PM +0000, Simon Ser wrote:
> > > On Monday, February 22nd, 2021 at 8:25 PM, Souptick Joarder <
> jrdr.linux@gmail.com> wrote:
> > >
> > > > >>
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9804:38:
> > > > >> warning: variable 'i' is uninitialized when used here
> > > > >> [-Wuninitialized]
> > > >                            timing  = &edid->detailed_timings[i];
> > > >                                                              ^
> > > >
> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:9714:7:
> > > > note: initialize the variable 'i' to silence this warning
> > > >            int i;
> > > >                 ^
> > > >                  = 0
> > > >    1 warning generated.
> > > >
> > > > Initialize the variable 'i'.
> > >
> > > Hm, I see this variable already initialized in the loop:
> > >
> > >     for (i = 0; i < 4; i++) {
> > >
> > > This is the branch agd5f/drm-next.
> >
> > That is in the
> >
> >       if (amdgpu_dm_connector->dc_sink->sink_signal ==
> SIGNAL_TYPE_DISPLAY_PORT
> >               || amdgpu_dm_connector->dc_sink->sink_signal ==
> SIGNAL_TYPE_EDP) {
> >
> > branch not the
> >
> >       } else if (edid && amdgpu_dm_connector->dc_sink->sink_signal ==
> SIGNAL_TYPE_HDMI_TYPE_A) {
> >
> > branch, where i is indeed used uninitialized like clang complains about.
> >
> > I am not at all familiar with the code so I cannot say if this fix is
> > the proper one but it is definitely a legitimate issue.
>
> I think you have an outdated branch. In my checkout, i is not used in the
> first
> branch, and is initialized in the second one.
>
>
> https://cgit.freedesktop.org/~agd5f/linux/tree/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c?h=drm-next#n9700
>

--0000000000000a998005bbf5f75f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I think Alex moved to gitlab for his branches</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb =
23, 2021, 12:50 AM Simon Ser &lt;<a href=3D"mailto:contact@emersion.fr">con=
tact@emersion.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Tuesday, February 23rd, 2021 at 12:44 AM, Nathan Chancellor &lt;<a href=3D"=
mailto:nathan@kernel.org" target=3D"_blank" rel=3D"noreferrer">nathan@kerne=
l.org</a>&gt; wrote:<br>
<br>
&gt; On Mon, Feb 22, 2021 at 11:05:17PM +0000, Simon Ser wrote:<br>
&gt; &gt; On Monday, February 22nd, 2021 at 8:25 PM, Souptick Joarder &lt;<=
a href=3D"mailto:jrdr.linux@gmail.com" target=3D"_blank" rel=3D"noreferrer"=
>jrdr.linux@gmail.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;&gt; drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amd=
gpu_dm.c:9804:38:<br>
&gt; &gt; &gt; &gt;&gt; warning: variable &#39;i&#39; is uninitialized when=
 used here<br>
&gt; &gt; &gt; &gt;&gt; [-Wuninitialized]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timing=C2=A0 =3D &amp;edid-&gt;detai=
led_timings[i];<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm=
/amdgpu_dm.c:9714:7:<br>
&gt; &gt; &gt; note: initialize the variable &#39;i&#39; to silence this wa=
rning<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =3D 0<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 1 warning generated.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Initialize the variable &#39;i&#39;.<br>
&gt; &gt;<br>
&gt; &gt; Hm, I see this variable already initialized in the loop:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; 4; i++) {<br>
&gt; &gt;<br>
&gt; &gt; This is the branch agd5f/drm-next.<br>
&gt;<br>
&gt; That is in the<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (amdgpu_dm_connector-&gt;dc_sink-&gt;sink=
_signal =3D=3D SIGNAL_TYPE_DISPLAY_PORT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| amdgpu_dm_con=
nector-&gt;dc_sink-&gt;sink_signal =3D=3D SIGNAL_TYPE_EDP) {<br>
&gt;<br>
&gt; branch not the<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (edid &amp;&amp; amdgpu_dm_connect=
or-&gt;dc_sink-&gt;sink_signal =3D=3D SIGNAL_TYPE_HDMI_TYPE_A) {<br>
&gt;<br>
&gt; branch, where i is indeed used uninitialized like clang complains abou=
t.<br>
&gt;<br>
&gt; I am not at all familiar with the code so I cannot say if this fix is<=
br>
&gt; the proper one but it is definitely a legitimate issue.<br>
<br>
I think you have an outdated branch. In my checkout, i is not used in the f=
irst<br>
branch, and is initialized in the second one.<br>
<br>
<a href=3D"https://cgit.freedesktop.org/~agd5f/linux/tree/drivers/gpu/drm/a=
md/display/amdgpu_dm/amdgpu_dm.c?h=3Ddrm-next#n9700" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">https://cgit.freedesktop.org/~agd5f/linux/tree/dr=
ivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c?h=3Ddrm-next#n9700</a><br>
</blockquote></div>

--0000000000000a998005bbf5f75f--

--===============1299328213==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1299328213==--
