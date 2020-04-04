Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F83E19F0FD
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:40:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA96C6E2CD;
	Mon,  6 Apr 2020 07:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FA56E222;
 Sat,  4 Apr 2020 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1586008543;
 bh=EtLjZbkZvUJ4TUi1cb0SFS01/z7Ls5VvvG8RavCWlVE=;
 h=X-UI-Sender-Class:References:In-Reply-To:From:Date:Subject:To:Cc;
 b=VMMDMk6TJq3Q8s4s5zLGxi8DqboNquFzilysfcrJX7mu8d+HgVN1nkzOssvlCUUhh
 jHQrVCqgWt36M3BaUdyjLeMf0U05uQ61QpGHZwF6e/21lRaJ5akU+7rcU2rCtZDOq+
 /qyK/VRb4dw7CX9fvECWhPFwF1nqzkFRY8+QFTCk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from mail-yb1-f171.google.com ([209.85.219.171]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MdvmO-1in3970gzO-00azwk; Sat, 04 Apr 2020 15:55:43 +0200
Received: by mail-yb1-f171.google.com with SMTP id g6so5959190ybh.12;
 Sat, 04 Apr 2020 06:55:42 -0700 (PDT)
X-Gm-Message-State: AGi0PuZNhrw8MY8GaJlJel/0GfRLVpJNAr0O9SmCsqkLA8e64cLMwORl
 SeWSRxa1nm1RtZcyphj6b9TbhRSVLuU3W68mOzA=
X-Google-Smtp-Source: APiQypL18jvzEVqhv+aWV1i9xpxQ6vs/zCiw23fcCZ1wAJGnmzp80hWH7WbvtKMl6RPqXo19QhpiwgsD6YK0q9CbuRs=
X-Received: by 2002:a25:c643:: with SMTP id k64mr21656006ybf.194.1586008541471; 
 Sat, 04 Apr 2020 06:55:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
 <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
 <CADaigPUjYZ-Mqd91eyR3Luo=PxLHratUhvodJmCJHf__MnPozA@mail.gmail.com>
In-Reply-To: <CADaigPUjYZ-Mqd91eyR3Luo=PxLHratUhvodJmCJHf__MnPozA@mail.gmail.com>
From: Andreas Bergmeier <abergmeier@gmx.net>
Date: Sat, 4 Apr 2020 15:55:30 +0200
X-Gmail-Original-Message-ID: <CABfF9mMwcTL3qx=F_Ep0X0Zh-pb_ZKxrhEwWP-wc3jkVHDaAMg@mail.gmail.com>
Message-ID: <CABfF9mMwcTL3qx=F_Ep0X0Zh-pb_ZKxrhEwWP-wc3jkVHDaAMg@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Eric Anholt <eric@anholt.net>
X-Provags-ID: V03:K1:DK6ByxLXdGDADickGSSqJpzSkqcWRJK+CQzXnMDW3/MD5CXyFKh
 b6pyBszGhQoqgO/AwIneUff7D1MA+m+E0lwEvvGuHvzmf9hWtOlqyZSgWSRAn8/S59yKJ6a
 X/ESxP1qjwG52gJoUoLYRY5FAFH6Ekwqdm3OStwOZZkvLZkwiud1WdhrZYI/OMHoax/GCXq
 ilhZW9uw8x17ztkdzn8lA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xG6+chRmIDs=:Fy/8w3VPlsw4eOYFeeoqWX
 J746U/hu0Ws3bHH8HvPu/PmK+RzvJuXvuT8qAx18ac9yNomBerWt12RU+aO0YO4be8mbSEDIG
 pr/H/cEyWyLVFMKg/viCiLKsnQcRnLhJQ5QJ1JB+mbusLiXyp90ErIunJAmHDuL0xfu1s5CmU
 fRsWyy7FgDcCnPWmWOvMGiXN/K8x1m/GTHG9vll0Paz3XRbUsWpMKKyMiAO4DyGkG/HtWgWHx
 5trHZoIsVnLJ0z3GEIKIWRE+b23u7mlYwcG8ZSrc06Vc1vQbYQgPY8nFvdsqQ28ubkaN0jUpa
 o9oqE+LeZgVFmtfd5dPzQXygs/fHUfv2+hm6B+x97W3I+JEJqRZHYmkX7DiaqJ9sA60Uh/RB+
 +ubOcQ54c9bSFV8w2SHWPUKkRv2E/echHuwx+oKGBQgIEB3mmly9aBwtIMTcLBXFPj9xK8fPQ
 3V7K1+xTDJjRdSCox5CM2nbukFpsW1e/rgX8RbuxfDTScU3aUjX6vEX6Fg3lnsRisl78Pf5GM
 STBfpKPBRJ40P5PFx8BgW/zMMqgjcwCsRlf8CKH/aHsYA+a2XJ9Cx0dPXzvUm6HyPcmwOGBUO
 gx7Gc8F7cQjJw2RkJnU6OJ60C3xbsnIIWq88CSVDMYqoBbXLfk/W/HAtVeoSwhfxqaiX7O+/5
 UxtKPuQhqF6Kh6CylucGuiOmcN7gwwljfubVbV2t865N3gb+vWSwaNoKO0905xtB2CTNIssuy
 ivSKNYVKS2U4spFikQ8Fs9qP3YBKmQZPtb9COInMeysAagfcRZ0yonugfHqhVG/7lRxYvRwdI
 lzoRWgdTOTexqFMA/96aAIgd1KgS/Ze0zLKFBtY1gd4Txkrc7vI209eEeD6WT1SciQ2bVotz5
 xqBk0ibNypCAZ9idKdnSaCmeyJeHyqwT0LRtoiNrXTNu7aw64kKKR4CD1xtBE9VLqZDwDSAjM
 DdXgTn/d4s0taj3z9PmGzOIklBq5AmVnszs7n2Gf3Y6uMsDfYHECJJdz32IQlGL2hxVVqpIWE
 rVUNifvf0B2d4IXolPWaUY1PvTvohhQ6I9NZfHfCZz3fXCw4NKRR4GgHM6UepdqUwkcoxQjW9
 JpE7+cZGfx6wnIAJoD/OrwQv9OmsCszYjkrIodOTexbLqXKUqNYVjFXZeJA+xHrA4ENxch2L5
 YBIe76erNNnIxTKQwVs1MlMBzXCYLtvvtV2DxckVOn0FV2F5qK5l05ZIfXg7q/9TBJih7ORqR
 hSGA97G1jRoeODRtj
X-Mailman-Approved-At: Mon, 06 Apr 2020 07:40:20 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1227310858=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1227310858==
Content-Type: multipart/alternative; boundary="000000000000b9a91a05a2776337"

--000000000000b9a91a05a2776337
Content-Type: text/plain; charset="UTF-8"

The problem of data transfer costs is not new in Cloud environments. At
work we usually just opt for paying for it since dev time is scarser. For
private projects though, I opt for aggressive (remote) caching.
So you can setup a global cache in Google Cloud Storage and more local
caches wherever your executors are (reduces egress as much as possible).
This setup works great with Bazel and Pants among others. Note that these
systems are pretty hermetic in contrast to Meson.
IIRC Eric by now works at Google. They internally use Blaze which AFAIK
does aggressive caching, too.
So maybe using any of these systems would be a way of not having to
sacrifice any of the current functionality.
Downside is that you have lower a bit of dev productivity since you cannot
eyeball your build definitions anymore.

ym2c


On Fri, 28 Feb 2020 at 20:34, Eric Anholt <eric@anholt.net> wrote:

> On Fri, Feb 28, 2020 at 12:48 AM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Fri, 28 Feb 2020 at 18:18, Daniel Stone <daniel@fooishbar.org> wrote:
> > >
> > > On Fri, 28 Feb 2020 at 03:38, Dave Airlie <airlied@gmail.com> wrote:
> > > > b) we probably need to take a large step back here.
> > > >
> > > > Look at this from a sponsor POV, why would I give X.org/fd.o
> > > > sponsorship money that they are just giving straight to google to pay
> > > > for hosting credits? Google are profiting in some minor way from
> these
> > > > hosting credits being bought by us, and I assume we aren't getting
> any
> > > > sort of discounts here. Having google sponsor the credits costs
> google
> > > > substantially less than having any other company give us money to do
> > > > it.
> > >
> > > The last I looked, Google GCP / Amazon AWS / Azure were all pretty
> > > comparable in terms of what you get and what you pay for them.
> > > Obviously providers like Packet and Digital Ocean who offer bare-metal
> > > services are cheaper, but then you need to find someone who is going
> > > to properly administer the various machines, install decent
> > > monitoring, make sure that more storage is provisioned when we need
> > > more storage (which is basically all the time), make sure that the
> > > hardware is maintained in decent shape (pretty sure one of the fd.o
> > > machines has had a drive in imminent-failure state for the last few
> > > months), etc.
> > >
> > > Given the size of our service, that's a much better plan (IMO) than
> > > relying on someone who a) isn't an admin by trade, b) has a million
> > > other things to do, and c) hasn't wanted to do it for the past several
> > > years. But as long as that's the resources we have, then we're paying
> > > the cloud tradeoff, where we pay more money in exchange for fewer
> > > problems.
> >
> > Admin for gitlab and CI is a full time role anyways. The system is
> > definitely not self sustaining without time being put in by you and
> > anholt still. If we have $75k to burn on credits, and it was diverted
> > to just pay an admin to admin the real hw + gitlab/CI would that not
> > be a better use of the money? I didn't know if we can afford $75k for
> > an admin, but suddenly we can afford it for gitlab credits?
>
> As I think about the time that I've spent at google in less than a
> year on trying to keep the lights on for CI and optimize our
> infrastructure in the current cloud environment, that's more than the
> entire yearly budget you're talking about here.  Saying "let's just
> pay for people to do more work instead of paying for full-service
> cloud" is not a cost optimization.
>
>
> > > Yes, we could federate everything back out so everyone runs their own
> > > builds and executes those. Tinderbox did something really similar to
> > > that IIRC; not sure if Buildbot does as well. Probably rules out
> > > pre-merge testing, mind.
> >
> > Why? does gitlab not support the model? having builds done in parallel
> > on runners closer to the test runners seems like it should be a thing.
> > I guess artifact transfer would cost less then as a result.
>
> Let's do some napkin math.  The biggest artifacts cost we have in Mesa
> is probably meson-arm64/meson-arm (60MB zipped from meson-arm64,
> downloaded by 4 freedreno and 6ish lava, about 100 pipelines/day,
> makes ~1.8TB/month ($180 or so).  We could build a local storage next
> to the lava dispatcher so that the artifacts didn't have to contain
> the rootfs that came from the container (~2/3 of the insides of the
> zip file), but that's another service to build and maintain.  Building
> the drivers once locally and storing it would save downloading the
> other ~1/3 of the inside of the zip file, but that requires a big
> enough system to do builds in time.
>
> I'm planning on doing a local filestore for google's lava lab, since I
> need to be able to move our xml files off of the lava DUTs to get the
> xml results we've become accustomed to, but this would not bubble up
> to being a priority for my time if I wasn't doing it anyway.  If it
> takes me a single day to set all this up (I estimate a couple of
> weeks), that costs my employer a lot more than sponsoring the costs of
> the inefficiencies of the system that has accumulated.
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/mesa-dev
>

--000000000000b9a91a05a2776337
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The problem of data transfer costs is not new in Cloud env=
ironments. At work we usually just opt for paying for it since dev time is =
scarser. For private projects though, I opt for aggressive (remote) caching=
.<div>So you can setup a global cache in Google Cloud Storage and more loca=
l caches wherever your executors are (reduces egress as much as possible).<=
/div><div>This setup works great with Bazel and Pants among others. Note th=
at these systems are pretty hermetic in contrast to Meson.</div><div>IIRC E=
ric by now works at Google. They internally use Blaze which AFAIK does aggr=
essive caching, too.</div><div>So maybe using any of these systems would be=
 a way of not having to sacrifice any of the current functionality.</div><d=
iv>Downside is that you have lower a bit of dev productivity since you cann=
ot eyeball your build definitions anymore.</div><div><br></div><div>ym2c</d=
iv><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, 28 Feb 2020 at 20:34, Eric Anholt &lt;<a href=3D"=
mailto:eric@anholt.net">eric@anholt.net</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">On Fri, Feb 28, 2020 at 12:48 AM Dav=
e Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=3D"_blank">airlied=
@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 28 Feb 2020 at 18:18, Daniel Stone &lt;<a href=3D"mailto:danie=
l@fooishbar.org" target=3D"_blank">daniel@fooishbar.org</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, 28 Feb 2020 at 03:38, Dave Airlie &lt;<a href=3D"mailto:a=
irlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; b) we probably need to take a large step back here.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Look at this from a sponsor POV, why would I give X.org/fd.o=
<br>
&gt; &gt; &gt; sponsorship money that they are just giving straight to goog=
le to pay<br>
&gt; &gt; &gt; for hosting credits? Google are profiting in some minor way =
from these<br>
&gt; &gt; &gt; hosting credits being bought by us, and I assume we aren&#39=
;t getting any<br>
&gt; &gt; &gt; sort of discounts here. Having google sponsor the credits co=
sts google<br>
&gt; &gt; &gt; substantially less than having any other company give us mon=
ey to do<br>
&gt; &gt; &gt; it.<br>
&gt; &gt;<br>
&gt; &gt; The last I looked, Google GCP / Amazon AWS / Azure were all prett=
y<br>
&gt; &gt; comparable in terms of what you get and what you pay for them.<br=
>
&gt; &gt; Obviously providers like Packet and Digital Ocean who offer bare-=
metal<br>
&gt; &gt; services are cheaper, but then you need to find someone who is go=
ing<br>
&gt; &gt; to properly administer the various machines, install decent<br>
&gt; &gt; monitoring, make sure that more storage is provisioned when we ne=
ed<br>
&gt; &gt; more storage (which is basically all the time), make sure that th=
e<br>
&gt; &gt; hardware is maintained in decent shape (pretty sure one of the fd=
.o<br>
&gt; &gt; machines has had a drive in imminent-failure state for the last f=
ew<br>
&gt; &gt; months), etc.<br>
&gt; &gt;<br>
&gt; &gt; Given the size of our service, that&#39;s a much better plan (IMO=
) than<br>
&gt; &gt; relying on someone who a) isn&#39;t an admin by trade, b) has a m=
illion<br>
&gt; &gt; other things to do, and c) hasn&#39;t wanted to do it for the pas=
t several<br>
&gt; &gt; years. But as long as that&#39;s the resources we have, then we&#=
39;re paying<br>
&gt; &gt; the cloud tradeoff, where we pay more money in exchange for fewer=
<br>
&gt; &gt; problems.<br>
&gt;<br>
&gt; Admin for gitlab and CI is a full time role anyways. The system is<br>
&gt; definitely not self sustaining without time being put in by you and<br=
>
&gt; anholt still. If we have $75k to burn on credits, and it was diverted<=
br>
&gt; to just pay an admin to admin the real hw + gitlab/CI would that not<b=
r>
&gt; be a better use of the money? I didn&#39;t know if we can afford $75k =
for<br>
&gt; an admin, but suddenly we can afford it for gitlab credits?<br>
<br>
As I think about the time that I&#39;ve spent at google in less than a<br>
year on trying to keep the lights on for CI and optimize our<br>
infrastructure in the current cloud environment, that&#39;s more than the<b=
r>
entire yearly budget you&#39;re talking about here.=C2=A0 Saying &quot;let&=
#39;s just<br>
pay for people to do more work instead of paying for full-service<br>
cloud&quot; is not a cost optimization.<br>
<br>
<br>
&gt; &gt; Yes, we could federate everything back out so everyone runs their=
 own<br>
