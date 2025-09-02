Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C63AB3FDC1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F17E10E668;
	Tue,  2 Sep 2025 11:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBiIZDa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777B810E668;
 Tue,  2 Sep 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756812339; x=1788348339;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KgkXvq/Kwm0i59OA/L9F82jp/XH8ItOhe4rUC1nXarM=;
 b=nBiIZDa08NEia1N9zBj/SFFBDtRVyWiVFF1rnZwPuM/dxppm8thE474D
 Q35oYsgDJy1xB5BeFHacFthnnif4EHfuOX4Fn/Gsub3LIh7bDXZMGMwlU
 dQbaqZkGnPl50WIUZBS01CpjqUTWjuWMkh/eIKdSy9tqIsctYWndM8Apr
 5Gjt1V3xdihMHzm+ax04RnuywX1A1+C0EajsaigbIsnlP6Z8LfY/Rg0AE
 6oGt/Vwybn9Z8SMHFeSpWRS/wmdbTnV3fxa2+EUsB34WzK8O7ktq5Kesr
 KtzeEHo6zsfnnn0IYf1nM3QessaSGsiJ9CDiktyYWiZM+b6F0+NnHnlTz w==;
X-CSE-ConnectionGUID: IQcO7CZfTmWmLHc0GimKfw==
X-CSE-MsgGUID: V1rDQzjzRYWLbtTpnjfCKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59191176"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="59191176"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 04:25:39 -0700
X-CSE-ConnectionGUID: gLaloIneSDWCu+PFy+wPpw==
X-CSE-MsgGUID: SHdFKG38T/ipttA3hiX0eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; d="scan'208";a="176567428"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.193])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 04:25:34 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, acourbot@nvidia.com,
 daniel.almeida@collabora.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, Danilo
 Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250901202850.208116-1-dakr@kernel.org>
Date: Tue, 02 Sep 2025 14:25:30 +0300
Message-ID: <d27ffc705bd1ea3925084bb53ac3b0dd57e4b1e2@intel.com>
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

On Mon, 01 Sep 2025, Danilo Krummrich <dakr@kernel.org> wrote:
> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> development, with at least Nova and (soon) Tyr already upstream. Having a
> shared tree will ease and accelerate development, since all drivers can
> consume new infrastructure in the same release cycle.
>
> This includes infrastructure shared with other subsystem trees (e.g. Rust
> or driver-core). By consolidating in drm-rust, we avoid adding extra
> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> branches.
>
> The drm-misc tree is not a good fit for this stage of development, since
> its documented scope is small drivers with occasional large series.
>
> Rust drivers in development upstream, however, regularly involve large
> patch series, new infrastructure, and shared topic branches, which may
> not align well with drm-misc at this stage.
>
> The drm-rust tree may not be a permanent solution. Once the core Rust,
> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> changes are expected to transition into drm-misc or standalone driver
> trees respectively. Until then, drm-rust provides a dedicated place to
> coordinate development without disrupting existing workflows too much.
>
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

FWIW,

Acked-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..1cd6597c7f1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> -F:	rust/kernel/drm/
>  F:	include/drm/drm
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> @@ -8096,6 +8095,16 @@ X:	drivers/gpu/drm/radeon/
>  X:	drivers/gpu/drm/tegra/
>  X:	drivers/gpu/drm/xe/
>  
> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alice Ryhl <aliceryhl@google.com>
> +S:	Supported
> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
> +T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
> +F:	drivers/gpu/drm/nova/
> +F:	drivers/gpu/nova-core/
> +F:	rust/kernel/drm/
> +
>  DRM DRIVERS FOR ALLWINNER A10
>  M:	Maxime Ripard <mripard@kernel.org>
>  M:	Chen-Yu Tsai <wens@csie.org>
>
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585

-- 
Jani Nikula, Intel
