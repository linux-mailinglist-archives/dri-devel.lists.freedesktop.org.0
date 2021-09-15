Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B8340C6ED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 16:01:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DDC89F49;
	Wed, 15 Sep 2021 14:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC29289F19;
 Wed, 15 Sep 2021 14:01:42 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s3so1252694ljp.11;
 Wed, 15 Sep 2021 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=ksoJuWg/fk7ef/bur92GgeDexmwQH2FGwQ3npbLQ7G8=;
 b=iM2X89NhKMBoolwQ9YVUtMQ5MA0o3Emx5dIiA7TUe8Dk8WV6yUkikPpe2qvF38yYPo
 6dRR7UuEXrVNrHdxOLWbh6bps/OLTLaByH2DQudMAu85le/6vYSO4YAnjNktFAOvsacl
 nbl6M0Z1z2a12xEBAGmqH54sw507W24+dfFwK/lbZeMzBRUN1uCo9azBoNlRgjMggDWg
 RwaMnYTam4G4qXrTyu/+WH3A7WunhLOT5TUML38SnxDSUIJYTRhGYfFEc/ogSPAin9rj
 snOdAAC3RwfpV6VzzPyudwez7wIqgIg4Uf9Ele0u9yLnWE0ZeDAGL5XzfGbUpYc+L2mp
 Mbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=ksoJuWg/fk7ef/bur92GgeDexmwQH2FGwQ3npbLQ7G8=;
 b=26vWOv7q8K2msdY+z+oIzBNWZap/LSx2CNqvmS7vjz0mpkB7+Cakq0lW1RPvCoYagW
 xWgTyml+byLLNJjOAFH6dEA9pk/gaNEXSRnMXwlyEW8KSlkHMDFXhd5A3V6vmDDwIWOh
 AjmrV8pZJF6Pk2FB0b2YzGzxUlpdDRw2IiREigxpV/2X+LC0yVFYPAxTDXsQcUXscvJ7
 aylhHOfPcXrrobcUq0+3qY5uqRykEaM+m6LZOT58R4ucuU/jhEJDn9S9evxzKuhGx2tE
 l9VZQIFsjRR2aco5A0HCz7cLzxeG46XHwNfJn2pt+IErpDzth7tDN/xz+9dxBNw3tvHR
 QpLg==
X-Gm-Message-State: AOAM5339X46TG55EDBMueMLHX2kvdndsMEOEYqNtMT1FJQ1Jws8osiyY
 DVhR9qYWfF3tz3i5qwPBXHQ=
X-Google-Smtp-Source: ABdhPJwM4VFBAf5a5iLciWTuHNIWOE50aLCIbrCvDWmP/94rg8XV8FNmTdcnc6sebxaFOwETyTVgUw==
X-Received: by 2002:a05:651c:1546:: with SMTP id y6mr46135ljp.53.1631714498312; 
 Wed, 15 Sep 2021 07:01:38 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id b21sm1399492lfi.104.2021.09.15.07.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 07:01:37 -0700 (PDT)
Date: Wed, 15 Sep 2021 17:01:27 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <sebastian@sebastianwick.net>, <mcasas@google.com>, <jshargo@google.com>,
 <Shashank.Sharma@amd.com>, <Deepak.Sharma@amd.com>, <Shirish.S@amd.com>,
 <Vitaly.Prosyak@amd.com>, <aric.cyr@amd.com>, <Bhawanpreet.Lakha@amd.com>,
 <Krunoslav.Kovac@amd.com>, <hersenxs.wu@amd.com>,
 <Nicholas.Kazlauskas@amd.com>, <laurentiu.palcu@oss.nxp.com>,
 <ville.syrjala@linux.intel.com>, jeremy@jcline.org, Brian Starkey
 <brian.starkey@arm.com>
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210915170127.31377385@eldfell>
In-Reply-To: <20210730204134.21769-2-harry.wentland@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HVqWF4N8u0bunALt2770t4M";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/HVqWF4N8u0bunALt2770t4M
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 30 Jul 2021 16:41:29 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> Use the new DRM RFC doc section to capture the RFC previously only
> described in the cover letter at
> https://patchwork.freedesktop.org/series/89506/
>=20
> v3:
>  * Add sections on single-plane and multi-plane HDR
>  * Describe approach to define HW details vs approach to define SW intent=
ions
>  * Link Jeremy Cline's excellent HDR summaries
>  * Outline intention behind overly verbose doc
>  * Describe FP16 use-case
>  * Clean up links
>=20
> v2: create this doc
>=20
> v1: n/a
>=20
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>

Hi Harry,

I finally managed to go through this, comments below. Excellent to have
pictures included. I wrote this reply over several days, sorry if it's
not quite coherent.


> ---
>  Documentation/gpu/rfc/color_intentions.drawio |   1 +
>  Documentation/gpu/rfc/color_intentions.svg    |   3 +
>  Documentation/gpu/rfc/colorpipe               |   1 +
>  Documentation/gpu/rfc/colorpipe.svg           |   3 +
>  Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 ++++++++++++++++++
>  Documentation/gpu/rfc/index.rst               |   1 +
>  6 files changed, 589 insertions(+)
>  create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
>  create mode 100644 Documentation/gpu/rfc/color_intentions.svg
>  create mode 100644 Documentation/gpu/rfc/colorpipe
>  create mode 100644 Documentation/gpu/rfc/colorpipe.svg
>  create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst

...

> diff --git a/Documentation/gpu/rfc/hdr-wide-gamut.rst b/Documentation/gpu=
/rfc/hdr-wide-gamut.rst
> new file mode 100644
> index 000000000000..e463670191ab
> --- /dev/null
> +++ b/Documentation/gpu/rfc/hdr-wide-gamut.rst
> @@ -0,0 +1,580 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +HDR & Wide Color Gamut Support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +.. role:: wy-text-strike
> +
> +ToDo
> +=3D=3D=3D=3D
> +
> +* :wy-text-strike:`Reformat as RST kerneldoc` - done
> +* :wy-text-strike:`Don't use color_encoding for color_space definitions`=
 - done
> +* :wy-text-strike:`Update SDR luminance description and reasoning` - done
> +* :wy-text-strike:`Clarify 3D LUT required for some color space transfor=
mations` - done
> +* :wy-text-strike:`Highlight need for named color space and EOTF definit=
ions` - done
> +* :wy-text-strike:`Define transfer function API` - done
> +* :wy-text-strike:`Draft upstream plan` - done
> +* :wy-text-strike:`Reference to wayland plan` - done
> +* Reference to Chrome plans
> +* Sketch view of HW pipeline for couple of HW implementations
> +
> +
> +Upstream Plan
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +* Reach consensus on DRM/KMS API
> +* Implement support in amdgpu
> +* Implement IGT tests
> +* Add API support to Weston, ChromiumOS, or other canonical open-source =
project interested in HDR
> +* Merge user-space
> +* Merge kernel patches

The order is: review acceptance of userspace but don't merge, merge
kernel, merge userspace.

> +
> +
> +History
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +v3:
> +
> +* Add sections on single-plane and multi-plane HDR
> +* Describe approach to define HW details vs approach to define SW intent=
ions
> +* Link Jeremy Cline's excellent HDR summaries
> +* Outline intention behind overly verbose doc
> +* Describe FP16 use-case
> +* Clean up links
> +
> +v2: create this doc
> +
> +v1: n/a
> +
> +
> +Introduction
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +We are looking to enable HDR support for a couple of single-plane and
> +multi-plane scenarios. To do this effectively we recommend new interfaces
> +to drm_plane. Below I'll give a bit of background on HDR and why we
> +propose these interfaces.
> +
> +As an RFC doc this document is more verbose than what we would want from
> +an eventual uAPI doc. This is intentional in order to ensure interested
> +parties are all on the same page and to facilitate discussion if there
> +is disagreement on aspects of the intentions behind the proposed uAPI.

I would recommend keeping the discussion parts of the document as well,
but if you think they hurt the readability of the uAPI specification,
then split things into normative and informative sections.

> +
> +
> +Overview and background
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +I highly recommend you read `Jeremy Cline's HDR primer`_
> +
> +Jeremy Cline did a much better job describing this. I highly recommend
> +you read it at [1]:
> +
> +.. _Jeremy Cline's HDR primer: https://www.jcline.org/blog/fedora/graphi=
cs/hdr/2021/05/07/hdr-in-linux-p1.html

That's a nice write-up I didn't know about, thanks.

I just wish such write-ups would be somehow peer-reviewed for
correctness and curated for proper referencing. Perhaps like we develop
code: at least some initial peer review and then fixes when anyone
notices something to improve. Like... what you are doing here! :-)

The post is perhaps a bit too narrow with OETF/EOTF terms, accidentally
implying that OETF =3D EOTF^-1 which is not generally true, but that all
depends on which O-to-E or E-to-O functions one is talking about.
Particularly there is a difference between functions used for signal
compression which needs an exact matching inverse function, and
functions containing tone-mapping and artistic effects that when
concatenated result in the (non-identity) OOTF.

Nothing in the post seems to disagree with my current understanding
FWI'mW.

> +
> +Defining a pixel's luminance
> +----------------------------
> +
> +The luminance space of pixels in a framebuffer/plane presented to the
> +display is not well defined in the DRM/KMS APIs. It is usually assumed to
> +be in a 2.2 or 2.4 gamma space and has no mapping to an absolute luminan=
ce
> +value; it is interpreted in relative terms.
> +
> +Luminance can be measured and described in absolute terms as candela
> +per meter squared, or cd/m2, or nits. Even though a pixel value can be
> +mapped to luminance in a linear fashion to do so without losing a lot of
> +detail requires 16-bpc color depth. The reason for this is that human
> +perception can distinguish roughly between a 0.5-1% luminance delta. A
> +linear representation is suboptimal, wasting precision in the highlights
> +and losing precision in the shadows.
> +
> +A gamma curve is a decent approximation to a human's perception of
> +luminance, but the `PQ (perceptual quantizer) function`_ improves on
> +it. It also defines the luminance values in absolute terms, with the
> +highest value being 10,000 nits and the lowest 0.0005 nits.
> +
> +Using a content that's defined in PQ space we can approximate the real
> +world in a much better way.

