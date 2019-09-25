Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51404BE42C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 20:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B512D6EC64;
	Wed, 25 Sep 2019 18:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B612D6EC64
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 18:03:12 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i18so7973509wru.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGGwSJ6nG1J8trbZG80hywoHL32/YUnKs9rQjgBNdEo=;
 b=deVD3+28PE7T67fmsrP18VERfAWQvHXF+cjJNKGHOJoOlLr4ek6kYcD50G2ajyhdFv
 xKzX+5L8RD3NgQ3FyNMuwm2EBsy1VrojTWyVuklQn7sN0Ga16t33xycGrztf4a1LVJHt
 geriYyIWrsplnlNJ8Boh4YQ8y3uHPtp652wPc6I2LzGlz2YoGgpGT4mSYtaVVWsWa6hQ
 DBJCT7FIxBcUFRNQ3xwMkhwdkJb9okFLjGdH87ovNLD1a6zNGqLysUHbNyYkJyNWX3pE
 ncob0JL8tH6BgQWwboGzneqhoYFahUQugHckiSwZ+m8npwOFWnThoCMFJi30TO/xOIlk
 D7PQ==
X-Gm-Message-State: APjAAAXwn73r1YvF+YMMomSG3Lq8P8tGOlD7b9FJPoZ56NxGlcY/Fe/j
 8t8e/+XY3ZHlCZIpWjDkynPRa7MWx6ce4cUVoEU=
X-Google-Smtp-Source: APXvYqyAjLFTFdLlB0CTV1EHgPbDEpxnj1P9nRVGTFTfoILQfWt3sVsekoc/b/VHSlofqVVpyn5R09cIH0MIzdlTAHQ=
X-Received: by 2002:adf:e485:: with SMTP id i5mr10948672wrm.175.1569434590978; 
 Wed, 25 Sep 2019 11:03:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190924212920.76103-1-john.stultz@linaro.org>
 <CAL_JsqLR212Et5Z82Gr=DJfB5WY-4o8bN_s5peu07EnaEVEOYQ@mail.gmail.com>
 <CALAqxLUR5ML3gmBs3SM2GvfXB+JxiO7gTUrtpVJqVzuh+hugxg@mail.gmail.com>
 <CALAqxLWHrCKogRqe2ZQZT3dK57+8AmxKfZjKXxztvw6CFobdkg@mail.gmail.com>
 <20190925103909.6yjozclnukkladbo@intel.com>
 <CALAqxLXyTT8rzR4eQFGNWyz3heuvLTQ9B19e_2XA85qzCGnaHA@mail.gmail.com>
In-Reply-To: <CALAqxLXyTT8rzR4eQFGNWyz3heuvLTQ9B19e_2XA85qzCGnaHA@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Wed, 25 Sep 2019 20:00:31 +0200
Message-ID: <CAEQFVGb4Hbciv5=ieJY5vHPK94x63j_VHdei-iDp-88Az51Sng@mail.gmail.com>
Subject: Re: [PATCH] libdrm: Convert to Android.mk to Android.bp
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=SGGwSJ6nG1J8trbZG80hywoHL32/YUnKs9rQjgBNdEo=;
 b=STFqCrO8cU/CtlW7F2M0pQnHUgwP4UXwrQULfVShQXmDjl2ArrqgBcY7nnIsOgeBDG
 EbUaEDFyNldqEdL/4um3FX/fv39LXTgsByuIEq0LJPX9jehken9XJRx4nVIc+C5YfVAh
 w6TNRP+hCUgEMCrCy+/JtBVYuuVV56zzY8FdSt54QttaY8fQm7AT6MEJNT0OyvDnz1YC
 llzX+dyPOjtHyX3uCO82ch1c7xTOgL1xpKJV/ehaSHmPIAsYaz0NSa8LNqcr0jQPt6Pm
 RGsTn/Ebri/zAjJQsxj1JTST215YKtSNWBi4fshM2tLCx4bwaEGjSdSkGFH4tBSNSeJY
 A9Ow==
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Eric Engestrom <eric.engestrom@intel.com>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0803688794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0803688794==
Content-Type: multipart/alternative; boundary="0000000000004b276d05936477dc"

--0000000000004b276d05936477dc
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 25, 2019 at 6:17 PM John Stultz <john.stultz@linaro.org> wrote:

> On Wed, Sep 25, 2019 at 3:39 AM Eric Engestrom <eric.engestrom@intel.com>
> wrote:
> >
> > On Tuesday, 2019-09-24 23:09:08 -0700, John Stultz wrote:
> > > On Tue, Sep 24, 2019 at 4:30 PM John Stultz <john.stultz@linaro.org>
> wrote:
> > > > On Tue, Sep 24, 2019 at 3:24 PM Rob Herring <robh@kernel.org> wrote:
> > > > > Trying to maintain something that works across more than 3
> releases or
> > > > > so is painful. I don't think android-x86 folks have the bandwidth
> to
> > > > > maintain things older than that *and* update to newer versions. So
> I
> > > > > think only supporting the n latest releases is good.
> > > > >
> > > > > Are .bp files for master/Q compatible back to N (or O)? IIRC, at
> least
> > > > > for the first couple of releases with .bp files, they seemed to
> have
> > > > > incompatible changes.
> > > >
> > > > I think there have possibly been some incompatible changes, as I know
> > > > early w/ bp files things were more in flux. That said, there haven't
> > > > been many changes to the libdrm bp files since the conversion was
> > > > first done in 2017 (so Android O). I'll checkout N and validate so I
> > > > can provide a more concrete assurance.
> > >
> > > Ah. Crud. You're right. The bp syntax has shifted enough over time to
> > > cause problems w/ the current file when building against older Android
> > > releases.   N falls over pretty hard, and O and even P have issues w/
> > > "recovery_available: ", and "prebuilt_etc" syntax.  So my proposed
> > > commit message mischaracterizes the state of older builds. Apologies!
> > >
> > > I'll try to reach out to the android devs to see if there's any sort
> > > of compat magic that can be done to keep things working on older
> > > versions. That said, I'm still torn, as without this the current
> > > libdrm/master code is broken with AOSP/master and Q.  Its frustrating
> > > we have to have this seemingly exclusive trade off.
> > >
> > > I'm curious if folks might be willing to consider something like an
> > > upstream branch to preserve the build bits that work with prior
> > > Android releases? Or any other ideas?
> >
> > Is _not_ deleting Android.mk an option?
>
> Yea, the trouble is O and P will pick up the Android.bp files by
> default, so you'd still see the issues or you'd run into duplicate
> targets. I'm hoping I can still find some conditional magic tricks for
> Android.bp.  I need to look at Mauro's patches though.
>
> > That would have the obvious cost of duplicating the build system
> > maintenance effort, but if that's the only way to not drop support for
> > everything before Q...
>
> Yea, I'm not eager to have two android build systems in the tree.
> Having just one is duplicative enough.
>
> > (fwiw, my ack only applies with "reasonable" support of previous
> > versions :] )
>
> Of course, I'm not planning on submitting this change further until I
> can find something better.  Apologies again for my assumptions that it
> would work with older bp implementations.  My only defence is, in
> trying to validate w/ older releases yesterday, my build system pulled
> down 135G of data and now my repo is somehow unshallowed and taking 4
> times the amount of disk space it was using w/ just AOSP/master. :P So
> validating across AOSP versions is no trivial thing.
>
> thanks
> -john
>

For O & P builds if module names collision is avoided,
could Android.bp and Android.mk coexist in the same project?

Could it be possible to use Android.bp for all libdrm targets
but data/Android.bp,
removed and replaced by ./Android.mk with dummy module name and stripped
down to just install /system/vendor/etc/hwdata/amdgpu.ids target ?

If what I'm thinking may work, I could give it a try and report back

Mauro

--0000000000004b276d05936477dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 25, 2019 at 6:17 PM John =
Stultz &lt;<a href=3D"mailto:john.stultz@linaro.org">john.stultz@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Wed, Sep 25, 2019 at 3:39 AM Eric Engestrom &lt;<a href=3D"mailto:eric.e=
ngestrom@intel.com" target=3D"_blank">eric.engestrom@intel.com</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; On Tuesday, 2019-09-24 23:09:08 -0700, John Stultz wrote:<br>
&gt; &gt; On Tue, Sep 24, 2019 at 4:30 PM John Stultz &lt;<a href=3D"mailto=
:john.stultz@linaro.org" target=3D"_blank">john.stultz@linaro.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt; On Tue, Sep 24, 2019 at 3:24 PM Rob Herring &lt;<a href=3D"m=
ailto:robh@kernel.org" target=3D"_blank">robh@kernel.org</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; Trying to maintain something that works across more tha=
n 3 releases or<br>
&gt; &gt; &gt; &gt; so is painful. I don&#39;t think android-x86 folks have=
 the bandwidth to<br>
