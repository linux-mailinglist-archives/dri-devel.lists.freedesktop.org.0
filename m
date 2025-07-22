Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD01B0DB25
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 15:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D5C10E6A2;
	Tue, 22 Jul 2025 13:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oHrg2t95";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DD410E69E;
 Tue, 22 Jul 2025 13:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E8E75C6557;
 Tue, 22 Jul 2025 13:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DA8C4CEEB;
 Tue, 22 Jul 2025 13:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753191712;
 bh=SVgWw4uBQO41q6WIYZfuMwJYLn1zR899jGT3WCaQrjA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oHrg2t95yOmiHS/UScB3B44TRU8qx9VeuBgFmOvaxgOrJR0ZXl3yvV0o35JdVV0tj
 hzH5KQRugQnU0UwPhoBgZ7qRTAAaVYWOdJRSsIeftI+dztXune3nZk+1Y+kJN8Zw01
 1hOYBmiEMwBVKoa6MuTkCPz15v/ge3COmAOc+PxDu09gZdktQg64siLSFEKMizvadR
 6TVMiJcP1NuQHUaOWNZ1KXt6BCH7PrDB/QN2RqwMIBFFHnLoOQWutT9PgpASZSIAAw
 TF+A0NkGJdGJBk/UMMdWuo4ECy2Z8BhRmnGP54KtMUnBaGXT4vGqjkdWmUFtf7gPJR
 iAYYjO3igWz7Q==
Date: Tue, 22 Jul 2025 14:41:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Message-ID: <98b3a62c-91ff-4f91-a58b-e1265f84180b@sirena.org.uk>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-20-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="E/TxTBd074gy4AKx"
Content-Disposition: inline
In-Reply-To: <20250701090722.13645-20-ville.syrjala@linux.intel.com>
X-Cookie: I don't understand you anymore.
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


--E/TxTBd074gy4AKx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01, 2025 at 12:07:22PM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
>=20
> Now that everyone passes along the format info to
> drm_helper_mode_fill_fb_struct() we can make this behaviour
> mandatory and drop the extra lookup.

This patch, which is in -next as 41ab92d35ccd2d66, appears to be
triggering warnings on TI x15 boards:

[   11.866027] [drm] Initialized omapdrm 1.0.0 for omapdrm.0 on minor 0
[   11.891723] omapdss error: HDMI I2C Master Error
[   11.896575] ------------[ cut here ]------------
[   11.901245] WARNING: drivers/gpu/drm/drm_framebuffer.c:870 at drm_frameb=
uffer_init+0x1f0/0x260, CPU#1: udevd/159

=2E..

[   11.941406]  drm_framebuffer_init from omap_framebuffer_init+0x1b8/0x24c=
 [omapdrm]
[   11.941497]  omap_framebuffer_init [omapdrm] from omap_fbdev_driver_fbde=
v_probe+0x150/0x3c0 [omapdrm]
[   11.941619]  omap_fbdev_driver_fbdev_probe [omapdrm] from __drm_fb_helpe=
r_initial_config_and_unlock+0x300/0x58c
[   11.941711]  __drm_fb_helper_initial_config_and_unlock from drm_fbdev_cl=
ient_hotplug+0x6c/0xb0
[   11.941711]  drm_fbdev_client_hotplug from drm_client_register+0x54/0x90
[   11.941741]  drm_client_register from drm_fbdev_client_setup+0xa4/0x1bc
[   11.941741]  drm_fbdev_client_setup from drm_client_setup+0xa0/0xc8
[   11.941772]  drm_client_setup from pdev_probe+0x628/0x704 [omapdrm]
[   11.941833]  pdev_probe [omapdrm] from platform_probe+0x5c/0x90

Full log:

   https://validation.linaro.org/scheduler/job/4174082#L813

A git bisect identified this commit as triggering the issue:

# bad: [05adbee3ad528100ab0285c15c91100e19e10138] Add linux-next specific f=
iles for 20250722
# good: [bc3aa02f578a02ecf5e53929d8d6902377c14f2e] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [17882721dcb49323eaa9728d7eaa2ae826c876f7] ASoC: SDCA: add route by=
 the number of input pins in MU entity
# good: [d60f7cab7c04944a79af16caa43c141e780a59c6] spi: spidev: Add an entr=
y for the ABB spi sensors
# good: [d511206dc7443120637efd9cfa3ab06a26da33dd] regulator: core: repeat =
voltage setting request for stepped regulators
# good: [c2a08479b5f8b41f62f1a4984cb78c80c0cb66cb] Merge branches 'intel/vt=
-d', 'amd/amd-vi', 'mediatek', 'ti/omap', 'apple/dart', 'arm/smmu/bindings'=
 and 'arm/smmu/updates' into next
# good: [951a6d8d41289b86a564ee5563ededa702b62b1b] spi: stm32-ospi: Fix NUL=
L vs IS_ERR() bug in stm32_ospi_get_resources()
# good: [03aa2ed9e187e42f25b3871b691d535fc19156c4] ASoC: Intel: sof_rt5682:=
 Add HDMI-In capture with rt5682 support for PTL.
