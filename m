Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEB789586D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 17:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB2910FDFB;
	Tue,  2 Apr 2024 15:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SW3kipZf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2FA10FDFB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 15:43:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A7938CE12BA;
 Tue,  2 Apr 2024 15:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323C4C433C7;
 Tue,  2 Apr 2024 15:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712072625;
 bh=InbSoObcEBcTMcjgyM8I+LoxpcfVTOKfJc2LjrL3bHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SW3kipZfBa0tiOd1JE+WVwauEO+7tZHNNrtakW90iNWYEPRW/nWbk0C+8/TNhWyu6
 PJRakUtdecvBXijdibLzidhl6PTZB+7wlvdfOIOspU2oCcsBTfoIYfRyhN4FM21xq3
 CcMcTdg3J+AMtaoE6LsyzPQSZIkifYi++5b+tatf7E5fvB0pEvrYlRMrxwdP+s6lCw
 uLGMBBd59Agudx+LJuz9Eu/jqfpUVRq4JNDTutVYbg6Cf2j345rFhaYZK9/GKFAjWS
 NoqfUKO6yPZugA+QKuAetIJrhboYec26SOLxwMRif2+jFygu/oIYHoK9Obq4MLLfwp
 2Qb4fDUYWxSDw==
Date: Tue, 2 Apr 2024 16:43:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 07/13] drm: Make drivers depends on DRM_DW_HDMI
Message-ID: <2c78772a-1d3f-47dd-9c3f-a3011703e1ab@sirena.org.uk>
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="INDanupw69+0VMXR"
Content-Disposition: inline
In-Reply-To: <20240327-kms-kconfig-helpers-v3-7-eafee11b84b3@kernel.org>
X-Cookie: Someone is speaking well of you.
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


--INDanupw69+0VMXR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2024 at 11:57:02AM +0100, Maxime Ripard wrote:

> DRM_DW_HDMI has a number of dependencies that might not be enabled.
> However, drivers were used to selecting it while not enforcing the
> DRM_DW_HDMI dependencies.
>=20
> This could result in Kconfig warnings (and further build breakages) such
> as:
>=20
>   Kconfig warnings: (for reference only)
>      WARNING: unmet direct dependencies detected for DRM_DW_HDMI
>      Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dm] && DRM_BRIDGE [=3Dy] =
&& DRM_DISPLAY_HELPER [=3Dn]
>      Selected by [m]:
>      - DRM_SUN8I_DW_HDMI [=3Dm] && HAS_IOMEM [=3Dy] && DRM_SUN4I [=3Dm]

This has landed in -next and appears to be causing breakage for several
platforms using these devices.  For example I'm seeing the HDMI fail to
probe on sun50i-a64-pin64-plus with arm64 defconfig, the DT kselftest
result isn't terribly informative but it can be seen here:

   https://lava.sirena.org.uk/scheduler/job/78288#L6007

which I bisected to this change:

# bad: [c0b832517f627ead3388c6f0c74e8ac10ad5774b] Add linux-next specific f=
iles for 20240402
# good: [0fc83069bcaee78f60b8511d9453a9441963a072] Merge branch 'for-linux-=
next-fixes' of https://gitlab.freedesktop.org/drm/misc/kernel.git
# good: [ba5206881843e16b74a07c37970dcc44d22f8f6f] spi: spi.h: add missing =
kernel-doc for @last_cs_index_mask
# good: [64fe73d10323e399b2e8eb5407390bcb302a046c] spi: fsl: remove is_dma_=
mapped checks
# good: [bb77c99ee6d3d704086acf141d3ec92601747809] spi: pxa2xx: Skip SSP in=
itialization if it's done elsewhere
# good: [e64d3b6fc9a388d7dc516668651cf4404bffec9b] spi: omap2-mcpsi: Enable=
 MULTI-mode in more situations
