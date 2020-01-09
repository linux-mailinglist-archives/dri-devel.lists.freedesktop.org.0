Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2670D136251
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 22:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 908646E96B;
	Thu,  9 Jan 2020 21:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CB56E96A;
 Thu,  9 Jan 2020 21:13:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id d73so4550930wmd.1;
 Thu, 09 Jan 2020 13:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fINWBWTQQh7QSskk5jBe/rgUu9y3MpwfI7+Qn438jNs=;
 b=GZC/mJAJgLktOFnBb4UR75TOlS60PYHyXAzilC0h3WMUCOWc3pFkyzsSbCMzbFtRr7
 ZpaWkrYvnVD13Bbu8kN+rceFp2/5ubey3xvacOoEQuEd8axtovPciWPj0KclTU1CkuJi
 XmtAxo9AQZthVayI7ZM+S3sw5VMJ1h9m8GwDtKVxr/8DLLqjB/1WSfdTE5tgyzb7ogUw
 3+iGrIB56F+rBNF/M9FWdJMCYt8UIRhZMkPq1Rd0pqiv6EyhbRhswLXRe/FKOJUU6j69
 jWO6PsGiJ0qaeg64ElNFvb5LuZcq/AfxLTWb6GCIO47uSKfzLI3lrIDN6FsBTQoZi2XI
 EDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fINWBWTQQh7QSskk5jBe/rgUu9y3MpwfI7+Qn438jNs=;
 b=IOY5c8TFrH3JzIHEmZL8SpTzBFOq8H6LLPVZBzYAPOB1aYLo5Zv0hToBc/lQlzqjM7
 eA0PNcxY+GkUnC5QHF4OLhEiwAiKud7SqaxxxmU7tSsquPHOO2VF0yR4aFjrVmrzjuXW
 3dgE7JCdTTwxcRUS+fwlrrbcWagnypG2ZfaFrzBKDczKoZiN3v+mixB8cAmPjo0mUhMc
 DQQz28CZ6vCTnSQwlMv4u4dl9wtAAopB0Uf6zwF8bkVB8E/n8j/IYb/h8HDdi+QkAcIy
 xt69dLe2AlIR5ZQWDNSgC/dPjlVg7Mx08BFA4WkoTPVi5pE7pxd9fJHGcfy6+5R0IiaJ
 qktg==
X-Gm-Message-State: APjAAAV2P1G1mYHvIY+5iL1mJnQ/jEH5M7mT8rpUlXc4qeqNAmnmIWlB
 elT7p+9vCTM5ZucRt6EjR4gyEzm7Vdup0uaSjxK7Dc7BIA0=
X-Google-Smtp-Source: APXvYqxwHLzbgRphtR/F1yO1qKrvk2wlowYoG0AElH+V3K5SI7asrQbBdNI0DLE40jpN8AELNah0Lxj1DWTpH/aUN8M=
X-Received: by 2002:a1c:28d4:: with SMTP id o203mr6860365wmo.123.1578604415154; 
 Thu, 09 Jan 2020 13:13:35 -0800 (PST)
MIME-Version: 1.0
References: <20200109152028.28260-1-mario.kleiner.de@gmail.com>
 <20200109152028.28260-3-mario.kleiner.de@gmail.com>
 <9238371c-fc93-2a65-c3e5-df6b3d1270dd@amd.com>
In-Reply-To: <9238371c-fc93-2a65-c3e5-df6b3d1270dd@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 9 Jan 2020 22:13:23 +0100
Message-ID: <CAEsyxygx+2p+i91bvYBLVfq-9qog-SLQ_KdHBTmSyq4Zfr09jg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Allow current eDP link settings to
 override verified ones.
To: Harry Wentland <hwentlan@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, mario.kleiner.de@gmail.de,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1563301238=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1563301238==
Content-Type: multipart/alternative; boundary="00000000000067ffbc059bbb7bd3"

--00000000000067ffbc059bbb7bd3
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 7:44 PM Harry Wentland <hwentlan@amd.com> wrote:

> On 2020-01-09 10:20 a.m., Mario Kleiner wrote:
> > If the current eDP link settings, as read from hw, provide a higher
> > bandwidth than the verified_link_cap ones (= reported_link_cap), then
> > override verified_link_cap with current settings.
> >
> > These initial current eDP link settings have been set up by
> > firmware during boot, so they should work on the eDP panel.
> > Therefore use them if the firmware thinks they are good and
> > they provide higher link bandwidth, e.g., to enable higher
> > resolutions / color depths.
> >
>


