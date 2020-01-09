Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACB61361A7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 21:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573606E963;
	Thu,  9 Jan 2020 20:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 018406E962;
 Thu,  9 Jan 2020 20:19:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p17so4283281wmb.0;
 Thu, 09 Jan 2020 12:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LmmmTV+l4WQWa4WjNnHTYqHYZO7ME/LQrwd/inNoJ1M=;
 b=ZZFbWktOPdVn9fle1ZdSDtb0yp+80d73K9LlqmiIVak5aKOKJno6Eyt73Ua57z68+D
 h/xnZx7KqUxqghtYX5UnVlBNOgDLirgM+jyC1GhHL+3ZRMKh8zzFuXRSwp3IOIKztmrx
 dsZB/1eZhTJKFc3+y+sKKUQyLfWZFaHtUQ76pP0C4upb4TYR1a+xoF+uXS4f+WhdcYJO
 j9KObJ0bwwktx4vj1PA+B/9rFROBxpJl5DgBZM+UwOMRUs1OL20KHeHv9cUVzUMxG0l+
 ZjnyiFPnGoPHiDlHZUpfscwP33KaJZ9WKK0dePEvQOfh/rs+j4mddXXnrBQsX3I5ZyDU
 XYgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LmmmTV+l4WQWa4WjNnHTYqHYZO7ME/LQrwd/inNoJ1M=;
 b=m7DwR7t53KgzNtpTDYIWSBV3GdylufIFGhaLJfLcEa+hu4jXM/4wpXrU91IBoBcyml
 UhFc5UTnHsleUX2qo8sR9as4dgTUhM/tUtH6VtwahSGXWjwb3bvHEIc8dLeYn3fcHUm7
 7siTrztE8UUw7eIS0ojcyX8GRJ9j8j3eT1jSIreaKPuSIP7fdTa5s6qBjRGLeXgLXud8
 brYfxdcQft6n+bDyumvM8+A576V2pcz8vYAk3E0Vk4o8YsTLr9QB67MU4++vXtp0z/kM
 iTWEejGM3Wt6GAtdtmZAdnzeHY+ZM2pCXf/qSXYTGolsEoYTxWlOfFxZVA5IqdmBfMcY
 w3CA==
X-Gm-Message-State: APjAAAVPGnB20ZS3v/UogoMJ4xwLh+x0+LMd8Z3I+9bTdwHA40e2Hfxc
 nPA6I+oTR+fTHL/CxTCcJQjdKlm4T42laFudMgDW4A50QEs=
X-Google-Smtp-Source: APXvYqweKVtjTiZXT6FmyiQcX5hZYRk/FefoHElRPe9Hf6tp6IkbnvnGMVafc8iiAUYCwEOicSJTfumqeFqCyiQvpZM=
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr6695542wmo.123.1578601158696; 
 Thu, 09 Jan 2020 12:19:18 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
 <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
 <20200109164715.GD13686@intel.com>
 <CAEsyxyhjbP6ADutU7XRJUjryj1+X8mFqopB9TvBoW6RWjBihww@mail.gmail.com>
 <20200109182408.GF13686@intel.com>
In-Reply-To: <20200109182408.GF13686@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 21:19:07 +0100
Message-ID: <CAEsyxyiTxRZC=Mw4rKvjCQO557Qg6Q2JRkoUvQWOia7SxumznA@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: mario.kleiner.de@gmail.de, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: multipart/mixed; boundary="===============1884855674=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1884855674==
Content-Type: multipart/alternative; boundary="0000000000004e63ba059bbab94a"

--0000000000004e63ba059bbab94a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 7:24 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
.intel.com>
wrote:

> On Thu, Jan 09, 2020 at 06:57:14PM +0100, Mario Kleiner wrote:
> > On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=C3=A4l=C3=A4 <
> ville.syrjala@linux.intel.com>
> > wrote:
> >
> > > On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:
> > > > On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=C3=A4 <
> > > ville.syrjala@linux.intel.com>
> > > > wrote:
> > > >
>

