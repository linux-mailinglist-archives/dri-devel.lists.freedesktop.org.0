Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928122581A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:04:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8210C89F24;
	Mon, 20 Jul 2020 07:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5617389F24
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:04:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 05040ADFE;
 Mon, 20 Jul 2020 07:04:56 +0000 (UTC)
Subject: Re: [PATCH 8/8] drm/mgag200: Add support for G200 desktop cards
To: lyude@redhat.com, daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <20200715145902.13122-9-tzimmermann@suse.de>
 <b6f4ec3119eedb213269945b38616e253ac5f38d.camel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a0f952d1-8886-aec0-73bf-0f351c53d11f@suse.de>
Date: Mon, 20 Jul 2020 09:04:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b6f4ec3119eedb213269945b38616e253ac5f38d.camel@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1451754552=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1451754552==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X4ERssao1sUQsEye0WLpzygZRHV0x73gR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X4ERssao1sUQsEye0WLpzygZRHV0x73gR
Content-Type: multipart/mixed; boundary="RqskOsHSoXSaDfJbqUaIZd6RSoaFzn7cQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lyude@redhat.com, daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 emil.velikov@collabora.com, krzk@kernel.org, john.p.donnelly@Oracle.com,
 rong.a.chen@intel.com, kraxel@redhat.com, eich@suse.com, tiwai@suse.de
Cc: dri-devel@lists.freedesktop.org
Message-ID: <a0f952d1-8886-aec0-73bf-0f351c53d11f@suse.de>
Subject: Re: [PATCH 8/8] drm/mgag200: Add support for G200 desktop cards
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <20200715145902.13122-9-tzimmermann@suse.de>
 <b6f4ec3119eedb213269945b38616e253ac5f38d.camel@redhat.com>
In-Reply-To: <b6f4ec3119eedb213269945b38616e253ac5f38d.camel@redhat.com>

--RqskOsHSoXSaDfJbqUaIZd6RSoaFzn7cQ
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 17.07.20 um 00:43 schrieb Lyude Paul:
> On Wed, 2020-07-15 at 16:59 +0200, Thomas Zimmermann wrote:
>> This patch adds support for G200 desktop cards. We can reuse the whole=

>> memory and modesetting code. A few PCI and DAC register values have to=

