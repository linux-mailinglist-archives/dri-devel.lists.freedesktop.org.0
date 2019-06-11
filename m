Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038223D208
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 18:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD14C8921C;
	Tue, 11 Jun 2019 16:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9458921C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 16:18:25 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id g24so8300684vso.8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2019 09:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8yyqEz+HsuuSH3kaSWtNdx3RnuTiZaUeJ29gAuFXv3w=;
 b=N9vsbu4lBVFhRQBMIX3Q+hfDI3OHhR9mFsbqVIprB8QChxq63j9ZXyKl+ZWmLfIKX7
 j/ZmDnH+gPXOEMJA8mOfqamdFgaaNbPcABRRL/rr3vwubew/8fvZJLUSL+OJbKQj7p6B
 s6dXwuI+RrCWbfHH9NIFH7wiOfUiLqEqWnE3k5oOL48qdNuxej9JTUcM4BqB55qxy21p
 F8WSSlLC8bLg/yDOEsBU4OMlNlYw9g33cPzcMaI34SVXLRJZUJU9L5rHEJHYt7eQqydU
 7CmGhSEsJ9E0AyZnOLuubERwidpP7F6qAfD+hL2VLYGuGcY4Qd78atHPKkbKd0Y8tHOx
 miKA==
X-Gm-Message-State: APjAAAWqIb63HXLSvbl6M4I0fB36cNIS0+N1YZ/rm3VjvVwI0m+4ctIK
 M5LG1dec5KHrtd+XRHT6f3sIn4grrfP+mKtTgtW0Cg==
X-Google-Smtp-Source: APXvYqyv5R4UvPFPIjbritklpV9Ke9KHhMnB710ujLkBLpd7Ez+7uy/wNhBczOW9E8Qjd4BsY1oMfoH4vYKhUfMPTow=
X-Received: by 2002:a67:efd6:: with SMTP id s22mr31996031vsp.47.1560269905085; 
 Tue, 11 Jun 2019 09:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190606094722.23816-1-anders.roxell@linaro.org>
 <d6b79ee0-07c6-ad81-16b0-8cf929cc214d@xs4all.nl>
 <CADYN=9KY5=FzrkC7MKj9QnG-eM1NVuL00w8Xv4yU2r05rhr7WQ@mail.gmail.com>
 <c2ff2c77-5c14-4bc4-f59c-7012d272ec76@thinci.com>
 <1560240943.13886.1.camel@pengutronix.de>
 <221c8ef8-7adc-4383-93c9-9031dca590f0@xs4all.nl>
 <CADYN=9K7GwPGM_Eh5q-OZ9rcEPAjXw4BXy-m3a=QxmGuVruCUw@mail.gmail.com>
In-Reply-To: <CADYN=9K7GwPGM_Eh5q-OZ9rcEPAjXw4BXy-m3a=QxmGuVruCUw@mail.gmail.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 11 Jun 2019 13:18:12 -0300
Message-ID: <CAAEAJfC9vja5WwsNc5+MTVHLFg_P3zG=OZt_CuRR5eG-3iWD9Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] drivers: media: coda: fix warning same module names
To: Anders Roxell <anders.roxell@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=8yyqEz+HsuuSH3kaSWtNdx3RnuTiZaUeJ29gAuFXv3w=;
 b=2LM2ZSYQKSD2wUXmZNMN5IjNYbDLVe0zN5AX1tK/LZzMIHaaoBrp0BAwCxl9xlSoFQ
 qe4otJorYnX2aJUjhFmdja1w+IREmSQETdHTKrDf4p3CSNs+sfGRTGDyiGmHHXPzcKCq
 hVXKVDcJvWnAJTA/ZrKfR8oK7jF3S8YnFV5AL7MilyZDZzjlCXZpaeFVSqPoOc8gDQrO
 ZCO2VyHqedGxsVxImvtuz5iaaXlPx4gao0sxYnK20G73JhEeqXFfuccMF0MRLa0YIZ9H
 jrLtGB46XB5iT8wa8IpQnVffFZE6RBTbO4qNqaJlNIf2Ml2HBtqYBdQEnSgWaRynXOV3
 uKFQ==
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
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Lee Jones <lee.jones@linaro.org>,
 "marex@denx.de" <marex@denx.de>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "vivien.didelot@gmail.com" <vivien.didelot@gmail.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Mark Brown <broonie@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Networking <netdev@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matt Redfearn <matt.redfearn@thinci.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 David Miller <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Content-Type: multipart/mixed; boundary="===============1441903180=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1441903180==
