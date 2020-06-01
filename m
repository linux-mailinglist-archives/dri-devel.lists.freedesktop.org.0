Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8871E9C25
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 05:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C54B89E98;
	Mon,  1 Jun 2020 03:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDB089E98
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 03:52:39 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id g129so4855624vsc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 20:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aCH7y8IO/0gcZLFA/tFjyT4K6mmsIq0g7EfHLD4Ya88=;
 b=M5vaS6emNnG8+qMUjL+BfCWouPFFrYoy3eyizE2GXHsThOACCr7zpPvcp6pNZYNU7i
 WDEfFuH03kv8QpRK5vukjbw4monDC84HeLUwssdeMKeoOO1eXCKBRqwpokrnUxGzdXIE
 CYzLBj9gaRaGQw8Z6ufYx/mzSwqmJSQiU0zInqLbClKVTtYtYch2NnzHzvSmUycwHPMy
 qsi5pZWgVCpicQKPctWahO7B4z+iVcQG6reqarGh/cWlDwonBn+y71GIoWa8ynlngEsh
 CMkK9vgrfyjWpkqgisX4fVOC07Mp625oCkt/nksYzLskRHLAzhkSeAcm4IyAdK/JNqJn
 kmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aCH7y8IO/0gcZLFA/tFjyT4K6mmsIq0g7EfHLD4Ya88=;
 b=kItrlT5b2KV/naUXXP/Iza2BwT8FkYkzt9VOpdeqlGzV1tXJ76nVjG7uRL49mu2pXc
 cPNKl2XkkqnwxyFKnSJQs7zzAU0Ov2p7Eu/b5ooQLXfyKYMbvCjZosciRs+5P8D1Q6i7
 PoQovnX1osp7zdUH6FF5awpuP/pedSpDpojkDbmZBVyaVnkehXcgd/csOEj5oB7iB1bp
 1Z0tNi87flaI08nDLrgfV2J5lrELqUfyHMP/I9GVdzEKe37H102SK3XkPH26Xt+WtXh7
 KLmTXLuUriVbqIUNpd6hqDX1qieBbOcJh70r9VYuMlH5+VXwp+vqwQiovg+j13p9uMf0
 roEQ==
X-Gm-Message-State: AOAM532YAjavr00jAK5xIc5bsijLzv0TV0QCdn2wkFt5xLFTTui1XSQi
 ha1hBs6di08074em899QgNl1N0fdLTiAirZeVXM=
X-Google-Smtp-Source: ABdhPJz7gjA5iYR3Kj0xI4zO2fe6Lpz9MYgLO5W6tPfcUW5e3dvPE1MsJvYh6AHCESt1yRCAAUvD6mE9LNOSBv4NQR4=
X-Received: by 2002:a67:fb58:: with SMTP id e24mr3727993vsr.124.1590983558591; 
 Sun, 31 May 2020 20:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
 <20200528154804.02fb8901@eldfell.localdomain>
In-Reply-To: <20200528154804.02fb8901@eldfell.localdomain>
From: Yogish Kulkarni <yogishkulkarni@gmail.com>
Date: Mon, 1 Jun 2020 09:22:27 +0530
Message-ID: <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0308126624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0308126624==
Content-Type: multipart/alternative; boundary="000000000000da799405a6fdb9bf"

--000000000000da799405a6fdb9bf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

For letting DRM clients to select output encoding:
Sink can support certain display timings with high output bit-depths using
multiple output encodings, e.g. sink can support a particular timing with
RGB 10-bit, YCbCr422 10-bit and YCbCr420 10-bit. So DRM client may want to
select YCbCr422 10-bit over RBG 10-bit output to reduce the link bandwidth
(and in turn reduce power/voltage). If DRM driver automatically selects
output encoding then we are restricting DRM clients from making appropriate
choice.

