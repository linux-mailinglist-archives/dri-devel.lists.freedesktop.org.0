Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B25382B53E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 20:35:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0510E994;
	Thu, 11 Jan 2024 19:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D9C10E97F
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 18:24:26 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a2814fa68eeso475384666b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 10:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704997465; x=1705602265; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P6WSgPM1ELTZG16IIuPU1xuBSMmC0sC2Dw37vhK7RNg=;
 b=hLyKmo2sqHJbWyjYVOSbNJR9Fi1LEola4U2ksdGDRFtGpTnp9da7OhzuZXyt7zK5jC
 3dyPptkz0GuyxIpeQTp3+FSx4HXTsJ+MeJmv7Ffqv/FDMH9Yn5am2ar+gMegBt5w4WZK
 9nb3/2IApqtfwr4uUGhf2lYjVVP3Gs/2bzNY+KkE8LuPEGgsoo14jYKEGrpU2HaRzrWQ
 RDFD2MrDEaLNF+gY7IqVo5mdD6xN9N9DNRKHeHr5wFFORwwjXoNDUi0szkVGGUMqKnvT
 kftBDi/IvuIjcR/rULZAT48H8aRSVsJyb/EaLr5I6nWXUm2GM1+tit6+/dfQGh8K8ASI
 f2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704997465; x=1705602265;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P6WSgPM1ELTZG16IIuPU1xuBSMmC0sC2Dw37vhK7RNg=;
 b=nsEkF1sAiogDTJYptLEHy9YiSkjzptPApooPxVSuw/RBo2W7pcgJ+M80YwQ5OhL3bi
 Vo56Fsl+q7/bOAYzJlPXklhKV+onEvMAP80pzGkCsV2lx2bCp076XkQzMi2/AIlm0HkG
 YGJeaOxhLtMEFtHQx7wh08WYID1QJkgP6soFWhun5VtiHkobOr0femjyiXHRDaT65Kdi
 hQf/o1/moXHgUhU3/JOO16eWuOHODdQWrsqw0aS6RpWEWZQjGUuqAF8DsxMIuvciz1nj
 KgU4XbDk5dyFhuvU5J2Goo3vvjr2/FMg16iw8BReVS9bzzvataE1its0LK2dV38HdEkf
 gmOQ==
X-Gm-Message-State: AOJu0YxfVDK5AzdbXgQdijQKQsFJOP+eMtZdLgSD0mMswSLxAGpVpvQO
 1gmGyM9X/Z0jqM91ii5ztAvb26KFg5i9B4iIhEA=
X-Google-Smtp-Source: AGHT+IF2RXQOM7NqFNJOPpr6UTDsiR7sO21WDZULenaIIe5ErrhxPpJrjHN2yQksxonnUXBTzJDWC+assDE0ZdUmZz0=
X-Received: by 2002:a17:906:2458:b0:a2b:c7df:87e2 with SMTP id
 a24-20020a170906245800b00a2bc7df87e2mr45113ejb.61.1704997465011; Thu, 11 Jan
 2024 10:24:25 -0800 (PST)
MIME-Version: 1.0
References: <20240111165615.27587-1-xaver.hugl@gmail.com>
 <ID9ZgIO-0g8gNMKtaQFJTKRl5uh6UBgKViGwKB8634Pa4d6c8a-EQD4aaTiIbIqkqFiVChj4SLN2Ufs5PEF3F084HHLGn8gK-2-onYXES4g=@emersion.fr>
 <CAFZQkGx0jp2KmCaKOwRqORfAUMwwPkdSPfh_dMegXMu0ax2cyA@mail.gmail.com>
 <984ea5d0-83fe-4739-ab71-e408a5e92d50@igalia.com>
In-Reply-To: <984ea5d0-83fe-4739-ab71-e408a5e92d50@igalia.com>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Thu, 11 Jan 2024 19:24:13 +0100
Message-ID: <CAFZQkGyLjx5NHDSGdLU041kvrDx0SCaV7RfE1xjTe91ZvTb3uw@mail.gmail.com>
Subject: Re: [PATCH] drm: allow IN_FENCE_FD and FB_DAMAGE_CLIPS to be changed
 with async commits
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Content-Type: multipart/alternative; boundary="0000000000003eb854060eafa83d"
X-Mailman-Approved-At: Thu, 11 Jan 2024 19:35:12 +0000
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000003eb854060eafa83d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Great, thank you!