Content-Type: multipart/alternative; boundary="00000000000072660f058b0ea58d"

--00000000000072660f058b0ea58d
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 11, 2019, 1:01 PM Anders Roxell <anders.roxell@linaro.org>
wrote:

> On Tue, 11 Jun 2019 at 10:21, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 6/11/19 10:15 AM, Philipp Zabel wrote:
> > > Hi,
> > >
> > > On Mon, 2019-06-10 at 13:14 +0000, Matt Redfearn wrote:
> > >>
> > >> On 10/06/2019 14:03, Anders Roxell wrote:
> > >>> On Thu, 6 Jun 2019 at 12:13, Hans Verkuil <hverkuil@xs4all.nl>
> wrote:
> > >>>>
> > >>>> On 6/6/19 11:47 AM, Anders Roxell wrote:
> > >>>>> When building with CONFIG_VIDEO_CODA and CONFIG_CODA_FS enabled as
> > >>>>> loadable modules, we see the following warning:
> > >>>>>
> > >>>>> warning: same module names found:
> > >>>>>    fs/coda/coda.ko
> > >>>>>    drivers/media/platform/coda/coda.ko
> > >>>>>
> > >>>>> Rework so media coda matches the config fragment. Leaving CODA_FS
> as is
> > >>>>> since thats a well known module.
> > >>>>>
> > >>>>> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > >>>>> ---
> > >>>>>   drivers/media/platform/coda/Makefile | 4 ++--
> > >>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
> > >>>>>
> > >>>>> diff --git a/drivers/media/platform/coda/Makefile
> b/drivers/media/platform/coda/Makefile
> > >>>>> index 54e9a73a92ab..588e6bf7c190 100644
> > >>>>> --- a/drivers/media/platform/coda/Makefile
> > >>>>> +++ b/drivers/media/platform/coda/Makefile
> > >>>>> @@ -1,6 +1,6 @@
> > >>>>>   # SPDX-License-Identifier: GPL-2.0-only
> > >>>>>
> > >>>>> -coda-objs := coda-common.o coda-bit.o coda-gdi.o coda-h264.o
> coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
> > >>>>> +video-coda-objs := coda-common.o coda-bit.o coda-gdi.o
> coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o
> > >>>>>
> > >>>>> -obj-$(CONFIG_VIDEO_CODA) += coda.o
> > >>>>> +obj-$(CONFIG_VIDEO_CODA) += video-coda.o
> > >>>>
> > >>>> How about imx-coda? video-coda suggests it is part of the video
> subsystem,
> > >>>> which it isn't.
> > >>>
> > >>> I'll resend a v2 shortly with imx-coda instead.
> > >
> > > I'd be in favor of calling it "coda-vpu" instead.
> >
> > Fine by me!
> >
> > >
> > >> What about other vendor SoCs implementing the Coda IP block which are
> > >> not an imx? I'd prefer a more generic name - maybe media-coda.
> > >
> > > Right, this driver can be used on other SoCs [1].
> >
> > Good point.
>
> OK, so I'll change it to 'media-coda'.
>
>
>
>
As suggested by Philipp, coda-vpu seems the most accurate name.

Thanks,
Ezequiel



Cheers,
> Anders
>
> >
> > Regards,
> >
> >         Hans
> >
> > >
> > > [1]
> https://www.mail-archive.com/linux-media@vger.kernel.org/msg146498.html
> > >
> > > regards
> > > Philipp
> > >
> >
>

