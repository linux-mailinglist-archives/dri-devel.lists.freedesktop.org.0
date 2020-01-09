Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF24135E4B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B3F6E453;
	Thu,  9 Jan 2020 16:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5126F6E453;
 Thu,  9 Jan 2020 16:30:18 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id f129so3548338wmf.2;
 Thu, 09 Jan 2020 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7aQhl4E301r1RAC22UfGyCEjTPih9XLvQ7iN/m70hUw=;
 b=PtHzLgWigiEEAp7Em96pJMdgd5oiqaNpm6LOQQKz9wBs/HKXu8K5oZij2g5gFE535R
 oSkMwf5ZfFk4gEZNCX7GlPOZfjTeCavYTfyPKGjqUt3LO2iIuFqvZi16nEafbSM+1GEW
 rDOeqrDwd2Mw/NMWU891wFj+Z5qLmSR5NJ+zFZFp7X2U0OK5Lbp+CGpVJ1N9LqSyeC8b
 V32qtzg86L2pNy3/km5pBCrfbIwbeG8hDdxYjrEoso27N9KaRWzgyX/8lvhylp1P7q4T
 S7exV7epIozg7E1NQqydmwu+NDT2413slsgEbz/jIfvIbJukvEgrnrvjNSfBIZn+eBAy
 dJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7aQhl4E301r1RAC22UfGyCEjTPih9XLvQ7iN/m70hUw=;
 b=OJ3DzYjMCW1MgwPgLGH76tRnfXdUhi/gqF+c2bth3sUK7hmVQnjfslEeIOmNfzE9BA
 m9C/OCtuUl4fbIhehV9IcTC30lLW+lm/4YszwEkEvLn2inCQembPB2zbmr9NVHzX4TFb
 QcTagrRNtQw26Uyav0zvQ+bp0qdAQFqyeFWs3Tq7phFBjtXQTTxvNmWbZUZ5wYwzxJCx
 8/QxaFnlV1NNSMTnpl8Nt/aMUjsUeYCE6yHbDNwkX/7mrnSujykx1PuyX2h2bhGNUrVu
 h8gJU09qh/W3JWP5jeOG7zqOKzzAWU3JJPqojoASJERf42ISbvxT75Zszx3FPWIYBUDn
 mQKQ==
X-Gm-Message-State: APjAAAUVaBDRxer0xFEw+7Nkacb1gC9O+IqzvyqHfWoW5D9Fu+1ud5yp
 x0CsDS81/g0Wa8rRh0SpBYjbq4K+qiB+88GfBWs=
X-Google-Smtp-Source: APXvYqzjv/C2apY2mQ1Q/QONmlvO73y32AcYF18EKUyfHBdZsYj8gnz58faukJdD5bwx5/VRLJ6ZbUwnDBi0kOB1ze8=
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr5886778wml.107.1578587417011; 
 Thu, 09 Jan 2020 08:30:17 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com> <20200109153815.GQ1208@intel.com>
In-Reply-To: <20200109153815.GQ1208@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 17:30:05 +0100
Message-ID: <CAEsyxyj6xbHrkKk5=bG5APrD5VW_PP-Cs+nT0vqCjW_LBSG29A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1953102667=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1953102667==
Content-Type: multipart/alternative; boundary="0000000000003ceb75059bb78688"

--0000000000003ceb75059bb78688
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
.intel.com>
wrote:

> On Thu, Jan 09, 2020 at 05:26:57PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:
> > > The panel reports 10 bpc color depth in its EDID, and the UEFI
> > > firmware chooses link settings at boot which support enough
> > > bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> > > DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
>
> Does it actually or do we just ignore the fact that it reports 3.24Gbps?
>
> If it really reports 3.24 then we should be able to just add that to
> dp_rates[] in intel_dp_set_sink_rates() and be done with it.
>
> Although we'd likely want to skip 3.24 unless it really is reported
> as the max so as to not use that non-standard rate on other displays.
> So would require a bit fancier logic for that.
>
>
Was also my initial thought, but the DP_MAX_LINK_RATE reg reports 2.7 Gbps
as maximum.
-mario

--0000000000003ceb75059bb78688
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 9, 2020 at 4:38 PM Ville Syrj=
=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.sy=
rjala@linux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 09, 2020 at 05:=
26:57PM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:<br>
&gt; On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:<br>&gt;=
 &gt; The panel reports 10 bpc color depth in its EDID, and the UEFI<br>
&gt; &gt; firmware chooses link settings at boot which support enough<br>
&gt; &gt; bandwidth for 10 bpc (324000 kbit/sec to be precise), but the<br>
&gt; &gt; DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,=
<br>
<br>
Does it actually or do we just ignore the fact that it reports 3.24Gbps?<br=
>
<br>
If it really reports 3.24 then we should be able to just add that to<br>
dp_rates[] in intel_dp_set_sink_rates() and be done with it.<br>
<br>
Although we&#39;d likely want to skip 3.24 unless it really is reported<br>
as the max so as to not use that non-standard rate on other displays.<br>
So would require a bit fancier logic for that.<br>
<br></blockquote><div><br></div><div>Was also my initial thought, but the D=
P_MAX_LINK_RATE reg reports 2.7 Gbps as maximum.</div>-mario</div><div clas=
s=3D"gmail_quote"><br></div></div>

--0000000000003ceb75059bb78688--

--===============1953102667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1953102667==--
