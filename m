Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6D1BE0C5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 17:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DA86EBDF;
	Wed, 25 Sep 2019 15:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D024F6EBDF
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 15:03:12 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a11so7387987wrx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 08:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pg8LaWiacaTb9SzlfpDlMO/cKuqFViUuINy0vykqv5c=;
 b=dQiegNkyKT/F0e3dyptTeM8WjF+vOW3rYXhyLbeQfJLtMx8Mc/Ud0X7dILxh5HrvZ3
 YdBUZefhJMTRtU+NMxYstc31M9U6AeSiwm7oREYQKwlreLPu0Y3t0YE+ec0JcFicSYUP
 KhbsxQw/l1mVg25chRhYt0RFciym/pV2C91CIDXOZW5cAXON70h8YcYCXgcnz/VFTBDU
 qzUsksa0AcgsgSovgfRJV35tEMg8FUqTLmc90Z/GPuG0q1dwVkRinbWJ6v265MoiZ6+e
 b6Pc9QhRA63utcO821bUNUdzis7pNYEFW9dQfMvi6jyEX5vXUtkNaDmv8CuGZnB5TFNO
 YodA==
X-Gm-Message-State: APjAAAXREXXNNiHR6sbbjXLQEaOZbxE/JYkbVLOlXySmq6Vt3f7HNnXn
 62ht991w4zuOAUaNV2IdODdDOGkFHC3uoTx3TlM=
X-Google-Smtp-Source: APXvYqwyR/hxwxMbyDoMgVatJxwHmtz5VghAI94nEJM72hPKvFnVx81/QbJUjIAWpSdYZe37t2YgI6u6ABCv7+YTC1I=
X-Received: by 2002:adf:ef05:: with SMTP id e5mr9568395wro.127.1569423791024; 
 Wed, 25 Sep 2019 08:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
 <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
 <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
 <20190925103909.6yjozclnukkladbo@intel.com>
In-Reply-To: <20190925103909.6yjozclnukkladbo@intel.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Wed, 25 Sep 2019 17:00:31 +0200
Message-ID: <CAEQFVGZCZ6TbdrOP=T_sM09BRUWPhFOw9E33kEoKEMDFHXzgkA@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: Eric Engestrom <eric.engestrom@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pg8LaWiacaTb9SzlfpDlMO/cKuqFViUuINy0vykqv5c=;
 b=JYZvFbW1CE2DWouHK2hIM356WjTucQoPug09b8NHT4XPHwadnS6qCntbGX29Da0jaO
 y5TPSl2fZnmBgDv0OEwHJKXLgBeiDMTmMde5/Y9QAAZt3xkpZ/iRDDoOreX2zkRUbyIt
 blkvKe8dxTRbVqC0ir3okdGBM5oB8HiYcH4t1H6+qspse6sgablFttIewBXXZLTHgzdV
 A1e+Rgl5Px7XCgSDjlaSZdsdE8evdvnAVM+nNw6B0/OLIb6wLM8YtSJYgx8myrKuTuYg
 NkUcdr1RdErZTMu9w0MCkWqtNv5d3BlfzUCtFegos9KyvIeoKctJQiU8JDDlvDNG2awt
 kICw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Eric Anholt <anholt@google.com>,
 Dan Willemsen <dwillemsen@google.com>, Vishal Bhoj <vishal.bhoj@linaro.org>,
 Sean Paul <seanpaul@chromium.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============1321986835=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1321986835==
Content-Type: multipart/alternative; boundary="00000000000090ee11059361f3cf"

--00000000000090ee11059361f3cf
Content-Type: text/plain; charset="UTF-8"

Hello

On Wed, Sep 25, 2019 at 12:39 PM Eric Engestrom <eric.engestrom@intel.com>
wrote:

> On Tuesday, 2019-09-24 23:09:08 -0700, John Stultz wrote:
> > On Tue, Sep 24, 2019 at 4:30 PM John Stultz <john.stultz@linaro.org>
> wrote:
> > > On Tue, Sep 24, 2019 at 3:24 PM Rob Herring <robh@kernel.org> wrote:
> > > > Trying to maintain something that works across more than 3 releases
> or
> > > > so is painful. I don't think android-x86 folks have the bandwidth to
> > > > maintain things older than that *and* update to newer versions. So I
> > > > think only supporting the n latest releases is good.
>

