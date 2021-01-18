Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 049702FA347
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 15:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF526E3F5;
	Mon, 18 Jan 2021 14:41:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60946E25A;
 Mon, 18 Jan 2021 14:40:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F1C6B812;
 Mon, 18 Jan 2021 14:40:58 +0000 (UTC)
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
References: <20210107080748.4768-1-tzimmermann@suse.de>
 <20210107080748.4768-3-tzimmermann@suse.de>
 <324f0bd9-7430-f42e-1170-4dbfc06ea904@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 2/8] drm/amdgpu: Remove references to struct
 drm_device.pdev
Message-ID: <5ce5f636-d428-c611-9db1-3172de2d56d2@suse.de>
Date: Mon, 18 Jan 2021 15:40:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <324f0bd9-7430-f42e-1170-4dbfc06ea904@amd.com>
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
Cc: intel-gvt-dev@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1969641895=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1969641895==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3LINWdxmtI9vdGF9kmT6YxohPgw1hyDMI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3LINWdxmtI9vdGF9kmT6YxohPgw1hyDMI
Content-Type: multipart/mixed; boundary="sp1nKZl7wUYiHKZ1rDHSx2QZCQqmdHH2P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 airlied@linux.ie, daniel@ffwll.ch, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: Sam Ravnborg <sam@ravnborg.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 intel-gvt-dev@lists.freedesktop.org
Message-ID: <5ce5f636-d428-c611-9db1-3172de2d56d2@suse.de>
Subject: Re: [PATCH v3 2/8] drm/amdgpu: Remove references to struct
 drm_device.pdev
References: <20210107080748.4768-1-tzimmermann@suse.de>
 <20210107080748.4768-3-tzimmermann@suse.de>
 <324f0bd9-7430-f42e-1170-4dbfc06ea904@amd.com>
In-Reply-To: <324f0bd9-7430-f42e-1170-4dbfc06ea904@amd.com>

--sp1nKZl7wUYiHKZ1rDHSx2QZCQqmdHH2P
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.01.21 um 14:50 schrieb Christian K=C3=B6nig:
> Hi Thomas,
>=20
> this patch unfortunately completely broke amdgpu.
>=20
> See the splat below:
>=20
> [=C2=A0=C2=A0 74.553881]=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0 74.554060] BUG: KASAN: null-ptr-deref in=20
> drm_pci_set_busid+0x38/0x100 [drm]
> [=C2=A0=C2=A0 74.554393] Read of size 4 at addr 0000000000000038 by tas=
k Xorg/1115
>=20
> [=C2=A0=C2=A0 74.554585] CPU: 6 PID: 1115 Comm: Xorg Not tainted 5.11.0=
-rc2+ #75
> [=C2=A0=C2=A0 74.554594] Hardware name: System manufacturer System Prod=
uct=20
> Name/PRIME X399-A, BIOS 0808 10/12/2018
> [=C2=A0=C2=A0 74.554600] Call Trace:
> [=C2=A0=C2=A0 74.554605]=C2=A0 dump_stack+0x9d/0xce
> [=C2=A0=C2=A0 74.554616]=C2=A0 ? drm_pci_set_busid+0x38/0x100 [drm]
> [=C2=A0=C2=A0 74.554787]=C2=A0 kasan_report.cold+0x5d/0xd1
> [=C2=A0=C2=A0 74.554799]=C2=A0 ? drm_pci_set_busid+0x38/0x100 [drm]
> [=C2=A0=C2=A0 74.554969]=C2=A0 __asan_load4+0x6b/0x90
> [=C2=A0=C2=A0 74.554978]=C2=A0 drm_pci_set_busid+0x38/0x100 [drm]
> [=C2=A0=C2=A0 74.555148]=C2=A0 drm_setversion+0x2ce/0x350 [drm]
> [=C2=A0=C2=A0 74.555315]=C2=A0 ? drm_is_current_master+0x5d/0x70 [drm]
> [=C2=A0=C2=A0 74.555481]=C2=A0 drm_ioctl_kernel+0x16d/0x1c0 [drm]
> [=C2=A0=C2=A0 74.555648]=C2=A0 ? drm_ioctl_permit+0xb0/0xb0 [drm]
> [=C2=A0=C2=A0 74.555811]=C2=A0 ? drm_setversion+0x350/0x350 [drm]
> [=C2=A0=C2=A0 74.555973]=C2=A0 ? check_stack_object+0x2d/0xb0
> [=C2=A0=C2=A0 74.555985]=C2=A0 drm_ioctl+0x363/0x5a0 [drm]
> [=C2=A0=C2=A0 74.556147]=C2=A0 ? drm_ioctl_permit+0xb0/0xb0 [drm]
> [=C2=A0=C2=A0 74.556310]=C2=A0 ? drm_ioctl_kernel+0x1c0/0x1c0 [drm]
> [=C2=A0=C2=A0 74.556473]=C2=A0 ? __kasan_check_write+0x14/0x20
> [=C2=A0=C2=A0 74.556481]=C2=A0 ? _raw_spin_lock_irqsave+0x8e/0xf0
> [=C2=A0=C2=A0 74.556492]=C2=A0 ? _raw_spin_trylock_bh+0x100/0x100
> [=C2=A0=C2=A0 74.556504]=C2=A0 amdgpu_drm_ioctl+0x7e/0xd0 [amdgpu]
> [=C2=A0=C2=A0 74.557409]=C2=A0 __x64_sys_ioctl+0xc3/0x100
> [=C2=A0=C2=A0 74.557418]=C2=A0 do_syscall_64+0x38/0x90
> [=C2=A0=C2=A0 74.557427]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9=

