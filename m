Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9239BC86ECA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D6710E453;
	Tue, 25 Nov 2025 20:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=shazbot.org header.i=@shazbot.org header.b="2CPM9Eqq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="rn5f9DmC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7EC10E453;
 Tue, 25 Nov 2025 20:08:19 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 5FA291D00137;
 Tue, 25 Nov 2025 15:08:18 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 25 Nov 2025 15:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1764101298;
 x=1764187698; bh=6XU0yQ0I1CKC+Y4TnTi5C9J9xm3SSaQ4u7Y7QHFJglE=; b=
 2CPM9EqqX6w79SHpS3MKYmcSZHMb0iAs59+2o5yo9RsqAERBb1GqntQYCo3WEVnR
 DFLBuikbPw2AiSIrRx6n+MdRoiyI1+oDAjxq25r2okWA581Drkb943w0tfLI8VpA
 GLJR8nGf5gCDBwOPUG9RphFlvQxtkMmL89e+O60aaYaJpA+pyhrVHTN9EkIZew/9
 cEuTHqAicccv6zgOYsr3ShWtMBwlodcOrHC0n7ZmCJsXJza+agve8a3zCkLJJE8s
 zQum/AjH2iIIjXN8gWthGPpvwpBR9sKkneVnL6tO9PxmJ4JG7MfRzAzVHCefquTF
 znnb1ZgJ7sB3OelbwaOJbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1764101298; x=
 1764187698; bh=6XU0yQ0I1CKC+Y4TnTi5C9J9xm3SSaQ4u7Y7QHFJglE=; b=r
 n5f9DmCI1LLN2q0FGUEgB+klxx96hVe5ZlbND5N1pvfTUMhtzGC11YD5+Q5clCox
 NwVQ/HwpLd0kTATIGqQ6G1ZudGeEymhGr+tdpdWTH+IUuu/LonCNRwglSYrg2adC
 S5NjojyDfiHSaf/e1PXNVx+wpCEQNfcnSCDB/5UGjiTN2JRuzL8DY0SMlgrf6VAO
 MHcPRdbEy9b1/xIa9Q8ZyReGwgLIqq6djzSTMwB7rHJ/Jv4t9CkCpooRj+GEwAd7
 fuYnPIAGTyDyktAWJu3Sp7Zp5iR3JsHZwevYuG1IN7XRGg68SRckXLTjijhwtRr6
 Tv9p23GFIhTSIQ3FLavsg==
X-ME-Sender: <xms:sQwmaUIZ9Yd873OFsZFH4azhECyKeukg4Pn4yRhrWQcIMGCpnn-NSA>
 <xme:sQwmaUnUUbj1u_0oOeDO-eFhW4hfop4ZT6e2R2O1WLkbk_sqDzIKh9lOU3srzrOO7
 XVsyD0vH60zLU-Yi__BReWDO8GHk5u-eSLp8_1frKTL8RxGpWMKlQ>
X-ME-Received: <xmr:sQwmaaI8m9UfhAi9Jsf_PQpWZuNHK90PnwlV7cEbq2Xd2SMV3O1zhaU8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgedvfeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkjghfgggtgfesthhqredttddtjeenucfhrhhomheptehlvgigucgh
 ihhllhhirghmshhonhcuoegrlhgvgiesshhhrgiisghothdrohhrgheqnecuggftrfgrth
 htvghrnhepgfffvdefjeejueevfeetudfhgeetfeeuheetfeekjedvuddvueehffdtgeej
 keetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hlvgigsehshhgriigsohhtrdhorhhgpdhnsggprhgtphhtthhopedvuddpmhhouggvpehs
 mhhtphhouhhtpdhrtghpthhtohepmhhitghhrghlrdifihhnihgrrhhskhhisehinhhtvg
 hlrdgtohhmpdhrtghpthhtoheplhhutggrshdruggvmhgrrhgthhhisehinhhtvghlrdgt
 ohhmpdhrtghpthhtohepthhhohhmrghsrdhhvghllhhsthhrohhmsehlihhnuhigrdhinh
 htvghlrdgtohhmpdhrtghpthhtoheprhhoughrihhgohdrvhhivhhisehinhhtvghlrdgt
 ohhmpdhrtghpthhtohepjhhgghesiihivghpvgdrtggrpdhrtghpthhtohephihishhhrg
 hihhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepkhgvvhhinhdrthhirghnsehinhht
 vghlrdgtohhmpdhrtghpthhtohepshhkohhlohhthhhumhhthhhosehnvhhiughirgdrtg
 homhdprhgtphhtthhopehinhhtvghlqdigvgeslhhishhtshdrfhhrvggvuggvshhkthho
 phdrohhrgh