# good: [57ad033ce09d4d0c866ac558fc3c4cf53cfb2599] ASoC: Intel: sof_cs42l42=
: add mtl_cs42l42_def for mtl boards
# good: [7b5f2072657a9041cbaf4ba139f672be11694ca3] ASoC: dt-bindings: fsl-s=
ai: allow only one dma-names
# good: [a5bef84422eb066ee8fa5c13960657a79b3cc1e7] spi: fsl-dspi: drop driv=
er owner assignment
# good: [29580cd7b9c6f975e88597ca66a001b16b97bae9] ASoC: sdw-mockup: drop d=
river owner assignment
# good: [ea60ab95723f5738e7737b56dda95e6feefa5b50] ASoC: kirkwood: Fix pote=
ntial NULL dereference
# good: [c0a3873b9938bfaa77bd337cad33266a50a6583f] ASoC: nau8325: new driver
# good: [559aebe45a054a479fdbd2a3dfba999ffd73cc9d] ASoC: sun8i-codec: Fix b=
uild with CONFIG_SND_JACK_INPUT_DEV disabled
# good: [d5449432f794e75cd4f5e46bc33bfe6ce20b657d] spi: pxa2xx: Switch to u=
se dev_err_probe()
# good: [7b95ee0db7e0a7f99077f1b926323c7bf0d2e8f8] ASoC: soc-jack: Get rid =
of legacy GPIO support
# good: [ea5fee227ff3dae209062ac9544906debe1e9ac1] ASoC: hdac_hda: improve =
error logs
# good: [4ed0915f5bc4bcc81bca783a5b984f3d81e9764e] ASoC: codecs: Add RK3308=
 internal audio codec driver
# good: [59ffeb15b2f7b44cf934fd778dc0d98a35aa6a84] ASoC: Intel: sof_sdw: Ad=
d support for cs42l43 optional speaker output
# good: [1e90a846493c716e3e6b4d901fc0844e9eea6430] ASoC: soc-dai: Note vali=
d values of sysclock direction
# good: [61cafaeab5bca2d3e6a68ee8fa92b5c10b8610ca] ASoC: Intel: sof_rt5682:=
 board id cleanup for cml boards
