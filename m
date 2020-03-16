Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35AC187269
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 19:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854A36E4AF;
	Mon, 16 Mar 2020 18:34:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FA089FD7;
 Mon, 16 Mar 2020 18:34:24 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 7so10229947pgr.2;
 Mon, 16 Mar 2020 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S5zX4l1j9CvPAej0RNLGJyLbn7LUFM/EsYy2Sfoppio=;
 b=DZ5b7JGngDSc2wD44AZDvXRpMx22MFJZCqVYvPBkW2EBmVeWxPNRXj0r6apgYT7AOm
 vR38poaOd1Qx4ajOXqpvLmiHKvuo9oBA+Y4Z4H94pQC0VAvwdv3bld5L0I0UJdfLPN/e
 jOJoA3cvC4xayx6uBOsC1UBDsbRC6oPckrYuqCLYpgCp8M4nRHNZCxwEEHvl+HXu5yCD
 QCVrM8eZ3zklOiSSR0AF+DX8yAqXGcwN0pNM75aK/3G+/3/LpoOIM97EYPlyqlia3bi3
 D1Ufns3b949bay5WHUmn0js3kQoLYil7UdEN/Z6KnpqGVqtUgNr2fMp6H/h+wrzhRd7U
 5icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S5zX4l1j9CvPAej0RNLGJyLbn7LUFM/EsYy2Sfoppio=;
 b=tBecSHIyikeX5UGbZOpNTrhxVJix7kQ7R8udy9MyHzSGEF53/sRAq8YO5eO+K0p44B
 4GY7wwscs28FAZBF8jcvliBdbK5TXYkIScpMZVUUm/LrdxmX6yDarMou524iN9wvLu3Q
 pv09zUL9Aak26msRQd43FamaXMguP0s/DyYBu1mALwbGHzGsxzYtIAQ/4Ltl1gwysNvZ
 ckgCaZx/+nbu3Fgpf85+DMBpGD1C1nPVEfE6X+LUNcuqo+NorZnWEsOOVrdNvfJhbzgD
 yYVZtk5H1pmNXfeofA9IFBIi45HfvVxdiP3V3R0KM4kPM7yfyDAQQVNj4IblheqHhI5s
 JyEA==
X-Gm-Message-State: ANhLgQ3mtPtc/ABuZb0iWDPVXjCQmPr6hoM4LaZgQgZ+Xwq7IwNzuut0
 K669jDvW4N8o4cdxeV1UoON9okiwwQqeSAi7X+o=
X-Google-Smtp-Source: ADFU+vvzEzwLS1SS4ZC9wPYXkqYWIDapbf3VNaPrQudO0+hRb8PlW9SYSH2sLdZC1QlahxWNMUxggtzm7Y1s/8in15o=
X-Received: by 2002:a62:5c87:: with SMTP id q129mr999169pfb.82.1584383663870; 
 Mon, 16 Mar 2020 11:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAAxE2A4q9sZDz8vSLAvT0HH4BGukf8Ug68eqSV1ojqrm_5uFFg@mail.gmail.com>
 <170e13edbb0.27ad.c6988b7ea6112e3e892765a0d4287e0c@jlekstrand.net>
 <CAAxE2A6hMs2Ngd4zEv+hEJnEUKmPDuXmeWUaUU-4YCTRHNzr1w@mail.gmail.com>
 <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
In-Reply-To: <e470a1d0-cf91-5811-d280-322e005888a8@daenzer.net>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 16 Mar 2020 14:33:47 -0400
Message-ID: <CAAxE2A5D2HaqjS52jymMbwOUEsaXG_cMeeA9_esqaC54-52Kgw@mail.gmail.com>
Subject: Re: [Mesa-dev] Plumbing explicit synchronization through the Linux
 ecosystem
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>, Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>, linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============1916475863=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1916475863==
Content-Type: multipart/alternative; boundary="00000000000079165e05a0fd11da"

