Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C32131371BE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 16:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F016EA36;
	Fri, 10 Jan 2020 15:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D04916EA3B;
 Fri, 10 Jan 2020 15:51:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p9so2527873wmc.2;
 Fri, 10 Jan 2020 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=htyoGL9S6T2kkncuOXbjEVpKCQi9kwjwIDkV+g2u2rc=;
 b=mZ/SCd05crNRHh6oNQy0i8PHGSzZikzR8j/KFgVzIaRoz1u/BLIzdW91VY2H/uRggC
 yZyYkfHbyN2WiSCWmG84Ps+1j1ezZVzWPE3RuzOBsnCzUGaPjvGAp25o+QzBL8AUdM3q
 4RZ5ihbpF54ttmjYT8YdiawirUeaNWW4FrLTW2Rj/JeUfIpS6Dvl2ku3y+lY3hpEHNro
 hhgIJhtg2FqmRtUdm0by1sPDfwzk7n9eML1hWjh+TOw9BHo5quOkwW8xRLUbrtAjYxeq
 yLwH7/v1CVtKfhmts/sHT4HKPXHaq/1ROjeXhB7dXjPTxzKH9J8Oani+Y9qU1s/QfrGO
 X7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=htyoGL9S6T2kkncuOXbjEVpKCQi9kwjwIDkV+g2u2rc=;
 b=EHqesOSPG7q0Xwhw+UZoGBmQzUG0iGiefm2QXmXz8sg414+D+2RVzUCvKeQWXIPNGd
 KntYboNSQ+xfTcTzuC7TaDCCu9Q/IsVueBbQOAWPqjOXZ2ixI2xYWu6NTd9G4MdGa0qw
 3pqtjuuwSVVxhRmfDfnOUZ3GHW0NrcMLOx4bh7g8P/gkXkYNQn1cHZoQMG5ppnG5yBX4
 1o+Olq5TRcjFVd5edS97R33dXY2zCbycAKKG2JBllerY5o50hE6kmcBgXapq4GBc9mfI
 XIoGrfKObpf/iVvIn/91ZY+eTS+i9cq28+6j1SfHnQXNdxiCMFVAC21r8JW2NG7GA3yA
 GPDw==
X-Gm-Message-State: APjAAAUDtp2Bqvwl95owb+GOrybA2FAQesI0lDK+S59RZ51R8sQyaxfn
 TxqepLgtVCpRnUKdTCoxEv1DLFGUCxr5SdVfYKYKPynlpaY=
X-Google-Smtp-Source: APXvYqwaOkrg4Yrffudmq2vHobTM+XNapFzfoN3/FCBco4Mko5b/jJKi/pWHSzVAvuuLhsGbMs7xIqDWsqdGAt1nias=
X-Received: by 2002:a05:600c:10cd:: with SMTP id
 l13mr5377595wmd.102.1578671467565; 
 Fri, 10 Jan 2020 07:51:07 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
 <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
 <20200109164715.GD13686@intel.com>
 <CAEsyxyhjbP6ADutU7XRJUjryj1+X8mFqopB9TvBoW6RWjBihww@mail.gmail.com>
 <20200109182408.GF13686@intel.com>
 <CAEsyxyiTxRZC=Mw4rKvjCQO557Qg6Q2JRkoUvQWOia7SxumznA@mail.gmail.com>
 <20200110133232.GJ13686@intel.com>
In-Reply-To: <20200110133232.GJ13686@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 10 Jan 2020 16:50:55 +0100
Message-ID: <CAEsyxyj1bR2zuXFegE2B0FMoN8nrct84QCpY7HsF4P-6ZKY4Cw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1138810182=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1138810182==
Content-Type: multipart/alternative; boundary="0000000000000a97fb059bcb18fd"