X-ME-Proxy: <xmx:sQwmafWzIuM7zERfKYLATL0v6x4NCFOq0iGpMnTqdZcQa6AwZZs2wQ>
 <xmx:sQwmafM1CDfg98ovBvFe8JvsvxC1yQo3Ct81vh-8j6n_pY2rCeD32g>
 <xmx:sQwmablRxFpwm5pCUsABOrWYhYQRd7GqMDmoKIsaNXm4XSfIRIIwNg>
 <xmx:sQwmaSXnUDJhgkXZCGs4LuqQECtIeH8km0hroH8yDbwfUyaP6Ssq4g>
 <xmx:sgwmaZsN1YCDwjTRI8Qwof1VAVKaazz-co1f44po75q5PmVUbRVqE2Jv>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Nov 2025 15:08:15 -0500 (EST)
Date: Tue, 25 Nov 2025 13:08:14 -0700
From: Alex Williamson <alex@shazbot.org>
To: =?UTF-8?B?TWljaGHFgg==?= Winiarski <michal.winiarski@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas
 <yishaih@nvidia.com>, Kevin Tian <kevin.tian@intel.com>, Shameer Kolothum
 <skolothumtho@nvidia.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>, Matthew Brost
 <matthew.brost@intel.com>, "Michal Wajdeczko" <michal.wajdeczko@intel.com>,
 <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>, Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v6 4/4] vfio/xe: Add device specific vfio_pci driver
 variant for Intel graphics
Message-ID: <20251125130814.1c0bb7e3.alex@shazbot.org>
In-Reply-To: <20251124230841.613894-5-michal.winiarski@intel.com>
References: <20251124230841.613894-1-michal.winiarski@intel.com>
 <20251124230841.613894-5-michal.winiarski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 25 Nov 2025 00:08:41 +0100
Micha=C5=82 Winiarski <michal.winiarski@intel.com> wrote:

> In addition to generic VFIO PCI functionality, the driver implements
> VFIO migration uAPI, allowing userspace to enable migration for Intel
> Graphics SR-IOV Virtual Functions.
> The driver binds to VF device and uses API exposed by Xe driver to
> transfer the VF migration data under the control of PF device.
>=20
> Signed-off-by: Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> ---
>  MAINTAINERS                  |   7 +
>  drivers/vfio/pci/Kconfig     |   2 +
>  drivers/vfio/pci/Makefile    |   2 +
>  drivers/vfio/pci/xe/Kconfig  |  12 +
>  drivers/vfio/pci/xe/Makefile |   3 +
>  drivers/vfio/pci/xe/main.c   | 568 +++++++++++++++++++++++++++++++++++
>  6 files changed, 594 insertions(+)
>  create mode 100644 drivers/vfio/pci/xe/Kconfig
>  create mode 100644 drivers/vfio/pci/xe/Makefile
>  create mode 100644 drivers/vfio/pci/xe/main.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index acc951f122eaf..adb5aa9cd29e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27025,6 +27025,13 @@ L:	virtualization@lists.linux.dev
>  S:	Maintained
>  F:	drivers/vfio/pci/virtio
> =20
> +VFIO XE PCI DRIVER
> +M:	Micha=C5=82 Winiarski <michal.winiarski@intel.com>
> +L:	kvm@vger.kernel.org
> +L:	intel-xe@lists.freedesktop.org
> +S:	Supported
> +F:	drivers/vfio/pci/xe
> +
>  VGA_SWITCHEROO
>  R:	Lukas Wunner <lukas@wunner.de>
>  S:	Maintained
> diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> index 2b0172f546652..c100f0ab87f2d 100644
> --- a/drivers/vfio/pci/Kconfig
> +++ b/drivers/vfio/pci/Kconfig
> @@ -67,4 +67,6 @@ source "drivers/vfio/pci/nvgrace-gpu/Kconfig"
> =20
>  source "drivers/vfio/pci/qat/Kconfig"
> =20
> +source "drivers/vfio/pci/xe/Kconfig"
> +
>  endmenu
> diff --git a/drivers/vfio/pci/Makefile b/drivers/vfio/pci/Makefile
> index cf00c0a7e55c8..f5d46aa9347b9 100644
> --- a/drivers/vfio/pci/Makefile
> +++ b/drivers/vfio/pci/Makefile
> @@ -19,3 +19,5 @@ obj-$(CONFIG_VIRTIO_VFIO_PCI) +=3D virtio/
>  obj-$(CONFIG_NVGRACE_GPU_VFIO_PCI) +=3D nvgrace-gpu/
> =20
>  obj-$(CONFIG_QAT_VFIO_PCI) +=3D qat/
> +
> +obj-$(CONFIG_XE_VFIO_PCI) +=3D xe/
> diff --git a/drivers/vfio/pci/xe/Kconfig b/drivers/vfio/pci/xe/Kconfig
> new file mode 100644
> index 0000000000000..4253f2a86ca1f
> --- /dev/null
> +++ b/drivers/vfio/pci/xe/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config XE_VFIO_PCI
> +	tristate "VFIO support for Intel Graphics"
> +	depends on DRM_XE
> +	select VFIO_PCI_CORE
> +	help
> +	  This option enables device specific VFIO driver variant for Intel Gra=
phics.
> +	  In addition to generic VFIO PCI functionality, it implements VFIO
> +	  migration uAPI allowing userspace to enable migration for
> +	  Intel Graphics SR-IOV Virtual Functions supported by the Xe driver.
> +
> +	  If you don't know what to do here, say N.
> diff --git a/drivers/vfio/pci/xe/Makefile b/drivers/vfio/pci/xe/Makefile
> new file mode 100644
> index 0000000000000..13aa0fd192cd4
> --- /dev/null
> +++ b/drivers/vfio/pci/xe/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_XE_VFIO_PCI) +=3D xe-vfio-pci.o
> +xe-vfio-pci-y :=3D main.o
> diff --git a/drivers/vfio/pci/xe/main.c b/drivers/vfio/pci/xe/main.c
> new file mode 100644
> index 0000000000000..ce0ed82ee4d31
> --- /dev/null
> +++ b/drivers/vfio/pci/xe/main.c
> @@ -0,0 +1,568 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright =C2=A9 2025 Intel Corporation
> + */
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/delay.h>
> +#include <linux/file.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/sizes.h>
> +#include <linux/types.h>
> +#include <linux/vfio.h>
> +#include <linux/vfio_pci_core.h>
> +
> +#include <drm/intel/xe_sriov_vfio.h>
> +#include <drm/intel/pciids.h>
> +
> +struct xe_vfio_pci_migration_file {
> +	struct file *filp;
> +	/* serializes accesses to migration data */
> +	struct mutex lock;
> +	bool disabled;

Move to the end to avoid a hole?  Unless you know mutex leaves a gap.
Maybe also use a bitfield u8 for consistency to flags in below struct.

> +	struct xe_vfio_pci_core_device *xe_vdev;
> +};
> +
> +struct xe_vfio_pci_core_device {
> +	struct vfio_pci_core_device core_device;
> +	struct xe_device *xe;
> +	/* PF internal control uses vfid index starting from 1 */
> +	unsigned int vfid;
> +	u8 migrate_cap:1;
> +	u8 deferred_reset:1;
> +	/* protects migration state */
> +	struct mutex state_mutex;
> +	enum vfio_device_mig_state mig_state;
> +	/* protects the reset_done flow */
> +	spinlock_t reset_lock;
> +	struct xe_vfio_pci_migration_file *migf;
> +};
> +
> +#define xe_vdev_to_dev(xe_vdev) (&(xe_vdev)->core_device.pdev->dev)
> +
> +static void xe_vfio_pci_disable_file(struct xe_vfio_pci_migration_file *=
migf)
> +{
> +	mutex_lock(&migf->lock);
> +	migf->disabled =3D true;
> +	mutex_unlock(&migf->lock);
> +}
> +
> +static void xe_vfio_pci_put_file(struct xe_vfio_pci_core_device *xe_vdev)
> +{
> +	xe_vfio_pci_disable_file(xe_vdev->migf);
> +	fput(xe_vdev->migf->filp);
> +	xe_vdev->migf =3D NULL;
> +}
> +
> +static void xe_vfio_pci_reset(struct xe_vfio_pci_core_device *xe_vdev)
> +{
> +	if (xe_vdev->migf)
> +		xe_vfio_pci_put_file(xe_vdev);
> +
> +	xe_vdev->mig_state =3D VFIO_DEVICE_STATE_RUNNING;
> +}
> +
> +static void xe_vfio_pci_state_mutex_lock(struct xe_vfio_pci_core_device =
*xe_vdev)
> +{
> +	mutex_lock(&xe_vdev->state_mutex);
> +}
> +
> +/*
> + * This function is called in all state_mutex unlock cases to
> + * handle a 'deferred_reset' if exists.
> + */
> +static void xe_vfio_pci_state_mutex_unlock(struct xe_vfio_pci_core_devic=
e *xe_vdev)
> +{
> +again:
> +	spin_lock(&xe_vdev->reset_lock);
> +	if (xe_vdev->deferred_reset) {
> +		xe_vdev->deferred_reset =3D false;
> +		spin_unlock(&xe_vdev->reset_lock);
> +		xe_vfio_pci_reset(xe_vdev);
> +		goto again;
> +	}
> +	mutex_unlock(&xe_vdev->state_mutex);
> +	spin_unlock(&xe_vdev->reset_lock);
> +}
> +
> +static void xe_vfio_pci_reset_done(struct pci_dev *pdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D pci_get_drvdata(pdev);
> +	int ret;
> +
> +	if (!xe_vdev->vfid)
> +		return;
> +
> +	/*
> +	 * VF FLR requires additional processing done by PF driver.
> +	 * The processing is done after FLR is already finished from PCIe
> +	 * perspective.
> +	 * In order to avoid a scenario where VF is used while PF processing
> +	 * is still in progress, additional synchronization point is needed.
> +	 */
> +	ret =3D xe_sriov_vfio_wait_flr_done(xe_vdev->xe, xe_vdev->vfid);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to wait for FLR: %d\n", ret);
> +
> +	if (!xe_vdev->migrate_cap)
> +		return;

It seems like the above is intended to cause a stall for all VFs,
regardless of migration support, but vfid and xe are only set for VFs
supporting migration.  Maybe that much needs to be pulled out of
migration_init into init_dev, which then gives the migrate_cap flag
purpose where it otherwise seems redundant to testing xe or vfid.

> +
> +	/*
> +	 * As the higher VFIO layers are holding locks across reset and using
> +	 * those same locks with the mm_lock we need to prevent ABBA deadlock
> +	 * with the state_mutex and mm_lock.
> +	 * In case the state_mutex was taken already we defer the cleanup work
> +	 * to the unlock flow of the other running context.
> +	 */
> +	spin_lock(&xe_vdev->reset_lock);
> +	xe_vdev->deferred_reset =3D true;
> +	if (!mutex_trylock(&xe_vdev->state_mutex)) {
> +		spin_unlock(&xe_vdev->reset_lock);
> +		return;
> +	}
> +	spin_unlock(&xe_vdev->reset_lock);
> +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> +
> +	xe_vfio_pci_reset(xe_vdev);
> +}
> +
> +static const struct pci_error_handlers xe_vfio_pci_err_handlers =3D {
> +	.reset_done =3D xe_vfio_pci_reset_done,
> +	.error_detected =3D vfio_pci_core_aer_err_detected,
> +};
> +
> +static int xe_vfio_pci_open_device(struct vfio_device *core_vdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vd=
ev);
> +	struct vfio_pci_core_device *vdev =3D &xe_vdev->core_device;
> +	int ret;
> +
> +	ret =3D vfio_pci_core_enable(vdev);
> +	if (ret)
> +		return ret;
> +
> +	vfio_pci_core_finish_enable(vdev);
> +
> +	return 0;
> +}