--00000000000079165e05a0fd11da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2020 at 5:57 AM Michel D=C3=A4nzer <michel@daenzer.net> wro=
te:

> On 2020-03-16 4:50 a.m., Marek Ol=C5=A1=C3=A1k wrote:
> > The synchronization works because the Mesa driver waits for idle (drain=
s
> > the GFX pipeline) at the end of command buffers and there is only 1
> > graphics queue, so everything is ordered.
> >
> > The GFX pipeline runs asynchronously to the command buffer, meaning the
> > command buffer only starts draws and doesn't wait for completion. If th=
e
> > Mesa driver didn't wait at the end of the command buffer, the command
> > buffer would finish and a different process could start execution of it=
s
> > own command buffer while shaders of the previous process are still
> running.
> >
> > If the Mesa driver submits a command buffer internally (because it's
> full),
> > it doesn't wait, so the GFX pipeline doesn't notice that a command buff=
er
> > ended and a new one started.
> >
> > The waiting at the end of command buffers happens only when the flush i=
s
> > external (Swap buffers, glFlush).
> >
> > It's a performance problem, because the GFX queue is blocked until the
> GFX
> > pipeline is drained at the end of every frame at least.
> >
> > So explicit fences for SwapBuffers would help.
>
> Not sure what difference it would make, since the same thing needs to be
> done for explicit fences as well, doesn't it?
>

No. Explicit fences don't require userspace to wait for idle in the command
buffer. Fences are signalled when the last draw is complete and caches are
flushed. Before that happens, any command buffer that is not dependent on
the fence can start execution. There is never a need for the GPU to be idle
if there is enough independent work to do.

Marek

--00000000000079165e05a0fd11da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Mar 16, 2020 at 5:57 AM Michel D=C3=
=A4nzer &lt;<a href=3D"mailto:michel@daenzer.net" target=3D"_blank">michel@=
daenzer.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 2020-03-16 4:50 a.m., Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; The synchronization works because the Mesa driver waits for idle (drai=
ns<br>
&gt; the GFX pipeline) at the end of command buffers and there is only 1<br=
>
&gt; graphics queue, so everything is ordered.<br>
&gt; <br>
&gt; The GFX pipeline runs asynchronously to the command buffer, meaning th=
e<br>
&gt; command buffer only starts draws and doesn&#39;t wait for completion. =
If the<br>
&gt; Mesa driver didn&#39;t wait at the end of the command buffer, the comm=
and<br>
&gt; buffer would finish and a different process could start execution of i=
ts<br>
&gt; own command buffer while shaders of the previous process are still run=
ning.<br>
&gt; <br>
&gt; If the Mesa driver submits a command buffer internally (because it&#39=
;s full),<br>
&gt; it doesn&#39;t wait, so the GFX pipeline doesn&#39;t notice that a com=
mand buffer<br>
&gt; ended and a new one started.<br>
&gt; <br>
&gt; The waiting at the end of command buffers happens only when the flush =
is<br>
&gt; external (Swap buffers, glFlush).<br>
&gt; <br>
&gt; It&#39;s a performance problem, because the GFX queue is blocked until=
 the GFX<br>
&gt; pipeline is drained at the end of every frame at least.<br>
&gt; <br>
&gt; So explicit fences for SwapBuffers would help.<br>
<br>
Not sure what difference it would make, since the same thing needs to be<br=
>
done for explicit fences as well, doesn&#39;t it?<br></blockquote><div><br>=
</div><div>No. Explicit fences don&#39;t require userspace to wait for idle=
 in the command buffer. Fences are signalled when the last draw is complete=
 and caches are flushed. Before that happens, any command buffer that is no=
t dependent on the fence can start execution. There is never a need for the=
 GPU to be idle if there is enough independent work to do.<br></div><div><b=
r></div><div>Marek<br></div></div></div>

--00000000000079165e05a0fd11da--

--===============1916475863==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1916475863==--
