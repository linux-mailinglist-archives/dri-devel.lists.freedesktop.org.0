Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 178387B4148
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 16:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF3410E176;
	Sat, 30 Sep 2023 14:55:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4CB10E050
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 11:41:26 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id
 ada2fe7eead31-452951b27d0so7161026137.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Sep 2023 04:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696074085; x=1696678885; darn=lists.freedesktop.org;
 h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fszdgxzzZZpOO+VaNrm4ebEs0n9XiW5PJ04/3gmSy9Y=;
 b=TrjVUvrHaby7GAfnfA1B5uDqqG76uKpoiez+8uEBAuo3hK1jLnSUg6ECrjUZ/I3qOz
 aUYulok5rjbWOWZe4JVABsy6uRuZPc0J/vtQtB5wymaSwKNsEgn528bWfqDe4EC3NFo4
 O/8HkL8t1fQEhwDEpXr9w6ADYeJtOSmXEJRhlU0+QMBj3Jv2ieBHrsHalADrnpBhWXjC
 izIukHLBjMAE0J8FbImG43VHUgSaelfys7qMUnh1bumm7ATfE2TuaR310uwe53KqF6fT
 mNxI+016jx9uxALpNqoX0XNQ40KNWGdbOiEDYUjk5EnyMGhRC6CmsRZg9VjKObfILnFf
 PbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696074085; x=1696678885;
 h=mime-version:subject:references:in-reply-to:message-id:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fszdgxzzZZpOO+VaNrm4ebEs0n9XiW5PJ04/3gmSy9Y=;
 b=SViwsQyJZnm83OXrfuGNft4MiWLrsTFQA+e5wkX2Kx6yjZln1IRm5bMZjk97k/HnE6
 4wuUeSYfSrzfDiRmLL0vC1xUggO33f/AvE/0X/o6exoJIxDytDHTdSq0IrGKHqyxATy4
 CpLZevEaILMY2j6U4PFRwrfhWqy9xeAkzZ3tABuYKJVfN7PP8zMBlhxT2pKUYlkKBhkt
 wTvbKqX4TAkotK0IGoL7zom5DIgb72Exivl01J6FcLGIroKv1hWoRehJOjcTvHVrP56y
 N0w2h0JfxgfjOigNxDx9FQw1rJnXRSlOqLEeZOu6cF2x5XHw5/SSak3TJUhJZFl4IbHC
 8vCA==
X-Gm-Message-State: AOJu0YxqNgxb5Yie4lJ6rESYlPTi6x3NFegdXFTxjiOnJx96bvgV7e8u
 Smjg6f/NLzbRRQueie6fRzk=
X-Google-Smtp-Source: AGHT+IFy28lQezSNGrTquxr46WWVY55r5ul295H2ALyLw9JTExkcL7y791j+6LDTvEMbPkG/Cvl8CQ==
X-Received: by 2002:a67:fd50:0:b0:452:84fd:4a0a with SMTP id
 g16-20020a67fd50000000b0045284fd4a0amr6080352vsr.17.1696074085067; 
 Sat, 30 Sep 2023 04:41:25 -0700 (PDT)
Received: from [192.168.1.147] (097-104-074-213.res.spectrum.com.
 [97.104.74.213]) by smtp.gmail.com with ESMTPSA id
 p12-20020a67a60c000000b0045290c21ecfsm3760626vse.6.2023.09.30.04.41.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 30 Sep 2023 04:41:24 -0700 (PDT)
Date: Sat, 30 Sep 2023 07:41:15 -0400
From: Douglas Cooper <douglas.cooper1@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Doug Anderson
 <dianders@chromium.org>
Message-ID: <823b5c4e-6b26-4818-be71-72d36681c70f@Spark>
In-Reply-To: <CAD=FV=WrA+0VjoSOVFh394W=Utu7ArvDsAV_+BcpptDi4o_TBQ@mail.gmail.com>
References: <CACJMzRE=1S-aD4o68WHan7yYQb3zoLTZiUsMJw2B3d91O4D0ng@mail.gmail.com>
 <20230929215041.GC28737@pendragon.ideasonboard.com>
 <CAD=FV=WrA+0VjoSOVFh394W=Utu7ArvDsAV_+BcpptDi4o_TBQ@mail.gmail.com>
Subject: Re: ti-sn65dsi86 linux driver using dsi clock source for pll
X-Readdle-Message-ID: 823b5c4e-6b26-4818-be71-72d36681c70f@Spark
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="65180962_6c50d35f_9a5b"
X-Mailman-Approved-At: Sat, 30 Sep 2023 14:55:24 +0000
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

