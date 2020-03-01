Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF02174BA5
	for <lists+dri-devel@lfdr.de>; Sun,  1 Mar 2020 06:46:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD776E427;
	Sun,  1 Mar 2020 05:46:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6986E420;
 Sun,  1 Mar 2020 05:46:13 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id g6so2890502plt.2;
 Sat, 29 Feb 2020 21:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BMFva8+eOa5vh3fnHy/a9L8r9X1WjtrkhhfpiOzrz5c=;
 b=s4JEFEt05s6mpcwTrB3V/VPGd65ZgRxP7oWGdoMf+o1IznVj/+DarhDC9YPj2ZhUrc
 A54Td41jsBwVNJ+vsOY/8s9H5D/Wys38MGEhrU5A3WNNzDSMGKKKxhbyyIYgA8OC7jjR
 Og7LalY/Wv7jFjQEi5iVR+9uysUtyYesUnrGSPoA9zdXNnR7Ci0efXRx8YpMfwQ74NjG
 R5VQiQU271N7l4dhga3PQPlTixjm62NiKM7h2Ye76aPJUGVIW8dSwYqlKD/FbpkEudgd
 1Dezu+GyAw1dkYWpf81u9A4zgxXikonV2AvKpuDjOWzkOddbwNXb8Rf7bpaLJ08J5uFC
 N5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BMFva8+eOa5vh3fnHy/a9L8r9X1WjtrkhhfpiOzrz5c=;
 b=bm26AUOz5AcYXzHT94Xo6RBEuNoDzt8SvT6zUxl7jtywtPudWVehHVM3SZKiH+Qsip
 NfCnag2NvD4sJz74vryWqqooul4q+qmK75AzXHXQD4UICG+TRAuI3g8uOhXsVE45Qm2e
 6fJKSEi3RDlP/PIr5eJg5HkwwgBpxIcmZFM8LD6vKS2xNiaM5rAXFvEn8bEZ883B3ItP
 YWVIUWa0pqbTVuu3CH2HsT7XgrfmlHaDXQFzbW63s8KGRKeoX6ywKPwc7jVAzrTDJzR6
 YtJ+2D508bL6DDKA4OjqeQn89v9B4vm0zLFtadZUWR6hiAi7KooIgDnt6Ls7v1h0mGjB
 DfoA==
X-Gm-Message-State: APjAAAW6Hy5BGH0HxShZKht48lMkuiGGF4RZRZqF+QdU7NvHfq2BOx/8
 WDXgOetqLQYvPFOlp8jpj2KMAInI3l9EhJY/BPs=
X-Google-Smtp-Source: APXvYqxDzPK1Bfz4mrHH3OesFTKhwvaemtm2OM0JFb07CjQ328g4kuHTaUK+kPzJ6RiqsRsjRARYH7P8aUrBu3C3PMI=
X-Received: by 2002:a17:902:7898:: with SMTP id
 q24mr11203695pll.164.1583041572643; 
 Sat, 29 Feb 2020 21:46:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <b398161ff7d0268454413058dc6c194cf93f5990.camel@collabora.com>
 <ece8ebe3-40ec-2457-02da-4fef19cbe8f6@intel.com>
 <6d2ec570f957b4504fb70e0b1f0632712a99dc0c.camel@collabora.com>
 <CAPj87rO7BuKQj2Kei3T7RdkFq5=TiuShBvtrPU2sn0iqMfXSTg@mail.gmail.com>
 <59f4ea1f13a9a9d37f7801b93061b4ae7dd595e2.camel@gmail.com>
 <d0ef47e45c83b342494e6781b808b4831a008836.camel@ndufresne.ca>
 <d9dca12759fd6a549dc4cd71b5f210a4dced01cd.camel@gmail.com>
 <CAOFGe96WqRTagf=Lhp6j9aMnB6hxwog7t93t=4r6QE_4f+HpeQ@mail.gmail.com>
 <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
In-Reply-To: <5551426acf99f73d3ce8234c14c176c1c7a1fe44.camel@ndufresne.ca>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Sun, 1 Mar 2020 00:46:00 -0500
Message-ID: <CAAxE2A5zSy7Rh6xyPW8NCqj3q0_8F7yw8tAXx=_z8+mJ-u2uWw@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Nicolas Dufresne <nicolas@ndufresne.ca>
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
Cc: Erik Faye-Lund <erik.faye-lund@collabora.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1068757829=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1068757829==
Content-Type: multipart/alternative; boundary="0000000000009a29a5059fc49643"