# good: [63be976da994260ea116c431a2e61485dbede1b0] regulator: rt6160: Add r=
t6166 vout min_uV setting for compatible
# good: [d929cc75e9791def049a90998aaab8934196131c] spi: gpio: Use explicit =
'unsigned int' for parameter types
# good: [8778837f0a5b7c1bc5dbf0cccd7619fec6981588] ASoC: codec: tlv320aic32=
x4: Fix reset GPIO check
# good: [d5255ae7ec48ac1f702e95b472801dbb7bf1e97f] spi: dt-bindings: spi-mu=
x: Drop "spi-max-frequency" as required
# good: [4ed357f72a0e0a691304e5f14a3323811c8ce862] ASoC: SDCA: Add hw_param=
s() helper function
# good: [7e477e9c4eb412cbcaeae3ed4fff22035dc943eb] clocksource/drivers/exyn=
os_mct: Fix section mismatch from the module conversion
# good: [d9f334fca5448907cc47ba8553926f9ba148512f] MAINTAINERS: add regulat=
or.rs to the regulator API entry
# good: [15247b5a63f506125360fa45d7aa1fbe8b903b95] ASoC: SDCA: Update memor=
y allocations to zero initialise
# good: [d5f317fd5cd9dfdf5bbe11384001817760c12b75] ASoC: stm: stm32_sai_sub=
: convert from round_rate() to determine_rate()
# good: [6f8584a4826f01a55d3d0c4bbad5961f1de52fc9] spi: st: Switch from CON=
FIG_PM_SLEEP guards to pm_sleep_ptr()
# good: [a1d87a3586152f52856b449c4787f21cb35d430f] docs: dt: writing-bindin=
gs: Document compatible and filename naming
# good: [43728a6434f9eca0385fd180d8452a5071678a5b] regulator: tps6286x-regu=
lator: Fix a copy & paste error
# good: [6beda760db7eb6b06cdbf77d4749af0bf9aca1e0] Merge ras/edac-drivers i=
nto for-next
# good: [790d5f8ee6f2a27686d042abbce16b4e03ac1608] ASoC: codec: tlv320aic32=
x4: Convert to GPIO descriptors
# good: [af241e3fa4d823f8af899c92fd50d020816a1860] ASoC: fsl-asoc-card: add=
 sysclk_ratio for calculate sysclk frequency
# good: [f00e06296ba3f0d8440030afe8cc2258758b7af7] ASoC: samsung: littlemil=
l: don't set dapm->bias_level directly
# good: [3aa47d2ec83316c24e1ed15a492b331802dc6a69] regulator: qcom-rpmh: ad=
d support for pm7550 regulators
# good: [5030abcb0aa3304bf91497844ffa9607a2d4ad5d] ASoC: SDCA: Pull HID and=
 IRQ into the primary SDCA module
# good: [7d61715c58a39edc5f74fc7366487726fc223530] spi: rspi: Convert to DE=
FINE_SIMPLE_DEV_PM_OPS()
# good: [b30d390812c8559c5835f8ae5f490b38488fafc8] regulator: tps6594-regul=
ator: Add TI TPS652G1 PMIC regulators
# good: [ad4655653a6c463026ed3c300e5fb34f39abff48] ASoC: SDCA: fix HID depe=
ndency
# good: [c61da55412a08268ea0cdef99dea11f7ade934ee] ASoC: sdw_utils: Add mis=
sed component_name strings for speaker amps
# good: [68e4dadacb7faa393b532b41bbf99a2dbfec3b1b] ASoC: img: Imagination T=
echnologies sound should depend on MIPS
# good: [defe01abfb7f5c5bd53c723b8577d4fcd64faa5a] spi: stm32-ospi: Use of_=
reserved_mem_region_to_resource() for "memory-region"
# good: [86ccd4d3e8bc9eeb5dde4080fcc67e0505d1d2c6] ASoC: Intel: soc-acpi-in=
tel-lnl-match: add rt1320_l12_rt714_l0 support
# good: [67bdd67aedcec8c63e3158c3c82991fbde0c4d22] ASoC: rt715: don't set d=
apm->bias_level
# good: [5054740e0092aac528c0589251f612b3b41c9e7b] regulator: sy8827n: make=
 enable gpio NONEXCLUSIVE
# good: [08dc0f5cc26a203e8008c38d9b436c079e7dbb45] ASoC: soc-dapm: add pref=
ix on soc_dapm_dev_attrs
# good: [2fca750160f29015ab1109bb478537a4e415f7cd] spi: Remove redundant pm=
_runtime_mark_last_busy() calls
# good: [571defe0dff3f1e4180bd0db79283d3d5bf74a71] ASoC: codec: rockchip_sa=
i: Remove including of_gpio.h
# good: [2bd9648d5a8d329ca734ca2c273a80934867471e] ASoC: SOF: Remove redund=
ant pm_runtime_mark_last_busy() calls
# good: [c61e94e5e4e6bc50064119e6a779564d1d2ac0e7] regulator: stm32-vrefbuf=
: Remove redundant pm_runtime_mark_last_busy() calls
# good: [bc163baef57002c08b3afe64cdd2f55f55a765eb] ASoC: Use of_reserved_me=
m_region_to_resource() for "memory-region"
# good: [9f711c9321cffe3e03709176873c277fa911c366] regmap: get rid of redun=
dant debugfs_file_{get,put}()
# good: [baee26a9d6cd3d3c6c3c03c56270aa647a67e4bd] ASoC: fsl_mqs: rename sy=
stem manager indices for i.MX95
# good: [7105fdd54a14bee49371b39374a61b3c967d74cb] spi: dt-bindings: Conver=
t marvell,orion-spi to DT schema
# good: [913bf8d50cbd144c87e9660b591781179182ff59] spi: spi-qpic-snand: add=
 support for 8 bits ECC strength
# good: [34d340d48e595f8dfd4e72fe4100d2579dbe4a1a] ASoC: qcom: sc8280xp: Ad=
d support for QCS8275
# good: [0c0ef1d90967717b91cded41b00dbae05d8e521c] ASoC: amd: acp: Enable a=
cp7.2 platform based DMIC support in machine driver
# good: [3fcd3d2fe44dc9dfca20b6aed117f314a50ba0ff] spi: offload trigger: ad=
d ADI Util Sigma-Delta SPI driver
# good: [244bc18e5f1875401a4af87d2eae3f9376d9d720] spi: stm32: delete stray=
 tabs in stm32h7_spi_data_idleness()