# good: [9b163e0d330debbf7dcc14b2c3e2dc19a3b50a1d] spi: remove struct spi_m=
essage::is_dma_mapped
# good: [b340f56a74b62d8ce8617650c8ab4a26c87ba5c5] ASoC: dt-bindings: wm897=
4: Convert to dtschema
# good: [bdeef5dcea6b164f4bd614655821b1ef12ebec9a] spi: rspi: Get rid of un=
used struct rspi_plat_data
# good: [885dd75f41f9fff5b277bc6ab28ad798f98a37b4] ASoC: dt-bindings: fsl-e=
sai: Convert fsl,esai.txt to yaml
# good: [10402419f2d60890525f590b54d0eaec3de0d87a] spi: spi-mt65xx: Rename =
a variable in interrupt handler
# good: [9855f05e553637f05494cf47a3154cbf9a5cfc67] ASoC: fsl: imx-es8328: S=
witch to using gpiod API
# good: [5f39231888c63f0a7708abc86b51b847476379d8] ASoC: mediatek: Assign d=
ummy when codec not specified for a DAI link
# good: [5edeb7d312628961046eec9b26a7e72f44baf846] regulator: pca9450: add =
pca9451a support
# good: [c14445bdcb98feddf9afaeb05e6193cc1f8eec1a] ASoC: fsl: imx-rpmsg: Up=
date to correct DT node
# good: [a39111b1cf0864b1782f30f9a1fa65260d057327] spi: xilinx: Make num_ch=
ipselect 8-bit in the struct xspi_platform_data
# good: [b5867a5c0d7a6bf36f59f3d472c7aed33ca4d02c] spi: pxa2xx: Use proper =
SSP header in soc/pxa/ssp.c
# good: [60c10c678b582d41532fefa12667d8adca75811b] ASoC: Intel: avs: i2s_te=
st: Remove redundant dapm routes
# good: [21fa98f4197bb3365dda1417708b318f403c13c1] ASoC: sun8i-codec: Imple=
ment jack and accessory detection
# good: [cee28113db17f0de58df0eaea4e2756c404ee01f] ASoC: dmaengine_pcm: All=
ow passing component name via config
# good: [aad6b35290f52639d3601063d33d9621c0948a04] regmap: maple: Remove se=
cond semicolon
# good: [e6913c6ef83c80aa7569c9e08204542222fbf542] ASoC: codecs: ES8326: De=
lete unused REG_SUPPLY
# good: [0c5f77f4eaef8ed9fe752d21f40ac471dd511cfc] dt-bindings: regulator: =
qcom,usb-vbus-regulator: Add PM7250B compatible
# good: [ab470abe58c09b2fbe2c1478e67a904fd803e84f] regulator: rpi-panel-att=
iny: convert to use maple tree register cache
git bisect start 'c0b832517f627ead3388c6f0c74e8ac10ad5774b' '0fc83069bcaee7=
8f60b8511d9453a9441963a072' 'ba5206881843e16b74a07c37970dcc44d22f8f6f' '64f=
e73d10323e399b2e8eb5407390bcb302a046c' 'bb77c99ee6d3d704086acf141d3ec926017=
47809' 'e64d3b6fc9a388d7dc516668651cf4404bffec9b' '57ad033ce09d4d0c866ac558=
fc3c4cf53cfb2599' '7b5f2072657a9041cbaf4ba139f672be11694ca3' 'a5bef84422eb0=
66ee8fa5c13960657a79b3cc1e7' '29580cd7b9c6f975e88597ca66a001b16b97bae9' 'ea=
60ab95723f5738e7737b56dda95e6feefa5b50' 'c0a3873b9938bfaa77bd337cad33266a50=
a6583f' '559aebe45a054a479fdbd2a3dfba999ffd73cc9d' 'd5449432f794e75cd4f5e46=
bc33bfe6ce20b657d' '7b95ee0db7e0a7f99077f1b926323c7bf0d2e8f8' 'ea5fee227ff3=
dae209062ac9544906debe1e9ac1' '4ed0915f5bc4bcc81bca783a5b984f3d81e9764e' '5=
9ffeb15b2f7b44cf934fd778dc0d98a35aa6a84' '1e90a846493c716e3e6b4d901fc0844e9=
eea6430' '61cafaeab5bca2d3e6a68ee8fa92b5c10b8610ca' '9b163e0d330debbf7dcc14=
b2c3e2dc19a3b50a1d' 'b340f56a74b62d8ce8617650c8ab4a26c87ba5c5' 'bdeef5dcea6=
b164f4bd614655821b1ef12ebec9a' '885dd75f41f9fff5b277bc6ab28ad798f98a37b4' '=
10402419f2d60890525f590b54d0eaec3de0d87a' '9855f05e553637f05494cf47a3154cbf=
9a5cfc67' '5f39231888c63f0a7708abc86b51b847476379d8' '5edeb7d312628961046ee=
c9b26a7e72f44baf846' 'c14445bdcb98feddf9afaeb05e6193cc1f8eec1a' 'a39111b1cf=
0864b1782f30f9a1fa65260d057327' 'b5867a5c0d7a6bf36f59f3d472c7aed33ca4d02c' =
'60c10c678b582d41532fefa12667d8adca75811b' '21fa98f4197bb3365dda1417708b318=
f403c13c1' 'cee28113db17f0de58df0eaea4e2756c404ee01f' 'aad6b35290f52639d360=
1063d33d9621c0948a04' 'e6913c6ef83c80aa7569c9e08204542222fbf542' '0c5f77f4e=
aef8ed9fe752d21f40ac471dd511cfc' 'ab470abe58c09b2fbe2c1478e67a904fd803e84f'
# bad: [c0b832517f627ead3388c6f0c74e8ac10ad5774b] Add linux-next specific f=
iles for 20240402
git bisect bad c0b832517f627ead3388c6f0c74e8ac10ad5774b
# bad: [784b758e641c4b36be7ef8ab585bea834099b030] Merge branch 'for-linux-n=
ext' of https://gitlab.freedesktop.org/drm/misc/kernel.git
git bisect bad 784b758e641c4b36be7ef8ab585bea834099b030
# good: [8b8b4dca2ddd82d3ae7e2a6a2fc7d49e511ceae7] Merge branch 'dev' of gi=
t://git.kernel.org/pub/scm/linux/kernel/git/linkinjeon/exfat.git
git bisect good 8b8b4dca2ddd82d3ae7e2a6a2fc7d49e511ceae7
# good: [2c20b30ed316f5cb8773e5f99c02cd997f2374b7] Merge branch 'main' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git bisect good 2c20b30ed316f5cb8773e5f99c02cd997f2374b7
# good: [e1191745c053b07a2e7364f8b95cda470f03cbbe] Merge branch 'nand/next'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git
git bisect good e1191745c053b07a2e7364f8b95cda470f03cbbe
# good: [6e3fdedcf0bc03c852d9fdbb5443f1e43103195f] drm/edid: Add a function=
 to match EDID with identity
