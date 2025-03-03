Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E1EA4C04B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 13:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CBD10E132;
	Mon,  3 Mar 2025 12:26:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UZY6Anrz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279538951B;
 Mon,  3 Mar 2025 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741004812; x=1772540812;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TdQIbsH8mqQaDHag5Y+cfV7DxcUvccLSzgI7CxU6a1k=;
 b=UZY6AnrzpPz6FDF3v91W3zJz9CcBS5ECl9dsT6fY8r7FUYHDePfNafvf
 j0kAYYkwOfw3ms8qZU+ix6r+DjHNqoZ7mp6SZ0vPfR45HDE9/jyuwl+jR
 ECQFflYJR1xvxXtDvJM0cZUVI6rKU3FfZ5JKIh/RCBbo9FjiCzqcQggDy
 J2tA5QPyDC1xzOFYimgJqvqi/0PFOIxPazsNxCaV6dmrAWxr80FLhU3yx
 N5pAFILo5pSPGgVaUVZ84nSa6PrlDUvt3+RwOBWhHZqzgpUtMpjj5pZsn
 G+YMral1bq3VLtJFve0pXYeX2G960U+/xYIdGbDuXAH90QXX0zyRO6gLf Q==;
X-CSE-ConnectionGUID: eFF9WfE2SKq+7S4Og40YlA==
X-CSE-MsgGUID: hxSEysDGSpSLwFVHFm+69A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41730178"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="41730178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 04:26:51 -0800
X-CSE-ConnectionGUID: oPHnG1+lQ3yesmC6+1fm6w==
X-CSE-MsgGUID: kV+xYlv9QB656lMJgu8BnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123208499"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 03 Mar 2025 04:26:49 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Mar 2025 14:26:47 +0200
Date: Mon, 3 Mar 2025 14:26:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJVSUxEOiBmYWls?= =?utf-8?Q?ur?=
 =?utf-8?Q?e?= for drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
Message-ID: <Z8WgBx5sVVcoLYsk@intel.com>
References: <20250303094808.11860-1-ville.syrjala@linux.intel.com>
 <174100275212.118223.16006543455148366118@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174100275212.118223.16006543455148366118@b555e5b46a47>
X-Patchwork-Hint: comment
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

On Mon, Mar 03, 2025 at 11:52:32AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/client: Build the tests with CONFIG_DRM_KUNIT_TEST=m
> URL   : https://patchwork.freedesktop.org/series/145707/
> State : failure
> 
> == Summary ==
> 
> Error: make failed
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CHK     kernel/kheaders_data.tar.xz
>   HDRTEST drivers/gpu/drm/xe/generated/xe_wa_oob.h
>   UPD     include/generated/utsversion.h
>   CC      init/version-timestamp.o
>   KSYMS   .tmp_vmlinux0.kallsyms.S
>   AS      .tmp_vmlinux0.kallsyms.o
>   LD      .tmp_vmlinux1
> ld: drivers/gpu/drm/drm_client_modeset.o: in function `drm_test_pick_cmdline_named':
> /home/kbuild/kernel/drivers/gpu/drm/tests/drm_client_modeset_test.c:142:(.text+0x3c9): undefined reference to `drm_helper_probe_single_connector_modes'

That comes from drm_kms_helper.ko, but drm_client* goes into
drm.ko. So this looks like a circular dependency :/

> ld: /home/kbuild/kernel/drivers/gpu/drm/tests/drm_client_modeset_test.c:136:(.text+0x4b1): undefined reference to `kunit_unary_assert_format'

No idea what is going on with these. Should be coming via CONFIG_KUNT
and we do seem to depend on that.

-- 
Ville Syrjälä
Intel
