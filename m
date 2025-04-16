Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F44CA8B233
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4106D10E86E;
	Wed, 16 Apr 2025 07:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aQJLDxHt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43AA10E86E;
 Wed, 16 Apr 2025 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744788833; x=1776324833;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U5Ljm6Cc1olV1V3vTS0InLgRqxmIInWyZodg/84UWxM=;
 b=aQJLDxHta0gv7iFYrzxoGvf9Q74VbbA4Qpz3I/ucICnr7ksNr8rGPX+v
 4dXA1DUMNFDOCW7MMlwCHFByRpRigLii8IdymjkD3XYf98cf6y5CyjDLA
 SkawXGD1lbFvPe4QxXP6Nxns9IMWf1YtQOLjnQgGbGWZQFSpZtrQkmeZr
 ZaISi5mb8hcNoj8MZRpNGXWqNgbSFFU5O8G+K6aHfzpzTNwQ06DElJgCS
 11krUCA6bJbptUY5YuqcKGU4FloH78PGiWIwAnlxsr6L1ncqr5aOf1Heq
 koFkQkKHlvJ7aZG1StbyVON9sEixI0uhaR+eT0cB9CdKyBT/oFKs9Hv06 g==;
X-CSE-ConnectionGUID: RhvUWRBIRNWkKNmUiPohmw==
X-CSE-MsgGUID: si5hyQihQV6aSnZbWiUSxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="57712012"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="57712012"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:33:52 -0700
X-CSE-ConnectionGUID: c9hDXfp+SsqyixZ3TCJHxA==
X-CSE-MsgGUID: xvi8p0pORVCzFgn4JxV6BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="130210117"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.96])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 00:33:46 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, David Airlie <airlied@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts/kernel-doc.py: don't create *.pyc files
In-Reply-To: <432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
 <432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
Date: Wed, 16 Apr 2025 10:33:44 +0300
Message-ID: <8734e8r25j.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> As reported by Andy, kernel-doc.py is creating a __pycache__
> directory at build time.
>
> Disable creation of __pycache__ for the libraries used by
> kernel-doc.py, when excecuted via the build system or via
> scripts/find-unused-docs.sh.
>
> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/gpu/drm/Makefile      | 2 +-
>  drivers/gpu/drm/i915/Makefile | 2 +-
>  include/drm/Makefile          | 2 +-
>  scripts/find-unused-docs.sh   | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index ed54a546bbe2..1469d64f8783 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \

It doesn't work to put PYTHONDONTWRITEBYTECODE=1 as a parameter to
kernel-doc...

BR,
Jani.


>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index ed05b131ed3a..bb873f9cc2aa 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
>  #
>  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
>  ifdef CONFIG_DRM_I915_WERROR
> -    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
> +    cmd_checkdoc = $(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none -Werror $<
>  endif
>  
>  # header test
> diff --git a/include/drm/Makefile b/include/drm/Makefile
> index a7bd15d2803e..6088ea458f44 100644
> --- a/include/drm/Makefile
> +++ b/include/drm/Makefile
> @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest = \
>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
> +		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>  		touch $@
>  
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
> diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
> index ee6a50e33aba..d6d397fbf917 100755
> --- a/scripts/find-unused-docs.sh
> +++ b/scripts/find-unused-docs.sh
> @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
>  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
>  	continue;
>  	fi
> -	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
> +	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
>  	if [[ -n "$str" ]]; then
>  	echo "$file"
>  	fi

-- 
Jani Nikula, Intel