Or HLG. It is said that HLG puts the OOTF in the display, while in a PQ
system OOTF is baked into the transmission. However, a monitor that
consumes PQ will likely do some tone-mapping to fit it to the display
capabilities, so it is adding an OOTF of its own. In a HLG system I
would think artistic adjustments are done before transmission baking
them in, adding its own OOTF in addition to the sink OOTF. So both
systems necessarily have some O-O mangling on both sides of
transmission.

There is a HLG presentation at
https://www.w3.org/Graphics/Color/Workshop/talks.html#intro

> +
> +Here are some examples of real-life objects and their approximate
> +luminance values:
> +
> +
> +.. _PQ (perceptual quantizer) function: https://en.wikipedia.org/wiki/Hi=
gh-dynamic-range_video#Perceptual_Quantizer
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Object
> +     - Luminance in nits
> +
> +   *  - Fluorescent light
> +      - 10,000
> +
> +   *  - Highlights
> +      - 1,000 - sunlight

Did fluorescent and highlights get swapped here?

> +
> +   *  - White Objects
> +      - 250 - 1,000
> +
> +   *  - Typical Objects
> +      - 1 - 250
> +
> +   *  - Shadows
> +      - 0.01 - 1
> +
> +   *  - Ultra Blacks
> +      - 0 - 0.0005
> +
> +
> +Transfer functions
> +------------------
> +
> +Traditionally we used the terms gamma and de-gamma to describe the
> +encoding of a pixel's luminance value and the operation to transfer from
> +a linear luminance space to the non-linear space used to encode the
> +pixels. Since some newer encodings don't use a gamma curve I suggest
> +we refer to non-linear encodings using the terms `EOTF, and OETF`_, or
> +simply as transfer function in general.

Yeah, gamma could mean lots of things. If you have e.g. OETF gamma
1/2.2 and EOTF gamma 2.4, the result is OOTF gamma 1.09.

OETF, EOTF and OOTF are not unambiguous either, since there is always
the question of whose function is it.

Two different EOTFs are of interest in composition for display:
- the display EOTF (since display signal is electrical)
- the content EOTF (since content is stored in electrical encoding)


> +
> +The EOTF (Electro-Optical Transfer Function) describes how to transfer
> +from an electrical signal to an optical signal. This was traditionally
> +done by the de-gamma function.
> +
> +The OETF (Opto Electronic Transfer Function) describes how to transfer
> +from an optical signal to an electronic signal. This was traditionally
> +done by the gamma function.
> +
> +More generally we can name the transfer function describing the transform
> +between scanout and blending space as the **input transfer function**, a=
nd

"scanout space" makes me think of cable/signal values, not framebuffer
values. Or, I'm not sure. I'd recommend replacing the term "scanout
space" with something less ambiguous like framebuffer values.

> +the transfer function describing the transform from blending space to the
> +output space as **output transfer function**.

You're talking about "spaces" here, but what you are actually talking
about are value encodings, not (color) spaces. An EOTF or OETF is not
meant to modify the color space.

When talking about blending, what you're actually interested in is
linear vs. non-linear color value encoding. This matches your talk
about EOTF and OETF, although you need to be careful to specify which
EOTF and OETF you mean. For blending, color values need to be linear in
light intensity, and the inverse of the E-to-O mapping before blending
is exactly the same as the O-to-E mapping after blending. Otherwise you
would alter even opaque pixels.

OETF is often associated with cameras, not displays. Maybe use EOTF^-1
instead?

Btw. another terminology thing: color space vs. color model. RGB and
YCbCr are color models. sRGB, BT.601 and BT.2020 are color spaces.
These two are orthogonal concepts.

> +
> +
> +.. _EOTF, and OETF: https://en.wikipedia.org/wiki/Transfer_functions_in_=
imaging
> +
> +Mastering Luminances
> +--------------------
> +
> +Even though we are able to describe the absolute luminance of a pixel
> +using the PQ 2084 EOTF we are presented with physical limitations of the
> +display technologies on the market today. Here are a few examples of
> +luminance ranges of displays.
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Display
> +     - Luminance range in nits
> +
> +   *  - Typical PC display
> +      - 0.3 - 200
> +
> +   *  - Excellent LCD HDTV
> +      - 0.3 - 400
> +
> +   *  - HDR LCD w/ local dimming
> +      - 0.05 - 1,500
> +
> +Since no display can currently show the full 0.0005 to 10,000 nits
> +luminance range of PQ the display will need to tone-map the HDR content,
> +i.e to fit the content within a display's capabilities. To assist
> +with tone-mapping HDR content is usually accompanied by a metadata
> +that describes (among other things) the minimum and maximum mastering
> +luminance, i.e. the maximum and minimum luminance of the display that
> +was used to master the HDR content.
> +
> +The HDR metadata is currently defined on the drm_connector via the
> +hdr_output_metadata blob property.

