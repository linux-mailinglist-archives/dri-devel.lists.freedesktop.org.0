Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A44E975
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 15:39:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BE56E817;
	Fri, 21 Jun 2019 13:39:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A73B6E817
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 13:39:13 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id w13so10211834eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 06:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tYJrGOtitn7NxTBXD9Cm2cWhUTYxajee1epHQKw0L94=;
 b=YpR41fo/xYInj6Yyff0s7EQH7i+3ZFBKDTwzjSC876sjT4pXNgMZ7MyMMrIjPpjjwq
 3OK6lQoKBBNW7KPcXm1br1TutChPvTmjhRXYH494exAad/E01JSMezuGzqIoWVG+WomG
 gKar/v1O80NXQq+T4x8Hvrj6hPH/75g03WgbIobSaebZJSW0IB5Msm0d+jN++c8oQT5R
 XPNHK/J9AjozhPYn5Q8ziqADTa5m2eFWCXbHDGlLeMl9C3H5hAloeWGArRuvSMHJZDtM
 PTTBVggXIOMfGyT1v54eppvNb8rf5WAMjZu9DcnDtWuWy4xY2t1VXLQCL11jZWhmenAq
 b86Q==
X-Gm-Message-State: APjAAAVirvnuvBdVeByxZPc5ibAZvrWI+2wvkUneVaLgr6Iwn4yYjTse
 d8/CamuyXbxmrT6Hhd2ZhbNG2IToehIba57OKQTkNsP3wLA=
X-Google-Smtp-Source: APXvYqy41o3zHHYBWZeasg4vmi6HqAjTqltdVfr/f5KZRDINiBwVjZgNSVBP6NAo0oVdbNu83ekwciXQGQ6hGU8WsJE=
X-Received: by 2002:a50:9822:: with SMTP id
 g31mr116847195edb.175.1561124352207; 
 Fri, 21 Jun 2019 06:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <1541592640-18478-1-git-send-email-bdodge09@gmail.com>
 <1541592640-18478-3-git-send-email-bdodge09@gmail.com>
 <20181111113053.GF27666@amd>
 <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
In-Reply-To: <e372391c-1fd5-41ec-b766-7669fffb928d@gmail.com>
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Fri, 21 Jun 2019 14:39:01 +0100
Message-ID: <CAMTL27EJuD3WOBDVd_wen=VCxMZ-RPMZ52JnGBKjzftr-twKsw@mail.gmail.com>
Subject: Re: [PATCH 2/3] backlight/arcxcnn fix vendor prefix
To: Brian Dodge <bdodge09@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tYJrGOtitn7NxTBXD9Cm2cWhUTYxajee1epHQKw0L94=;
 b=muk08lMeAJNT1THBxMMq4nN46VYwlIUr1qk8DlhMO+SCgt3HWvIbWC02F/WpctHQ6P
 DDPnTzTVQnCynzOyewEGeKA6A/TcM1Y6R7rgv+A7K3ZQgbXX8DCBdlcnPbd47e0ajIVl
 UYHJW72OlE3nqCvIGsoIRNNTHHgKeWD2zrVFdmB4PdjnZPGHSDsbFsnhjmsPSx+DVxFm
 jlEj2kVj7fAIPs8PbTssSybPreMDBuouc3mjE6m3rMX7Q1VYWXsFYXUQHOT0AyuZpkeM
 2xu2euXPuB8GiTjYwZ3kj1WcjD/IRf1muejUcXqonUBCeW9BWgDxveBnag7PvDEvasga
 1cjw==
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Peter Bacon <pbacon@psemi.com>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0641881323=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0641881323==
Content-Type: multipart/alternative; boundary="00000000000076ce46058bd596e2"

--00000000000076ce46058bd596e2
Content-Type: text/plain; charset="UTF-8"

Hi Brian

On Tue, 27 Nov 2018 at 00:44, Brian Dodge <bdodge09@gmail.com> wrote:

> Thank you Pavel, that is a good point.
>
> The chip vendor has indicated that there is no reason to maintain the
> old/improper prefix and wishes to go forward (only) with the "arctic"
> prefix and any existing dts files are or will be updated.
>

Looks like this patch series has fallen into the cracks a little.

