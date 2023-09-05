Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA081792419
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 17:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F4A10E0B0;
	Tue,  5 Sep 2023 15:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C619410E096;
 Tue,  5 Sep 2023 15:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8quAqpljo/jRER21FUZPLZ93nrzXaShq50UknxMppt0=; b=fI/hpGOrXuhXRJGBdYOFrvleWT
 FCGqtiSooll+b+OcmY5Y7FXineVsz3a/XZdPUutcE+SRlRyY9RD6aUSApfj6u3H90Vu756OQritAS
 u2aHkq/UoHGN52dbWuITKy/PHimXJlfnlEdW+ZNnJZzmtXxDNMeVvZfApdPBrmQcf4AbvuSfvJ4/s
 b44Zdytr3g9m+0xWmf433wNICqL8oHhJgK72wNsnljA5IkX//UoJVIuKOlc9wkDpqBdkKVFn1iCp5
 7dccFlUdk+7rMJ2OWF4wdoDpH8bWbePjIFN54dygWKAsto4gqYzeHLzVrfQ1AYDJ189aVArXXpZtu
 T2wPZXAw==;
Received: from [38.44.68.151] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdYHl-002eoe-3Q; Tue, 05 Sep 2023 17:48:13 +0200
Date: Tue, 5 Sep 2023 14:47:39 -0100
From: Melissa Wen <mwen@igalia.com>
To: Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 airlied@gmail.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, daniel@ffwll.ch, Xinhui.Pan@amd.com
Subject: Re: [RFC PATCH 0/5] drm/amd/display: improve DTN color state log
Message-ID: <20230905154739.2fe3xpxcvbf3b4u2@mail.igalia.com>
References: <20230905142545.451153-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wdvlkmtknvjvlsdb"
Content-Disposition: inline
In-Reply-To: <20230905142545.451153-1-mwen@igalia.com>
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--wdvlkmtknvjvlsdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/05, Melissa Wen wrote:
> Hi,
>=20
> I'm updating the color state part of DTN log to match DCN3.0 HW better.
> Currently, the DTN log considers the DCN10 color pipeline, which is
> useless for DCN3.0 because of all the differences in color caps between
> DCN versions. In addition to new color blocks and caps, some semantic
> differences made the DCN10 output not fit DCN30.
>=20
> In this RFC, the first patch adds new color state elements to DPP and
> implements the reading of registers according to HW blocks. Similarly to
> MPC, the second patch also creates a DCN3-specific function to read the
> MPC state and add the MPC color state logging to it. With DPP and MPC
> color-register reading, I detach DCN10 color state logging from the HW
> log and create a `.log_color_state` hook for logging color state
> according to HW color blocks with DCN30 as the first use case. Finally,
> the last patch adds DPP and MPC color caps output to facilitate
> understanding of the color state log.
>=20
> This version works well with the driver-specific color properties[1] and
> steamdeck/gamescope[2] together, where we can see color state changing
> from default values.

For comparison, here is the before and after of DPP and MPC section in
the DTN log on Steam Deck + driver-specific color properties:

Without this series:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
DPP:    IGAM format  IGAM mode    DGAM mode    RGAM mode  GAMUT mode  C11 C=
12   C13 C14   C21 C22   C23 C24   C31 C32   C33 C34
[ 0]:            0h  BypassFixed  Bypass       Bypass            0    00000=
000h 00000000h 00000000h 00000000h 00000000h 00000000h
[ 3]:            0h  BypassFixed  Bypass       Bypass            0    00000=
000h 00000000h 00000000h 00000000h 00000000h 00000000h

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE
[ 0]:   0h   0h       3h     3           2        0             0     0
[ 3]:   0h   3h       fh     2           2        0             0     0


With this series (Steamdeck/Gamescope):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit=
 depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C2=
3 C24   C31 C32   C33 C34
[ 0]:        1           sRGB    Bypass        RAM B       RAM A           =
12-bit    17x17x17     Bypass           0  00000000h 00000000h 00000000h 00=
000000h 00000000h 00000000h
[ 3]:        1           sRGB    Bypass        RAM B       RAM A           =
12-bit    17x17x17     Bypass           0  00000000h 00000000h 00000000h 00=
000000h 00000000h 00000000h

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt=
2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_=
lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SH=
APER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GA=
MUT mode  C11 C12   C33 C34
[ 0]:   0h   0h       3h     3           2        0             0     0    =
   Bypass      Bypass           12-bit    17x17x17     Bypass         A    =
       0 00000000h 00000000h
[ 3]:   0h   3h       fh     2           2        0             0     0    =
   Bypass      Bypass           12-bit    17x17x17     Bypass         A    =
       0 00000000h 00000000h

MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1

With this series (Steamdeck/KDE):
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

DPP:  DGAM ROM  DGAM ROM type  DGAM LUT  SHAPER mode  3DLUT mode  3DLUT bit=
 depth  3DLUT size  RGAM mode  GAMUT mode  C11 C12   C13 C14   C21 C22   C2=
