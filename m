Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFDFB1844C
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:56:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ABC10E89B;
	Fri,  1 Aug 2025 14:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KzpdQ/Th";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A71710E896;
 Fri,  1 Aug 2025 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754060214; x=1785596214;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=r0E35VIAkuo74voRf9YU/g+WLq5EnMCalL9y2IWLAj8=;
 b=KzpdQ/ThZ36zgdZaIWWYMEQmmgqWyHEZN5e+KCWckcssdLjMX2rWIhwW
 8rgsFQANISvxLAS17aIVn+iWjZ6YD8Eriol+YTO1p3I0hSy7oW3KybPuI
 8OmhpHqC2WQPCsYH9HAfm22nwCYDvbY8Aswl8SaJsiekVd1JoXPTK7QOW
 YdXTXWDjFUmoMcmSQoe8FL44muHBwgA4kBQcehgxQTp5o94tl5QsDzlEQ
 EHnN7KjqFEOlqBtm0vPbbKSjV6fzDxg20X5fXbLZ9PIE0xjcoJ2Zwk32o
 rxpSfBIRtFjzDGp1h6J+MsUE2Ch7JPaAl++9GKT5eaJ7S9Wt0FsTa9Ti9 g==;
X-CSE-ConnectionGUID: ZRanx1nwQ6yJCApzItgdRg==
X-CSE-MsgGUID: eMAlTjevQmGiDHans12J1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11509"; a="56489379"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="56489379"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:56:53 -0700
X-CSE-ConnectionGUID: pcYBPNepR0CHZUNq+XHD7g==
X-CSE-MsgGUID: kP3e0BFXSwSiAT8JkVa4BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="167844863"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.137])
 ([10.245.244.137])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 07:56:52 -0700
Message-ID: <37abb9a1a4fde174a54a9d7868d31b2615df0e47.camel@linux.intel.com>
Subject: Re: [PATCH v3] Mark xe driver as BROKEN if kernel page size is not 4kB
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>,
 intel-xe@lists.freedesktop.org, 	dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Fri, 01 Aug 2025 16:56:50 +0200
In-Reply-To: <274fefe9b46bb856e5968431ed524ebe1b8e8cd4.camel@linux.intel.com>
References: <460b95285cdf23dc6723972ba69ee726b3b3cfba.camel@linux.intel.com>
 <20250801102130.2644-1-Simon.Richter@hogyros.de>
 <274fefe9b46bb856e5968431ed524ebe1b8e8cd4.camel@linux.intel.com>
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

On Fri, 2025-08-01 at 16:39 +0200, Thomas Hellstr=C3=B6m wrote:
> On Fri, 2025-08-01 at 19:19 +0900, Simon Richter wrote:
> > This driver, for the time being, assumes that the kernel page size
> > is
> > 4kB,
> > so it fails on loong64 and aarch64 with 16kB pages, and ppc64el
> > with
> > 64kB
> > pages.
> >=20
> > Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> > Cc: stable@vger.kernel.org
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> I will add a Fixes: tag and push this.
>=20
> Thanks,
> Thomas

Actually, I see that the patch in its current form will cause grief
when backporting since that depends line has changed during driver
lifetime. I noticed that when trying to find a good Fixes: tag.

Would you mind if we did the following:

>=20
>=20
> > ---
> > =C2=A0drivers/gpu/drm/xe/Kconfig | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/Kconfig
> > b/drivers/gpu/drm/xe/Kconfig
> > index 2bb2bc052120..ea12ff033439 100644
> > --- a/drivers/gpu/drm/xe/Kconfig
> > +++ b/drivers/gpu/drm/xe/Kconfig
> > @@ -1,7 +1,7 @@
> > =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> > =C2=A0config DRM_XE
> > =C2=A0	tristate "Intel Xe2 Graphics"
> > -	depends on DRM && PCI
> > +	depends on DRM && PCI && (PAGE_SIZE_4KB || COMPILE_TEST ||
> > BROKEN)

Scratch this change

> > =C2=A0	depends on KUNIT || !KUNIT
> > =C2=A0	depends on INTEL_VSEC || !INTEL_VSEC
> > =C2=A0	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)

And instead here add
	depends on PAGE_SIZE_4KB || COMPILE_TEST || BROKEN

Thanks,
Thomas


>=20
>=20

