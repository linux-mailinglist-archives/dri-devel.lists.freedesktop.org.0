Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBBB19EDE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 11:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5508D10E428;
	Mon,  4 Aug 2025 09:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YsUTDOp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9684F10E04E;
 Mon,  4 Aug 2025 09:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754300421; x=1785836421;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=za1PTKsWjFibSErq85AFsMvUwxohoDzwmMSpj4Q7Hog=;
 b=YsUTDOp4IfsO2nIkXxMt5wgurI0C64sXoFlJRWgZfOd4JkIoe0/kau1D
 VmPkFOpBeADALZyJs3tXY5ko/s1EIwRpxzZVj5i4++2VobB8RTa7lyYRG
 kc8y8xwLl1Pbd07lm0lGUZ3qA0jDh0u60nwd7Y/q26F8LV4LxtOex67KA
 ZX1dbMJJTMo9J2tNew9LShzIXYAU1VkPo16khLJqIuD0W3TW9xqonQXEa
 05SS75B6Iu3hHO1x1UZ9xItv0M0Tgu3K7zoOVaBBv/94gKLc1efoBiYii
 Ec28F5OmdhgcoRWROC83McNRhNjsSQqViBcku5Xfm0Tdvyk6UqskD2+md g==;
X-CSE-ConnectionGUID: NN2cM987SJOFip8rPVP9qA==
X-CSE-MsgGUID: ZuCfnx7QQw25WW9K66xXxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74142328"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="74142328"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 02:40:20 -0700
X-CSE-ConnectionGUID: 7d6dt920SEexhKinLnnNRA==
X-CSE-MsgGUID: EDZ/GzpIQ52XiYqiFjo+7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163785264"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.63])
 ([10.245.245.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 02:40:18 -0700
Message-ID: <ccf7c5b0494e46bbf86d45927e6bd130115c50fb.camel@linux.intel.com>
Subject: Re: [PATCH v4] Mark xe driver as BROKEN if kernel page size is not 4kB
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>,
 intel-xe@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Date: Mon, 04 Aug 2025 11:40:15 +0200
In-Reply-To: <20250802024152.3021-1-Simon.Richter@hogyros.de>
References: <37abb9a1a4fde174a54a9d7868d31b2615df0e47.camel@linux.intel.com>
 <20250802024152.3021-1-Simon.Richter@hogyros.de>
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

On Sat, 2025-08-02 at 11:40 +0900, Simon Richter wrote:
> This driver, for the time being, assumes that the kernel page size is
> 4kB,
> so it fails on loong64 and aarch64 with 16kB pages, and ppc64el with
> 64kB
> pages.
>=20
> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> Cc: stable@vger.kernel.org
> ---
> =C2=A0drivers/gpu/drm/xe/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 2bb2bc052120..714d5702dfd7 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -5,6 +5,7 @@ config DRM_XE
> =C2=A0	depends on KUNIT || !KUNIT
> =C2=A0	depends on INTEL_VSEC || !INTEL_VSEC
> =C2=A0	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
> +	depends on PAGE_SIZE_4KB || COMPILE_TEST || BROKEN
> =C2=A0	select INTERVAL_TREE
> =C2=A0	# we need shmfs for the swappable backing store, and in
> particular
> =C2=A0	# the shmem_readpage() which depends upon tmpfs

R-B still stands.

I've pushed this to drm-xe-next with a Fixes: tag which means it will
likely end up in Linus' tree the upcoming weekend.

Thanks,
Thomas

