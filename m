Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D8D4143CB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 10:31:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DED6EB0A;
	Wed, 22 Sep 2021 08:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143416EB0A;
 Wed, 22 Sep 2021 08:31:18 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id i4so8920723lfv.4;
 Wed, 22 Sep 2021 01:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=lUPo1hSCb4YKyq3jLPqD+zKgPCU9dG6V2bR2IVY81I0=;
 b=L+p55wCDG+tVubfTjr+VHsBK+s5XSLNZ3OAa3m7jOVO9u3NOhmWP7nnXw2qqhNqc8k
 UCuNtUc+gD9lJhLMn1HxWmjYh6y2YvjUKbdLsPewdys0cygaTnHChoEEGcA/CU9kkWJk
 P1H6MWZiuO2ZfRnDm92M5ZMEZrRI35z62tsPNJsZ6/RX7nKmZn3N6WBJQ2GawHIhsLNh
 jqiSn480LrISRU8dJOZzlBMFnRXulQgOUnl6M6IgFPm+0WP//3UE4XANiJQlrjpx0Mgq
 8nK8XNFPPChkY48uDDOMIaPL9MPF1mIEnlsel13N9LIoH+IjzqYPd7oZnMp2I80r5CSN
 InJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=lUPo1hSCb4YKyq3jLPqD+zKgPCU9dG6V2bR2IVY81I0=;
 b=tMSn1IfE+3a/ikmaIDNk/PodmrQ1bcs42egpGwUVzfnULE4iicv6P3jAqOiYVxmcnW
 rSLdqkHLEiQeZ0n6VbjIhLrwstW1kTYcagX3mwKcnk5Ip2FInvsQCWhqIHYLlFNJe97N
 rsOX7hAc2fy6LUM+jBrtvG++7f/lWGi1tUXC9Ky7QeLYouMQQCWA8cjDfrnKnE/7YWpK
 wEc/+uhanFaVHmVJqPZBYTQb1kV63Rw/FLBMFdH3xCylSQYu8nIBYkug82SORC2YM2bl
 zfGb4S46frKNjcwDzddEyiAO3/jS8wnYkvrEyaBn4PsyxAGUskoW2o+2zxreVbf4/J/F
 IVNQ==
X-Gm-Message-State: AOAM530XsT+1GlrbrQemDM5HpJ1bp0AD/dEx7H4fhgroJKf8L3y31L3H
 D1iJC1FAKogDSkHiQumdlzk=
X-Google-Smtp-Source: ABdhPJwHCt9/tH9Xuhi1QvFILBbOz1LBnhcPLRkiocdcSCxhKBlyChUW8+VC9Z3bxn1vLgXhDsYD5g==
X-Received: by 2002:a2e:6e19:: with SMTP id j25mr14066294ljc.360.1632299475940; 
 Wed, 22 Sep 2021 01:31:15 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id l2sm121381lfe.1.2021.09.22.01.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 01:31:15 -0700 (PDT)
Date: Wed, 22 Sep 2021 11:31:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210922113105.2e42754c@eldfell>
In-Reply-To: <0c673cf8-2b90-c1ca-a0b0-c809e7e10c2c@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
 <20210921163158.688c26bc@eldfell>
 <0c673cf8-2b90-c1ca-a0b0-c809e7e10c2c@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lmb5Ri0lX7eSX3I4O0PBb_O";
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