&gt; &gt; builds and executes those. Tinderbox did something really similar=
 to<br>
&gt; &gt; that IIRC; not sure if Buildbot does as well. Probably rules out<=
br>
&gt; &gt; pre-merge testing, mind.<br>
&gt;<br>
&gt; Why? does gitlab not support the model? having builds done in parallel=
<br>
&gt; on runners closer to the test runners seems like it should be a thing.=
<br>
&gt; I guess artifact transfer would cost less then as a result.<br>
<br>
Let&#39;s do some napkin math.=C2=A0 The biggest artifacts cost we have in =
Mesa<br>
is probably meson-arm64/meson-arm (60MB zipped from meson-arm64,<br>
downloaded by 4 freedreno and 6ish lava, about 100 pipelines/day,<br>
makes ~1.8TB/month ($180 or so).=C2=A0 We could build a local storage next<=
br>
to the lava dispatcher so that the artifacts didn&#39;t have to contain<br>
the rootfs that came from the container (~2/3 of the insides of the<br>
zip file), but that&#39;s another service to build and maintain.=C2=A0 Buil=
ding<br>
the drivers once locally and storing it would save downloading the<br>
other ~1/3 of the inside of the zip file, but that requires a big<br>
enough system to do builds in time.<br>
<br>
I&#39;m planning on doing a local filestore for google&#39;s lava lab, sinc=
e I<br>
need to be able to move our xml files off of the lava DUTs to get the<br>
xml results we&#39;ve become accustomed to, but this would not bubble up<br=
>
to being a priority for my time if I wasn&#39;t doing it anyway.=C2=A0 If i=
t<br>
takes me a single day to set all this up (I estimate a couple of<br>
weeks), that costs my employer a lot more than sponsoring the costs of<br>
the inefficiencies of the system that has accumulated.<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org" target=3D"_blank">mesa-de=
v@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"=
noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinf=
o/mesa-dev</a><br>
</blockquote></div>

--000000000000b9a91a05a2776337--

--===============1227310858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1227310858==--