HDR_OUTPUT_METADATA, all caps.

> +
> +It might be useful to define per-plane hdr metadata, as different planes
> +might have been mastered differently.
> +
> +.. _SDR Luminance:
> +
> +SDR Luminance
> +-------------
> +
> +Traditional SDR content's maximum white luminance is not well defined.
> +Some like to define it at 80 nits, others at 200 nits. It also depends
> +to a large extent on the environmental viewing conditions. In practice
> +this means that we need to define the maximum SDR white luminance, either
> +in nits, or as a ratio.
> +
> +`One Windows API`_ defines it as a ratio against 80 nits.
> +
> +`Another Windows API`_ defines it as a nits value.
> +
> +The `Wayland color management proposal`_ uses Apple's definition of EDR =
as a
> +ratio of the HDR range vs SDR range.
> +
> +If a display's maximum HDR white level is correctly reported it is trivi=
al
> +to convert between all of the above representations of SDR white level. =
If
> +it is not, defining SDR luminance as a nits value, or a ratio vs a fixed
> +nits value is preferred, assuming we are blending in linear space.
> +
> +It is our experience that many HDR displays do not report maximum white
> +level correctly

Which value do you refer to as "maximum white", and how did you measure
it?

You also need to define who is "us" since kernel docs tend to get lots
of authors over time.


> +
> +.. _One Windows API: https://docs.microsoft.com/en-us/windows-hardware/d=
rivers/ddi/dispmprt/ns-dispmprt-_dxgkarg_settargetadjustedcolorimetry2
> +.. _Another Windows API: https://docs.microsoft.com/en-us/uwp/api/window=
s.graphics.display.advancedcolorinfo.sdrwhitelevelinnits?view=3Dwinrt-20348
> +.. _Wayland color management proposal: https://gitlab.freedesktop.org/sw=
ick/wayland-protocols/-/blob/color/unstable/color-management/color.rst#id8
> +
> +Let There Be Color
> +------------------
> +
> +So far we've only talked about luminance, ignoring colors altogether. Ju=
st
> +like in the luminance space, traditionally the color space of display
> +outputs has not been well defined. Similar to how an EOTF defines a
> +mapping of pixel data to an absolute luminance value, the color space
> +maps color information for each pixel onto the CIE 1931 chromaticity
> +space. This can be thought of as a mapping to an absolute, real-life,
> +color value.
> +
> +A color space is defined by its primaries and white point. The primaries
> +and white point are expressed as coordinates in the CIE 1931 color
> +space. Think of the red primary as the reddest red that can be displayed
> +within the color space. Same for green and blue.
> +
> +Examples of color spaces are:
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Color Space
> +     - Description
> +
> +   *  - BT 601
> +      - similar to BT 709
> +
> +   *  - BT 709
> +      - used by sRGB content; ~53% of BT 2020
> +
> +   *  - DCI-P3
> +      - used by most HDR displays; ~72% of BT 2020
> +
> +   *  - BT 2020
> +      - standard for most HDR content
> +
> +
> +
> +Color Primaries and White Point
> +-------------------------------
> +
> +Just like displays can currently not represent the entire 0.0005 -
> +10,000 nits HDR range of the PQ 2084 EOTF, they are currently not capable

"PQ" or "ST 2084".

> +of representing the entire BT.2020 color Gamut. For this reason video
> +content will often specify the color primaries and white point used to
> +master the video, in order to allow displays to be able to map the image
> +as best as possible onto the display's gamut.
> +
> +
> +Displays and Tonemapping
> +------------------------
> +
> +External displays are able to do their own tone and color mapping, based
> +on the mastering luminance, color primaries, and white space defined in
> +the HDR metadata.

HLG does things differently wrt. metadata and tone-mapping than PQ.

> +
> +Some internal panels might not include the complex HW to do tone and col=
or
> +mapping on their own and will require the display driver to perform
> +appropriate mapping.
> +
> +
> +How are we solving the problem?
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +Single-plane
> +------------
> +
> +If a single drm_plane is used no further work is required. The compositor
> +will provide one HDR plane alongside a drm_connector's hdr_output_metada=
ta
> +and the display HW will output this plane without further processing if
> +no CRTC LUTs are provided.
> +
> +If desired a compositor can use the CRTC LUTs for HDR content but without
> +support for PWL or multi-segmented LUTs the quality of the operation is
> +expected to be subpar for HDR content.

Explain/expand PWL.

Do you have references to these subpar results? I'm interested in when
and how they appear. I may want to use that information to avoid using
KMS LUTs when they are inadequate.


> +
> +
> +Multi-plane
> +-----------
> +
> +In multi-plane configurations we need to solve the problem of blending
> +HDR and SDR content. This blending should be done in linear space and
> +therefore requires framebuffer data that is presented in linear space
> +or a way to convert non-linear data to linear space. Additionally
> +we need a way to define the luminance of any SDR content in relation
> +to the HDR content.
> +
> +In order to present framebuffer data in linear space without losing a
> +lot of precision it needs to be presented using 16 bpc precision.

