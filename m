Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F093AAD9012
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B2810E023;
	Fri, 13 Jun 2025 14:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oGmgGwZX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAFF10E023
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:50:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 624FCA5122E;
 Fri, 13 Jun 2025 14:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFC8C4CEE3;
 Fri, 13 Jun 2025 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749826233;
 bh=OlRopdYLDUoNVdHwF3fU+isFYmHdsc+z5amQ4RVgeNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oGmgGwZXscmyx2ihXtkgl2GFnwJogGCLCfKTK/Z219aSWrn0JPgnOjQzQ5y/N8L1t
 /t9ZVElu8ZH+S13mrFE5hcxjbkYWQimDzEKt6pH7WmZnvDCnf4iXHsnDl6oyei53Sl
 NgywzItZQcw6wYuoPR5PkS93/PyIjFYB7SGvHSgolfbfdL17YNy7T3+PspNW2Y2IiO
 xeHApnjZuMBEfpn/s60R13xyhZodxlaSYQK0q05cvdOOPsGpauZlNGOqdC38oNb84n
 0Uy0XaKkBAVMwnkyFNwI77C8D3Lh0fY7BzUWJhZ8diIXLFTYqi7Uvb6IgsDakJ5fyW
 k6kwboJz8vjkA==
Date: Fri, 13 Jun 2025 15:50:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 10/10] drm/bridge: adv7511: switch to the HDMI
 connector helpers
Message-ID: <4087f96c-a98e-4df2-b128-3f529d158ef8@sirena.org.uk>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="MnfbWetuNtj2sm0x"
Content-Disposition: inline
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-10-35651db6f19b@oss.qualcomm.com>
X-Cookie: Chess tonight.
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


--MnfbWetuNtj2sm0x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 04:59:46AM +0300, Dmitry Baryshkov wrote:
> Rewrite the ADV7511 driver to use implementation provided by the DRM
> HDMI connector framework, including the Audio and CEC bits. Drop the
> in-bridge connector support and use drm_bridge_connector if the host
> requires the connector to be provided by the bridge.

In -next I'm seeing 96kHz playback to stop working in the ALSA pcm-test
program on the avenger96 board:

# # default.time7.STM32AV96HDMI.0.0.PLAYBACK - 96kHz stereo large periods
# ok 7 # SKIP default.time7.STM32AV96HDMI.0.0.PLAYBACK
# # rate mismatch 96000 !=3D 48000

Previously the test passed.  There's also a lot of log spam introduced
due to ELD not being available (nothing is plugged into the port on the
board so this is correct, although I'm not sure the amount of logging is
justified):

[   67.091889] hdmi-audio-codec hdmi-audio-codec.1.auto: HDMI: Unknown ELD =
version 0

which I imagine is what's triggering the failure for 96kHz.  I didn't
check into things but I'm guessing the drm_bridge_connector has more
restrictive defaults than the in driver one and blocks 96kHz, I can't
see any reference to sample rates in the deleted code.

Full log:

   https://lava.sirena.org.uk/scheduler/job/1473785#L1435

A bisection points at this patch:

# bad: [bc6e0ba6c9bafa6241b05524b9829808056ac4ad] Add linux-next specific f=
iles for 20250613
# good: [afc47587aec9fbefabca94da7225f371d1f24ca5] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [2555a0fa42828dae32650b1234089d34297601cc] Merge branch 'main' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
# good: [8a5a5cecb79058b608e5562d8998123a3adb313c] ASoC: tas2781: Move the =
"include linux/debugfs.h" into tas2781.h
# good: [a4eb71ff98c4792f441f108910bd829da7a04092] regulator: rpi-panel-v2:=
 Fix missing OF dependency
# good: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] spi: spi-mt65xx: Add sup=
port for MT6991 Dimensity 9400 SPI IPM
# good: [7e10d7242ea8a5947878880b912ffa5806520705] ASoC: ops: dynamically a=
llocate struct snd_ctl_elem_value
# good: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] regulator: rpi-panel-v2:=
 Add missing GPIOLIB dependency
# good: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] regulator: rpi-panel-v2:=
 Add regulator for 7" Raspberry Pi 720x1280
