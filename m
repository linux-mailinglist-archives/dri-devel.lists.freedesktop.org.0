Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0E6A0A448
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 15:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7AE10E5A0;
	Sat, 11 Jan 2025 14:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FLwjobUA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF0010E206;
 Sat, 11 Jan 2025 14:47:39 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-71e3005916aso588157a34.2; 
 Sat, 11 Jan 2025 06:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736606798; x=1737211598; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jp5U5y+e8zwr6ox9F7HQoNaTrbe9Mw1FMXpkxXDixdg=;
 b=FLwjobUAGOlBpF8zUB/01gV6ibMd2mk2owl+BIjc1ILVqnnYiGroewsVA0rgmDKmiY
 zURRttHoCnBf6WW3CrLuYjsgCpnaHSiY6n33pFpscGkbUyzm6R6vGuDrcY4RjF7Ly2Lz
 QV8/vHiRt4Eaxhi0pYiUTWmNdRZEDxmYG2gMWfrsFyTYz0huAFe2cNA+OGQvoKEWWbSk
 dov58f3U8ZO4YItEp2+vjwUjv57VngsfaGPmLrNorHTaVu/QritQkne3fOUlZqql9raO
 WhDwNMS38xxHUTO9whPQHzTxbZXtGIufQiHXBiMh8gBIwUVDAEhkc+LbLh5x3YxnQsq4
 AIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736606798; x=1737211598;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jp5U5y+e8zwr6ox9F7HQoNaTrbe9Mw1FMXpkxXDixdg=;
 b=Yiw0T3iEyWJBOoGxJQB5iXYoZNEkftrLRB+EMb8knfumzD98PCtRxcqaslO11z80ij
 mphPRZ/R1gtYO6GaDe8vFO3XpMRXpz4z9JYokU7ND9+g3bl4lBXvAwxmxEDTj/TpNJwl
 ztZMBOagCrh76+MIXT/1fbYgN/7MyRGiKUdcxknFd6MdyUyXXhwbiBCJiBexvZzls4WU
 sw0eRhQHY+EZ3jifmBJ0GUztUhsDvUPREHZvIyb3BJs+FVS0QyuBcsBBs5Usf1dguslW
 t332rRMld6pXmNngszYAbRhAPCSosELZWipeVGVlY0zKKBwwtb/QI4Kk6oAPK6WkBrO2
 7xwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUljfhE4B6ivn6Koei+AWECGUqOjo1Il9lvWlGLnQDd2HzPw8omy11nvMcOgMjIfr7uuKjMAymiTh8=@lists.freedesktop.org,
 AJvYcCUtI/iXnKz4xC5V2gvLJ65w1ezzJuQKgCvLTfAZwRP+6zO/pKOg5PG3GLkU3K94l5F4MnlDbKIm8Z+vL41UEg==@lists.freedesktop.org,
 AJvYcCVLT+C1Ln/cUmWM9YZqcqKreAMzJoej0FNVlJvbGxYBtpPSdPEOgeuocXo/qaaEiLQE36A+zLVjFZZg@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz79pELeMFt7WalfRP2isHAIJQhtkHnAUMATNhwP1F/l8HmRIcr
 Da785yp8fmjmP3jp4YuRF67e1GdnvDXcqaPh2DgDKq2/fitWP7Pq5Of+r189SS86N7TTZLE81H2
 TN0WtQX7Gx6TJqzISdUynjySz49Q=
X-Gm-Gg: ASbGnctwLWbKwEbrXG797PVgVZXAuznbwW757bUcuLqQmjmwTphpWM7/tyOokcLLOzQ
 34vXEkNmx/fZvokC/+TdmOfBKXSPajEVl/ylY
X-Google-Smtp-Source: AGHT+IGzeuLLaubbwhpUioR0zRZXONKE5UMQyXeBY955LXeXLQqVkmoMX572/QfoLvEnA7t10ibLg8CyFn78Yk7e7cI=
X-Received: by 2002:a05:6871:2084:b0:29e:4578:5f74 with SMTP id
 586e51a60fabf-2aa0665bd45mr8307720fac.4.1736606798434; Sat, 11 Jan 2025
 06:46:38 -0800 (PST)
MIME-Version: 1.0
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey>
 <Z3uGjO36tfhQsnfp@dell-wzy> <Z4A7QDtTrU6w2Yhv@intel.com>
 <877c73j64o.fsf@intel.com> <Z4IA6XtXX-e0Du-6@dell-wzy>
