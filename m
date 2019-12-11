Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC57311C897
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 09:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19DC36ECCB;
	Thu, 12 Dec 2019 08:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A700A6EAAE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 18:56:32 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id u16so20380999ilg.10
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2019 10:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FXDuOY6OIFeAxOq4lQEPjFZtyMdrQlKrmry/PMN8Mck=;
 b=oml6dyIt++quY5Wv8Dq/8GvY2V7UgLZvEO3ibZL5FroCEX4eu2gAooNI+1OXmwDXAW
 qSS8Zcv4tfuaVFuZwps1UFr/o3d9q1GxyH+sEGbORT0VlGJKJ+qLRSp3SsrL3Cs50Mlu
 WyYPFDvnwMGIEjVz1TUp5ud9hcGMOjibW3qEr5wP4vv01ayQYRIgW9v2yULTd/t5XVHd
 A6RSoHwolF/WjnXNa5DUXjvkiKjMdywW2h+eiU3QuN6KMETqNqTF7DQikzzfpgUkPl2h
 2Gmv84Ihziq1QkUdrkUzuq8SY/0XPccVCVEuSRx+Nt689damr8f4JEtRoESMaY61OYnE
 Y68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FXDuOY6OIFeAxOq4lQEPjFZtyMdrQlKrmry/PMN8Mck=;
 b=F/q9DMo3CAkQ3q4F5KdgqFO3gFQ3DzCKmyo81JARwOZZhdi8Br+ldABneqQjkDTo9I
 fGvJX6De8Lq0lgTRfvZO4RcyGpczwsKs2KyFhUstPN2DhBhofsWQh2/QiwaYsDItwt33
 uhTG4a7Kagk8vuVZrLXV15cG6bnSAKAq2o43UTm3Z4xlBeGkz6nW91M60X/4I1jg5UdO
 1PPsKRetuKeBNzk/CjpHWWzfmH6oDGMw3LkEFJHMircCa56dmlG9PX+ePvJFQg+F24Kl
 +56kqr1/Mi2f4eJsyIAXNrhLn9wITDYfBScaCWvGdKUEgNf3GV+EJIQBChF7s3tXNCCC
 122A==
X-Gm-Message-State: APjAAAVZtqWfA8zMXe57laMovgtzEhHPo9HVQXvpSklFAIb4oJZVfJOs
 Wkf9aovyIUPVVMDDeXvNoEv3BNForf4l2Vfj7bATxeWw
X-Google-Smtp-Source: APXvYqz6/6kpUeRaM01Bo6Hjmmp8cO+WcvF2VzS6X5+AGcTVxWO/ZjLT+jAHn4f9Ka/ycXAd3e/l4uWedppoqsxbC2o=
X-Received: by 2002:a92:ccd0:: with SMTP id u16mr4203985ilq.215.1576090592011; 
 Wed, 11 Dec 2019 10:56:32 -0800 (PST)
MIME-Version: 1.0
References: <CAAaE5fP+Znp1O4t=M7bwor8FH=f-z9CL0wQ9NTjtLSwjFb0LoQ@mail.gmail.com>
 <CAF6AEGtpPoZK4FCSLN=285hRQihhEjaLZTO82eFdKmwYWQMSHg@mail.gmail.com>
In-Reply-To: <CAF6AEGtpPoZK4FCSLN=285hRQihhEjaLZTO82eFdKmwYWQMSHg@mail.gmail.com>
From: ggermanres <ggermanres@gmail.com>
Date: Wed, 11 Dec 2019 20:56:19 +0200
Message-ID: <CAAaE5fNEGrh_6iGT11fdMaC+Exz3Sj3siqiqG-OaWUdpFjQ5Yg@mail.gmail.com>
Subject: Re: Question about MSM Driver
To: Rob Clark <robdclark@gmail.com>
X-Mailman-Approved-At: Thu, 12 Dec 2019 08:55:06 +0000
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
Cc: Jeffrey Hugo <jhugo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0427294964=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0427294964==
Content-Type: multipart/alternative; boundary="000000000000deeab00599722f6b"

--000000000000deeab00599722f6b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. This is DSI command to panel.

I saw same problem in 96boards.org discuss. On Android its all ok, but on
Linux flickering.

Yes, panel in video mode. Where is pageflip event in driver? Or where add
sleep/delay between update buffer? I think buffer copy by DMA (module) to
panel. But for this needed some request event (or irq). In this case I want
to try catch problem by adding software delay. And make decision about this
problem, it with display, hardware or with something else.

