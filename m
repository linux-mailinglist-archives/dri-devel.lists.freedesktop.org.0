Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 75655182D4D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 11:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332A06E10F;
	Thu, 12 Mar 2020 10:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
 [209.85.217.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E44AF6E10F
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 10:19:10 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id n6so3318924vsc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 03:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=84eImwNp3wL3WQtt/72ynKxZGySuG4GdHQohMcPIuBg=;
 b=WtYpTjKr9HN6uyLDh9+hqoE0WOo/N8OpBMrjexeCDC386lbTKpGagrB4kXMG2SeONk
 0TpP29YpBK7HiLqNA/q/1yRmfANz/blKLRc8YVqjDPUuWtCGVl8QzBXIYA/4gt2lJ2Zi
 dD11qVSVUvvFO/OaICDJmDzeceXEj91HDNtz/bMWXrL2JBzQbU61m82daaxKNFQtWQ0o
 k8eLHx2f7RBaAhgusrMgTIo87Grbz9+TixFW3dCGTLYlvIlXL7uPOXEec3u29DJKJxip
 X08B8cTrbb9oTKvRf6C7wq/66g2PAHVIg/pVJpxa4DB5QKA8pVBGd9b1Aoz7+iMBB7qh
 W3UQ==
X-Gm-Message-State: ANhLgQ3qgd5jP2SpvoMz0xaXc0hrU2vNpu0ZQRGB4EYMsiUJqVgUEn4Q
 4WgDC4ZcphF2yt6rJH/hk1C9UZZjZnEIDwqLUiY=
X-Google-Smtp-Source: ADFU+vuPhiO/vI34zo+JL9DUKXe6kJ9wrpQpgZjfLMQTBql5jqv6n3fBi1bPO7RHsUhEgYKKqq0Y0MpQOt2x9EeJFr4=
X-Received: by 2002:a67:a409:: with SMTP id n9mr4974630vse.18.1584008350047;
 Thu, 12 Mar 2020 03:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <1582623496-6094-1-git-send-email-rohit.visavalia@xilinx.com>
 <BYAPR02MB40561FBCE7FCCF6ECAA96BF5B3EB0@BYAPR02MB4056.namprd02.prod.outlook.com>
 <BYAPR02MB5382500BD847244DC731B454BCE40@BYAPR02MB5382.namprd02.prod.outlook.com>
 <CAKb7UvgGAmuHC=CGGcZ9PV6Qxn=cEwBTuB10GqBT1GfbR0UvHA@mail.gmail.com>
 <BYAPR02MB4056A1136D4354043D95B2E9B3FD0@BYAPR02MB4056.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4056A1136D4354043D95B2E9B3FD0@BYAPR02MB4056.namprd02.prod.outlook.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 12 Mar 2020 06:18:53 -0400
Message-ID: <CAKb7UviVGAZKAhsyEy8JLK6MSrMWDOypELM=OED1hib-MEgusw@mail.gmail.com>
Subject: Re: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only if
 add_property_optional returns true
To: Rohit Visavalia <RVISAVAL@xilinx.com>
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
Cc: Ranganathan Sk <rsk@xilinx.com>, Dhaval Rajeshbhai Shah <dshah@xilinx.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
 Devarsh Thakkar <DEVARSHT@xilinx.com>,
 "emil.velikov@collabora.com" <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0921836261=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0921836261==
Content-Type: multipart/alternative; boundary="00000000000006a0e905a0a5af53"

--00000000000006a0e905a0a5af53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hm. I'm not sure offhand how to check if drmModeCrtcSetGamma is supported.
I guess you could check if gamma size > 0 or something?

On Thu, Mar 12, 2020, 02:39 Rohit Visavalia <RVISAVAL@xilinx.com> wrote:

> Hi Ilia Mirkin,
>
> Thanks for the review.
>
> By old-fashioned way you mean to say using drmModeCrtcSetGamma()? If yes
> then, it shows error as "failed to set gamma: Function no implemented" if
> any platform specific drm has no gamma property implemented.
>
> Current code shows error while running modetest for Xilinx drm as it
> doesn't supports gamma property and ideally it should not show error as
> gamma is optional property, so it doesn't serve the purpose of optional
> property.
>
> Please correct me if I am missing anything.
>
> Thanks
> Rohit
>
> > -----Original Message-----
> > From: Ilia Mirkin [mailto:imirkin@alum.mit.edu]
> > Sent: Tuesday, March 3, 2020 7:08 PM
> > To: Devarsh Thakkar <DEVARSHT@xilinx.com>
> > Cc: Rohit Visavalia <RVISAVAL@xilinx.com>;
> dri-devel@lists.freedesktop.org;
> > emil.velikov@collabora.com; Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>;
> Hyun
> > Kwon <hyunk@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>; Dhaval
> > Rajeshbhai Shah <dshah@xilinx.com>; Varunkumar Allagadapa
> > <VARUNKUM@xilinx.com>
> > Subject: Re: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only i=
f
> > add_property_optional returns true
> >
> > EXTERNAL EMAIL
> >
> > Pretty sure the current code is right. If the GAMMA_LUT property can't
> be set,
> > it tries to set gamma the old-fashioned way.
> >
> > On Tue, Mar 3, 2020 at 8:12 AM Devarsh Thakkar <DEVARSHT@xilinx.com>
> > wrote:
> > >
> > > Hi Rohit,
> > >
> > > This makes sense to me as gamma was implemented as optional property.
> > > Reviewed-By: "Devarsh Thakkar <devarsh.thakkar@xilinx.com>"
> > >
> > > @emil.velikov@collabora.com, @imirkin@alum.mit.edu, @Ville Syrj=C3=A4=
l=C3=A4,
> > Could you please ack and help merge this patch if it also look good to
> you ?
> > >
> > > Regards,
> > > Devarsh
> > >
> > > > -----Original Message-----
> > > > From: Rohit Visavalia
> > > > Sent: 27 February 2020 00:40
> > > > To: Rohit Visavalia <RVISAVAL@xilinx.com>;
> > > > dri-devel@lists.freedesktop.org; imirkin@alum.mit.edu;
> > > > emil.velikov@collabora.com
> > > > Cc: Hyun Kwon <hyunk@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>;
> > > > Dhaval Rajeshbhai Shah <dshah@xilinx.com>; Varunkumar Allagadapa
> > > > <VARUNKUM@xilinx.com>; Devarsh Thakkar <DEVARSHT@xilinx.com>
> > > > Subject: RE: [PATCH libdrm] modetest: call drmModeCrtcSetGamma()
> > > > only if add_property_optional returns true
> > > >
> > > > Gentle reminder.
> > > >
> > > > + Ilia Mirkin, +Emil Velikov.
> > > >
> > > > Thanks & Regards,
> > > > Rohit
> > > >
> > > > > -----Original Message-----
> > > > > From: Rohit Visavalia [mailto:rohit.visavalia@xilinx.com]
> > > > > Sent: Tuesday, February 25, 2020 3:08 PM
> > > > > To: dri-devel@lists.freedesktop.org
> > > > > Cc: Hyun Kwon <hyunk@xilinx.com>; Ranganathan Sk <rsk@xilinx.com>=
;
> > > > > Dhaval Rajeshbhai Shah <dshah@xilinx.com>; Varunkumar Allagadapa
> > > > > <VARUNKUM@xilinx.com>; Devarsh Thakkar <DEVARSHT@xilinx.com>;
> > > > > Rohit Visavalia <RVISAVAL@xilinx.com>
> > > > > Subject: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only
> > > > > if add_property_optional returns true
> > > > >
> > > > > gamma is a optional property then also it prints error message, s=
o
> > > > > set gamma only if add_property_optional() returns true.
> > > > >
> > > > > Signed-off-by: Rohit Visavalia <rohit.visavalia@xilinx.com>
> > > > > ---
> > > > >  tests/modetest/modetest.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/tests/modetest/modetest.c b/tests/modetest/modetest.=
c
> > > > > index b907ab3..379b9ea 100644
> > > > > --- a/tests/modetest/modetest.c
> > > > > +++ b/tests/modetest/modetest.c
> > > > > @@ -1138,7 +1138,7 @@ static void set_gamma(struct device *dev,
> > > > > unsigned crtc_id, unsigned fourcc)
> > > > >
> > > > >     add_property_optional(dev, crtc_id, "DEGAMMA_LUT", 0);
> > > > >     add_property_optional(dev, crtc_id, "CTM", 0);
> > > > > -   if (!add_property_optional(dev, crtc_id, "GAMMA_LUT",
> blob_id)) {
> > > > > +   if (add_property_optional(dev, crtc_id, "GAMMA_LUT", blob_id)=
)
> > > > > + {
> > > > >             uint16_t r[256], g[256], b[256];
> > > > >
> > > > >             for (i =3D 0; i < 256; i++) {
> > > > > --
> > > > > 2.7.4
> > >
>

--00000000000006a0e905a0a5af53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hm. I&#39;m not sure offhand how to check if=C2=A0drmMode=
CrtcSetGamma is supported. I guess you could check if gamma size &gt; 0 or =
something?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Mar 12, 2020, 02:39 Rohit Visavalia &lt;<a href=3D"mailto=
:RVISAVAL@xilinx.com">RVISAVAL@xilinx.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">Hi Ilia Mirkin,<br>
<br>
Thanks for the review.<br>
<br>
By old-fashioned way you mean to say using drmModeCrtcSetGamma()? If yes th=
en, it shows error as &quot;failed to set gamma: Function no implemented&qu=
ot; if any platform specific drm has no gamma property implemented.<br>
<br>
Current code shows error while running modetest for Xilinx drm as it doesn&=
#39;t supports gamma property and ideally it should not show error as gamma=
 is optional property, so it doesn&#39;t serve the purpose of optional prop=
erty.<br>
<br>
Please correct me if I am missing anything.<br>
<br>
Thanks<br>
Rohit<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Ilia Mirkin [mailto:<a href=3D"mailto:imirkin@alum.mit.edu" targ=
et=3D"_blank" rel=3D"noreferrer">imirkin@alum.mit.edu</a>]<br>
&gt; Sent: Tuesday, March 3, 2020 7:08 PM<br>
&gt; To: Devarsh Thakkar &lt;<a href=3D"mailto:DEVARSHT@xilinx.com" target=
=3D"_blank" rel=3D"noreferrer">DEVARSHT@xilinx.com</a>&gt;<br>
&gt; Cc: Rohit Visavalia &lt;<a href=3D"mailto:RVISAVAL@xilinx.com" target=
=3D"_blank" rel=3D"noreferrer">RVISAVAL@xilinx.com</a>&gt;; <a href=3D"mail=
to:dri-devel@lists.freedesktop.org" target=3D"_blank" rel=3D"noreferrer">dr=
i-devel@lists.freedesktop.org</a>;<br>
&gt; <a href=3D"mailto:emil.velikov@collabora.com" target=3D"_blank" rel=3D=
"noreferrer">emil.velikov@collabora.com</a>; Ville Syrj=C3=A4l=C3=A4 &lt;<a=
 href=3D"mailto:ville.syrjala@linux.intel.com" target=3D"_blank" rel=3D"nor=
eferrer">ville.syrjala@linux.intel.com</a>&gt;; Hyun<br>
&gt; Kwon &lt;<a href=3D"mailto:hyunk@xilinx.com" target=3D"_blank" rel=3D"=
noreferrer">hyunk@xilinx.com</a>&gt;; Ranganathan Sk &lt;<a href=3D"mailto:=
rsk@xilinx.com" target=3D"_blank" rel=3D"noreferrer">rsk@xilinx.com</a>&gt;=
; Dhaval<br>
&gt; Rajeshbhai Shah &lt;<a href=3D"mailto:dshah@xilinx.com" target=3D"_bla=
nk" rel=3D"noreferrer">dshah@xilinx.com</a>&gt;; Varunkumar Allagadapa<br>
&gt; &lt;<a href=3D"mailto:VARUNKUM@xilinx.com" target=3D"_blank" rel=3D"no=
referrer">VARUNKUM@xilinx.com</a>&gt;<br>
&gt; Subject: Re: [PATCH libdrm] modetest: call drmModeCrtcSetGamma() only =
if<br>
&gt; add_property_optional returns true<br>
&gt; <br>
&gt; EXTERNAL EMAIL<br>
&gt; <br>
&gt; Pretty sure the current code is right. If the GAMMA_LUT property can&#=
39;t be set,<br>
&gt; it tries to set gamma the old-fashioned way.<br>
&gt; <br>
&gt; On Tue, Mar 3, 2020 at 8:12 AM Devarsh Thakkar &lt;<a href=3D"mailto:D=
EVARSHT@xilinx.com" target=3D"_blank" rel=3D"noreferrer">DEVARSHT@xilinx.co=
m</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Rohit,<br>
&gt; &gt;<br>
&gt; &gt; This makes sense to me as gamma was implemented as optional prope=
rty.<br>
&gt; &gt; Reviewed-By: &quot;Devarsh Thakkar &lt;<a href=3D"mailto:devarsh.=
thakkar@xilinx.com" target=3D"_blank" rel=3D"noreferrer">devarsh.thakkar@xi=
linx.com</a>&gt;&quot;<br>
&gt; &gt;<br>
&gt; &gt; @<a href=3D"mailto:emil.velikov@collabora.com" target=3D"_blank" =
rel=3D"noreferrer">emil.velikov@collabora.com</a>, @<a href=3D"mailto:imirk=
in@alum.mit.edu" target=3D"_blank" rel=3D"noreferrer">imirkin@alum.mit.edu<=
/a>, @Ville Syrj=C3=A4l=C3=A4,<br>
&gt; Could you please ack and help merge this patch if it also look good to=
 you ?<br>
&gt; &gt;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Devarsh<br>
&gt; &gt;<br>
&gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; From: Rohit Visavalia<br>
&gt; &gt; &gt; Sent: 27 February 2020 00:40<br>
&gt; &gt; &gt; To: Rohit Visavalia &lt;<a href=3D"mailto:RVISAVAL@xilinx.co=
m" target=3D"_blank" rel=3D"noreferrer">RVISAVAL@xilinx.com</a>&gt;;<br>
&gt; &gt; &gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D=
"_blank" rel=3D"noreferrer">dri-devel@lists.freedesktop.org</a>; <a href=3D=
"mailto:imirkin@alum.mit.edu" target=3D"_blank" rel=3D"noreferrer">imirkin@=
alum.mit.edu</a>;<br>
&gt; &gt; &gt; <a href=3D"mailto:emil.velikov@collabora.com" target=3D"_bla=
nk" rel=3D"noreferrer">emil.velikov@collabora.com</a><br>
&gt; &gt; &gt; Cc: Hyun Kwon &lt;<a href=3D"mailto:hyunk@xilinx.com" target=
=3D"_blank" rel=3D"noreferrer">hyunk@xilinx.com</a>&gt;; Ranganathan Sk &lt=
;<a href=3D"mailto:rsk@xilinx.com" target=3D"_blank" rel=3D"noreferrer">rsk=
@xilinx.com</a>&gt;;<br>
&gt; &gt; &gt; Dhaval Rajeshbhai Shah &lt;<a href=3D"mailto:dshah@xilinx.co=
m" target=3D"_blank" rel=3D"noreferrer">dshah@xilinx.com</a>&gt;; Varunkuma=
r Allagadapa<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:VARUNKUM@xilinx.com" target=3D"_blank"=
 rel=3D"noreferrer">VARUNKUM@xilinx.com</a>&gt;; Devarsh Thakkar &lt;<a hre=
f=3D"mailto:DEVARSHT@xilinx.com" target=3D"_blank" rel=3D"noreferrer">DEVAR=
SHT@xilinx.com</a>&gt;<br>
&gt; &gt; &gt; Subject: RE: [PATCH libdrm] modetest: call drmModeCrtcSetGam=
ma()<br>
&gt; &gt; &gt; only if add_property_optional returns true<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Gentle reminder.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; + Ilia Mirkin, +Emil Velikov.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Thanks &amp; Regards,<br>
&gt; &gt; &gt; Rohit<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -----Original Message-----<br>
&gt; &gt; &gt; &gt; From: Rohit Visavalia [mailto:<a href=3D"mailto:rohit.v=
isavalia@xilinx.com" target=3D"_blank" rel=3D"noreferrer">rohit.visavalia@x=
ilinx.com</a>]<br>
&gt; &gt; &gt; &gt; Sent: Tuesday, February 25, 2020 3:08 PM<br>
&gt; &gt; &gt; &gt; To: <a href=3D"mailto:dri-devel@lists.freedesktop.org" =
target=3D"_blank" rel=3D"noreferrer">dri-devel@lists.freedesktop.org</a><br=
>
&gt; &gt; &gt; &gt; Cc: Hyun Kwon &lt;<a href=3D"mailto:hyunk@xilinx.com" t=
arget=3D"_blank" rel=3D"noreferrer">hyunk@xilinx.com</a>&gt;; Ranganathan S=
k &lt;<a href=3D"mailto:rsk@xilinx.com" target=3D"_blank" rel=3D"noreferrer=
">rsk@xilinx.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; Dhaval Rajeshbhai Shah &lt;<a href=3D"mailto:dshah@xili=
nx.com" target=3D"_blank" rel=3D"noreferrer">dshah@xilinx.com</a>&gt;; Varu=
nkumar Allagadapa<br>
&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:VARUNKUM@xilinx.com" target=3D"_b=
lank" rel=3D"noreferrer">VARUNKUM@xilinx.com</a>&gt;; Devarsh Thakkar &lt;<=
a href=3D"mailto:DEVARSHT@xilinx.com" target=3D"_blank" rel=3D"noreferrer">=
DEVARSHT@xilinx.com</a>&gt;;<br>
&gt; &gt; &gt; &gt; Rohit Visavalia &lt;<a href=3D"mailto:RVISAVAL@xilinx.c=
om" target=3D"_blank" rel=3D"noreferrer">RVISAVAL@xilinx.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Subject: [PATCH libdrm] modetest: call drmModeCrtcSetGa=
mma() only<br>
&gt; &gt; &gt; &gt; if add_property_optional returns true<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; gamma is a optional property then also it prints error =
message, so<br>
&gt; &gt; &gt; &gt; set gamma only if add_property_optional() returns true.=
<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Rohit Visavalia &lt;<a href=3D"mailto:ro=
hit.visavalia@xilinx.com" target=3D"_blank" rel=3D"noreferrer">rohit.visava=
lia@xilinx.com</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 tests/modetest/modetest.c | 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/tests/modetest/modetest.c b/tests/modetest=
/modetest.c<br>
&gt; &gt; &gt; &gt; index b907ab3..379b9ea 100644<br>
&gt; &gt; &gt; &gt; --- a/tests/modetest/modetest.c<br>
&gt; &gt; &gt; &gt; +++ b/tests/modetest/modetest.c<br>
&gt; &gt; &gt; &gt; @@ -1138,7 +1138,7 @@ static void set_gamma(struct devi=
ce *dev,<br>
&gt; &gt; &gt; &gt; unsigned crtc_id, unsigned fourcc)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0add_property_optional(dev, crtc_id, =
&quot;DEGAMMA_LUT&quot;, 0);<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0add_property_optional(dev, crtc_id, =
&quot;CTM&quot;, 0);<br>
&gt; &gt; &gt; &gt; -=C2=A0 =C2=A0if (!add_property_optional(dev, crtc_id, =
&quot;GAMMA_LUT&quot;, blob_id)) {<br>
&gt; &gt; &gt; &gt; +=C2=A0 =C2=A0if (add_property_optional(dev, crtc_id, &=
quot;GAMMA_LUT&quot;, blob_id))<br>
&gt; &gt; &gt; &gt; + {<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t=
 r[256], g[256], b[256];<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =
=3D 0; i &lt; 256; i++) {<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; 2.7.4<br>
&gt; &gt;<br>
</blockquote></div>

--00000000000006a0e905a0a5af53--

--===============0921836261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0921836261==--
