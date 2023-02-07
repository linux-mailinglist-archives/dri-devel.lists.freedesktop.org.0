Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB668D723
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 13:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4A3610E4F3;
	Tue,  7 Feb 2023 12:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 726CE10E4F1;
 Tue,  7 Feb 2023 12:47:30 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id sa10so12423611ejc.9;
 Tue, 07 Feb 2023 04:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=1UP1c0Dlu4x2YvknILJmW+W8GyUQk/qya9N+Pc9Hriw=;
 b=CUlYTmaGIWv521pZkGUKUrgs0Hwh6v7Ky5MO70NFK1g+qhafeuvHi3zZm6uZDN1aC8
 pdsVvv/3nTN4fRUa2b9p6ufurbDK29fT2lwnmnOSgmkZPh0bewlrclSqE/0IpPHw5/Bf
 RTghsopVb3rUcztRPN/YS0WdDaRR7MAdDTfuLwy0AEFjVWgVJMhsj0Zo9Mc6AfpPBGAe
 a+r95Z4FcgAxPEwYtmw5+tF9vIqh5K2BhzDvGokGbD2XdCsRBgoRM78kZeD8GuCQfc+S
 P0B4xg+x9kzKc5bMqeiAg6is1wt9M50XRgVXxrfKn8MM4krJ8+24H8hnvbKbsQ2rTZaB
 GyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1UP1c0Dlu4x2YvknILJmW+W8GyUQk/qya9N+Pc9Hriw=;
 b=tI2Evyn81q72l/KXWAu6PleY8PVwEpMGz4Ke0+BJMRPHU1q3VBDOVPsOsQ6q9lvwi/
 sVcfmvtI9jlanjyD+rvsJ1/ziGjMKGi+58ZZokHhZQRMuzmCzBmGU4KbaA6WKWDq3FA2
 pckU9732lns0lx29JtHDMUXlEnGJPziVOe8A9aCumUYloIR/9ZJ+S01C8S7Ca3XiJyvj
 rHli7CCOI5W88PXPm9BxY4Xy43rUZAuXN1LKT6aRS2WbzkO5+zYpgVqBdTabLIO5eVCd
 OzX+gC8aqTi803bIBGw8FfLfw9i3zwC0KBitHdQAtEpvkA0gx5XlFHlrDkARhUCTEa9P
 RsdA==
X-Gm-Message-State: AO0yUKWtaC5ohdHuQ904UL6OJ5mrH4SbJTg3ARP+Zq8PrtYaqdBcX9WH
 mMWP2wnil4H+n0tHHK7EEog=
X-Google-Smtp-Source: AK7set+kzved8crUvUwYaRiPgzI2ej4QCvnGgd4jvlz9oNXIb24TD1RfVjehgnHViKPn3DxlGovkIg==
X-Received: by 2002:a17:906:154f:b0:88a:2e57:9813 with SMTP id
 c15-20020a170906154f00b0088a2e579813mr3263336ejd.33.1675774048690; 
 Tue, 07 Feb 2023 04:47:28 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 ha4-20020a170906a88400b0088744fc7084sm6841611ejb.38.2023.02.07.04.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 04:47:28 -0800 (PST)
Date: Tue, 7 Feb 2023 14:47:11 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH v2 00/21] Enable Colorspace connector property in amdgpu
Message-ID: <20230207144711.6f70c6eb@eldfell>
In-Reply-To: <20230113162428.33874-1-harry.wentland@amd.com>
References: <20230113162428.33874-1-harry.wentland@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D4XOXl=tVHYSn/PgA7DFTmX";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 amd-gfx@lists.freedesktop.org, Joshua Ashton <joshua@froggi.es>,
 Vitaly.Prosyak@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/D4XOXl=tVHYSn/PgA7DFTmX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jan 2023 11:24:07 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> This patchset enables the DP and HDMI infoframe properties
