Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB0E136232
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 22:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63AC26E96C;
	Thu,  9 Jan 2020 21:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905366E968;
 Thu,  9 Jan 2020 21:04:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so8882498wre.10;
 Thu, 09 Jan 2020 13:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Jx2mnQ5sQHhvy05gzpF6Xb4vyLWFy0EStruomBKxur4=;
 b=RnyqCFjLIS4svLi+h/UCvFKDzvChRa6kkBNmZesJzWOCc+jQn87SBRwnYLBMbY1D76
 cvT+LRxrURdsujbDonshbHfQMSnzyu3/aWZXTGr8H2Omcq0TqZOKDH8YFiugQf02ovUL
 DjIJdi6h1ISJcmXgZu3PSYfcieDIk/4UhO8pRQ+g6RwtDZ00nGo2w+TdSIcf4qmNmYOy
 LwqILdatjdtuZBRsd/V2IXbBhclWnF07zi4OWRTTM1SLo/4jghVSY01w+mY0v9ylbrkV
 ziaHb+OG2zGhnqhe5S7ybYROioPwjJ9kTNdA6Yka+QcsDn4V3G+zniiu1gVuhyPGWCGk
 zNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jx2mnQ5sQHhvy05gzpF6Xb4vyLWFy0EStruomBKxur4=;
 b=UBWVU0rM5/GBaZZdZ2LxUqBc0NLpFz5Q5r0RrO9f/eH1xMVvaly3AokTrlCV2Rzzd0
 j/5EsFI0Fe1SDy3ev4j65Wj7/bW91NHOXI1LQouJosBjyUk0T+JdV97R1c/YdZNLpM7A
 Zk82Ah5pkYyd4fpRrssdIPsmEX0OCB0PUVgSEZ7mWqenJsTe91//r9fLHAQUvOgxqbpd
 G9NzCbIU2j/pXJuiXXHdHDXHwT1KWG1v1GemD8Sb5sw/hQvXOhkdb+LNESB3jXe8VbY3
 /G1hgFd+Gfp+3dPDUsg4K6cdzZjOoroN8GgeyYz6S9G9aEnpziW+OjtFSA+6Bbmpqq8s
 PfQg==
X-Gm-Message-State: APjAAAU5UpuPK/SwtdnWpoNpBLoNYcaS8y4m1+veJ8T3iTwSg7EDXgxQ
 H9kXELP3eqcUJNFWoGfSEWLbNzHy8mpySUZppl3urmaZcrw=
X-Google-Smtp-Source: APXvYqxdmotb+XD13kQ3492bZFH6SKWQQaRDI+qFYqpoSC53D5NWWxsnVUa63gSk1TIlQhW+QDyELkbMafuy1znF/J4=
X-Received: by 2002:a5d:4f90:: with SMTP id d16mr12226286wru.395.1578603867295; 
 Thu, 09 Jan 2020 13:04:27 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
 <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
 <CADnq5_NPdg8MjQ5cB2aCD+US1Hv+FoP1gqKcA4W2e0pouG8cGQ@mail.gmail.com>
In-Reply-To: <CADnq5_NPdg8MjQ5cB2aCD+US1Hv+FoP1gqKcA4W2e0pouG8cGQ@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 22:04:15 +0100
Message-ID: <CAEsyxyjMsCU8rzyO0GewU_-uV5+UoDDwa5Mc74irUnJHhF6ALQ@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
To: Alex Deucher <alexdeucher@gmail.com>,
 Harry Wentland <Harry.Wentland@amd.com>
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
Cc: mario.kleiner.de@gmail.de,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============0044066142=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0044066142==
Content-Type: multipart/alternative; boundary="000000000000c05498059bbb5ac6"

--000000000000c05498059bbb5ac6
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 8:49 PM Alex Deucher <alexdeucher@gmail.com> wrote:

> On Thu, Jan 9, 2020 at 11:47 AM Mario Kleiner
> <mario.kleiner.de@gmail.com> wrote:
> >
> > On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher <alexdeucher@gmail.com>
> wrote:
> >>
> >> On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
> >> <mario.kleiner.de@gmail.com> wrote:
> >> >
> As Harry mentioned in the other thread, won't this only work if the
> display was brought up by the vbios?  In the suspend/resume case,
> won't we just fall back to 2.7Gbps?
>
> Alex
>
>
Adding Harry to cc...

The code is only executed for eDP. On the Intel side, it seems that
intel_edp_init_dpcd() gets only called during driver load / modesetting
init, so not on resume.

On the AMD DC side, dc_link_detect_helper() has this early no-op return at
the beginning:

if ((link <https://elixir.bootlin.com/linux/v5.5-rc5/ident/link>->connector_signal
== SIGNAL_TYPE_LVDS
<https://elixir.bootlin.com/linux/v5.5-rc5/ident/SIGNAL_TYPE_LVDS> ||
			link <https://elixir.bootlin.com/linux/v5.5-rc5/ident/link>->connector_signal
== SIGNAL_TYPE_EDP
<https://elixir.bootlin.com/linux/v5.5-rc5/ident/SIGNAL_TYPE_EDP>) &&
			link <https://elixir.bootlin.com/linux/v5.5-rc5/ident/link>->local_sink)
		return <https://elixir.bootlin.com/linux/v5.5-rc5/ident/return> true
<https://elixir.bootlin.com/linux/v5.5-rc5/ident/true>;


So i guess if link->local_sink doesn't get NULL'ed during a suspend/resume
cycle, then we never reach the setup code that would overwrite with non
vbios settings?

Sounds reasonable to me, given that eDP panels are usually fixed internal
panels, nothing that gets hot(un-)plugged?

I can't test, because suspend/resume with the Polaris gpu on the MBP 2017
is totally broken atm., just as vgaswitcheroo can't do its job. Looks like
powering down the gpu works, but powering up doesn't. And also modesetting
at vgaswitcheroo switch time is no-go, because the DDC/AUX lines apparently
can't be switched on that Apple gmux, and handover of that data seems to be
not implemented in current vgaswitcheroo. At the moment switching between
AMD only or Intel+AMD Prime setup is quite a pita...

-mario

--000000000000c05498059bbb5ac6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 9, 2020 at 8:49 PM Alex Deuch=
er &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Jan 9, 2020 at 11:47 AM Mario Kleiner<br>
&lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.k=
leiner.de@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher &lt;<a href=3D"mailto:alex=
deucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a>&gt; wrote:<b=
r>
&gt;&gt;<br>
&gt;&gt; On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner<br>
&gt;&gt; &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank=
">mario.kleiner.de@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>As Harry mentioned in the other thread, won&#39;t this onl=
y work if the<br>
display was brought up by the vbios?=C2=A0 In the suspend/resume case,<br>
won&#39;t we just fall back to 2.7Gbps?<br>
<br>
Alex<br>
<br></blockquote></div><div class=3D"gmail_quote"><br></div><div class=3D"g=
mail_quote">Adding Harry to cc...<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote">The code is only executed for eDP. On the I=
ntel side, it seems that intel_edp_init_dpcd() gets only called during driv=
er load / modesetting init, so not on resume.</div><div class=3D"gmail_quot=
e"><br></div><div class=3D"gmail_quote">On the AMD DC side, dc_link_detect_=
helper() has this early no-op return at the beginning:</div><div class=3D"g=
mail_quote"><br></div><div class=3D"gmail_quote"><pre><span class=3D"gmail-=
k">if</span> <span class=3D"gmail-p">((</span><span class=3D"gmail-n"><a hr=
ef=3D"https://elixir.bootlin.com/linux/v5.5-rc5/ident/link">link</a></span>=
<span class=3D"gmail-o">-&gt;</span><span class=3D"gmail-n">connector_signa=
l</span> <span class=3D"gmail-o">=3D=3D</span> <span class=3D"gmail-n"><a h=
ref=3D"https://elixir.bootlin.com/linux/v5.5-rc5/ident/SIGNAL_TYPE_LVDS">SI=
GNAL_TYPE_LVDS</a></span> <span class=3D"gmail-o">||</span>
			<span class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.5=
-rc5/ident/link">link</a></span><span class=3D"gmail-o">-&gt;</span><span c=
lass=3D"gmail-n">connector_signal</span> <span class=3D"gmail-o">=3D=3D</sp=
an> <span class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.=
5-rc5/ident/SIGNAL_TYPE_EDP">SIGNAL_TYPE_EDP</a></span><span class=3D"gmail=
-p">)</span> <span class=3D"gmail-o">&amp;&amp;</span>
			<span class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.5=
-rc5/ident/link">link</a></span><span class=3D"gmail-o">-&gt;</span><span c=
lass=3D"gmail-n">local_sink</span><span class=3D"gmail-p">)</span>
		<span class=3D"gmail-n"><a href=3D"https://elixir.bootlin.com/linux/v5.5-=
rc5/ident/return">return</a></span> <span class=3D"gmail-n"><a href=3D"http=
s://elixir.bootlin.com/linux/v5.5-rc5/ident/true">true</a></span><span clas=
s=3D"gmail-p">;</span></pre></div><div class=3D"gmail_quote"><br></div><div=
 class=3D"gmail_quote">So i guess if link-&gt;local_sink doesn&#39;t get NU=
LL&#39;ed during a suspend/resume cycle, then we never reach the setup code=
 that would overwrite with non vbios settings?</div><div class=3D"gmail_quo=
te"><br></div><div class=3D"gmail_quote">Sounds reasonable to me, given tha=
t eDP panels are usually fixed internal panels, nothing that gets hot(un-)p=
lugged?</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">I can&#39;t test, because suspend/resume with the Polaris gpu on the MBP =
2017 is totally broken atm., just as vgaswitcheroo can&#39;t do its job. Lo=
oks like powering down the gpu works, but powering up doesn&#39;t. And also=
 modesetting at vgaswitcheroo switch time is no-go, because the DDC/AUX lin=
es apparently can&#39;t be switched on that Apple gmux, and handover of tha=
t data seems to be not implemented in current vgaswitcheroo. At the moment =
switching between AMD only or Intel+AMD Prime setup is quite a pita...<br><=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">-mario=
<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><=
br></div></div>

--000000000000c05498059bbb5ac6--

--===============0044066142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0044066142==--
