Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7994C66FE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 11:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73510E36F;
	Mon, 28 Feb 2022 10:16:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F64410E35E;
 Mon, 28 Feb 2022 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646043372; x=1677579372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RdVqBf0tmoBquzjCb+ULXPAjKAB37SiTaf8dDfB3HEA=;
 b=ZnqqftT1VLTl0kEiJ89/W5ILwyMgVSRYcghwiuySMhmbMIWsDJLoYcQ8
 FatcxsB46CGg6qOyRqIIH7+opOn7KDK1XorA8khnBB/WzqzTkoCBl9m8j
 1inLZxTIR7GRp+2ra2S/9EhCXugRJPDWKdgmZfZorL8nEmX6j9cSHIJL/
 ahR2M0UaeSnBpv+DRylVgDvTvnJWjueti7jV3MDaFXyVp/DP48JVNg8Na
 6+lKzAFuKafnVmyd6jN22ofHIDUAxAmhBnSsrjoU/H3GirocDIMDmeXDD
 +EK6FvzX0RRnVOja0Ak+Yg0JRhSmsx9Jo33nZarMHRGvPe1rqx1gFhRdr Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="236357224"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="236357224"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 02:16:11 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400"; d="scan'208";a="492666694"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 02:16:07 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 28 Feb 2022 12:16:04 +0200
Date: Mon, 28 Feb 2022 12:16:04 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v5 3/7] PCI: Drop the `is_thunderbolt` attribute from PCI
 core
Message-ID: <Yhyg5OVL2hCkB+om@lahna>
References: <20220224215116.7138-4-mario.limonciello@amd.com>
 <20220225174224.GA366735@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225174224.GA366735@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Michael Jamet <michael.jamet@intel.com>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:THUNDERBOLT DRIVER" <linux-usb@vger.kernel.org>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

On Fri, Feb 25, 2022 at 11:42:24AM -0600, Bjorn Helgaas wrote:
> That would just leave the "PCI_VSEC_ID_INTEL_TBT implies external-facing"
> assumption above.  Not having a Thunderbolt spec, I have no idea how
> you deal with that.

You can download the spec here:

https://www.usb.org/sites/default/files/USB4%20Specification%2020211116.zip

Inside the archive there is also the DVSEC spec with name "USB4 DVSEC
Version 1.0.pdf".
