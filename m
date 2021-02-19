Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0099631F42F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 04:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41A66E433;
	Fri, 19 Feb 2021 03:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4384D6E433;
 Fri, 19 Feb 2021 03:22:22 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id jt13so9547632ejb.0;
 Thu, 18 Feb 2021 19:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j5kLhKRa64kwf5SXo0g7lrgWVUiYebAqTdPu7c4cx/0=;
 b=snJvB1vGPFY5FWkZT4BITlggEQXGMWVDvd8Wcx8p5jB5MpiqQflRnJx/8dAbAq0nrw
 ujyHt8AsBL0ODhj/+hcQDTnajfbk3ifDGKaC3ia38bY0ZES+RlzJHrmfQlA5bD1eHOA8
 w0qi1RM/8QbkEWCMB49cW6Vyxu6HgrAp7AwQB48Zh2xb1KuKpZ1zfLJ/L51EMce/7EKd
 BOpz8LjlE924bKcTLmsdnaR/y4n0rIAHcHgpD0F9RTONVqVm8t7+Q5mzXaQHl+WS878O
 SGCW6PNX0q71jfTeVtCgqNQG8qw7KD//U7kNwbQkV4j4hIiYRvmlwvpxiOVo6Urg/Kt9
 VAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5kLhKRa64kwf5SXo0g7lrgWVUiYebAqTdPu7c4cx/0=;
 b=qfGU20qVFPhsLD3pwt6zbPgRzpaMe+KGBWYMshcWVn1tNm2kBqaokHz0NL3D7O8VTm
 cMENBJo7J4kAjRng+2ZaFERsDoGlr5NHgbgJZvoTtiF0B2uD3CaR/JT+agzpSauY0rD5
 pZ0dlD9I5FpsjgPiyUjBpptPk6o9TABtvx94UOuPF6kE0iua4DLr3XP4J1Lt0pboP4OF
 +sgsJmlBMfKb0gg/RN6W+EVhP3PVH/Y0CjrQPSVUkH51U4/ExIFt4+dFZ5NtplGsG+AJ
 4mhHR03VpYEUWvv/J7oFVgv2/wkpiritA+4Usow75bLpRibaMYj742qVBZnaNJRCaBjX
 8/FA==
X-Gm-Message-State: AOAM533uT5v2EGrfzGlgNehmfbgSGuS9qD09Yol/13Netd6/ERnmdXEv
 VS6g0QTv97yssT6eAepXwNBPREsn79PkbtvQygs=
X-Google-Smtp-Source: ABdhPJzgb59/1ii6ZaZVPv4k7Pu4EEGX4rOmmt+tsl4kdOiKJ+EQ2AnE5/EoylxvFhYzqwxxjOSrlDMqn3l1BceleQ0=
X-Received: by 2002:a17:906:4013:: with SMTP id
 v19mr7066311ejj.5.1613704940924; 
 Thu, 18 Feb 2021 19:22:20 -0800 (PST)
MIME-Version: 1.0
References: <20210128192413.1715802-1-matthew.d.roper@intel.com>
 <20210128192413.1715802-19-matthew.d.roper@intel.com>
 <YCUjM1QwEexccF2x@intel.com>
In-Reply-To: <YCUjM1QwEexccF2x@intel.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 19 Feb 2021 04:22:09 +0100
Message-ID: <CAEsyxyh9CTJvbMCoD5pOZMfT5fgLc7xjJqk_vm64TNmK71sjNA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 18/18] drm/i915/display13: Enabling dithering
 after the CC1 pipe
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Nischal Varide <nischal.varide@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0535643410=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0535643410==
Content-Type: multipart/alternative; boundary="000000000000c6b07805bba7f5f0"

--000000000000c6b07805bba7f5f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 1:29 PM Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linu=
x.intel.com>
wrote:

> On Thu, Jan 28, 2021 at 11:24:13AM -0800, Matt Roper wrote:
> > From: Nischal Varide <nischal.varide@intel.com>
> >
> > If the panel is 12bpc then Dithering is not enabled in the Legacy
> > dithering block , instead its Enabled after the C1 CC1 pipe post
> > color space conversion.For a 6bpc pannel Dithering is enabled in
> > Legacy block.
>
> Dithering is probably going to require a whole uapi bikeshed.
> Not sure we can just enable it unilaterally.
>
> Ccing dri-devel, and Mario who had issues with dithering in the
> past...
>
> Thanks for the cc Ville!