--0000000000000a97fb059bcb18fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 2:32 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Thu, Jan 09, 2020 at 09:19:07PM +0100, Mario Kleiner wrote:
> > On Thu, Jan 9, 2020 at 7:24 PM Ville Syrj=C3=A4l=C3=A4 <
> ville.syrjala@linux.intel.com>
> > wrote:
> >
> > > On Thu, Jan 09, 2020 at 06:57:14PM +0100, Mario Kleiner wrote:
> > > > On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=C3=A4l=C3=A4 <
> > > ville.syrjala@linux.intel.com>
> > > > wrote:
> > > >
> > > > > On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:
> > > > > > On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=C3=A4 <
> > > > > ville.syrjala@linux.intel.com>
> > > > > > wrote:
> > > > > >
> > >
> >
> > > wouldn't work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD DC
> > > > identified it as DP 1.1, eDP 1.3, and these extended caps seem to b=
e
> only
> > > > part of DP 1.3+ if i understand the comments in
> > > > intel_dp_extended_receiver_capabilities() correctly.
> > >
> > >
> > Ok, looking at previous debug output logs shows that those extended cap=
s
> > are not present on the systems, ie. that extended caps bit is not set. =
So
> > dpcd[0x1] =3D=3D 0xa.
> >
> >
> > > Yeah, but you never know how creative they've been with the DPCD in
> > > such a propritary machine. A full DPCD dump from /dev/drm_dp_aux* wou=
ld
> > > be nice. Can you file a bug an attach the DPCD dump there so we have =
a
> > > good reference on what we're talking about (also for future if/when
> > > someone eventually starts to wonder why we have such hacks in the
> > > code)?
> > >
> > >
> > True, it's Apple which likes to "Think different..." :/
> >
> > Will do. But is there a proper/better way to do the /dev/drm_dp_aux0
> dump?
> > I used cat /dev/drm_dp_aux0 > dump, and that hangs, but if i interrupt =
it
> > after a few seconds, i get a dump file of 512k size, which seems
> excessive?
> > On AMD DC atm., in case that matters.
>
> It can take a while to dump the whole thing. If there are errors in some
> parts (against the spec but some devices simply don't care about the
> spec) you may need to use ddrescue/etc. to dump everything that can be
> dumped.
>
> Ok, it is Mozilla bug 206157:

https://bugzilla.kernel.org/show_bug.cgi?id=3D206157

I attached the first ~ 5000 Bytes of DPCD dump, as there is a 5k file size
limit. The total dump is 512 kB, mostly zeros.

-mario

--=20
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--0000000000000a97fb059bcb18fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 10, 2020 at 2:32 PM Ville=
 Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">vil=
le.syrjala@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Jan 09, 2020 at 09:19:07PM +0100, Mario K=
leiner wrote:<br>
&gt; On Thu, Jan 9, 2020 at 7:24 PM Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"=
mailto:ville.syrjala@linux.intel.com" target=3D"_blank">ville.syrjala@linux=
.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Jan 09, 2020 at 06:57:14PM +0100, Mario Kleiner wrote:<br=
>
&gt; &gt; &gt; On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=C3=A4l=C3=A4 &lt;<=
br>
&gt; &gt; <a href=3D"mailto:ville.syrjala@linux.intel.com" target=3D"_blank=
">ville.syrjala@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner=
 wrote:<br>
&gt; &gt; &gt; &gt; &gt; On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=
=C3=A4 &lt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:ville.syrjala@linux.intel.com" target=
=3D"_blank">ville.syrjala@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt; &gt; &gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; &gt; wouldn&#39;t work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]=
. AMD DC<br>
&gt; &gt; &gt; identified it as DP 1.1, eDP 1.3, and these extended caps se=
em to be only<br>
&gt; &gt; &gt; part of DP 1.3+ if i understand the comments in<br>
&gt; &gt; &gt; intel_dp_extended_receiver_capabilities() correctly.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Ok, looking at previous debug output logs shows that those extended ca=
ps<br>
&gt; are not present on the systems, ie. that extended caps bit is not set.=
 So<br>
&gt; dpcd[0x1] =3D=3D 0xa.<br>
&gt; <br>
&gt; <br>
&gt; &gt; Yeah, but you never know how creative they&#39;ve been with the D=
PCD in<br>
&gt; &gt; such a propritary machine. A full DPCD dump from /dev/drm_dp_aux*=
 would<br>
&gt; &gt; be nice. Can you file a bug an attach the DPCD dump there so we h=
ave a<br>
&gt; &gt; good reference on what we&#39;re talking about (also for future i=
f/when<br>
&gt; &gt; someone eventually starts to wonder why we have such hacks in the=
<br>
&gt; &gt; code)?<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; True, it&#39;s Apple which likes to &quot;Think different...&quot; :/<=
br>
&gt; <br>
&gt; Will do. But is there a proper/better way to do the /dev/drm_dp_aux0 d=
ump?<br>
&gt; I used cat /dev/drm_dp_aux0 &gt; dump, and that hangs, but if i interr=
upt it<br>
&gt; after a few seconds, i get a dump file of 512k size, which seems exces=
sive?<br>
&gt; On AMD DC atm., in case that matters.<br>
<br>
It can take a while to dump the whole thing. If there are errors in some<br=
>
parts (against the spec but some devices simply don&#39;t care about the<br=
>
spec) you may need to use ddrescue/etc. to dump everything that can be<br>
dumped.<br>
<br></blockquote><div>Ok, it is Mozilla bug 206157:</div><div><br></div><di=
v><a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D206157">https://=
bugzilla.kernel.org/show_bug.cgi?id=3D206157</a></div><div><br></div><div>I=
 attached the first ~ 5000 Bytes of DPCD dump, as there is a 5k file size l=
imit. The total dump is 512 kB, mostly zeros.</div><div><br></div><div>-mar=
io</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div></div>

--0000000000000a97fb059bcb18fd--

--===============1138810182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1138810182==--