--00000000000072660f058b0ea58d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Jun 11, 2019, 1:01 PM Anders Roxell &lt;<a hre=
f=3D"mailto:anders.roxell@linaro.org" target=3D"_blank" rel=3D"noreferrer">=
anders.roxell@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On Tue, 11 Jun 2019 at 10:21, Hans Verkuil &lt;<a href=3D"mailto:hverk=
uil@xs4all.nl" rel=3D"noreferrer noreferrer" target=3D"_blank">hverkuil@xs4=
all.nl</a>&gt; wrote:<br>
&gt;<br>
&gt; On 6/11/19 10:15 AM, Philipp Zabel wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; On Mon, 2019-06-10 at 13:14 +0000, Matt Redfearn wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 10/06/2019 14:03, Anders Roxell wrote:<br>
&gt; &gt;&gt;&gt; On Thu, 6 Jun 2019 at 12:13, Hans Verkuil &lt;<a href=3D"=
mailto:hverkuil@xs4all.nl" rel=3D"noreferrer noreferrer" target=3D"_blank">=
hverkuil@xs4all.nl</a>&gt; wrote:<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On 6/6/19 11:47 AM, Anders Roxell wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; When building with CONFIG_VIDEO_CODA and CONFIG_C=
ODA_FS enabled as<br>
&gt; &gt;&gt;&gt;&gt;&gt; loadable modules, we see the following warning:<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; warning: same module names found:<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 fs/coda/coda.ko<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 drivers/media/platform/coda/coda.ko<=
br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Rework so media coda matches the config fragment.=
 Leaving CODA_FS as is<br>
&gt; &gt;&gt;&gt;&gt;&gt; since thats a well known module.<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: Anders Roxell &lt;<a href=3D"mailt=
o:anders.roxell@linaro.org" rel=3D"noreferrer noreferrer" target=3D"_blank"=
>anders.roxell@linaro.org</a>&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; ---<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0drivers/media/platform/coda/Makefile =
| 4 ++--<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 de=
letions(-)<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; diff --git a/drivers/media/platform/coda/Makefile=
 b/drivers/media/platform/coda/Makefile<br>
&gt; &gt;&gt;&gt;&gt;&gt; index 54e9a73a92ab..588e6bf7c190 100644<br>
&gt; &gt;&gt;&gt;&gt;&gt; --- a/drivers/media/platform/coda/Makefile<br>
&gt; &gt;&gt;&gt;&gt;&gt; +++ b/drivers/media/platform/coda/Makefile<br>
&gt; &gt;&gt;&gt;&gt;&gt; @@ -1,6 +1,6 @@<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0# SPDX-License-Identifier: GPL-2.0-on=
ly<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -coda-objs :=3D coda-common.o coda-bit.o coda-gdi=
.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; +video-coda-objs :=3D coda-common.o coda-bit.o co=
da-gdi.o coda-h264.o coda-mpeg2.o coda-mpeg4.o coda-jpeg.o<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; -obj-$(CONFIG_VIDEO_CODA) +=3D coda.o<br>
&gt; &gt;&gt;&gt;&gt;&gt; +obj-$(CONFIG_VIDEO_CODA) +=3D video-coda.o<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; How about imx-coda? video-coda suggests it is part of=
 the video subsystem,<br>
&gt; &gt;&gt;&gt;&gt; which it isn&#39;t.<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; I&#39;ll resend a v2 shortly with imx-coda instead.<br>
&gt; &gt;<br>
&gt; &gt; I&#39;d be in favor of calling it &quot;coda-vpu&quot; instead.<b=
r>
&gt;<br>
&gt; Fine by me!<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&gt; What about other vendor SoCs implementing the Coda IP block w=
hich are<br>
&gt; &gt;&gt; not an imx? I&#39;d prefer a more generic name - maybe media-=
coda.<br>
&gt; &gt;<br>
&gt; &gt; Right, this driver can be used on other SoCs [1].<br>
&gt;<br>
&gt; Good point.<br>
<br>
OK, so I&#39;ll change it to &#39;media-coda&#39;.<br><br><br><br></blockqu=
ote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">As suggested =
by Philipp, coda-vpu seems the most accurate name.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Ezequiel</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
Cheers,<br>
Anders<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hans<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://www.mail-archive.com/linux-media@vger.kern=
el.org/msg146498.html" rel=3D"noreferrer noreferrer noreferrer" target=3D"_=
blank">https://www.mail-archive.com/linux-media@vger.kernel.org/msg146498.h=
tml</a><br>
&gt; &gt;<br>
&gt; &gt; regards<br>
&gt; &gt; Philipp<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div></div></div>

--00000000000072660f058b0ea58d--

--===============1441903180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1441903180==--