> wouldn't work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD DC
> > identified it as DP 1.1, eDP 1.3, and these extended caps seem to be on=
ly
> > part of DP 1.3+ if i understand the comments in
> > intel_dp_extended_receiver_capabilities() correctly.
>
>
Ok, looking at previous debug output logs shows that those extended caps
are not present on the systems, ie. that extended caps bit is not set. So
dpcd[0x1] =3D=3D 0xa.


> Yeah, but you never know how creative they've been with the DPCD in
> such a propritary machine. A full DPCD dump from /dev/drm_dp_aux* would
> be nice. Can you file a bug an attach the DPCD dump there so we have a
> good reference on what we're talking about (also for future if/when
> someone eventually starts to wonder why we have such hacks in the
> code)?
>
>
True, it's Apple which likes to "Think different..." :/

Will do. But is there a proper/better way to do the /dev/drm_dp_aux0 dump?
I used cat /dev/drm_dp_aux0 > dump, and that hangs, but if i interrupt it
after a few seconds, i get a dump file of 512k size, which seems excessive?
On AMD DC atm., in case that matters.

However, the file shows DPCD_REV 1.1, maximum 0xa and no extended caps (
DP_TRAINING_AUX_RD_INTERVAL
<https://elixir.bootlin.com/linux/v5.5-rc5/ident/DP_TRAINING_AUX_RD_INTERVA=
L>
aka
[0xe] =3D=3D 0x00).
 -mario


--=20
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--0000000000004e63ba059bbab94a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 9, 2020 at 7:24 PM Ville Syrj=
=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.sy=
rjala@linux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 09, 2020 at 06:=
57:14PM +0100, Mario Kleiner wrote:<br>
&gt; On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"=
mailto:ville.syrjala@linux.intel.com" target=3D"_blank">ville.syrjala@linux=
.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:<br=
>
&gt; &gt; &gt; On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=C3=A4 &lt;<=
br>
&gt; &gt; <a href=3D"mailto:ville.syrjala@linux.intel.com" target=3D"_blank=
">ville.syrjala@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>=C2=A0</blockquote><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; wouldn&#39;t work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD=
 DC<br>
&gt; identified it as DP 1.1, eDP 1.3, and these extended caps seem to be o=
nly<br>
&gt; part of DP 1.3+ if i understand the comments in<br>
&gt; intel_dp_extended_receiver_capabilities() correctly.<br>
<br></blockquote><div><br></div><div>Ok, looking at previous debug output l=
ogs shows that those extended caps are not present on the systems, ie. that=
 extended caps bit is not set. So dpcd[0x1] =3D=3D 0xa.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Yeah, but you never know how creative they&#39;ve been with the DPCD in<br>
such a propritary machine. A full DPCD dump from /dev/drm_dp_aux* would<br>
be nice. Can you file a bug an attach the DPCD dump there so we have a<br>
good reference on what we&#39;re talking about (also for future if/when<br>
someone eventually starts to wonder why we have such hacks in the<br>
code)?<br>
<br></blockquote><div><br></div><div>True, it&#39;s Apple which likes to &q=
uot;Think different...&quot; :/</div><div><br></div><div>Will do. But is th=
ere a proper/better way to do the /dev/drm_dp_aux0 dump? I used cat /dev/dr=
m_dp_aux0 &gt; dump, and that hangs, but if i interrupt it after a few seco=
nds, i get a dump file of 512k size, which seems excessive? On AMD DC atm.,=
 in case that matters.<br></div><div><br></div><div>However, the file shows=
 DPCD_REV 1.1, maximum 0xa and no extended caps (<span class=3D"gmail-cp"><=
a href=3D"https://elixir.bootlin.com/linux/v5.5-rc5/ident/DP_TRAINING_AUX_R=
D_INTERVAL">DP_TRAINING_AUX_RD_INTERVAL</a> </span>aka [0xe] =3D=3D 0x00).<=
br></div><div>=C2=A0-mario</div><div><br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div></div>

--0000000000004e63ba059bbab94a--

--===============1884855674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1884855674==--
