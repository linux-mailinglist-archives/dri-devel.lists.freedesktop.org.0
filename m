Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46E3135FE7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748DB6E935;
	Thu,  9 Jan 2020 17:57:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E826E935;
 Thu,  9 Jan 2020 17:57:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so8433095wrq.0;
 Thu, 09 Jan 2020 09:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8MPSzvCE9W7r+xvCSEaTEpM9zgf3lmCs20BXaX/kn3Q=;
 b=DRG8lZq+jF6r87ZjGggk0qknCYgdkgQGPt9lT1gRb1natDyYBX6zHBtfA8TCZY4CHd
 Chqfpkb98yj0+9BXen3yEUrliMQezZYYK5QABU4oXTdZ1P2fIxIGapXqQkXBdphCrqa/
 w6oomod2zbo6jms/rNr6LQ5wYaWhfpmsaac82tCZ7iZ/YZNmaUaxb8Gfkwgb2MKNUspu
 Ujjo/A9TnCyWF8737veeoXAx6yPhw1cP6yNUaT2ERDAlHb4h17OnGgkGmazV1cWKayKy
 0vRJ9yZ8RtoULQ1R0cjkY+6VOzYPqPrD+jlSpKfAv+qxW5huKtpqDlvaxmTUzL/3pQNZ
 Z0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8MPSzvCE9W7r+xvCSEaTEpM9zgf3lmCs20BXaX/kn3Q=;
 b=nqFBhKHfkyU7Auz1sEi6yiQ004Y6XqNL37K9rKu1wS5QOIOf841jL9L+fs0N+ErxPj
 uq9n+m01p3cVc6k6QyKpAeUh4sRp7KvcpeqphlwqQYVv6f3S+f1mSFLXU+0RV0qN4MW3
 U+MGBpBtqa32kGILVXR7lf1W1xwYSXjYOjEAQkWrj/ZY4mdfPoG5uGSkUAnlhe1MvT5k
 iCFTXX1/5NUcsRi2H6L7/oYWmTDrCUl+XmGxLr+t636ZKRmG+U7Loc5juwfe/mPv1wFJ
 KErq/fxDswq5xgw6yz4dsB0jwek47KiGBBOY4GcWiCfqNDhBcdnVKmULFfsxQA3epBPQ
 NAtg==
X-Gm-Message-State: APjAAAWGRovYu+1FXN+kdBkq45IoQDIEvx5Uk+S9OlYeVACaZbqPyjkB
 RwWXJrPRVC/Ka2EY+kWwTkuRNyGH9MLwFErTC4xBinMvcCE=
X-Google-Smtp-Source: APXvYqyS9UybDNZ8YM6bvLTf/mTKllpvscV83Hj4QgSqKPbyntgwgSX6yKcr+JJrMjBuyvZV5TVqQMVFsKARlgvg8dE=
X-Received: by 2002:a5d:6144:: with SMTP id y4mr12408208wrt.367.1578592646050; 
 Thu, 09 Jan 2020 09:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
 <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
 <20200109164715.GD13686@intel.com>
In-Reply-To: <20200109164715.GD13686@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 18:57:14 +0100
Message-ID: <CAEsyxyhjbP6ADutU7XRJUjryj1+X8mFqopB9TvBoW6RWjBihww@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1185132122=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1185132122==
Content-Type: multipart/alternative; boundary="000000000000e9b823059bb8bd72"

--000000000000e9b823059bb8bd72
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 5:47 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
.intel.com>
wrote:

> On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kleiner wrote:
> > On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=C3=A4 <
> ville.syrjala@linux.intel.com>
> > wrote:
> >
> > > On Thu, Jan 09, 2020 at 05:26:57PM +0200, Ville Syrj=C3=A4l=C3=A4 wro=
te:
> > > > On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:
> > > > > The panel reports 10 bpc color depth in its EDID, and the UEFI
> > > > > firmware chooses link settings at boot which support enough
> > > > > bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> > > > > DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
> > >
> > > Does it actually or do we just ignore the fact that it reports
> 3.24Gbps?
> > >
> > > If it really reports 3.24 then we should be able to just add that to
> > > dp_rates[] in intel_dp_set_sink_rates() and be done with it.
> > >
> > > Although we'd likely want to skip 3.24 unless it really is reported
> > > as the max so as to not use that non-standard rate on other displays.
> > > So would require a bit fancier logic for that.
> > >
> > >
> > Was also my initial thought, but the DP_MAX_LINK_RATE reg reports 2.7
> Gbps
> > as maximum.
>
> So dpcd[0x1] =3D=3D 0xa ?
>
>
Yes. [*]


