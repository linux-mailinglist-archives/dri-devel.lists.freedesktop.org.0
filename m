Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAMkOyQUcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:47:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43E4E13B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D30810E13B;
	Tue, 20 Jan 2026 23:47:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcDALedF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB410E674;
 Tue, 20 Jan 2026 23:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768952864; x=1800488864;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zrhX0W/qJ0JAmaKwv5c/jWnQl48afpPBI7sL9OmEBsw=;
 b=EcDALedF/Zzq+nSZUfmBfyz2wrB38SIY37W8hTQgoSHX8BxSvy+3POe+
 CVmgVoDWumD9p8Yp7GowA7NSWtFiNDWx5GOKFwDcJCxmBgS2UF61TP84D
 y2gV3WiyhzByb+VLE/hC86+ZKjoUINYvozL6Le/JwevMhEdx5/6hyFGgW
 ctQ2fViUPUrfGyHvqaFRpg7iOiHj6V++tjo+OZPqdiJzs/qH7KxedeyaR
 OS0f0o1MrJbtCKnE0hvcvm+8UF8HLEjMbInRJdn+RLYkgOrKyhbyEEZ7m
 YUvdDTQQ17+9GprqCTZ3FPjTF1Ra4qkLfFx2nOmFR5tmbSEoDBBSAO7fY Q==;
X-CSE-ConnectionGUID: 6YkL6p1NQ/6oddUw1nizgg==
X-CSE-MsgGUID: pAQmnz+bSUaMCG6IewlcfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="87752851"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="87752851"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:47:44 -0800
X-CSE-ConnectionGUID: OVwLqeimSCmv6/HQCoV68A==
X-CSE-MsgGUID: uNZlVuXQQJml0ngiFFgz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="236932349"
Received: from debox1-desk4.jf.intel.com (HELO localhost) ([10.88.27.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 15:47:43 -0800
Date: Tue, 20 Jan 2026 15:47:43 -0800
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com, 
 irenic.rajneesh@gmail.com, srinivas.pandruvada@linux.intel.com, 
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 xi.pardee@linux.intel.comn, 
 Hans de Goede <hansg@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86/intel/vsec: Switch exported helpers
 from pci_dev to device
Message-ID: <wrljiogi3nturdsnevfdsxs3nuzrox7bimlvaqtyedxrfswsit@yawpecrjk7f2>
References: <20260107002153.63830-1-david.e.box@linux.intel.com>
 <20260107002153.63830-3-david.e.box@linux.intel.com>
 <6641348b-a9d0-360d-0080-46f95fd3d1a7@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6641348b-a9d0-360d-0080-46f95fd3d1a7@linux.intel.com>
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_NEQ_ENVFROM(0.00)[david.e.box@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,gmail.com,lists.freedesktop.org,linux.intel.comn,kernel.org,vger.kernel.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 2B43E4E13B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 15, 2026 at 03:08:09PM +0200, Ilpo Järvinen wrote:
> On Tue, 6 Jan 2026, David E. Box wrote:
> 
> > Preparatory refactor for ACPI-enumerated PMT endpoints. Several exported
> > PMT/VSEC interfaces and structs carried struct pci_dev * even though
> > callers only need a generic struct device. Move those to struct device * so
> > the same APIs work for PCI and ACPI parents.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_debugfs.c               |  2 +-
> >  drivers/gpu/drm/xe/xe_hwmon.c                 |  2 +-
> >  drivers/gpu/drm/xe/xe_vsec.c                  |  7 +-
> >  drivers/gpu/drm/xe/xe_vsec.h                  |  2 +-
> >  drivers/platform/x86/intel/pmc/core.c         |  4 +-
> >  .../platform/x86/intel/pmc/ssram_telemetry.c  |  2 +-
> >  drivers/platform/x86/intel/pmt/class.c        |  8 +-
> >  drivers/platform/x86/intel/pmt/class.h        |  4 +-
> >  drivers/platform/x86/intel/pmt/discovery.c    |  4 +-
> >  drivers/platform/x86/intel/pmt/telemetry.c    | 13 ++--
> >  drivers/platform/x86/intel/pmt/telemetry.h    | 11 ++-
> >  drivers/platform/x86/intel/sdsi.c             |  5 +-
> >  drivers/platform/x86/intel/vsec.c             | 74 +++++++++++--------
> >  drivers/platform/x86/intel/vsec_tpmi.c        |  6 +-
> >  include/linux/intel_vsec.h                    | 18 ++---
> >  15 files changed, 86 insertions(+), 76 deletions(-)
> > 
> 

...

> > @@ -630,7 +634,7 @@ static void intel_vsec_skip_missing_dependencies(struct pci_dev *pdev)
> >  
> >  static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  {
> > -	struct intel_vsec_platform_info *info;
> > +	struct intel_vsec_platform_info info, *info_temp;
> >  	struct vsec_priv *priv;
> >  	int num_caps, ret;
> >  	int run_once = 0;
> > @@ -641,22 +645,25 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
> >  		return ret;
> >  
> >  	pci_save_state(pdev);
> > -	info = (struct intel_vsec_platform_info *)id->driver_data;
> > -	if (!info)
> > +	info_temp = (struct intel_vsec_platform_info *)id->driver_data;
> > +	if (!info_temp)
> >  		return -EINVAL;
> >  
> > +	/* XXX: Needs better fix */
> > +	info = *info_temp;
> > +
> >  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> >  	if (!priv)
> >  		return -ENOMEM;
> >  
> > -	priv->info = info;
> > +	priv->info = &info;
> >  	pci_set_drvdata(pdev, priv);
> 
> What's going on here??? 'info' is a stack variable and you're taking 
> a pointer of it into priv/drvdata??

Oy vey. This chunk shouldn't even be here. It was part of an incomplete
refactor of code from heap to stack that I ended up dropping anyway.
Sorry for the noise. Ack on everything else. Thanks Ilpo.

David