--0000000000009a29a5059fc49643
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For Mesa, we could run CI only when Marge pushes, so that it's a strictly
pre-merge CI.

Marek

On Sat., Feb. 29, 2020, 17:20 Nicolas Dufresne, <nicolas@ndufresne.ca>
wrote:

> Le samedi 29 f=C3=A9vrier 2020 =C3=A0 15:54 -0600, Jason Ekstrand a =C3=
=A9crit :
> > On Sat, Feb 29, 2020 at 3:47 PM Timur Krist=C3=B3f <timur.kristof@gmail=
.com>
> wrote:
> > > On Sat, 2020-02-29 at 14:46 -0500, Nicolas Dufresne wrote:
> > > > > 1. I think we should completely disable running the CI on MRs whi=
ch
> > > > > are
> > > > > marked WIP. Speaking from personal experience, I usually make a l=
ot
> > > > > of
> > > > > changes to my MRs before they are merged, so it is a waste of CI
> > > > > resources.
> > > >
> > > > In the mean time, you can help by taking the habit to use:
> > > >
> > > >   git push -o ci.skip
> > >
> > > Thanks for the advice, I wasn't aware such an option exists. Does thi=
s
> > > also work on the mesa gitlab or is this a GStreamer only thing?
> >
> > Mesa is already set up so that it only runs on MRs and branches named
> > ci-* (or maybe it's ci/*; I can't remember).
> >
> > > How hard would it be to make this the default?
> >
> > I strongly suggest looking at how Mesa does it and doing that in
> > GStreamer if you can.  It seems to work pretty well in Mesa.
>
> You are right, they added CI_MERGE_REQUEST_SOURCE_BRANCH_NAME in 11.6
> (we started our CI a while ago). But there is even better now, ou can
> do:
>
>   only:
>     refs:
>       - merge_requests
>
> Thanks for the hint, I'll suggest that. I've lookup some of the backend
> of mesa, I think it's really nice, though there is a lot of concept
> that won't work in a multi-repo CI. Again, I need to refresh on what
> was moved from the enterprise to the community version in this regard,
>
> >
> > --Jason
> >
> >
> > > > That's a much more difficult goal then it looks like. Let each
> > > > projects
> > > > manage their CI graph and content, as each case is unique. Running
> > > > more
> > > > tests, or building more code isn't the main issue as the CPU time i=
s
> > > > mostly sponsored. The data transfers between the cloud of gitlab an=
d
> > > > the runners (which are external), along to sending OS image to Lava
> > > > labs is what is likely the most expensive.
> > > >
> > > > As it was already mention in the thread, what we are missing now, a=
nd
> > > > being worked on, is per group/project statistics that give us the
> > > > hotspot so we can better target the optimization work.
> > >
> > > Yes, would be nice to know what the hotspot is, indeed.
> > >
> > > As far as I understand, the problem is not CI itself, but the bandwid=
th
> > > needed by the build artifacts, right? Would it be possible to not hos=
t
> > > the build artifacts on the gitlab, but rather only the place where th=
e
> > > build actually happened? Or at least, only transfer the build artifac=
ts
> > > on-demand?
> > >
> > > I'm not exactly familiar with how the system works, so sorry if this =
is
> > > a silly question.
> > >
> > > _______________________________________________
> > > mesa-dev mailing list
> > > mesa-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>

--0000000000009a29a5059fc49643
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">For Mesa, we could run CI only when Marge pushes, so that=
 it&#39;s a strictly pre-merge CI.<div dir=3D"auto"><br></div><div dir=3D"a=
