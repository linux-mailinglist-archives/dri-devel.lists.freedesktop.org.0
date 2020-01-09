Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5769135E9B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:47:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEE26E455;
	Thu,  9 Jan 2020 16:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350256E406;
 Thu,  9 Jan 2020 16:47:01 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j42so8061335wrj.12;
 Thu, 09 Jan 2020 08:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CryIU+Kv+U/7ESgStfDOHOdJE8hdr+5dk7K25GbviJ4=;
 b=oH+j5Ij/cOpgga669cFu/UqIHnq5khBi8+h1f1R7rMrU2sA7qL9TFk3GS6AOXK1C7t
 vxlOueQG0ejd84OTkpE9fdTJa0QZ0VdrmAN48oe+OfdM2AoRfHUr2wR7AyEzW/rlV+p5
 6eYYSED0BisvaoCv85Ot5QiO9+v3wKuE/eLxAN79iHmaaT1l35h3Bvs5vgLS/86CxZS/
 4hZD+Ao5k3nWwSi0E+wAnlPsMeDhyr34JJYlcgCioxxu8XwFtdoJraLu04W+m0mvzPds
 cZIJIX2LtM4GGytYCT35EslFgA4rWaJJR8TL9I6Hv/HwJzFgHrr9ogM5lmnzUF8zJpip
 C3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CryIU+Kv+U/7ESgStfDOHOdJE8hdr+5dk7K25GbviJ4=;
 b=rREDBqlBL0Qtq96aLmtHYZJ6t1cdqDp9OroV5BtYwDH1WZoTjO7ni8C36DcpF/PI/3
 UNGNf59/VWCDHRQVh3P4a0fP5ZhmI+tC8TOcva4Pgm5KN+9ts6P6BNCH21d8S2VxDY/9
 7OYctISblpOd/mBgBv++MuiFm9meBRpU6rY03zvWFNuU7xNMZSdzZ8uluoEwxmgDuvJC
 Scc1SEJoFcNBmTIJ7DSI7bJRVQcdLJSJrldVrdcerysmszxawHd1hwtEr3GqoiUgw8bP
 G0vFfTuL5JGF3iJcCoLFM/Jg5zFogBla6+Nci9jSd9K8/nmaHs8tZUucep4brk5+Zd6s
 Nnmg==
X-Gm-Message-State: APjAAAXGFfpetD2oGdSnUFzx2y2ueAp02uVZDDBB80l3j6aNHwUcJk5Y
 EznTYc9eLGpWZ00hJPK9fx1UoB7bHQ+4bff7hqvr4kNXZKQ=
X-Google-Smtp-Source: APXvYqyAIVyNXsOctw6otDFA63TM9lQUv4n68wxmxyY3R3uh2dBmDMB8tZSpAIbRfJddjgypxVSuQhlt8PhGbyb3Yr0=
X-Received: by 2002:adf:ee45:: with SMTP id w5mr11538774wro.352.1578588419740; 
 Thu, 09 Jan 2020 08:46:59 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
In-Reply-To: <CADnq5_PvPD+FyEwUrqDVmbdLrP6ZC72HPtd19bqm-Csx-fHMOA@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 17:46:48 +0100
Message-ID: <CAEsyxyjTvuCHHA3D-NJd=aGkHz2d=obSizwGQL8B4k1B7i2jJg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/dp: Add current maximum eDP link rate to
 sink_rate array.
To: Alex Deucher <alexdeucher@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0531955111=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0531955111==
Content-Type: multipart/alternative; boundary="000000000000015e40059bb7c2e5"

--000000000000015e40059bb7c2e5
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 4:40 PM Alex Deucher <alexdeucher@gmail.com> wrote:

> On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner
> <mario.kleiner.de@gmail.com> wrote:
> >
> > If the current eDP link rate, as read from hw, provides a
> > higher bandwidth than the standard link rates, then add the
> > current link rate to the link_rates array for consideration
> > in future mode-sets.
> >
> > These initial current eDP link settings have been set up by
> > firmware during boot, so they should work on the eDP panel.
> > Therefore use them if the firmware thinks they are good and
> > they provide higher link bandwidth, e.g., to enable higher
> > resolutions / color depths.
> >
> > This fixes a problem found on the MacBookPro 2017 Retina panel:
> >
> > The panel reports 10 bpc color depth in its EDID, and the UEFI
> > firmware chooses link settings at boot which support enough
> > bandwidth for 10 bpc (324000 kbit/sec to be precise), but the
> > DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,
> > so intel_dp_set_sink_rates() would cap at that. This restricts
> > achievable color depth to 8 bpc, not providing the full color
> > depth of the panel. With this commit, we can use firmware setting
> > and get the full 10 bpc advertised by the Retina panel.
>
> Would it make more sense to just add a quirk for this particular
> panel?  Would there be cases where the link was programmed wrong and
> then we end up using that additional link speed as supported?
>
> Alex
>
>
Not sure. This MBP 2017 is the only non-ancient laptop i now have. I'd
assume many other Apple Retina panels would behave similar. The panels dpcd
regs report DP 1.1 and eDP 1.3, so the flexible table with additional modes
from eDP1.4+ does not exist. According to Wikipedia, eDP 1.4 was introduced
in february 2013 and this is a mid 2017 machine, so Apple seems to be quite
behind. Therefore i assume  we'd need a lot of quirks over time.