In-Reply-To: <Z4IA6XtXX-e0Du-6@dell-wzy>
From: Zhi Wang <zhi.wang.linux@gmail.com>
Date: Sat, 11 Jan 2025 16:46:26 +0200
X-Gm-Features: AbW1kvYzh9lWYSrsuWnwL3vob-gj7oObd820ZhS3KLmgvqkKvtDuNZJ8vfdV6AI
Message-ID: <CAN=xO47iZmQv=6AtrK4ouY7vyU8YV0RRR2VD3HLP2cCTxLTJGA@mail.gmail.com>
Subject: Re: GVT-g status (was: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding)
To: Zhenyu Wang <zhenyuw.linux@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, zhiyuan.lv@intel.com,
 james.y.wu@intel.com, 
 kevin.tian@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000055d934062b6f47d7"
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

--00000000000055d934062b6f47d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am fine with that as well.

Zhenyu Wang <zhenyuw.linux@gmail.com> =E4=BA=8E 2025=E5=B9=B41=E6=9C=8811=
=E6=97=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=887:26=E5=86=99=E9=81=93=EF=BC=
=9A

> On Fri, Jan 10, 2025 at 12:49:27PM +0200, Jani Nikula wrote:
> > On Thu, 09 Jan 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > > On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
> > >> On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert
> wrote:
> > >> > Note: zhenyuw@linux.intel.com's address bounces:
> > >> >
> > >>
> > >> yeah, I've left Intel so can't use that box any more, looks Rodrigo
> hasn't
> > >> queue up my address change patch yet. Rodrigo?
> > >
> > > pushed to drm-intel-next now, although I was assuming this to come
> > > on a gvt pull request...
> > >
> > > what about this patch here? coming in a PR or should I take this
> > > directly at drm-intel-next as well?
> >
> > AFAICT the last gvt-next pull request was more than two years ago and
> > gvt-fixes slightly less than one year ago.
> >
> > There's a single cleanup commit in gvt-next applied two years ago for
> > which there hasn't been a pull request.
> >
> > The GVT github page [1] says, "This repository has been archived by the
> > owner on Oct 3, 2024. It is now read-only." The intel-gvt-dev mailing
> > list [2] appears to be mostly spam.
> >
> > Seems to me something like this would be appropriate:
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 1c3eab5d2b1a..161206fdaf05 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11557,11 +11557,10 @@ F:  drivers/gpio/gpio-tangier.h
> >  INTEL GVT-g DRIVERS (Intel GPU Virtualization)
> >  M:   Zhenyu Wang <zhenyuw.linux@gmail.com>
> >  M:   Zhi Wang <zhi.wang.linux@gmail.com>
> > -L:   intel-gvt-dev@lists.freedesktop.org
> >  L:   intel-gfx@lists.freedesktop.org
> > -S:   Supported
> > +S:   Maintained
> >  W:   https://github.com/intel/gvt-linux/wiki
> > -T:   git https://github.com/intel/gvt-linux.git
> > +T:   git https://gitlab.freedesktop.org/drm/i915/kernel.git
> >  F:   drivers/gpu/drm/i915/gvt/
> >
>
> Looks fine with me.
>
> Acked-by: Zhenyu Wang <zhenyuw.linux@gmail.com>
>
> >  INTEL HID EVENT DRIVER
> >
> > But I don't think it would be far from the truth to have "S: Odd Fixes"
> > either. And the extreme would be to just remove the whole maintainers
> > entry and have it fall back to the i915 entry.
> >
> > Thoughts?
> >
>
> When I left Intel, I have raised similar question to manager or related
> people to see their ideas on how to keep GVT-g maintenance work for
> upstream,
> but I didn't get real answers before my last day at Intel...So still cc
> some
> intel gvt related people to double confirm.
>
> For me, it's fine to remove the maintainer entry maybe only keep as
> reviewer?
>
> Thanks to raise up this issue, Jani!
>

--00000000000055d934062b6f47d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I am fine with that as well. </p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Zhenyu Wang &lt;<a href=3D"mailto:zhenyuw.linux@gmail.com">=
zhenyuw.linux@gmail.com</a>&gt; =E4=BA=8E 2025=E5=B9=B41=E6=9C=8811=E6=97=
=A5=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=887:26=E5=86=99=E9=81=93=EF=BC=9A<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">On Fri, Jan 10, 2025 at 12:49:27PM +02=
00, Jani Nikula wrote:<br>
&gt; On Thu, 09 Jan 2025, Rodrigo Vivi &lt;<a href=3D"mailto:rodrigo.vivi@i=
ntel.com" target=3D"_blank" rel=3D"noreferrer">rodrigo.vivi@intel.com</a>&g=
t; wrote:<br>
&gt; &gt; On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:<br>
&gt; &gt;&gt; On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilb=
ert wrote:<br>
&gt; &gt;&gt; &gt; Note: <a href=3D"mailto:zhenyuw@linux.intel.com" target=
=3D"_blank" rel=3D"noreferrer">zhenyuw@linux.intel.com</a>&#39;s address bo=
unces:<br>
&gt; &gt;&gt; &gt; <br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; yeah, I&#39;ve left Intel so can&#39;t use that box any more,=
 looks Rodrigo hasn&#39;t<br>