--65180962_6c50d35f_9a5b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Doug

That=E2=80=99s really good feedback. Thanks so much for taking the time t=
o outline that. I=E2=80=99ll keep investigating and dig into those areas =
you mentioned.

I should have mentioned I=E2=80=99m also using the chip in conjunction wi=
th a full size dp connector which appears to be supported. Also, besides =
the pll not locking I=E2=80=99m seeing an issue with the chip reporting t=
here is no display connected when it reads the SN=5FHPD=5FDISABLE=5FREG i=
n the ti=5Fsn=5Fbridge=5Fdetect function. This seems bizarre considering =
it reports accurately when I remove the module and i2cget the value. I wa=
s thinking this could be a false negative if the driver is actively tryin=
g to configure it and it=E2=80=99s failing.

Doug C.
On Sep 29, 2023 at 7:25 PM -0400, Doug Anderson <dianders=40chromium.org>=
, wrote:
> Hi,
>
>
> On =46ri, Sep 29, 2023 at 2:50=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart=40ideasonboard.com> wrote:
> >
> > Hi Doug,
> >
> > CC'ing the dri-devel mailing list and Douglas Anderson.
> >
> > On =46ri, Sep 29, 2023 at 03:36:52PM -0400, Douglas Cooper wrote:
> > > Hello,
> > >
> > > I've been trying to get the ti-sn65dsi86 to work with the dsi bus a=
s the clk
> > > source (refclk grounded) and have concluded that the pll is not get=
ting locked.
> > > Assuming the hardware is sound, have you ever seen this topology ev=
aluated
> > > before=3F I'm questioning if that was a use case considered in the =
driver
> > > development. I will continue to actively investigate this.
> >
> > I don't think I've tested this mode, sorry. Maybe other people on the=

> > list have some experience with this.
>
> I wouldn't suggest using this mode unless you have no choice.
>
> =46rom my recollection we tried to use this mode on the very first
> prototype board of sdm845-cheza. It turned out to be =5Fvery=5F limitin=
g
> and it couldn't properly meet the timing requirements of the panel we
> were using. I think someone hacked things up temporarily by
> underdriving the panel at a much lower refresh rate and we eventually
> got it working, but we quickly abandoned trying to use ti-sn65dsi86 in
> this mode and threw away all of those old prototype boards.
>
> Since then, I've =5Ftried=5F to keep the code in ti-sn65dsi86 supportin=
g
> this mode alive, but I'm not super confident in it.
>
> One thing that sticks out in particular in my mind is a bit of code in
> ti=5Fsn65dsi86=5Fresume(). You can see there that we don't call
> ti=5Fsn65dsi86=5Fenable=5Fcomms() if there's no reference clock. I beli=
eve
> that I added this code more out of guessing than anything else, since
> I don't recall this being well documented in the manual and, when the
> code was added, the early prototypes of cheza were long, long gone. I
> believe (=3F) I guessed this by seeing that I couldn't do things like
> AUX channel transfers without configuring the PLL and the PLL was
> based on the reference clock. Ah, here ya go. I documented my thought
> process in commit b137406d9679 (=22drm/bridge: ti-sn65dsi86: If refclk,=

> DP AUX can happen w/out pre-enable=22). Though looking at it now, it
> seems odd that the code waiting for the PLL to lock doesn't happen
> until ti=5Fsn=5Flink=5Ftraining(). Hmmm...
>
> If you have tested and see that things work differently than I
> guessed, feel free to send up a patch=21
>
> One thing to note is that if, indeed, you need a reference clock
> before you can do AUX transactions then it's going to be really hard
> to make this work together with the generic =22edp-panel=22. Specifical=
ly
> you'd need to turn on the MIPI source clock =5Fbefore=5F you can read t=
he
> EDID of the panel, but without the EDID you won't really know what
> MIPI clock you should use. :-/
>
> -Doug