> in amdgpu.
>=20
> The first two patches are not completely related to the rest. The
> first patch allows for HDR_OUTPUT_METADATA with EOTFs that are
> unknown in the kernel.
>=20
> The second one prints a connector's max_bpc as part of the atomic
> state debugfs print.
>=20
> The following patches rework the connector colorspace code to
> 1) allow for easy printing of the colorspace in the drm_atomic
>    state debugfs, and
> 2) allow drivers to specify the supported colorspaces on a
>    connector.
>=20
> The rest of the patches deal with the Colorspace enablement
> in amdgpu.
>=20
> Why do drivers need to specify supported colorspaces? The amdgpu
> driver needs support for RGB-to-YCbCr conversion when we drive
> the display in YCbCr. This is currently not implemented for all
> colorspaces.
>=20
> Since the Colorspace property didn't have an IGT test I added
> one to kms_hdr. The relevant patchset can be found on the IGT
> mailing list or on
> https://gitlab.freedesktop.org/hwentland/igt-gpu-tools/-/tree/hdr-colorim=
etry
>=20
> We tested v1 of the patchset and confirmed that the infoframes
> are as expected for both DP and HDMI when running the IGT
> colorimetry tests.
>=20
> Open Items
> ----------
>=20
> A couple comments from Pekka about colorspace documentation are
> left unaddressed. I hope they won't block merging this set but
> should still be addressed separately.
>=20
> Pekka's questions really got me thinking of how this colorspace
> property should be used and working with it more closely with
> Joshua who is enabling HDR in gamescope made me wonder even more.
>=20
> Uma, is there a (canonical, upstream) userspace that uses this
> property that I can look at to understand more?
>=20
> One of the key challenges that is currently not addressed is that
> userspace is expected to pick a colorspace format straight from the
> list of definitions out of the DP or HDMI spec. But the kernel
> driver are the ones deciding on the output encoding (RGB, YCBCR444,
> YCBCR420, etc.). So there is no way for userspace to decide correctly
> between, for example, BT2020_RGB, BT2020_CYCC, BT2020_YCC.
>=20
> So we end up in a scenario where gamescope sets BT2020_RGB but we
> output YCBCR444 so have to correct the colorspace value to
> BT2020_YCC. This in turn breaks the colorspace IGT tests I
> wrote. I don't think "fixing" the IGT tests to accept this is
> the right thing to do.
>=20
> The way it stands this patchset allows us to specify the output
> colorspace on amdgpu and we try to do the right thing, but I don't
> thing the way the colorspace property is defined is right. We're trying
> to expose things to userspace that should be under driver control. A
> much better approach would be to give userspace options for colorspace
> that are not tied to DP or HDMI specs, i.e., sRGB, BT709, BT2020, etc.,
> and have the driver do the right thing to fill the infoframe, e.g., by
> picking BT2020_YCC if the requested colorspace is BT2020 and the
> is YCBCR444.

Hi Harry,

well explained.

Indeed, if you want to keep the driver in control of the encoding on
the monitor cable, then your suggestion seems correct (ignoring the
question whether it breaks something existing).

I do recall something about letting userspace control the encoding on
the cable though, particularly when it affects performance or quality.
E.g. 4:2:0 sub-sampling might be wanted in some cases and unwanted in
others. It's a bit similar to bpc. The trade-off may be frame rate or
resolution. It might better to know that the hardware cannot do what
you ask, than to silently degrade. E.g. if you use sub-pixel rendering,
you really do not want 4:2:0.

That's compatible with your suggestion on changing the Colorspace
property, I think it would complement it. Cable encoding parameters
could be other properties, which might also be on "auto".

If Colorspace property cannot be changed, then options I haven't seen
discussed yet are have it force the cable encoding parameters, or
another new property replacing it.

> If no upstream userspace currently makes use of this property I
> can make that change, i.e., no longer tie the colorspace property
> directly to the infoframe and reduce the options to sRGB, BT709,
> BT601, and BT2020 (and possibly opRGB).
>=20
> v2:
> - Tested with DP and HDMI analyzers
> - Confirmed driver will fallback to lower bpc when needed
> - Dropped hunk to set HDMI AVI infoframe as it was a no-op
> - Fixed BT.2020 YCbCr colorimetry (JoshuaAshton)
> - Simplify initialization of supported colorspaces (Jani)
> - Fix kerneldoc (kernel test robot)

I recall saying this before, but in the series there are occurrences
where sRGB is spelled as "RGB". I find that very confusing that "RGB"
would imply anything about colorimetry when it's just a color model.

Sometimes it might not be sRGB because the "default RGB" has probably
not been sRGB for many years now, depending on monitor settings. See
also https://gitlab.freedesktop.org/pq/color-and-hdr/-/issues/17 . Then
one might ask the philosophical question whether the signal on the
cable is sRGB but it's just the monitor that does a gamut mapping
instead.


Thanks,
pq

