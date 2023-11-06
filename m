Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F937E2A44
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 17:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E64F10E35F;
	Mon,  6 Nov 2023 16:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300CF10E355;
 Mon,  6 Nov 2023 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699289282; x=1730825282;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A4xozrlM98o/6is3EgoMPreQJpmablfWX3/r4GaT1kw=;
 b=kRFXV4jexd3FZj8ePD1khtpMhGZ9LPkIEnOJz975AOcHLi4Al35E5w0o
 TcjHaZVaWQHbySKI0rLnxh9mMiATM44vZimXu2RHspU7ayFOd3FetVvQi
 bjPkqTFb2uz1zrhXmBd0TJLU8C7sYvdnDucYgUNWLLSfKWllAsr3Ti1rE
 w9w1wO1gO0VogUk2q6bS++gAltfTifay4Z2MMDXEtDqPrwjbeA9qM7xlr
 Z2P0IDQyktLRaZ+iP4Y86eJVowCDiIsp2BJOVQbWu+bSZWtwdfxilA5RT
 ig5AkdJnnlF4ClxQ4TipN/EmSJkjgjg8xh39djoPOlTApoo0uqsjpkBb7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="453623293"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="453623293"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 08:48:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="879501854"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; d="scan'208";a="879501854"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2023 08:47:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
 id 2F0E31A5; Mon,  6 Nov 2023 18:47:51 +0200 (EET)
Date: Mon, 6 Nov 2023 18:47:51 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 1/9] drm/nouveau: Switch from
 pci_is_thunderbolt_attached() to dev_is_removable()
Message-ID: <20231106164751.GS17433@black.fi.intel.com>
References: <20231103190758.82911-1-mario.limonciello@amd.com>
 <20231103190758.82911-2-mario.limonciello@amd.com>
 <55563d57-60c3-1789-1e7c-5e618fbd6253@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55563d57-60c3-1789-1e7c-5e618fbd6253@linux.intel.com>
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
Cc: "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Karol Herbst <kherbst@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Danilo Krummrich <dakr@redhat.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Jamet <michael.jamet@intel.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, open list <linux-kernel@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 06, 2023 at 02:25:24PM +0200, Ilpo Järvinen wrote:
> On Fri, 3 Nov 2023, Mario Limonciello wrote:
> 
> > pci_is_thunderbolt_attached() only works for Intel TBT devices. Switch to
> > using dev_is_removable() to be able to detect USB4 devices as well.
> 
> Please extend this with more details. I had to lookup the TBT change to 
> be able to make any guess why you're doing this (and it's still a guess 
> at best).

Also please write it as Thunderbolt not TBT so that it is clear what we
are talking about. Ditto to all patches.