# good: [7e1c28fbf235791cb5046fafdac5bc16fe8e788d] spi: spi-pci1xxxx: enabl=
e concurrent DMA read/write across SPI transfers
# good: [c4f2c05ab02952c9a56067aeb700ded95b183570] spi: stm32: fix pointer-=
to-pointer variables usage
# good: [b9ab3b61824190b1c6b2c59e7ba4de591f24eb92] ASoC: SDCA: Add some ini=
tial IRQ handlers
# good: [427ceac823e58813b510e585011488f603f0d891] regulator: tps6286x-regu=
lator: Enable REGCACHE_MAPLE
# good: [29ddce17e909779633f856ad1c2f111fbf71c0df] ASoC: codecs: Add calibr=
ation function to aw88399 chip
# good: [ac4c064f67d3cdf9118b9b09c1e3b28b6c10a7ea] spi: dt-bindings: add nx=
p,lpc3220-spi.yaml
# good: [08bf1663c21a3e815eda28fa242d84c945ca3b94] dmaengine: Add devm_dma_=
request_chan()
# good: [2555691165a0285a4617230fed859f20dcc51608] spi: atmel-quadspi: Use =
`devm_dma_request_chan()`
# good: [ce57bc9771411d6d27f2ca7b40396cbd7d684ba9] regulator: core: Don't u=
se "proxy" headers
# good: [0f60ecffbfe35e12eb56c99640ba2360244b5bb3] ASoC: sdw_utils: generat=
e combined spk components string
# good: [9a944494c299fabf3cc781798eb7c02a0bece364] spi: dt-bindings: stm32:=
 deprecate `st,spi-midi-ns` property
# good: [3e36c822506d924894ff7de549b9377d3114c2d7] spi: spi-pci1xxxx: Add s=
upport for per-instance DMA interrupt vectors
# good: [68fbc70ece40139380380dce74059afa592846b3] ASoC: hisilicon: Standar=
dize ASoC menu
# good: [8f9cf02c8852837923f1cdacfcc92e138513325c] spi: microchip-core-qspi=
: Add regular transfers
# good: [17cc308b183308bf5ada36e164284fff7eb064ba] ASoC: wm8524: enable con=
straints when sysclk is configured.
# good: [59566923d955b69bfb1e1163f07dff437dde8c9c] ASoC: SOF: amd: add alte=
rnate machines for ACP7.0 and ACP7.1 platforms
# good: [024f39fff6d222cedde361f7fe34d9ba4e6afb92] regulator: mtk-dvfsrc: A=
dd support for MediaTek MT8196 DVFSRC
# good: [19cbc930c209d59a2c9828de4c7b767e9f14667e] regulator: pca9450: Supp=
ort PWM mode also for pca9451a
# good: [c4ca928a6db1593802cd945f075a7e21dd0430c1] ASoC: hdac_hdmi: Rate li=
mit logging on connection and disconnection
# good: [a48352921f0b15b1f7eff83f5b5613d6ae2350d3] ASoC: codecs: wcd939x: A=
dd defines for major/minor version decoding
# good: [3421d46440ebe0865bec71dbd2330b4e17a425ab] HID: core: Add bus defin=
e for SoundWire bus
# good: [a1d203d390e04798ccc1c3c06019cd4411885d6d] ASoC: SOF: ipc4-pcm: Ena=
ble delay reporting for ChainDMA streams
# good: [2756b7f08ff6ca7c68c8c7dd61c8dc6895c9de34] ASoC: SOF: ipc4-pcm: Har=
monize sof_ipc4_set_pipeline_state() dbg print
# good: [bb48117b79ebc39485f7306d09dc602981fe540f] ASoC: Intel: sof_sdw: Im=
plement add_dai_link to filter HDMI PCMs
# good: [ace9b3daf2b4778358573d3698e34cb1c0fa7e14] ASoC: SOF: ipc4/Intel: A=
dd support for library restore firmware functionality
# good: [5fc2c383125c2b4b6037e02ad8796b776b25e6d0] spi: falcon: mark falcon=
_sflash_xfer() as static
# good: [7f8924e8785b68c998bc1906e049bf5595865e60] ASoC: dt-bindings: cirru=
s,cs42xx8: add 'port' property
# good: [3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115] regulator: rpi-panel-v2:=
 Add shutdown hook
# good: [d9f38d9824bfb1b046d2e720349d2f45959ab184] ASoC: tegra: AHUB: Remov=
e unneeded semicolon
# good: [dce4bc30f42d313b4dc5832316196411b7f07ad0] spi: spi-fsl-dspi: Rever=
t unintended dependency change in config SPI_FSL_DSPI
# good: [47972c1c3315672352f25c68f91dd88543541947] ASoC: Intel: Replace dep=
recated strcpy() with strscpy()
# good: [5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14] ASoC: hdmi-codec: use SN=
D_JACK_AVOUT as jack status
# good: [1918e51321c0c34341397644512568ac3451e416] ARM: dts: vt8500: Fix th=
e unit address of the VT8500 LCD controller
# good: [bb8d8ba4715cb8f997d63d90ba935f6073595df5] ASoC: mediatek: mt8183-a=
fe-pcm: use local `dev` pointer in driver callbacks
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
# good: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] ASoC: codecs: Add suppor=
t for Richtek RTQ9124
# good: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] ASoC: renesas: msiof: Co=
nvert to <linux/spi/sh_msiof.h>
# good: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] regulator: rpi-panel-v2:=
 Add regulator for 7" Raspberry Pi 720x1280