--65180962_6c50d35f_9a5b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<html xmlns=3D=22http://www.w3.org/1999/xhtml=22>
<head>
<title></title>
</head>
<body>
<div name=3D=22messageBodySection=22>
<div dir=3D=22auto=22>Hi Doug<br />
<br />
That=E2=80=99s really good feedback. Thanks so much for taking the time t=
o outline that. I=E2=80=99ll keep investigating and dig into those areas =
you mentioned.&=23160;<br />
<br />
I should have mentioned I=E2=80=99m also using the chip in conjunction wi=
th a full size dp connector which appears to be supported. Also, besides =
the pll not locking I=E2=80=99m seeing an issue with the chip reporting t=
here is no display connected when it reads the SN=5FHPD=5FDISABLE=5FREG i=
n the ti=5Fsn=5Fbridge=5Fdetect function. This seems bizarre considering =
it reports accurately when I remove the module and i2cget the value. I wa=
s thinking this could be a false negative if the driver is actively tryin=
g to configure it and it=E2=80=99s failing.&=23160;<br />
<br />
Doug C.</div>
</div>
<div name=3D=22messageReplySection=22>On Sep 29, 2023 at 7:25 PM -0400, D=
oug Anderson &lt;dianders=40chromium.org&gt;, wrote:<br />
<blockquote type=3D=22cite=22 style=3D=22border-left-color: grey; border-=
left-width: thin; border-left-style: solid; margin: 5px 5px;padding-left:=
 10px;=22>Hi,<br />
<br />
<br />
On =46ri, Sep 29, 2023 at 2:50=E2=80=AFPM Laurent Pinchart<br />
&lt;laurent.pinchart=40ideasonboard.com&gt; wrote:<br />
<blockquote type=3D=22cite=22><br />
Hi Doug,<br />
<br />
CC'ing the dri-devel mailing list and Douglas Anderson.<br />
<br />
On =46ri, Sep 29, 2023 at 03:36:52PM -0400, Douglas Cooper wrote:<br />
<blockquote type=3D=22cite=22>Hello,<br />
<br />
I've been trying to get the ti-sn65dsi86 to work with the dsi bus as the =
clk<br />
source (refclk grounded) and have concluded that the pll is not getting l=
ocked.<br />
Assuming the hardware is sound, have you ever seen this topology evaluate=
d<br />
before=3F I'm questioning if that was a use case considered in the driver=
<br />
development. I will continue to actively investigate this.<br /></blockqu=
ote>
<br />
I don't think I've tested this mode, sorry. Maybe other people on the<br =
/>
list have some experience with this.<br /></blockquote>
<br />
I wouldn't suggest using this mode unless you have no choice.<br />
<br />
=46rom my recollection we tried to use this mode on the very first<br />
prototype board of sdm845-cheza. It turned out to be =5Fvery=5F limiting<=
br />
and it couldn't properly meet the timing requirements of the panel we<br =
/>
were using. I think someone hacked things up temporarily by<br />
underdriving the panel at a much lower refresh rate and we eventually<br =
/>
got it working, but we quickly abandoned trying to use ti-sn65dsi86 in<br=
 />
this mode and threw away all of those old prototype boards.<br />
<br />
Since then, I've =5Ftried=5F to keep the code in ti-sn65dsi86 supporting<=
br />
this mode alive, but I'm not super confident in it.<br />
<br />
One thing that sticks out in particular in my mind is a bit of code in<br=
 />
ti=5Fsn65dsi86=5Fresume(). You can see there that we don't call<br />
ti=5Fsn65dsi86=5Fenable=5Fcomms() if there's no reference clock. I believ=
e<br />
that I added this code more out of guessing than anything else, since<br =
/>
I don't recall this being well documented in the manual and, when the<br =
/>
code was added, the early prototypes of cheza were long, long gone. I<br =
/>
believe (=3F) I guessed this by seeing that I couldn't do things like<br =
/>
AUX channel transfers without configuring the PLL and the PLL was<br />
based on the reference clock. Ah, here ya go. I documented my thought<br =
/>
process in commit b137406d9679 (=22drm/bridge: ti-sn65dsi86: If refclk,<b=
r />
DP AUX can happen w/out pre-enable=22). Though looking at it now, it<br /=
>
seems odd that the code waiting for the PLL to lock doesn't happen<br />
until ti=5Fsn=5Flink=5Ftraining(). Hmmm...<br />
<br />
If you have tested and see that things work differently than I<br />
guessed, feel free to send up a patch=21<br />
<br />
One thing to note is that if, indeed, you need a reference clock<br />
before you can do AUX transactions then it's going to be really hard<br /=
>
to make this work together with the generic =22edp-panel=22. Specifically=
<br />
you'd need to turn on the MIPI source clock =5Fbefore=5F you can read the=
<br />
EDID of the panel, but without the EDID you won't really know what<br />
MIPI clock you should use. :-/<br />
<br />
-Doug<br /></blockquote>
</div>
</body>
</html>

--65180962_6c50d35f_9a5b--

