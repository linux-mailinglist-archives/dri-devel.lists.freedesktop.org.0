Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F7FA31F8C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 07:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E4710E7BD;
	Wed, 12 Feb 2025 06:57:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XoqKFNuo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84F6710E7BB;
 Wed, 12 Feb 2025 06:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739343439; x=1770879439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xByJJAEIhFtwGW4CPUu0RB0PGIetUOmiadF1XHr1Ofo=;
 b=XoqKFNuopwxJeiahhAqr0jao8Smx38E8295Bk7SkLzLbHdoens5KuJ55
 pwb6QPTlVVg9NXUC7VtBqSI0gKCj7uXZT+OyipJ9OvCzXHzNq++yOt6Oq
 77aqDqVPl8mxR3R8NacZGLY4tc+iIEA5+IcHXCnIHv3HAIAENXA0c9thS
 3bNSoEnUizxh2BRkAbFwBUfMYTIkyCEfOTR0Fp3Hewcwvpx1VfMl7h9E+
 qCtBHj9JnTDjklLQai2rsGNPDBJ7sFoZUMLwpdq8/ir6cJ1M8+agWxlBd
 6H5ydkt0QEec4/Lumw8voZeFsxA795usOvgNnCtP2wgnSN7p3bWflw4Yw w==;
X-CSE-ConnectionGUID: qHeVasVfQLG/tYNPWQRZTQ==
X-CSE-MsgGUID: OOe57FKxRlGNma/Yy9tpUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43912239"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="43912239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 22:57:19 -0800
X-CSE-ConnectionGUID: CXLnKNayRt2hD0ZNgDk2Sg==
X-CSE-MsgGUID: PZZToMWLQ96opqhRMei6Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="116820447"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 22:57:13 -0800
Date: Wed, 12 Feb 2025 08:57:10 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 xaver.hugl@kde.org, pekka.paalanen@haloniitty.fi
Subject: Re: [PATCH v12 0/5] Introduce DRM device wedged event
Message-ID: <Z6xGRhC7qrtk7y9t@black.fi.intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
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

On Tue, Feb 04, 2025 at 12:35:23PM +0530, Raag Jadav wrote:
> This series introduces device wedged event in DRM subsystem and uses it
> in xe, i915 and amdgpu drivers. Detailed description in commit message.
> 
> This was earlier attempted as xe specific uevent in v1 and v2 on [1].
> Similar work by André Almeida on [2].
> Wedged event support for amdgpu by André Almeida on [3].
> Consumer implementation by Xaver Hugl on [4].
> 
>  [1] https://patchwork.freedesktop.org/series/136909/
>  [2] https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
>  [3] https://lore.kernel.org/dri-devel/20241216162104.58241-1-andrealmeid@igalia.com/
>  [4] https://invent.kde.org/plasma/kwin/-/merge_requests/7027

Bump. Anything I can do to move this forward?

Raag
