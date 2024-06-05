Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49E8FC563
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 10:08:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE9C10E56F;
	Wed,  5 Jun 2024 08:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cylr0XoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BAD10E48C;
 Wed,  5 Jun 2024 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717574909; x=1749110909;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=2V6xeoSGk1ub4DiXjTFFRTD5i1/BCv57Wy1KYqhsyFU=;
 b=cylr0XoT5P0qPJtYBu0K2eIirfAJnBtLQpq4JEofxBtrKRGn4CkHW2PD
 oc7DPgWfQwzq8wk96m9I9zIKfy4RG9TI3M8s5P7nvWFbFb5od+NM7/EUj
 eXVVyFDEQRN9hRy7dlH4A3KItV2qYGiNLbSpFkPqUhUcaNzUCxBC3vqV/
 zLVxoFmgz54PuMmyja2/X/Gntl9RCe4OGXkXKwc501YHW9bID63Jg0gFs
 sc9IpjU9KNG1VTTRyE8q1bDu1DiIvtiVYgDL1XW074AthOEyY5Df3B4ld
 u+vdtILFThtudkli3RqhL2cUeCtk5/VTdffWct3CgMzoCyFGnKvAfl9wu A==;
X-CSE-ConnectionGUID: O2Z+TMNZRfqkkRkj9nh0MQ==
X-CSE-MsgGUID: 2XLBUjBSSii6Qqt6UYWFHA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="25276046"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="25276046"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:08:28 -0700
X-CSE-ConnectionGUID: JiJLu5YeQACz341zrcmUwQ==
X-CSE-MsgGUID: S5EEev3ASfm6RchQitZp2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="38151310"
Received: from sbutnari-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.204])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 01:08:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: Update Xe driver maintainers
In-Reply-To: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
Date: Wed, 05 Jun 2024 11:08:20 +0300
Message-ID: <875xundd6z.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 02 Jun 2024, Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.co=
m> wrote:
> Add Rodrigo Vivi as an Xe driver maintainer.
>
> v2:
> - Cc also Lucas De Marchi (Rodrigo vivi)
> - Remove a blank line in commit the commit message (Lucas De Marchi)
>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

Already acked on irc, but FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 572be0546e21..8f9982c99257 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11037,6 +11037,7 @@ F:	include/uapi/drm/i915_drm.h
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
>  M:	Lucas De Marchi <lucas.demarchi@intel.com>
>  M:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> +M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org
>  S:	Supported
>  W:	https://drm.pages.freedesktop.org/intel-docs/

--=20
Jani Nikula, Intel