--Sig_/lmb5Ri0lX7eSX3I4O0PBb_O
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Sep 2021 14:05:05 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-09-21 09:31, Pekka Paalanen wrote:
> > On Mon, 20 Sep 2021 20:14:50 -0400
> > Harry Wentland <harry.wentland@amd.com> wrote:
> >  =20
> >> On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:=
29 -0400 =20
> >>> Harry Wentland <harry.wentland@amd.com> wrote:
> >>>    =20
> >>>> Use the new DRM RFC doc section to capture the RFC previously only
> >>>> described in the cover letter at
> >>>> https://patchwork.freedesktop.org/series/89506/
> >>>>
> >>>> v3:
> >>>>  * Add sections on single-plane and multi-plane HDR
> >>>>  * Describe approach to define HW details vs approach to define SW i=
ntentions
> >>>>  * Link Jeremy Cline's excellent HDR summaries
> >>>>  * Outline intention behind overly verbose doc
> >>>>  * Describe FP16 use-case
> >>>>  * Clean up links
> >>>>
> >>>> v2: create this doc
> >>>>
> >>>> v1: n/a
> >>>>
> >>>> Signed-off-by: Harry Wentland <harry.wentland@amd.com>   =20
> >=20
> > Hi Harry!
> >=20
> > ...
> >  =20
> >>>> ---
> >>>>  Documentation/gpu/rfc/color_intentions.drawio |   1 +
> >>>>  Documentation/gpu/rfc/color_intentions.svg    |   3 +
> >>>>  Documentation/gpu/rfc/colorpipe               |   1 +
> >>>>  Documentation/gpu/rfc/colorpipe.svg           |   3 +
> >>>>  Documentation/gpu/rfc/hdr-wide-gamut.rst      | 580 +++++++++++++++=
+++
> >>>>  Documentation/gpu/rfc/index.rst               |   1 +
> >>>>  6 files changed, 589 insertions(+)
> >>>>  create mode 100644 Documentation/gpu/rfc/color_intentions.drawio
> >>>>  create mode 100644 Documentation/gpu/rfc/color_intentions.svg
> >>>>  create mode 100644 Documentation/gpu/rfc/colorpipe
> >>>>  create mode 100644 Documentation/gpu/rfc/colorpipe.svg
> >>>>  create mode 100644 Documentation/gpu/rfc/hdr-wide-gamut.rst   =20

...

> I think we need to talk about what 1.0 means. Apple's EDR defines 1.0
> as "reference white" or in other words the max SDR white.
>=20
> That definition might change depending on the content type.

Yes, the definition of 1.0 depends on the... *cough* encoding. Semantic
encoding? Sometimes it just means max signal value (like everywhere
until now), sometimes it maps to something else. It might be relative
(other than PQ system) or absolute (PQ system) luminance, with a fixed
scale after non-linear encoding.

The definition of 0.0, or { 0.0, 0.0, 0.0 } more like, is pretty much
always the darkest possible black - or is it? The darkest possible
black is not usually 0 cd/m=C2=B2, but something above that depending on bo=
th
the device and the viewing environment. A display necessarily reflects
some light from the environment which sets the black level of the
image, even if the display itself was capable of exactly 0 cd/m=C2=B2. Maybe
VR goggles are an exception.

As a side note: if the viewing environment sets the display black
level, then the environment also sets the display black's white point,
and that may be different from the display's own white point. Also HVS
has rods for low light vision, while color management concentrates
wholly on the cones that provide color vision. So dark shades might be
in the rod range where color cannot be perceived. I digress though.

Then there is the whole issue of HVS adaptation which basically sets
the observable dynamic range bracket (and what one considers as white I
think). Minimum observable color and luminance difference depends on
that bracket and the color position inside the bracket.

Trying to look at a monitor in bright daylight is a painful example of
these. ;-)

Btw. is was an awesome experience many years ago to spend 15-30 minutes
in a room lit with a pale green light only, and then walking outside. I
have never ever seen so vivid and saturated reds, yellows, violets,
browns(!), etc. than just after coming out of that room. That was the
real world, not a display. :-)

...

> > One thing I realised yesterday is that HLG displays are much better
> > defined than PQ displays, because HLG defines what OOTF the display
> > must implement. In a PQ system, the signal carries the full 10k nits
> > range, and then the monitor must do vendor magic to display it. That's
> > for tone mapping, not sure if HLG has an advantage in gamut mapping as
> > well.
> >  =20
>=20
> Doesn't the metadata describe the max content white? So even if the signal
> carries the full 10k nits the actual max luminance of the content should
> be incoded as part of the metadata.

It is in the HDR static metadata, yes, if present. There is also
dynamic metadata version.

However, the static metadata describes the presentation on the
(professional) mastering display, more or less. Almost certainly the
display an end user has is not a mastering display capable device, so
arbitrary magic still needs to happen to squeeze the signal down to
what the display can do.

