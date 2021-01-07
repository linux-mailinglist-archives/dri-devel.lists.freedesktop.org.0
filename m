Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7926B2ECE11
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C806E424;
	Thu,  7 Jan 2021 10:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EB16E28B;
 Thu,  7 Jan 2021 10:45:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC1BCAED0;
 Thu,  7 Jan 2021 10:45:23 +0000 (UTC)
Subject: Re: [PATCH v3 8/8] drm: Upcast struct drm_device.dev to struct
 pci_device; replace pdev
To: kernel test robot <lkp@intel.com>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
References: <20210107080748.4768-9-tzimmermann@suse.de>
 <202101071706.J19283ri-lkp@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
Date: Thu, 7 Jan 2021 11:45:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <202101071706.J19283ri-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0326829144=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0326829144==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tJgV1SNd36h9nVoys3p0LHnpD6YWAprsK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tJgV1SNd36h9nVoys3p0LHnpD6YWAprsK
Content-Type: multipart/mixed; boundary="Z4YI4NmMDxFYDlF64HumYqEahAMduSxod";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel test robot <lkp@intel.com>, airlied@linux.ie, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com
Cc: kbuild-all@lists.01.org, Sam Ravnborg <sam@ravnborg.org>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Message-ID: <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
Subject: Re: [PATCH v3 8/8] drm: Upcast struct drm_device.dev to struct
 pci_device; replace pdev
References: <20210107080748.4768-9-tzimmermann@suse.de>
 <202101071706.J19283ri-lkp@intel.com>
In-Reply-To: <202101071706.J19283ri-lkp@intel.com>

--Z4YI4NmMDxFYDlF64HumYqEahAMduSxod
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

AFAICT these are false positives. The instances have been fixed already.

Am 07.01.21 um 10:45 schrieb kernel test robot:
> Hi Thomas,
>=20
> I love your patch! Yet something to improve:
>=20
> [auto build test ERROR on drm-tip/drm-tip]
> [cannot apply to drm-intel/for-linux-next linus/master v5.11-rc2 next-2=
0210104]
> [If your patch is applied to the wrong git tree, kindly drop us a note.=

> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>=20
> url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-=
Move-struct-drm_device-pdev-to-legacy/20210107-161007
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> config: x86_64-randconfig-s021-20210107 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce:
>          # apt-get install sparse
>          # sparse version: v0.6.3-208-g46a52ca4-dirty
>          # https://github.com/0day-ci/linux/commit/380912f7b62c23322562=
c40e19efd7ad84d57e9c
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Thomas-Zimmermann/drm-Move-st=
ruct-drm_device-pdev-to-legacy/20210107-161007
>          git checkout 380912f7b62c23322562c40e19efd7ad84d57e9c
>          # save the attached .config to linux build tree
>          make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'=
 ARCH=3Dx86_64
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>     drivers/gpu/drm/gma500/oaktrail_device.c: In function 'oaktrail_chi=
p_setup':
>>> drivers/gpu/drm/gma500/oaktrail_device.c:509:26: error: 'struct drm_d=
evice' has no member named 'pdev'; did you mean 'dev'?
>       509 |  if (pci_enable_msi(dev->pdev))
>           |                          ^~~~
>           |                          dev
> --
>     drivers/gpu/drm/gma500/oaktrail_lvds.c: In function 'oaktrail_lvds_=
set_power':
>>> drivers/gpu/drm/gma500/oaktrail_lvds.c:63:25: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>        63 |   pm_request_idle(&dev->pdev->dev);
>           |                         ^~~~
>           |                         dev
> --
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'get_clock'=
:
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:69:11: warning: variable=
 'tmp' set but not used [-Wunused-but-set-variable]
>        69 |  u32 val, tmp;
>           |           ^~~
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'get_data':=

>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:83:11: warning: variable=
 'tmp' set but not used [-Wunused-but-set-variable]
>        83 |  u32 val, tmp;
>           |           ^~~
>     drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'oaktrail_l=
vds_i2c_init':
>>> drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:148:35: error: 'struct drm=
_device' has no member named 'pdev'; did you mean 'dev'?
>       148 |  chan->adapter.dev.parent =3D &dev->pdev->dev;
>           |                                   ^~~~
>           |                                   dev
> --
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_driver_load':=

>>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:661:22: error: 'struct drm_device=
' has no member named 'pdev'; did you mean 'dev'?
>       661 |  pci_set_master(dev->pdev);
>           |                      ^~~~
>           |                      dev
>     In file included from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:31:
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:47: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>       690 |  dev_priv->io_start =3D pci_resource_start(dev->pdev, 0);
>           |                                               ^~~~
>     include/linux/pci.h:1854:40: note: in definition of macro 'pci_reso=
urce_start'
>      1854 | #define pci_resource_start(dev, bar) ((dev)->resource[(bar)=
].start)
>           |                                        ^~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:691:49: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>       691 |  dev_priv->vram_start =3D pci_resource_start(dev->pdev, 1);=

