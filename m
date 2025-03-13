Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D4EA5F145
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 11:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F7210E20C;
	Thu, 13 Mar 2025 10:48:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrqol/dL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B9510E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741862911; x=1773398911;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Jmvl8EX5DkvtuZEU3inPTKIXywN5zwJZsdjqePPph9Y=;
 b=mrqol/dLX0qHCIQEF8tm2K8FAid4xDJbTP9XHVxfBLmUMnqjPDmJH/Qt
 pj7xqndLXK32/h7IT2ge5VDntjhKyyBg60EsoY6ea1XG2zSfygt5O/jlp
 XnFe0xEbIqt5fHH1eRYMNtcSjwFLoaLS/qXKTGOcv2IFSzvcAOwjnERR3
 KsxfOXsqpRicvCpYMulqyvHTI/S9q0M1GkwAMbIM+ivpudtuUkVekjEtg
 BssGfPFQBTKNBT4xmiHfS6VyPPJmvnVE/FqzNu7vl8D41SxsmFMrnYmR4
 N/4jZW+8ZOb8VUdtH+oIOiL+UzSuNv6Xa+/+A/TgJ4/HGX/9y11y0oOhd w==;
X-CSE-ConnectionGUID: TZhv1Vo3SmqQKIomMgGm+w==
X-CSE-MsgGUID: JGBy/wR/S4W1OIQXBhQPVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="60514138"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="60514138"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:48:31 -0700
X-CSE-ConnectionGUID: FrkTloA9TMO0Zg3K+dXd4A==
X-CSE-MsgGUID: j7wWwXkwSX26abe4bq8WXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="126104435"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 03:48:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Yo-Jung (Leo) Lin" <leo.lin@canonical.com>
Cc: leo.lin@canonical.com, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: add .hdrtest to .gitignore under drm directories
In-Reply-To: <20250313041711.872378-1-leo.lin@canonical.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250313041711.872378-1-leo.lin@canonical.com>
Date: Thu, 13 Mar 2025 12:48:23 +0200
Message-ID: <878qp9dx54.fsf@intel.com>
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

On Thu, 13 Mar 2025, "Yo-Jung (Leo) Lin" <leo.lin@canonical.com> wrote:
> The header self-contained tests in drm may leave .hdrtest files in
> include/drm/ and drivers/gpu/drm/. Omit them by adding .gitignore

This has already been the case with usr/include for
CONFIG_UAPI_HEADER_TEST=y but I guess nobody noticed before.

Maybe fix that too?

BR,
Jani.


>
> Signed-off-by: Yo-Jung (Leo) Lin <leo.lin@canonical.com>
> ---
>  drivers/gpu/drm/.gitignore | 1 +
>  include/drm/.gitignore     | 1 +
>  2 files changed, 2 insertions(+)
>  create mode 100644 drivers/gpu/drm/.gitignore
>  create mode 100644 include/drm/.gitignore
>
> diff --git a/drivers/gpu/drm/.gitignore b/drivers/gpu/drm/.gitignore
> new file mode 100644
> index 000000000000..d9a77f3b59b2
> --- /dev/null
> +++ b/drivers/gpu/drm/.gitignore
> @@ -0,0 +1 @@
> +*.hdrtest
> diff --git a/include/drm/.gitignore b/include/drm/.gitignore
> new file mode 100644
> index 000000000000..d9a77f3b59b2
> --- /dev/null
> +++ b/include/drm/.gitignore
> @@ -0,0 +1 @@
> +*.hdrtest

-- 
Jani Nikula, Intel