# good: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] ASOC: rockchip: Use help=
er function devm_clk_get_enabled()
# good: [c459262159f39e6e6336797feb975799344b749b] spi: spi-pci1xxxx: Add s=
upport for 25MHz Clock frequency in C0
# good: [267be32b0a7b70cc777f8a46f0904c92c0521d89] ASoC: remove component->=
id
# good: [548d770c330cd1027549947a6ea899c56b5bc4e4] regulator: pca9450: Add =
support for mode operations
# good: [f6f914893d478b7ba08e5c375de1ced16deb5e92] ASoC: dt-bindings: tas57=
xx: add tas5753 compatibility
# good: [9a30e332c36c52e92e5316b4a012d45284dedeb5] spi: spi-fsl-dspi: Enabl=
e support for S32G platforms
# good: [c95e925daa434ee1a40a86aec6476ce588e4bd77] ASoC: Intel: avs: Add rt=
5640 machine board
# good: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] regmap: kunit: Constify =
regmap_range_cfg array
# good: [ac209bde018fd320b79976657a44c23113181af6] ASoC: tas2781: Drop the =
unnecessary symbol imply
# good: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] ASoC: codecs: wcd939x: A=
dd VDD_PX supply
# good: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] ASoC: imx-card: Use help=
er function for_each_child_of_node_scoped()
# good: [ece5d881004f041c2e1493436409dbcbea3ad5f8] ASoC: codecs: wcd939x: D=
rop unused 'struct wcd939x_priv' fields
# good: [e6e8897995a9e6028563ce36c27877e5478c8571] ASoC: qcom: sm8250: Add =
Fairphone 5 soundcard compatible
git bisect start '05adbee3ad528100ab0285c15c91100e19e10138' 'bc3aa02f578a02=
ecf5e53929d8d6902377c14f2e' '17882721dcb49323eaa9728d7eaa2ae826c876f7' 'd60=
f7cab7c04944a79af16caa43c141e780a59c6' 'd511206dc7443120637efd9cfa3ab06a26d=
a33dd' 'c2a08479b5f8b41f62f1a4984cb78c80c0cb66cb' '951a6d8d41289b86a564ee55=
63ededa702b62b1b' '03aa2ed9e187e42f25b3871b691d535fc19156c4' '63be976da9942=
60ea116c431a2e61485dbede1b0' 'd929cc75e9791def049a90998aaab8934196131c' '87=
78837f0a5b7c1bc5dbf0cccd7619fec6981588' 'd5255ae7ec48ac1f702e95b472801dbb7b=
f1e97f' '4ed357f72a0e0a691304e5f14a3323811c8ce862' '7e477e9c4eb412cbcaeae3e=
d4fff22035dc943eb' 'd9f334fca5448907cc47ba8553926f9ba148512f' '15247b5a63f5=
06125360fa45d7aa1fbe8b903b95' 'd5f317fd5cd9dfdf5bbe11384001817760c12b75' '6=
f8584a4826f01a55d3d0c4bbad5961f1de52fc9' 'a1d87a3586152f52856b449c4787f21cb=
35d430f' '43728a6434f9eca0385fd180d8452a5071678a5b' '6beda760db7eb6b06cdbf7=
7d4749af0bf9aca1e0' '790d5f8ee6f2a27686d042abbce16b4e03ac1608' 'af241e3fa4d=
823f8af899c92fd50d020816a1860' 'f00e06296ba3f0d8440030afe8cc2258758b7af7' '=
3aa47d2ec83316c24e1ed15a492b331802dc6a69' '5030abcb0aa3304bf91497844ffa9607=
a2d4ad5d' '7d61715c58a39edc5f74fc7366487726fc223530' 'b30d390812c8559c5835f=
8ae5f490b38488fafc8' 'ad4655653a6c463026ed3c300e5fb34f39abff48' 'c61da55412=
a08268ea0cdef99dea11f7ade934ee' '68e4dadacb7faa393b532b41bbf99a2dbfec3b1b' =
'defe01abfb7f5c5bd53c723b8577d4fcd64faa5a' '86ccd4d3e8bc9eeb5dde4080fcc67e0=
505d1d2c6' '67bdd67aedcec8c63e3158c3c82991fbde0c4d22' '5054740e0092aac528c0=
589251f612b3b41c9e7b' '08dc0f5cc26a203e8008c38d9b436c079e7dbb45' '2fca75016=
0f29015ab1109bb478537a4e415f7cd' '571defe0dff3f1e4180bd0db79283d3d5bf74a71'=
 '2bd9648d5a8d329ca734ca2c273a80934867471e' 'c61e94e5e4e6bc50064119e6a77956=