# good: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] ASoC: renesas: msiof: Co=
nvert to <linux/spi/sh_msiof.h>
# good: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] ASoC: codecs: Add suppor=
t for Richtek RTQ9124
# good: [c459262159f39e6e6336797feb975799344b749b] spi: spi-pci1xxxx: Add s=
upport for 25MHz Clock frequency in C0
# good: [548d770c330cd1027549947a6ea899c56b5bc4e4] regulator: pca9450: Add =
support for mode operations
# good: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] ASOC: rockchip: Use help=
er function devm_clk_get_enabled()
# good: [267be32b0a7b70cc777f8a46f0904c92c0521d89] ASoC: remove component->=
id
# good: [f6f914893d478b7ba08e5c375de1ced16deb5e92] ASoC: dt-bindings: tas57=
xx: add tas5753 compatibility
# good: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] ASoC: imx-card: Use help=
er function for_each_child_of_node_scoped()
# good: [c95e925daa434ee1a40a86aec6476ce588e4bd77] ASoC: Intel: avs: Add rt=
5640 machine board
# good: [3461a688e79ffc37c08b19015c90239025facd88] crypto: testmgr - remove=
 crc32c context format test
# good: [9a30e332c36c52e92e5316b4a012d45284dedeb5] spi: spi-fsl-dspi: Enabl=
e support for S32G platforms
# good: [4965ef7ec15fd4b8f6f6bfb0f206e406ffdb6f6c] crypto: stm32 - remove c=
rc32 and crc32c support
# good: [ac209bde018fd320b79976657a44c23113181af6] ASoC: tas2781: Drop the =
unnecessary symbol imply
# good: [ece5d881004f041c2e1493436409dbcbea3ad5f8] ASoC: codecs: wcd939x: D=
rop unused 'struct wcd939x_priv' fields
# good: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] ASoC: codecs: wcd939x: A=
dd VDD_PX supply
# good: [38903b792f65461c3ad1a10b07489e185be39123] crypto: inside-secure - =
remove crc32 support
# good: [e6e8897995a9e6028563ce36c27877e5478c8571] ASoC: qcom: sm8250: Add =
Fairphone 5 soundcard compatible
# good: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] regmap: kunit: Constify =
regmap_range_cfg array
# good: [7e17e80c3a7eb2734795f66ba946f933412d597f] Merge branch 'for-6.14/s=
tack-order' into for-next
git bisect start 'bc6e0ba6c9bafa6241b05524b9829808056ac4ad' 'afc47587aec9fb=
efabca94da7225f371d1f24ca5' '2555a0fa42828dae32650b1234089d34297601cc' '8a5=
a5cecb79058b608e5562d8998123a3adb313c' 'a4eb71ff98c4792f441f108910bd829da7a=
04092' '6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3' '7e10d7242ea8a5947878880b=
912ffa5806520705' 'd6fa0ca959db8efd4462d7beef4bdc5568640fd0' 'd49305862fdc4=
d9ff1b1093b4ed7d8e0cb9971b4' '6ba68e5aa9d5d15c8877a655db279fcfc0b38b04' '1f=
5cdb6ab45e1c06ae0953609acbb52f8946b3e8' 'c459262159f39e6e6336797feb97579934=
4b749b' '548d770c330cd1027549947a6ea899c56b5bc4e4' '03b778d1994827ea5cc971d=
bdfbb457bbb7bfa5d' '267be32b0a7b70cc777f8a46f0904c92c0521d89' 'f6f914893d47=
8b7ba08e5c375de1ced16deb5e92' '111a2c8ab462d77d1519b71b46f13ae1b46920b4' 'c=
95e925daa434ee1a40a86aec6476ce588e4bd77' '3461a688e79ffc37c08b19015c9023902=
5facd88' '9a30e332c36c52e92e5316b4a012d45284dedeb5' '4965ef7ec15fd4b8f6f6bf=
b0f206e406ffdb6f6c' 'ac209bde018fd320b79976657a44c23113181af6' 'ece5d881004=
f041c2e1493436409dbcbea3ad5f8' 'b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68' '=
38903b792f65461c3ad1a10b07489e185be39123' 'e6e8897995a9e6028563ce36c27877e5=
478c8571' 'c8c4694ede7ed42d8d4db0e8927dea9839a3e248' '7e17e80c3a7eb2734795f=
66ba946f933412d597f'
# test job: [2555a0fa42828dae32650b1234089d34297601cc] https://lava.sirena.=
org.uk/scheduler/job/1473852
# test job: [8a5a5cecb79058b608e5562d8998123a3adb313c] https://lava.sirena.=
org.uk/scheduler/job/1471730
# test job: [a4eb71ff98c4792f441f108910bd829da7a04092] https://lava.sirena.=
org.uk/scheduler/job/1468970
# test job: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] https://lava.sirena.=
org.uk/scheduler/job/1468826
# test job: [7e10d7242ea8a5947878880b912ffa5806520705] https://lava.sirena.=
org.uk/scheduler/job/1465979
# test job: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] https://lava.sirena.=
org.uk/scheduler/job/1464722
# test job: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] https://lava.sirena.=
org.uk/scheduler/job/1463087
# test job: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] https://lava.sirena.=
org.uk/scheduler/job/1463358
# test job: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] https://lava.sirena.=
org.uk/scheduler/job/1462946
# test job: [c459262159f39e6e6336797feb975799344b749b] https://lava.sirena.=
org.uk/scheduler/job/1460673
# test job: [548d770c330cd1027549947a6ea899c56b5bc4e4] https://lava.sirena.=
org.uk/scheduler/job/1460099
# test job: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] https://lava.sirena.=
org.uk/scheduler/job/1460832
# test job: [267be32b0a7b70cc777f8a46f0904c92c0521d89] https://lava.sirena.=
org.uk/scheduler/job/1460282
# test job: [f6f914893d478b7ba08e5c375de1ced16deb5e92] https://lava.sirena.=
org.uk/scheduler/job/1460225
# test job: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] https://lava.sirena.=
org.uk/scheduler/job/1461355
# test job: [c95e925daa434ee1a40a86aec6476ce588e4bd77] https://lava.sirena.=
org.uk/scheduler/job/1460941
# test job: [3461a688e79ffc37c08b19015c90239025facd88] https://lava.sirena.=
org.uk/scheduler/job/1467196
# test job: [9a30e332c36c52e92e5316b4a012d45284dedeb5] https://lava.sirena.=
org.uk/scheduler/job/1461782
# test job: [4965ef7ec15fd4b8f6f6bfb0f206e406ffdb6f6c] https://lava.sirena.=
org.uk/scheduler/job/1467179
# test job: [ac209bde018fd320b79976657a44c23113181af6] https://lava.sirena.=
org.uk/scheduler/job/1460722
# test job: [ece5d881004f041c2e1493436409dbcbea3ad5f8] https://lava.sirena.=
org.uk/scheduler/job/1460323
# test job: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] https://lava.sirena.=
org.uk/scheduler/job/1460237
# test job: [38903b792f65461c3ad1a10b07489e185be39123] https://lava.sirena.=
org.uk/scheduler/job/1467291
# test job: [e6e8897995a9e6028563ce36c27877e5478c8571] https://lava.sirena.=
org.uk/scheduler/job/1460745
# test job: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] https://lava.sirena.=
org.uk/scheduler/job/1461037
# test job: [7e17e80c3a7eb2734795f66ba946f933412d597f] https://lava.sirena.=
org.uk/scheduler/job/1466743
# test job: [bc6e0ba6c9bafa6241b05524b9829808056ac4ad] https://lava.sirena.=
org.uk/scheduler/job/1473785
# bad: [bc6e0ba6c9bafa6241b05524b9829808056ac4ad] Add linux-next specific f=
iles for 20250613
git bisect bad bc6e0ba6c9bafa6241b05524b9829808056ac4ad
# test job: [bbd6649089ac4a8f80ee112f6ac3d08f01a8a717] https://lava.sirena.=
org.uk/scheduler/job/1474393
# bad: [bbd6649089ac4a8f80ee112f6ac3d08f01a8a717] Merge branch 'for-linux-n=
ext' of https://gitlab.freedesktop.org/drm/i915/kernel
git bisect bad bbd6649089ac4a8f80ee112f6ac3d08f01a8a717
# test job: [c5b4393c5492555e35c08677a326c9c53b275abd] https://lava.sirena.=
org.uk/scheduler/job/1474545
# bad: [c5b4393c5492555e35c08677a326c9c53b275abd] drm/file: add client id t=
o drm_file_error
git bisect bad c5b4393c5492555e35c08677a326c9c53b275abd
# test job: [33a46dab18c92da612778b115a600578fa4d42e1] https://lava.sirena.=
org.uk/scheduler/job/1474646
# bad: [33a46dab18c92da612778b115a600578fa4d42e1] drm/xe: Fix NPD when savi=
ng default context
git bisect bad 33a46dab18c92da612778b115a600578fa4d42e1
# test job: [3f08c356b881d3d6302de207a98ceec1c511159e] https://lava.sirena.=
org.uk/scheduler/job/1474667
# bad: [3f08c356b881d3d6302de207a98ceec1c511159e] panel/novatek-nt35510: Us=
e refcounted allocation in place of devm_kzalloc()
git bisect bad 3f08c356b881d3d6302de207a98ceec1c511159e
# test job: [cb8d4323302c7ad6b8baa1f5ca29f6186b30f316] https://lava.sirena.=
org.uk/scheduler/job/1474692
# good: [cb8d4323302c7ad6b8baa1f5ca29f6186b30f316] dt-bindings: display: ti=
,am65x-dss: Add support for AM62L DSS
git bisect good cb8d4323302c7ad6b8baa1f5ca29f6186b30f316
# test job: [c53c3e87aeb7fc288dcb9dbdb22451e8721771e1] https://lava.sirena.=
org.uk/scheduler/job/1474709
# bad: [c53c3e87aeb7fc288dcb9dbdb22451e8721771e1] panel/himax-hx8394: Use r=
efcounted allocation in place of devm_kzalloc()
git bisect bad c53c3e87aeb7fc288dcb9dbdb22451e8721771e1
# test job: [8b1a8f8b2002d31136d83e4d730b4cb41e9ee868] https://lava.sirena.=
org.uk/scheduler/job/1474722
# good: [8b1a8f8b2002d31136d83e4d730b4cb41e9ee868] drm/display: add CEC hel=
pers code
git bisect good 8b1a8f8b2002d31136d83e4d730b4cb41e9ee868
# test job: [ae01d3183d2763ed27ab71f4ef5402b683d9ad8a] https://lava.sirena.=
org.uk/scheduler/job/1474737
# bad: [ae01d3183d2763ed27ab71f4ef5402b683d9ad8a] drm/bridge: adv7511: swit=
ch to the HDMI connector helpers
git bisect bad ae01d3183d2763ed27ab71f4ef5402b683d9ad8a
# test job: [65a2575a68e4ff03ba887b5aef679fc95405fcd2] https://lava.sirena.=
org.uk/scheduler/job/1474761
# good: [65a2575a68e4ff03ba887b5aef679fc95405fcd2] drm/display: bridge-conn=
ector: hook in CEC notifier support
git bisect good 65a2575a68e4ff03ba887b5aef679fc95405fcd2
# test job: [a74288c8ded7c34624e50b4aa8ca37ae6cc03df4] https://lava.sirena.=
org.uk/scheduler/job/1474772
# good: [a74288c8ded7c34624e50b4aa8ca37ae6cc03df4] drm/display: bridge-conn=
ector: handle CEC adapters
git bisect good a74288c8ded7c34624e50b4aa8ca37ae6cc03df4
# first bad commit: [ae01d3183d2763ed27ab71f4ef5402b683d9ad8a] drm/bridge: =
adv7511: switch to the HDMI connector helpers

--MnfbWetuNtj2sm0x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMOrEACgkQJNaLcl1U
h9D+owf/X8/1aic5Itzq+a36eWKsQXsICwsbQultkKDB9P4Gs9QWG4aENLej2HlB
T2SmA3nd+RKRP4sjaFqAfia4TUUcmSEXLOGErczvdLBj8a4UOtHjizs9T4nhMs7J
szQ9WmIkAEm7/z++2ACtRhuK7jxzekE63zwYvqAgI8PKwmYTDHCwQgKuPY9TfON+
m67jnM/SA75KUyhRJefGMxoT4r7JY+Ot+vDQLa2+SZByvTvw2i1NTxNCAE4Ato5/
SNNoEMl08WaCjC1dBMEAIJGnWRc5PRZLAgDtt2UOrZigSw0ZMCE/+ZrLMQ+AoaQS
4RbTc7pE8a0aDEMMc+fpePQBYvODAA==
=ru7l
-----END PGP SIGNATURE-----

--MnfbWetuNtj2sm0x--