I think I assumed this info would end in the description of patch v2 1/3
(in order to answer Rob's feedback) and I sat and waited for a respin. On
the other hand... I didn't actually say that explicitly anywhere! So... I'd
recommend a respin perhaps with a small bit of text explaining how the
vendor can state that any existing dts files will be updated. This is a
peripheral device so these strings are probably embedded into OEM
devicetrees rather than exclusively under the control of the vendor.


Daniel.




> On 11/11/18 6:30 AM, Pavel Machek wrote:
> > Hi!
> >
> >> The vendor-prefixes.txt file properly refers to ArcticSand
> >> as arctic but the driver improperly abbreviated the prefix
> >> to arc. This was a mistake in the original patch
> >>
> >> Signed-off-by: Brian Dodge <bdodge09@gmail.com>
> >> ---
> >>   drivers/video/backlight/arcxcnn_bl.c | 22 +++++++++++-----------
> >>   1 file changed, 11 insertions(+), 11 deletions(-)
> >>
> >>    *
> >> - * Copyright 2016 ArcticSand, Inc.
> >> - * Author : Brian Dodge <bdodge@arcticsand.com>
> >> + * Copyright 2018 pSemi, Inc.
> >> + * Author : Brian Dodge <bdodge@psemi.com>
> > Ummm. Copyright 2016-2018?
> >
> >> @@ -202,27 +202,27 @@ static void arcxcnn_parse_dt(struct arcxcnn *lp)
> >>      if (ret == 0)
> >>              lp->pdata->initial_brightness = prog_val;
> >>
> >> -    ret = of_property_read_u32(node, "arc,led-config-0", &prog_val);
> >> +    ret = of_property_read_u32(node, "arctic,led-config-0", &prog_val);
> >>      if (ret == 0)
> >>              lp->pdata->led_config_0 = (u8)prog_val;
> >>
> > If there's a dts using this, you want to update it at the same
> > time. You may want to support both names going forward.
> >
>  Pavel
>

--00000000000076ce46058bd596e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Brian</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 27 Nov 2018 at 00:44, Brian Dodge &lt=
;<a href=3D"mailto:bdodge09@gmail.com">bdodge09@gmail.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">Thank you Pavel, t=
hat is a good point.<br>
<br>
The chip vendor has indicated that there is no reason to maintain the <br>
old/improper prefix and wishes to go forward (only) with the &quot;arctic&q=
uot; <br>
prefix and any existing dts files are or will be updated.<br></blockquote><=
div><br></div><div>Looks like this patch series has fallen into the cracks =
a little.</div><div><br></div><div>I think I assumed this info would end in=
 the description of patch v2 1/3 (in order to answer Rob&#39;s feedback) an=
d I sat and waited for a respin. On the other hand... I didn&#39;t actually=
 say that explicitly anywhere! So... I&#39;d recommend a respin perhaps wit=
h a small bit of text explaining how the vendor can state that any existing=
 dts files will be updated. This is a peripheral device so these strings ar=
e probably embedded into OEM devicetrees rather than exclusively under the =
control of the vendor.</div><div><br></div><div><br></div><div>Daniel.</div=
><div><br></div><div><br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
On 11/11/18 6:30 AM, Pavel Machek wrote:<br>
&gt; Hi!<br>
&gt;<br>
&gt;&gt; The vendor-prefixes.txt file properly refers to ArcticSand<br>
&gt;&gt; as arctic but the driver improperly abbreviated the prefix<br>
&gt;&gt; to arc. This was a mistake in the original patch<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Brian Dodge &lt;<a href=3D"mailto:bdodge09@gmail.co=
m" target=3D"_blank">bdodge09@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 =C2=A0drivers/video/backlight/arcxcnn_bl.c | 22 +++++++++++-=
----------<br>
&gt;&gt;=C2=A0 =C2=A01 file changed, 11 insertions(+), 11 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 *<br>
&gt;&gt; - * Copyright 2016 ArcticSand, Inc.<br>
&gt;&gt; - * Author : Brian Dodge &lt;<a href=3D"mailto:bdodge@arcticsand.c=
om" target=3D"_blank">bdodge@arcticsand.com</a>&gt;<br>
&gt;&gt; + * Copyright 2018 pSemi, Inc.<br>
&gt;&gt; + * Author : Brian Dodge &lt;<a href=3D"mailto:bdodge@psemi.com" t=
arget=3D"_blank">bdodge@psemi.com</a>&gt;<br>
&gt; Ummm. Copyright 2016-2018?<br>
&gt;<br>
&gt;&gt; @@ -202,27 +202,27 @@ static void arcxcnn_parse_dt(struct arcxcnn =
*lp)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;pdata-&gt;i=
nitial_brightness =3D prog_val;<br>
&gt;&gt;<br>
&gt;&gt; -=C2=A0 =C2=A0 ret =3D of_property_read_u32(node, &quot;arc,led-co=
nfig-0&quot;, &amp;prog_val);<br>
&gt;&gt; +=C2=A0 =C2=A0 ret =3D of_property_read_u32(node, &quot;arctic,led=
-config-0&quot;, &amp;prog_val);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (ret =3D=3D 0)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lp-&gt;pdata-&gt;l=
ed_config_0 =3D (u8)prog_val;<br>
&gt;&gt;<br>
&gt; If there&#39;s a dts using this, you want to update it at the same<br>
&gt; time. You may want to support both names going forward.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pavel<br>
</blockquote></div></div>

--00000000000076ce46058bd596e2--

--===============0641881323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0641881323==--
