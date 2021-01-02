Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D2C2E8850
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 20:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D61898A8;
	Sat,  2 Jan 2021 19:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1FDF89895;
 Sat,  2 Jan 2021 19:40:23 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id e25so14146190wme.0;
 Sat, 02 Jan 2021 11:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YhH59cUpxM3ar3hFdofPVsQNkrEjDYLFpmjf7Z+Kio8=;
 b=vgAAlPS4yN+iEIaEJndHAj+krPzNqzFNDzRKd7Tj0/b9n9zAKcWUze/M4e24ttPa36
 79WX4x1oZBUNxfStM9lFimxml5LKAGyrGKK/uebEfuqdJ7y2Z6qNFBF5ii7ZVtkMxEIf
 wRS7l8rbMsNaAxxE9COm5biPbm+E/BloLKBcpK/avLoYpSBP7OPSpk4Zqm+1wJU1LBTJ
 iXJ4L2i3Ih37xs79PhmCNHo56+RlrEVNwpY6ptpxlEGt//FIu28yXdgz4mCUsQEp3MJu
 jbR0cy5PaC5LHc/PmKVzH5GnsljKJAJq8QpWxSP6p9ZwBFGbWtHNDav/tzgh7/Ue3rPk
 yhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhH59cUpxM3ar3hFdofPVsQNkrEjDYLFpmjf7Z+Kio8=;
 b=GoX+7i1Rq4dZMLNGWyX/1eALXLjOLXyptyO+9E5w8FkkIpuBvKUYasZgj7eCwKxIeI
 VGc9bZHfKu/SG6ZKSB/9FAjXtCFaScB/jbx2BjNxmhFrSJEf7fkTzSjtpRTpipWxuT4A
 eAgO+Xvh7CCZ7FNsHfsfgflualCSar9HfigRChPS8G9R0e3W2yQF1ZawyTQaf66y16P2
 E/u5v6xPBt/VY2DU70an6GPZ6/Lku2ZRpTSovXmDKQH1x8rLYfPuDDeYn1wzutgskL3J
 X0H5+aivU5fI7YAop16qmHAnoV1QagJfF5w2ao/MlZ3V/hwV4RyDgJdSMrjx/M3OD3lE
 7ZTw==
X-Gm-Message-State: AOAM530TL1ySm69TKK8+FQ0k/yytTLRP3h15eBHtKDz85GI0v+aXiBQg
 xZ2nQ0HfAQhCvyi7C1XjarnuJ+NQl3NnAq8SADM=
X-Google-Smtp-Source: ABdhPJxw+GVCpPi7onqnkHa5jnru+AJ1avElZYfDZ17WBM93oRZh4RELPErrkdUucMDmCjRoPbAZOIvMqtBj7kBI3wA=
X-Received: by 2002:a1c:5410:: with SMTP id i16mr20608175wmb.30.1609616422385; 
 Sat, 02 Jan 2021 11:40:22 -0800 (PST)
MIME-Version: 1.0
References: <20201231205136.11422-1-mario.kleiner.de@gmail.com>
 <CAP+8YyE4H5mL3uj-T4uG0nz75XmgaZ6etXX6YxxdtO4-rL=5qA@mail.gmail.com>
 <CAEsyxyiLrpB872LdAW8-HMVC-rxf7YF8K+B51Ae9nyEvGaG1Sw@mail.gmail.com>
 <CAP+8YyHcUt0Rv_0ov5DCcm+wxeQFCqiW1vC_Pe4TdKzRzmu3fw@mail.gmail.com>
 <CAEsyxyiRNz8GRfM1hAxzVHAFwYzkyiM6OTvvjOAHtQCoCyhRjg@mail.gmail.com>
 <CAKb7UvhTtJ_w65ESmvb216Nf=YyQ7=3_HjXtoGTNP1azqVeo4A@mail.gmail.com>