Typically migration drivers are setting the initial RUNNING mig_state
in their open_device function, are we implicitly relying on the
reset_done callback for this instead?

> +
> +static int xe_vfio_pci_release_file(struct inode *inode, struct file *fi=
lp)
> +{
> +	struct xe_vfio_pci_migration_file *migf =3D filp->private_data;
> +
> +	xe_vfio_pci_disable_file(migf);

What does calling the above accomplish?  If something is racing access,
setting disabled immediately before we destroy the lock and free the
object isn't going to solve anything.

> +	mutex_destroy(&migf->lock);
> +	kfree(migf);
> +
> +	return 0;
> +}
> +
> +static ssize_t xe_vfio_pci_save_read(struct file *filp, char __user *buf=
, size_t len, loff_t *pos)
> +{
> +	struct xe_vfio_pci_migration_file *migf =3D filp->private_data;
> +	ssize_t ret;
> +
> +	if (pos)
> +		return -ESPIPE;
> +
> +	mutex_lock(&migf->lock);
> +	if (migf->disabled) {
> +		mutex_unlock(&migf->lock);
> +		return -ENODEV;
> +	}
> +
> +	ret =3D xe_sriov_vfio_data_read(migf->xe_vdev->xe, migf->xe_vdev->vfid,=
 buf, len);
> +	mutex_unlock(&migf->lock);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations xe_vfio_pci_save_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.read =3D xe_vfio_pci_save_read,
> +	.release =3D xe_vfio_pci_release_file,
> +	.llseek =3D noop_llseek,
> +};
> +
> +static ssize_t xe_vfio_pci_resume_write(struct file *filp, const char __=
user *buf,
> +					size_t len, loff_t *pos)
> +{
> +	struct xe_vfio_pci_migration_file *migf =3D filp->private_data;
> +	ssize_t ret;
> +
> +	if (pos)
> +		return -ESPIPE;
> +
> +	mutex_lock(&migf->lock);
> +	if (migf->disabled) {
> +		mutex_unlock(&migf->lock);
> +		return -ENODEV;
> +	}
> +
> +	ret =3D xe_sriov_vfio_data_write(migf->xe_vdev->xe, migf->xe_vdev->vfid=
, buf, len);
> +	mutex_unlock(&migf->lock);
> +
> +	return ret;
> +}
> +
> +static const struct file_operations xe_vfio_pci_resume_fops =3D {
> +	.owner =3D THIS_MODULE,
> +	.write =3D xe_vfio_pci_resume_write,
> +	.release =3D xe_vfio_pci_release_file,
> +	.llseek =3D noop_llseek,
> +};
> +
> +static const char *vfio_dev_state_str(u32 state)
> +{
> +	switch (state) {
> +	case VFIO_DEVICE_STATE_RUNNING: return "running";
> +	case VFIO_DEVICE_STATE_RUNNING_P2P: return "running_p2p";
> +	case VFIO_DEVICE_STATE_STOP_COPY: return "stopcopy";
> +	case VFIO_DEVICE_STATE_STOP: return "stop";
> +	case VFIO_DEVICE_STATE_RESUMING: return "resuming";
> +	case VFIO_DEVICE_STATE_ERROR: return "error";
> +	default: return "";
> +	}
> +}
> +
> +enum xe_vfio_pci_file_type {
> +	XE_VFIO_FILE_SAVE =3D 0,
> +	XE_VFIO_FILE_RESUME,
> +};
> +
> +static struct xe_vfio_pci_migration_file *
> +xe_vfio_pci_alloc_file(struct xe_vfio_pci_core_device *xe_vdev,
> +		       enum xe_vfio_pci_file_type type)
> +{
> +	struct xe_vfio_pci_migration_file *migf;
> +	const struct file_operations *fops;
> +	int flags;
> +
> +	migf =3D kzalloc(sizeof(*migf), GFP_KERNEL);

GFP_KERNEL_ACCOUNT

> +	if (!migf)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fops =3D type =3D=3D XE_VFIO_FILE_SAVE ? &xe_vfio_pci_save_fops : &xe_v=
fio_pci_resume_fops;
> +	flags =3D type =3D=3D XE_VFIO_FILE_SAVE ? O_RDONLY : O_WRONLY;
> +	migf->filp =3D anon_inode_getfile("xe_vfio_mig", fops, migf, flags);
> +	if (IS_ERR(migf->filp)) {
> +		kfree(migf);
> +		return ERR_CAST(migf->filp);
> +	}
> +
> +	mutex_init(&migf->lock);
> +	migf->xe_vdev =3D xe_vdev;
> +	xe_vdev->migf =3D migf;
> +
> +	stream_open(migf->filp->f_inode, migf->filp);
> +
> +	return migf;
> +}
> +
> +static struct file *
> +xe_vfio_set_state(struct xe_vfio_pci_core_device *xe_vdev, u32 new)
> +{
> +	u32 cur =3D xe_vdev->mig_state;
> +	int ret;
> +
> +	dev_dbg(xe_vdev_to_dev(xe_vdev),
> +		"state: %s->%s\n", vfio_dev_state_str(cur), vfio_dev_state_str(new));
> +
> +	/*
> +	 * "STOP" handling is reused for "RUNNING_P2P", as the device doesn't
> +	 * have the capability to selectively block outgoing p2p DMA transfers.
> +	 * While the device is allowing BAR accesses when the VF is stopped, it
> +	 * is not processing any new workload requests, effectively stopping
> +	 * any outgoing DMA transfers (not just p2p).
> +	 * Any VRAM / MMIO accesses occurring during "RUNNING_P2P" are kept and
> +	 * will be migrated to target VF during stop-copy.
> +	 */
> +	if (cur =3D=3D VFIO_DEVICE_STATE_RUNNING && new =3D=3D VFIO_DEVICE_STAT=
E_RUNNING_P2P) {
> +		ret =3D xe_sriov_vfio_suspend_device(xe_vdev->xe, xe_vdev->vfid);
> +		if (ret)
> +			goto err;
> +
> +		return NULL;
> +	}
> +
> +	if ((cur =3D=3D VFIO_DEVICE_STATE_RUNNING_P2P && new =3D=3D VFIO_DEVICE=
_STATE_STOP) ||
> +	    (cur =3D=3D VFIO_DEVICE_STATE_STOP && new =3D=3D VFIO_DEVICE_STATE_=
RUNNING_P2P))
> +		return NULL;
> +
> +	if (cur =3D=3D VFIO_DEVICE_STATE_RUNNING_P2P && new =3D=3D VFIO_DEVICE_=
STATE_RUNNING) {
> +		ret =3D xe_sriov_vfio_resume_device(xe_vdev->xe, xe_vdev->vfid);
> +		if (ret)
> +			goto err;
> +
> +		return NULL;
> +	}
> +
> +	if (cur =3D=3D VFIO_DEVICE_STATE_STOP && new =3D=3D VFIO_DEVICE_STATE_S=
TOP_COPY) {
> +		struct xe_vfio_pci_migration_file *migf;
> +
> +		migf =3D xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_SAVE);
> +		if (IS_ERR(migf)) {
> +			ret =3D PTR_ERR(migf);
> +			goto err;
> +		}
> +		get_file(migf->filp);
> +
> +		ret =3D xe_sriov_vfio_stop_copy_enter(xe_vdev->xe, xe_vdev->vfid);
> +		if (ret) {
> +			fput(migf->filp);
> +			goto err;
> +		}
> +
> +		return migf->filp;
> +	}
> +
> +	if (cur =3D=3D VFIO_DEVICE_STATE_STOP_COPY && new =3D=3D VFIO_DEVICE_ST=
ATE_STOP) {
> +		if (xe_vdev->migf)
> +			xe_vfio_pci_put_file(xe_vdev);
> +
> +		ret =3D xe_sriov_vfio_stop_copy_exit(xe_vdev->xe, xe_vdev->vfid);
> +		if (ret)
> +			goto err;
> +
> +		return NULL;
> +	}
> +
> +	if (cur =3D=3D VFIO_DEVICE_STATE_STOP && new =3D=3D VFIO_DEVICE_STATE_R=
ESUMING) {
> +		struct xe_vfio_pci_migration_file *migf;
> +
> +		migf =3D xe_vfio_pci_alloc_file(xe_vdev, XE_VFIO_FILE_RESUME);
> +		if (IS_ERR(migf)) {
> +			ret =3D PTR_ERR(migf);
> +			goto err;
> +		}
> +		get_file(migf->filp);
> +
> +		ret =3D xe_sriov_vfio_resume_data_enter(xe_vdev->xe, xe_vdev->vfid);
> +		if (ret) {
> +			fput(migf->filp);
> +			goto err;
> +		}
> +
> +		return migf->filp;
> +	}
> +
> +	if (cur =3D=3D VFIO_DEVICE_STATE_RESUMING && new =3D=3D VFIO_DEVICE_STA=
TE_STOP) {
> +		if (xe_vdev->migf)
> +			xe_vfio_pci_put_file(xe_vdev);
> +
> +		ret =3D xe_sriov_vfio_resume_data_exit(xe_vdev->xe, xe_vdev->vfid);
> +		if (ret)
> +			goto err;
> +
> +		return NULL;
> +	}
> +
> +	WARN(true, "Unknown state transition %d->%d", cur, new);
> +	return ERR_PTR(-EINVAL);
> +
> +err:
> +	dev_dbg(xe_vdev_to_dev(xe_vdev),
> +		"Failed to transition state: %s->%s err=3D%d\n",
> +		vfio_dev_state_str(cur), vfio_dev_state_str(new), ret);
> +	return ERR_PTR(ret);
> +}
> +
> +static struct file *
> +xe_vfio_pci_set_device_state(struct vfio_device *core_vdev,
> +			     enum vfio_device_mig_state new_state)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vd=
ev);
> +	enum vfio_device_mig_state next_state;
> +	struct file *f =3D NULL;
> +	int ret;
> +
> +	xe_vfio_pci_state_mutex_lock(xe_vdev);
> +	while (new_state !=3D xe_vdev->mig_state) {
> +		ret =3D vfio_mig_get_next_state(core_vdev, xe_vdev->mig_state,
> +					      new_state, &next_state);
> +		if (ret) {
> +			xe_sriov_vfio_error(xe_vdev->xe, xe_vdev->vfid);
> +			f =3D ERR_PTR(ret);
> +			break;
> +		}
> +		f =3D xe_vfio_set_state(xe_vdev, next_state);
> +		if (IS_ERR(f))
> +			break;
> +
> +		xe_vdev->mig_state =3D next_state;
> +
> +		/* Multiple state transitions with non-NULL file in the middle */
> +		if (f && new_state !=3D xe_vdev->mig_state) {
> +			fput(f);
> +			f =3D ERR_PTR(-EINVAL);
> +			break;
> +		}
> +	}
> +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> +
> +	return f;
> +}
> +
> +static int xe_vfio_pci_get_device_state(struct vfio_device *core_vdev,
> +					enum vfio_device_mig_state *curr_state)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vd=
ev);
> +
> +	xe_vfio_pci_state_mutex_lock(xe_vdev);
> +	*curr_state =3D xe_vdev->mig_state;
> +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> +
> +	return 0;
> +}
> +
> +static int xe_vfio_pci_get_data_size(struct vfio_device *vdev,
> +				     unsigned long *stop_copy_length)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D
> +		container_of(vdev, struct xe_vfio_pci_core_device, core_device.vdev);
> +
> +	xe_vfio_pci_state_mutex_lock(xe_vdev);
> +	*stop_copy_length =3D xe_sriov_vfio_stop_copy_size(xe_vdev->xe, xe_vdev=
->vfid);
> +	xe_vfio_pci_state_mutex_unlock(xe_vdev);
> +
> +	return 0;
> +}
> +
> +static const struct vfio_migration_ops xe_vfio_pci_migration_ops =3D {
> +	.migration_set_state =3D xe_vfio_pci_set_device_state,
> +	.migration_get_state =3D xe_vfio_pci_get_device_state,
> +	.migration_get_data_size =3D xe_vfio_pci_get_data_size,
> +};
> +
> +static void xe_vfio_pci_migration_init(struct xe_vfio_pci_core_device *x=
e_vdev)
> +{
> +	struct vfio_device *core_vdev =3D &xe_vdev->core_device.vdev;
> +	struct pci_dev *pdev =3D to_pci_dev(core_vdev->dev);
> +	struct xe_device *xe =3D xe_sriov_vfio_get_pf(pdev);
> +	int ret;
> +
> +	if (!xe)
> +		return;
> +	if (!xe_sriov_vfio_migration_supported(xe))
> +		return;

As above, ordering here seems wrong if FLR is expecting vfid and xe set
independent of support migration.

> +
> +	ret =3D pci_iov_vf_id(pdev);
> +	if (ret < 0)
> +		return;

Maybe this is just defensive, but @xe being non-NULL verifies @pdev is
a VF bound to &xe_pci_driver, so we could pretty safely just use
'pci_iov_vf_id(pdev) + 1' below.  Thanks,

Alex

> +
> +	mutex_init(&xe_vdev->state_mutex);
> +	spin_lock_init(&xe_vdev->reset_lock);
> +
> +	/* PF internal control uses vfid index starting from 1 */
> +	xe_vdev->vfid =3D ret + 1;
> +	xe_vdev->xe =3D xe;
> +	xe_vdev->migrate_cap =3D true;
> +
> +	core_vdev->migration_flags =3D VFIO_MIGRATION_STOP_COPY | VFIO_MIGRATIO=
N_P2P;
> +	core_vdev->mig_ops =3D &xe_vfio_pci_migration_ops;
> +}
> +
> +static void xe_vfio_pci_migration_fini(struct xe_vfio_pci_core_device *x=
e_vdev)
> +{
> +	if (!xe_vdev->migrate_cap)
> +		return;
> +
> +	mutex_destroy(&xe_vdev->state_mutex);
> +}
> +
> +static int xe_vfio_pci_init_dev(struct vfio_device *core_vdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vd=
ev);
> +
> +	xe_vfio_pci_migration_init(xe_vdev);
> +
> +	return vfio_pci_core_init_dev(core_vdev);
> +}
> +
> +static void xe_vfio_pci_release_dev(struct vfio_device *core_vdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D
> +		container_of(core_vdev, struct xe_vfio_pci_core_device, core_device.vd=
ev);
> +
> +	xe_vfio_pci_migration_fini(xe_vdev);
> +}
> +
> +static const struct vfio_device_ops xe_vfio_pci_ops =3D {
> +	.name =3D "xe-vfio-pci",
> +	.init =3D xe_vfio_pci_init_dev,
> +	.release =3D xe_vfio_pci_release_dev,
> +	.open_device =3D xe_vfio_pci_open_device,
> +	.close_device =3D vfio_pci_core_close_device,
> +	.ioctl =3D vfio_pci_core_ioctl,
> +	.device_feature =3D vfio_pci_core_ioctl_feature,
> +	.read =3D vfio_pci_core_read,
> +	.write =3D vfio_pci_core_write,
> +	.mmap =3D vfio_pci_core_mmap,
> +	.request =3D vfio_pci_core_request,
> +	.match =3D vfio_pci_core_match,
> +	.match_token_uuid =3D vfio_pci_core_match_token_uuid,
> +	.bind_iommufd =3D vfio_iommufd_physical_bind,
> +	.unbind_iommufd =3D vfio_iommufd_physical_unbind,
> +	.attach_ioas =3D vfio_iommufd_physical_attach_ioas,
> +	.detach_ioas =3D vfio_iommufd_physical_detach_ioas,
> +};
> +
> +static int xe_vfio_pci_probe(struct pci_dev *pdev, const struct pci_devi=
ce_id *id)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev;
> +	int ret;
> +
> +	xe_vdev =3D vfio_alloc_device(xe_vfio_pci_core_device, core_device.vdev=
, &pdev->dev,
> +				    &xe_vfio_pci_ops);
> +	if (IS_ERR(xe_vdev))
> +		return PTR_ERR(xe_vdev);
> +
> +	dev_set_drvdata(&pdev->dev, &xe_vdev->core_device);
> +
> +	ret =3D vfio_pci_core_register_device(&xe_vdev->core_device);
> +	if (ret) {
> +		vfio_put_device(&xe_vdev->core_device.vdev);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void xe_vfio_pci_remove(struct pci_dev *pdev)
> +{
> +	struct xe_vfio_pci_core_device *xe_vdev =3D pci_get_drvdata(pdev);
> +
> +	vfio_pci_core_unregister_device(&xe_vdev->core_device);
> +	vfio_put_device(&xe_vdev->core_device.vdev);
> +}
> +
> +#define INTEL_PCI_VFIO_DEVICE(_id) { \
> +	PCI_DRIVER_OVERRIDE_DEVICE_VFIO(PCI_VENDOR_ID_INTEL, (_id)) \
> +}
> +
> +static const struct pci_device_id xe_vfio_pci_table[] =3D {
> +	INTEL_PTL_IDS(INTEL_PCI_VFIO_DEVICE),
> +	INTEL_WCL_IDS(INTEL_PCI_VFIO_DEVICE),
> +	INTEL_BMG_IDS(INTEL_PCI_VFIO_DEVICE),
> +	{}
> +};
> +MODULE_DEVICE_TABLE(pci, xe_vfio_pci_table);
> +
> +static struct pci_driver xe_vfio_pci_driver =3D {
> +	.name =3D "xe-vfio-pci",
> +	.id_table =3D xe_vfio_pci_table,
> +	.probe =3D xe_vfio_pci_probe,
> +	.remove =3D xe_vfio_pci_remove,
> +	.err_handler =3D &xe_vfio_pci_err_handlers,
> +	.driver_managed_dma =3D true,
> +};
> +module_pci_driver(xe_vfio_pci_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Micha=C5=82 Winiarski <michal.winiarski@intel.com>");
> +MODULE_DESCRIPTION("VFIO PCI driver with migration support for Intel Gra=
phics");

