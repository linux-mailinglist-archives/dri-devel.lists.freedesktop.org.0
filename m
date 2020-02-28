Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9AA17461E
	for <lists+dri-devel@lfdr.de>; Sat, 29 Feb 2020 11:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 342C66E1F9;
	Sat, 29 Feb 2020 10:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DB26F4E1
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 21:37:15 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id c16so4320532oic.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 13:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gitlab.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETwltv9lCMudAqcyf+3N0EPaW+3StmnTyvgL3ufvkow=;
 b=TSgMNeIwG4MHeSR8SKGyQxwSm5Rfj23G1uwoxqWgZ19Q9CLz/+9mgGf7iwmwXJ7KcI
 4op/npOXsW842TA6XmfjwMie+1a77ufJpTZeFIk3Q6xQRbvqWk8Nxn63yp5qthBrmAqd
 FHMBHWs1CH2NHrAoDe4fwb8iaPUtGCj4qT9+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETwltv9lCMudAqcyf+3N0EPaW+3StmnTyvgL3ufvkow=;
 b=DcGK03sgQHlNLGbR3KXYeEBV/Ad2OeVyPF7pAbYdtDIeUwYyhU8HfXUVEaZk9ADTlQ
 9j8F+2HocHdVOSyKt/05OUZp4PhDQV0ao/BKSoLoRWr0XqMxlv7QcjWEcRssklwUZ79R
 02PiiE7KaiQ8XRrMDsIUPhSGrett5S3uiTHnWTFXto/sni5myFj5WgZ9wSfmTxNc9IJk
 6mzfPyIpazaM+zfbw8Sm/b6rVfei3MlmbbhcG78ugnoenImTn1uPKGVtC14rOw1QVYSO
 h9g2CbxKYd3Fv28Bjw7wzNNf82UD2PZVhxwxE70xmj4O7FnoRrMmFC9hb8e8P3d8tm6o
 oQfA==
X-Gm-Message-State: APjAAAVWfQ7ZptXhl3LykF4EULzWVoGXXokrps3WoLp2TWKddVXdkLMh
 fgmRJmqMEJgE04cTcILIyb9GAgKskhz1QWO88sDeeQ==
X-Google-Smtp-Source: APXvYqyXjm8bF1XKcGKjHJp/TtqPUKPXJn1FBHhKQ/amHrrIbqPOgV14tEvnuXJsDdDeZ19g8z3T7Nl/1EnRX5rGpnA=
X-Received: by 2002:aca:d4c1:: with SMTP id l184mr4659408oig.172.1582925834753; 
 Fri, 28 Feb 2020 13:37:14 -0800 (PST)
MIME-Version: 1.0
References: <CAKMK7uHHK2SsCfpmZwEUyTJJHsoccKoadoko3cEBOoYDFkmeAw@mail.gmail.com>
 <CAPM=9txcGPvFdSzMtYZXyqLKnWyacSMuHdoXdV63M53fLFVFpw@mail.gmail.com>
 <CAPj87rM76W9y_76WUHR35NS3V4_-RFi9ZM3GA=aED3dD3hWYkg@mail.gmail.com>
 <CAPM=9txN-RKGwinzsSPrmT_xFjS2J_XUhXVsRQ2pSSe529wpEA@mail.gmail.com>
 <CADaigPUjYZ-Mqd91eyR3Luo=PxLHratUhvodJmCJHf__MnPozA@mail.gmail.com>
 <CAPM=9tyhoagJmzMtwDKU-rjsCUPjokUp2ECOV0FdbkO5CQdZ2w@mail.gmail.com>
 <CAKMK7uG-HwYX4M8sSAU6Qee_hUTFZZNHngsR+_K+Ewrqu8=ZDg@mail.gmail.com>