&gt; &gt;&gt; queue up my address change patch yet. Rodrigo?<br>
&gt; &gt;<br>
&gt; &gt; pushed to drm-intel-next now, although I was assuming this to com=
e<br>
&gt; &gt; on a gvt pull request...<br>
&gt; &gt;<br>
&gt; &gt; what about this patch here? coming in a PR or should I take this<=
br>
&gt; &gt; directly at drm-intel-next as well?<br>
&gt; <br>
&gt; AFAICT the last gvt-next pull request was more than two years ago and<=
br>
&gt; gvt-fixes slightly less than one year ago.<br>
&gt; <br>
&gt; There&#39;s a single cleanup commit in gvt-next applied two years ago =
for<br>
&gt; which there hasn&#39;t been a pull request.<br>
&gt; <br>
&gt; The GVT github page [1] says, &quot;This repository has been archived =
by the<br>
&gt; owner on Oct 3, 2024. It is now read-only.&quot; The intel-gvt-dev mai=
ling<br>
&gt; list [2] appears to be mostly spam.<br>
&gt; <br>
&gt; Seems to me something like this would be appropriate:<br>
&gt; <br>
&gt; diff --git a/MAINTAINERS b/MAINTAINERS<br>
&gt; index 1c3eab5d2b1a..161206fdaf05 100644<br>
&gt; --- a/MAINTAINERS<br>
&gt; +++ b/MAINTAINERS<br>
&gt; @@ -11557,11 +11557,10 @@ F:=C2=A0 drivers/gpio/gpio-tangier.h<br>
&gt;=C2=A0 INTEL GVT-g DRIVERS (Intel GPU Virtualization)<br>
&gt;=C2=A0 M:=C2=A0 =C2=A0Zhenyu Wang &lt;<a href=3D"mailto:zhenyuw.linux@g=
mail.com" target=3D"_blank" rel=3D"noreferrer">zhenyuw.linux@gmail.com</a>&=
gt;<br>
&gt;=C2=A0 M:=C2=A0 =C2=A0Zhi Wang &lt;<a href=3D"mailto:zhi.wang.linux@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">zhi.wang.linux@gmail.com</a>&g=
t;<br>
&gt; -L:=C2=A0 =C2=A0<a href=3D"mailto:intel-gvt-dev@lists.freedesktop.org"=
 target=3D"_blank" rel=3D"noreferrer">intel-gvt-dev@lists.freedesktop.org</=
a><br>
&gt;=C2=A0 L:=C2=A0 =C2=A0<a href=3D"mailto:intel-gfx@lists.freedesktop.org=
" target=3D"_blank" rel=3D"noreferrer">intel-gfx@lists.freedesktop.org</a><=
br>
&gt; -S:=C2=A0 =C2=A0Supported<br>
&gt; +S:=C2=A0 =C2=A0Maintained<br>
&gt;=C2=A0 W:=C2=A0 =C2=A0<a href=3D"https://github.com/intel/gvt-linux/wik=
i" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/intel=
/gvt-linux/wiki</a><br>
&gt; -T:=C2=A0 =C2=A0git <a href=3D"https://github.com/intel/gvt-linux.git"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/intel/g=
vt-linux.git</a><br>
&gt; +T:=C2=A0 =C2=A0git <a href=3D"https://gitlab.freedesktop.org/drm/i915=
/kernel.git" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab=
.freedesktop.org/drm/i915/kernel.git</a><br>
&gt;=C2=A0 F:=C2=A0 =C2=A0drivers/gpu/drm/i915/gvt/<br>
&gt;<br>
<br>
Looks fine with me.<br>
<br>
Acked-by: Zhenyu Wang &lt;<a href=3D"mailto:zhenyuw.linux@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">zhenyuw.linux@gmail.com</a>&gt;<br>
<br>
&gt;=C2=A0 INTEL HID EVENT DRIVER<br>
&gt; <br>
&gt; But I don&#39;t think it would be far from the truth to have &quot;S: =
Odd Fixes&quot;<br>
&gt; either. And the extreme would be to just remove the whole maintainers<=
br>
&gt; entry and have it fall back to the i915 entry.<br>
&gt; <br>
&gt; Thoughts?<br>
&gt;<br>
<br>
When I left Intel, I have raised similar question to manager or related<br>
people to see their ideas on how to keep GVT-g maintenance work for upstrea=
m,<br>
but I didn&#39;t get real answers before my last day at Intel...So still cc=
 some<br>
intel gvt related people to double confirm.<br>
<br>
For me, it&#39;s fine to remove the maintainer entry maybe only keep as rev=
iewer?<br>
<br>
Thanks to raise up this issue, Jani! <br>
</blockquote></div>

--00000000000055d934062b6f47d7--
