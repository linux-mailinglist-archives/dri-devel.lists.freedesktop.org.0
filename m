Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157037A56B
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 13:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204506EA19;
	Tue, 11 May 2021 11:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638B36EA19;
 Tue, 11 May 2021 11:08:13 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r5so10851209lfr.5;
 Tue, 11 May 2021 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=2rwdY+cy/LFTwHB/JDH41pgEo5onrbL3R8dSf4+xjKg=;
 b=EaM83za3ez8P1OFd4pAdX0Z6TbNSAsjaN6dWo/LprqDNcFd834QtxsDzaRYBY7h0XK
 ubCBWo8fgFjbhzvX0BYZMNRcvPfkrey/GW/0CtJlsLFKPRTpYBhklz7nJ40B99XEBUX6
 lyQPu0CciWB5WSZ2jl1XAuCVl2fOKK1KiHyazScaEZZsmKmFKnc7uiAJto//1V1z9zRO
 FCG759nTYwhs6fHTuK+9Gwd/ioboQ64T8B+7vMGXCIgJnCZvhasUcf8MErcchvM5a6qG
 oJ4R6KKaUsAZtsYEF5o6Fo2QBSWjp4un3hU0TTbVfJk7GVaCmTqt6TvuCc7DTpfMliAl
 smcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2rwdY+cy/LFTwHB/JDH41pgEo5onrbL3R8dSf4+xjKg=;
 b=NxJYKWrzeTqTRUOOo/ES88MsbHuUaIfRp1nU/KzAFjNndR4KQbt4Kfk7/a8qsH9Awf
 ZmexFiZ9LZIKBb3FC5gYkLF/lCNzLbQZD/qODMKoHLjtZzRRRm98s+Pys62BO5Ze17/+
 9Dszz+2Fzs6R+joT3ItNQAf7948+jCByNaqNX3xd7KRvPBrP3ZOt81pu2LEpmBQEFm51
 8awFjJi+6OVGrf2OftVMjkT3BY33xl11Q+Q8Kz3E4uQXDJutLtprJOQdZGwWQeBQx2ud
 TBYvUvFCTOJbr1Ep/XvOh/DN8a3VpCGm+vZBbk5NlM3MXEhTTZtQZPotr6cw/X9roBUA
 3/LA==
X-Gm-Message-State: AOAM530ZfsBwK1+XYxByqpZdc68ltDL8FM2s42h82gvUxqK5bc7yI/9y
 nbonVpJysMSlnE7pAd7jkAw=
X-Google-Smtp-Source: ABdhPJxa58kOycC5ZbaUnn6C/Vl0QmIi664AHb+gcMZ0X3sCF7YAhZ++lVitc/tCQjCLGwXlGD49lg==
X-Received: by 2002:a05:6512:3c91:: with SMTP id
 h17mr20344276lfv.106.1620731291633; 
 Tue, 11 May 2021 04:08:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id p11sm2602176lfu.41.2021.05.11.04.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 04:08:11 -0700 (PDT)
Date: Tue, 11 May 2021 14:08:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Werner Sembach <wse@tuxedocomputers.com>
Subject: Re: [PATCH] drm/amd/display: Expose active display color
 configurations to userspace
Message-ID: <20210511140800.39f124d4@eldfell>
In-Reply-To: <46ad57d2-8fdd-51c3-de32-bcf6a1016a56@tuxedocomputers.com>
References: <20210507192718.35314-1-wse@tuxedocomputers.com>
 <CADnq5_O7uuSj-nmKXRvGVTb9n1e+Bb-SU3Psi7BVhN4AOYhHsQ@mail.gmail.com>
 <20210511110756.7e754c30@eldfell>
 <46ad57d2-8fdd-51c3-de32-bcf6a1016a56@tuxedocomputers.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jFn+W2X.efBMyM.Ea=ua2tO"; protocol="application/pgp-signature"
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/jFn+W2X.efBMyM.Ea=ua2tO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 11 May 2021 12:03:30 +0200
Werner Sembach <wse@tuxedocomputers.com> wrote:

> Am 11.05.21 um 10:07 schrieb Pekka Paalanen:
> > On Mon, 10 May 2021 17:47:01 -0400
> > Alex Deucher <alexdeucher@gmail.com> wrote:
> > =20
> >> On Fri, May 7, 2021 at 3:27 PM Werner Sembach <wse@tuxedocomputers.com=
> wrote: =20
> >>> xrandr --prop and other userspace info tools have currently no way of
> >>> telling which color configuration is used on HDMI and DP ports.
> >>>
> >>> The ongoing transsition from HDMI 1.4 to 2.0 and the different bandwi=
dth
> >>> requirements of YCbCr 4:2:0 and RGB color format raise different
> >>> incompatibilities. Having these configuration information readily
> >>> available is a useful tool in debuging washed out colors, color artef=
acts
> >>> on small fonts and missing refreshrate options.   =20
> >> I think we would ideally want these as generic connector properties
> >> rather than AMD specific ones since they are not really AMD specific.
> >> I believe there is already a generic drm property (max_bpc) for the
> >> color depth.  At this point, I think having a generic RGB vs YCbCr
> >> property would make sense.  I'm not sure about the color space. =20
>=20
> Problem is: amdgpu does not really use generic structs for these 3
> properties as far as I can tell. It uses own defines
> https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/amd/dis=
play/dc/dc_hw_types.h#L647
> in own structs
> https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/amd/dis=
play/dc/dc_stream.h#L141
>=20
> Intel uses generic defines
> https://elixir.bootlin.com/linux/v5.13-rc1/source/include/linux/hdmi.h#L71
> https://elixir.bootlin.com/linux/v5.13-rc1/source/include/drm/drm_dp_help=
er.h#L1568
> split up between dp and hdmi in own structs
> https://elixir.bootlin.com/linux/v5.13-rc1/source/drivers/gpu/drm/i915/di=
splay/intel_display_types.h#L879
>=20
> So the property would need some translation from amd, intel, hdmi,
> and dp to one enumeration representing all?

If so, much better to do that in the kernel in one place per driver
that actually know what they mean, rather than in half of the Wayland
compositors by people who barely understand even the general concept.
Like me.

> > Hi,
> >
> > I believe that userspace will definitely want to know what exactly is
> > going on on the monitor cable, so I think exposing more information is
> > good, but I agree that it needs to be done with generic KMS properties
> > as much as possible. Userspace is not going to bother having explicit
> > code for driver-specific properties.
> >
> > I think a major use case will be Wayland color management, where a
> > Wayland compositor will want to make sure that the video signal
> > parameters have not changed since the monitor was last measured
> > (profiled). If the signal configuration is different, the measured
> > color profile may be invalid and therefore the end user needs to be
> > warned. See some ideas in
> > https://gitlab.freedesktop.org/wayland/weston/-/issues/467
> > under the heading "Color calibration auditing system".
> >
> > About the color space: is that something a kernel driver will decide
> > on its own? I mean in the same sense as the driver will negotiate
> > HDMI/DP link parameters, perhaps falling back to smaller requirements
> > if higher requirements signal does not seem to work.
> >
> > We only need readback properties for things that generic userspace
> > won't or cannot control explicitly, e.g. because the kernel driver has
> > room to make a choice rather than fail. =20
>=20
> Some explanation why I choose these 3 properties:
>=20
> output color space: Mainly to see if full or limited RGB was chosen.

IOW, the driver makes the decision. Therefore userspace will need to
know what it picked. Ok.

> While in theory the driver should choose the right one automatically,
> I read articles that in some cases it doesn't (hence why the
> "Broadcast RGB" property for intel-gfx driver and "output_csc" for
> the old radeon driver exist). The next step ofc would be to bring
> over the "Broadcast RGB" property to amdgpu/make it a generic
> property. But then still: having a feedback channel to see if the
> chosen setting got correctly applied should not hurt in any way,
> shape, or form?

Feedback is good IMO, yes, when it's not clearly redundant. As long as
you don't tie the driver developers' hands in a knot or preclude
support for hardware not invented yet. But I think the option to not
expose a specific KMS property is an escape hatch enough. You might
have problems with the requirements for DRM UAPI additions though,
since they call for a proper userspace consumer.

What defines what is "the right one"?