N is not a problem, per se, but if there are non supported Blueprint module
types used
it will not be possible to actually replicate Android.mk build rules to
Android.bp and the build will be missing some targets (for example is not
possible to install prebuilt files to $OUT)


> > > >
> > > > Are .bp files for master/Q compatible back to N (or O)? IIRC, at
> least
> > > > for the first couple of releases with .bp files, they seemed to have
> > > > incompatible changes.
> > >
> > > I think there have possibly been some incompatible changes, as I know
> > > early w/ bp files things were more in flux. That said, there haven't
> > > been many changes to the libdrm bp files since the conversion was
> > > first done in 2017 (so Android O). I'll checkout N and validate so I
> > > can provide a more concrete assurance.
> >
> > Ah. Crud. You're right. The bp syntax has shifted enough over time to
> > cause problems w/ the current file when building against older Android
> > releases.   N falls over pretty hard, and O and even P have issues w/
> > "recovery_available: ", and "prebuilt_etc" syntax.  So my proposed
> > commit message mischaracterizes the state of older builds. Apologies!
>

I confirm that when trying drm_hwcomposer master build with oreo-x86
(Android O based)
I had to do manual procedures relying on Android.mk preliminary build +
Android.bp build [1] with some ugly workaround [2]

Procedure:

First build with Android.mk versions on drm_hwcomposer and libdrm
because /system/vendor/etc/hwdata/amdgpu.ids target required prebuild_etc
module type
then I used used Android.bp branches of drm_hwcomposer and libdrm

[1] https://github.com/maurossi/drm/commits/blueprint_oreo-x86 NOTE:
inspired by AOSP fa32e29 "Convert to Android.bp

[2]
https://github.com/maurossi/drm/commit/8727ddbd29e592a54ac234be99f63f262d0ff529


> >
> > I'll try to reach out to the android devs to see if there's any sort
> > of compat magic that can be done to keep things working on older
> > versions. That said, I'm still torn, as without this the current
> > libdrm/master code is broken with AOSP/master and Q.  Its frustrating
> > we have to have this seemingly exclusive trade off.
> >
> > I'm curious if folks might be willing to consider something like an
> > upstream branch to preserve the build bits that work with prior
> > Android releases? Or any other ideas?
>
> Is _not_ deleting Android.mk an option?
>
> That would have the obvious cost of duplicating the build system
> maintenance effort, but if that's the only way to not drop support for
> everything before Q...
>
> (fwiw, my ack only applies with "reasonable" support of previous
> versions :] )
>

Hi Eric,
in my case with both Android.mk and Android.bp the build is failing with
duplicated module name error
Mauro

--00000000000090ee11059361f3cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello</div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 12:39 PM Eric Engestrom =
&lt;<a href=3D"mailto:eric.engestrom@intel.com">eric.engestrom@intel.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On =
Tuesday, 2019-09-24 23:09:08 -0700, John Stultz wrote:<br>
&gt; On Tue, Sep 24, 2019 at 4:30 PM John Stultz &lt;<a href=3D"mailto:john=
.stultz@linaro.org" target=3D"_blank">john.stultz@linaro.org</a>&gt; wrote:=
<br>
&gt; &gt; On Tue, Sep 24, 2019 at 3:24 PM Rob Herring &lt;<a href=3D"mailto=
:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt; wrote:<br>
&gt; &gt; &gt; Trying to maintain something that works across more than 3 r=
eleases or<br>
&gt; &gt; &gt; so is painful. I don&#39;t think android-x86 folks have the =
bandwidth to<br>
&gt; &gt; &gt; maintain things older than that *and* update to newer versio=
ns. So I<br>
&gt; &gt; &gt; think only supporting the n latest releases is good.<br></bl=
ockquote><div><br></div><div>N is not a problem, per se, but if there are n=
on supported Blueprint module types used</div><div>it will not be possible =
to actually replicate Android.mk build rules to Android.bp and the build wi=
ll be missing some targets (for example is not possible to install prebuilt=
 files to $OUT)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Are .bp files for master/Q compatible back to N (or O)? IIRC=