>=20
> Any idea what's going wrong here?

I meanwhile posted an updated patchset with a fix in patch 1. [1] Maybe=20
you can apply this one and test.

The original bug report and testing is at [2]. Apparently, DRM core has=20
to be changed together with drivers. I'm honestly not sure why.

Best regards
Thomas

[1]=20
https://lore.kernel.org/dri-devel/20210118131420.15874-1-tzimmermann@suse=
=2Ede/T/#m8a0cdf02375a4e23e194d2e7eb80e8738632ea84
[2]=20
https://lore.kernel.org/dri-devel/7851c78c-8c57-3c84-cd49-a72703095a5d@su=
se.de/

>=20
> Thanks in advance,
> Christian.
>=20
> Am 07.01.21 um 09:07 schrieb Thomas Zimmermann:
>> Using struct drm_device.pdev is deprecated. Convert amdgpu to struct
>> drm_device.dev. No functional changes.
>>
>> v3:
>> =C2=A0=C2=A0=C2=A0=C2=A0* rebased
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=C2=A0 | 17 ++++++++-=
--------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c |=C2=A0 1 +
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 -
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 10 +++++-----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 2 +-
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c=C2=A0=C2=A0=C2=A0=C2=A0=
 | 10 +++++-----
>> =C2=A0 7 files changed, 21 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index 7d16395ede0a..f7e2a878411e 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -1423,9 +1423,9 @@ static void amdgpu_switcheroo_set_state(struct=20
>> pci_dev *pdev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* don't suspen=
d or resume card normally */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->switch_pow=
er_state =3D DRM_SWITCH_POWER_CHANGING;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_set_power_state(dev->p=
dev, PCI_D0);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_load_pci_sta=
te(dev->pdev);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D pci_enable_device(de=
v->pdev);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_set_power_state(pdev, =
PCI_D0);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_load_pci_sta=
te(pdev);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D pci_enable_device(pd=
ev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 DRM_WARN("pci_enable_device failed (%d)\n", r);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_r=
esume(dev, true);
>> @@ -1437,10 +1437,10 @@ static void amdgpu_switcheroo_set_state(struct=
=20
>> pci_dev *pdev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_kms_helper_=
poll_disable(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->switch_pow=
er_state =3D DRM_SWITCH_POWER_CHANGING;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_s=
uspend(dev, true);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_cache_pci_st=
ate(dev->pdev);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_device_cache_pci_st=
ate(pdev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Shut down th=
e device */
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_device(dev->pd=
ev);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_set_power_state(dev->p=
dev, PCI_D3cold);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_disable_device(pdev);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_set_power_state(pdev, =
PCI_D3cold);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev->switch_pow=
er_state =3D DRM_SWITCH_POWER_OFF;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0 }
>> @@ -1703,8 +1703,7 @@ static void=20
>> amdgpu_device_enable_virtual_display(struct amdgpu_device *adev)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adev->enable_virtual_display =3D false;=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (amdgpu_virtual_display) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_device *ddev =3D=
 adev_to_drm(adev);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *pci_address_na=
me =3D pci_name(ddev->pdev);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *pci_address_na=
me =3D pci_name(adev->pdev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *pciaddstr=
, *pciaddstr_tmp, *pciaddname_tmp, *pciaddname;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pciaddstr =3D k=
strdup(amdgpu_virtual_display, GFP_KERNEL);
>> @@ -3397,7 +3396,7 @@ int amdgpu_device_init(struct amdgpu_device *ade=
v,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 pci_enable_pcie_error_reporting(adev->ddev.pdev);
>> +=C2=A0=C2=A0=C2=A0 pci_enable_pcie_error_reporting(adev->pdev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Post card if necessary */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (amdgpu_device_need_post(adev)) {
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> index f764803c53a4..0150a51b65ef 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
>> @@ -926,6 +926,7 @@ amdgpu_display_user_framebuffer_create(struct=20
>> drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
struct drm_file *file_priv,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
const struct drm_mode_fb_cmd2 *mode_cmd)
>> =C2=A0 {
>> +=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D drm_to_adev(dev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_gem_object *obj;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_framebuffer *amdgpu_fb;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int ret;
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 72efd579ec5e..b4ea67e12ada 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1204,7 +1204,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev=
,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>> -=C2=A0=C2=A0=C2=A0 ddev->pdev =3D pdev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci_set_drvdata(pdev, ddev);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D amdgpu_driver_load_kms(adev, en=
t->driver_data);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>> index 0bf7d36c6686..51cd49c6f38f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
>> @@ -271,7 +271,7 @@ static int amdgpufb_create(struct drm_fb_helper=20
>> *helper,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_INFO("fb depth is %d\n", fb->format=
->depth);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_INFO("=C2=A0=C2=A0 pitch is %d\n", =
fb->pitches[0]);
>> -=C2=A0=C2=A0=C2=A0 vga_switcheroo_client_fb_set(adev_to_drm(adev)->pd=
ev, info);
>> +=C2=A0=C2=A0=C2=A0 vga_switcheroo_client_fb_set(adev->pdev, info);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 out:
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index d0a1fee1f5f6..a5c42c3004a0 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -619,7 +619,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,=20
>> void *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int r =3D 0;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->va_address < AMDGPU_VA_RESERV=
ED_SIZE) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&dev->pdev->dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev->dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "va_address 0x%LX is in reserved area 0x%LX\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args->va_address, AMDGPU_VA_RESERVED_SIZE);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;=

>> @@ -627,7 +627,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,=20
>> void *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->va_address >=3D AMDGPU_GMC_HO=
LE_START &&
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 args->va_addres=
s < AMDGPU_GMC_HOLE_END) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&dev->pdev->dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev->dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "va_address 0x%LX is in VA hole 0x%LX-0x%LX\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args->va_address, AMDGPU_GMC_HOLE_START,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 AMDGPU_GMC_HOLE_END);
>> @@ -639,14 +639,14 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, =

>> void *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm_size =3D adev->vm_manager.max_pfn * =
AMDGPU_GPU_PAGE_SIZE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vm_size -=3D AMDGPU_VA_RESERVED_SIZE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (args->va_address + args->map_size >=
 vm_size) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&dev->pdev->dev,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev->dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "va_address 0x%llx is in top reserved area 0x%llx\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args->va_address + args->map_size, vm_size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ((args->flags & ~valid_flags) && (ar=
gs->flags & ~prt_flags)) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&dev->pdev->dev, "=
invalid flags combination 0x%08X\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev->dev, "invalid=
 flags combination 0x%08X\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args->flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -658,7 +658,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev,=20
>> void *data,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case AMDGPU_VA_OP_REPLACE:
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&dev->pdev->dev, "=
unsupported operation %d\n",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev->dev, "unsuppo=
rted operation %d\n",
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 args->operation);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>> index 47cad23a6b9e..bca4dddd5a15 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
>> @@ -176,7 +176,7 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct=20
>> drm_device *dev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c->rec =3D *rec;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c->adapter.owner =3D THIS_MODULE;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c->adapter.class =3D I2C_CLASS_DDC;
>> -=C2=A0=C2=A0=C2=A0 i2c->adapter.dev.parent =3D &dev->pdev->dev;
>> +=C2=A0=C2=A0=C2=A0 i2c->adapter.dev.parent =3D dev->dev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c->dev =3D dev;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c_set_adapdata(&i2c->adapter, i2c);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mutex_init(&i2c->mutex);
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c=20
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> index b16b32797624..3c37cf1ae8b7 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
>> @@ -142,7 +142,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device=20
>> *adev, unsigned long flags)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (amdgpu_is_atpx=
_hybrid() ||
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amdgpu_ha=
s_atpx_dgpu_power_cntl()) &&
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ((flags & AMD_I=
S_APU) =3D=3D 0) &&
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !pci_is_thunderbolt_attach=
ed(dev->pdev))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !pci_is_thunderbolt_attach=
ed(to_pci_dev(dev->dev)))
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flags |=3D AMD_=
IS_PX;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 parent =3D pci_upstream_bridge(adev->pd=
ev);
>> @@ -156,7 +156,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device=20
>> *adev, unsigned long flags)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r =3D amdgpu_device_init(adev, flags);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (r) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(&dev->pdev->dev, "=
Fatal error during GPU init\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev->dev, "Fatal e=
rror during GPU init\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto out;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> @@ -199,7 +199,7 @@ int amdgpu_driver_load_kms(struct amdgpu_device=20
>> *adev, unsigned long flags)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 acpi_status =3D amdgpu_acpi_init(adev);=

>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (acpi_status)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(&dev->pdev->dev, "=
Error during ACPI methods call\n");
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_dbg(dev->dev, "Error d=
uring ACPI methods call\n");
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (adev->runpm) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* only need to=
 skip on ATPX */
>> @@ -735,10 +735,10 @@ int amdgpu_info_ioctl(struct drm_device *dev,=20
>> void *data, struct drm_file *filp)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!dev_info)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return -ENOMEM;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->device_id =3D de=
v->pdev->device;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->device_id =3D ad=
ev->pdev->device;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->chip_=
rev =3D adev->rev_id;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->exter=
nal_rev =3D adev->external_rev_id;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->pci_rev =3D dev-=
>pdev->revision;
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->pci_rev =3D adev=
->pdev->revision;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->famil=
y =3D adev->family;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->num_s=
hader_engines =3D=20
>> adev->gfx.config.max_shader_engines;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info->num_s=
hader_arrays_per_engine =3D=20
>> adev->gfx.config.max_sh_per_se;
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--sp1nKZl7wUYiHKZ1rDHSx2QZCQqmdHH2P--

--3LINWdxmtI9vdGF9kmT6YxohPgw1hyDMI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmAFnfgFAwAAAAAACgkQlh/E3EQov+AX
GA//duTS/2yAqmrnaJKXvyZu2WS2snSREtb1C3w69MsbA8/ZE6Li7MhPthTbHUzybZ92oZjUh2se
mgoLKwUroeV1U2C25uwaPQvrb6hRxmxwZFmWYDYeZVoplouob3JvSAi1apdTt9It712U2COP2xIy
QtsIBN3RJq2hTkLkGsezA+GpExxaRnkIaBLFBuKQf+hzz3rWaU2pklhXe1RehrDS/5C9jaXo/bW4
jCOtlj4H24rJe5pxWtiZexbqAFKTV19Ev0j3ZBgUkoeeMOS/IO1oPQpvLF2A1zWGvQKogCI3Z1/J
ZyIz22/bqdQ75h5lxOxjvEJUKfMu7yo5uo7FbUpjaXB/qYVMB4Svv+GFJL6Tcg2nHnQynaPQqLS/
Cd05++5Bt4v90Mrl/A95eyCvYNw+6qX7fES83H+9eILQjpZtF/qVIUk8ywQoQHBdTITN+GJV0XJi
csPr2iwTvzGDwC41zfIN2CQcmtnzEt6rmmah4/q/e6fQxE/QDp4gj/Y0a9aIXZXiR7fJiFkEh5dt
XRXfCssiMiAGCJIF+hhFGFvjwKlSjgxBcMrgmlle0X0Rxw1jRmnpyGYGWwMwgPYzjsTFXwx8k/d5
SU5E6q6laZljthTZwtsTtDCJv3Y61tb1pfy0Ou+8EaR3Usb9L+AeCN1uAHNhQihOVmMlq6O0UI8V
MM8=
=BZ+m
-----END PGP SIGNATURE-----

--3LINWdxmtI9vdGF9kmT6YxohPgw1hyDMI--

--===============1969641895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1969641895==--