4d1d2ac0e7' 'bc163baef57002c08b3afe64cdd2f55f55a765eb' '9f711c9321cffe3e037=
09176873c277fa911c366' 'baee26a9d6cd3d3c6c3c03c56270aa647a67e4bd' '7105fdd5=
4a14bee49371b39374a61b3c967d74cb' '913bf8d50cbd144c87e9660b591781179182ff59=
' '34d340d48e595f8dfd4e72fe4100d2579dbe4a1a' '0c0ef1d90967717b91cded41b00db=
ae05d8e521c' '3fcd3d2fe44dc9dfca20b6aed117f314a50ba0ff' '244bc18e5f1875401a=
4af87d2eae3f9376d9d720' '7e1c28fbf235791cb5046fafdac5bc16fe8e788d' 'c4f2c05=
ab02952c9a56067aeb700ded95b183570' 'b9ab3b61824190b1c6b2c59e7ba4de591f24eb9=
2' '427ceac823e58813b510e585011488f603f0d891' '29ddce17e909779633f856ad1c2f=
111fbf71c0df' 'ac4c064f67d3cdf9118b9b09c1e3b28b6c10a7ea' '08bf1663c21a3e815=
eda28fa242d84c945ca3b94' '2555691165a0285a4617230fed859f20dcc51608' 'ce57bc=
9771411d6d27f2ca7b40396cbd7d684ba9' '0f60ecffbfe35e12eb56c99640ba2360244b5b=
b3' '9a944494c299fabf3cc781798eb7c02a0bece364' '3e36c822506d924894ff7de549b=
9377d3114c2d7' '68fbc70ece40139380380dce74059afa592846b3' '8f9cf02c88528379=
23f1cdacfcc92e138513325c' '17cc308b183308bf5ada36e164284fff7eb064ba' '59566=
923d955b69bfb1e1163f07dff437dde8c9c' '024f39fff6d222cedde361f7fe34d9ba4e6af=
b92' '19cbc930c209d59a2c9828de4c7b767e9f14667e' 'c4ca928a6db1593802cd945f07=
5a7e21dd0430c1' 'a48352921f0b15b1f7eff83f5b5613d6ae2350d3' '3421d46440ebe08=
65bec71dbd2330b4e17a425ab' 'a1d203d390e04798ccc1c3c06019cd4411885d6d' '2756=
b7f08ff6ca7c68c8c7dd61c8dc6895c9de34' 'bb48117b79ebc39485f7306d09dc602981fe=
540f' 'ace9b3daf2b4778358573d3698e34cb1c0fa7e14' '5fc2c383125c2b4b6037e02ad=
8796b776b25e6d0' '7f8924e8785b68c998bc1906e049bf5595865e60' '3e1c01d06e1f52=
f78fe00ef26a9cf80dbb0a3115' 'd9f38d9824bfb1b046d2e720349d2f45959ab184' 'dce=
4bc30f42d313b4dc5832316196411b7f07ad0' '47972c1c3315672352f25c68f91dd885435=
41947' '5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14' '1918e51321c0c34341397644=
512568ac3451e416' 'bb8d8ba4715cb8f997d63d90ba935f6073595df5' '8a5a5cecb7905=
8b608e5562d8998123a3adb313c' 'a4eb71ff98c4792f441f108910bd829da7a04092' '6c=
afcc53eb5fffd9b9bdfde700bb9bad21e98ed3' '7e10d7242ea8a5947878880b912ffa5806=
520705' 'd6fa0ca959db8efd4462d7beef4bdc5568640fd0' '1f5cdb6ab45e1c06ae09536=
09acbb52f8946b3e8' '6ba68e5aa9d5d15c8877a655db279fcfc0b38b04' 'd49305862fdc=
4d9ff1b1093b4ed7d8e0cb9971b4' '03b778d1994827ea5cc971dbdfbb457bbb7bfa5d' 'c=
459262159f39e6e6336797feb975799344b749b' '267be32b0a7b70cc777f8a46f0904c92c=
0521d89' '548d770c330cd1027549947a6ea899c56b5bc4e4' 'f6f914893d478b7ba08e5c=
375de1ced16deb5e92' '9a30e332c36c52e92e5316b4a012d45284dedeb5' 'c95e925daa4=
34ee1a40a86aec6476ce588e4bd77' 'c8c4694ede7ed42d8d4db0e8927dea9839a3e248' '=
ac209bde018fd320b79976657a44c23113181af6' 'b9ecde0bcf6a99a3ff08496d4ba90a38=
5ebbfd68' '111a2c8ab462d77d1519b71b46f13ae1b46920b4' 'ece5d881004f041c2e149=
3436409dbcbea3ad5f8' 'e6e8897995a9e6028563ce36c27877e5478c8571'
# test job: [17882721dcb49323eaa9728d7eaa2ae826c876f7] https://validation.l=
inaro.org/scheduler/job/4173726
# test job: [d60f7cab7c04944a79af16caa43c141e780a59c6] https://validation.l=
inaro.org/scheduler/job/4173611
# test job: [d511206dc7443120637efd9cfa3ab06a26da33dd] https://validation.l=
inaro.org/scheduler/job/4171806
# test job: [c2a08479b5f8b41f62f1a4984cb78c80c0cb66cb] https://validation.l=
inaro.org/scheduler/job/4173816
# test job: [951a6d8d41289b86a564ee5563ededa702b62b1b] https://validation.l=
inaro.org/scheduler/job/4170213
# test job: [03aa2ed9e187e42f25b3871b691d535fc19156c4] https://validation.l=
inaro.org/scheduler/job/4170234
# test job: [63be976da994260ea116c431a2e61485dbede1b0] https://validation.l=
inaro.org/scheduler/job/4169936
# test job: [d929cc75e9791def049a90998aaab8934196131c] https://validation.l=
inaro.org/scheduler/job/4169992
# test job: [8778837f0a5b7c1bc5dbf0cccd7619fec6981588] https://validation.l=
inaro.org/scheduler/job/4169969
# test job: [d5255ae7ec48ac1f702e95b472801dbb7bf1e97f] https://validation.l=
inaro.org/scheduler/job/4169393
# test job: [4ed357f72a0e0a691304e5f14a3323811c8ce862] https://validation.l=
inaro.org/scheduler/job/4169297
# test job: [7e477e9c4eb412cbcaeae3ed4fff22035dc943eb] https://validation.l=
inaro.org/scheduler/job/4172225
# test job: [d9f334fca5448907cc47ba8553926f9ba148512f] https://validation.l=
inaro.org/scheduler/job/4169108
# test job: [15247b5a63f506125360fa45d7aa1fbe8b903b95] https://validation.l=
inaro.org/scheduler/job/4169227
# test job: [d5f317fd5cd9dfdf5bbe11384001817760c12b75] https://validation.l=
inaro.org/scheduler/job/4169020
# test job: [6f8584a4826f01a55d3d0c4bbad5961f1de52fc9] https://validation.l=
inaro.org/scheduler/job/4168986
# test job: [a1d87a3586152f52856b449c4787f21cb35d430f] https://validation.l=
inaro.org/scheduler/job/4171075
# test job: [43728a6434f9eca0385fd180d8452a5071678a5b] https://validation.l=
inaro.org/scheduler/job/4168060
# test job: [6beda760db7eb6b06cdbf77d4749af0bf9aca1e0] https://validation.l=
inaro.org/scheduler/job/4172243
# test job: [790d5f8ee6f2a27686d042abbce16b4e03ac1608] https://validation.l=
inaro.org/scheduler/job/4167458
# test job: [af241e3fa4d823f8af899c92fd50d020816a1860] https://validation.l=
inaro.org/scheduler/job/4167411
# test job: [f00e06296ba3f0d8440030afe8cc2258758b7af7] https://validation.l=
inaro.org/scheduler/job/4167498
# test job: [3aa47d2ec83316c24e1ed15a492b331802dc6a69] https://validation.l=
inaro.org/scheduler/job/4167393
# test job: [5030abcb0aa3304bf91497844ffa9607a2d4ad5d] https://validation.l=
inaro.org/scheduler/job/4167431
# test job: [7d61715c58a39edc5f74fc7366487726fc223530] https://validation.l=
inaro.org/scheduler/job/4164982
# test job: [b30d390812c8559c5835f8ae5f490b38488fafc8] https://validation.l=
inaro.org/scheduler/job/4165138
# test job: [ad4655653a6c463026ed3c300e5fb34f39abff48] https://validation.l=
inaro.org/scheduler/job/4164482
# test job: [c61da55412a08268ea0cdef99dea11f7ade934ee] https://validation.l=
inaro.org/scheduler/job/4164377
# test job: [68e4dadacb7faa393b532b41bbf99a2dbfec3b1b] https://validation.l=
inaro.org/scheduler/job/4164207
# test job: [defe01abfb7f5c5bd53c723b8577d4fcd64faa5a] https://validation.l=
inaro.org/scheduler/job/4164197
# test job: [86ccd4d3e8bc9eeb5dde4080fcc67e0505d1d2c6] https://validation.l=
inaro.org/scheduler/job/4163601
# test job: [67bdd67aedcec8c63e3158c3c82991fbde0c4d22] https://validation.l=
inaro.org/scheduler/job/4163612
# test job: [5054740e0092aac528c0589251f612b3b41c9e7b] https://validation.l=
inaro.org/scheduler/job/4163396
# test job: [08dc0f5cc26a203e8008c38d9b436c079e7dbb45] https://validation.l=
inaro.org/scheduler/job/4163273
# test job: [2fca750160f29015ab1109bb478537a4e415f7cd] https://validation.l=
inaro.org/scheduler/job/4162152
# test job: [571defe0dff3f1e4180bd0db79283d3d5bf74a71] https://validation.l=
inaro.org/scheduler/job/4162026
# test job: [2bd9648d5a8d329ca734ca2c273a80934867471e] https://validation.l=
inaro.org/scheduler/job/4162043
# test job: [c61e94e5e4e6bc50064119e6a779564d1d2ac0e7] https://validation.l=
inaro.org/scheduler/job/4161828
# test job: [bc163baef57002c08b3afe64cdd2f55f55a765eb] https://validation.l=
inaro.org/scheduler/job/4161850
# test job: [9f711c9321cffe3e03709176873c277fa911c366] https://validation.l=
inaro.org/scheduler/job/4161895
# test job: [baee26a9d6cd3d3c6c3c03c56270aa647a67e4bd] https://validation.l=
inaro.org/scheduler/job/4160982
# test job: [7105fdd54a14bee49371b39374a61b3c967d74cb] https://validation.l=
inaro.org/scheduler/job/4160926
# test job: [913bf8d50cbd144c87e9660b591781179182ff59] https://validation.l=
inaro.org/scheduler/job/4160472
# test job: [34d340d48e595f8dfd4e72fe4100d2579dbe4a1a] https://validation.l=
inaro.org/scheduler/job/4160262
# test job: [0c0ef1d90967717b91cded41b00dbae05d8e521c] https://validation.l=
inaro.org/scheduler/job/4160281
# test job: [3fcd3d2fe44dc9dfca20b6aed117f314a50ba0ff] https://validation.l=
inaro.org/scheduler/job/4159928
# test job: [244bc18e5f1875401a4af87d2eae3f9376d9d720] https://validation.l=
inaro.org/scheduler/job/4159638
# test job: [7e1c28fbf235791cb5046fafdac5bc16fe8e788d] https://validation.l=
inaro.org/scheduler/job/4159007
# test job: [c4f2c05ab02952c9a56067aeb700ded95b183570] https://validation.l=
inaro.org/scheduler/job/4159129
# test job: [b9ab3b61824190b1c6b2c59e7ba4de591f24eb92] https://validation.l=
inaro.org/scheduler/job/4159152
# test job: [427ceac823e58813b510e585011488f603f0d891] https://validation.l=
inaro.org/scheduler/job/4159012
# test job: [29ddce17e909779633f856ad1c2f111fbf71c0df] https://validation.l=
inaro.org/scheduler/job/4158530
# test job: [ac4c064f67d3cdf9118b9b09c1e3b28b6c10a7ea] https://validation.l=
inaro.org/scheduler/job/4156481
# test job: [08bf1663c21a3e815eda28fa242d84c945ca3b94] https://validation.l=
inaro.org/scheduler/job/4156861
# test job: [2555691165a0285a4617230fed859f20dcc51608] https://validation.l=
inaro.org/scheduler/job/4156456
# test job: [ce57bc9771411d6d27f2ca7b40396cbd7d684ba9] https://validation.l=
inaro.org/scheduler/job/4156452
# test job: [0f60ecffbfe35e12eb56c99640ba2360244b5bb3] https://validation.l=
inaro.org/scheduler/job/4155485
# test job: [9a944494c299fabf3cc781798eb7c02a0bece364] https://validation.l=
inaro.org/scheduler/job/4155391
# test job: [3e36c822506d924894ff7de549b9377d3114c2d7] https://validation.l=
inaro.org/scheduler/job/4155019
# test job: [68fbc70ece40139380380dce74059afa592846b3] https://validation.l=
inaro.org/scheduler/job/4154919
# test job: [8f9cf02c8852837923f1cdacfcc92e138513325c] https://validation.l=
inaro.org/scheduler/job/4154906
# test job: [17cc308b183308bf5ada36e164284fff7eb064ba] https://validation.l=
inaro.org/scheduler/job/4154840
# test job: [59566923d955b69bfb1e1163f07dff437dde8c9c] https://validation.l=
inaro.org/scheduler/job/4154671
# test job: [024f39fff6d222cedde361f7fe34d9ba4e6afb92] https://validation.l=
inaro.org/scheduler/job/4154683
# test job: [19cbc930c209d59a2c9828de4c7b767e9f14667e] https://validation.l=
inaro.org/scheduler/job/4154624
# test job: [c4ca928a6db1593802cd945f075a7e21dd0430c1] https://validation.l=
inaro.org/scheduler/job/4154605
# test job: [a48352921f0b15b1f7eff83f5b5613d6ae2350d3] https://validation.l=
inaro.org/scheduler/job/4154592
# test job: [3421d46440ebe0865bec71dbd2330b4e17a425ab] https://validation.l=
inaro.org/scheduler/job/4154399
# test job: [a1d203d390e04798ccc1c3c06019cd4411885d6d] https://validation.l=
inaro.org/scheduler/job/4154295
# test job: [2756b7f08ff6ca7c68c8c7dd61c8dc6895c9de34] https://validation.l=
inaro.org/scheduler/job/4154216
# test job: [bb48117b79ebc39485f7306d09dc602981fe540f] https://validation.l=
inaro.org/scheduler/job/4154200
# test job: [ace9b3daf2b4778358573d3698e34cb1c0fa7e14] https://validation.l=
inaro.org/scheduler/job/4154179
# test job: [5fc2c383125c2b4b6037e02ad8796b776b25e6d0] https://validation.l=
inaro.org/scheduler/job/4154051
# test job: [7f8924e8785b68c998bc1906e049bf5595865e60] https://validation.l=
inaro.org/scheduler/job/4154046
# test job: [3e1c01d06e1f52f78fe00ef26a9cf80dbb0a3115] https://validation.l=
inaro.org/scheduler/job/4153777
# test job: [d9f38d9824bfb1b046d2e720349d2f45959ab184] https://validation.l=
inaro.org/scheduler/job/4153760
# test job: [dce4bc30f42d313b4dc5832316196411b7f07ad0] https://validation.l=
inaro.org/scheduler/job/4153623
# test job: [47972c1c3315672352f25c68f91dd88543541947] https://validation.l=
inaro.org/scheduler/job/4153638
# test job: [5eb8a0d7733d4cd32a776acf1d1aa1c7c01c8a14] https://validation.l=
inaro.org/scheduler/job/4153380
# test job: [1918e51321c0c34341397644512568ac3451e416] https://validation.l=
inaro.org/scheduler/job/4171107
# test job: [bb8d8ba4715cb8f997d63d90ba935f6073595df5] https://validation.l=
inaro.org/scheduler/job/4153231
# test job: [8a5a5cecb79058b608e5562d8998123a3adb313c] https://validation.l=
inaro.org/scheduler/job/4153166
# test job: [a4eb71ff98c4792f441f108910bd829da7a04092] https://validation.l=
inaro.org/scheduler/job/4153034
# test job: [6cafcc53eb5fffd9b9bdfde700bb9bad21e98ed3] https://validation.l=
inaro.org/scheduler/job/4153011
# test job: [7e10d7242ea8a5947878880b912ffa5806520705] https://validation.l=
inaro.org/scheduler/job/4152870
# test job: [d6fa0ca959db8efd4462d7beef4bdc5568640fd0] https://validation.l=
inaro.org/scheduler/job/4152813
# test job: [1f5cdb6ab45e1c06ae0953609acbb52f8946b3e8] https://validation.l=
inaro.org/scheduler/job/4152631
# test job: [6ba68e5aa9d5d15c8877a655db279fcfc0b38b04] https://validation.l=
inaro.org/scheduler/job/4152714
# test job: [d49305862fdc4d9ff1b1093b4ed7d8e0cb9971b4] https://validation.l=
inaro.org/scheduler/job/4152653
# test job: [03b778d1994827ea5cc971dbdfbb457bbb7bfa5d] https://validation.l=
inaro.org/scheduler/job/4152438
# test job: [c459262159f39e6e6336797feb975799344b749b] https://validation.l=
inaro.org/scheduler/job/4152394
# test job: [267be32b0a7b70cc777f8a46f0904c92c0521d89] https://validation.l=
inaro.org/scheduler/job/4152329
# test job: [548d770c330cd1027549947a6ea899c56b5bc4e4] https://validation.l=
inaro.org/scheduler/job/4152282
# test job: [f6f914893d478b7ba08e5c375de1ced16deb5e92] https://validation.l=
inaro.org/scheduler/job/4152314
# test job: [9a30e332c36c52e92e5316b4a012d45284dedeb5] https://validation.l=
inaro.org/scheduler/job/4152562
# test job: [c95e925daa434ee1a40a86aec6476ce588e4bd77] https://validation.l=
inaro.org/scheduler/job/4152595
# test job: [c8c4694ede7ed42d8d4db0e8927dea9839a3e248] https://validation.l=
inaro.org/scheduler/job/4152467
# test job: [ac209bde018fd320b79976657a44c23113181af6] https://validation.l=
inaro.org/scheduler/job/4152406
# test job: [b9ecde0bcf6a99a3ff08496d4ba90a385ebbfd68] https://validation.l=
inaro.org/scheduler/job/4152315
# test job: [111a2c8ab462d77d1519b71b46f13ae1b46920b4] https://validation.l=
inaro.org/scheduler/job/4152528
# test job: [ece5d881004f041c2e1493436409dbcbea3ad5f8] https://validation.l=
inaro.org/scheduler/job/4152339
# test job: [e6e8897995a9e6028563ce36c27877e5478c8571] https://validation.l=
inaro.org/scheduler/job/4152415
# test job: [05adbee3ad528100ab0285c15c91100e19e10138] https://validation.l=
inaro.org/scheduler/job/4174082
# bad: [05adbee3ad528100ab0285c15c91100e19e10138] Add linux-next specific f=
iles for 20250722
git bisect bad 05adbee3ad528100ab0285c15c91100e19e10138
# test job: [18a31e73d0f9e5b4ba3481ed8b39d48644d22a20] https://validation.l=
inaro.org/scheduler/job/4174089
# good: [18a31e73d0f9e5b4ba3481ed8b39d48644d22a20] Merge branch 'main' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 18a31e73d0f9e5b4ba3481ed8b39d48644d22a20
# test job: [c871ad861540a12c68f8e92a4a40352350eacc30] https://validation.l=
inaro.org/scheduler/job/4174103
# bad: [c871ad861540a12c68f8e92a4a40352350eacc30] Merge branch 'next' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git
git bisect bad c871ad861540a12c68f8e92a4a40352350eacc30
# test job: [be3cd668fffe2a1dc8a9c617b44c5f46fa2e4b96] https://validation.l=
inaro.org/scheduler/job/4174117
# bad: [be3cd668fffe2a1dc8a9c617b44c5f46fa2e4b96] Merge tag 'drm-misc-next-=
2025-07-17' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
git bisect bad be3cd668fffe2a1dc8a9c617b44c5f46fa2e4b96
# test job: [0dc6bfb50a5d0759e726cd36a3d3b7529fd2a627] https://validation.l=
inaro.org/scheduler/job/4174131
# good: [0dc6bfb50a5d0759e726cd36a3d3b7529fd2a627] drm/i915/dsi: Fix NULL p=
ointer deref in vlv_dphy_param_init()
git bisect good 0dc6bfb50a5d0759e726cd36a3d3b7529fd2a627
# test job: [69d09a26096c187742fa7040ef9b2925becf00f4] https://validation.l=
inaro.org/scheduler/job/4174141
# good: [69d09a26096c187742fa7040ef9b2925becf00f4] Merge tag 'drm-intel-nex=
t-2025-07-04' of https://gitlab.freedesktop.org/drm/i915/kernel into drm-ne=
xt
git bisect good 69d09a26096c187742fa7040ef9b2925becf00f4
# test job: [530694f54dd5e097866999bbaebc5c133e5507b6] https://validation.l=
inaro.org/scheduler/job/4174148
# good: [530694f54dd5e097866999bbaebc5c133e5507b6] drm/amdgpu: do not resum=
e device in thaw for normal hibernation
git bisect good 530694f54dd5e097866999bbaebc5c133e5507b6
# test job: [fba12307633933917a799fa2cda5bfc324b3f114] https://validation.l=
inaro.org/scheduler/job/4174157
# good: [fba12307633933917a799fa2cda5bfc324b3f114] drm/xe: Add plumbing for=
 indirect context workarounds