Integer or floating-point?


> +
> +
> +Defining HW Details
> +-------------------
> +
> +One way to take full advantage of modern HW's color pipelines is by
> +defining a "generic" pipeline that matches all capable HW. Something
> +like this, which I took `from Uma Shankar`_ and expanded on:
> +
> +.. _from Uma Shankar: https://patchwork.freedesktop.org/series/90826/
> +
> +.. kernel-figure::  colorpipe.svg

Btw. there will be interesting issues with alpha-premult, filtering,
and linearisation if your planes have alpha channels. That's before
HDR is even considered.

> +
> +I intentionally put de-Gamma, and Gamma in parentheses in my graph
> +as they describe the intention of the block but not necessarily a
> +strict definition of how a userspace implementation is required to
> +use them.
> +
> +De-Gamma and Gamma blocks are named LUT, but they could be non-programma=
ble
> +LUTs in some HW implementations with no programmable LUT available. See
> +the definitions for AMD's `latest dGPU generation`_ as an example.
> +
> +.. _latest dGPU generation: https://git.kernel.org/pub/scm/linux/kernel/=
git/stable/linux.git/tree/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resour=
ce.c?h=3Dv5.13#n2586
> +
> +I renamed the "Plane Gamma LUT" and "CRTC De-Gamma LUT" to "Tonemapping"
> +as we generally don't want to re-apply gamma before blending, or do
> +de-gamma post blending. These blocks tend generally to be intended for
> +tonemapping purposes.

Right.

> +
> +Tonemapping in this case could be a simple nits value or `EDR`_ to descr=
ibe
> +how to scale the :ref:`SDR luminance`.

I do wonder how that will turn out in the end... but on Friday there
will be HDR Compositing and Tone-mapping live Q&A session:
https://www.w3.org/Graphics/Color/Workshop/talks.html#compos

> +
> +Tonemapping could also include the ability to use a 3D LUT which might be
> +accompanied by a 1D shaper LUT. The shaper LUT is required in order to
> +ensure a 3D LUT with limited entries (e.g. 9x9x9, or 17x17x17) operates
> +in perceptual (non-linear) space, so as to evenly spread the limited
> +entries evenly across the perceived space.
> +
> +.. _EDR: https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/c=
olor/unstable/color-management/color.rst#id8
> +
> +Creating a model that is flexible enough to define color pipelines for
> +a wide variety of HW is challenging, though not impossible. Implementing
> +support for such a flexible definition in userspace, though, amounts
> +to essentially writing color pipeline drivers for each HW.

My thinking right now is that userspace has it's own pipeline model
with the elements it must have. Then it attempts to map that pipeline
to what elements the KMS pipeline happens to expose. If there is a
mapping, good. If not, fall back to shaders on GPU.

To help that succeed more often, I'm using the current KMS abstract
pipeline as a guide in designing the Weston internal color pipeline.

> +
> +
> +Defining SW Intentions
> +----------------------
> +
> +An alternative to describing the HW color pipeline in enough detail to
> +be useful for color management and HDR purposes is to instead define
> +SW intentions.
> +
> +.. kernel-figure::  color_intentions.svg
> +
> +This greatly simplifies the API and lets the driver do what a driver
> +does best: figure out how to program the HW to achieve the desired
> +effect.
> +
> +The above diagram could include white point, primaries, and maximum
> +peak and average white levels in order to facilitate tone mapping.
> +
> +At this point I suggest to keep tonemapping (other than an SDR luminance
> +adjustment) out of the current DRM/KMS API. Most HDR displays are capable
> +of tonemapping. If for some reason tonemapping is still desired on
> +a plane, a shader might be a better way of doing that instead of relying
> +on display HW.

"Non-programmable LUT" as you referred to them is an interesting
departure from the earlier suggestion, where you intended to describe
color spaces and encodings of content and display and let the hardware
do whatever wild magic in between. Now it seems like you have shifted
to programming transformations instead. They may be programmable or
enumerated, but still transformations rather than source and
destination descriptions. If the enumerated transformations follow
standards, even better.

I think this is a step in the right direction.

However, you wrote in the heading "Intentions" which sounds like your
old approach.

Conversion from one additive linear color space to another is a matter
of matrix multiplication. That is simple and easy to define, just load a
matrix. The problem is gamut mapping: you may end up outside of the
destination gamut, or maybe you want to use more of the destination
gamut than what the color space definitions imply. There are many
conflicting goals and ways to this, and I suspect the room for secret
sauce is here (and in tone-mapping).

There is also a difference between color space (signal) gamut and
device gamut. A display may accept BT.2020 signal, but the gamut it can
show is usually much less.


