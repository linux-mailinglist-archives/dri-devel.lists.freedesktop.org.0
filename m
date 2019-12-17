Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAFF12360E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 20:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C796E0D3;
	Tue, 17 Dec 2019 19:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740216E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 19:56:00 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 11:55:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="240543186"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.64])
 by fmsmga004.fm.intel.com with ESMTP; 17 Dec 2019 11:55:59 -0800
Date: Tue, 17 Dec 2019 11:55:59 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v2 libdrm] intel: sync i915_pciids.h with kernel
Message-ID: <20191217195559.GD1094686@mdroper-desk1.amr.corp.intel.com>
References: <20191217193140.188012-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217193140.188012-1-jose.souza@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 James Ausmus <james.ausmus@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 17, 2019 at 11:31:40AM -0800, Jos=E9 Roberto de Souza wrote:
> Changes:
> 651cc835d5f6 ("drm/i915: Add new EHL/JSL PCI ids")
> b6a8781a447c ("drm/i915/cml: Remove unsupport PCI ID")
> 8717c6b7414f ("drm/i915/cml: Separate U series pci id from origianl list.=
")
> =

> v2: added the latest CML changes
> =

> Cc: James Ausmus <james.ausmus@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com> (v1 EHL/JSL changes)

Diff against same file in drm-tip is empty, so r-b stands for this
version too.


Matt

> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  intel/i915_pciids.h | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> =

> diff --git a/intel/i915_pciids.h b/intel/i915_pciids.h
> index b1f66b11..1d2c1221 100644
> --- a/intel/i915_pciids.h
> +++ b/intel/i915_pciids.h
> @@ -446,23 +446,18 @@
>  =

>  /* CML GT1 */
>  #define INTEL_CML_GT1_IDS(info)	\
> -	INTEL_VGA_DEVICE(0x9B21, info), \
> -	INTEL_VGA_DEVICE(0x9BAA, info), \
> -	INTEL_VGA_DEVICE(0x9BAB, info), \
> -	INTEL_VGA_DEVICE(0x9BAC, info), \
> -	INTEL_VGA_DEVICE(0x9BA0, info), \
>  	INTEL_VGA_DEVICE(0x9BA5, info), \
>  	INTEL_VGA_DEVICE(0x9BA8, info), \
>  	INTEL_VGA_DEVICE(0x9BA4, info), \
>  	INTEL_VGA_DEVICE(0x9BA2, info)
>  =

> +#define INTEL_CML_U_GT1_IDS(info) \
> +	INTEL_VGA_DEVICE(0x9B21, info), \
> +	INTEL_VGA_DEVICE(0x9BAA, info), \
> +	INTEL_VGA_DEVICE(0x9BAC, info)
> +
>  /* CML GT2 */
>  #define INTEL_CML_GT2_IDS(info)	\
> -	INTEL_VGA_DEVICE(0x9B41, info), \
> -	INTEL_VGA_DEVICE(0x9BCA, info), \
> -	INTEL_VGA_DEVICE(0x9BCB, info), \
> -	INTEL_VGA_DEVICE(0x9BCC, info), \
> -	INTEL_VGA_DEVICE(0x9BC0, info), \
>  	INTEL_VGA_DEVICE(0x9BC5, info), \
>  	INTEL_VGA_DEVICE(0x9BC8, info), \
>  	INTEL_VGA_DEVICE(0x9BC4, info), \
> @@ -471,6 +466,11 @@
>  	INTEL_VGA_DEVICE(0x9BE6, info), \
>  	INTEL_VGA_DEVICE(0x9BF6, info)
>  =

> +#define INTEL_CML_U_GT2_IDS(info) \
> +	INTEL_VGA_DEVICE(0x9B41, info), \
> +	INTEL_VGA_DEVICE(0x9BCA, info), \
> +	INTEL_VGA_DEVICE(0x9BCC, info)
> +
>  #define INTEL_KBL_IDS(info) \
>  	INTEL_KBL_GT1_IDS(info), \
>  	INTEL_KBL_GT2_IDS(info), \
> @@ -536,7 +536,9 @@
>  	INTEL_WHL_U_GT3_IDS(info), \
>  	INTEL_AML_CFL_GT2_IDS(info), \
>  	INTEL_CML_GT1_IDS(info), \
> -	INTEL_CML_GT2_IDS(info)
> +	INTEL_CML_GT2_IDS(info), \
> +	INTEL_CML_U_GT1_IDS(info), \
> +	INTEL_CML_U_GT2_IDS(info)
>  =

>  /* CNL */
>  #define INTEL_CNL_PORT_F_IDS(info) \
> @@ -579,12 +581,15 @@
>  	INTEL_VGA_DEVICE(0x8A51, info), \
>  	INTEL_VGA_DEVICE(0x8A5D, info)
>  =

> -/* EHL */
> +/* EHL/JSL */
>  #define INTEL_EHL_IDS(info) \
>  	INTEL_VGA_DEVICE(0x4500, info),	\
>  	INTEL_VGA_DEVICE(0x4571, info), \
>  	INTEL_VGA_DEVICE(0x4551, info), \
> -	INTEL_VGA_DEVICE(0x4541, info)
> +	INTEL_VGA_DEVICE(0x4541, info), \
> +	INTEL_VGA_DEVICE(0x4E71, info), \
> +	INTEL_VGA_DEVICE(0x4E61, info), \
> +	INTEL_VGA_DEVICE(0x4E51, info)
>  =

>  /* TGL */
>  #define INTEL_TGL_12_IDS(info) \
> -- =

> 2.24.1
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