=D1=81=D1=80, 11 =D0=B4=D0=B5=D0=BA. 2019 =D0=B3. =D0=B2 19:52, Rob Clark <=
robdclark@gmail.com>:

> On Wed, Dec 11, 2019 at 6:22 AM ggermanres <ggermanres@gmail.com> wrote:
> >
> > Hello.
> >
> > I have question about MSM Driver.
> >
> > I using Dragonboard 410 with ili9881 display. This is hobby project.
> This display from xiaomi redmi 3x/4x. I made PCB board for connect them. =
I
> changed dts, created panel driver (this all on buildroot with my config).
> All ok. Run platform. I saw linux console. Freedreno (opengl test app) is
> working fine. But I saw flickering like on old monitor I saw from phone. =
I
> tried changing timings, but this helped a little bit (I used it from dtsi
> from xiaomi repository).
> >
> > I think this is with vsync problem. Your driver support DSI_VSYNC input=
?
> In panel driver I sent command for vblank, on oscilloscope I saw pulse on
> this pin 60Hz. I tried find path in your driver code, added some debug
> output in code with sync. I saw MDSS_DSI_0_TRIG_CTRL configured with
> support TE. But Its not helped for me.
> >
> > If you know something, tell me. Or how change driver to support
> DSI_VSYNC input.
> >
>
> I guess this is a command mode panel?  So you'd be caring about the TE
> signal?  As far as I understand (from, iirc, jhugo) this was handled
> by the hardware and not exposed to the driver on older devices.
>
> If it is a video mode panel, the problem could be different (userspace
> not waiting for pageflip event?)
>
> BR,
> -R
>

--000000000000deeab00599722f6b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Yes. Th=
is is DSI command to panel.<br><br>I saw same problem in <a href=3D"http://=
96boards.org">96boards.org</a> discuss. On Android its all ok, but on Linux=
 flickering.</div><div dir=3D"ltr"><br></div><div>Yes, panel in video mode.=
 Where is pageflip event in driver? Or where add sleep/delay between=C2=A0u=
pdate buffer? I think buffer copy by DMA (module) to panel. But for this ne=
eded some request event (or irq). In this case I want to try catch problem =
by adding software delay. And make decision about this problem, it with dis=
play, hardware or with something else.</div></div></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 11 =
=D0=B4=D0=B5=D0=BA. 2019 =D0=B3. =D0=B2 19:52, Rob Clark &lt;<a href=3D"mai=
lto:robdclark@gmail.com">robdclark@gmail.com</a>&gt;:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, Dec 11, 2019 at 6:22 AM ggerm=
anres &lt;<a href=3D"mailto:ggermanres@gmail.com" target=3D"_blank">ggerman=
res@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello.<br>
&gt;<br>
&gt; I have question about MSM Driver.<br>
&gt;<br>
&gt; I using Dragonboard 410 with ili9881 display. This is hobby project. T=
his display from xiaomi redmi 3x/4x. I made PCB board for connect them. I c=
hanged dts, created panel driver (this all on buildroot with my config). Al=
l ok. Run platform. I saw linux console. Freedreno (opengl test app) is wor=
king fine. But I saw flickering like on old monitor I saw from phone. I tri=
ed changing timings, but this helped a little bit (I used it from dtsi from=
 xiaomi repository).<br>
&gt;<br>
&gt; I think this is with vsync problem. Your driver support DSI_VSYNC inpu=
t? In panel driver I sent command for vblank, on oscilloscope I saw pulse o=
n this pin 60Hz. I tried find path in your driver code, added some debug ou=
tput in code with sync. I saw MDSS_DSI_0_TRIG_CTRL configured with support =
TE. But Its not helped for me.<br>
&gt;<br>
&gt; If you know something, tell me. Or how change driver to support DSI_VS=
YNC input.<br>
&gt;<br>
<br>
I guess this is a command mode panel?=C2=A0 So you&#39;d be caring about th=
e TE<br>
signal?=C2=A0 As far as I understand (from, iirc, jhugo) this was handled<b=
r>
by the hardware and not exposed to the driver on older devices.<br>
<br>
If it is a video mode panel, the problem could be different (userspace<br>
not waiting for pageflip event?)<br>
<br>
BR,<br>
-R<br>
</blockquote></div>

--000000000000deeab00599722f6b--

--===============0427294964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0427294964==--