Or, I suppose, if the signal (image) does not need squeezing for people
who bought the average HDR display, then people who bought high-end HDR
displays will be unimpressed by the image on their display. Thinking of
buying a new fancy TV and then the image looks exactly the same as in
the old one. Ironically, that is exactly what color management might do
to SDR content.

One could expand a narrow range to a wider range, and I'm sure displays
do that too for more sales, but I guess you would have the usual
problems of upscaling. It's hard to invent detail where there was none
recorded.

...

> Did anybody start any CM doc patches in Weston or Wayland yet?

There is the
https://gitlab.freedesktop.org/swick/wayland-protocols/-/blob/color/unstabl=
e/color-management/color.rst
we started a long time ago, and have not really touched it for a while.
Since we last touched it, at least my understanding has developed
somewhat.

It is linked from the overview in
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/14
and if you want to propose changes, the way to do it is file a MR in
https://gitlab.freedesktop.org/swick/wayland-protocols/-/merge_requests
against the 'color' branch. Patches very much welcome, that doc does
not need to limit itself to Wayland. :-)

We also have issues tracked at
https://gitlab.freedesktop.org/swick/wayland-protocols/-/issues?scope=3Dall=
&utf8=3D%E2%9C%93&state=3Dopened

> > Pre-curve for instance could be a combination of decoding to linear
> > light and a shaper for the 3D LUT coming next. That's why we don't call
> > them gamma or EOTF, that would be too limiting.
> >=20
> > (Using a shaper may help to keep the 3D LUT size reasonable - I suppose
> > very much like those multi-segmented LUTs.)
> >  =20
>=20
> AFAIU a 3D LUTs will need a shaper as they don't have enough precision.
> But that's going deeper into color theory than I understand. Vitaly would
> know better all the details around 3D LUT usage.

There is a very practical problem: the sheer number of elements in a 3D
LUT grows to the power of three. So you can't have very many taps per
channel without storage requirements blowing up. Each element needs to
be a 3-channel value, too. And then 8 bits is not enough.

I'm really happy that Vitaly is working with us on Weston and Wayland. :-)
He's a huge help, and I feel like I'm currently the one slowing things
down by being backlogged in reviews.


Thanks,
pq

--Sig_/lmb5Ri0lX7eSX3I4O0PBb_O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFK6ckACgkQI1/ltBGq
qqe6Cw//TOVEgruOCb0e+KRdc8KFwB2xLI5DOXDtqRKrzxotnNb8Gtgiwi27SCml
1Q+lhcgeLk6zkLt8Iav8Op78CFueNCmOxBJCpmm2QBORlw8vEUE4WTAyHNFu1vYm
H4Gw7HvtVvur53YCXFnSTZR7+BznqSPz1vaiwAcQdk1UNwFuhlMKFRYkO50ERSMA
vp4SGjssxguNRTcU3c4vvOe82zDche4DQwFlrRjybekdn+sLX20CeO3W3YRrWh9+
BczqLRvvBUKINa0AKQnd8ZPquRPbc43IM0WTUVVdZYJiYFjwlgjTUf76FvO/c6ek
yz/6nZWCVzYC8wuNk9rtb6WwSPMV/vo9K0GPshpLQb0tK0gmZPLbiT03VgFg6jpi
4jUI/9Cyz9PTIB+O+sJqX4DEpC5JrhOHq9ZP2phMtezZGklHiS3Jp3O2E0W4seEL
ryDbX30Jjw3QIYEtb1kpJ0PDt9OlxEYvAf89+hjKzw/Injlz0Z4cVYJKuGP9hwoE
lrthA2GdcNVTxDh7hmv+GDMcKvnMGF3x5ADoEUV8i9WNid34q6RHWikh3rjutcyR
JDUXu2nOcom7Ia1wjqoec3ShCDdgl5YN1jJFoCIk939AefNVitOiPtImPjXZBm6b
r6TI3LTr3Ey/uBHDk5hUYeonLW1gxZzZZZKyP9k1YEIHrPUs2L4=
=Dall
-----END PGP SIGNATURE-----

--Sig_/lmb5Ri0lX7eSX3I4O0PBb_O--