For selectable output color range:
Certain applications (typically graphics) usually rendered in full range
while some applications (typically video) have limited range content. Since
content can change dynamically, DRM driver does not have enough information
to choose correct quantization. Only DRM client can correctly select which
quantization to set (to preserve artist's intent).

For how to use selectable output encoding with Weston:
I was thinking that DRM should have separate property to list the encodings
supported by sink and Weston will present this list to its client. Your
idea to validate encodings using TEST_ONLY commit and present a list of
timings along with encodings supported by particular timing seems better.
Instead of validating all possible encodings, does it make sense to
validate  only those supported by sink? Irrespective of this we would
anyway need some mechanism which will allow user to select particular
encoding for a particular mode. I was thinking to allow this using new DRM
property "Encoding". Do you have anything better in mind?

(Since I am using my Gmail Id, I feel I should mention that I work at
Nvidia)

Thanks,
-Yogish

On Thu, May 28, 2020 at 6:18 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Thu, 28 May 2020 17:38:59 +0530
> Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
>
> > I am trying to find a way through Weston which will allow setting
> specific
> > encoding at display output.
>
> Hi,
>
> why do *you* want to control that?
>
> Why not let the driver always choose the highest possible encoding
> given the video mode and hardware capability?
>
> I can understand userspace wanting to know what it got, but why should
> userspace be able to control it?
>
> Would people want to pick the encoding first, and then go for the
> highest possible video mode?
>
> > Could you please elaborate on  why it is best
> > to let DRM driver automatically configure which encoding to choose rath=
er
> > than making it selectable by DRM client ? I am not able to find referen=
ce
> > to past discussion about this. I was only able to find a proposed chang=
e
> -
> > https://lists.freedesktop.org/archives/intel-gfx/2017-April/125451.html
> but
> > am not able to find why it got rejected.
> >
> > Alternatively, is there existing way through which DRM clients can
> specify
> > preference for output encoding ? Or currently it's all up to the DRM
> driver
> > to choose what output encoding to use.
>
> There must be some reason why userspace needs to be able to control it.
> I'm also asking as a Weston maintainer, since I'm interested in how
> this affects e.g. color reproduction or HDR support.
>
> One thing that comes to my mind is using atomic TEST_ONLY commits to
> probe all the possible video modes =C3=97 encodings for presenting a list=
 to
> the user to choose from, if you have a display configuration GUI. E.g
> with some TV use cases, maybe the user wants to avoid sub-sampling, use
> the native resolution, but limit refresh rate to what's actually
> possible. Or any other combination of the three.
>
>
> Thanks,
> pq
>
> >
> > Thanks,
> > -Yogish
> >
> > On Thu, May 28, 2020 at 1:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > > On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote:
> > > > For creating new source property, is it good to follow
> > > > "drm_mode_create_hdmi_colorspace_property()"  as an example ? It
> seems
> > > that
> > > > currently there is no standard DRM property which allows DRM client
> to
> > > set
> > > > a specific output encoding (like YUV420, YUV422 etc). Also, there i=
s
> no
> > > > standard property for letting client select YUV/RGB color range. I
> see
> > > > there are two ways to introduce new properties, 1. do something lik=
e
> > > > drm_mode_create_hdmi_colorspace_property 2. create custom property
> > > similar
> > > > to "Broadcast RGB". Is there opinion on which is a preferable way
> to
> > > expose
> > > > encoding and color rage selection property ?
> > >
> > > I guess first question is "why?" Thus far we've gone with the opinion
> that
> > > automatically configuring output stuff as much as possible is best.
> What's
> > > the use-case where the driver can't select this?
> > > -Daniel
>

--000000000000da799405a6fdb9bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>For letting DRM clients =
to select output encoding:<br></div><div>Sink can support certain display t=
imings with high output bit-depths using multiple output encodings, e.g. si=
nk can support a particular timing with RGB 10-bit, YCbCr422 10-bit and YCb=
Cr420 10-bit. So DRM client may want to select YCbCr422 10-bit over RBG 10-=
bit output to reduce the link bandwidth (and in turn reduce power/voltage).=
 If DRM driver automatically selects output encoding then we are restrictin=
g DRM clients from making appropriate choice.</div><div><br></div><div>For =
selectable output color range:</div><div>Certain applications (typically gr=
aphics) usually rendered in full range while some applications (typically v=
ideo) have limited range content. Since content can change dynamically, DRM=
 driver does not have enough information to choose correct quantization. On=
ly DRM client can correctly select which quantization to set (to preserve a=
rtist&#39;s intent).</div><div><br></div><div>For how to use selectable out=
put encoding with Weston: <br></div><div>I was thinking that DRM should hav=
e separate property to list the encodings supported by sink and Weston will=
 present this list to its client. Your idea to validate encodings using TES=
T_ONLY commit and present a list of timings along with encodings supported =
by particular timing seems better. Instead of validating all possible encod=
ings, does it make sense to validate =C2=A0only those supported by sink? Ir=
respective of this we would anyway need some mechanism which will allow use=
r to select particular encoding for a particular mode. I was thinking to al=
low this using new DRM property &quot;Encoding&quot;. Do you have anything =
better in mind?</div><div><br></div><div></div><div></div><div>(Since I am =
using my Gmail Id, I feel I should mention that I work at Nvidia)<br></div>=
<div></div><div><br></div><div>Thanks,</div><div>-Yogish<br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, M=
ay 28, 2020 at 6:18 PM Pekka Paalanen &lt;<a href=3D"mailto:ppaalanen@gmail=
.com">ppaalanen@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu, 28 May 2020 17:38:59 +0530<br>
Yogish Kulkarni &lt;<a href=3D"mailto:yogishkulkarni@gmail.com" target=3D"_=
blank">yogishkulkarni@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I am trying to find a way through Weston which will allow setting spec=
ific<br>
&gt; encoding at display output.<br>
<br>
Hi,<br>
<br>
why do *you* want to control that?<br>
<br>
Why not let the driver always choose the highest possible encoding<br>
given the video mode and hardware capability?<br>
<br>
I can understand userspace wanting to know what it got, but why should<br>
userspace be able to control it?<br>
<br>
Would people want to pick the encoding first, and then go for the<br>
highest possible video mode?<br>
<br>
&gt; Could you please elaborate on=C2=A0 why it is best<br>
&gt; to let DRM driver automatically configure which encoding to choose rat=
her<br>
&gt; than making it selectable by DRM client ? I am not able to find refere=
nce<br>
&gt; to past discussion about this. I was only able to find a proposed chan=
ge -<br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/intel-gfx/2017-April=
/125451.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/archives/intel-gfx/2017-April/125451.html</a> but<br>
&gt; am not able to find why it got rejected.<br>
&gt; <br>
&gt; Alternatively, is there existing way through which DRM clients can spe=
cify<br>
&gt; preference for output encoding ? Or currently it&#39;s all up to the D=
RM driver<br>
&gt; to choose what output encoding to use.<br>
<br>
There must be some reason why userspace needs to be able to control it.<br>
I&#39;m also asking as a Weston maintainer, since I&#39;m interested in how=
<br>
this affects e.g. color reproduction or HDR support.<br>
<br>
One thing that comes to my mind is using atomic TEST_ONLY commits to<br>
probe all the possible video modes =C3=97 encodings for presenting a list t=
o<br>
the user to choose from, if you have a display configuration GUI. E.g<br>
with some TV use cases, maybe the user wants to avoid sub-sampling, use<br>
the native resolution, but limit refresh rate to what&#39;s actually<br>
possible. Or any other combination of the three.<br>
<br>
<br>
Thanks,<br>
pq<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; -Yogish<br>
&gt; <br>
&gt; On Thu, May 28, 2020 at 1:54 PM Daniel Vetter &lt;<a href=3D"mailto:da=
niel@ffwll.ch" target=3D"_blank">daniel@ffwll.ch</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote:=
=C2=A0 <br>
&gt; &gt; &gt; For creating new source property, is it good to follow<br>
&gt; &gt; &gt; &quot;drm_mode_create_hdmi_colorspace_property()&quot;=C2=A0=
 as an example ? It seems=C2=A0 <br>
&gt; &gt; that=C2=A0 <br>
&gt; &gt; &gt; currently there is no standard DRM property which allows DRM=
 client to=C2=A0 <br>
&gt; &gt; set=C2=A0 <br>
&gt; &gt; &gt; a specific output encoding (like YUV420, YUV422 etc). Also, =
there is no<br>
&gt; &gt; &gt; standard property for letting client select YUV/RGB color ra=
nge. I see<br>
&gt; &gt; &gt; there are two ways to introduce new properties, 1. do someth=
ing like<br>
&gt; &gt; &gt; drm_mode_create_hdmi_colorspace_property 2. create custom pr=
operty=C2=A0 <br>
&gt; &gt; similar=C2=A0 <br>
&gt; &gt; &gt; to &quot;Broadcast RGB&quot;. Is there opinion on which is a=
 preferable way to=C2=A0 <br>
&gt; &gt; expose=C2=A0 <br>
&gt; &gt; &gt; encoding and color rage selection property ?=C2=A0 <br>
&gt; &gt;<br>
&gt; &gt; I guess first question is &quot;why?&quot; Thus far we&#39;ve gon=
e with the opinion that<br>
&gt; &gt; automatically configuring output stuff as much as possible is bes=
t. What&#39;s<br>
&gt; &gt; the use-case where the driver can&#39;t select this?<br>
&gt; &gt; -Daniel<br>
</blockquote></div>

--000000000000da799405a6fdb9bf--

--===============0308126624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0308126624==--