>           |                                                 ^~~~
>     include/linux/pci.h:1854:40: note: in definition of macro 'pci_reso=
urce_start'
>      1854 | #define pci_resource_start(dev, bar) ((dev)->resource[(bar)=
].start)
>           |                                        ^~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:692:49: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>       692 |  dev_priv->mmio_start =3D pci_resource_start(dev->pdev, 2);=

>           |                                                 ^~~~
>     include/linux/pci.h:1854:40: note: in definition of macro 'pci_reso=
urce_start'
>      1854 | #define pci_resource_start(dev, bar) ((dev)->resource[(bar)=
].start)
>           |                                        ^~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:842:33: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>       842 |  ret =3D pci_request_regions(dev->pdev, "vmwgfx probe");
>           |                                 ^~~~
>           |                                 dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:851:33: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>       851 |   ret =3D pci_request_region(dev->pdev, 2, "vmwgfx stealth =
probe");
>           |                                 ^~~~
>           |                                 dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:859:35: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>       859 |   ret =3D vmw_irq_install(dev, dev->pdev->irq);
>           |                                   ^~~~
>           |                                   dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1005:27: error: 'struct drm_dev=
ice' has no member named 'pdev'; did you mean 'dev'?
>      1005 |   pci_release_region(dev->pdev, 2);
>           |                           ^~~~
>           |                           dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1007:28: error: 'struct drm_dev=
ice' has no member named 'pdev'; did you mean 'dev'?
>      1007 |   pci_release_regions(dev->pdev);
>           |                            ^~~~
>           |                            dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_driver_unload=
':
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1056:27: error: 'struct drm_dev=
ice' has no member named 'pdev'; did you mean 'dev'?
>      1056 |   pci_release_region(dev->pdev, 2);
>           |                           ^~~~
>           |                           dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1058:28: error: 'struct drm_dev=
ice' has no member named 'pdev'; did you mean 'dev'?
>      1058 |   pci_release_regions(dev->pdev);
>           |                            ^~~~
>           |                            dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_probe':
>     drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1522:7: error: 'struct drm_devi=
ce' has no member named 'pdev'; did you mean 'dev'?
>      1522 |  dev->pdev =3D pdev;
>           |       ^~~~
>           |       dev
> --
>     drivers/gpu/drm/vmwgfx/vmwgfx_fb.c: In function 'vmw_fb_init':
>>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:641:42: error: 'struct drm_device'=
 has no member named 'pdev'; did you mean 'dev'?
>       641 |  struct device *device =3D &vmw_priv->dev->pdev->dev;
>           |                                          ^~~~
>           |                                          dev
>     In file included from drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:35:
>     At top level:
>     drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:256:23: warning: 'vmw_cursor_pl=
ane_formats' defined but not used [-Wunused-const-variable=3D]
>       256 | static const uint32_t vmw_cursor_plane_formats[] =3D {
>           |                       ^~~~~~~~~~~~~~~~~~~~~~~~
>     drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:248:23: warning: 'vmw_primary_p=
lane_formats' defined but not used [-Wunused-const-variable=3D]
>       248 | static const uint32_t vmw_primary_plane_formats[] =3D {
>           |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
> --
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_set=
_pool_size':
>>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1233:48: error: 'struct drm_de=
vice' has no member named 'pdev'; did you mean 'dev'?
>      1233 |  man->map =3D dma_alloc_coherent(&dev_priv->dev->pdev->dev,=
 size,
>           |                                                ^~~~
>           |                                                dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_man=
_create':
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1316:28: error: 'struct drm_=
device' has no member named 'pdev'; did you mean 'dev'?
>      1316 |            &dev_priv->dev->pdev->dev,
>           |                            ^~~~
>           |                            dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1325:22: error: 'struct drm_=
device' has no member named 'pdev'; did you mean 'dev'?
>      1325 |      &dev_priv->dev->pdev->dev,
>           |                      ^~~~
>           |                      dev
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function 'vmw_cmdbuf_rem=
ove_pool':
>     drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1390:42: error: 'struct drm_=
device' has no member named 'pdev'; did you mean 'dev'?
>      1390 |   dma_free_coherent(&man->dev_priv->dev->pdev->dev,
>           |                                          ^~~~
>           |                                          dev
>=20
>=20
> vim +509 drivers/gpu/drm/gma500/oaktrail_device.c
>=20
> 1b082ccf5901108 Alan Cox           2011-11-03  503
> 1b22edfd6efd02b Alan Cox           2011-11-29  504  static int oaktrail=
_chip_setup(struct drm_device *dev)
> aa0c45fdca0cff3 Alan Cox           2011-11-29  505  {
> 1b22edfd6efd02b Alan Cox           2011-11-29  506  	struct drm_psb_pri=
vate *dev_priv =3D dev->dev_private;
> 1b22edfd6efd02b Alan Cox           2011-11-29  507  	int ret;
> 1b22edfd6efd02b Alan Cox           2011-11-29  508  =09
> 9c0b6fcdc9faee5 Alan Cox           2012-05-11 @509  	if (pci_enable_msi=
(dev->pdev))
> 9c0b6fcdc9faee5 Alan Cox           2012-05-11  510  		dev_warn(dev->dev=
, "Enabling MSI failed!\n");
> 9c0b6fcdc9faee5 Alan Cox           2012-05-11  511
> 8512e0748729a49 Alan Cox           2012-05-11  512  	dev_priv->regmap =3D=
 oaktrail_regmap;
> 8512e0748729a49 Alan Cox           2012-05-11  513
> 1b22edfd6efd02b Alan Cox           2011-11-29  514  	ret =3D mid_chip_s=
etup(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  515  	if (ret < 0)
> aa0c45fdca0cff3 Alan Cox           2011-11-29  516  		return ret;
> 4086b1e2b19729e Kirill A. Shutemov 2012-05-03  517  	if (!dev_priv->has=
_gct) {
> aa0c45fdca0cff3 Alan Cox           2011-11-29  518  		/* Now pull the B=
IOS data */
> d839ede47a56ff5 Alan Cox           2012-05-03  519  		psb_intel_opregio=
n_init(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  520  		psb_intel_init_bi=
os(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  521  	}
> 6528c897966c7d5 Patrik Jakobsson   2013-11-07  522  	gma_intel_setup_gm=
bus(dev);
> 5f503148efdda26 Alan Cox           2012-05-03  523  	oaktrail_hdmi_setu=
p(dev);
> aa0c45fdca0cff3 Alan Cox           2011-11-29  524  	return 0;
> aa0c45fdca0cff3 Alan Cox           2011-11-29  525  }
> aa0c45fdca0cff3 Alan Cox           2011-11-29  526
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--Z4YI4NmMDxFYDlF64HumYqEahAMduSxod--

--tJgV1SNd36h9nVoys3p0LHnpD6YWAprsK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/25kIFAwAAAAAACgkQlh/E3EQov+Ax
ZhAAlk6YhkOQgj0DkXkR6ImjQQ0V6ekCDt80S5JdvMfkOa7l91eQkejfLII0smpWkejaBOFs/jvl
Zs6/Eh1qwVEs9zdum0eeMeK3BWKVyPw7xHVmuIapOIRVFwXM6s1oNoHc089FAKkmViAqEPbH5ZUI
L33yhTzapO+nYfHLibRUx2Olp1cxyuB27aKLSlQ/SAV/5axVmgVfYHQV2+ETsNyfZFmblwNjus8b
/r9OvwtcM9iNzE4wLMbHKZSTUDgm6c5qGDgg+03iL91aq7sMx2v2kAbmi7zUn0G+0T8Xw33AxBcT
r6Cw0mctRjU64FGbcv/1AzUMlOrdiReqaQt+DS4FJGr4HBPullX+KwKLuR6nJ3I/MMJPNbAqOGkr
/J3uetklqPFB635uoYF0LFVFAqsIgjeqcMSvby7Q1nKpelY+Ncge9qt0kgYsXaHafv1p/ZgOb3Hk
sB8xc6680uSSAAzRPJqGn+Rzj3Cb32+s/MIR/jPcHbsmSVj/8+D5wE394Ax8zPAfVs/QcM4fBiBg
gtwrHm06T11H9rJBe655psRjejMSuz7GoYrvrt7pieqfFxABuPSj93XhwfotT4qdezzlqPf1aaI8
DXJzRVGgazVpQWbAanhWoH0V+zmrhuHBqBSnKDtzkRIxKrFJzoOB1Axfn/BnSs8JVuVoJxyMqdw0
T2E=
=xw5L
-----END PGP SIGNATURE-----

--tJgV1SNd36h9nVoys3p0LHnpD6YWAprsK--

--===============0326829144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0326829144==--
