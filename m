Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337131F4E3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 06:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D23A36E43C;
	Fri, 19 Feb 2021 05:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8054B6E43C;
 Fri, 19 Feb 2021 05:44:44 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id p2so7604113edm.12;
 Thu, 18 Feb 2021 21:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3M7g8PXzqD5fEc/XC6jIred3VjK7nnn29ZoJzRmaMnI=;
 b=S1j5RrGgN55SRnuU0wIZxT23P4JFKh3MHp8zeFuEMcbt1kJwFu5RXMC7poQeUAPMfk
 gZVIrRqGLSyyfrVUhNyf4ro70AmTfCEfYBh7SUjQGxmQ0z+SR1UTVwL2Zjq+wXdhCz+I
 LoiR8YnvbDhuSjCtoKVo0z1dE4cIUZ6x21UshBNWlURtesKvG9MPuu/pmmNwcl25Glb3
 NrH+1dG8SO3gRpjPa/+olv4UavMcIwbeuNHsHTHhN4/k3LewBD65EGp91ah3rQjwNYZB
 QuSzN18Wlv7zD11m8LCfVWlVpbkcU8jGjq8SmPkU7AsSp3XpEf0jNBqmWJ4fPraCp61q
 Nr8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3M7g8PXzqD5fEc/XC6jIred3VjK7nnn29ZoJzRmaMnI=;
 b=tvpUp8Cv3tHTMBHu4p4E5JN+ItaAd1lOK5j8N5CIU/ZDkqWanMJsHwSJ04J1CWy3QZ
 RVdlaRtbw2fzYv+wbZCIBRWAhkvDQFa9TSB7plWHrwNbU7+HIkre9JL/o1eRCRQ09G74
 hFkxDuXkMclNZCMDrQMoa6vLbt0CMePQwThkDwDGQPPTiSKijiq6v72sn+LAHN7BrTRr
 bMRzKYL2YppSDSt61Yl4HYoaeOpm4alXzuW7iJevL2nvqKIAljORnKxwgBo4NFmga6aw
 mZXjmjIN8OI+JnosV6fEFHppW5NH5+/writzrsjAHrptLgccA7U28c2nMuit/5ct5eZ7
 ukvw==
X-Gm-Message-State: AOAM530IjtJvIY/a3jChAXd2KEenna7R1a64ZXYECYpSIyiVFxtDMn3S
 R1g+0f6FiFOEtmIPVgh1n6+zZ6O4kKlFAhZBtdrE4qO+7/g=
X-Google-Smtp-Source: ABdhPJzdGh7tSOgUYzbDZ37RMNDFJXB4uz1jA+Lw00GC6Izgk3BkRKW3CrUyq54A/4z2nTFLTmmCtpM3rEHyj9qfZ1A=
X-Received: by 2002:a05:6402:1bc7:: with SMTP id
 ch7mr7717288edb.84.1613713483071; 
 Thu, 18 Feb 2021 21:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20210128192413.1715802-1-matthew.d.roper@intel.com>
 <20210128192413.1715802-19-matthew.d.roper@intel.com>
 <YCUjM1QwEexccF2x@intel.com>
 <CAEsyxyh9CTJvbMCoD5pOZMfT5fgLc7xjJqk_vm64TNmK71sjNA@mail.gmail.com>
In-Reply-To: <CAEsyxyh9CTJvbMCoD5pOZMfT5fgLc7xjJqk_vm64TNmK71sjNA@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Fri, 19 Feb 2021 06:44:31 +0100
Message-ID: <CAEsyxyhGXjWJU6RDeKogXLpNZ0ziZpbgEBs6UDBV33ie=osXvQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1574099819=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1574099819==
Content-Type: multipart/alternative; boundary="000000000000ed81e305bba9f2fc"

--000000000000ed81e305bba9f2fc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 4:22 AM Mario Kleiner <mario.kleiner.de@gmail.com>
wrote:

>
>
> On Thu, Feb 11, 2021 at 1:29 PM Ville Syrj=C3=A4l=C3=A4 <
> ville.syrjala@linux.intel.com> wrote:
>
>> On Thu, Jan 28, 2021 at 11:24:13AM -0800, Matt Roper wrote:
>> > From: Nischal Varide <nischal.varide@intel.com>
>> >
>> > If the panel is 12bpc then Dithering is not enabled in the Legacy
>> > dithering block , instead its Enabled after the C1 CC1 pipe post
>> > color space conversion.For a 6bpc pannel Dithering is enabled in
>> > Legacy block.
>>
>> Dithering is probably going to require a whole uapi bikeshed.
>> Not sure we can just enable it unilaterally.
>>
>> Ccing dri-devel, and Mario who had issues with dithering in the
>> past...
>>
>> Thanks for the cc Ville!
>
> The problem with dithering on Intel is that various tested Intel gpu's
> (Ironlake, IvyBridge, Haswell, Skylake iirc.) are dithering when they
> shouldn't. If one has a standard 8 bpc framebuffer feeding into a standar=
d
> (legacy) 256 slots, 8 bit wide lut which was loaded with an identity
> mapping, feeding into a standard 8 bpc video output (DVI/HDMI/DP), the
> expected result is that pixels rendered into the framebuffer show up
> unmodified at the video output. What happens instead is that some ditheri=
ng
> is needlessly applied. This is bad for various neuroscience/medical
> research equipment that requires pixels to pass unmodified in a pure 8 bp=
c
> configuration, e.g., because some digital info is color-encoded in-band i=
n
> the rendered image to control research hardware, a la "if rgb pixel (123,
> 12, 23) is detected in the digital video stream, emit some trigger signal=
,
> or timestamp that moment with a hw clock, or start or stop some scientifi=
c
> recording equipment". Also there exist specialized visual stimulators to
> drive special displays with more than 12 bpc, e.g., 16 bpc, and so they
> encode the 8MSB of 16 bpc color values in pixels in even columns, and the
> 8LSB in the odd columns of the framebuffer. Unexpected dithering makes su=
ch
> equipment completely unusable. By now I must have spent months of my life=
,
> just trying to deal with dithering induced problems on different gpu's du=
e
> to hw quirks or bugs somewhere in the graphics stack.
>
> Atm. the intel kms driver disables dithering for anything with >=3D 8 bpc=
 as
> a fix for this harmful hardware quirk.
>
> Ideally we'd have uapi that makes dithering controllable per connector
> (on/off/auto, selectable depth), also in a way that those controls are
> exposed as RandR output properties, easily controllable by X clients. And
> some safe default in case the client can't access the properties (like I'=
d
> expect to happen with the dozens of Wayland compositors under the sun).
> Various drivers had this over time, e.g., AMD classic kms path (if i don'=
t
> misremember) and nouveau, but some of it also got lost in the new atomic
> kms variants, and Intel never exposed this.
>
> Or maybe some method that checks the values actually stored in the hw
> lut's, CTM etc. and if the values suggest no dithering should be needed,
> disable the dithering. E.g., if output depth is 8 bpc, one only needs
> dithering if the slots in the final active hw lut do have any meaningful
> values in the lower bits below the top 8 MSB, ie. if the content is
> actually > 8 bpc net bit depth.
>
> -mario
>
>
One cup of coffee later... I think this specific patch should be ok wrt. my
use cases. The majority of the above mentioned research devices are
single/dual-link DVI receivers, ie. 8 bpc video sinks. I'm only aware of
one recent device that has a DisplayPort receiver who could act as a > 8
bpc video sink. See the following link for advanced examples of such
devices: https://vpixx.com/our-products/video-i-o-hub/