uto">Marek</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat., Feb. 29, 2020, 17:20 Nicolas Dufresne, &lt;<a href=
=3D"mailto:nicolas@ndufresne.ca">nicolas@ndufresne.ca</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Le samedi 29 f=C3=A9vrier 2020 =C3=A0 15:=
54 -0600, Jason Ekstrand a =C3=A9crit :<br>
&gt; On Sat, Feb 29, 2020 at 3:47 PM Timur Krist=C3=B3f &lt;<a href=3D"mail=
to:timur.kristof@gmail.com" target=3D"_blank" rel=3D"noreferrer">timur.kris=
tof@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On Sat, 2020-02-29 at 14:46 -0500, Nicolas Dufresne wrote:<br>
&gt; &gt; &gt; &gt; 1. I think we should completely disable running the CI =
on MRs which<br>
&gt; &gt; &gt; &gt; are<br>
&gt; &gt; &gt; &gt; marked WIP. Speaking from personal experience, I usuall=
y make a lot<br>
&gt; &gt; &gt; &gt; of<br>
&gt; &gt; &gt; &gt; changes to my MRs before they are merged, so it is a wa=
ste of CI<br>
&gt; &gt; &gt; &gt; resources.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; In the mean time, you can help by taking the habit to use:<b=
r>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;=C2=A0 =C2=A0git push -o ci.skip<br>
&gt; &gt; <br>
&gt; &gt; Thanks for the advice, I wasn&#39;t aware such an option exists. =
Does this<br>
&gt; &gt; also work on the mesa gitlab or is this a GStreamer only thing?<b=
r>
&gt; <br>
&gt; Mesa is already set up so that it only runs on MRs and branches named<=
br>
&gt; ci-* (or maybe it&#39;s ci/*; I can&#39;t remember).<br>
&gt; <br>
&gt; &gt; How hard would it be to make this the default?<br>
&gt; <br>
&gt; I strongly suggest looking at how Mesa does it and doing that in<br>
&gt; GStreamer if you can.=C2=A0 It seems to work pretty well in Mesa.<br>
<br>
You are right, they added CI_MERGE_REQUEST_SOURCE_BRANCH_NAME in 11.6<br>
(we started our CI a while ago). But there is even better now, ou can<br>
do:<br>
<br>
=C2=A0 only:<br>
=C2=A0 =C2=A0 refs:<br>
=C2=A0 =C2=A0 =C2=A0 - merge_requests<br>
<br>
Thanks for the hint, I&#39;ll suggest that. I&#39;ve lookup some of the bac=
kend<br>
of mesa, I think it&#39;s really nice, though there is a lot of concept<br>
that won&#39;t work in a multi-repo CI. Again, I need to refresh on what<br=
>
was moved from the enterprise to the community version in this regard,<br>
<br>
&gt; <br>
&gt; --Jason<br>
&gt; <br>
&gt; <br>
&gt; &gt; &gt; That&#39;s a much more difficult goal then it looks like. Le=
t each<br>
&gt; &gt; &gt; projects<br>
&gt; &gt; &gt; manage their CI graph and content, as each case is unique. R=
unning<br>
&gt; &gt; &gt; more<br>
&gt; &gt; &gt; tests, or building more code isn&#39;t the main issue as the=
 CPU time is<br>
&gt; &gt; &gt; mostly sponsored. The data transfers between the cloud of gi=
tlab and<br>
&gt; &gt; &gt; the runners (which are external), along to sending OS image =
to Lava<br>
&gt; &gt; &gt; labs is what is likely the most expensive.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; As it was already mention in the thread, what we are missing=
 now, and<br>
&gt; &gt; &gt; being worked on, is per group/project statistics that give u=
s the<br>
&gt; &gt; &gt; hotspot so we can better target the optimization work.<br>
&gt; &gt; <br>
&gt; &gt; Yes, would be nice to know what the hotspot is, indeed.<br>
&gt; &gt; <br>
&gt; &gt; As far as I understand, the problem is not CI itself, but the ban=
dwidth<br>
&gt; &gt; needed by the build artifacts, right? Would it be possible to not=
 host<br>
&gt; &gt; the build artifacts on the gitlab, but rather only the place wher=
e the<br>
&gt; &gt; build actually happened? Or at least, only transfer the build art=
ifacts<br>
&gt; &gt; on-demand?<br>
&gt; &gt; <br>
&gt; &gt; I&#39;m not exactly familiar with how the system works, so sorry =
if this is<br>
&gt; &gt; a silly question.<br>
&gt; &gt; <br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; mesa-dev mailing list<br>
&gt; &gt; <a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blan=
k" rel=3D"noreferrer">mesa-dev@lists.freedesktop.org</a><br>
&gt; &gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-de=
v" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/mailman/listinfo/mesa-dev</a><br>
<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blank" rel=3D"=
noreferrer">mesa-dev@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.freedesktop.org/mail=
man/listinfo/mesa-dev</a><br>
</blockquote></div>

--0000000000009a29a5059fc49643--

--===============1068757829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1068757829==--