git bisect good 6e3fdedcf0bc03c852d9fdbb5443f1e43103195f
# bad: [4d15125d7fe637f401e64e33c99513adf6586fdd] drm: Switch DRM_DISPLAY_D=
P_AUX_BUS to depends on
git bisect bad 4d15125d7fe637f401e64e33c99513adf6586fdd
# good: [0b45921c2a8831834a5f8a52ddd0b25b5b1c6faf] drm/panthor: Don't use v=
irt_to_pfn()
git bisect good 0b45921c2a8831834a5f8a52ddd0b25b5b1c6faf
# good: [462a7c0f8e3f833e5ca3dd3f427882b60b3f38e9] drm/panthor: Fix wrong k=
ernel-doc format in the uAPI header
git bisect good 462a7c0f8e3f833e5ca3dd3f427882b60b3f38e9
# good: [4d66d841a72557053fa44f9b6ebf09cf78223ed3] drm/display: Make Displa=
yPort AUX Chardev Kconfig name consistent
git bisect good 4d66d841a72557053fa44f9b6ebf09cf78223ed3
# good: [d674858ff979550a0e97b4ac766f2640f0d9d7e7] drm/display: Make all he=
lpers visible and switch to depends on
git bisect good d674858ff979550a0e97b4ac766f2640f0d9d7e7
# bad: [e075e496f516bf92bc0cbaf94d64e8d4a6b58321] drm: Switch DRM_DISPLAY_H=
ELPER to depends on
git bisect bad e075e496f516bf92bc0cbaf94d64e8d4a6b58321
# bad: [c0e0f139354c01e0213204e4a96e7076e5a3e396] drm: Make drivers depends=
 on DRM_DW_HDMI
git bisect bad c0e0f139354c01e0213204e4a96e7076e5a3e396
# first bad commit: [c0e0f139354c01e0213204e4a96e7076e5a3e396] drm: Make dr=
ivers depends on DRM_DW_HDMI

I'm also seeing similar problems on sun50i-h5-libretech-all-h3-cc which
bisected to the same commit, and on imx6dl-udoo and imx6q-udoo with
multi_v7_defconfig which I didn't run bisects for.  I didn't fully check
all the boards.

The change introduces a new dependency on DRM_DW_HDMI to the various
drivers but I'm not seeing any defconfig updates which turn that option
anywhere so it's not clear how this is expected to avoid regressing the
defconfig behaviours unless I'm missing something?

--INDanupw69+0VMXR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYMJ6wACgkQJNaLcl1U
h9BjKAf+KcMCdZLT4qqsEuXof++mvR47ngTv3r+ujQfZ0JD8Tc5z2dQE2RlduLjX
WAa/jgITzibpmomr/UIxvm0ovF51mvMk6KU6Jv3XxrmxhJOlwEdBPYjqrh+HUaJe
uer+p2UM3GtxKqpjvzN6SxmF9trtcThMqnHHERsNohVVJPefXu44bOqUC5X/K+yX
E2a2kysRw7C/XlTXSF5APRJUKVv1DHc83aPj2uPfqe9vBL9Ey7qTugYx/YL8r4e/
APEAQ86Id/BLTpkNhNuaBCcxC80W6HgX3FAWp+j5C4+L44rNgoeg2WtEQIjqOysk
VSCcx9FOyeUQcxxFjgiOqe/87WiLqg==
=kHCB
-----END PGP SIGNATURE-----

--INDanupw69+0VMXR--
