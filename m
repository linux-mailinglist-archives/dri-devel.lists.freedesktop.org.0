Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68136D24AB0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 14:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7585410E74F;
	Thu, 15 Jan 2026 13:08:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vj25Oku0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E044410E02F;
 Thu, 15 Jan 2026 13:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768482497; x=1800018497;
 h=from:date:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=6G4sLMc4g0AmUyHRPVdW74jaAHBycg/Odku30ZIF9aU=;
 b=Vj25Oku029pwaUXYj7XDLGAz8E1dOMHYdIOXWcsousyfTxfjysLdE/+S
 PZ+jvotFi+FeklAKOwMuOYf4DPzTEnh8XHJ1p2A8ZMzC/8uAaMVNL2pBT
 WsmR+WTsNfdPADsoApOSbiWWMphMkIeqKIWFGJaxxvQD6egX9S1lZeUDW
 kKauS0KjC1kLIQeWrqeixYGiF4Nf7u/f7BMnyHDjR7c5yImB4Z9tqIJCo
 cJmqvVGbpPNENhKw2m2qcWk0kvhZxu9KgdkUxBeaU5QzDL8EE2W4EPEDx
 T4Qd4lyeruuLhR58CE4Kx/Akwg0A6H0KfT/fx1PYEVWEn4S6Ky0Il5a5k w==;
X-CSE-ConnectionGUID: 1bkx+dFjSROpSx/wSrWcPA==
X-CSE-MsgGUID: /llpFkluRo2UjJe5VDdJoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="80898989"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="80898989"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:08:16 -0800
X-CSE-ConnectionGUID: iV1BXqBVQVqMhqjLYuHagw==
X-CSE-MsgGUID: cFhqfKlgRiOc2P2oF8kqGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="209096195"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.248])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 05:08:12 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Jan 2026 15:08:09 +0200 (EET)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 xi.pardee@linux.intel.comn, Hans de Goede <hansg@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
In-Reply-To: <20260107002153.63830-3-david.e.box@linux.intel.com>
Message-ID: <6641348b-a9d0-360d-0080-46f95fd3d1a7@linux.intel.com>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
 <20260107002153.63830-3-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 6 Jan 2026, David E. Box wrote:

> Preparatory refactor for ACPI-enumerated PMT endpoints. Several exported
> PMT/VSEC interfaces and structs carried struct pci_dev * even though
> callers only need a generic struct device. Move those to struct device * so
> the same APIs work for PCI and ACPI parents.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
>  drivers/gpu/drm/xe/xe_hwmon.c                 |  2 +-
>  drivers/gpu/drm/xe/xe_vsec.c                  |  7 +-
>  drivers/gpu/drm/xe/xe_vsec.h                  |  2 +-
>  drivers/platform/x86/intel/pmc/core.c         |  4 +-
>  .../platform/x86/intel/pmc/ssram_telemetry.c  |  2 +-
>  drivers/platform/x86/intel/pmt/class.c        |  8 +-
>  drivers/platform/x86/intel/pmt/class.h        |  4 +-
>  drivers/platform/x86/intel/pmt/discovery.c    |  4 +-
>  drivers/platform/x86/intel/pmt/telemetry.c    | 13 ++--
>  drivers/platform/x86/intel/pmt/telemetry.h    | 11 ++-
>  drivers/platform/x86/intel/sdsi.c             |  5 +-
>  drivers/platform/x86/intel/vsec.c             | 74 +++++++++++--------
>  drivers/platform/x86/intel/vsec_tpmi.c        |  6 +-
>  include/linux/intel_vsec.h                    | 18 ++---
>  15 files changed, 86 insertions(+), 76 deletions(-)
> 

