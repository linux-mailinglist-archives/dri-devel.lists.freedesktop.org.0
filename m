Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A117CD851
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 11:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201E910E094;
	Wed, 18 Oct 2023 09:37:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87B7410E094;
 Wed, 18 Oct 2023 09:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697621870; x=1729157870;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=jCXWBlD84BTyNglloktAZAcTQMc203q6u0L9+NHbmMM=;
 b=W/3pAlp8dWmSWxr36/icevySCTEQUZvwTSj+luQMulmgQGymXS43OD6Z
 Tb3Xqxhda6yL2oQNWc2U178BXY9g1GUnny5R5eJYRRfz0+eD/0FOwbxu9
 YUpGwjwBiRTISF0/KzQPu8H+V/hFPnjJXMi3UADdWyD913id7re/itTv7
 e/21dG64KmWv7q0MKF2YPGclHIVErQT+aqWuxM8ctH3AZykALiBWdcngG
 lKxslbwUpY2fJAQ1HUd7F/9rN6zBqslyd5GmZ2b0CVqBz8iFVQs1ml7sW
 01WOaLGAbSWKUewFfZ0dvKjZj6/Eogt8SD7rDUJ6Y0CqpEuNcSbADRwVA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389852822"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389852822"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 02:37:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900273405"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="900273405"
Received: from gruberda-mobl1.ger.corp.intel.com ([10.252.62.52])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2023 02:35:13 -0700
Date: Wed, 18 Oct 2023 12:37:15 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
In-Reply-To: <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
Message-ID: <8cc0248e-2dd-1169-6333-10496b373bf@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-365477675-1697621841=:2178"
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 dri-devel@lists.freedesktop.org, jikos@kernel.org,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 markgross@kernel.org, Hans de Goede <hdegoede@redhat.com>,
 benjamin.tissoires@redhat.com, mario.limonciello@amd.com,
 linux-input@vger.kernel.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-365477675-1697621841=:2178
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
> On 10/18/2023 2:50 PM, Ilpo Järvinen wrote:
> > On Wed, 18 Oct 2023, Shyam Sundar S K wrote:
> > 
> >> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> >> need to have interface between the PMF driver and the AMDGPU driver.
> >>
> >> Add the initial code path for get interface from AMDGPU.
> >>
> >> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/gpu/drm/amd/amdgpu/Makefile     |   2 +
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu.h     |   1 +
> >>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 138 ++++++++++++++++++++++++
> >>  drivers/platform/x86/amd/pmf/Kconfig    |   1 +
> >>  drivers/platform/x86/amd/pmf/core.c     |   1 +
> >>  drivers/platform/x86/amd/pmf/pmf.h      |   3 +
> >>  drivers/platform/x86/amd/pmf/spc.c      |  13 +++
> >>  drivers/platform/x86/amd/pmf/tee-if.c   |  26 +++++
> >>  include/linux/amd-pmf-io.h              |  35 ++++++
> >>  9 files changed, 220 insertions(+)
> >>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> >>  create mode 100644 include/linux/amd-pmf-io.h
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
> >> index 384b798a9bad..7fafccefbd7a 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> >> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> >> @@ -86,6 +86,8 @@ amdgpu-$(CONFIG_PROC_FS) += amdgpu_fdinfo.o
> >>  
> >>  amdgpu-$(CONFIG_PERF_EVENTS) += amdgpu_pmu.o
> >>  
> >> +amdgpu-$(CONFIG_AMD_PMF) += amdgpu_pmf.o
> >> +
> >>  # add asic specific block
> >>  amdgpu-$(CONFIG_DRM_AMDGPU_CIK)+= cik.o cik_ih.o \
> >>  	dce_v8_0.o gfx_v7_0.o cik_sdma.o uvd_v4_2.o vce_v2_0.o
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >> index a79d53bdbe13..26ffa1b4fe57 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> >> @@ -50,6 +50,7 @@
> >>  #include <linux/hashtable.h>
> >>  #include <linux/dma-fence.h>
> >>  #include <linux/pci.h>
> >> +#include <linux/amd-pmf-io.h>
> >>  
> >>  #include <drm/ttm/ttm_bo.h>
> >>  #include <drm/ttm/ttm_placement.h>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> >> new file mode 100644
> >> index 000000000000..ac981848df50
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
> >> @@ -0,0 +1,138 @@
> >> +/*
> >> + * Copyright 2023 Advanced Micro Devices, Inc.
> >> + *
> >> + * Permission is hereby granted, free of charge, to any person obtaining a
> >> + * copy of this software and associated documentation files (the "Software"),
> >> + * to deal in the Software without restriction, including without limitation
> >> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> >> + * and/or sell copies of the Software, and to permit persons to whom the
> >> + * Software is furnished to do so, subject to the following conditions:
> >> + *
> >> + * The above copyright notice and this permission notice shall be included in
> >> + * all copies or substantial portions of the Software.
> >> + *
> >> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> >> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> >> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> >> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> >> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> >> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> >> + * OTHER DEALINGS IN THE SOFTWARE.
> > 
> > This is MIT, right? Add the required SPDX-License-Identifier line for it
> > at the top of the file, thank you.
> > 
> 
> all the files in drivers/gpu/drm/amd/amdgpu/* carry the same license
> text. So, have retained it to maintain uniformity.

What does adding SPDX identifier line at the top of the file take away 
from that? I'd be fine if you want to add the identifier line to all of 
them too to keep them identical.

> >> + *
> >> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> + *
> >> + */
> > 
> > Remove the extra empty line at the end of the comment.
> > 
> 
> I just took the standard template for all the gpu files. Is that OK to
> retain the blank line?
> 
> If not, I can remove it in the next version.

I don't want to fight over a blank line when you insist on keeping it :-).

-- 
 i.

--8323329-365477675-1697621841=:2178--