>> be updated accordingly.
>>
>> The most significant change is in the PLL setup. The get the clock lim=
its
>> and reference clocks, parses the device's BIOS. With no BIOS found, sa=
fe
>> defaults are being used.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Co-developed-by: Egbert Eich <eich@suse.com>
>> Signed-off-by: Egbert Eich <eich@suse.com>
>> Co-developed-by: Takashi Iwai <tiwai@suse.de>
>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>> ---
>>  MAINTAINERS                            |   2 +-
>>  drivers/gpu/drm/mgag200/Kconfig        |  12 +--
>>  drivers/gpu/drm/mgag200/mgag200_drv.c  | 125 ++++++++++++++++++++++++=
-
>>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  10 ++
>>  drivers/gpu/drm/mgag200/mgag200_mode.c |  80 ++++++++++++++++
>>  5 files changed, 220 insertions(+), 9 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 415954a98934..4c6f96e2b79b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -5406,7 +5406,7 @@ S:	Orphan / Obsolete
>>  F:	drivers/gpu/drm/mga/
>>  F:	include/uapi/drm/mga_drm.h
>> =20
>> -DRM DRIVER FOR MGA G200 SERVER GRAPHICS CHIPS
>> +DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
>>  M:	Dave Airlie <airlied@redhat.com>
>>  S:	Odd Fixes
>>  F:	drivers/gpu/drm/mgag200/
>> diff --git a/drivers/gpu/drm/mgag200/Kconfig b/drivers/gpu/drm/mgag200=
/Kconfig
>> index 93be766715c9..eec59658a938 100644
>> --- a/drivers/gpu/drm/mgag200/Kconfig
>> +++ b/drivers/gpu/drm/mgag200/Kconfig
>> @@ -1,13 +1,11 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>>  config DRM_MGAG200
>> -	tristate "Kernel modesetting driver for MGA G200 server engines"
>> +	tristate "Matrox G200"
>>  	depends on DRM && PCI && MMU
>>  	select DRM_GEM_SHMEM_HELPER
>>  	select DRM_KMS_HELPER
>>  	help
>> -	 This is a KMS driver for the MGA G200 server chips, it
>> -	 does not support the original MGA G200 or any of the desktop
>> -	 chips. It requires 0.3.0 of the modesetting userspace driver,
>> -	 and a version of mga driver that will fail on KMS enabled
>> -	 devices.
>> -
>> +	 This is a KMS driver for Matrox G200 chips. It supports the origina=
l
>> +	 MGA G200 desktop chips and the server variants. It requires 0.3.0
>> +	 of the modesetting userspace driver, and a version of mga driver
>> +	 that will fail on KMS enabled devices.
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> index f7652e16365c..419817d6e2cd 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
>> @@ -64,6 +64,14 @@ static int mgag200_regs_init(struct mga_device *mde=
v)
>>  	u8 crtcext3;
>> =20
>>  	switch (mdev->type) {
>> +	case G200_PCI:
>> +	case G200_AGP:
>> +		if (mgag200_has_sgram(mdev))
>> +			option =3D 0x4049cd21;
>> +		else
>> +			option =3D 0x40499121;
>> +		option2 =3D 0x00008000;
>> +		break;
>>  	case G200_SE_A:
>>  	case G200_SE_B:
>>  		if (mgag200_has_sgram(mdev))
>> @@ -115,6 +123,117 @@ static int mgag200_regs_init(struct mga_device *=
mdev)
>>  	return 0;
>>  }
>> =20
>> +static void mgag200_g200_interpret_bios(struct mga_device *mdev,
>> +					unsigned char __iomem *bios,
>> +					size_t size)
>> +{
>> +	static const unsigned int expected_length[6] =3D {
>> +		0, 64, 64, 64, 128, 128
>> +	};
>> +
>> +	struct drm_device *dev =3D &mdev->base;
>> +	unsigned char __iomem *pins;
>=20
> huh, never realized you could write directly to unsigned char __iomem p=
ointers!

I took the patch as-is, but this probably wouldn't work on all
architectures.

>=20
>> +	unsigned int pins_len, version;
>> +	int offset;
>> +	int tmp;
>> +
>> +	if (size < MGA_BIOS_OFFSET + 1)
>> +		return;
>> +
>> +	if (bios[45] !=3D 'M' || bios[46] !=3D 'A' || bios[47] !=3D 'T' ||
>> +	    bios[48] !=3D 'R' || bios[49] !=3D 'O' || bios[50] !=3D 'X')
>> +		return;
>> +
>> +	offset =3D (bios[MGA_BIOS_OFFSET + 1] << 8) | bios[MGA_BIOS_OFFSET];=

>> +
>> +	if (offset + 5 > size)
>> +		return;
>> +
>> +	pins =3D bios + offset;
>> +	if (pins[0] =3D=3D 0x2e && pins[1] =3D=3D 0x41) {
>> +		version =3D pins[5];
>> +		pins_len =3D pins[2];
>> +	} else {
>> +		version =3D 1;
>> +		pins_len =3D pins[0] + (pins[1] << 8);
>> +	}
>> +
>> +	if (version < 1 || version > 5) {
>> +		drm_warn(dev, "Unknown BIOS PInS version: %d\n", version);
>=20
> Did you maybe mean pins or PINS here? or is PInS some weird abbreviatio=
n matrox
> uses?

It's the name of a data structure


https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/blob/master/m=
ga_PInS.txt

I have no idea what it stands for.

>=20
>> +		return;
>> +	}
>> +	if (pins_len !=3D expected_length[version]) {
>> +		drm_warn(dev, "Unexpected BIOS PInS size: %d expeced: %d\n",
>> +			 pins_len, expected_length[version]);
>> +		return;
>> +	}
>> +
>> +	if (offset + pins_len > size)
>> +		return;
>> +
>> +	drm_dbg_kms(dev, "MATROX BIOS PInS version %d size: %d found\n",
>> +		    version, pins_len);
>> +
>> +	switch (version) {
>> +	case 1:
>> +		tmp =3D pins[24] + (pins[25] << 8);
>> +		if (tmp)
>> +			mdev->model.g200.pclk_max =3D tmp * 10;
>> +		break;
>> +	case 2:
>> +		if (pins[41] !=3D 0xff)
>> +			mdev->model.g200.pclk_max =3D (pins[41] + 100) * 1000;
>> +		break;
>> +	case 3:
>> +		if (pins[36] !=3D 0xff)
>> +			mdev->model.g200.pclk_max =3D (pins[36] + 100) * 1000;
>> +		if (pins[52] & 0x20)
>> +			mdev->model.g200.ref_clk =3D 14318;
>> +		break;
>> +	case 4:
>> +		if (pins[39] !=3D 0xff)
>> +			mdev->model.g200.pclk_max =3D pins[39] * 4 * 1000;
>> +		if (pins[92] & 0x01)
>> +			mdev->model.g200.ref_clk =3D 14318;
>> +		break;
>> +	case 5:
>> +		tmp =3D pins[4] ? 8000 : 6000;
>> +		if (pins[123] !=3D 0xff)
>> +			mdev->model.g200.pclk_min =3D pins[123] * tmp;
>> +		if (pins[38] !=3D 0xff)
>> +			mdev->model.g200.pclk_max =3D pins[38] * tmp;
>> +		if (pins[110] & 0x01)
>> +			mdev->model.g200.ref_clk =3D 14318;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +}
>> +
>> +static void mgag200_g200_init_refclk(struct mga_device *mdev)
>> +{
>> +	struct drm_device *dev =3D &mdev->base;
>> +	unsigned char __iomem *bios;
>> +	size_t size;
>> +
>> +	mdev->model.g200.pclk_min =3D 50000;
>> +	mdev->model.g200.pclk_max =3D 230000;
>> +	mdev->model.g200.ref_clk =3D 27050;
>> +
>> +	bios =3D pci_map_rom(dev->pdev, &size);
>> +	if (!bios)
>> +		return;
>> +
>> +	if (size !=3D 0 && bios[0] =3D=3D 0x55 && bios[1] =3D=3D 0xaa)
>> +		mgag200_g200_interpret_bios(mdev, bios, size);
>> +
>> +	pci_unmap_rom(dev->pdev, bios);
>> +
>> +	drm_dbg_kms(dev, "pclk_min: %ld pclk_max: %ld ref_clk: %ld\n",
>> +		    mdev->model.g200.pclk_min, mdev->model.g200.pclk_max,
>> +		    mdev->model.g200.ref_clk);
>> +}
>> +
>>  static void mgag200_g200se_init_unique_id(struct mga_device *mdev)
>>  {
>>  	struct drm_device *dev =3D &mdev->base;
>> @@ -138,7 +257,9 @@ static int mgag200_device_init(struct mga_device *=
mdev,
>> unsigned long flags)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	if (IS_G200_SE(mdev))
>> +	if (mdev->type =3D=3D G200_PCI || mdev->type =3D=3D G200_AGP)
>> +		mgag200_g200_init_refclk(mdev);
>> +	else if (IS_G200_SE(mdev))
>>  		mgag200_g200se_init_unique_id(mdev);
>> =20
>>  	ret =3D mgag200_mm_init(mdev);
>> @@ -182,6 +303,8 @@ mgag200_device_create(struct pci_dev *pdev, unsign=
ed long
>> flags)
>>   */
>> =20
>>  static const struct pci_device_id mgag200_pciidlist[] =3D {
>> +	{ PCI_VENDOR_ID_MATROX, 0x520, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_PC=
I },
>> +	{ PCI_VENDOR_ID_MATROX, 0x521, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_AG=
P },
>>  	{ PCI_VENDOR_ID_MATROX, 0x522, PCI_ANY_ID, PCI_ANY_ID, 0, 0,
>>  		G200_SE_A | MGAG200_FLAG_HW_BUG_NO_STARTADD},
>>  	{ PCI_VENDOR_ID_MATROX, 0x524, PCI_ANY_ID, PCI_ANY_ID, 0, 0, G200_SE=
_B
>> },
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> index 048efe635aff..54061a61e9ca 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -38,6 +38,8 @@
>>  #define RREG32(reg) ioread32(((void __iomem *)mdev->rmmio) + (reg))
>>  #define WREG32(reg, v) iowrite32(v, ((void __iomem *)mdev->rmmio) + (=
reg))
>> =20
>> +#define MGA_BIOS_OFFSET 0x7ffc
>> +
>>  #define ATTR_INDEX 0x1fc0
>>  #define ATTR_DATA 0x1fc1
>> =20
>> @@ -129,6 +131,8 @@ struct mga_mc {
>>  };
>> =20
>>  enum mga_type {
>> +	G200_PCI,
>> +	G200_AGP,
>>  	G200_SE_A,
>>  	G200_SE_B,
>>  	G200_WB,
>> @@ -167,12 +171,18 @@ struct mga_device {
>>  	int fb_mtrr;
>> =20
>>  	union {
>> +		struct {
>> +			long ref_clk;
>> +			long pclk_min;
>> +			long pclk_max;
>> +		} g200;
>>  		struct {
>>  			/* SE model number stored in reg 0x1e24 */
>>  			u32 unique_rev_id;
>>  		} g200se;
>>  	} model;
>> =20
>> +
>>  	struct mga_connector connector;
>>  	struct drm_simple_display_pipe display_pipe;
>>  };
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index 752409c7f326..bc11552415f5 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -108,6 +108,77 @@ static inline void mga_wait_busy(struct mga_devic=
e *mdev)
>>  	} while ((status & 0x01) && time_before(jiffies, timeout));
>>  }
>> =20
>> +/*
>> + * PLL setup
>> + */
>> +
>> +static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)=