3 C24   C31 C32   C33 C34
[ 0]:        0           sRGB    Bypass       Bypass      Bypass           =
12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00=
000000h 00000000h 00000000h
[ 3]:        0           sRGB    Bypass       Bypass      Bypass           =
12-bit       9x9x9     Bypass           0  00000000h 00000000h 00000000h 00=
000000h 00000000h 00000000h

DPP Color Caps: input_lut_shared:0  icsc:1  dgam_ram:0  dgam_rom: srgb:1,bt=
2020:1,gamma2_2:1,pq:1,hlg:1  post_csc:1  gamcor:1  dgam_rom_for_yuv:0  3d_=
lut:1  blnd_lut:1  oscs:0

MPCC:  OPP  DPP  MPCCBOT  MODE  ALPHA_MODE  PREMULT  OVERLAP_ONLY  IDLE  SH=
APER mode  3DLUT_mode  3DLUT bit-depth  3DLUT size  OGAM mode  OGAM LUT  GA=
MUT mode  C11 C12   C33 C34
[ 0]:   0h   0h       3h     3           2        0             0     0    =
   Bypass      Bypass           12-bit    17x17x17        RAM         A    =
       1 00002000h 00002000h
[ 3]:   0h   3h       fh     2           2        0             0     0    =
   Bypass      Bypass           12-bit    17x17x17     Bypass         A    =
       0 00000000h 00000000h

MPC Color Caps: gamut_remap:1, 3dlut:2, ogam_ram:1, ocsc:1

>=20
> Before extending it to other DCN families, I have some doubts. Does this
> approach of the `.log_color_state` hook make sense for you? Is there any
> conflict between logging color state by HW version and DTN log usage? Is
> there a template/style for DTN log output that I should follow?
>=20
> Let me know your thoughts.
>=20
> Thanks,
>=20
> Melissa
>=20
> [1] https://lore.kernel.org/amd-gfx/20230810160314.48225-1-mwen@igalia.co=
m/
> [2] https://github.com/ValveSoftware/gamescope
>=20
> Melissa Wen (5):
>   drm/amd/display: detach color state from hw state logging
>   drm/amd/display: fill up DCN3 DPP color state
>   drm/amd/display: create DCN3-specific log for MPC state
>   drm/amd/display: hook DCN30 color state logging to DTN log
>   drm/amd/display: add DPP and MPC color caps to DTN log
>=20
>  .../amd/display/dc/dcn10/dcn10_hw_sequencer.c |  53 +++++++--
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c  |  28 ++++-
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    | 112 ++++++++++++++++++
>  .../drm/amd/display/dc/dcn30/dcn30_hwseq.h    |   3 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_init.c |   1 +
>  .../gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c  |  55 ++++++++-
>  .../drm/amd/display/dc/dcn301/dcn301_init.c   |   1 +
>  drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |   8 ++
>  drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |  13 ++
>  .../gpu/drm/amd/display/dc/inc/hw_sequencer.h |   2 +
>  10 files changed, 264 insertions(+), 12 deletions(-)
>=20
> --=20
> 2.40.1
>=20
>=20

--wdvlkmtknvjvlsdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmT3TZQACgkQwqF3j0dL
ehyzjBAAtqkNC6XCSOD8H6tCe16Btv69XuZYrzGMaktE01FsBs7DDDcSTZ0wPXFi
Lcd3valY+od7ZMBsUQo4Eh/MFfcO+g3V9KhB9rHvh9VOzl7ZSSnS93nlqL8aESLU
2sNeuvtVX2Fmy7hXbklI9ot4gtbt0jrs9Lih2q1C0s4PKUJ3kYHMvxnR18zKa2uF
8DyP5AAEBR0J2itlr4bPA7ZKBPo3Ps8dn7LS0S57tkGSaFu3PplnLf71sx2TZfnE
Q5mhwXRrPliLSe9ZB5wt5+WiV/8c03Z/uP+158Q8Z5hEbHAi0jWPdiU6eKHam//K
UaVk2/l1d1mvq3z2wFjRJ9cWNTjv+h7CrEq/UIckfwwb/kmInxASqUbD8oYBqeNc
0KQc7QebZFGuTS55lsrSrAZPzIWJTIKx31TU38VllxitH1dKGmYopf/VwEkNzF14
V7G1Wz7A4YWi5FGsKMLEKFV6dVmteWe7dBUGYmb5ibieGqq/fDshkAZ3f0ZhC7OX
k1ODkWsv69bDCiHY7pQi9BNCOQkfjwZHPjeeTR+1Mg9Apyyr6wWpjQQ/uBt+4fCo
bvjV62VljuL4HEZrK8a1X/SqAZNMfCLn4LSAnTZIMzQM14hlJFKeUi68ioRzVw/A
RoDw1nUrvkUoAoRN1CES6O0UtON1eObKg4G9zLIVFAUKcEHXQfM=
=NkW7
-----END PGP SIGNATURE-----

--wdvlkmtknvjvlsdb--
