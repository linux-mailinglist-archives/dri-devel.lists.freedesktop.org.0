Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D15219123
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 22:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 179316E91F;
	Wed,  8 Jul 2020 20:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7386C6E91F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 20:07:28 +0000 (UTC)
IronPort-SDR: n2/9rAJOOdAVi79Jnu0AfFD6jh2T0+KdmSzGOQKKxzNutCJQmY/D4q4sEEU3M/DH5lMvBJYSJM
 QIxELC9hBddQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="135345079"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="135345079"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:07:27 -0700
IronPort-SDR: nLNkZvn/EzO6YDD0IujSDNi5WhtkLkAblXP3vE7gV70FZPiCFfmcpKNLUMA+oIkUIQLkTCcYRr
 DzoMBMPhJmsg==
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="268557153"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.168])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 13:07:27 -0700
Date: Wed, 8 Jul 2020 13:07:26 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH] intel: sync i915_pciids.h with kernel
Message-ID: <20200708200726.GB2168119@mdroper-desk1.amr.corp.intel.com>
References: <20200708174632.26487-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708174632.26487-1-jose.souza@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 10:46:32AM -0700, Jos=E9 Roberto de Souza wrote:
> Two new patches landed in kernel adding new PCI ids:
> 123f62de419f ("drm/i915/rkl: Add RKL platform info and PCI ids")
> 52797a8e8529 ("drm/i915/ehl: Add new PCI ids")
> =

> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  intel/i915_pciids.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> =

> diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
> index 662d8351..d6cb2899 100644
> --- a/intel/i915_pciids.h
> +++ b/intel/i915_pciids.h
> @@ -588,7 +588,11 @@
>  	INTEL_VGA_DEVICE(0x4551, info), \
>  	INTEL_VGA_DEVICE(0x4541, info), \
>  	INTEL_VGA_DEVICE(0x4E71, info), \
> +	INTEL_VGA_DEVICE(0x4557, info), \
> +	INTEL_VGA_DEVICE(0x4555, info), \
>  	INTEL_VGA_DEVICE(0x4E61, info), \
> +	INTEL_VGA_DEVICE(0x4E57, info), \
> +	INTEL_VGA_DEVICE(0x4E55, info), \
>  	INTEL_VGA_DEVICE(0x4E51, info)
>  =

>  /* TGL */
> @@ -605,4 +609,13 @@
>  	INTEL_VGA_DEVICE(0x9AD9, info), \
>  	INTEL_VGA_DEVICE(0x9AF8, info)
>  =

> +/* RKL */
> +#define INTEL_RKL_IDS(info) \
> +	INTEL_VGA_DEVICE(0x4C80, info), \
> +	INTEL_VGA_DEVICE(0x4C8A, info), \
> +	INTEL_VGA_DEVICE(0x4C8B, info), \
> +	INTEL_VGA_DEVICE(0x4C8C, info), \
> +	INTEL_VGA_DEVICE(0x4C90, info), \
> +	INTEL_VGA_DEVICE(0x4C9A, info)
> +
>  #endif /* _I915_PCIIDS_H */
> -- =

> 2.27.0
> =


-- =

Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