, at least<br>
&gt; &gt; &gt; for the first couple of releases with .bp files, they seemed=
 to have<br>
&gt; &gt; &gt; incompatible changes.<br>
&gt; &gt;<br>
&gt; &gt; I think there have possibly been some incompatible changes, as I =
know<br>
&gt; &gt; early w/ bp files things were more in flux. That said, there have=
n&#39;t<br>
&gt; &gt; been many changes to the libdrm bp files since the conversion was=
<br>
&gt; &gt; first done in 2017 (so Android O). I&#39;ll checkout N and valida=
te so I<br>
&gt; &gt; can provide a more concrete assurance.<br>
&gt; <br>
&gt; Ah. Crud. You&#39;re right. The bp syntax has shifted enough over time=
 to<br>
&gt; cause problems w/ the current file when building against older Android=
<br>
&gt; releases.=C2=A0 =C2=A0N falls over pretty hard, and O and even P have =
issues w/<br>
&gt; &quot;recovery_available: &quot;, and &quot;prebuilt_etc&quot; syntax.=
=C2=A0 So my proposed<br>
&gt; commit message mischaracterizes the state of older builds. Apologies!<=
br></blockquote><div><br></div><div>I confirm that when trying drm_hwcompos=
er master build with oreo-x86 (Android O based)<br></div><div>I had to do m=
anual procedures relying on Android.mk preliminary build=C2=A0+ Android.bp =
build [1] with some ugly workaround [2]</div><div><br></div><div>Procedure:=
</div><div><br></div><div>First build with Android.mk versions on drm_hwcom=
poser and libdrm<br>because /system/vendor/etc/hwdata/amdgpu.ids target req=
uired prebuild_etc module type<br>then I used used Android.bp branches of d=
rm_hwcomposer and libdrm<br></div><div><br></div><div>[1]=C2=A0<a href=3D"h=
ttps://github.com/maurossi/drm/commits/blueprint_oreo-x86">https://github.c=
om/maurossi/drm/commits/blueprint_oreo-x86</a>=C2=A0NOTE: inspired by=C2=A0=
<span style=3D"background-color:rgb(234,245,255);color:rgb(68,77,86);font-f=
amily:SFMono-Regular,Consolas,&quot;Liberation Mono&quot;,Menlo,monospace;f=
ont-size:13px;white-space:pre-wrap">AOSP fa32e29 &quot;Convert to Android.b=
p</span></div><div><br></div><div>[2]=C2=A0<a href=3D"https://github.com/ma=
urossi/drm/commit/8727ddbd29e592a54ac234be99f63f262d0ff529">https://github.=
com/maurossi/drm/commit/8727ddbd29e592a54ac234be99f63f262d0ff529</a></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; I&#39;ll try to reach out to the android devs to see if there&#39;s an=
y sort<br>
&gt; of compat magic that can be done to keep things working on older<br>
&gt; versions. That said, I&#39;m still torn, as without this the current<b=
r>
&gt; libdrm/master code is broken with AOSP/master and Q.=C2=A0 Its frustra=
ting<br>
&gt; we have to have this seemingly exclusive trade off.<br>
&gt; <br>
&gt; I&#39;m curious if folks might be willing to consider something like a=
n<br>
&gt; upstream branch to preserve the build bits that work with prior<br>
&gt; Android releases? Or any other ideas?<br>
<br>
Is _not_ deleting Android.mk an option?<br>
<br>
That would have the obvious cost of duplicating the build system<br>
maintenance effort, but if that&#39;s the only way to not drop support for<=
br>
everything before Q...<br>
<br>
(fwiw, my ack only applies with &quot;reasonable&quot; support of previous<=
br>
versions :] )<br></blockquote><div><br></div><div>Hi Eric,</div><div>in my =
case with both Android.mk and Android.bp the build is failing with duplicat=
ed module name error</div><div>Mauro</div></div></div>

--00000000000090ee11059361f3cf--

--===============1321986835==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1321986835==--