The problem with dithering on Intel is that various tested Intel gpu's
(Ironlake, IvyBridge, Haswell, Skylake iirc.) are dithering when they
shouldn't. If one has a standard 8 bpc framebuffer feeding into a standard
(legacy) 256 slots, 8 bit wide lut which was loaded with an identity
mapping, feeding into a standard 8 bpc video output (DVI/HDMI/DP), the
expected result is that pixels rendered into the framebuffer show up
unmodified at the video output. What happens instead is that some dithering
is needlessly applied. This is bad for various neuroscience/medical
research equipment that requires pixels to pass unmodified in a pure 8 bpc
configuration, e.g., because some digital info is color-encoded in-band in
the rendered image to control research hardware, a la "if rgb pixel (123,
12, 23) is detected in the digital video stream, emit some trigger signal,
or timestamp that moment with a hw clock, or start or stop some scientific
recording equipment". Also there exist specialized visual stimulators to
drive special displays with more than 12 bpc, e.g., 16 bpc, and so they
encode the 8MSB of 16 bpc color values in pixels in even columns, and the
8LSB in the odd columns of the framebuffer. Unexpected dithering makes such
equipment completely unusable. By now I must have spent months of my life,
just trying to deal with dithering induced problems on different gpu's due
to hw quirks or bugs somewhere in the graphics stack.

Atm. the intel kms driver disables dithering for anything with >=3D 8 bpc a=
s
a fix for this harmful hardware quirk.

Ideally we'd have uapi that makes dithering controllable per connector
(on/off/auto, selectable depth), also in a way that those controls are
exposed as RandR output properties, easily controllable by X clients. And
some safe default in case the client can't access the properties (like I'd
expect to happen with the dozens of Wayland compositors under the sun).
Various drivers had this over time, e.g., AMD classic kms path (if i don't
misremember) and nouveau, but some of it also got lost in the new atomic
kms variants, and Intel never exposed this.

Or maybe some method that checks the values actually stored in the hw
lut's, CTM etc. and if the values suggest no dithering should be needed,
disable the dithering. E.g., if output depth is 8 bpc, one only needs
dithering if the slots in the final active hw lut do have any meaningful
values in the lower bits below the top 8 MSB, ie. if the content is
actually > 8 bpc net bit depth.

-mario

>
> > Cc: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Nischal Varide <nischal.varide@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c   | 16 ++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_display.c |  9 ++++++++-
> >  drivers/gpu/drm/i915/i915_reg.h              |  3 ++-
> >  3 files changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> > index ff7dcb7088bf..9a0572bbc5db 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -1604,6 +1604,20 @@ static u32 icl_csc_mode(const struct
> intel_crtc_state *crtc_state)
> >       return csc_mode;
> >  }
> >
> > +static u32 dither_after_cc1_12bpc(const struct intel_crtc_state
> *crtc_state)
> > +{
> > +     u32 gamma_mode =3D crtc_state->gamma_mode;
> > +     struct drm_i915_private *i915 =3D
> to_i915(crtc_state->uapi.crtc->dev);
> > +
> > +     if (HAS_DISPLAY13(i915)) {
> > +             if (!crtc_state->dither_force_disable &&
> > +                 (crtc_state->pipe_bpp =3D=3D 36))
> > +                     gamma_mode |=3D GAMMA_MODE_DITHER_AFTER_CC1;
> > +     }
> > +
> > +     return gamma_mode;
> > +}
> > +
> >  static int icl_color_check(struct intel_crtc_state *crtc_state)
> >  {
> >       int ret;
> > @@ -1614,6 +1628,8 @@ static int icl_color_check(struct intel_crtc_stat=
e
> *crtc_state)
> >
> >       crtc_state->gamma_mode =3D icl_gamma_mode(crtc_state);
> >
> > +     crtc_state->gamma_mode =3D dither_after_cc1_12bpc(crtc_state);
> > +
> >       crtc_state->csc_mode =3D icl_csc_mode(crtc_state);
> >
> >       crtc_state->preload_luts =3D intel_can_preload_luts(crtc_state);
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> b/drivers/gpu/drm/i915/display/intel_display.c
> > index 4dc4b1be0809..e3dbcd956fc6 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -8098,9 +8098,15 @@ static void bdw_set_pipemisc(const struct
> intel_crtc_state *crtc_state)
> >               break;
> >       }
> >
> > -     if (crtc_state->dither)
> > +     /*
> > +      * If 12bpc panel then, Enables dithering after the CC1 pipe
> > +      * post color space conversion and not here
> > +      */
> > +
> > +     if (crtc_state->dither && (crtc_state->pipe_bpp !=3D 36))
> >               val |=3D PIPEMISC_DITHER_ENABLE | PIPEMISC_DITHER_TYPE_SP=
;
> >
> > +
> >       if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420=
 ||
