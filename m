Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4853C341759
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 09:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F11F6E99A;
	Fri, 19 Mar 2021 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6656E9A6
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD661AE56;
 Fri, 19 Mar 2021 08:24:46 +0000 (UTC)
Subject: Re: [PATCH v2 0/5] drm/vc4: hdmi: Support the 4k @ 60Hz modes
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20210318092917.831995-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f407de9e-d9e0-e627-1e4c-681e9581ab93@suse.de>
Date: Fri, 19 Mar 2021 09:24:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210318092917.831995-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============0337770906=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0337770906==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Oe963tpKBIrBH2OTk525vEiAXuVMIBG6V"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Oe963tpKBIrBH2OTk525vEiAXuVMIBG6V
Content-Type: multipart/mixed; boundary="HZD9DDhN8ihRssUlpkovv3EKqV13hrCLp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Daniel Vetter
 <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Message-ID: <f407de9e-d9e0-e627-1e4c-681e9581ab93@suse.de>
Subject: Re: [PATCH v2 0/5] drm/vc4: hdmi: Support the 4k @ 60Hz modes
References: <20210318092917.831995-1-maxime@cerno.tech>
In-Reply-To: <20210318092917.831995-1-maxime@cerno.tech>

--HZD9DDhN8ihRssUlpkovv3EKqV13hrCLp
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

I looked through the patches. I can't say much about the technical side, =

but for the patches themselves

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

Just one nit: I've seen the pattern

   (mode->clock * 1000) < HDMI_14_MAX_TMDS_CLK

in several places. I suggest to add a little helper with a descriptive na=
me.

Best regards
Thomas

Am 18.03.21 um 10:29 schrieb Maxime Ripard:
> Hi,
>=20
> Here is a series that enables the higher resolutions on the HDMI0 Contr=
oller
> found in the BCM2711 (RPi4).
>=20
> In order to work it needs a few adjustments to config.txt, most notably=
 to
> enable the enable_hdmi_4kp60 option.
>=20
> The firmware also has a glitch at the moment and will not properly rele=
ase the
> BSC controllers, which will make the EDID retrieval fail.
>=20
> We can work around this using the following config.txt options:
>=20
> disable_fw_kms_setup=3D1
> hdmi_edid_file:0=3D1
> hdmi_edid_filename:0=3D1366x768.bin
> hdmi_ignore_edid:0=3D1
> hdmi_edid_file:1=3D1
> hdmi_edid_filename:1=3D1366x768.bin
> hdmi_ignore_edid:1=3D1
>=20
> A fix will come for the firmware eventually.
>=20
> Let me know what you think,
> Maxime
>=20
> ---
>=20
> Changes from v1:
>    - Dropped the range accessors
>    - Drop the mention of force_turbo
>    - Reordered the SCRAMBLER_CTL register to match the offset
>    - Removed duplicate HDMI_14_MAX_TMDS_CLK define
>    - Warn about enable_hdmi_4kp60 only if there's some modes that can't=
 be reached
>    - Rework the BVB clock computation
>=20
> Maxime Ripard (5):
>    drm/vc4: hvs: Make the HVS bind first
>    drm/vc4: hdmi: Properly compute the BVB clock rate
>    drm/vc4: hdmi: Check and warn if we can't reach 4kp60 frequencies
>    drm/vc4: hdmi: Enable the scrambler
>    drm/vc4: hdmi: Raise the maximum clock rate
>=20
>   drivers/gpu/drm/vc4/vc4_drv.c       |  11 ++-
>   drivers/gpu/drm/vc4/vc4_hdmi.c      | 101 +++++++++++++++++++++++++--=
-
>   drivers/gpu/drm/vc4/vc4_hdmi.h      |   8 +++
>   drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   3 +
>   4 files changed, 113 insertions(+), 10 deletions(-)
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--HZD9DDhN8ihRssUlpkovv3EKqV13hrCLp--

--Oe963tpKBIrBH2OTk525vEiAXuVMIBG6V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBUX80FAwAAAAAACgkQlh/E3EQov+BI
dBAAh46H2lED9nVWjp07+GVsAmr9p+bsV3fB5ORqiV8OOS2SgYigBjrG078p6U8JkpaZnPwD27Qw
SRH6IRFO9ybWo5Y+uRQoeMEEuncnrX7iGUZtotOgOq/FlkkcWCI5trifLlWPHc73ZCp2sZKwyJGa
frbXvwcfT+LNDGl4BG3uxKY33AkJfXY9aPxj4yB+EpfjKEykCFUcURONRWWFvi547pfrobI4n/gK
OxR98TciRBCZgoG11msVnXE/VXdDxR34/No50dX4vkCf34balbXYpxzyPhohn7ipQKF+U1L+CLZv
swMrCnanlpzbq3YVYvXxzW+p8zweFBoXEvRywtwv38FaRYjFYHqWfW+EKU2dyn9UaM/UbV7im4O3
L7jimDLk51NZXUribdCJJ0kD72dh1RzRVLU8VcgVgBgevhfLYJ2RuAmDzh4OeSZpEOYA0E0nwRwo
u9I3+2hQvnKnaAZy47YhmDXzRnbMr92lAxGsyC5vdbQcUucgT2yA4XmeOze90V14oHbaeJQCQj2C
KsF4822Qk6edjWRmYXgF7wCv9G8djlp5Dvh8iS57xiQTvfERTPjxx/IycqdSo8m4rtfscyX5rqiG
2DtaIPj+j5yWlDu61NCGOEgilOrY0pHMlTL2wVf7uFmipwvT1yRwXOtPAZP+CJ8dBUsF1tRnnv3K
UH4=
=x12K
-----END PGP SIGNATURE-----

--Oe963tpKBIrBH2OTk525vEiAXuVMIBG6V--

--===============0337770906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0337770906==--