>=20
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Vitaly.Prosyak@amd.com
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Michel D=C3=A4nzer <michel.daenzer@mailbox.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: amd-gfx@lists.freedesktop.org
>=20
> Harry Wentland (16):
>   drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
>   drm/connector: print max_requested_bpc in state debugfs
>   drm/connector: Drop COLORIMETRY_NO_DATA
>   drm/connector: Convert DRM_MODE_COLORIMETRY to enum
>   drm/connector: Pull out common create_colorspace_property code
>   drm/connector: Allow drivers to pass list of supported colorspaces
>   drm/connector: Print connector colorspace in state debugfs
>   drm/amd/display: Always pass connector_state to stream validation
>   drm/amd/display: Register Colorspace property for DP and HDMI
>   drm/amd/display: Signal mode_changed if colorspace changed
>   drm/amd/display: Send correct DP colorspace infopacket
>   drm/amd/display: Add support for explicit BT601_YCC
>   drm/amd/display: Add debugfs for testing output colorspace
>   drm/amd/display: Add default case for output_color_space switch
>   drm/amd/display: Don't restrict bpc to 8 bpc
>   drm/amd/display: Format input and output CSC matrix
>=20
> Joshua Ashton (5):
>   drm/amd/display: Always set crtcinfo from create_stream_for_sink
>   drm/amd/display: Fallback to 2020_YCBCR if the pixel encoding is not
>     RGB
>   drm/amd/display: Refactor avi_info_frame colorimetry determination
>   drm/amd/display: Calculate output_color_space after pixel encoding
>     adjustment
>   drm/amd/display: Fix COLOR_SPACE_YCBCR2020_TYPE matrix
>=20
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  90 ++++++---
>  .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c |  57 ++++++
>  .../drm/amd/display/dc/core/dc_hw_sequencer.c |  38 ++--
>  .../gpu/drm/amd/display/dc/core/dc_resource.c |  28 ++-
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  54 +++--
>  drivers/gpu/drm/display/drm_hdmi_helper.c     |   8 +-
>  drivers/gpu/drm/drm_atomic.c                  |   2 +
>  drivers/gpu/drm/drm_connector.c               | 189 ++++++++++--------
>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>  drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
>  include/drm/display/drm_dp.h                  |   2 +-
>  include/drm/drm_connector.h                   |  57 +++---
>  12 files changed, 345 insertions(+), 186 deletions(-)
>=20
> --
> 2.39.0
>=20


--Sig_/D4XOXl=tVHYSn/PgA7DFTmX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPiSE8ACgkQI1/ltBGq
qqdJ4Q//Z3WMWgeDrGzD76CWwKPncO8XF1mdI7TSO7O548NEoJkG7wPtAgskrKq6
M1cIqbrkFe8HZv455WnltYe5+wLB/tZI04xWVkTc8qQlV++dOeawlhqemv1xZude
ADpTE+IlwE/ksR7LAwOFgKsDja2LM6+Y0H6nLIaln4Rtrpb+YYgS71gWgoXY3MRg
FfOixPZfBHVjzor1j3Awkhh1eCH38EsRQRMzhThJCtfsgrDqQskPgHIPQVzrVtDj
Ji2LkgM5Dzk4diP6MPBc8z2UIMWk5emPBC8CcjxGuw1brP4dwrzco3CQtmAYIfaL
+zXbd0mWy34CKNiD+BOtAulDlATowjAcGhwumWe7DHSGEox8Me29QC8WJ2i2/y8O
uGT8lo3moPjeJMWL9Iv6UN/eou3okXD3Bxo7PClkKNAwQEghh2dC++Dn7KuzKSp5
kuwXeXWlyxJ0qfvr2d9J1FMamSvm/RFrsRnw0c9huHwyor5KxwZKucn9Mw0gPKHn
nRtC60TkZyz9Gs7Ol4n/inJe2o/kAlvfujbW+QcXSxsFWAwZoWhpArQkRMzBpacs
yJDyexVKOoVWtermZ2Hin5fCuhr/Mby8IXKz3c6oTBSFc39+aB8Fy7u9VUvlXG/I
jiMROOXzZaL5dZm12Zq5CuoG5RaNdBOgELaD/v6tBg7/Qxu1p70=
=Qi22
-----END PGP SIGNATURE-----

--Sig_/D4XOXl=tVHYSn/PgA7DFTmX--