> >           crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444=
)
> >               val |=3D PIPEMISC_OUTPUT_COLORSPACE_YUV;
> > @@ -10760,6 +10766,7 @@ intel_modeset_pipe_config(struct
> intel_atomic_state *state,
> >        */
> >       pipe_config->dither =3D (pipe_config->pipe_bpp =3D=3D 6*3) &&
> >               !pipe_config->dither_force_disable;
> > +
> >       drm_dbg_kms(&i915->drm,
> >                   "hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
> >                   base_bpp, pipe_config->pipe_bpp, pipe_config->dither)=
;
> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
> b/drivers/gpu/drm/i915/i915_reg.h
> > index 128b835c0adb..27f25214a839 100644
> > --- a/drivers/gpu/drm/i915/i915_reg.h
> > +++ b/drivers/gpu/drm/i915/i915_reg.h
> > @@ -6132,7 +6132,7 @@ enum {
> >  #define   PIPEMISC_DITHER_8_BPC              (0 << 5)
> >  #define   PIPEMISC_DITHER_10_BPC     (1 << 5)
> >  #define   PIPEMISC_DITHER_6_BPC              (2 << 5)
> > -#define   PIPEMISC_DITHER_12_BPC     (3 << 5)
> > +#define   PIPEMISC_DITHER_12_BPC     (4 << 5)
> >  #define   PIPEMISC_DITHER_ENABLE     (1 << 4)
> >  #define   PIPEMISC_DITHER_TYPE_MASK  (3 << 2)
> >  #define   PIPEMISC_DITHER_TYPE_SP    (0 << 2)
> > @@ -7668,6 +7668,7 @@ enum {
> >  #define  GAMMA_MODE_MODE_12BIT       (2 << 0)
> >  #define  GAMMA_MODE_MODE_SPLIT       (3 << 0) /* ivb-bdw */
> >  #define  GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED       (3 << 0) /* icl +
> */
> > +#define  GAMMA_MODE_DITHER_AFTER_CC1 (1 << 26)
> >
> >  /* DMC/CSR */
> >  #define CSR_PROGRAM(i)               _MMIO(0x80000 + (i) * 4)
> > --
> > 2.25.4
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel
>

--000000000000c6b07805bba7f5f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 11, 2021 at 1:=
29 PM Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjala@linux.int=
el.com">ville.syrjala@linux.intel.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On Thu, Jan 28, 2021 at 11:24:13AM -08=
00, Matt Roper wrote:<br>
&gt; From: Nischal Varide &lt;<a href=3D"mailto:nischal.varide@intel.com" t=
arget=3D"_blank">nischal.varide@intel.com</a>&gt;<br>
&gt; <br>
&gt; If the panel is 12bpc then Dithering is not enabled in the Legacy<br>
&gt; dithering block , instead its Enabled after the C1 CC1 pipe post<br>
&gt; color space conversion.For a 6bpc pannel Dithering is enabled in<br>
&gt; Legacy block.<br>
<br>
Dithering is probably going to require a whole uapi bikeshed.<br>
Not sure we can just enable it unilaterally.<br>
<br>
Ccing dri-devel, and Mario who had issues with dithering in the<br>
past...<br>
<br></blockquote><div>Thanks for the cc Ville!</div><div><br></div><div><di=
v>The problem with dithering on Intel is that various tested Intel gpu&#39;=
s (Ironlake, IvyBridge, Haswell, Skylake iirc.) are dithering when they sho=
uldn&#39;t. If one has a standard 8 bpc framebuffer feeding into a standard=
 (legacy) 256 slots, 8 bit wide lut which was loaded with an identity mappi=
ng, feeding into a standard 8 bpc video output (DVI/HDMI/DP), the expected =
result is that pixels rendered into the framebuffer show up unmodified at t=
he video output. What happens instead is that some dithering is needlessly =
applied. This is bad for various neuroscience/medical research equipment th=
at requires pixels to pass unmodified in a pure 8 bpc configuration, e.g., =
because some digital info is color-encoded in-band in the rendered image to=
 control research hardware, a la &quot;if rgb pixel (123, 12, 23) is detect=
ed in the digital video stream, emit some trigger signal, or timestamp that=
 moment with a hw clock, or start or stop some scientific recording equipme=
nt&quot;. Also there exist specialized visual stimulators to drive special =
displays with more than 12 bpc, e.g., 16 bpc, and so they encode the 8MSB o=
f 16 bpc color values in pixels in even columns, and the 8LSB in the odd co=
lumns of the framebuffer. Unexpected dithering makes such equipment complet=
ely unusable. By now I must have spent months of my life, just trying to de=
al with dithering induced problems on different gpu&#39;s due to hw quirks =
or bugs somewhere in the graphics stack.<br></div><div><br></div><div>Atm. =
the intel kms driver disables dithering for anything with &gt;=3D 8 bpc as =
a fix for this harmful hardware quirk.</div><div><br></div><div> Ideally we=
&#39;d have uapi that makes dithering controllable per connector (on/off/au=
to, selectable depth), also in a way that those controls are exposed as Ran=
dR output properties, easily controllable by X clients. And some safe defau=
lt in case the client can&#39;t access the properties (like I&#39;d expect =
to happen with the dozens of Wayland compositors under the sun). Various dr=
ivers had this over time, e.g., AMD classic kms path (if i don&#39;t misrem=
ember) and nouveau, but some of it also got lost in the new atomic kms vari=
ants, and Intel never exposed this.</div><div><br></div>Or maybe some metho=
d that checks the values actually stored in the hw lut&#39;s, CTM etc. and =
if the values suggest no dithering should be needed, disable the dithering.=
 E.g., if output depth is 8 bpc, one only needs dithering if the slots in t=
he final active hw lut do have any meaningful values in the lower bits belo=
w the top 8 MSB, ie. if the content is actually &gt; 8 bpc net bit depth.</=
div><div><br></div><div>-mario</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; <br>
&gt; Cc: Uma Shankar &lt;<a href=3D"mailto:uma.shankar@intel.com" target=3D=
"_blank">uma.shankar@intel.com</a>&gt;<br>
&gt; Signed-off-by: Nischal Varide &lt;<a href=3D"mailto:nischal.varide@int=
el.com" target=3D"_blank">nischal.varide@intel.com</a>&gt;<br>
&gt; Signed-off-by: Bhanuprakash Modem &lt;<a href=3D"mailto:bhanuprakash.m=
odem@intel.com" target=3D"_blank">bhanuprakash.modem@intel.com</a>&gt;<br>
&gt; Signed-off-by: Matt Roper &lt;<a href=3D"mailto:matthew.d.roper@intel.=
com" target=3D"_blank">matthew.d.roper@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_color.c=C2=A0 =C2=A0| 16 ++++=
++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/i915/display/intel_display.c |=C2=A0 9 ++++++++-=
<br>
&gt;=C2=A0 drivers/gpu/drm/i915/i915_reg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
&gt;=C2=A0 3 files changed, 26 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/=
drm/i915/display/intel_color.c<br>
&gt; index ff7dcb7088bf..9a0572bbc5db 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_color.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_color.c<br>
&gt; @@ -1604,6 +1604,20 @@ static u32 icl_csc_mode(const struct intel_crtc=
_state *crtc_state)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return csc_mode;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static u32 dither_after_cc1_12bpc(const struct intel_crtc_state *crtc=
_state)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 gamma_mode =3D crtc_state-&gt;gamma_mode;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_i915_private *i915 =3D to_i915(crtc_st=
ate-&gt;uapi.crtc-&gt;dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (HAS_DISPLAY13(i915)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!crtc_state-&gt;d=
ither_force_disable &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(crtc_s=
tate-&gt;pipe_bpp =3D=3D 36))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0gamma_mode |=3D GAMMA_MODE_DITHER_AFTER_CC1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return gamma_mode;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int icl_color_check(struct intel_crtc_state *crtc_state)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; @@ -1614,6 +1628,8 @@ static int icl_color_check(struct intel_crtc_sta=
te *crtc_state)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_state-&gt;gamma_mode =3D icl_gamma_mode=
(crtc_state);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0crtc_state-&gt;gamma_mode =3D dither_after_cc1_12=
bpc(crtc_state);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_state-&gt;csc_mode =3D icl_csc_mode(crt=
c_state);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_state-&gt;preload_luts =3D intel_can_pr=
eload_luts(crtc_state);<br>
&gt; diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gp=
u/drm/i915/display/intel_display.c<br>
&gt; index 4dc4b1be0809..e3dbcd956fc6 100644<br>
&gt; --- a/drivers/gpu/drm/i915/display/intel_display.c<br>
&gt; +++ b/drivers/gpu/drm/i915/display/intel_display.c<br>
&gt; @@ -8098,9 +8098,15 @@ static void bdw_set_pipemisc(const struct intel=
_crtc_state *crtc_state)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (crtc_state-&gt;dither)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If 12bpc panel then, Enables dithering after t=
he CC1 pipe<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * post color space conversion and not here<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (crtc_state-&gt;dither &amp;&amp; (crtc_state-=
&gt;pipe_bpp !=3D 36))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D PIPEMIS=
C_DITHER_ENABLE | PIPEMISC_DITHER_TYPE_SP;<br>
&gt;=C2=A0 <br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (crtc_state-&gt;output_format =3D=3D INTE=
L_OUTPUT_FORMAT_YCBCR420 ||<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crtc_state-&gt;output_format =
=3D=3D INTEL_OUTPUT_FORMAT_YCBCR444)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0val |=3D PIPEMIS=
C_OUTPUT_COLORSPACE_YUV;<br>
&gt; @@ -10760,6 +10766,7 @@ intel_modeset_pipe_config(struct intel_atomic_=
state *state,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_config-&gt;dither =3D (pipe_config-&gt;=
pipe_bpp =3D=3D 6*3) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!pipe_config-&gt=
;dither_force_disable;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(&amp;i915-&gt;drm,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;hw max bpp: %i, pipe bpp: %i, dithering: %i\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se_bpp, pipe_config-&gt;pipe_bpp, pipe_config-&gt;dither);<br>
&gt; diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i9=
15_reg.h<br>
&gt; index 128b835c0adb..27f25214a839 100644<br>
&gt; --- a/drivers/gpu/drm/i915/i915_reg.h<br>
&gt; +++ b/drivers/gpu/drm/i915/i915_reg.h<br>
&gt; @@ -6132,7 +6132,7 @@ enum {<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0PIPEMISC_DITHER_8_BPC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0 &lt;&lt; 5)<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0PIPEMISC_DITHER_10_BPC=C2=A0 =C2=A0 =C2=A0(1=
 &lt;&lt; 5)<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0PIPEMISC_DITHER_6_BPC=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (2 &lt;&lt; 5)<br>
&gt; -#define=C2=A0 =C2=A0PIPEMISC_DITHER_12_BPC=C2=A0 =C2=A0 =C2=A0(3 &lt;=
&lt; 5)<br>
&gt; +#define=C2=A0 =C2=A0PIPEMISC_DITHER_12_BPC=C2=A0 =C2=A0 =C2=A0(4 &lt;=
&lt; 5)<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0PIPEMISC_DITHER_ENABLE=C2=A0 =C2=A0 =C2=A0(1=
 &lt;&lt; 4)<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0PIPEMISC_DITHER_TYPE_MASK=C2=A0 (3 &lt;&lt; =
2)<br>
&gt;=C2=A0 #define=C2=A0 =C2=A0PIPEMISC_DITHER_TYPE_SP=C2=A0 =C2=A0 (0 &lt;=
&lt; 2)<br>
&gt; @@ -7668,6 +7668,7 @@ enum {<br>
&gt;=C2=A0 #define=C2=A0 GAMMA_MODE_MODE_12BIT=C2=A0 =C2=A0 =C2=A0 =C2=A0(2=
 &lt;&lt; 0)<br>
&gt;=C2=A0 #define=C2=A0 GAMMA_MODE_MODE_SPLIT=C2=A0 =C2=A0 =C2=A0 =C2=A0(3=
 &lt;&lt; 0) /* ivb-bdw */<br>
&gt;=C2=A0 #define=C2=A0 GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED=C2=A0 =C2=A0=
 =C2=A0 =C2=A0(3 &lt;&lt; 0) /* icl + */<br>
&gt; +#define=C2=A0 GAMMA_MODE_DITHER_AFTER_CC1 (1 &lt;&lt; 26)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* DMC/CSR */<br>
&gt;=C2=A0 #define CSR_PROGRAM(i)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0_MMIO(0x80000 + (i) * 4)<br>
&gt; -- <br>
&gt; 2.25.4<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; Intel-gfx mailing list<br>
&gt; <a href=3D"mailto:Intel-gfx@lists.freedesktop.org" target=3D"_blank">I=
ntel-gfx@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/intel-gfx" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/intel-gfx</a><br>
<br>
-- <br>
Ville Syrj=C3=A4l=C3=A4<br>
Intel<br>
</blockquote></div></div>

--000000000000c6b07805bba7f5f0--

--===============0535643410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0535643410==--
