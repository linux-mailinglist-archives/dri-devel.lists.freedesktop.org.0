Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2D67BD926
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 13:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3BE89226;
	Mon,  9 Oct 2023 11:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C2789226;
 Mon,  9 Oct 2023 11:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696849357; x=1728385357;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=MmMf258M2aynXUKykT7A9ZJ1flv5Ehw3wMtnyNA2/MI=;
 b=MaiDGI3bslFnMGKYgCxQVzfKGo8/0dHOojPDfBnnFFH2bU/J97vQcuBr
 +eiIg/rEXVtMtApeDGPuh13ZIhlP8R4Jn3aMEXA6GBbTy9qeTf/D5vQwW
 yR+J6upfChUpm9wE5yEA7Cjr3vwUzaVPmRF6i0VBuzBiCTdfJRZQIbfnP
 jgL6fB8u1VkeCc8NoAQIIIytUQwl+2gTRkEU2IrOyswsi5YFtTWsNAjA5
 +RSNXJwYAa/QhnknWujacSbFOtN6Vi3eTJfvypHWgLBUrP80ZqoAUH32g
 loYu1OeL89JfyjLsJSShXVuZ/rC9DSUJcBsNxLIzuF7wUWoPvyRZbSjUP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="382993239"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="382993239"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 04:02:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="788124493"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="788124493"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 04:02:31 -0700
Date: Mon, 9 Oct 2023 14:02:29 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: Re: [PATCH v2 12/16] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
In-Reply-To: <c5834d5e-af71-4d96-88ae-c2acd5f6604b@amd.com>
Message-ID: <38f6ad4d-fbbe-2b43-61e-7c676e3dbac6@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
 <20230930083715.2050863-13-Shyam-sundar.S-k@amd.com>
 <e7b33961-23bb-cb8-2941-ced3f0cf2620@linux.intel.com>
 <c5834d5e-af71-4d96-88ae-c2acd5f6604b@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1989512445-1696849355=:1721"
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

--8323329-1989512445-1696849355=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> On 10/4/2023 6:19 PM, Ilpo Järvinen wrote:
> > On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> > 
> >> In order to provide GPU inputs to TA for the Smart PC solution to work, we
> >> need to have interface between the PMF driver and the AMDGPU driver.
> >>
> >> Add the initial code path for get interface from AMDGPU.
> >>
> >> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> > 
> >> @@ -355,6 +356,21 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> >>  	return amd_pmf_start_policy_engine(dev);
> >>  }
> >>  
> >> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
> >> +{
> >> +	struct amd_pmf_dev *dev = data;
> >> +
> >> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
> >> +		/* get the amdgpu handle from the pci root after walking through the pci bus */
> > 
> > I can see from the code that you assign to amdgpu handle so this comment 
> > added no information.
> > 
> > It doesn't really answer at all why you're doing this second step. Based 
> > on the give parameters to pci_get_device(), it looks as if you're asking 
> > for the same device you already have in pdev to be searched to you.
> 
> Not sure if I understand you remark completely.
> 
> amd_pmf_get_gpu_handle() is a callback function for pci_walk_bus
> (which is done below).
> 
> What I am trying to do here is to get the PCI handle for the GPU
> device by walking the PCI bus.
> 
> I think the 'pdev' here refers to the pci root, using that root we
> walk the entire tree and only stop walking when we find a handle to
> GPU device.

Not exactly what happens, in amd_pmf_get_gpu_handle() pdev changes on each 
call so I don't know why you stated it is refering to the "pci root".

> Do you want me to change the "pdev" parameter to be renamed as "root" ?

No, please don't do that, it would be misleading.

> Am I missing something?

I meant that at some point of the walk through the PCI devices, you have 
a PCI device pdev with ->vendor PCI_VENDOR_ID_AMD when that if condition 
above matched. Please explain why you need to do another lookup with 
pci_get_device() at that point (with the same ->vendor and ->device as 
shown below)?

> >> +		dev->gfx_data.gpu_dev = pci_get_device(pdev->vendor, pdev->device, NULL);
> >> +		if (dev->gfx_data.gpu_dev) {
> >> +			pci_dev_put(pdev);
> >> +			return 1; /* stop walking */
> >> +		}
> >> +	}
> >> +	return 0; /* continue walking */


-- 
 i.

--8323329-1989512445-1696849355=:1721--
