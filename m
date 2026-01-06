Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E251CF98D1
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 18:10:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD73E10E52A;
	Tue,  6 Jan 2026 17:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I1bP8Jps";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE3710E52A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 17:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767719397; x=1799255397;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=z7Of+kcvPFaGu9vh+cwVtgJEJbuSCW2nYLLmYQv8tEE=;
 b=I1bP8JpsF/qfaC+g11ITSI8QLAoIk/F9bODUMM68ED1Mz+HadOPd5yIQ
 8fFeDXRZl2QgPjW+ClTxM7RV7zdu/QLlga3tvuHxgX0ttuSdcZzpCQa4t
 qPpwGtgM8qgW0lDJf4V4eb2LYfbUIB53LHR4gdhZbcZPBXOuGoL4QqbtD
 kA6FjNGIs9fekIrMSAIMCSMhqlJAB537Bw4zO8/io1jRVTX8PNoUUFDzV
 pVYUIZWjNKv6BmVDNdTrqDaMYlP7rAXAQpBVSKKB9uBWhrMl4mk46fO0o
 XlN9X0n+sYObSYc8Onk6dzQj2ekhG9TppGOuvuQgG8kkW4RbMxfWWpiPW g==;
X-CSE-ConnectionGUID: xNziTGV0Ta2SkZaJRu/RQA==
X-CSE-MsgGUID: I/3VBnwgRZqTtdYAZV+jkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="86672498"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="86672498"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 09:09:57 -0800
X-CSE-ConnectionGUID: OeFldP2XQtu6YSbD8vYxJA==
X-CSE-MsgGUID: gLyC5NCLS7aJNujKR42hvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="207169177"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.6])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 09:09:52 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 6 Jan 2026 19:09:49 +0200 (EET)
To: Lizhi Hou <lizhi.hou@amd.com>
cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, ogabbay@kernel.org, 
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com, 
 Hans de Goede <hansg@kernel.org>, dri-devel@lists.freedesktop.org, 
 LKML <linux-kernel@vger.kernel.org>, max.zhen@amd.com, 
 sonal.santan@amd.com, mario.limonciello@amd.com, 
 platform-driver-x86@vger.kernel.org, VinitKumar.Shukla@amd.com, 
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: Re: [PATCH V3 1/2] platform/x86/amd/pmf: Introduce new interface to
 export NPU metrics
In-Reply-To: <4363d65e-c50b-eb1a-39d3-99a9809f3c37@amd.com>
Message-ID: <b6c80015-d399-e8c1-4b8a-d2ebb4cee9da@linux.intel.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
 <20260105172956.3732123-2-lizhi.hou@amd.com>
 <3e19f17e-3d5d-4b48-8776-65ac2543c066@amd.com>
 <8495eeb5-b049-2efc-4ba7-c6dad1747501@amd.com>
 <4363d65e-c50b-eb1a-39d3-99a9809f3c37@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-174113268-1767719389=:1051"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-174113268-1767719389=:1051
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 6 Jan 2026, Lizhi Hou wrote:

> What should be the next step? Should I generate both patches based on
> review-ilpo-next? Will the amdxdna change upstream through platform-x86 t=
ree?

(We seemed to have crossed emails.)

That would work for me too, but I thought it was wanted that patch 2 to=20
go through accel?

--=20
 i.