> diff --git a/drivers/platform/x86/intel/pmt/class.h b/drivers/platform/x86/intel/pmt/class.h
> index 3c5ad5f52bca..3eb8ab97dd87 100644
> --- a/drivers/platform/x86/intel/pmt/class.h
> +++ b/drivers/platform/x86/intel/pmt/class.h
> @@ -23,7 +23,7 @@ struct pci_dev;
>  extern struct class intel_pmt_class;
>  
>  struct telem_endpoint {
> -	struct pci_dev		*pcidev;
> +	struct device		*dev;

Not guaranteed to have struct device introduced at this point.

>  	struct telem_header	header;
>  	struct pmt_callbacks	*cb;
>  	void __iomem		*base;
> @@ -65,7 +65,7 @@ struct intel_pmt_namespace {
>  				struct intel_pmt_entry *entry);
>  };
>  
> -int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid, void *buf,
> +int pmt_telem_read_mmio(struct device *dev, struct pmt_callbacks *cb, u32 guid, void *buf,
>  			void __iomem *addr, loff_t off, u32 count);
>  bool intel_pmt_is_early_client_hw(struct device *dev);
>  int intel_pmt_dev_create(struct intel_pmt_entry *entry,
> diff --git a/drivers/platform/x86/intel/pmt/discovery.c b/drivers/platform/x86/intel/pmt/discovery.c
> index 32713a194a55..66f1ae931e05 100644
> --- a/drivers/platform/x86/intel/pmt/discovery.c
> +++ b/drivers/platform/x86/intel/pmt/discovery.c
> @@ -540,7 +540,7 @@ static int pmt_features_probe(struct auxiliary_device *auxdev, const struct auxi
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->parent = &ivdev->pcidev->dev;
> +	priv->parent = ivdev->dev;
>  	auxiliary_set_drvdata(auxdev, priv);
>  
>  	priv->dev = device_create(&intel_pmt_class, &auxdev->dev, MKDEV(0, 0), priv,
> @@ -607,7 +607,7 @@ void intel_pmt_get_features(struct intel_pmt_entry *entry)
>  
>  	mutex_lock(&feature_list_lock);
>  	list_for_each_entry(feature, &pmt_feature_list, list) {
> -		if (feature->priv->parent != &entry->ep->pcidev->dev)
> +		if (feature->priv->parent != entry->ep->dev)
>  			continue;
>  
>  		pmt_get_features(entry, feature);
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index a4dfca6cac19..e11f7bde41b2 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -112,7 +112,7 @@ static int pmt_telem_add_endpoint(struct intel_vsec_device *ivdev,
>  		return -ENOMEM;
>  
>  	ep = entry->ep;
> -	ep->pcidev = ivdev->pcidev;
> +	ep->dev = ivdev->dev;
>  	ep->header.access_type = entry->header.access_type;
>  	ep->header.guid = entry->header.guid;
>  	ep->header.base_offset = entry->header.base_offset;
> @@ -204,7 +204,7 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
>  		goto unlock;
>  	}
>  
> -	info->pdev = entry->ep->pcidev;
> +	info->dev = entry->ep->dev;
>  	info->header = entry->ep->header;
>  
>  unlock:
> @@ -218,9 +218,10 @@ static int pmt_copy_region(struct telemetry_region *region,
>  			   struct intel_pmt_entry *entry)
>  {
>  
> +	struct pci_dev *pdev = to_pci_dev(entry->ep->dev);
>  	struct oobmsm_plat_info *plat_info;
>  
> -	plat_info = intel_vsec_get_mapping(entry->ep->pcidev);
> +	plat_info = intel_vsec_get_mapping(pdev);
>  	if (IS_ERR(plat_info))
>  		return PTR_ERR(plat_info);
>  
> @@ -308,7 +309,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
>  	if (offset + NUM_BYTES_QWORD(count) > size)
>  		return -EINVAL;
>  
> -	pmt_telem_read_mmio(ep->pcidev, ep->cb, ep->header.guid, data, ep->base, offset,
> +	pmt_telem_read_mmio(ep->dev, ep->cb, ep->header.guid, data, ep->base, offset,
>  			    NUM_BYTES_QWORD(count));
>  
>  	return ep->present ? 0 : -EPIPE;
> @@ -335,7 +336,7 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
>  EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, "INTEL_PMT_TELEMETRY");
>  
>  struct telem_endpoint *
> -pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
> +pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos)
>  {
>  	int devid = 0;
>  	int inst = 0;
> @@ -348,7 +349,7 @@ pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
>  		if (err)
>  			return ERR_PTR(err);
>  
> -		if (ep_info.header.guid == guid && ep_info.pdev == pcidev) {
> +		if (ep_info.header.guid == guid && ep_info.dev == dev) {
>  			if (inst == pos)
>  				return pmt_telem_register_endpoint(devid);
>  			++inst;
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.h b/drivers/platform/x86/intel/pmt/telemetry.h
> index d45af5512b4e..a4fa2178adef 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.h
> +++ b/drivers/platform/x86/intel/pmt/telemetry.h
> @@ -7,7 +7,6 @@
>  #define PMT_TELEM_CRASHLOG	1
>  
>  struct telem_endpoint;
> -struct pci_dev;
>  struct telem_header {
>  	u8	access_type;
> @@ -17,7 +16,7 @@ struct telem_header {
>  };
>  
>  struct telem_endpoint_info {
> -	struct pci_dev		*pdev;
> +	struct device		*dev;

The same issue here.

>  	struct telem_header	header;
>  };
>  
> @@ -71,8 +70,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info);
>  
>  /**
>   * pmt_telem_find_and_register_endpoint() - Get a telemetry endpoint from
> - * pci_dev device, guid and pos
> - * @pdev:   PCI device inside the Intel vsec
> + * device, guid and pos
> + * @dev:    device inside the Intel vsec
>   * @guid:   GUID of the telemetry space
>   * @pos:    Instance of the guid
>   *
> @@ -80,8 +79,8 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info);
>   * * endpoint    - On success returns pointer to the telemetry endpoint
>   * * -ENXIO      - telemetry endpoint not found
>   */
> -struct telem_endpoint *pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev,
> -				u32 guid, u16 pos);
> +struct telem_endpoint *
> +pmt_telem_find_and_register_endpoint(struct device *dev, u32 guid, u16 pos);
>  
>  /**
>   * pmt_telem_read() - Read qwords from counter sram using sample id
> diff --git a/drivers/platform/x86/intel/sdsi.c b/drivers/platform/x86/intel/sdsi.c
> index da75f53d0bcc..d7e37d4ace23 100644
> --- a/drivers/platform/x86/intel/sdsi.c
> +++ b/drivers/platform/x86/intel/sdsi.c
> @@ -599,13 +599,14 @@ static int sdsi_get_layout(struct sdsi_priv *priv, struct disc_table *table)
>  	return 0;
>  }
>  
> -static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct pci_dev *parent,
> +static int sdsi_map_mbox_registers(struct sdsi_priv *priv, struct device *dev,
>  				   struct disc_table *disc_table, struct resource *disc_res)
>  {
>  	u32 access_type = FIELD_GET(DT_ACCESS_TYPE, disc_table->access_info);
>  	u32 size = FIELD_GET(DT_SIZE, disc_table->access_info);
>  	u32 tbir = FIELD_GET(DT_TBIR, disc_table->offset);
>  	u32 offset = DT_OFFSET(disc_table->offset);
> +	struct pci_dev *parent = to_pci_dev(dev);
>  	struct resource res = {};
>  
>  	/* Starting location of SDSi MMIO region based on access type */
> @@ -681,7 +682,7 @@ static int sdsi_probe(struct auxiliary_device *auxdev, const struct auxiliary_de
>  		return ret;
>  
>  	/* Map the SDSi mailbox registers */
> -	ret = sdsi_map_mbox_registers(priv, intel_cap_dev->pcidev, &disc_table, disc_res);
> +	ret = sdsi_map_mbox_registers(priv, intel_cap_dev->dev, &disc_table, disc_res);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 130577061a51..b84bb92624ef 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -274,7 +274,7 @@ int intel_vsec_add_aux(struct device *parent,
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
>  
> -static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
> +static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *header,
>  			      struct intel_vsec_platform_info *info,
>  			      unsigned long cap_id)
>  {
> @@ -283,24 +283,24 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	struct resource *tmp;
>  	struct device *parent;
>  	unsigned long quirks = info->quirks;
> -	u64 base_addr;
> +	u64 base_addr = info->base_addr;
>  	int i;
>  
>  	if (info->parent)
>  		parent = info->parent;
>  	else
> -		parent = &pdev->dev;
> +		parent = dev;
>  
>  	if (!intel_vsec_supported(header->id, info->caps))
>  		return -EINVAL;
>  
>  	if (!header->num_entries) {
> -		dev_dbg(&pdev->dev, "Invalid 0 entry count for header id %d\n", header->id);
> +		dev_dbg(dev, "Invalid 0 entry count for header id %d\n", header->id);
>  		return -EINVAL;
>  	}
>  
>  	if (!header->entry_size) {
> -		dev_dbg(&pdev->dev, "Invalid 0 entry size for header id %d\n", header->id);
> +		dev_dbg(dev, "Invalid 0 entry size for header id %d\n", header->id);
>  		return -EINVAL;
>  	}
>  
> @@ -315,11 +315,6 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  	if (quirks & VSEC_QUIRK_TABLE_SHIFT)
>  		header->offset >>= TABLE_OFFSET_SHIFT;
>  
> -	if (info->base_addr)
> -		base_addr = info->base_addr;
> -	else
> -		base_addr = pdev->resource[header->tbir].start;
> -
>  	/*
>  	 * The DVSEC/VSEC contains the starting offset and count for a block of
>  	 * discovery tables. Create a resource array of these tables to the
> @@ -337,7 +332,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
>  		release_mem_region(tmp->start, resource_size(tmp));
>  	}
>  
> -	intel_vsec_dev->pcidev = pdev;
> +	intel_vsec_dev->dev = dev;
>  	intel_vsec_dev->resource = no_free_ptr(res);
>  	intel_vsec_dev->num_resources = header->num_entries;
>  	intel_vsec_dev->quirks = info->quirks;
> @@ -415,12 +410,13 @@ static int get_cap_id(u32 header_id, unsigned long *cap_id)
>  	return 0;
>  }
>  
> -static int intel_vsec_register_device(struct pci_dev *pdev,
> +static int intel_vsec_register_device(struct device *dev,
>  				      struct intel_vsec_header *header,
>  				      struct intel_vsec_platform_info *info)
>  {
>  	const struct vsec_feature_dependency *consumer_deps;
>  	struct vsec_priv *priv;
> +	struct pci_dev *pdev;
>  	unsigned long cap_id;
>  	int ret;
>  
> @@ -432,8 +428,12 @@ static int intel_vsec_register_device(struct pci_dev *pdev,
>  	 * Only track dependencies for devices probed by the VSEC driver.
>  	 * For others using the exported APIs, add the device directly.
>  	 */
> +	if (!dev_is_pci(dev))
> +		return intel_vsec_add_dev(dev, header, info, cap_id);
> +
> +	pdev = to_pci_dev(dev);
>  	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> -		return intel_vsec_add_dev(pdev, header, info, cap_id);
> +		return intel_vsec_add_dev(dev, header, info, cap_id);
>  
>  	priv = pci_get_drvdata(pdev);
>  	if (priv->state[cap_id] == STATE_REGISTERED ||
> @@ -449,7 +449,7 @@ static int intel_vsec_register_device(struct pci_dev *pdev,
>  
>  	consumer_deps = get_consumer_dependencies(priv, cap_id);
>  	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
> -		ret = intel_vsec_add_dev(pdev, header, info, cap_id);
> +		ret = intel_vsec_add_dev(dev, header, info, cap_id);
>  		if (ret)
>  			priv->state[cap_id] = STATE_SKIP;
>  		else
> @@ -461,7 +461,7 @@ static int intel_vsec_register_device(struct pci_dev *pdev,
>  	return -EAGAIN;
>  }
>  
> -static bool intel_vsec_walk_header(struct pci_dev *pdev,
> +static bool intel_vsec_walk_header(struct device *dev,
>  				   struct intel_vsec_platform_info *info)
>  {
>  	struct intel_vsec_header **header = info->headers;
> @@ -469,7 +469,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
>  	int ret;
>  
>  	for ( ; *header; header++) {
> -		ret = intel_vsec_register_device(pdev, *header, info);
> +		ret = intel_vsec_register_device(dev, *header, info);
>  		if (!ret)
>  			have_devices = true;
>  	}
> @@ -517,7 +517,9 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
>  		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
>  		header.id = PCI_DVSEC_HEADER2_ID(hdr);
>  
> -		ret = intel_vsec_register_device(pdev, &header, info);
> +		info->base_addr = pdev->resource[header.tbir].start;
> +
> +		ret = intel_vsec_register_device(&pdev->dev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -562,7 +564,9 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>  		header.tbir = INTEL_DVSEC_TABLE_BAR(table);
>  		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
>  
> -		ret = intel_vsec_register_device(pdev, &header, info);
> +		info->base_addr = pdev->resource[header.tbir].start;

pci_resource_start()

> +
> +		ret = intel_vsec_register_device(&pdev->dev, &header, info);
>  		if (ret)
>  			continue;
>  
> @@ -572,13 +576,13 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
>  	return have_devices;
>  }
>  
> -int intel_vsec_register(struct pci_dev *pdev,
> -			 struct intel_vsec_platform_info *info)
> +int intel_vsec_register(struct device *dev,
> +			struct intel_vsec_platform_info *info)
>  {
> -	if (!pdev || !info || !info->headers)
> +	if (!dev || !info || !info->headers)
>  		return -EINVAL;
>  
> -	if (!intel_vsec_walk_header(pdev, info))
> +	if (!intel_vsec_walk_header(dev, info))
>  		return -ENODEV;
>  	else
>  		return 0;
> @@ -604,7 +608,7 @@ static bool intel_vsec_get_features(struct pci_dev *pdev,
>  		found = true;
>  
>  	if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
> -	    intel_vsec_walk_header(pdev, info))
> +	    intel_vsec_walk_header(&pdev->dev, info))
>  		found = true;
>  
>  	return found;
> @@ -630,7 +634,7 @@ static void intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
>  
>  static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
> -	struct intel_vsec_platform_info *info;
> +	struct intel_vsec_platform_info info, *info_temp;
>  	struct vsec_priv *priv;
>  	int num_caps, ret;
>  	int run_once = 0;
> @@ -641,22 +645,25 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
>  		return ret;
>  
>  	pci_save_state(pdev);
> -	info = (struct intel_vsec_platform_info *)id->driver_data;
> -	if (!info)
> +	info_temp = (struct intel_vsec_platform_info *)id->driver_data;
> +	if (!info_temp)
>  		return -EINVAL;
>  
> +	/* XXX: Needs better fix */
> +	info = *info_temp;
> +
>  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
> -	priv->info = info;
> +	priv->info = &info;
>  	pci_set_drvdata(pdev, priv);

What's going on here??? 'info' is a stack variable and you're taking 
a pointer of it into priv/drvdata??

> -	num_caps = hweight_long(info->caps);
> +	num_caps = hweight_long(info.caps);
>  	while (num_caps--) {
> -		found_any |= intel_vsec_get_features(pdev, info);
> +		found_any |= intel_vsec_get_features(pdev, &info);
>  
> -		if (priv->found_caps == info->caps)
> +		if (priv->found_caps == info.caps)
>  			break;
>  
>  		if (!run_once) {
> @@ -676,7 +683,10 @@ int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
>  {
>  	struct vsec_priv *priv;
>  
> -	priv = pci_get_drvdata(vsec_dev->pcidev);
> +	if (!dev_is_pci(vsec_dev->dev))
> +		return -ENODEV;
> +
> +	priv = pci_get_drvdata(to_pci_dev(vsec_dev->dev));
>  	if (!priv)
>  		return -EINVAL;
>  
> @@ -822,7 +832,7 @@ static pci_ers_result_t intel_vsec_pci_slot_reset(struct pci_dev *pdev)
>  
>  	xa_for_each(&auxdev_array, index, intel_vsec_dev) {
>  		/* check if pdev doesn't match */
> -		if (pdev != intel_vsec_dev->pcidev)
> +		if (&pdev->dev != intel_vsec_dev->dev)
>  			continue;
>  		devm_release_action(&pdev->dev, intel_vsec_remove_aux,
>  				    &intel_vsec_dev->auxdev);
> diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
> index 2ccde86c529f..254273392639 100644
> --- a/drivers/platform/x86/intel/vsec_tpmi.c
> +++ b/drivers/platform/x86/intel/vsec_tpmi.c
> @@ -530,7 +530,7 @@ static const struct file_operations mem_write_ops = {
>  	.release        = single_release,
>  };
>  
> -#define tpmi_to_dev(info)	(&info->vsec_dev->pcidev->dev)
> +#define tpmi_to_dev(info)	((info)->vsec_dev->dev)
>  
>  static void tpmi_dbgfs_register(struct intel_tpmi_info *tpmi_info)
>  {
> @@ -642,7 +642,7 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  		tmp->flags = IORESOURCE_MEM;
>  	}
>  
> -	feature_vsec_dev->pcidev = vsec_dev->pcidev;
> +	feature_vsec_dev->dev = vsec_dev->dev;
>  	feature_vsec_dev->resource = res;
>  	feature_vsec_dev->num_resources = pfs->pfs_header.num_entries;
>  	feature_vsec_dev->priv_data = &tpmi_info->plat_info;
> @@ -742,7 +742,7 @@ static int tpmi_fetch_pfs_header(struct intel_tpmi_pm_feature *pfs, u64 start, i
>  static int intel_vsec_tpmi_init(struct auxiliary_device *auxdev)
>  {
>  	struct intel_vsec_device *vsec_dev = auxdev_to_ivdev(auxdev);
> -	struct pci_dev *pci_dev = vsec_dev->pcidev;
> +	struct pci_dev *pci_dev = to_pci_dev(vsec_dev->dev);
>  	struct intel_tpmi_info *tpmi_info;
>  	u64 pfs_start = 0;
>  	int ret, i;
> diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> index 28c2f5855a11..931ff42361a9 100644
> --- a/include/linux/intel_vsec.h
> +++ b/include/linux/intel_vsec.h
> @@ -29,8 +29,8 @@
>  #define INTEL_DVSEC_TABLE_OFFSET(x)	((x) & GENMASK(31, 3))
>  #define TABLE_OFFSET_SHIFT		3
>  
> -struct pci_dev;
>  struct resource;
> +struct pci_dev;

???? :-D

+ struct device;

(into alphabetical order).

>  enum intel_vsec_id {
>  	VSEC_ID_TELEMETRY	= 2,
> @@ -82,14 +82,14 @@ enum intel_vsec_quirks {
>   * struct pmt_callbacks - Callback infrastructure for PMT devices
>   * ->read_telem() when specified, called by client driver to access PMT data (instead
>   * of direct copy).
> - * @pdev:  PCI device reference for the callback's use
> + * @dev:   device reference for the callback's use
>   * @guid:  ID of data to acccss
>   * @data:  buffer for the data to be copied
>   * @off:   offset into the requested buffer
>   * @count: size of buffer
>   */
>  struct pmt_callbacks {
> -	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> +	int (*read_telem)(struct device *dev, u32 guid, u64 *data, loff_t off, u32 count);
>  };
>  
>  struct vsec_feature_dependency {
> @@ -122,7 +122,7 @@ struct intel_vsec_platform_info {
>  /**
>   * struct intel_sec_device - Auxbus specific device information
>   * @auxdev:        auxbus device struct for auxbus access
> - * @pcidev:        pci device associated with the device
> + * @dev:           struct device associated with the device
>   * @resource:      any resources shared by the parent
>   * @ida:           id reference
>   * @num_resources: number of resources
> @@ -134,7 +134,7 @@ struct intel_vsec_platform_info {
>   */
>  struct intel_vsec_device {
>  	struct auxiliary_device auxdev;
> -	struct pci_dev *pcidev;
> +	struct device *dev;
>  	struct resource *resource;
>  	struct ida *ida;
>  	int num_resources;
> @@ -198,14 +198,14 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
>  }
>  
>  #if IS_ENABLED(CONFIG_INTEL_VSEC)
> -int intel_vsec_register(struct pci_dev *pdev,
> -			 struct intel_vsec_platform_info *info);
> +int intel_vsec_register(struct device *dev,
> +			struct intel_vsec_platform_info *info);
>  int intel_vsec_set_mapping(struct oobmsm_plat_info *plat_info,
>  			   struct intel_vsec_device *vsec_dev);
>  struct oobmsm_plat_info *intel_vsec_get_mapping(struct pci_dev *pdev);
>  #else
> -static inline int intel_vsec_register(struct pci_dev *pdev,
> -				       struct intel_vsec_platform_info *info)
> +static inline int intel_vsec_register(struct device *dev,
> +				      struct intel_vsec_platform_info *info)
>  {
>  	return -ENODEV;
>  }
> 

-- 
 i.