Am Do., 11. Jan. 2024 um 19:05 Uhr schrieb Andr=C3=A9 Almeida <
andrealmeid@igalia.com>:

> Em 11/01/2024 14:59, Xaver Hugl escreveu:
> > Am Do., 11. Jan. 2024 um 18:13 Uhr schrieb Simon Ser
> > <contact@emersion.fr <mailto:contact@emersion.fr>>:
> >
> >     Are we sure that all drivers handle these two props properly with
> async
> >     page-flips? This is a new codepath not taken by the legacy uAPI.
> >
> > I've only tested on amdgpu so far. Afacs the other drivers that would
> need
> > testing / that support atomic and async pageflips are
> > - i915
> > - noueveau (though atomic is disabled by default, so maybe it doesn't
> > matter?)
> > - vc4
> > - atmel-hlcdc
> >
> > The first two I can test, the latter I don't have the hardware for. I
> > don't know if I can
> > extensively test fb_damage_clips either / how I'd even know if it's
> > being applied
> > correctly, but in the worst case I'd expect the driver to not do the
> > optimizations the
> > property allows.
> >
> > As an alternative to this, would it be okay to expose a driver hook for
> > optional
> > driver-specific checks that drm_atomic_set_property can delegate to, an=
d
> > only
> > allow this with the properties and hardware that's been tested? Then mo=
re
> > properties (like cursor position changes on amdgpu) could be easily
> > added later
> > on too.
>
> I'm working on some mechanism to allow overlay planes on amdgpu, and I
> think I can add your needs to it. I'll share in the mailing list when I
> have something more concrete.
>

--0000000000003eb854060eafa83d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Great, thank you!<br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Am Do., 11. Jan. 2024 um 19:05=C2=A0U=
hr schrieb Andr=C3=A9 Almeida &lt;<a href=3D"mailto:andrealmeid@igalia.com"=
>andrealmeid@igalia.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Em 11/01/2024 14:59, Xaver Hugl escreveu:<br>
&gt; Am Do., 11. Jan. 2024 um 18:13=C2=A0Uhr schrieb Simon Ser <br>
&gt; &lt;<a href=3D"mailto:contact@emersion.fr" target=3D"_blank">contact@e=
mersion.fr</a> &lt;mailto:<a href=3D"mailto:contact@emersion.fr" target=3D"=
_blank">contact@emersion.fr</a>&gt;&gt;:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Are we sure that all drivers handle these two props=
 properly with async<br>
&gt;=C2=A0 =C2=A0 =C2=A0page-flips? This is a new codepath not taken by the=
 legacy uAPI.<br>
&gt; <br>
&gt; I&#39;ve only tested on amdgpu so far. Afacs the other drivers that wo=
uld need<br>
&gt; testing / that support atomic and async pageflips are<br>
&gt; - i915<br>
&gt; - noueveau (though atomic is disabled by default, so maybe it doesn&#3=
9;t <br>
&gt; matter?)<br>
&gt; - vc4<br>
&gt; - atmel-hlcdc<br>
&gt; <br>
&gt; The first two I can test, the latter I don&#39;t have the hardware for=
. I <br>
&gt; don&#39;t know if I can<br>
&gt; extensively test fb_damage_clips either / how I&#39;d even know if it&=
#39;s <br>
&gt; being applied<br>
&gt; correctly, but in the worst case I&#39;d expect the driver to not do t=
he <br>
&gt; optimizations the<br>
&gt; property allows.<br>
&gt; <br>
&gt; As an alternative to this, would it be okay to expose a driver hook fo=
r <br>
&gt; optional<br>
&gt; driver-specific checks that drm_atomic_set_property can delegate to, a=
nd <br>
&gt; only<br>
&gt; allow this with the properties and hardware that&#39;s been tested? Th=
en more<br>
&gt; properties (like cursor position changes on amdgpu) could be easily <b=
r>
&gt; added later<br>
&gt; on too.<br>
<br>
I&#39;m working on some mechanism to allow overlay planes on amdgpu, and I =
<br>
think I can add your needs to it. I&#39;ll share in the mailing list when I=
 <br>
have something more concrete.<br>
</blockquote></div>

--0000000000003eb854060eafa83d--