git bisect good fba12307633933917a799fa2cda5bfc324b3f114
# test job: [04a5889cf75aa5b59bd1e13c33eccaf49f3f9d81] https://validation.l=
inaro.org/scheduler/job/4174164
# good: [04a5889cf75aa5b59bd1e13c33eccaf49f3f9d81] drm/gem: Pass along the =
format info from .fb_create() to drm_helper_mode_fill_fb_struct()
git bisect good 04a5889cf75aa5b59bd1e13c33eccaf49f3f9d81
# test job: [a81648768178f6adf171d98db486b4b2613f645a] https://validation.l=
inaro.org/scheduler/job/4174173
# good: [a81648768178f6adf171d98db486b4b2613f645a] drm/xe/pf: Invalidate LM=
TT after completing changes
git bisect good a81648768178f6adf171d98db486b4b2613f645a
# test job: [7e11e01d1f1d00cb308f9351511e9597a4f70678] https://validation.l=
inaro.org/scheduler/job/4174180
# good: [7e11e01d1f1d00cb308f9351511e9597a4f70678] Merge tag 'amd-drm-next-=
6.17-2025-07-11' of https://gitlab.freedesktop.org/agd5f/linux into drm-next
git bisect good 7e11e01d1f1d00cb308f9351511e9597a4f70678
# test job: [7a46d03936727f2342686cbc90e073271b1827db] https://validation.l=
inaro.org/scheduler/job/4174187
# good: [7a46d03936727f2342686cbc90e073271b1827db] drm/komeda: Pass along t=
he format info from .fb_create() to drm_helper_mode_fill_fb_struct()
git bisect good 7a46d03936727f2342686cbc90e073271b1827db
# test job: [3f019d749671b21c31cf1290e6c6a9f107e78cb8] https://validation.l=
inaro.org/scheduler/job/4174193
# good: [3f019d749671b21c31cf1290e6c6a9f107e78cb8] drm/vmwgfx: Pass along t=
he format info from .fb_create() to drm_helper_mode_fill_fb_struct()
git bisect good 3f019d749671b21c31cf1290e6c6a9f107e78cb8
# test job: [28c5c486380cc29e82b7747e999b3238f2887539] https://validation.l=
inaro.org/scheduler/job/4174202
# bad: [28c5c486380cc29e82b7747e999b3238f2887539] drm/amdgpu: Fix missing u=
nlocking in an error path in amdgpu_userq_create()
git bisect bad 28c5c486380cc29e82b7747e999b3238f2887539
# test job: [41ab92d35ccd2d66bfb049bd34cd95f0304b0240] https://validation.l=
inaro.org/scheduler/job/4174211
# bad: [41ab92d35ccd2d66bfb049bd34cd95f0304b0240] drm: Make passing of form=
at info to drm_helper_mode_fill_fb_struct() mandatory
git bisect bad 41ab92d35ccd2d66bfb049bd34cd95f0304b0240
# first bad commit: [41ab92d35ccd2d66bfb049bd34cd95f0304b0240] drm: Make pa=
ssing of format info to drm_helper_mode_fill_fb_struct() mandatory

--E/TxTBd074gy4AKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh/lRwACgkQJNaLcl1U
h9AHCgf+JcOS0BzxKgtZJqVoTI2+37jV5pvFBNl9w71lfs2yYfJph1PANTeSMiCF
RStaC+gOrxg7QG9iS2pgWQHg4q6+9t9SLJMOmJY87MBu9k5olHesKBc0C8InkH1r
p5hllX7FG5pbNanEXG0Pj9a/1koRlvLzXDrUhyM2HLa7GKg2qtDsmkTORYgGL16Z
NHM9QPo/wrQAv1vMvBrWb+kNzHD9JRDhe1pzNhdy0EZJ4c/yW60euc38NbeKYYd0
CX2B+Nm3sudFCsbh3RefENT2zIdf2HPonuJ0naw7uU9hPGvn7kerMZlI+GnOCs/y
fw+D8zbdXolBtKmqwAPEmUvRcSHryQ==
=6Ol4
-----END PGP SIGNATURE-----

--E/TxTBd074gy4AKx--
