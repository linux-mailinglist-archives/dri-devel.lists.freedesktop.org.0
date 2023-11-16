Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A9F7EE0E4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:52:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B43910E5CB;
	Thu, 16 Nov 2023 12:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAF810E2A6;
 Thu, 16 Nov 2023 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700139125; x=1731675125;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=f4QDrezvvE23+gVuxjkoKDCNJ2E6SLKLC02A5VExyX4=;
 b=EP7cY4RGW7EO7/wewcm1Wqg9dyuph63l722KQcvJt7Ktdv/98CuMPDGV
 ncmK9wMaG+8Qzm+RcQv6e3K9x4rjsqeSYhz9259SWQnHaM8SiTCudEnT5
 Xwrw/cm8n+PoS9BU8aqf3V05/Uez5vrjcSOjwMq7fK6h5G1CdF3xGHWCe
 ycxJGnv5boroTgcT56JKXwwzEqv7PJjK1N1Faa34fkXpCTJNcGo1BgneB
 xiaW8XujIrcGzvIxzPhPHK1FsB+SPTBfiqX5cMHBL/RCXoGfS/l3Qtlus
 lxfnrQj0XdyORbRg4HGMTZh2K5TLpU47ECHL1zioORq6WSf0sqfLDUNWg g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="376126900"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="376126900"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="768899030"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; d="scan'208";a="768899030"
Received: from jhsteyn-mobl1.ger.corp.intel.com ([10.252.40.9])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 04:51:57 -0800
Date: Thu, 16 Nov 2023 14:51:55 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v3 3/7] PCI: Drop pci_is_thunderbolt_attached()
In-Reply-To: <20231114200755.14911-4-mario.limonciello@amd.com>
Message-ID: <74dcfcaf-e6d4-dec8-4227-a4caf51bd4d0@linux.intel.com>
References: <20231114200755.14911-1-mario.limonciello@amd.com>
 <20231114200755.14911-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1230501375-1700139122=:1886"
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
Cc: Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?ISO-8859-15?Q?Pali_Roh=E1r?= <pali@kernel.org>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1230501375-1700139122=:1886
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Tue, 14 Nov 2023, Mario Limonciello wrote:

> All callers have switched to dev_is_removable() for detecting
> hotpluggable PCIe devices.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v2->v3:
>  * No changes
> ---
>  include/linux/pci.h | 22 ----------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 60ca768bc867..1fbca2bd92e8 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -2645,28 +2645,6 @@ static inline bool pci_ari_enabled(struct pci_bus *bus)
>  	return bus->self && bus->self->ari_enabled;
>  }
>  
> -/**
> - * pci_is_thunderbolt_attached - whether device is on a Thunderbolt daisy chain
> - * @pdev: PCI device to check
> - *
> - * Walk upwards from @pdev and check for each encountered bridge if it's part
> - * of a Thunderbolt controller.  Reaching the host bridge means @pdev is not
> - * Thunderbolt-attached.  (But rather soldered to the mainboard usually.)
> - */
> -static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
> -{
> -	struct pci_dev *parent = pdev;
> -
> -	if (pdev->is_thunderbolt)
> -		return true;
> -
> -	while ((parent = pci_upstream_bridge(parent)))
> -		if (parent->is_thunderbolt)
> -			return true;
> -
> -	return false;
> -}
> -
>  #if defined(CONFIG_PCIEPORTBUS) || defined(CONFIG_EEH)
>  void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
>  #endif
> 

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1230501375-1700139122=:1886--