> +
> +In some ways this mirrors how various userspace APIs treat HDR:
> + * Gstreamer's `GstVideoTransferFunction`_
> + * EGL's `EGL_EXT_gl_colorspace_bt2020_pq`_ extension
> + * Vulkan's `VkColorSpaceKHR`_
> +
> +.. _GstVideoTransferFunction: https://gstreamer.freedesktop.org/document=
ation/video/video-color.html?gi-language=3Dc#GstVideoTransferFunction
> +.. _EGL_EXT_gl_colorspace_bt2020_pq: https://www.khronos.org/registry/EG=
L/extensions/EXT/EGL_EXT_gl_colorspace_bt2020_linear.txt
> +.. _VkColorSpaceKHR: https://www.khronos.org/registry/vulkan/specs/1.2-e=
xtensions/html/vkspec.html#VkColorSpaceKHR
> +
> +
> +A hybrid approach to the API
> +----------------------------
> +
> +Our current approach attempts a hybrid approach, defining API to specify
> +input and output transfer functions, as well as an SDR boost, and a
> +input color space definition.

Using a color space definition in the KMS UAPI brings us back to the
old problem.

Using descriptions of content (color spaces) instead of prescribing
transformations seems to be designed to allow vendors make use of their
secret hardware sauce: how to best realise the intent. Since it is
secret sauce, by definition it cannot be fully replicated in software
or shaders. One might even get sued for succeeding.

General purpose (read: desktop) compositors need to adapt to any
scenegraph and they want to make the most of the hardware under all
situations. This means that it is not possible to guarantee that a
certain window is always going to be using a KMS plane. Maybe a small
change in the scenegraph, a moving window or cursor, suddenly causes
the KMS plane to become unsuitable for the window, or in the opposite
case the KMS plane suddenly becomes available for the window. This
means that a general purpose compositor will be doing frame-by-frame
decisions on which window to put on which KMS plane, and which windows
need to be composited with shaders.

Not being able to replicate what the hardware does means that shaders
cannot produce the same image on screen as the KMS plane would. When
KMS plane assignments change, the window appearance would change as
well. I imagine end users would be complaining of such glitches.

However, there are other use cases where I can imagine this descriptive
design working perfectly. Any non-general, non-desktop compositor, or a
closed system, could probably guarantee that the scenegraph will always
map in a specific way to the KMS planes. The window would always map to
the KMS plane, meaning that it would never need to be composited with
shaders, and therefore cannot change color unexpectedly from end user
point of view. TVs, set-top-boxes, etc., maybe even phones. Some use
cases have a hard requirement of putting a specific window on a
specific KMS plane, or the system simply cannot display it
(performance, protection...).

Is it worth having two fundamentally different KMS UAPIs for HDR
composition support, where one interface supports only a subset of use
cases and the other (per-plane LUT, CTM, LUT, and more, freely
programmable by userspace) supports all use cases?

That's a genuine question. Are the benefits worth the kernel
developers' efforts to design, implement, and forever maintain both
mutually exclusive interfaces?


Now, someone might say that the Wayland protocol design for HDR aims to
be descriptive and not prescriptive, so why should KMS UAPI be
different? The reason is explained above: *some* KMS clients may switch
frame by frame between KMS and shaders, but Wayland clients pick one
path and stick to it. Wayland clients have no reason that I can imagine
to switch arbitrarily in flight.

> +
> +We would like to solicit feedback and encourage discussion around the
> +merits and weaknesses of these approaches. This question is at the core
> +of defining a good API and we'd like to get it right.
> +
> +
> +Input and Output Transfer functions
> +-----------------------------------
> +
> +We define an input transfer function on drm_plane to describe the
> +transform from framebuffer to blending space.
> +
> +We define an output transfer function on drm_crtc to describe the
> +transform from blending space to display space.
> +

Here is again the terminology problem between transfer function and
(color) space.

> +The transfer function can be a pre-defined function, such as PQ EOTF, or
> +a custom LUT. A driver will be able to specify support for specific
> +transfer functions, including custom ones.

This sounds good.

> +
> +Defining the transfer function in this way allows us to support in on HW
> +that uses ROMs to support these transforms, as well as on HW that use
> +LUT definitions that are complex and don't map easily onto a standard LUT
> +definition.
> +
> +We will not define per-plane LUTs in this patchset as the scope of our
> +current work only deals with pre-defined transfer functions. This API has
> +the flexibility to add custom 1D or 3D LUTs at a later date.

Ok.

> +
> +In order to support the existing 1D de-gamma and gamma LUTs on the drm_c=
rtc
> +we will include a "custom 1D" enum value to indicate that the custom gam=
ma and
> +de-gamma 1D LUTs should be used.

Sounds fine.

> +
> +Possible transfer functions:
> +
> +.. flat-table::
> +   :header-rows: 1
> +
> +   * - Transfer Function
> +     - Description
> +
> +   *  - Gamma 2.2
> +      - a simple 2.2 gamma function
> +
> +   *  - sRGB
> +      - 2.4 gamma with small initial linear section

Maybe rephrase to: The piece-wise sRGB transfer function with the small
initial linear section, approximately corresponding to 2.4 gamma
function.

I recall some debate, too, whether with a digital flat panel you should
use a pure 2.4 gamma function or the sRGB function. (Which one do
displays expect?)

> +
> +   *  - PQ 2084
> +      - SMPTE ST 2084; used for HDR video and allows for up to 10,000 ni=
t support