In-Reply-To: <CAKMK7uG-HwYX4M8sSAU6Qee_hUTFZZNHngsR+_K+Ewrqu8=ZDg@mail.gmail.com>
From: Nuritzi Sanchez <nsanchez@gitlab.com>
Date: Fri, 28 Feb 2020 13:37:03 -0800
Message-ID: <CAAJ-hAOQXm-UzT5zPNuRLNrb7dHkNNc70kHfC4EPswVEsFt2Nw@mail.gmail.com>
Subject: Re: [Mesa-dev] [Intel-gfx] gitlab.fd.o financial situation and impact
 on services
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 29 Feb 2020 10:13:17 +0000
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 "X.Org development" <xorg-devel@lists.x.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "X.Org Foundation Board" <board@foundation.x.org>,
 Xorg Members List <members@x.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mesa Dev <mesa-dev@lists.freedesktop.org>,
 gstreamer-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0213765554=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0213765554==
Content-Type: multipart/alternative; boundary="000000000000163a7e059fa9a4c8"

--000000000000163a7e059fa9a4c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,


I know there's been a lot of discussion already, but I wanted to respond to
Daniel's original post.

I joined GitLab earlier this month as their new Open Source Program Manager
[1] and wanted to introduce myself here since I=E2=80=99ll be involved from=
 the
GitLab side as we work together to problem-solve the financial situation
here. My role at GitLab is to help make it easier for Open Source
organizations to migrate (by helping to smooth out some of the current pain
points), and to help advocate internally for changes to the product and our
workflows to make GitLab better for Open Source orgs. We want to make sure
that our Open Source community feels supported beyond just migration. As
such, I=E2=80=99ll be running the GitLab Open Source Program [2].

My background is that I=E2=80=99m the former President and Chairperson of t=
he GNOME
Foundation, which is one of the earliest Free Software projects to migrate
to GitLab. GNOME initially faced some limitations with the CI runner costs
too, but thanks to generous support from donors, has no longer experienced
those issues in recent times. I know there's already a working relationship
between our communities, but it could be good to examine what GNOME and KDE
have done and see if there's anything we can apply here. We've reached out
to Daniel Stone, our main contact for the freedesktop.org migration, and he
has gotten us in touch with Daniel V. and the X.Org Foundation Board to
learn more about what's already been done and what we can do next.

Please bear with me as I continue to get ramped up in my new job, but I=E2=
=80=99d
like to offer as much support as possible with this issue. We=E2=80=99ll be
exploring ways for GitLab to help make sure there isn=E2=80=99t a gap in co=
verage
during the time that freedesktop looks for sponsors. I know that on
GitLab=E2=80=99s side, supporting our Open Source user community is a prior=
ity.

Best,

Nuritzi

[1] https://about.gitlab.com/company/team/#nuritzi
[2]
https://about.gitlab.com/handbook/marketing/community-relations/opensource-=
program/


On Fri, Feb 28, 2020 at 1:22 PM Daniel Vetter <daniel.vetter@ffwll.ch>
wrote:

> On Fri, Feb 28, 2020 at 9:31 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > On Sat, 29 Feb 2020 at 05:34, Eric Anholt <eric@anholt.net> wrote:
> > >
> > > On Fri, Feb 28, 2020 at 12:48 AM Dave Airlie <airlied@gmail.com>
> wrote:
> > > >
> > > > On Fri, 28 Feb 2020 at 18:18, Daniel Stone <daniel@fooishbar.org>
> wrote:
> > > > >
> > > > > On Fri, 28 Feb 2020 at 03:38, Dave Airlie <airlied@gmail.com>
> wrote:
> > > > > > b) we probably need to take a large step back here.
> > > > > >
> > > > > > Look at this from a sponsor POV, why would I give X.org/fd.o
> > > > > > sponsorship money that they are just giving straight to google
> to pay
> > > > > > for hosting credits? Google are profiting in some minor way fro=
m
> these
> > > > > > hosting credits being bought by us, and I assume we aren't
> getting any
> > > > > > sort of discounts here. Having google sponsor the credits costs
> google
> > > > > > substantially less than having any other company give us money
> to do
> > > > > > it.
> > > > >
> > > > > The last I looked, Google GCP / Amazon AWS / Azure were all prett=
y
> > > > > comparable in terms of what you get and what you pay for them.
> > > > > Obviously providers like Packet and Digital Ocean who offer
> bare-metal
> > > > > services are cheaper, but then you need to find someone who is
> going
> > > > > to properly administer the various machines, install decent
> > > > > monitoring, make sure that more storage is provisioned when we ne=
ed
> > > > > more storage (which is basically all the time), make sure that th=
e
> > > > > hardware is maintained in decent shape (pretty sure one of the fd=
.o
> > > > > machines has had a drive in imminent-failure state for the last f=
ew
> > > > > months), etc.
> > > > >
> > > > > Given the size of our service, that's a much better plan (IMO) th=
an
> > > > > relying on someone who a) isn't an admin by trade, b) has a milli=
on
> > > > > other things to do, and c) hasn't wanted to do it for the past
> several
> > > > > years. But as long as that's the resources we have, then we're
> paying
> > > > > the cloud tradeoff, where we pay more money in exchange for fewer
> > > > > problems.
> > > >
> > > > Admin for gitlab and CI is a full time role anyways. The system is
> > > > definitely not self sustaining without time being put in by you and
> > > > anholt still. If we have $75k to burn on credits, and it was divert=
ed
> > > > to just pay an admin to admin the real hw + gitlab/CI would that no=
t
> > > > be a better use of the money? I didn't know if we can afford $75k f=
or
> > > > an admin, but suddenly we can afford it for gitlab credits?
> > >
> > > As I think about the time that I've spent at google in less than a
> > > year on trying to keep the lights on for CI and optimize our
> > > infrastructure in the current cloud environment, that's more than the
> > > entire yearly budget you're talking about here.  Saying "let's just
> > > pay for people to do more work instead of paying for full-service
> > > cloud" is not a cost optimization.
> > >
> > >
> > > > > Yes, we could federate everything back out so everyone runs their
> own
> > > > > builds and executes those. Tinderbox did something really similar
> to
> > > > > that IIRC; not sure if Buildbot does as well. Probably rules out
> > > > > pre-merge testing, mind.
> > > >
> > > > Why? does gitlab not support the model? having builds done in
> parallel
> > > > on runners closer to the test runners seems like it should be a
> thing.
> > > > I guess artifact transfer would cost less then as a result.
> > >
> > > Let's do some napkin math.  The biggest artifacts cost we have in Mes=
a
> > > is probably meson-arm64/meson-arm (60MB zipped from meson-arm64,
> > > downloaded by 4 freedreno and 6ish lava, about 100 pipelines/day,
> > > makes ~1.8TB/month ($180 or so).  We could build a local storage next
> > > to the lava dispatcher so that the artifacts didn't have to contain
> > > the rootfs that came from the container (~2/3 of the insides of the
> > > zip file), but that's another service to build and maintain.  Buildin=
g
> > > the drivers once locally and storing it would save downloading the
> > > other ~1/3 of the inside of the zip file, but that requires a big
> > > enough system to do builds in time.
> > >
> > > I'm planning on doing a local filestore for google's lava lab, since =
I
> > > need to be able to move our xml files off of the lava DUTs to get the
> > > xml results we've become accustomed to, but this would not bubble up
> > > to being a priority for my time if I wasn't doing it anyway.  If it
> > > takes me a single day to set all this up (I estimate a couple of
> > > weeks), that costs my employer a lot more than sponsoring the costs o=
f
> > > the inefficiencies of the system that has accumulated.
> >
> > I'm not trying to knock the engineering works the CI contributors have
> > done at all, but I've never seen a real discussion about costs until
> > now. Engineers aren't accountants.
> >
> > The thing we seem to be missing here is fiscal responsibility. I know
> > this email is us being fiscally responsible, but it's kinda after the
> > fact.
> >
> > I cannot commit my employer to spending a large amount of money (> 0
> > actually) without a long and lengthy process with checks and bounds.
> > Can you?
> >
> > The X.org board has budgets and procedures as well. I as a developer
> > of Mesa should not be able to commit the X.org foundation to spending
> > large amounts of money without checks and bounds.
> >
> > The CI infrastructure lacks any checks and bounds. There is no link
> > between editing .gitlab-ci/* and cashflow. There is no link to me
> > adding support for a new feature to llvmpipe that blows out test times
> > (granted it won't affect CI budget but just an example).
>
> We're working to get the logging in place to know which projects
> exactly burn down the money so that we can take specific actions. If
> needed. So pretty soon you wont be able to just burn down endless
> amounts of cash with a few gitlab-ci commits. Or at least not for long
> until we catch you and you either fix things up or CI is gone for your
> project.
>
> > The fact that clouds run on credit means that it's not possible to say
> > budget 30K and say when that runs out it runs out, you end up getting
> > bills for ever increasing amounts that you have to cover, with nobody
> > "responsible" for ever reducing those bills. Higher Faster Further
> > baby comes to mind.
>
> We're working on this, since it's the boards responsibility to be on
> top of stuff. It's simply that we didn't expect a massive growth of
> this scale and this quickly, so we're a bit behind on the controlling
> aspect.
>
> Also I guess it wasnt clear, but the board decision yesterday was the
> stop loss order where we cut the cord (for CI at least). So yeah the
> short term budget is firmly in place now.
>
> > Has X.org actually allocated the remaining cash in it's bank account
> > to this task previously? Was there plans for this money that can't be
> > executed now because we have to pay the cloud fees? If we continue to
> > May and the X.org bank account hits 0, can XDC happen?
>
> There's numbers elsewhere in this thread, but if you'd read the
> original announcement it states that the stop loss would still
> guarantee that we can pay for everything for at least one year. We're
> not going to get even close to 0 in the bank account.
>
> So yeah XDC happens, and it'll also still happen next year. Also fd.o
> servers will keep running. The only thing we might need to switch off
> is the CI support.
>
> > Budgeting and cloud is hard, the feedback loops are messy. In the old
> > system the feedback loop was simple, we don't have admin time or money
> > for servers we don't get the features, cloud allows us to get the
> > features and enjoy them and at some point in the future the bill gets
> > paid by someone else. Credit cards lifestyles all the way.
>
> Uh ... where exactly do you get the credit card approach from? SPI is
> legally not allowed to extend us a credit (we're not a legal org
> anymore), so if we hit 0 it's out real quick. No credit for us. If SPI
> isnt on top of that it's their loss (but they're getting pretty good
> at tracking stuff with the contractor they now have and all that).
>
> Which is not going to happen btw, if you've read the announcement mail
> and all that.
>
> Cheers, Daniel
>
> > Like maybe we can grow up here and find sponsors to cover all of this,
> > but it still feels a bit backwards from a fiscal pov.
> >
> > Again I'm not knocking the work people have done at all, CI is very
> > valuable to the projects involved, but that doesn't absolve us from
> > costs.
> >
> > Dave.
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> wayland-devel mailing list
> wayland-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/wayland-devel
>


--=20
Nuritzi SanchezSenior Open Source Program Manager | GitLab

*Create, Collaborate, and Deploy together*
Free Trial <https://about.gitlab.com/free-trial/> | Upgrade Now
<https://about.gitlab.com/products/> | Contact Support
<https://about.gitlab.com/support/> | Community
<https://about.gitlab.com/community>

--000000000000163a7e059fa9a4c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-d666=
751d-7fff-18a9-9e96-7c2b62554f99"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Hi All,=
=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap"><br></span></p><p style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">I know there&#39;s been a lot of discussion already, but I wa=
nted to respond to Daniel&#39;s original post. </span></p><br><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">I joined GitLab earlier this month as their new Open=
 Source Program Manager [1] and wanted to introduce myself here since I=E2=
=80=99ll be involved from the GitLab side as we work together to problem-so=
lve the financial situation here. My role at GitLab is to help make it easi=
er for Open Source organizations to migrate (by helping to smooth out some =
of the current pain points), and to help advocate internally for changes to=
 the product and our workflows to make GitLab better for Open Source orgs. =
We want to make sure that our Open Source community feels supported beyond =
just migration. As such, I=E2=80=99ll be running the GitLab Open Source Pro=
gram [2].</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">My background is =
that I=E2=80=99m the former President and Chairperson of the GNOME Foundati=
on, which is one of the earliest Free Software projects to migrate to GitLa=
b. GNOME initially faced some limitations with the CI runner costs too, but=
 thanks to generous support from donors, has no longer experienced those is=
sues in recent times. I know there&#39;s already a working relationship bet=
ween our communities, but it could be good to examine what GNOME and KDE ha=
ve done and see if there&#39;s anything we can apply here. We&#39;ve reache=
d out to Daniel Stone, our main contact for the <a href=3D"http://freedeskt=
op.org">freedesktop.org</a> migration, and he has gotten us in touch with D=
aniel V. and the X.Org Foundation Board to learn more about what&#39;s alre=
ady been done and what we can do next.</span></p><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-num=
eric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-sp=
ace:pre-wrap">Please bear with me as I continue to get ramped up in my new =
job, but I=E2=80=99d like to offer as much support as possible with this is=
sue. We=E2=80=99ll be exploring ways for GitLab to help make sure there isn=
=E2=80=99t a gap in coverage during the time that freedesktop looks for spo=
nsors. I know that on GitLab=E2=80=99s side, supporting our Open Source use=
r community is a priority.</span></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
Best,=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">Nuritzi</span></p><=
br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">[1] </span><a href=3D"https://about.gi=
tlab.com/company/team/#nuritzi" style=3D"text-decoration-line:none"><span s=
tyle=3D"font-family:Arial;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;text-decoration-line:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://about.gitlab.com/company/t=
eam/#nuritzi</span></a></p><span style=3D"font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">[2] </span><sp=
an style=3D"text-decoration-line:underline;font-family:Arial;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap"><a href=3D"https://about.gitla=
b.com/handbook/marketing/community-relations/opensource-program/" style=3D"=
text-decoration-line:none">https://about.gitlab.com/handbook/marketing/comm=
unity-relations/opensource-program/</a></span></span></div><div dir=3D"ltr"=
><span><br></span></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Fri, Feb 28, 2020 at 1:22 PM Daniel Vetter &lt;<a href=
=3D"mailto:daniel.vetter@ffwll.ch">daniel.vetter@ffwll.ch</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Feb 28, 20=
20 at 9:31 PM Dave Airlie &lt;<a href=3D"mailto:airlied@gmail.com" target=
=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 29 Feb 2020 at 05:34, Eric Anholt &lt;<a href=3D"mailto:eric@a=
nholt.net" target=3D"_blank">eric@anholt.net</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Fri, Feb 28, 2020 at 12:48 AM Dave Airlie &lt;<a href=3D"mailt=
o:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Fri, 28 Feb 2020 at 18:18, Daniel Stone &lt;<a href=3D"ma=
ilto:daniel@fooishbar.org" target=3D"_blank">daniel@fooishbar.org</a>&gt; w=
rote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Fri, 28 Feb 2020 at 03:38, Dave Airlie &lt;<a href=
=3D"mailto:airlied@gmail.com" target=3D"_blank">airlied@gmail.com</a>&gt; w=
rote:<br>
&gt; &gt; &gt; &gt; &gt; b) we probably need to take a large step back here=
.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Look at this from a sponsor POV, why would I give =
X.org/fd.o<br>
&gt; &gt; &gt; &gt; &gt; sponsorship money that they are just giving straig=
ht to google to pay<br>
&gt; &gt; &gt; &gt; &gt; for hosting credits? Google are profiting in some =
minor way from these<br>
&gt; &gt; &gt; &gt; &gt; hosting credits being bought by us, and I assume w=
e aren&#39;t getting any<br>
&gt; &gt; &gt; &gt; &gt; sort of discounts here. Having google sponsor the =
credits costs google<br>
&gt; &gt; &gt; &gt; &gt; substantially less than having any other company g=
ive us money to do<br>
&gt; &gt; &gt; &gt; &gt; it.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The last I looked, Google GCP / Amazon AWS / Azure were=
 all pretty<br>
&gt; &gt; &gt; &gt; comparable in terms of what you get and what you pay fo=
r them.<br>
&gt; &gt; &gt; &gt; Obviously providers like Packet and Digital Ocean who o=
ffer bare-metal<br>
&gt; &gt; &gt; &gt; services are cheaper, but then you need to find someone=
 who is going<br>
&gt; &gt; &gt; &gt; to properly administer the various machines, install de=
cent<br>
&gt; &gt; &gt; &gt; monitoring, make sure that more storage is provisioned =
when we need<br>
&gt; &gt; &gt; &gt; more storage (which is basically all the time), make su=
re that the<br>
&gt; &gt; &gt; &gt; hardware is maintained in decent shape (pretty sure one=
 of the fd.o<br>
&gt; &gt; &gt; &gt; machines has had a drive in imminent-failure state for =
the last few<br>
&gt; &gt; &gt; &gt; months), etc.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Given the size of our service, that&#39;s a much better=
 plan (IMO) than<br>
&gt; &gt; &gt; &gt; relying on someone who a) isn&#39;t an admin by trade, =
b) has a million<br>
&gt; &gt; &gt; &gt; other things to do, and c) hasn&#39;t wanted to do it f=
or the past several<br>
&gt; &gt; &gt; &gt; years. But as long as that&#39;s the resources we have,=
 then we&#39;re paying<br>
&gt; &gt; &gt; &gt; the cloud tradeoff, where we pay more money in exchange=
 for fewer<br>
&gt; &gt; &gt; &gt; problems.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Admin for gitlab and CI is a full time role anyways. The sys=
tem is<br>
&gt; &gt; &gt; definitely not self sustaining without time being put in by =
you and<br>
&gt; &gt; &gt; anholt still. If we have $75k to burn on credits, and it was=
 diverted<br>
&gt; &gt; &gt; to just pay an admin to admin the real hw + gitlab/CI would =
that not<br>
&gt; &gt; &gt; be a better use of the money? I didn&#39;t know if we can af=
ford $75k for<br>
&gt; &gt; &gt; an admin, but suddenly we can afford it for gitlab credits?<=
br>
&gt; &gt;<br>
&gt; &gt; As I think about the time that I&#39;ve spent at google in less t=
han a<br>
&gt; &gt; year on trying to keep the lights on for CI and optimize our<br>
&gt; &gt; infrastructure in the current cloud environment, that&#39;s more =
than the<br>
&gt; &gt; entire yearly budget you&#39;re talking about here.=C2=A0 Saying =
&quot;let&#39;s just<br>
&gt; &gt; pay for people to do more work instead of paying for full-service=
<br>
&gt; &gt; cloud&quot; is not a cost optimization.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt; Yes, we could federate everything back out so everyone =
runs their own<br>
&gt; &gt; &gt; &gt; builds and executes those. Tinderbox did something real=
ly similar to<br>
&gt; &gt; &gt; &gt; that IIRC; not sure if Buildbot does as well. Probably =
rules out<br>
&gt; &gt; &gt; &gt; pre-merge testing, mind.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Why? does gitlab not support the model? having builds done i=
n parallel<br>
&gt; &gt; &gt; on runners closer to the test runners seems like it should b=
e a thing.<br>
&gt; &gt; &gt; I guess artifact transfer would cost less then as a result.<=
br>
&gt; &gt;<br>
&gt; &gt; Let&#39;s do some napkin math.=C2=A0 The biggest artifacts cost w=
e have in Mesa<br>
&gt; &gt; is probably meson-arm64/meson-arm (60MB zipped from meson-arm64,<=
br>
&gt; &gt; downloaded by 4 freedreno and 6ish lava, about 100 pipelines/day,=
<br>
&gt; &gt; makes ~1.8TB/month ($180 or so).=C2=A0 We could build a local sto=
rage next<br>
&gt; &gt; to the lava dispatcher so that the artifacts didn&#39;t have to c=
ontain<br>
&gt; &gt; the rootfs that came from the container (~2/3 of the insides of t=
he<br>
&gt; &gt; zip file), but that&#39;s another service to build and maintain.=
=C2=A0 Building<br>
&gt; &gt; the drivers once locally and storing it would save downloading th=
e<br>
&gt; &gt; other ~1/3 of the inside of the zip file, but that requires a big=
<br>
&gt; &gt; enough system to do builds in time.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m planning on doing a local filestore for google&#39;s lava=
 lab, since I<br>
&gt; &gt; need to be able to move our xml files off of the lava DUTs to get=
 the<br>
&gt; &gt; xml results we&#39;ve become accustomed to, but this would not bu=
bble up<br>
&gt; &gt; to being a priority for my time if I wasn&#39;t doing it anyway.=
=C2=A0 If it<br>
&gt; &gt; takes me a single day to set all this up (I estimate a couple of<=
br>
&gt; &gt; weeks), that costs my employer a lot more than sponsoring the cos=
ts of<br>
&gt; &gt; the inefficiencies of the system that has accumulated.<br>
&gt;<br>
&gt; I&#39;m not trying to knock the engineering works the CI contributors =
have<br>
&gt; done at all, but I&#39;ve never seen a real discussion about costs unt=
il<br>
&gt; now. Engineers aren&#39;t accountants.<br>
&gt;<br>
&gt; The thing we seem to be missing here is fiscal responsibility. I know<=
br>
&gt; this email is us being fiscally responsible, but it&#39;s kinda after =
the<br>
&gt; fact.<br>
&gt;<br>
&gt; I cannot commit my employer to spending a large amount of money (&gt; =
0<br>
&gt; actually) without a long and lengthy process with checks and bounds.<b=
r>
&gt; Can you?<br>
&gt;<br>
&gt; The X.org board has budgets and procedures as well. I as a developer<b=
r>
&gt; of Mesa should not be able to commit the X.org foundation to spending<=
br>
&gt; large amounts of money without checks and bounds.<br>
&gt;<br>
&gt; The CI infrastructure lacks any checks and bounds. There is no link<br=
>
&gt; between editing .gitlab-ci/* and cashflow. There is no link to me<br>
&gt; adding support for a new feature to llvmpipe that blows out test times=
<br>
&gt; (granted it won&#39;t affect CI budget but just an example).<br>
<br>
We&#39;re working to get the logging in place to know which projects<br>
exactly burn down the money so that we can take specific actions. If<br>
needed. So pretty soon you wont be able to just burn down endless<br>
amounts of cash with a few gitlab-ci commits. Or at least not for long<br>
until we catch you and you either fix things up or CI is gone for your<br>
project.<br>
<br>
&gt; The fact that clouds run on credit means that it&#39;s not possible to=
 say<br>
&gt; budget 30K and say when that runs out it runs out, you end up getting<=
br>
&gt; bills for ever increasing amounts that you have to cover, with nobody<=
br>
&gt; &quot;responsible&quot; for ever reducing those bills. Higher Faster F=
urther<br>
&gt; baby comes to mind.<br>
<br>
We&#39;re working on this, since it&#39;s the boards responsibility to be o=
n<br>
top of stuff. It&#39;s simply that we didn&#39;t expect a massive growth of=
<br>
this scale and this quickly, so we&#39;re a bit behind on the controlling<b=
r>
aspect.<br>
<br>
Also I guess it wasnt clear, but the board decision yesterday was the<br>
stop loss order where we cut the cord (for CI at least). So yeah the<br>
short term budget is firmly in place now.<br>
<br>
&gt; Has X.org actually allocated the remaining cash in it&#39;s bank accou=
nt<br>
&gt; to this task previously? Was there plans for this money that can&#39;t=
 be<br>
&gt; executed now because we have to pay the cloud fees? If we continue to<=
br>
&gt; May and the X.org bank account hits 0, can XDC happen?<br>
<br>
There&#39;s numbers elsewhere in this thread, but if you&#39;d read the<br>
original announcement it states that the stop loss would still<br>
guarantee that we can pay for everything for at least one year. We&#39;re<b=
r>
not going to get even close to 0 in the bank account.<br>
<br>
So yeah XDC happens, and it&#39;ll also still happen next year. Also fd.o<b=
r>
servers will keep running. The only thing we might need to switch off<br>
is the CI support.<br>
<br>
&gt; Budgeting and cloud is hard, the feedback loops are messy. In the old<=
br>
&gt; system the feedback loop was simple, we don&#39;t have admin time or m=
oney<br>
&gt; for servers we don&#39;t get the features, cloud allows us to get the<=
br>
&gt; features and enjoy them and at some point in the future the bill gets<=
br>
&gt; paid by someone else. Credit cards lifestyles all the way.<br>
<br>
Uh ... where exactly do you get the credit card approach from? SPI is<br>
legally not allowed to extend us a credit (we&#39;re not a legal org<br>
anymore), so if we hit 0 it&#39;s out real quick. No credit for us. If SPI<=
br>
isnt on top of that it&#39;s their loss (but they&#39;re getting pretty goo=
d<br>
at tracking stuff with the contractor they now have and all that).<br>
<br>
Which is not going to happen btw, if you&#39;ve read the announcement mail<=
br>
and all that.<br>
<br>
Cheers, Daniel<br>
<br>
&gt; Like maybe we can grow up here and find sponsors to cover all of this,=
<br>
&gt; but it still feels a bit backwards from a fiscal pov.<br>
&gt;<br>
&gt; Again I&#39;m not knocking the work people have done at all, CI is ver=
y<br>
&gt; valuable to the projects involved, but that doesn&#39;t absolve us fro=
m<br>
&gt; costs.<br>
&gt;<br>
&gt; Dave.<br>
<br>
<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
+41 (0) 79 365 57 48 - <a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" =
target=3D"_blank">http://blog.ffwll.ch</a><br>
_______________________________________________<br>
wayland-devel mailing list<br>
<a href=3D"mailto:wayland-devel@lists.freedesktop.org" target=3D"_blank">wa=
yland-devel@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/wayland-devel" re=
l=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/li=
stinfo/wayland-devel</a><br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><spa=
n style=3D"font-family:serif;display:block">Nuritzi Sanchez</span><span sty=
le=3D"color:rgb(153,153,153);font-family:sans-serif;display:block">Senior O=
pen Source Program Manager | GitLab</span><img width=3D"98" height=3D"37" s=
rc=3D"https://lh3.googleusercontent.com/lFQxFbGYJpI6e_oQkEJ6WVDr-9RAmCZgV7_=
vgKs8zLJzIsSDF13zot8wtdMqFvBq8OH6jPiv6kwszHf5r_YrSNoXKRdSb42dsyyw7oOSSan1Nu=
q8ud2AtaD4yBwM-1xtYAb7IMFz" style=3D"border: 0px; vertical-align: middle; m=
ax-width: 100%;"><br></div><div><b style=3D"font-size:13px;color:rgb(136,13=
6,136)"><br></b></div><div><b style=3D"font-size:13px;color:rgb(136,136,136=
)">Create, Collaborate, and Deploy together</b><br><div dir=3D"ltr"><div di=
r=3D"ltr"><font color=3D"#888888"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div style=3D"font-size:13px;line-height:1.3em"><div><a href=3D"h=
ttps://about.gitlab.com/free-trial/" style=3D"color:rgb(17,85,204)" target=
=3D"_blank">Free Trial</a>=C2=A0|=C2=A0<a href=3D"https://about.gitlab.com/=
products/" style=3D"color:rgb(17,85,204)" target=3D"_blank">Upgrade Now</a>=
=C2=A0|=C2=A0<a href=3D"https://about.gitlab.com/support/" style=3D"color:r=
gb(17,85,204)" target=3D"_blank">Contact Support</a>=C2=A0|=C2=A0<a href=3D=
"https://about.gitlab.com/community" style=3D"color:rgb(17,85,204)" target=
=3D"_blank">Community</a></div></div></div></div></div></font></div></div><=
/div></div></div></div></div></div>

--000000000000163a7e059fa9a4c8--

--===============0213765554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0213765554==--
