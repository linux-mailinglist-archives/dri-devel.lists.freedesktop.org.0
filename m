Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8F7135E37
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 17:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B54D96E447;
	Thu,  9 Jan 2020 16:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E1F6E447;
 Thu,  9 Jan 2020 16:28:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b6so8124985wrq.0;
 Thu, 09 Jan 2020 08:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8mOV74nY4K3eVLh30123d82NtW8BtZjF6A+x7PV8HRY=;
 b=C8D4GuFOE/2d458OLXNhzEkkY+vTzQw5x6LdFAj5Jao5eA1i7hHr8S4dZVR4ALDoR9
 F7GiUqbo9/6swsS5cgFZyu96uxkaCX2IueRTE5kBg6pb1nDZJSaEWJ07SLYtC7xriqtA
 O8qFAFjw3HfK1Sk836XUxrTPhnaF01DX40JqhrewlsT7kC0lXcTXCFEqVFwnTqmRqYlH
 ZpJMC7+TBWbDjp07ZqLqDeXThE08TIQSEYN+8Ux0JenvEybRncunYksmZOoq79H4Klta
 JzPpucgsTSxKy1nTXiXhdnRbIau7Rvgsuk1NVyeFP5JCGX6VagNWuO6x/XulISekMFXA
 w/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mOV74nY4K3eVLh30123d82NtW8BtZjF6A+x7PV8HRY=;
 b=HLQZRZ6bxtb7pPTGMNwlpXTAOWvZOewf6U8i6M+pb4RxZK2tKRxeE/lVi1aubrst7d
 JdvC8YPvxCh5kdGg4Lkby0qBdjA+S1rXZiWhNniODiM7JzO/oQVj/0g2CRpUPrYIbKxj
 n09caGmpiSCEO01u/CdkWv6tgeNkQNX8ZRtqh3dPm9MdIvipmGrSKXo5JXkxkmV7EZlp
 TKPVYP+hJJ0OaeM9+5hlTwjdCgXSq1bH6QIeVw7ChiTTO5A8LHOwAWeYdF5bXw+fQutW
 Y+nDzY9LbpR99VN5wVbA+lQnZoDrb3fk1sRGCjDKfIalUuWYkccDfy0OwFMFUaQGWVN2
 0Juw==
X-Gm-Message-State: APjAAAXRFFUXQg6tPqqrrgD/nL0IP20gHj1bromaXczSf5yA5FuQJayI
 2UcwM7uxUUh1hsfua6yknyoD754MSwuP3XlV1VvKMzFblaQ=
X-Google-Smtp-Source: APXvYqw/vXOqK/EGedhLmkk+ks++MRoMZceB2Nf87Y9VviDh0MnKkZwPhV+px7YMf+K7fkL7B2Geijr7UkoBB/CTtNk=
X-Received: by 2002:a05:6000:1187:: with SMTP id
 g7mr12293077wrx.109.1578587283126; 
 Thu, 09 Jan 2020 08:28:03 -0800 (PST)
MIME-Version: 1.0
References: <20200109150752.28098-1-mario.kleiner.de@gmail.com>
 <20200109152656.GP1208@intel.com>
In-Reply-To: <20200109152656.GP1208@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 17:27:51 +0100
Message-ID: <CAEsyxyi7_vyLx7+4-zGPPSq7xv1bM_myDNu6ePvG+v9zObybQg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0902916570=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0902916570==
Content-Type: multipart/alternative; boundary="00000000000041fed1059bb77e0f"

--00000000000041fed1059bb77e0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 4:27 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux=
.intel.com>
wrote:

> On Thu, Jan 09, 2020 at 04:07:52PM +0100, Mario Kleiner wrote:
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
> >
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
> >       struct drm_i915_private *dev_priv =3D
> >               to_i915(dp_to_dig_port(intel_dp)->base.base.dev);
> > +     int max_rate;
> > +     u8 link_bw;
> >
> >       /* this function is meant to be called only once */
> >       WARN_ON(intel_dp->dpcd[DP_DPCD_REV] !=3D 0);
> > @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)
> >       else
> >               intel_dp_set_sink_rates(intel_dp);
> >
> > +     /*
> > +      * If the firmware programmed a rate higher than the standard sin=
k
> rates
> > +      * during boot, then add that rate as a valid sink rate, as fw
> knows
> > +      * this is a good rate and we get extra bandwidth.
> > +      *
> > +      * Helps, e.g., on the Apple MacBookPro 2017 Retina panel, which
> is only
> > +      * eDP 1.1, but supports the unusual rate of 324000 kHz at bootup=
,
> for
> > +      * 10 bpc / 30 bit color depth.
> > +      */
> > +     if (!intel_dp->use_rate_select &&
> > +         (drm_dp_dpcd_read(&intel_dp->aux, DP_LINK_BW_SET, &link_bw, 1=
)
> =3D=3D 1) &&
> > +         (link_bw > 0) && (intel_dp->num_sink_rates <
> DP_MAX_SUPPORTED_RATES)) {
> > +             max_rate =3D drm_dp_bw_code_to_link_rate(link_bw);
> > +             if (max_rate >
> intel_dp->sink_rates[intel_dp->num_sink_rates - 1]) {
> > +                     intel_dp->sink_rates[intel_dp->num_sink_rates] =
=3D
> max_rate;
> > +                     intel_dp->num_sink_rates++;
> > +                     DRM_DEBUG_KMS("Adding max bandwidth eDP rate %d
> kHz.\n",
> > +                                   max_rate);
> > +             }
>
> Hmm. I guess we could do this. But plese put it into a separate
> function so we don't end up with that super ugly if condition.
>
>
Ok. Does static void intel_edp_add_bootup_rate() good to you? Or
intel_edp_add_fw_rate()?

The debug message should probably be a bit more explicit. Eg.
> something like:
> "Firmware using non-standard link rate %d kHz. Including it in sink
> rates.\n"
>

Ok.


> I'm also wondering if we shouldn't just add the link rate to the sink
> rates regradless of whether it's the highest rate or not...
>
>
I tried to be conservative, and simple, but yes, one could add it anyway.
Would need to preserve the order in the sink_rates[] array.
Your choice, your're the expert :)


> > +     }
> > +
> >       intel_dp_set_common_rates(intel_dp);
> >
> >       /* Read the eDP DSC DPCD registers */
> > --
> > 2.24.0
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--00000000000041fed1059bb77e0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 9, 2020 at 4:27 PM Ville Syrj=
=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.intel.com">ville.sy=
rjala@linux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jan 09, 2020 at 04:=
07:52PM +0100, Mario Kleiner wrote:<br>
&gt; If the current eDP link rate, as read from hw, provides a<br>
&gt; higher bandwidth than the standard link rates, then add the<br>
&gt; current link rate to the link_rates array for consideration<br>
&gt; in future mode-sets.<br>
&gt; <br>
&gt; These initial current eDP link settings have been set up by<br>
&gt; firmware during boot, so they should work on the eDP panel.<br>
&gt; Therefore use them if the firmware thinks they are good and<br>
&gt; they provide higher link bandwidth, e.g., to enable higher<br>
&gt; resolutions / color depths.<br>
&gt; <br>
&gt; This fixes a problem found on the MacBookPro 2017 Retina panel:<br>
&gt; <br>
&gt; The panel reports 10 bpc color depth in its EDID, and the UEFI<br>
&gt; firmware chooses link settings at boot which support enough<br>
&gt; bandwidth for 10 bpc (324000 kbit/sec to be precise), but the<br>
&gt; DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps as possible,<br>
&gt; so intel_dp_set_sink_rates() would cap at that. This restricts<br>
&gt; achievable color depth to 8 bpc, not providing the full color<br>
&gt; depth of the panel. With this commit, we can use firmware setting<br>
&gt; and get the full 10 bpc advertised by the Retina panel.<br>
&gt; <br>
&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gm=
ail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Cc: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" target=
=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_dp.c | 23 +++++++++++++++++++=
++++<br>
&gt;=C2=A0 1 file changed, 23 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm=
/i915/display/intel_dp.c<br>
&gt; index 2f31d226c6eb..aa3e0b5108c6 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_dp.c<br>
&gt; @@ -4368,6 +4368,8 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_i915_private *dev_priv =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to_i915(dp_to_di=
g_port(intel_dp)-&gt;<a href=3D"http://base.base.dev" rel=3D"noreferrer" ta=
rget=3D"_blank">base.base.dev</a>);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int max_rate;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 link_bw;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* this function is meant to be called only =
once */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(intel_dp-&gt;dpcd[DP_DPCD_REV] !=3D =
0);<br>
&gt; @@ -4433,6 +4435,27 @@ intel_edp_init_dpcd(struct intel_dp *intel_dp)<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp_set_sin=
k_rates(intel_dp);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If the firmware programmed a rate higher than =
the standard sink rates<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * during boot, then add that rate as a valid sin=
k rate, as fw knows<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this is a good rate and we get extra bandwidth=
.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Helps, e.g., on the Apple MacBookPro 2017 Reti=
na panel, which is only<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * eDP 1.1, but supports the unusual rate of 3240=
00 kHz at bootup, for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * 10 bpc / 30 bit color depth.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!intel_dp-&gt;use_rate_select &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(drm_dp_dpcd_read(&amp;intel_dp-&gt=
;aux, DP_LINK_BW_SET, &amp;link_bw, 1) =3D=3D 1) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(link_bw &gt; 0) &amp;&amp; (intel_=
dp-&gt;num_sink_rates &lt; DP_MAX_SUPPORTED_RATES)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_rate =3D drm_dp_b=
w_code_to_link_rate(link_bw);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (max_rate &gt; int=
el_dp-&gt;sink_rates[intel_dp-&gt;num_sink_rates - 1]) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0intel_dp-&gt;sink_rates[intel_dp-&gt;num_sink_rates] =3D max_rate;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0intel_dp-&gt;num_sink_rates++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0DRM_DEBUG_KMS(&quot;Adding max bandwidth eDP rate %d kHz.\n&quot;,<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_rate);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Hmm. I guess we could do this. But plese put it into a separate<br>
function so we don&#39;t end up with that super ugly if condition.<br>
<br></blockquote><div><br></div><div>Ok. Does static void intel_edp_add_boo=
tup_rate() good to you? Or intel_edp_add_fw_rate()?</div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
The debug message should probably be a bit more explicit. Eg. <br>
something like: <br>
&quot;Firmware using non-standard link rate %d kHz. Including it in sink ra=
tes.\n&quot;<br></blockquote><div><br></div><div>Ok.</div><div><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I&#39;m also wondering if we shouldn&#39;t just add the link rate to the si=
nk<br>
rates regradless of whether it&#39;s the highest rate or not...<br>
<br></blockquote><div><br></div><div>I tried to be conservative, and simple=
, but yes, one could add it anyway. Would need to preserve the order in the=
 sink_rates[] array.</div><div>Your choice, your&#39;re the expert :)<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0intel_dp_set_common_rates(intel_dp);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Read the eDP DSC DPCD registers */<br>
&gt; -- <br>
&gt; 2.24.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
<br>
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div></div>

--00000000000041fed1059bb77e0f--

--===============0902916570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0902916570==--