> On 1/6/26 08:16, Lizhi Hou wrote:
> >=20
> > On 1/6/26 05:19, Shyam Sundar S K wrote:
> > >=20
> > > On 1/5/2026 22:59, Lizhi Hou wrote:
> > > > From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > >=20
> > > > The PMF driver retrieves NPU metrics data from the PMFW. Introduce =
a new
> > > > interface to make NPU metrics accessible to other drivers like AMDX=
DNA
> > > > driver, which can access and utilize this information as needed.
> > > >=20
> > > > Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> > > > Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > > > Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> > > > Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > > [lizhi: save return value of is_npu_metrics_supported() and return =
it]
> > > > Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> > > Lizhi, just noticied that this patch may not apply cleanly on
> > > Ilpo-next (which tree does this change land? drm-misc or
> > > platform-x86)? If platform-x86, I can share you a rebased version
> >=20
> > I used drm-misc.
> >=20
> > Lizhi
> >=20
> > > offline so that you can wrap into XDNA series.
> > >=20
> > > Thanks,
> > > Shyam
> > >=20
> > > > ---
> > > > =C2=A0 drivers/platform/x86/amd/pmf/core.c | 76 +++++++++++++++++++=
++++++++++
> > > > =C2=A0 drivers/platform/x86/amd/pmf/pmf.h=C2=A0 |=C2=A0 2 +
> > > > =C2=A0 include/linux/amd-pmf-io.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 21 ++++++++
> > > > =C2=A0 3 files changed, 99 insertions(+)
> > > >=20
> > > > diff --git a/drivers/platform/x86/amd/pmf/core.c
> > > > b/drivers/platform/x86/amd/pmf/core.c
> > > > index 8fc293c9c538..d180a39e03bf 100644
> > > > --- a/drivers/platform/x86/amd/pmf/core.c
> > > > +++ b/drivers/platform/x86/amd/pmf/core.c
> > > > @@ -8,12 +8,15 @@
> > > > =C2=A0=C2=A0 * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > > > =C2=A0=C2=A0 */
> > > > =C2=A0 +#include <linux/array_size.h>
> > > > +#include <linux/cleanup.h>
> > > > =C2=A0 #include <linux/debugfs.h>
> > > > =C2=A0 #include <linux/iopoll.h>
> > > > =C2=A0 #include <linux/module.h>
> > > > =C2=A0 #include <linux/pci.h>
> > > > =C2=A0 #include <linux/platform_device.h>
> > > > =C2=A0 #include <linux/power_supply.h>
> > > > +#include <linux/string.h>
> > > > =C2=A0 #include <asm/amd/node.h>
> > > > =C2=A0 #include "pmf.h"
> > > > =C2=A0 @@ -53,6 +56,8 @@ static bool force_load;
> > > > =C2=A0 module_param(force_load, bool, 0444);
> > > > =C2=A0 MODULE_PARM_DESC(force_load, "Force load this driver on supp=
orted
> > > > older platforms (experimental)");
> > > > =C2=A0 +static struct device *pmf_device;
> > > > +
> > > > =C2=A0 static int amd_pmf_pwr_src_notify_call(struct notifier_block=
 *nb,
> > > > unsigned long event, void *data)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amd_pmf_dev *pmf =3D containe=
r_of(nb, struct amd_pmf_dev,
> > > > pwr_src_notifier);
> > > > @@ -314,6 +319,71 @@ int amd_pmf_init_metrics_table(struct amd_pmf_=
dev
> > > > *dev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > =C2=A0 }
> > > > =C2=A0 +static int is_npu_metrics_supported(struct amd_pmf_dev *pde=
v)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 switch (pdev->cpu_id) {
> > > > +=C2=A0=C2=A0=C2=A0 case PCI_DEVICE_ID_AMD_1AH_M20H_ROOT:
> > > > +=C2=A0=C2=A0=C2=A0 case PCI_DEVICE_ID_AMD_1AH_M60H_ROOT:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > +=C2=A0=C2=A0=C2=A0 default:
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EOPNOTSUPP;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +}
> > > > +
> > > > +static int amd_pmf_get_smu_metrics(struct amd_pmf_dev *dev, struct
> > > > amd_pmf_npu_metrics *data)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 int ret, i;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 guard(mutex)(&dev->metrics_mutex);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D is_npu_metrics_supported(dev);
> > > > +=C2=A0=C2=A0=C2=A0 if (ret)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D amd_pmf_set_dram_addr(dev, true);
> > > > +=C2=A0=C2=A0=C2=A0 if (ret)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 memset(dev->buf, 0, dev->mtable_size);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 /* Send SMU command to get NPU metrics */
> > > > +=C2=A0=C2=A0=C2=A0 ret =3D amd_pmf_send_cmd(dev, SET_TRANSFER_TABL=
E, SET_CMD,
> > > > METRICS_TABLE_ID, NULL);
> > > > +=C2=A0=C2=A0=C2=A0 if (ret) {
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev->dev, "SMU =
command failed to get NPU metrics:
> > > > %d\n", ret);
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
> > > > +=C2=A0=C2=A0=C2=A0 }
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 memcpy(&dev->m_table_v2, dev->buf, dev->mtable_=
size);
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 data->npuclk_freq =3D dev->m_table_v2.npuclk_fr=
eq;
> > > > +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < ARRAY_SIZE(data->npu_busy); i=
++)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->npu_busy[i] =3D d=
ev->m_table_v2.npu_busy[i];
> > > > +=C2=A0=C2=A0=C2=A0 data->npu_power =3D dev->m_table_v2.npu_power;
> > > > +=C2=A0=C2=A0=C2=A0 data->mpnpuclk_freq =3D dev->m_table_v2.mpnpucl=
k_freq;
> > > > +=C2=A0=C2=A0=C2=A0 data->npu_reads =3D dev->m_table_v2.npu_reads;
> > > > +=C2=A0=C2=A0=C2=A0 data->npu_writes =3D dev->m_table_v2.npu_writes=
;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return 0;
> > > > +}
> > > > +
> > > > +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info)
> > > > +{
> > > > +=C2=A0=C2=A0=C2=A0 struct amd_pmf_dev *pdev;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if (!info)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 if (!pmf_device)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 pdev =3D dev_get_drvdata(pmf_device);
> > > > +=C2=A0=C2=A0=C2=A0 if (!pdev)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
> > > > +
> > > > +=C2=A0=C2=A0=C2=A0 return amd_pmf_get_smu_metrics(pdev, info);
> > > > +}
> > > > +EXPORT_SYMBOL_GPL(amd_pmf_get_npu_data);
> > > > +
> > > > =C2=A0 static int amd_pmf_suspend_handler(struct device *dev)
> > > > =C2=A0 {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amd_pmf_dev *pdev =3D dev_get=
_drvdata(dev);
> > > > @@ -477,6 +547,10 @@ static int amd_pmf_probe(struct platform_devic=
e
> > > > *pdev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (err)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > > =C2=A0 +=C2=A0=C2=A0=C2=A0 err =3D devm_mutex_init(dev->dev, &dev->=
metrics_mutex);
> > > > +=C2=A0=C2=A0=C2=A0 if (err)
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return err;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 apmf_acpi_init(dev);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 platform_set_drvdata(pdev, dev);
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amd_pmf_dbgfs_register(dev);
> > > > @@ -485,6 +559,8 @@ static int amd_pmf_probe(struct platform_device
> > > > *pdev)
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (is_apmf_func_supported(dev, APMF=
_FUNC_SBIOS_HEARTBEAT_V2))
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 amd_pmf_noti=
fy_sbios_heartbeat_event_v2(dev, ON_LOAD);
> > > > =C2=A0 +=C2=A0=C2=A0=C2=A0 pmf_device =3D dev->dev;
> > > > +
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info(dev->dev, "registered PMF d=
evice successfully\n");
> > > > =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > > > diff --git a/drivers/platform/x86/amd/pmf/pmf.h
> > > > b/drivers/platform/x86/amd/pmf/pmf.h
> > > > index 9144c8c3bbaf..1bf896c5b92c 100644
> > > > --- a/drivers/platform/x86/amd/pmf/pmf.h
> > > > +++ b/drivers/platform/x86/amd/pmf/pmf.h
> > > > @@ -12,6 +12,7 @@
> > > > =C2=A0 #define PMF_H
> > > > =C2=A0 =C2=A0 #include <linux/acpi.h>
> > > > +#include <linux/amd-pmf-io.h>
> > > > =C2=A0 #include <linux/input.h>
> > > > =C2=A0 #include <linux/platform_device.h>
> > > > =C2=A0 #include <linux/platform_profile.h>
> > > > @@ -413,6 +414,7 @@ struct amd_pmf_dev {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct apmf_sbios_req_v1 req1;
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct pmf_bios_inputs_prev cb_prev;=
 /* To preserve custom BIOS
> > > > inputs */
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool cb_flag;=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* To handle first custom BIOS input
> > > > */
> > > > +=C2=A0=C2=A0=C2=A0 struct mutex metrics_mutex;
> > > > =C2=A0 };
> > > > =C2=A0 =C2=A0 struct apmf_sps_prop_granular_v2 {
> > > > diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.=
h
> > > > index 6fa510f419c0..55198d2875cc 100644
> > > > --- a/include/linux/amd-pmf-io.h
> > > > +++ b/include/linux/amd-pmf-io.h
> > > > @@ -61,5 +61,26 @@ enum laptop_placement {
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LP_UNDEFINED,
> > > > =C2=A0 };
> > > > =C2=A0 +/**
> > > > + * struct amd_pmf_npu_metrics: Get NPU metrics data from PMF drive=
r
> > > > + * @npuclk_freq: NPU clock frequency [MHz]
> > > > + * @npu_busy: NPU busy % [0-100]
> > > > + * @npu_power: NPU power [mW]
> > > > + * @mpnpuclk_freq: MPNPU [MHz]
> > > > + * @npu_reads: NPU read bandwidth [MB/sec]
> > > > + * @npu_writes: NPU write bandwidth [MB/sec]
> > > > + */
> > > > +struct amd_pmf_npu_metrics {
> > > > +=C2=A0=C2=A0=C2=A0 u16 npuclk_freq;
> > > > +=C2=A0=C2=A0=C2=A0 u16 npu_busy[8];
> > > > +=C2=A0=C2=A0=C2=A0 u16 npu_power;
> > > > +=C2=A0=C2=A0=C2=A0 u16 mpnpuclk_freq;
> > > > +=C2=A0=C2=A0=C2=A0 u16 npu_reads;
> > > > +=C2=A0=C2=A0=C2=A0 u16 npu_writes;
> > > > +};
> > > > +
> > > > =C2=A0 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum
> > > > sfh_message_type op);
> > > > +
> > > > +/* AMD PMF and NPU interface */
> > > > +int amd_pmf_get_npu_data(struct amd_pmf_npu_metrics *info);
> > > > =C2=A0 #endif
>=20
--8323328-174113268-1767719389=:1051--