I cannot think of a use case that would require more than 8 bits for inband
signalling given that that was good enough for the last 20 years, or for
encoding very high color precision content -- the 16 bpc precision that one
can get out of the current even/odd pixel =3D 8 MSB + 8 LSB encoding scheme
should be enough for the foreseeable future. Therefore dithering shouldn't
pose a problem if it leaves the 8 MSB of each pixel color component intact,
and spatial dithering as employed here usually only touches the least
significant bit (or maybe the 2 LSB's?).

As this patch only enables dithering on 12 bpc video sinks, if i understand
pipe_bpp correctly, it could only "corrupt" one bit and leave at least the
10-11 MSB's intact, right?

pipe_bpp =3D=3D 24 is the case that would really hurt a lot of researchers =
if
dithering would be enabled without providing good uapi or other mechanisms
to prevent it.

So:

Acked-by: Mario Kleiner <mario.kleiner.de@gmail.com>

One suggestion: It would be good to also add a bit of drm_dbg_kms() logging
to the new code-patch, so that this 12 bpc dithering enable on
HAS_DISPLAY13 hw also shows up in the logs, not just the standard 6 bpc
enable. Helped a lot in debugging dithering issues if there was a reliable
trace in the logs of what was active when. One suggestion for that inside
your patch below...

>
>> > Cc: Uma Shankar <uma.shankar@intel.com>
>> > Signed-off-by: Nischal Varide <nischal.varide@intel.com>
>> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> > ---
>> >  drivers/gpu/drm/i915/display/intel_color.c   | 16 ++++++++++++++++
>> >  drivers/gpu/drm/i915/display/intel_display.c |  9 ++++++++-
>> >  drivers/gpu/drm/i915/i915_reg.h              |  3 ++-
>> >  3 files changed, 26 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>> b/drivers/gpu/drm/i915/display/intel_color.c
>> > index ff7dcb7088bf..9a0572bbc5db 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_color.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> > @@ -1604,6 +1604,20 @@ static u32 icl_csc_mode(const struct
>> intel_crtc_state *crtc_state)
>> >       return csc_mode;
>> >  }
>> >
>> > +static u32 dither_after_cc1_12bpc(const struct intel_crtc_state
>> *crtc_state)
>> > +{
>> > +     u32 gamma_mode =3D crtc_state->gamma_mode;
>> > +     struct drm_i915_private *i915 =3D
>> to_i915(crtc_state->uapi.crtc->dev);
>> > +
>> > +     if (HAS_DISPLAY13(i915)) {
>> > +             if (!crtc_state->dither_force_disable &&
>>
>
Replace  !crtc_state->dither_force_disable by crtc_state->dither

> > +                 (crtc_state->pipe_bpp =3D=3D 36))
>> > +                     gamma_mode |=3D GAMMA_MODE_DITHER_AFTER_CC1;
>> > +     }
>> > +
>> > +     return gamma_mode;
>> > +}
>> > +
>> >  static int icl_color_check(struct intel_crtc_state *crtc_state)
>> >  {
>> >       int ret;
>> > @@ -1614,6 +1628,8 @@ static int icl_color_check(struct
>> intel_crtc_state *crtc_state)
>> >
>> >       crtc_state->gamma_mode =3D icl_gamma_mode(crtc_state);
>> >
>> > +     crtc_state->gamma_mode =3D dither_after_cc1_12bpc(crtc_state);
>> > +
>> >       crtc_state->csc_mode =3D icl_csc_mode(crtc_state);
>> >
>> >       crtc_state->preload_luts =3D intel_can_preload_luts(crtc_state);
>> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
>> b/drivers/gpu/drm/i915/display/intel_display.c
>> > index 4dc4b1be0809..e3dbcd956fc6 100644
>> > --- a/drivers/gpu/drm/i915/display/intel_display.c
>> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> > @@ -8098,9 +8098,15 @@ static void bdw_set_pipemisc(const struct
>> intel_crtc_state *crtc_state)
>> >               break;
>> >       }
>> >
>> > -     if (crtc_state->dither)
>> > +     /*
>> > +      * If 12bpc panel then, Enables dithering after the CC1 pipe
>> > +      * post color space conversion and not here
>> > +      */
>> > +
>> > +     if (crtc_state->dither && (crtc_state->pipe_bpp !=3D 36))
>> >               val |=3D PIPEMISC_DITHER_ENABLE | PIPEMISC_DITHER_TYPE_S=
P;
>> >
>> > +
>> >       if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR42=
0 ||
>> >           crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR44=
4)
>> >               val |=3D PIPEMISC_OUTPUT_COLORSPACE_YUV;
>> > @@ -10760,6 +10766,7 @@ intel_modeset_pipe_config(struct
>> intel_atomic_state *state,
>> >        */
>>
>
Instead of...


> >       pipe_config->dither =3D (pipe_config->pipe_bpp =3D=3D 6*3) &&
>> >               !pipe_config->dither_force_disable;
>> > +
>>
>
... use ...

>       pipe_config->dither =3D ((pipe_config->pipe_bpp =3D=3D 6*3) ||
>> (HAS_DISPLAY13(i915) && pipe_config->pipe_bpp =3D=3D 12*3)) &&
>> !pipe_config->dither_force_disable;
>>
>
... so that the dither enable/disable decision and logging happens in one
location in the code?

>       drm_dbg_kms(&i915->drm,
>> >                   "hw max bpp: %i, pipe bpp: %i, dithering: %i\n",
>> >                   base_bpp, pipe_config->pipe_bpp, pipe_config->dither=
);
>>
>
Thanks,
-mario




> > diff --git a/drivers/gpu/drm/i915/i915_reg.h
>> b/drivers/gpu/drm/i915/i915_reg.h
>> > index 128b835c0adb..27f25214a839 100644
>> > --- a/drivers/gpu/drm/i915/i915_reg.h
>> > +++ b/drivers/gpu/drm/i915/i915_reg.h
>> > @@ -6132,7 +6132,7 @@ enum {
>> >  #define   PIPEMISC_DITHER_8_BPC              (0 << 5)
>> >  #define   PIPEMISC_DITHER_10_BPC     (1 << 5)
>> >  #define   PIPEMISC_DITHER_6_BPC              (2 << 5)
>> > -#define   PIPEMISC_DITHER_12_BPC     (3 << 5)
>> > +#define   PIPEMISC_DITHER_12_BPC     (4 << 5)
>> >  #define   PIPEMISC_DITHER_ENABLE     (1 << 4)
>> >  #define   PIPEMISC_DITHER_TYPE_MASK  (3 << 2)
>> >  #define   PIPEMISC_DITHER_TYPE_SP    (0 << 2)
>> > @@ -7668,6 +7668,7 @@ enum {
>> >  #define  GAMMA_MODE_MODE_12BIT       (2 << 0)
>> >  #define  GAMMA_MODE_MODE_SPLIT       (3 << 0) /* ivb-bdw */
>> >  #define  GAMMA_MODE_MODE_12BIT_MULTI_SEGMENTED       (3 << 0) /* icl =
+
>> */
>> > +#define  GAMMA_MODE_DITHER_AFTER_CC1 (1 << 26)
>> >
>> >  /* DMC/CSR */
>> >  #define CSR_PROGRAM(i)               _MMIO(0x80000 + (i) * 4)
>> > --
>> > 2.25.4
>> >
>> > _______________________________________________
>> > Intel-gfx mailing list
>> > Intel-gfx@lists.freedesktop.org
>> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>>
>> --
>> Ville Syrj=C3=A4l=C3=A4
>> Intel
>>
>

--000000000000ed81e305bba9f2fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 4:22 AM Mario=
 Kleiner &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com">mario.kleiner.de=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 11,=
 2021 at 1:29 PM Ville Syrj=C3=A4l=C3=A4 &lt;<a href=3D"mailto:ville.syrjal=
a@linux.intel.com" target=3D"_blank">ville.syrjala@linux.intel.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, J=
an 28, 2021 at 11:24:13AM -0800, Matt Roper wrote:<br>
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
div><div><br></div><div>-mario</div><div><br></div></div></div></blockquote=
><div><br></div><div>One cup of coffee later... I think this specific patch=
 should be ok wrt. my use cases. The majority of the above mentioned resear=
ch devices are single/dual-link DVI receivers, ie. 8 bpc video sinks. I&#39=
;m only aware of one recent device that has a DisplayPort receiver who coul=
d act as a &gt; 8 bpc video sink. See the following link for advanced examp=
les of such devices: <a href=3D"https://vpixx.com/our-products/video-i-o-hu=
b/">https://vpixx.com/our-products/video-i-o-hub/</a></div><div><br></div><=
div>I cannot think of a use case that would require more than 8 bits for in=
band signalling given that that was good enough for the last 20 years, or f=
or encoding very high color precision content -- the 16 bpc precision that =
one can get out of the current even/odd pixel =3D 8 MSB + 8 LSB encoding sc=
heme should be enough for the foreseeable future. Therefore dithering shoul=
dn&#39;t pose a problem if it leaves the 8 MSB of each pixel color componen=
t intact, and spatial dithering as employed here usually only touches the l=
east significant bit (or maybe the 2 LSB&#39;s?).</div><div><br></div><div>=
As this patch only enables dithering on 12 bpc video sinks, if i understand=
 pipe_bpp correctly, it could only &quot;corrupt&quot; one bit and leave at=
 least the 10-11 MSB&#39;s intact, right?</div><div><br></div><div>pipe_bpp=
 =3D=3D 24 is the case that would really hurt a lot of researchers if dithe=
ring would be enabled without providing good uapi or other mechanisms to pr=
event it.</div><div><br></div><div>So:</div><div><br></div><div>Acked-by: <=
span style=3D"font-family:arial,sans-serif"><span style=3D"color:rgb(0,0,0)=
;background-color:rgb(255,255,255)">Mario Kleiner &lt;<a href=3D"mailto:mar=
io.kleiner.de@gmail.com">mario.kleiner.de@gmail.com</a>&gt;</span><br></spa=
n></div><div><br></div><div>One suggestion: It would be good to also add a =
bit of drm_dbg_kms() logging to the new code-patch, so that this 12 bpc dit=
hering enable on HAS_DISPLAY13 hw also shows up in the logs, not just the s=
tandard 6 bpc enable. Helped a lot in debugging dithering issues if there w=
as a reliable trace in the logs of what was active when. One suggestion for=
 that inside your patch below...<br></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><div></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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
ither_force_disable &amp;&amp;<br></blockquote></div></div></blockquote><di=
v><br></div><div>Replace=C2=A0 !crtc_state-&gt;dither_force_disable by crtc=
_state-&gt;dither</div><div></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
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
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br></blockquote></div></div></blockquote=
><div><br></div><div>Instead of...<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_config-&gt;dither =3D (pipe_config-&gt;=
pipe_bpp =3D=3D 6*3) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!pipe_config-&gt=
;dither_force_disable;<br>
&gt; +<br></blockquote></div></div></blockquote><div><br></div><div>... use=
 ...</div><div><br></div><div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0pipe_config-&gt;dither =3D ((pipe_config-&gt=
;pipe_bpp =3D=3D 6*3) || (HAS_DISPLAY13(i915) &amp;&amp; pipe_config-&gt;pi=
pe_bpp =3D=3D 12*3)) &amp;&amp; !pipe_config-&gt;dither_force_disable;<br>
</blockquote></div></div></blockquote></div><div></div><div><br></div><div>=
... so that the dither enable/disable decision and logging happens in one l=
ocation in the code?</div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0drm_dbg_kms(&amp;i915-&gt;drm,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&q=
uot;hw max bpp: %i, pipe bpp: %i, dithering: %i\n&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ba=
se_bpp, pipe_config-&gt;pipe_bpp, pipe_config-&gt;dither);<br></blockquote>=
</div></div></blockquote><div><br></div><div>Thanks,</div><div>-mario<br></=
div><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
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
</blockquote></div></div>

--000000000000ed81e305bba9f2fc--

--===============1574099819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1574099819==--