Perceptual Quantizer (PQ), or ST 2084. There is no PQ 2084.

> +
> +   *  - Linear
> +      - Linear relationship between pixel value and luminance value
> +
> +   *  - Custom 1D
> +      - Custom 1D de-gamma and gamma LUTs; one LUT per color
> +
> +   *  - Custom 3D
> +      - Custom 3D LUT (to be defined)

Adding HLG transfer function to this set would be interesting, because
it requires a parameter I believe. How would you handle parameterised
transfer functions?

It's worth to note that while PQ is absolute in luminance (providing
cd/m=C2=B2 values), everything else here is relative for both SDR and HDR.
You cannot blend content in PQ with content in something else together,
until you practically define the absolute luminance for all non-PQ
content or vice versa.

A further complication is that you could have different
relative-luminance transfer functions, meaning that the (absolute)
luminance they are relative to varies. The obvious case is blending SDR
content with HDR content when both have relative-luminance transfer
function.

Then you have HLG which is more like scene-referred than
display-referred, but that might be solved with the parameter I
mentioned, I'm not quite sure.

PQ is said to be display-referred, but it's usually referred to
someone else's display than yours, which means it needs the HDR
metadata to be able to tone-map suitably to your display. This seems to
be a similar problem as with signal gamut vs. device gamut.

The traditional relative-luminance transfer functions, well, the
content implied by them, is display-referred when it arrived at KMS or
compositor level. There the question of "whose display" doesn't matter
much because it's SDR and narrow gamut, and we probably don't even
notice when we see an image wrong. With HDR the mismatch might be
noticeable.


> +
> +
> +Describing SDR Luminance
> +------------------------------
> +
> +Since many displays do no correctly advertise the HDR white level we
> +propose to define the SDR white level in nits.

This means that even if you had no content using PQ, you still need to
define the absolute luminance for all the (HDR) relative-luminance
transfer functions.

There probably needs to be something to relate everything to a single,
relative or absolute, luminance range. That is necessary for any
composition (KMS and software) since the output is a single image.

Is it better to go with relative or absolute metrics? Right now I would
tend to say relative, because relative is unitless. Absolute values are
numerically equivalent, but they might not have anything to do with
actual physical measurements, making them actually relative. This
happens when your monitor does not support PQ mode or does tone-mapping
to your image, for instance.

The concept we have played with in Wayland so far is EDR, but then you
have the question of "what does zero mean", i.e. the luminance of
darkest black could vary between contents as well, not just the
luminance of extreme white.

> +
> +We define a new drm_plane property to specify the white level of an SDR
> +plane.
> +
> +
> +Defining the color space
> +------------------------
> +
> +We propose to add a new color space property to drm_plane to define a
> +plane's color space.
> +
> +While some color space conversions can be performed with a simple color
> +transformation matrix (CTM) others require a 3D LUT.
> +
> +
> +Defining mastering color space and luminance
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +ToDo
> +
> +
> +
> +Pixel Formats
> +~~~~~~~~~~~~~
> +
> +The pixel formats, such as ARGB8888, ARGB2101010, P010, or FP16 are
> +unrelated to color space and EOTF definitions. HDR pixels can be formatt=
ed

Yes!

> +in different ways but in order to not lose precision HDR content requires
> +at least 10 bpc precision. For this reason ARGB2101010, P010, and FP16 a=
re
> +the obvious candidates for HDR. ARGB2101010 and P010 have the advantage
> +of requiring only half the bandwidth as FP16, while FP16 has the advanta=
ge
> +of enough precision to operate in a linear space, i.e. without EOTF.

This reminds me of something interesting said during the W3C WCG & HDR
Q&A session yesterday. Unfortunately I forget his name, but I think
transcriptions should become available at some point, someone said that
pixel depth or bit precision should be thought of as setting the noise
floor. When you quantize values, always do dithering. Then the
precision only changes your noise floor level. Then something about how
audio has realized this ages ago and we are just catching up.

If you don't dither, you get banding artifacts in gradients. If you do
dither, it's just noise.

> +
> +
> +Use Cases
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +RGB10 HDR plane - composited HDR video & desktop
> +------------------------------------------------
> +
> +A single, composited plane of HDR content. The use-case is a video player
> +on a desktop with the compositor owning the composition of SDR and HDR
> +content. The content shall be PQ BT.2020 formatted. The drm_connector's
> +hdr_output_metadata shall be set.
> +
> +
> +P010 HDR video plane + RGB8 SDR desktop plane
> +---------------------------------------------
> +A normal 8bpc desktop plane, with a P010 HDR video plane underlayed. The
> +HDR plane shall be PQ BT.2020 formatted. The desktop plane shall specify
> +an SDR boost value. The drm_connector's hdr_output_metadata shall be set.
> +
> +
> +One XRGB8888 SDR Plane - HDR output
> +-----------------------------------
> +
> +In order to support a smooth transition we recommend an OS that supports
> +HDR output to provide the hdr_output_metadata on the drm_connector to
> +configure the output for HDR, even when the content is only SDR. This wi=
ll
> +allow for a smooth transition between SDR-only and HDR content. In this

