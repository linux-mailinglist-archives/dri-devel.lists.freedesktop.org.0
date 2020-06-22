Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 194DB203AF0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 17:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C8D6E840;
	Mon, 22 Jun 2020 15:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D836E83C;
 Mon, 22 Jun 2020 15:31:32 +0000 (UTC)
IronPort-SDR: AA1Fe0d3JeQTtBH892W8qmEWpXlj7dnIWsSVizPggmXymEIyPQX+V+86UVQRjT+Z77+gVTLEYs
 /gDx4HaAXoGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9659"; a="141294357"
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="141294357"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 08:31:30 -0700
IronPort-SDR: I4ixZJGXK/ScgSwQsuIjW2j5s4ezS/fGdsWyWhWrWOg5VsdHpBPHMetQNcvK1OzZtnV08FhtZZ
 WtZ3WFtYFZEw==
X-IronPort-AV: E=Sophos;i="5.75,267,1589266800"; d="scan'208";a="451876424"
Received: from unknown (HELO localhost) ([10.249.40.58])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 08:31:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: ramadevi.gandi@intel.com, ashutosh.dixit@intel.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ramadevi.gandi@intel.com, igt-dev@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH libdrm] intel: sync i915_pciids.h with kernel
In-Reply-To: <20200616123758.3331-1-ramadevi.gandi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200616123758.3331-1-ramadevi.gandi@intel.com>
Date: Mon, 22 Jun 2020 18:31:24 +0300
Message-ID: <87wo3znmlv.fsf@intel.com>
MIME-Version: 1.0
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
Cc: kalyan.kondapally@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 16 Jun 2020, ramadevi.gandi@intel.com wrote:
> From: Gandi Ramadevi <ramadevi.gandi@intel.com>
>
> Add DG1 PCI ID

There are no DG1 PCI IDs in kernel. So please don't add them here
either.

BR,
Jani.


>
> Signed-off-by: Gandi Ramadevi <ramadevi.gandi@intel.com>
> ---
>  intel/i915_pciids.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
> index 662d8351..724e68a0 100644
> --- a/intel/i915_pciids.h
> +++ b/intel/i915_pciids.h
> @@ -605,4 +605,9 @@
>  	INTEL_VGA_DEVICE(0x9AD9, info), \
>  	INTEL_VGA_DEVICE(0x9AF8, info)
>  
> +/* DG1 */
> +#define INTEL_DG1_IDS(info) \
> +        INTEL_VGA_DEVICE(0x4905, info), \
> +        INTEL_VGA_DEVICE(0x4906, info)
> +
>  #endif /* _I915_PCIIDS_H */

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
