Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3922EEE4C
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47C6E7D9;
	Fri,  8 Jan 2021 08:04:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527F26E7D3;
 Fri,  8 Jan 2021 08:04:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEA14AD57;
 Fri,  8 Jan 2021 08:04:45 +0000 (UTC)
Subject: Re: [kbuild-all] Re: [PATCH v3 8/8] drm: Upcast struct drm_device.dev
 to struct pci_device; replace pdev
To: Rong Chen <rong.a.chen@intel.com>, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
References: <20210107080748.4768-9-tzimmermann@suse.de>
 <202101071706.J19283ri-lkp@intel.com>
 <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
 <7486aeef-9fa4-91cb-8e95-383990cf3567@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <5ea2a270-2664-fad4-0048-ef498137e985@suse.de>
Date: Fri, 8 Jan 2021 09:04:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7486aeef-9fa4-91cb-8e95-383990cf3567@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1760958607=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1760958607==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="M6ZQ7GQfZyXiH3rSkDewFLpWLttqZZLLF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--M6ZQ7GQfZyXiH3rSkDewFLpWLttqZZLLF
Content-Type: multipart/mixed; boundary="XVIYahJkxgNc1IX3Y50TSbQKGkD0hLYE2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rong Chen <rong.a.chen@intel.com>, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: kbuild-all@lists.01.org, Sam Ravnborg <sam@ravnborg.org>,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Message-ID: <5ea2a270-2664-fad4-0048-ef498137e985@suse.de>
Subject: Re: [kbuild-all] Re: [PATCH v3 8/8] drm: Upcast struct drm_device.dev
 to struct pci_device; replace pdev
References: <20210107080748.4768-9-tzimmermann@suse.de>
 <202101071706.J19283ri-lkp@intel.com>
 <3c496f96-5efa-41d2-5911-1495619fab68@suse.de>
 <7486aeef-9fa4-91cb-8e95-383990cf3567@intel.com>
In-Reply-To: <7486aeef-9fa4-91cb-8e95-383990cf3567@intel.com>

--XVIYahJkxgNc1IX3Y50TSbQKGkD0hLYE2
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.01.21 um 02:25 schrieb Rong Chen:
> Hi Thomas,
>=20
> Thanks for the feedback, do you mean the patch was applied to a wrong b=
ase?

I'm on drm-tip, which already has the patches that fix these issues. I=20
think I should start using git's --base option when sending out patchsets=
=2E

Best regards
Thomas