Agreed, but this also kind of contradicts the idea of pushing HDR
metadata from video all the way to the display in the RGB10 HDR plane
case - something you do not seem to suggest here at all, but I would
have expected that to be a prime use case for you.

A set-top-box might want to push the video HDR metadata all the way to
the display when supported, and then adapt all the non-video graphics
to that.


Thanks,
pq

> +use-case the SDR max luminance value should be provided on the drm_plane.
> +
> +In DCN we will de-PQ or de-Gamma all input in order to blend in linear
> +space. For SDR content we will also apply any desired boost before
> +blending. After blending we will then re-apply the PQ EOTF and do RGB
> +to YCbCr conversion if needed.
> +
> +FP16 HDR linear planes
> +----------------------
> +
> +These will require a transformation into the display's encoding (e.g. PQ)
> +using the CRTC LUT. Current CRTC LUTs are lacking the precision in the
> +dark areas to do the conversion without losing detail.
> +
> +One of the newly defined output transfer functions or a PWL or `multi-se=
gmented
> +LUT`_ can be used to facilitate the conversion to PQ, HLG, or another
> +encoding supported by displays.
> +
> +.. _multi-segmented LUT: https://patchwork.freedesktop.org/series/90822/
> +
> +
> +User Space
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Gnome & GStreamer
> +-----------------
> +
> +See Jeremy Cline's `HDR in Linux\: Part 2`_.
> +
> +.. _HDR in Linux\: Part 2: https://www.jcline.org/blog/fedora/graphics/h=
dr/2021/06/28/hdr-in-linux-p2.html
> +
> +
> +Wayland
> +-------
> +
> +See `Wayland Color Management and HDR Design Goals`_.
> +
> +.. _Wayland Color Management and HDR Design Goals: https://gitlab.freede=
sktop.org/swick/wayland-protocols/-/blob/color/unstable/color-management/co=
lor.rst
> +
> +
> +ChromeOS Ozone
> +--------------
> +
> +ToDo
> +
> +
> +HW support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +ToDo, describe pipeline on a couple different HW platforms
> +
> +
> +Further Reading
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +* https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/un=
stable/color-management/color.rst
> +* http://downloads.bbc.co.uk/rd/pubs/whp/whp-pdf-files/WHP309.pdf
> +* https://app.spectracal.com/Documents/White%20Papers/HDR_Demystified.pdf
> +* https://www.jcline.org/blog/fedora/graphics/hdr/2021/05/07/hdr-in-linu=
x-p1.html
> +* https://www.jcline.org/blog/fedora/graphics/hdr/2021/06/28/hdr-in-linu=
x-p2.html
> +
> +
> diff --git a/Documentation/gpu/rfc/index.rst b/Documentation/gpu/rfc/inde=
x.rst
> index 05670442ca1b..8d8430cfdde1 100644
> --- a/Documentation/gpu/rfc/index.rst
> +++ b/Documentation/gpu/rfc/index.rst
> @@ -19,3 +19,4 @@ host such documentation:
>  .. toctree::
> =20
>      i915_gem_lmem.rst
> +    hdr-wide-gamut.rst


--Sig_/HVqWF4N8u0bunALt2770t4M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFB/LcACgkQI1/ltBGq
qqeE5RAAl3cwACdWUDEexB7DlJOBXBcla8tyzOKY2PmlAAEBNE0VDCi6z9GdEa6h
22TRKbLR0zTFrp2wAh28GkEaFEHBW43y/RLLBEa2QFTYUyGNq3yk4wnuJe4vh877
KusCePTEmKkd2w22W2vMcdUpw4E84K2GGzRIfk1PHze4vbuOwx9m7CeyhUcA/5Uc
gl3UeJgKtpfsL4S51J34JRUhaWcEgphZ0uK9wjnWHsYIDgxe93XBekd7NLgrnJ2p
LCClX4bKcPtyyD04aZcViIy8AKUumbZhJ0yz+q0SgmMJm9Kja3HOdgDuPDBk+sSZ
w3+U43XKI4PNMoPpbu/OqbMpDBn2PfANOIiMFUiDmPcXv7EyY1krVavsakcV7pi+
6HrVuZT2o7qmvN+7fYyjnMpN5pGjkUNWc1a48vTm2+ubs1ptdFRZsf7eqnSU+Gx/
1JPEuC+f9R4M/ZYk8nYzz4rFXPXoUz1BLbTvzHasRUaq5lMH8wIzWWSS6SrFstR3
DcgpXSgF7AqGkAS81q77sy3Ol4SWenZG7UZLdgOCmJSC/vkmdoxSMHAR8v3oDNMW
0PgitQ0XvzesR2LnqWb4qV47aciJ4B6F5dYyYgYNCrltgfin0/hzG6mNoHqh7vZC
zTBuRu7CeoHF3WF/dQeTDKE0JoBhzBQYqoX1xXTXI+XMTOMHVlw=
=IDIK
-----END PGP SIGNATURE-----

--Sig_/HVqWF4N8u0bunALt2770t4M--