>> +{
>> +	struct drm_device *dev =3D &mdev->base;
>> +	const int post_div_max =3D 7;
>> +	const int in_div_min =3D 1;
>> +	const int in_div_max =3D 6;
>> +	const int feed_div_min =3D 7;
>> +	const int feed_div_max =3D 127;
>> +	u8 testm, testn;
>> +	u8 n =3D 0, m =3D 0, p, s;
>> +	long f_vco;
>> +	long computed;
>> +	long delta, tmp_delta;
>> +	long ref_clk =3D mdev->model.g200.ref_clk;
>> +	long p_clk_min =3D mdev->model.g200.pclk_min;
>> +	long p_clk_max =3D  mdev->model.g200.pclk_max;
>> +
>> +	if (clock > p_clk_max) {
>> +		drm_err(dev, "Pixel Clock %ld too high\n", clock);
>> +		return 1;
>> +	}
>> +
>> +	if (clock <  p_clk_min >> 3)
>=20
> Looks like there's a stray space after the <. You could also just use m=
ax()
> here, but I'll leave that up to you
>=20
>> +		clock =3D p_clk_min >> 3;
>> +
>> +	f_vco =3D clock;
>> +	for (p =3D 0;
>> +	     p <=3D post_div_max && f_vco < p_clk_min;
>> +	     p =3D (p << 1) + 1, f_vco <<=3D 1)
>> +		;
>> +
>> +	delta =3D clock;
>> +
>> +	for (testm =3D in_div_min; testm <=3D in_div_max; testm++) {
>> +		for (testn =3D feed_div_min; testn <=3D feed_div_max; testn++) {
>> +			computed =3D ref_clk * (testn + 1) / (testm + 1);
>> +			if (computed < f_vco)
>> +				tmp_delta =3D f_vco - computed;
>> +			else
>> +				tmp_delta  =3D computed - f_vco;
>=20
> Another stray space before the =3D
>=20
> With those nitpicks addressed, this series is:
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks a lot.

The other patches are probably uncontoversial. Let's see what happens to
this one. :)

Best regards
Thomas

>=20
>> +			if (tmp_delta < delta) {
>> +				delta =3D tmp_delta;
>> +				m =3D testm;
>> +				n =3D testn;
>> +			}
>> +		}
>> +	}
>> +	f_vco =3D ref_clk * (n + 1) / (m + 1);
>> +	if (f_vco < 100000)
>> +		s =3D 0;
>> +	else if (f_vco < 140000)
>> +		s =3D 1;
>> +	else if (f_vco < 180000)
>> +		s =3D 2;
>> +	else
>> +		s =3D 3;
>> +
>> +	drm_dbg_kms(dev, "clock: %ld vco: %ld m: %d n: %d p: %d s: %d\n",
>> +		    clock, f_vco, m, n, p, s);
>> +
>> +	WREG_DAC(MGA1064_PIX_PLLC_M, m);
>> +	WREG_DAC(MGA1064_PIX_PLLC_N, n);
>> +	WREG_DAC(MGA1064_PIX_PLLC_P, (p | (s << 3)));
>> +
>> +	return 0;
>> +}
>> +
>>  #define P_ARRAY_SIZE 9
>> =20
>>  static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
>> @@ -717,6 +788,9 @@ static int mgag200_crtc_set_plls(struct mga_device=
 *mdev,
>> long clock)
>>  	u8 misc;
>> =20
>>  	switch(mdev->type) {
>> +	case G200_PCI:
>> +	case G200_AGP:
>> +		return mgag200_g200_set_plls(mdev, clock);
>>  	case G200_SE_A:
>>  	case G200_SE_B:
>>  		return mga_g200se_set_plls(mdev, clock);
>> @@ -894,6 +968,12 @@ static void mgag200_set_dac_regs(struct mga_devic=
e *mdev)
>>  	};
>> =20
>>  	switch (mdev->type) {
>> +	case G200_PCI:
>> +	case G200_AGP:
>> +		dacvalue[MGA1064_SYS_PLL_M] =3D 0x04;
>> +		dacvalue[MGA1064_SYS_PLL_N] =3D 0x2D;
>> +		dacvalue[MGA1064_SYS_PLL_P] =3D 0x19;
>> +		break;
>>  	case G200_SE_A:
>>  	case G200_SE_B:
>>  		dacvalue[MGA1064_VREF_CTL] =3D 0x03;
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RqskOsHSoXSaDfJbqUaIZd6RSoaFzn7cQ--

--X4ERssao1sUQsEye0WLpzygZRHV0x73gR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl8VQhEUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiOhwQgAmLNbGVxAAEt6U5CKr4B7/7WKNI66
ZZtt+ZinKkvsEZdIWh4KPmGpaY+TdulwcxH1RcHWvtLc3LBxrsBvsDQuSAInf022
aJsajT8weItQUbvGegpaH0wbojFSRl5mR2GJu0NWyKsplP/i1cc+95MQV463v22v
+83I8EhvZwjYoQyCUjeEisKc8HUIVddfE12KrjDdAsqeoutWhBt9BlcPDlkIZ+To
P/lJE/0xM8oMRzwxI8q/ERklzbyH9MpUQA3CSR4slwhwTscgO4p1BHZuWDjbrdyl
d/qCNN7PLxKul6Ucn60T/Ce0PWzv3tf6VzodhA4cFyq5ERd2e7CtJY74Mg==
=QjCS
-----END PGP SIGNATURE-----

--X4ERssao1sUQsEye0WLpzygZRHV0x73gR--

--===============1451754552==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1451754552==--