Hi Harry, happy new year!

This only works when taking over from UEFI, so on boot or resume from
> hibernate. This wouldn't work on a normal suspend/resume.
>
>
See the other thread i just cc'ed you on. Depends if
dc_link_detect_helper() gets skipped/early returns or not on EDP. Some if
statement suggests it might get skipped on EDP + resume?


> Can you check if setting link->dc->config.optimize_edp_link_rate (see
> first if statement in detect_edp_sink_caps) fixes this? I imagine we
> need to read the reported settings from DP_SUPPORTED_LINK_RATES and fail
> to do so.
>

Tried that already (see other mail), replacing the whole if statement with
a if (true) to force reading DP_SUPPORTED_LINK_RATES. The whole table reads
back as all-zero, and versions are DP 1.1, eDP 1.3, not 1.4+ as what seems
to be required. The use the classic link bw stuff, but with a non-standard
link bandwidth multiplier of 0xc, and a reported DP_MAX_LINK_RATE of 0xa,
contradicting the 0xc setting that the firmware sets at bootup.

Seems to be a very Apple thing...
-mario


>
> Thanks,
> Harry
>
> > This fixes a problem found on the MacBookPro 2017 Retina panel:
> >
> > The panel reports 10 bpc color depth in its EDID, and the
> > firmware chooses link settings at boot which support enough
> > bandwidth for 10 bpc (324000 kbit/sec aka LINK_RATE_RBR2),
> > but the DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps
> > as possible, so verified_link_cap is only good for 2.7 Gbps
> > and 8 bpc, not providing the full color depth of the panel.
> >
> > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > ---
> >  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 21 +++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > index 5ea4a1675259..f3acdb8fead5 100644
> > --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> > @@ -819,6 +819,27 @@ static bool dc_link_detect_helper(struct dc_link
> *link,
> >               case SIGNAL_TYPE_EDP: {
> >                       detect_edp_sink_caps(link);
> >                       read_current_link_settings_on_detect(link);
> > +
> > +                     /* If cur_link_settings provides higher bandwidth
> than
> > +                      * verified_link_cap, then use cur_link_settings
> as new
> > +                      * verified_link_cap, as it obviously works
> according to
> > +                      * firmware boot setup.
> > +                      *
> > +                      * This has been observed on the Apple MacBookPro
> 2017
> > +                      * Retina panel, which boots with a link setting
> higher
> > +                      * than what dpcd[DP_MAX_LINK_RATE] claims as
> possible.
> > +                      * Overriding allows to run the panel at 10 bpc /
> 30 bit.
> > +                      */
> > +                     if (dc_link_bandwidth_kbps(link,
> &link->cur_link_settings) >
> > +                         dc_link_bandwidth_kbps(link,
> &link->verified_link_cap)) {
> > +                             DC_LOG_DETECTION_DP_CAPS(
> > +                             "eDP current link setting bw %d kbps >
> verified_link_cap %d kbps. Override.",
> > +                             dc_link_bandwidth_kbps(link,
> &link->cur_link_settings),
> > +                             dc_link_bandwidth_kbps(link,
> &link->verified_link_cap));
> > +
> > +                             link->verified_link_cap =
> link->cur_link_settings;
> > +                     }
> > +
> >                       sink_caps.transaction_type =
> DDC_TRANSACTION_TYPE_I2C_OVER_AUX;
> >                       sink_caps.signal = SIGNAL_TYPE_EDP;
> >                       break;
> >
>

--00000000000067ffbc059bbb7bd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 9, 2020 at 7:44 PM Harry Went=
land &lt;<a href=3D"mailto:hwentlan@amd.com">hwentlan@amd.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">On 2020-01-09 10:20 a.m., Mario Kleiner wrote:<br>
&gt; If the current eDP link settings, as read from hw, provide a higher<br=
>
&gt; bandwidth than the verified_link_cap ones (=3D reported_link_cap), the=
n<br>
&gt; override verified_link_cap with current settings.<br>
&gt; <br>
&gt; These initial current eDP link settings have been set up by<br>
&gt; firmware during boot, so they should work on the eDP panel.<br>
&gt; Therefore use them if the firmware thinks they are good and<br>
&gt; they provide higher link bandwidth, e.g., to enable higher<br>
&gt; resolutions / color depths.<br>
&gt; <br>
=C2=A0</blockquote><div><br></div><div>Hi Harry, happy new year!<br></div><=
div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
This only works when taking over from UEFI, so on boot or resume from<br>
hibernate. This wouldn&#39;t work on a normal suspend/resume.<br>
<br></blockquote><div><br></div><div>See the other thread i just cc&#39;ed =
you on. Depends if dc_link_detect_helper() gets skipped/early returns or no=
t on EDP. Some if statement suggests it might get skipped on EDP + resume?<=
br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Can you check if setting link-&gt;dc-&gt;config.optimize_edp_link_rate (see=
<br>
first if statement in detect_edp_sink_caps) fixes this? I imagine we<br>
need to read the reported settings from DP_SUPPORTED_LINK_RATES and fail<br=
>
to do so.<br></blockquote><div><br></div><div>Tried that already (see other=
 mail), replacing the whole if statement with a if (true) to force reading =
DP_SUPPORTED_LINK_RATES. The whole table reads back as all-zero, and versio=
ns are DP 1.1, eDP 1.3, not 1.4+ as what seems to be required. The use the =
classic link bw stuff, but with a non-standard link bandwidth multiplier of=
 0xc, and a reported DP_MAX_LINK_RATE of 0xa, contradicting the 0xc setting=
 that the firmware sets at bootup.</div><div><br></div><div>Seems to be a v=
ery Apple thing...</div><div>-mario<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
Harry<br>
<br>
&gt; This fixes a problem found on the MacBookPro 2017 Retina panel:<br>
&gt; <br>
&gt; The panel reports 10 bpc color depth in its EDID, and the<br>
&gt; firmware chooses link settings at boot which support enough<br>
&gt; bandwidth for 10 bpc (324000 kbit/sec aka LINK_RATE_RBR2),<br>
&gt; but the DP_MAX_LINK_RATE dpcd register only reports 2.7 Gbps<br>
&gt; as possible, so verified_link_cap is only good for 2.7 Gbps<br>
&gt; and 8 bpc, not providing the full color depth of the panel.<br>
&gt; <br>
&gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gm=
ail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; Cc: Alex Deucher &lt;<a href=3D"mailto:alexander.deucher@amd.com" targ=
et=3D"_blank">alexander.deucher@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 21 +++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 21 insertions(+)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/g=
pu/drm/amd/display/dc/core/dc_link.c<br>
&gt; index 5ea4a1675259..f3acdb8fead5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
&gt; +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
&gt; @@ -819,6 +819,27 @@ static bool dc_link_detect_helper(struct dc_link =
*link,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case SIGNAL_TYPE=
_EDP: {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0detect_edp_sink_caps(link);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0read_current_link_settings_on_detect(link);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0/* If cur_link_settings provides higher bandwidth than<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * verified_link_cap, then use cur_link_settings as new<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * verified_link_cap, as it obviously works according to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * firmware boot setup.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 *<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * This has been observed on the Apple MacBookPro 2017<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * Retina panel, which boots with a link setting higher<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * than what dpcd[DP_MAX_LINK_RATE] claims as possible.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 * Overriding allows to run the panel at 10 bpc / 30 bit.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (dc_link_bandwidth_kbps(link, &amp;link-&gt;cur_link_settings) &g=
t;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0dc_link_bandwidth_kbps(link, &amp;link-&gt;verified_li=
nk_cap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DC_LOG_DETECTION_DP_CAPS(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;eDP current link setting bw %d kbp=
s &gt; verified_link_cap %d kbps. Override.&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc_link_bandwidth_kbps(link, &amp;link-&=
gt;cur_link_settings),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dc_link_bandwidth_kbps(link, &amp;link-&=
gt;verified_link_cap));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link-&gt;verified_link_cap =3D link-&gt;=
cur_link_settings;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sink_caps.transaction_type =3D DDC_TRANSACTION_TYPE_I2C_OVER_A=
UX;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0sink_caps.signal =3D SIGNAL_TYPE_EDP;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0break;<br>
&gt; <br>
</blockquote></div></div>

--00000000000067ffbc059bbb7bd3--

--===============1563301238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1563301238==--