> What about the magic second version of DP_MAX_LINK_RATE at 0x2201 ?
> Hmm. I guess we should already be reading that via
> intel_dp_extended_receiver_capabilities().
>

Yes, you do.

[*] Well, i have to recheck on the machine. I started this work on the AMD
side and checked what AMD DC gave me, haven't rechecked stuff under i915
that i already knew from AMD. Comparing the implementations, there's some
peculiar differences that may matter:

intel_dp_extended_receiver_capabilities() is more "paranoid" than AMD DC's
retrieve_link_cap() function in deciding if the extended receiver caps are
valid. Intels implementation copies only the first 6 Bytes of extended
receiver caps into the dpcd[] arrays, whereas AMD copies 16 Bytes. Not sure
about the differences, but one of you may wanna check why this is, and if
it matters somehow.

Btw. your proposed

/* blah */
if (max_rate > ...)

wouldn't work if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD DC
identified it as DP 1.1, eDP 1.3, and these extended caps seem to be only
part of DP 1.3+ if i understand the comments in
intel_dp_extended_receiver_capabilities() correctly.

-mario



>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--000000000000e9b823059bb8bd72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 9, 2020 at 5:47 PM Ville =
Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">vill=
e.syrjala@linux.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Thu, Jan 09, 2020 at 05:30:05PM +0100, Mario Kl=
einer wrote:<br>
&gt; On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"=
mailto:ville.syrjala@linux.intel.com" target=3D"_blank">ville.syrjala@linux=
.intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Thu, Jan 09, 2020 at 05:26:57PM +0200, Ville Syrj=C3=A4l=C3=A4=
 wrote:<br>
&gt; &gt; &gt; On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrot=
e:<br>
&gt; &gt; &gt; &gt; The panel reports 10 bpc color depth in its EDID, and t=
he UEFI<br>
&gt; &gt; &gt; &gt; firmware chooses link settings at boot which support en=
ough<br>
&gt; &gt; &gt; &gt; bandwidth for 10 bpc (324000 kbit/sec to be precise), b=
ut the<br>
&gt; &gt; &gt; &gt; DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as=
 possible,<br>
&gt; &gt;<br>
&gt; &gt; Does it actually or do we just ignore the fact that it reports 3.=
24Gbps?<br>
&gt; &gt;<br>
&gt; &gt; If it really reports 3.24 then we should be able to just add that=
 to<br>
&gt; &gt; dp_rates[] in intel_dp_set_sink_rates() and be done with it.<br>
&gt; &gt;<br>
&gt; &gt; Although we&#39;d likely want to skip 3.24 unless it really is re=
ported<br>
&gt; &gt; as the max so as to not use that non-standard rate on other displ=
ays.<br>
&gt; &gt; So would require a bit fancier logic for that.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Was also my initial thought, but the DP_MAX_LINK_RATE reg reports 2.7 =
Gbps<br>
&gt; as maximum.<br>
<br>
So dpcd[0x1] =3D=3D 0xa ?<br>
<br></blockquote><div><br></div><div>Yes. [*]<br></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
What about the magic second version of DP_MAX_LINK_RATE at 0x2201 ?<br>
Hmm. I guess we should already be reading that via<br>
intel_dp_extended_receiver_capabilities().<br></blockquote><div><br></div><=
div>Yes, you do.</div><div><br></div><div>[*] Well, i have to recheck on th=
e machine. I started this work on the AMD side and checked what AMD DC gave=
 me, haven&#39;t rechecked stuff under i915 that i already knew from AMD. C=
omparing the implementations, there&#39;s some peculiar differences that ma=
y matter:</div><div><br></div><div>intel_dp_extended_receiver_capabilities(=
) is more &quot;paranoid&quot; than AMD DC&#39;s retrieve_link_cap() functi=
on in deciding if the extended receiver caps are valid. Intels implementati=
on copies only the first 6 Bytes of extended receiver caps into the dpcd[] =
arrays, whereas AMD copies 16 Bytes. Not sure about the differences, but on=
e of you may wanna check why this is, and if it matters somehow.</div><div>=
<br> </div><div>Btw. your proposed <br></div><div><br></div><div>/* blah */=
</div><div>if (max_rate &gt; ...)</div><div><br></div><div>wouldn&#39;t wor=
k if dpcd[0x1] =3D=3D 0xa, which it likely is [*]. AMD DC identified it as =
DP 1.1, eDP 1.3, and these extended caps seem to be only part of DP 1.3+ if=
 i understand the comments in intel_dp_extended_receiver_capabilities() cor=
rectly.</div><div><br></div><div>-mario</div><div><br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div></div>

--000000000000e9b823059bb8bd72--

--===============1185132122==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1185132122==--
