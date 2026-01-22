Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKAPMmpFcmlCgQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 16:42:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2172069159
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 16:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E3110E9DB;
	Thu, 22 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anQQ0Lfw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D52710E9DB;
 Thu, 22 Jan 2026 15:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769096549; x=1800632549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=qxJnXYH7CkQdWMctZgubrkG6zIcN8YKKvbgciP9Zb4s=;
 b=anQQ0Lfw8/dYPR7cERCvgcAKLalOQpgswNu3lltG3cyBJqhu6PKdAr+3
 ofmTB/1idfFinQh08cJ7e/dubXR6JM6IIjAGOLu9sbGWpqeVXTiZu/F2t
 jHel7cPhOSXbhH1ocvZ1w2kh7cdKrn5bDhkoiBXQnnBD9E85qwMC+ZxGo
 4qRyBl6EEWfRk+TKMGAMQoTlWUOIi2/EYHepV6cWisBRdFmHR8ORKv+zc
 fXlW4BOgxOn3NhhRpbTAV9qdHNAWBGgal35Lzqona10vuSv/p4v3IzMwi
 h1FBkVS1GhugylzOP7gdvIBB0ZCpa+PJxgWhkGuVI9jDE8p5iQcHhG79h w==;
X-CSE-ConnectionGUID: NGxdAt6qQFCTABm0a1qcMw==
X-CSE-MsgGUID: /TmX95pbQV2O/ES/wk/6sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81713810"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="81713810"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:42:15 -0800
X-CSE-ConnectionGUID: RnLqXDEFR0KIT8euSM82gw==
X-CSE-MsgGUID: BckXCKegSxaHUfHWKxkzhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237432533"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 07:42:15 -0800
Date: Thu, 22 Jan 2026 07:42:15 -0800
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 xi.pardee@linux.intel.com, 
 Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v3 6/6] platform/x86/intel/vsec: Plumb ACPI PMT discovery
 tables through vsec