That said:

1. The logic in amdgpu's DC for the same purpose is a bit different than on
the intel side.

2. DC allows overriding DP link settings, that's how i initially tested
this, so one could do the "quirk" via something like that in a bootup
script. So on AMD one could work around the lack of the patch and of quirks.

3. I spent a lot of time with a photo-meter, testing the quality of the 10
bit: It turns out that running the panel at 8 bit + AMD's spatial dithering
that kicks in gives better results than running the panel in native 10 bit.
Maybe the panel is not really a 10 bit one, but just pretends to be and
then uses its own dithering to achieve 10 bit. So at least on AMD one is
better off precision-wise with the 8 bit panel default with this specific
panel.

On Intel however, we don't do dithering for > 6 bpc panels atm., so using
the panel at 10 bpc is the only way to get 10 bit display atm. Adn we don't
use dithering on Intel at > 6 bpc panels atm., because there are some
oddities in the way Intel hw dithers at higher bit depths - it also dithers
pixel values where it shouldn't. That makes it impossible to get an
identity passthrough of a 8 bpc framebuffer to the outputs, which kills all
kind of special display equipment that needs that identity passthrough to
work.

-mario

>
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> > ---
> >  drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 2f31d226c6eb..aa3e0b5108c6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >  {
> >         struct drm_i915_private *dev_priv =
> >                 to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
> > +       int max_rate;
> > +       u8 link_bw;
> >
> >         /* this function is meant to be called only once */
> >         WARN_ON(intel_dp->dpcd[DP_DPCD_REV] != 0);
> > @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >         else
> >                 intel_dp_set_sink_rates(intel_dp);
> >
> > +       /*
> > +        * If the firmware programmed a rate higher than the standard
> sink rates
> > +        * during boot, then add that rate as a valid sink rate, as fw
> knows
> > +        * this is a good rate and we get extra bandwidth.
> > +        *
> > +        * Helps, e.g., on the Apple MacBookPro 2017 Retina panel, which
> is only
> > +        * eDP 1.1, but supports the unusual rate of 324000 kHz at
> bootup, for
> > +        * 10 bpc / 30 bit color depth.
> > +        */
> > +       if (!intel_dp->use_rate_select &&
> > +           (drm_dp_dpcd_read(&intel_dp->aux, DP_LINK_BW_SET, &link_bw,
> 1) == 1) &&
> > +           (link_bw > 0) && (intel_dp->num_sink_rates <
> DP_MAX_SUPPORTED_RATES)) {
> > +               max_rate = drm_dp_bw_code_to_link_rate(link_bw);
> > +               if (max_rate >
> intel_dp->sink_rates[intel_dp->num_sink_rates - 1]) {
> > +                       intel_dp->sink_rates[intel_dp->num_sink_rates] =
> max_rate;
> > +                       intel_dp->num_sink_rates++;
> > +                       DRM_DEBUG_KMS("Adding max bandwidth eDP rate %d
> kHz.\n",
> > +                                     max_rate);
> > +               }
> > +       }
> > +
> >         intel_dp_set_common_rates(intel_dp);
> >
> >         /* Read the eDP DSC DPCD registers */
> > --
> > 2.24.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000015e40059bb7c2e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 9, 2020 at 4:40 PM Alex Deuch=
er &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Jan 9, 2020 at 10:08 AM Mario Kleiner<br>
&lt;<a href=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.k=
leiner.de@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; If the current eDP link rate, as read from hw, provides a<br>
&gt; higher bandwidth than the standard link rates, then add the<br>
&gt; current link rate to the link_rates array for consideration<br>
&gt; in future mode-sets.<br>
&gt;<br>
&gt; These initial current eDP link settings have been set up by<br>
&gt; firmware during boot, so they should work on the eDP panel.<br>
&gt; Therefore use them if the firmware thinks they are good and<br>
&gt; they provide higher link bandwidth, e.g., to enable higher<br>
&gt; resolutions / color depths.<br>
&gt;<br>
&gt; This fixes a problem found on the MacBookPro 2017 Retina panel:<br>
&gt;<br>
&gt; The panel reports 10 bpc color depth in its EDID, and the UEFI<br>
&gt; firmware chooses link settings at boot which support enough<br>
&gt; bandwidth for 10 bpc (324000 kbit/sec to be precise), but the<br>
&gt; DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,<br>
&gt; so intel_dp_set_sink_rates() would cap at that. This restricts<br>
&gt; achievable color depth to 8 bpc, not providing the full color<br>
&gt; depth of the panel. With this commit, we can use firmware setting<br>
&gt; and get the full 10 bpc advertised by the Retina panel.<br>
<br>
Would it make more sense to just add a quirk for this particular<br>
panel?=C2=A0 Would there be cases where the link was programmed wrong and<b=
r>
then we end up using that additional link speed as supported?<br>
<br>
Alex<br>
<br></blockquote><div><br></div><div>Not sure. This MBP 2017 is the only no=
n-ancient laptop i now have. I&#39;d assume many other Apple Retina panels =
would behave similar. The panels dpcd regs report DP 1.1 and eDP 1.3, so th=
e flexible table with additional modes from eDP1.4+ does not exist. Accordi=
ng to Wikipedia, eDP 1.4 was introduced in february 2013 and this is a mid =
2017 machine, so Apple seems to be quite behind. Therefore i assume=C2=A0 w=
e&#39;d need a lot of quirks over time.<br></div><div><br></div><div>That s=
aid:</div><div><br></div><div>1. The logic in amdgpu&#39;s DC for the same =
purpose is a bit different than on the intel side.</div><div><br></div><div=
>2. DC allows overriding DP link settings, that&#39;s how i initially teste=
d this, so one could do the &quot;quirk&quot; via something like that in a =
bootup script. So on AMD one could work around the lack of the patch and of=
 quirks.<br></div><div><br></div><div>3. I spent a lot of time with a photo=
-meter, testing the quality of the 10 bit: It turns out that running the pa=
nel at 8 bit + AMD&#39;s spatial dithering that kicks in gives better resul=
ts than running the panel in native 10 bit. Maybe the panel is not really a=
 10 bit one, but just pretends to be and then uses its own dithering to ach=
ieve 10 bit. So at least on AMD one is better off precision-wise with the 8=
 bit panel default with this specific panel.<br></div><div><br></div><div>O=
n Intel however, we don&#39;t do dithering for &gt; 6 bpc panels atm., so u=
sing the panel at 10 bpc is the only way to get 10 bit display atm. Adn we =
don&#39;t use dithering on Intel at &gt; 6 bpc panels atm., because there a=
re some oddities in the way Intel hw dithers at higher bit depths - it also=
 dithers pixel values where it shouldn&#39;t. That makes it impossible to g=
et an identity passthrough of a 8 bpc framebuffer to the outputs, which kil=
ls all kind of special display equipment that needs that identity passthrou=
gh to work.</div><div><br></div><div>-mario<br></div><div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt;<br>
&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gm=
ail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=
=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++=
++++<br>
&gt;=C2=A0 1 file changed, 23 insertions(+)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c<br>
&gt; index 2f31d226c6eb..aa3e0b5108c6 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; @@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_private *dev_priv =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_i915(d=
p_to_dig_port(intel_dp)-&gt;<a href=3D"http://base.base.dev" rel=3D"norefer=
rer" target=3D"_blank">base.base.dev</a>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int max_rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 link_bw;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* this function is meant to be calle=
d only once */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(intel_dp-&gt;dpcd[DP_DPCD_REV=
] !=3D 0);<br>
&gt; @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp_=
set_sink_rates(intel_dp);<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If the firmware programmed a rate highe=
r than the standard sink rates<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * during boot, then add that rate as a va=
lid sink rate, as fw knows<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * this is a good rate and we get extra ba=
ndwidth.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Helps, e.g., on the Apple MacBookPro 20=
17 Retina panel, which is only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * eDP 1.1, but supports the unusual rate =
of 324000 kHz at bootup, for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 10 bpc / 30 bit color depth.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!intel_dp-&gt;use_rate_select &amp;&am=
p;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(drm_dp_dpcd_read(&amp;intel=
_dp-&gt;aux, DP_LINK_BW_SET, &amp;link_bw, 1) =3D=3D 1) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(link_bw &gt; 0) &amp;&amp; =
(intel_dp-&gt;num_sink_rates &lt; DP_MAX_SUPPORTED_RATES)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_rate =3D d=
rm_dp_bw_code_to_link_rate(link_bw);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (max_rate &=
gt; intel_dp-&gt;sink_rates[intel_dp-&gt;num_sink_rates - 1]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0intel_dp-&gt;sink_rates[intel_dp-&gt;num_sink_rates] =3D max_=
rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0intel_dp-&gt;num_sink_rates++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0DRM_DEBUG_KMS(&quot;Adding max bandwidth eDP rate %d kHz.\n&q=
uot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_rate);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp_set_common_rates(intel_dp);<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read the eDP DSC DPCD registers */=
<br>
&gt; --<br>
&gt; 2.24.0<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--000000000000015e40059bb7c2e5--

--===============0531955111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0531955111==--
