Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B161FB1840E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1A710E88A;
	Fri,  1 Aug 2025 14:39:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DcMaoDkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D31DA10E88A;
 Fri,  1 Aug 2025 14:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754059173; x=1785595173;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1+Yue7v22VLTwbOfZZv/7s1zdqZbFMwO7DxS1UC4Y68=;
 b=DcMaoDkxixCyvaNVEyVvM2fGS8/GV0NXcvCa8bmlgy5Jc5NPmvdQC5vL
 Ng5YCjOctEI3UTff8kAZ5zzjB6spIg9QifHr5i+iWbvfWGwSo5Akc2iw0
 fd8sowJJtPgOAQHzHzIbWzMEAnrXrQ/Nphao+kIP87Sv4B9/ISk3X/Bqy
 OLBRqDGbAclh1lWG9WFu32EJaIVpbVDXc7zvb3UURCEAiYB2hKvkbM5iX
 7E7kfD0XR1AfRL+W9b5Lpil3eTNYdeUMw2/FR19HcSknwlvAN0gxCqevu
 f/XAZzlGFCQZ8P0lDPl/RovkiTTcGlrjRg+Iz9wPqjXH63AeAsSfHmIHT A==;
X-CSE-ConnectionGUID: eVZxMeDhSfmhR8QgpSGSvw==
X-CSE-MsgGUID: IbzeDuqeSC2GBWIwoM+1mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56296496"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56296496"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:39:33 -0700
X-CSE-ConnectionGUID: k9bxnrpCToCcvgQiriF5qQ==
X-CSE-MsgGUID: i5DFsePTRBaK+/LXxUVj+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="163932413"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.137])
 ([10.245.244.137])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:39:31 -0700
Message-ID: <274fefe9b46bb856e5968431ed524ebe1b8e8cd4.camel@linux.intel.com>
Subject: Re: [PATCH v3] Mark xe driver as BROKEN if kernel page size is not 4kB
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>,
 intel-xe@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Date: Fri, 01 Aug 2025 16:39:28 +0200
In-Reply-To: <20250801102130.2644-1-Simon.Richter@hogyros.de>
References: <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
 <20250801102130.2644-1-Simon.Richter@hogyros.de>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-08-01 at 19:19 +0900, Simon Richter wrote:
> This driver, for the time being, assumes that the kernel page size is
> 4kB,
> so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with
> 64kB
> pages.
>=20
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Cc: stable@vger.kernel.org

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
I will add a Fixes: tag and push this.

Thanks,
Thomas


> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 2bb2bc052120..ea12ff033439 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -1,7 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0config DRM_XE
> =C2=A0	tristate "Intel Xe2 Graphics"
> -	depends on DRM && PCI
> +	depends on DRM && PCI && (PAGE_SIZE_4KB || COMPILE_TEST ||
> BROKEN)
> =C2=A0	depends on KUNIT || !KUNIT
> =C2=A0	depends on INTEL_VSEC || !INTEL_VSEC
> =C2=A0	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)


