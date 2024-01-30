Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A30841997
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 03:51:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5F6112907;
	Tue, 30 Jan 2024 02:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA12112907
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 02:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1706582996;
 bh=nI4mBita6iA8xDpiKFKIuNj+Ycgew+KbDCEq7YIIirA=;
 h=Date:From:To:Cc:Subject:From;
 b=oedhXLvbsLUho7iO9/TTjHDNXbywiqeYf+Mhql9Ma2/YwmvnupmcmBq4Z0COSATOa
 bqOKesBDOhFTsrhC58juBW6AvPR6ZdNbOMbZa23+gmadRGM6ltJ25FMzkv2XjlnDNy
 DeJTd2QBHS1IlMx/mX73+JEJ9dZJ+of6QuXZuexQr7ZAglYvGAWalsE5bHb5orHojU
 tcgm71Kq2fhEwF5nJdldugIyvwyNQYBeyMHtAYKBUgyUmV7Rl0igtzxOKI/IN5ytKl
 Ien9fRtZrBYiZLHY4l3jBm/VtcUx67W4aoty5AxZQWdRCr0uot0g+7bGqrkkByHgLr
 gqsB5LqPWfaCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TP8ll3wZkz4wc3;
 Tue, 30 Jan 2024 13:49:55 +1100 (AEDT)
Date: Tue, 30 Jan 2024 13:49:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alex Deucher <alexdeucher@gmail.com>, Dave Airlie <airlied@redhat.com>,
 DRI <dri-devel@lists.freedesktop.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warnings after merge of the amdgpu tree
Message-ID: <20240130134954.04fcf763@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/6mX_kiWSiCoFKiVsyRduY3I";
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/6mX_kiWSiCoFKiVsyRduY3I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the amdgpu tree, today's linux-next build (htmldocs)
produced these warnings:

drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of =
kernel-doc format:          * @@overlap_only: Whether overlapping of differ=
ent planes is allowed.
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of =
kernel-doc format:          * @@overlap_only: Whether overlapping of differ=
ent planes is allowed.
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1: warning: no structured comme=
nts found
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of =
kernel-doc format:          * @@overlap_only: Whether overlapping of differ=
ent planes is allowed.
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function paramete=
r or struct member 'pre_multiplied_alpha' not described in 'mpcc_blnd_cfg'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function paramete=
r or struct member 'overlap_only' not described in 'mpcc_blnd_cfg'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'read_mpcc_state' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'mpc_init_single_inst' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'get_mpcc_for_dpp_from_secondary' not described in 'mpc_=
funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'get_mpcc_for_dpp' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'wait_for_idle' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'assert_mpcc_idle_before_connect' not described in 'mpc_=
funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'init_mpcc_list_from_hw' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_denorm' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_denorm_clamp' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_output_csc' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_ocsc_default' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_output_gamma' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'power_on_mpc_mem_pwr' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_dwb_mux' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'disable_dwb_mux' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'is_dwb_idle' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_out_rate_control' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_gamut_remap' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'program_1dlut' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'program_shaper' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'acquire_rmu' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'program_3dlut' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'release_rmu' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'get_mpc_out_mux' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_bg_color' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:548: warning: Function paramete=
r or struct member 'set_mpc_mem_lp_mode' not described in 'mpc_funcs'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of =
kernel-doc format:          * @@overlap_only: Whether overlapping of differ=
ent planes is allowed.
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function paramete=
r or struct member 'pre_multiplied_alpha' not described in 'mpcc_blnd_cfg'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:162: warning: Function paramete=
r or struct member 'overlap_only' not described in 'mpcc_blnd_cfg'
drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:132: warning: Incorrect use of =
kernel-doc format:          * @@overlap_only: Whether overlapping of differ=
ent planes is allowed.
Documentation/gpu/amdgpu/display/display-manager:134: drivers/gpu/drm/amd/d=
isplay/dc/inc/hw/mpc.h:3: WARNING: Duplicate C declaration, also defined at=
 gpu/amdgpu/display/dcn-blocks:100.
Documentation/gpu/amdgpu/display/display-manager:146: drivers/gpu/drm/amd/d=
isplay/dc/inc/hw/mpc.h:3: WARNING: Duplicate C declaration, also defined at=
 gpu/amdgpu/display/dcn-blocks:3.

Introduced by commit

  b8c1c3a82e75 ("Documentation/gpu: Add kernel doc entry for MPC")

--=20
Cheers,
Stephen Rothwell

--Sig_/6mX_kiWSiCoFKiVsyRduY3I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW4Y9IACgkQAVBC80lX
0Gw4XQf/Rq+HoNJdEzy50YbklXtbrHfZWcovvUP25Ov2KbjaEvw5mqb9aJGeCA2n
Ynadi0JpBtSp/YoJnUxK/J6BJdLV+Xp+FDEuZ132GWMUGoS4USETaMLi8mi91f5A
KS6o6uA90bxUchztNbdgvlLG7YdjGHKAmVbNyxU42s0TJ52mjt19N4KxlBHjWsOr
rmQ3eLwxPvFtNWisu7wMPeSaHbbJFRvVgMWrEsf8PA+81yfd03J5Chm3ROmgKc9x
HspOGJNycgvsdA8eusTs/Yj0BGg+B3NUj9/7nSld3geUyq+jikRffthG/yJVbEJ+
gjABTJKFxNXPD4p0xKVyoaEdQua5NQ==
=wJtR
-----END PGP SIGNATURE-----

--Sig_/6mX_kiWSiCoFKiVsyRduY3I--