>=20
> Best Regards,
> Rong Chen
>=20
> On 1/7/21 6:45 PM, Thomas Zimmermann wrote:
>> AFAICT these are false positives. The instances have been fixed alread=
y.
>>
>> Am 07.01.21 um 10:45 schrieb kernel test robot:
>>> Hi Thomas,
>>>
>>> I love your patch! Yet something to improve:
>>>
>>> [auto build test ERROR on drm-tip/drm-tip]
>>> [cannot apply to drm-intel/for-linux-next linus/master v5.11-rc2=20
>>> next-20210104]
>>> [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
>>> And when submitting patch, we suggest to use '--base' as documented i=
n
>>> https://git-scm.com/docs/git-format-patch]
>>>
>>> url:=20
>>> https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Move-s=
truct-drm_device-pdev-to-legacy/20210107-161007=20
>>>
>>> base:=A0=A0 git://anongit.freedesktop.org/drm/drm-tip drm-tip
>>> config: x86_64-randconfig-s021-20210107 (attached as .config)
>>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>>> reproduce:
>>> =A0=A0=A0=A0=A0=A0=A0=A0 # apt-get install sparse
>>> =A0=A0=A0=A0=A0=A0=A0=A0 # sparse version: v0.6.3-208-g46a52ca4-dirty=

>>> =A0=A0=A0=A0=A0=A0=A0=A0 #=20
>>> https://github.com/0day-ci/linux/commit/380912f7b62c23322562c40e19efd=
7ad84d57e9c=20
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0 git remote add linux-review https://github.c=
om/0day-ci/linux
>>> =A0=A0=A0=A0=A0=A0=A0=A0 git fetch --no-tags linux-review=20
>>> Thomas-Zimmermann/drm-Move-struct-drm_device-pdev-to-legacy/20210107-=
161007=20
>>>
>>> =A0=A0=A0=A0=A0=A0=A0=A0 git checkout 380912f7b62c23322562c40e19efd7a=
d84d57e9c
>>> =A0=A0=A0=A0=A0=A0=A0=A0 # save the attached .config to linux build t=
ree
>>> =A0=A0=A0=A0=A0=A0=A0=A0 make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -=
D__CHECK_ENDIAN__'=20
>>> ARCH=3Dx86_64
>>>
>>> If you fix the issue, kindly add following tag as appropriate
>>> Reported-by: kernel test robot <lkp@intel.com>
>>>
>>> All errors (new ones prefixed by >>):
>>>
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_device.c: In function=20
>>> 'oaktrail_chip_setup':
>>>>> drivers/gpu/drm/gma500/oaktrail_device.c:509:26: error: 'struct=20
>>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 509 |=A0 if (pci_enable_msi(dev->pdev))
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> --=20
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds.c: In function=20
>>> 'oaktrail_lvds_set_power':
>>>>> drivers/gpu/drm/gma500/oaktrail_lvds.c:63:25: error: 'struct=20
>>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0=A0 63 |=A0=A0 pm_request_idle(&dev->pdev->dev);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> --=20
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'ge=
t_clock':
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:69:11: warning: =

>>> variable 'tmp' set but not used [-Wunused-but-set-variable]
>>> =A0=A0=A0=A0=A0=A0 69 |=A0 u32 val, tmp;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function 'ge=
t_data':
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:83:11: warning: =

>>> variable 'tmp' set but not used [-Wunused-but-set-variable]
>>> =A0=A0=A0=A0=A0=A0 83 |=A0 u32 val, tmp;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~
>>> =A0=A0=A0 drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c: In function=20
>>> 'oaktrail_lvds_i2c_init':
>>>>> drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c:148:35: error: 'struct=20
>>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 148 |=A0 chan->adapter.dev.parent =3D &dev->pdev->dev=
;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> --=20
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_drive=
r_load':
>>>>> drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:661:22: error: 'struct=20
>>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 661 |=A0 pci_set_master(dev->pdev);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:3=
1:
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:47: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 690 |=A0 dev_priv->io_start =3D pci_resource_start(de=
v->pdev, 0);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0 include/linux/pci.h:1854:40: note: in definition of macro=20
>>> 'pci_resource_start'
>>> =A0=A0=A0=A0 1854 | #define pci_resource_start(dev, bar)=20
>>> ((dev)->resource[(bar)].start)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 ^~~
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:691:49: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 691 |=A0 dev_priv->vram_start =3D pci_resource_start(=
dev->pdev, 1);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0 include/linux/pci.h:1854:40: note: in definition of macro=20
>>> 'pci_resource_start'
>>> =A0=A0=A0=A0 1854 | #define pci_resource_start(dev, bar)=20
>>> ((dev)->resource[(bar)].start)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 ^~~
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:692:49: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 692 |=A0 dev_priv->mmio_start =3D pci_resource_start(=
dev->pdev, 2);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0 include/linux/pci.h:1854:40: note: in definition of macro=20
>>> 'pci_resource_start'
>>> =A0=A0=A0=A0 1854 | #define pci_resource_start(dev, bar)=20
>>> ((dev)->resource[(bar)].start)
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 ^~~
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:842:33: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 842 |=A0 ret =3D pci_request_regions(dev->pdev, "vmwg=
fx probe");
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:851:33: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 851 |=A0=A0 ret =3D pci_request_region(dev->pdev, 2, =
"vmwgfx stealth=20
>>> probe");
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:859:35: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 859 |=A0=A0 ret =3D vmw_irq_install(dev, dev->pdev->i=
rq);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1005:27: error: 'struct=
=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1005 |=A0=A0 pci_release_region(dev->pdev, 2);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1007:28: error: 'struct=
=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1007 |=A0=A0 pci_release_regions(dev->pdev);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function=20
>>> 'vmw_driver_unload':
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1056:27: error: 'struct=
=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1056 |=A0=A0 pci_release_region(dev->pdev, 2);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1058:28: error: 'struct=
=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1058 |=A0=A0 pci_release_regions(dev->pdev);
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_probe=
':
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:1522:7: error: 'struct =

>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1522 |=A0 dev->pdev =3D pdev;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0 dev
>>> --=20
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_fb.c: In function 'vmw_fb_ini=
t':
>>>>> drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:641:42: error: 'struct=20
>>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0=A0 641 |=A0 struct device *device =3D &vmw_priv->dev->pd=
ev->dev;
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 dev
>>> =A0=A0=A0 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_fb.c:35=
:
>>> =A0=A0=A0 At top level:
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:256:23: warning:=20
>>> 'vmw_cursor_plane_formats' defined but not used=20
>>> [-Wunused-const-variable=3D]
>>> =A0=A0=A0=A0=A0 256 | static const uint32_t vmw_cursor_plane_formats[=
] =3D {
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h:248:23: warning:=20
>>> 'vmw_primary_plane_formats' defined but not used=20
>>> [-Wunused-const-variable=3D]
>>> =A0=A0=A0=A0=A0 248 | static const uint32_t vmw_primary_plane_formats=
[] =3D {
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~
>>> --=20
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function=20
>>> 'vmw_cmdbuf_set_pool_size':
>>>>> drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1233:48: error: 'struct=20
>>>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1233 |=A0 man->map =3D dma_alloc_coherent(&dev_priv->dev=
->pdev->dev,=20
>>> size,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function=20
>>> 'vmw_cmdbuf_man_create':
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1316:28: error: 'str=
uct=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1316 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 &dev_priv->dev->=
pdev->dev,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1325:22: error: 'str=
uct=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1325 |=A0=A0=A0=A0=A0 &dev_priv->dev->pdev->dev,
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 dev
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c: In function=20
>>> 'vmw_cmdbuf_remove_pool':
>>> =A0=A0=A0 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:1390:42: error: 'str=
uct=20
>>> drm_device' has no member named 'pdev'; did you mean 'dev'?
>>> =A0=A0=A0=A0 1390 | dma_free_coherent(&man->dev_priv->dev->pdev->dev,=

>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 ^~~~
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 dev
>>>
>>>
>>> vim +509 drivers/gpu/drm/gma500/oaktrail_device.c
>>>
>>> 1b082ccf5901108 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-03=A0 =
503
>>> 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
504=A0 static int=20
>>> oaktrail_chip_setup(struct drm_device *dev)
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
505=A0 {
>>> 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
506=A0=A0=A0=A0=A0 struct=20
>>> drm_psb_private *dev_priv =3D dev->dev_private;
>>> 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
507=A0=A0=A0=A0=A0 int ret;
>>> 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
508
>>> 9c0b6fcdc9faee5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11 @50=
9=A0=A0=A0=A0=A0 if=20
>>> (pci_enable_msi(dev->pdev))
>>> 9c0b6fcdc9faee5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=A0 =
510 dev_warn(dev->dev,=20
>>> "Enabling MSI failed!\n");
>>> 9c0b6fcdc9faee5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=A0 =
511
>>> 8512e0748729a49 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=A0 =
512 dev_priv->regmap =3D=20
>>> oaktrail_regmap;
>>> 8512e0748729a49 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-11=A0 =
513
>>> 1b22edfd6efd02b Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
514=A0=A0=A0=A0=A0 ret =3D=20
>>> mid_chip_setup(dev);
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
515=A0=A0=A0=A0=A0 if (ret < 0)
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
516 return ret;
>>> 4086b1e2b19729e Kirill A. Shutemov 2012-05-03=A0 517=A0=A0=A0=A0=A0 i=
f=20
>>> (!dev_priv->has_gct) {
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
518=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Now=20
>>> pull the BIOS data */
>>> d839ede47a56ff5 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-03=A0 =
519=20
>>> psb_intel_opregion_init(dev);
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
520=20
>>> psb_intel_init_bios(dev);
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
521=A0=A0=A0=A0=A0 }
>>> 6528c897966c7d5 Patrik Jakobsson=A0=A0 2013-11-07=A0 522=20
>>> gma_intel_setup_gmbus(dev);
>>> 5f503148efdda26 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2012-05-03=A0 =
523=20
>>> oaktrail_hdmi_setup(dev);
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
524=A0=A0=A0=A0=A0 return 0;
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
525=A0 }
>>> aa0c45fdca0cff3 Alan Cox=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 2011-11-29=A0 =
526
>>>
>>> ---
>>> 0-DAY CI Kernel Test Service, Intel Corporation
>>> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>>>
>>
>>
>> _______________________________________________
>> kbuild-all mailing list -- kbuild-all@lists.01.org
>> To unsubscribe send an email to kbuild-all-leave@lists.01.org
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--XVIYahJkxgNc1IX3Y50TSbQKGkD0hLYE2--

--M6ZQ7GQfZyXiH3rSkDewFLpWLttqZZLLF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/4EhwFAwAAAAAACgkQlh/E3EQov+Bf
uA/+LNtvmG2bFCJBg9Iifz728Lwt8zz7xyE3ishAlrz34UJsku+adHHUic2IAqUHTFxqjLIj5uX/
hiNi7WBiEpXdnBn87jQRgv4uUtVL5N4oXrTssFmrRSkH4IYoygBlXUtjII1H21XFGNjStFhRp0/F
/SnuZwj0wM4saJdhKkBV0V1T2wyrJhHJKx+QEl19N09dj5l6VO8K7YuIjoSMarh88pNusKqZDXng
0V2McrUQhrVvM0FVoAIiMHREWZ8Wo6zeesczVTuBcspAo8ND12Kwfkl98OgEuBjCcYQ7uDttjygc
Qkct634T+2/h6LrPDw0/cwh6acNHFgUDbpFGgkdZCOFKvZ5vjlU40pr01v/AXOfbECvBlzEtW0Vw
6wYBEvtzOxeE+CUgain87ukk0gmg54fDuHbFSX5h98aj1NcmdFIOoOM+HqF6emEwaMUZsC296KJy
fikL9LVaeQ+GxEraTpB0qE4JflEQgrIpCv6z5SGKKiu2ROLL2QKJZF0vV26uPObu0vp2eByNZDk3
KtvOLOJpY1pJul5sveCX/UA6HDhJ3q7PIkIC5E6XCABkER2p9bhOx79CVJ9yMjP3dFe7yH50jJHA
atkxUFXgZgw5PQZSu3JnYNKewCqrpjO+nyWmy9Mv7NRAZOpwJm7l2NabS4hCLSMzUz6slhEm1W7M
NCU=
=LpaK
-----END PGP SIGNATURE-----

--M6ZQ7GQfZyXiH3rSkDewFLpWLttqZZLLF--

--===============1760958607==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1760958607==--