I believe that we also need to aim for a fully known display pipeline,
so if the driver is doing compression from full range 8-bit to limited
range 8-bit, losing a little precision, userspace needs to know. This
is a long stretch and maybe not even fully feasible, but I think it
would be good to get as close as possible - within the limits of being
driver-agnostic UAPI.

> pixel encoding: Probably the most important of the 3: This should be
> accompanied with a "preferred pixel encoding" user controllable
> setting and is mainly thought as a feedback channel for that, because
> it might not always the obvious if the Display + GPU + Driver + Link
> encoder combination actually supports and therefore applies the
> selected "preferred pixel encoding". For example: I have a display
> here that can display 4k@60Hz or WQHD@120Hz, but YCbCr is only
> supported by it for 4k@60Hz (also it's not supported for 4k30Hz).

This feedback is useful, IMO.

The alternative approach would be to just let KMS atomic commit fail if
the exact given configuration does not work, but it would be really
difficult for userspace to implement the necessary fallbacks and to try
alternative configurations. Therefore I think setting preference and
then checking what the driver actually achieved seems like a good
compromise to me.

> The "preferred pixel encoding" setting is required because certain
> devices (both PC's and display's) might wrongly advertise their
> capabilities. The current fix in this case is to write a custom edid
> which is a kinda hacky solution. Examples: 1. RGB and YCbCr4:4:4 in
> theory carry the same amount of color information, but some displays
> look worse in one or the other, because they do bad internal
> conversion. 2. A laptop wants to output YCbCr4:4:4 but because of bad
> shielding of the port/the cable/the display, the screen goes black
> every few seconds. Using YCbCr4:2:0, and therefore a lower signal
> clock, stabilizes the connection without changing hardware.

That totally makes sense, and example 1 is actually a good reason why
color management needs to be interested about these properties.

> color depth: While "max bpc" can be used to change the color depth,
> there is currently no way to check which one actually gets used.
> While in theory the driver chooses the best/highest bpc within the
> max bpc setting a user might not be fully aware what his hardware is
> or isn't capable off. This is meant as a quick way to double check
> the setup.

Likewise, this is important information for color management.

I'm really happy to see these come up. The Weston CM&HDR work isn't
quite there yet to start making use of these, but some month/year I bet
it will.


Thanks,
pq

--Sig_/jFn+W2X.efBMyM.Ea=ua2tO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCaZZAACgkQI1/ltBGq
qqfzYxAAsOGa3LOR5nsVVQ8Qdxr5ZxRZgnr9CJevl7J8LzSEiXMNjsK7HmtjeKPK
skCE0waOJm2wH5jpKwQ8RDiTAlOhPozk3sKclimXGa1BopKrQoVnNCD0/G2842bm
O3FR7R1UHbcxcArpOlRSBGCGFeNZMnE6vus8E8VproV9Io/ZW4PLkW5g2UeahIrs
9HVnp7oGxBsSr8TIjX1Ulv7CvhVrCojbQsbYh3E+RjuaEk7k6TlsJpjG8oMuW58V
5sNFglI11P9eAGrQf2qJ3oNGoZV/lBoIFzds157E6nE2t7mJ6qZrCbxzE7Cys/7V
YQhWT/1rJWlVtjWiNsHwyiW3iX+wukNAS7w45RoDK53KF5GaychRB4/jD8ujt79M
HRPc4/lQR/bfJdZo3Kxcla9xyMo2fTSIkstor5J9MV682m83kYp6ZJ41V+W72bhr
6U2espZPQ3y5CHa8uBMXpmKN/r0Uqd3k1KO2PoVHUftQuwPCUdovYtFRfLmNIz2l
mJ9M9aHuYn+sgpXQkQyGLErVtaraCtNOcYm6idq0egijqSiF0s7m6WDowURy9IhM
zaRcsAD6khfeSewCXMaE6h5RytGeKQ8uJy6W+1A2sndymClc18SzqWlrpXYy6oiG
XAJmzh/xcj9JIXdxYcDvVMDpR8jKnpM/fmPU/VbmuVos8TB1HB8=
=DpUk
-----END PGP SIGNATURE-----

--Sig_/jFn+W2X.efBMyM.Ea=ua2tO--