In-Reply-To: <CAKb7UvhTtJ_w65ESmvb216Nf=YyQ7=3_HjXtoGTNP1azqVeo4A@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Sat, 2 Jan 2021 20:40:11 +0100
Message-ID: <CAEsyxyiKetNtMZboEaMGOMGiNk=r-66U=tAgi5hf7Ja6VAz0iA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflipping for XOrg in Linux 5.11+
To: Ilia Mirkin <imirkin@alum.mit.edu>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1515801221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1515801221==
Content-Type: multipart/alternative; boundary="00000000000014bc5905b7f00748"

--00000000000014bc5905b7f00748
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 2, 2021 at 7:51 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> On Sat, Jan 2, 2021 at 1:35 PM Mario Kleiner <mario.kleiner.de@gmail.com>
> wrote:
> > I'm less sure about nouveau. It uses modifiers, but has atomic support
> > only on nv50+ and that atomic support is off by default -- needs a
> > nouveau.nouveau_atomic=1 boot parameter to switch it on. It seems to
> > enable modifier support unconditionally regardless if atomic or not,
> > see:
> >
> https://elixir.bootlin.com/linux/v5.11-rc1/source/drivers/gpu/drm/nouveau/nouveau_display.c#L703
> >
> > Atm. nouveau doesn't assign a new format_info though, so wouldn't
> > trigger this issue atm.
>
> Note that pre-nv50, no modifiers exist. Also,
> drm_drv_uses_atomic_modeset() doesn't care whether the client is an
> atomic client or not. It will return true for nv50+ no matter what.
> nouveau_atomic=1 affects whether atomic UAPI is exposed. Not sure if
> this impacts your discussion.
>
>
Thanks Ilia. So nouveau is fine in any case, as nv50 => modifiers and
atomic commit even if atomic UAPI is off. Also
drm_drv_uses_atomic_modeset() is the right choice, as my patch should check
if the atomic driver uses atomic commit, it doesn't care about atomic UAPI
or the client being atomic.

-mario

--00000000000014bc5905b7f00748
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Jan 2, 2021 at 7:51 PM Ilia Mirki=
n &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Sat, Jan 2, 2021 at 1:35 PM Mario Kleiner &lt;<a href=
=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.kleiner.de@g=
mail.com</a>&gt; wrote:<br>
&gt; I&#39;m less sure about nouveau. It uses modifiers, but has atomic sup=
port<br>
&gt; only on nv50+ and that atomic support is off by default -- needs a<br>
&gt; nouveau.nouveau_atomic=3D1 boot parameter to switch it on. It seems to=
<br>
&gt; enable modifier support unconditionally regardless if atomic or not,<b=
r>
&gt; see:<br>
&gt; <a href=3D"https://elixir.bootlin.com/linux/v5.11-rc1/source/drivers/g=
pu/drm/nouveau/nouveau_display.c#L703" rel=3D"noreferrer" target=3D"_blank"=
>https://elixir.bootlin.com/linux/v5.11-rc1/source/drivers/gpu/drm/nouveau/=
nouveau_display.c#L703</a><br>
&gt;<br>
&gt; Atm. nouveau doesn&#39;t assign a new format_info though, so wouldn&#3=
9;t<br>
&gt; trigger this issue atm.<br>
<br>
Note that pre-nv50, no modifiers exist. Also,<br>
drm_drv_uses_atomic_modeset() doesn&#39;t care whether the client is an<br>
atomic client or not. It will return true for nv50+ no matter what.<br>
nouveau_atomic=3D1 affects whether atomic UAPI is exposed. Not sure if<br>
this impacts your discussion.<br>
<br></blockquote><div><br></div><div>Thanks Ilia. So nouveau is fine in any=
 case, as nv50 =3D&gt; modifiers and atomic commit even if atomic UAPI is o=
ff. Also drm_drv_uses_atomic_modeset() is the right choice, as my patch sho=
uld check if the atomic driver uses atomic commit, it doesn&#39;t care abou=
t atomic UAPI or the client being atomic.</div><div><br></div><div>-mario</=
div><div>=C2=A0</div></div></div>

--00000000000014bc5905b7f00748--

--===============1515801221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1515801221==--