Message-ID: <tuitjp3fhclpfu4qhf7zz37yqaltqgca45ibsyhycgi7kqtzlx@i7dkq3gjwi4c>
References: <20260122030903.3247167-1-david.e.box@linux.intel.com>
 <20260122030903.3247167-7-david.e.box@linux.intel.com>
 <a2ad65a0-7c90-45ae-bb13-e4a3e8a58dae@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a2ad65a0-7c90-45ae-bb13-e4a3e8a58dae@linux.intel.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,intel.com:server fail];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 2172069159
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 12:29:04PM +0200, Ilpo Järvinen wrote:
> On Wed, 21 Jan 2026, David E. Box wrote:
> 
> > Some platforms expose PMT discovery via ACPI instead of PCI BARs. Add a
> > generic discovery source flag and carry ACPI discovery entries alongside
> > the existing PCI resource path so PMT clients can consume either.
> > 
> > Changes:
> >   - Add enum intel_vsec_disc_source { _PCI, _ACPI }.
> >   - Extend intel_vsec_platform_info and intel_vsec_device with source enum
> >     and ACPI discovery table pointer/
> >   - When src==ACPI, skip BAR resource setup and copy the ACPI discovery
> >     entries into the aux device.
> > 
> > No user-visible behavior change yet; this only wires ACPI data through vsec
> > in preparation for ACPI-enumerated PMT clients.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > 
> > v3:
> >   - Re-send with all changes intended for v2 which was sent without them
> >     being applied.
> > 
> > v2:
> >   - Improve comment to clarify BAR resource setup doesn't apply to ACPI
> >     discovery
> >   - Add missing #include for kmemdup()
> >   - Use array_size() for overflow protection
> >     (review comments by Ilpo Järvinen)
> > 
> > 
> >  drivers/platform/x86/intel/vsec.c | 24 ++++++++++++++++++++++++
> >  include/linux/intel_vsec.h        | 20 +++++++++++++++++++-
> >  2 files changed, 43 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> > index 4aeb0728b435..b1465e67feef 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -24,7 +24,9 @@
> >  #include <linux/intel_vsec.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > +#include <linux/overflow.h>
> >  #include <linux/pci.h>
> > +#include <linux/string.h>
> >  #include <linux/types.h>
> >  
> >  #define PMT_XA_START			0
> > @@ -109,6 +111,7 @@ static void intel_vsec_dev_release(struct device *dev)
> >  
> >  	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
> >  
> > +	kfree(intel_vsec_dev->acpi_disc);
> >  	kfree(intel_vsec_dev->resource);
> >  	kfree(intel_vsec_dev);
> >  }
> > @@ -320,6 +323,13 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
> >  	 * auxiliary device driver.
> >  	 */
> >  	for (i = 0, tmp = res; i < header->num_entries; i++, tmp++) {
> > +		/*
> > +		 * Skip resource mapping check for ACPI-based discovery
> > +		 * since those tables are read from _DSD, not MMIO.
> > +		 */
> > +		if (info->src == INTEL_VSEC_DISC_ACPI)
> > +			break;
> > +
> >  		tmp->start = base_addr + header->offset + i * (header->entry_size * sizeof(u32));
> >  		tmp->end = tmp->start + (header->entry_size * sizeof(u32)) - 1;
> >  		tmp->flags = IORESOURCE_MEM;
> > @@ -338,6 +348,20 @@ static int intel_vsec_add_dev(struct device *dev, struct intel_vsec_header *head
> >  	intel_vsec_dev->base_addr = info->base_addr;
> >  	intel_vsec_dev->priv_data = info->priv_data;
> >  	intel_vsec_dev->cap_id = cap_id;
> > +	intel_vsec_dev->src = info->src;
> > +
> > +	if (info->src == INTEL_VSEC_DISC_ACPI) {
> > +		size_t bytes;
> > +
> > +		bytes = array_size(intel_vsec_dev->num_resources,
> > +				   sizeof(info->acpi_disc[0]));
> > +		if (!bytes)
> > +			return -EOVERFLOW;
> 
> Is this correct as array_size() is documented to return SIZE_MAX on 
> overflow?

Yep. Went with array_size() but was thinking check_mul_overflow(). Will
update. Thanks.

David

> 
> Other than that, this series looked very straightforward now.
> 
> -- 
>  i.
> 
> > +
> > +		intel_vsec_dev->acpi_disc = kmemdup(info->acpi_disc, bytes, GFP_KERNEL);
> > +		if (!intel_vsec_dev->acpi_disc)
> > +			return -ENOMEM;
> > +	}
> >  
> >  	if (header->id == VSEC_ID_SDSI)
> >  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > index 4eecb2a6bac4..1fe5665a9d02 100644
> > --- a/include/linux/intel_vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -33,6 +33,11 @@ struct device;
> >  struct pci_dev;
> >  struct resource;
> >  
> > +enum intel_vsec_disc_source {
> > +	INTEL_VSEC_DISC_PCI,	/* PCI, default */
> > +	INTEL_VSEC_DISC_ACPI,	/* ACPI */
> > +};
> > +
> >  enum intel_vsec_id {
> >  	VSEC_ID_TELEMETRY	= 2,
> >  	VSEC_ID_WATCHER		= 3,
> > @@ -103,6 +108,10 @@ struct vsec_feature_dependency {
> >   * @parent:    parent device in the auxbus chain
> >   * @headers:   list of headers to define the PMT client devices to create
> >   * @deps:      array of feature dependencies
> > + * @acpi_disc: ACPI discovery tables, each entry is two QWORDs
> > + *             in little-endian format as defined by the PMT ACPI spec.
> > + *             Valid only when @provider == INTEL_VSEC_DISC_ACPI.
> > + * @src:       source of discovery table data
> >   * @priv_data: private data, usable by parent devices, currently a callback
> >   * @caps:      bitmask of PMT capabilities for the given headers
> >   * @quirks:    bitmask of VSEC device quirks
> > @@ -113,6 +122,8 @@ struct intel_vsec_platform_info {
> >  	struct device *parent;
> >  	struct intel_vsec_header **headers;
> >  	const struct vsec_feature_dependency *deps;
> > +	u32 (*acpi_disc)[4];
> > +	enum intel_vsec_disc_source src;
> >  	void *priv_data;
> >  	unsigned long caps;
> >  	unsigned long quirks;
> > @@ -124,7 +135,12 @@ struct intel_vsec_platform_info {
> >   * struct intel_vsec_device - Auxbus specific device information
> >   * @auxdev:        auxbus device struct for auxbus access
> >   * @dev:           struct device associated with the device
> > - * @resource:      any resources shared by the parent
> > + * @resource:      PCI discovery resources (BAR windows), one per discovery
> > + *                 instance. Valid only when @src == INTEL_VSEC_DISC_PCI
> > + * @acpi_disc:     ACPI discovery tables, each entry is two QWORDs
> > + *                 in little-endian format as defined by the PMT ACPI spec.
> > + *                 Valid only when @src == INTEL_VSEC_DISC_ACPI.
> > + * @src:           source of discovery table data
> >   * @ida:           id reference
> >   * @num_resources: number of resources
> >   * @id:            xarray id
> > @@ -138,6 +154,8 @@ struct intel_vsec_device {
> >  	struct auxiliary_device auxdev;
> >  	struct device *dev;
> >  	struct resource *resource;
> > +	u32 (*acpi_disc)[4];
> > +	enum intel_vsec_disc_source src;
> >  	struct ida *ida;
> >  	int num_resources;
> >  	int id; /* xa */
> > 