&gt; &gt; &gt; &gt; maintain things older than that *and* update to newer v=
ersions. So I<br>
&gt; &gt; &gt; &gt; think only supporting the n latest releases is good.<br=
>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Are .bp files for master/Q compatible back to N (or O)?=
 IIRC, at least<br>
&gt; &gt; &gt; &gt; for the first couple of releases with .bp files, they s=
eemed to have<br>
&gt; &gt; &gt; &gt; incompatible changes.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I think there have possibly been some incompatible changes, =
as I know<br>
&gt; &gt; &gt; early w/ bp files things were more in flux. That said, there=
 haven&#39;t<br>
&gt; &gt; &gt; been many changes to the libdrm bp files since the conversio=
n was<br>
&gt; &gt; &gt; first done in 2017 (so Android O). I&#39;ll checkout N and v=
alidate so I<br>
&gt; &gt; &gt; can provide a more concrete assurance.<br>
&gt; &gt;<br>
&gt; &gt; Ah. Crud. You&#39;re right. The bp syntax has shifted enough over=
 time to<br>
&gt; &gt; cause problems w/ the current file when building against older An=
droid<br>
&gt; &gt; releases.=C2=A0 =C2=A0N falls over pretty hard, and O and even P =
have issues w/<br>
&gt; &gt; &quot;recovery_available: &quot;, and &quot;prebuilt_etc&quot; sy=
ntax.=C2=A0 So my proposed<br>
&gt; &gt; commit message mischaracterizes the state of older builds. Apolog=
ies!<br>
&gt; &gt;<br>
&gt; &gt; I&#39;ll try to reach out to the android devs to see if there&#39=
;s any sort<br>
&gt; &gt; of compat magic that can be done to keep things working on older<=
br>
&gt; &gt; versions. That said, I&#39;m still torn, as without this the curr=
ent<br>
&gt; &gt; libdrm/master code is broken with AOSP/master and Q.=C2=A0 Its fr=
ustrating<br>
&gt; &gt; we have to have this seemingly exclusive trade off.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m curious if folks might be willing to consider something l=
ike an<br>
&gt; &gt; upstream branch to preserve the build bits that work with prior<b=
r>
&gt; &gt; Android releases? Or any other ideas?<br>
&gt;<br>
&gt; Is _not_ deleting Android.mk an option?<br>
<br>
Yea, the trouble is O and P will pick up the Android.bp files by<br>
default, so you&#39;d still see the issues or you&#39;d run into duplicate<=
br>
targets. I&#39;m hoping I can still find some conditional magic tricks for<=
br>
Android.bp.=C2=A0 I need to look at Mauro&#39;s patches though.<br>
<br>
&gt; That would have the obvious cost of duplicating the build system<br>
&gt; maintenance effort, but if that&#39;s the only way to not drop support=
 for<br>
&gt; everything before Q...<br>
<br>
Yea, I&#39;m not eager to have two android build systems in the tree.<br>
Having just one is duplicative enough.<br>
<br>
&gt; (fwiw, my ack only applies with &quot;reasonable&quot; support of prev=
ious<br>
&gt; versions :] )<br>
<br>
Of course, I&#39;m not planning on submitting this change further until I<b=
r>
can find something better.=C2=A0 Apologies again for my assumptions that it=
<br>
would work with older bp implementations.=C2=A0 My only defence is, in<br>
trying to validate w/ older releases yesterday, my build system pulled<br>
down 135G of data and now my repo is somehow unshallowed and taking 4<br>
times the amount of disk space it was using w/ just AOSP/master. :P So<br>
validating across AOSP versions is no trivial thing.<br>
<br>
thanks<br>
-john<br></blockquote><div><br></div><div>For O &amp; P builds if module na=
mes collision is avoided,=C2=A0</div><div>could Android.bp and Android.mk c=
oexist in the same project?<br></div><div><br></div><div>Could it be possib=
le to use Android.bp for all libdrm targets but=C2=A0data/Android.bp,=C2=A0=
</div><div>removed and replaced by ./Android.mk with dummy module name and =
stripped down to just install /system/vendor/etc/hwdata/amdgpu.ids target ?=
</div><div><br></div><div>If what I&#39;m thinking may work, I could give i=
t a try and report back</div><div><br></div><div>Mauro<br></div></div></div=
>

--0000000000004b276d05936477dc--

--===============0803688794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0803688794==--
