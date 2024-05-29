Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE98D340B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 12:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6AF10E3DA;
	Wed, 29 May 2024 10:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEoGw0Xq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2004C10E5A3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 10:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716977342; x=1748513342;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ulNlRU8klIKeuiCPSgj3iYxHIrJlkypobWqNWfoqAvE=;
 b=KEoGw0XqRqBKyLGlcu/BooBJDDFyE0BSPsWTAvhzb9mNXsFAldI17YDW
 sy+25ihQh01ct+9iY1vYbp08jQVrBwwt5qUx6prB9c4O/tipIHp00O+EG
 GElyOwoCZKsZl604o17jlmtSOhvGlvfiEh5u1ixK1B2XZ1CmapPJ359ZA
 pxDs27xICBv6EPbI0Z4J+irYf2M5U/Ll2IubPSw7Y4U6Q7zPyOP3ajXCu
 VXvjTaBsxcncnNmNsnLniyEit3FBqdumFT6IQl/nEu8PIL0O7cAC9B/KI
 y36XU17hD4yjXkSqSZ0u8/znHxMH3Mpo7NhRoqatoIdIo8kjm2XRkVJHC w==;
X-CSE-ConnectionGUID: zdos5y0FRsSIIxQ+rL2LAg==
X-CSE-MsgGUID: /bOzJd/lToKuDa6/pApReQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="16319685"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="16319685"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 03:09:01 -0700
X-CSE-ConnectionGUID: eLwAdHpzQ9q9XozTjsYhpA==
X-CSE-MsgGUID: KT7aYqqwThaXpOw5Z3cgyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="40285213"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO [10.245.245.51])
 ([10.245.245.51])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 03:09:00 -0700
Message-ID: <628b6278ae02ddc1f2857051c4d2c0999d01f19e.camel@linux.intel.com>
Subject: Re: [PATCH] drm/tests: Add a missing Kconfig select
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: intel-xe@lists.freedsktop.org, dri-devel@lists.freedesktop.org
Date: Wed, 29 May 2024 12:08:57 +0200
In-Reply-To: <20240529-lush-liberal-toucanet-e8ab72@houat>
References: <20240529091955.173658-1-thomas.hellstrom@linux.intel.com>
 <20240529-lush-liberal-toucanet-e8ab72@houat>
Autocrypt: addr=thomas.hellstrom@linux.intel.com; prefer-encrypt=mutual;
 keydata=mDMEZaWU6xYJKwYBBAHaRw8BAQdAj/We1UBCIrAm9H5t5Z7+elYJowdlhiYE8zUXgxcFz360SFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCBMaW51eCBlbWFpbCkgPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPoiTBBMWCgA7FiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQuBaTVQrGBr/yQAD/Z1B+Kzy2JTuIy9LsKfC9FJmt1K/4qgaVeZMIKCAxf2UBAJhmZ5jmkDIf6YghfINZlYq6ixyWnOkWMuSLmELwOsgPuDgEZaWU6xIKKwYBBAGXVQEFAQEHQF9v/LNGegctctMWGHvmV/6oKOWWf/vd4MeqoSYTxVBTAwEIB4h4BBgWCgAgFiEEbJFDO8NaBua8diGTuBaTVQrGBr8FAmWllOsCGwwACgkQuBaTVQrGBr/P2QD9Gts6Ee91w3SzOelNjsus/DcCTBb3fRugJoqcfxjKU0gBAKIFVMvVUGbhlEi6EFTZmBZ0QIZEIzOOVfkaIgWelFEH
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
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

On Wed, 2024-05-29 at 11:40 +0200, Maxime Ripard wrote:
> Hi,
>=20
> Thanks for sending that patch
>=20
> On Wed, May 29, 2024 at 11:19:55AM GMT, Thomas Hellstr=C3=B6m wrote:
> > Fix the following warning:
> >=20
> > WARNING: unmet direct dependencies detected for
> > DRM_DISPLAY_HDMI_STATE_HELPER
> > =C2=A0 Depends on [n]: HAS_IOMEM [=3Dy] && DRM [=3Dy] && DRM_DISPLAY_HE=
LPER
> > [=3Dy] && DRM_DISPLAY_HDMI_HELPER [=3Dn]
> > =C2=A0 Selected by [y]:
> > =C2=A0 - DRM_KUNIT_TEST [=3Dy] && HAS_IOMEM [=3Dy] && DRM [=3Dy] && KUN=
IT [=3Dy]
> > && MMU [=3Dy]
> >=20
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Fixes: 54cb39e2293b ("drm/connector: hdmi: Create an HDMI sub-
> > state")
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
>=20
> I already sent a fix for that one, and just merged it:
> https://lore.kernel.org/r/20240529080013.2325748-1-mripard@kernel.org
>=20
> Let me know if it doesn't fix it for you
>=20
> Maxime

Ah, great. It blocked the xe CI but this should hopefully fix it.

Thanks,
Thomas

