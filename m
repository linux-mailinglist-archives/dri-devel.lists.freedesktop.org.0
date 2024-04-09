Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A613E89D637
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 12:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940B5112C4D;
	Tue,  9 Apr 2024 10:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6a5eYsK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF063112C48
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 10:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712657089; x=1744193089;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=YGIVoqaqkmzn78vlWTEumv3CXIci03l0Ha+15dNRnaY=;
 b=C6a5eYsKSE+GyxmW9Bpw5sUvx1VdDBPijtXOibFTLWZ50FWktsldPOB4
 v2itzI7sCUfONQhS8yZAGPlQExTt07vkGPh71TV/rFfbSOtgRwbApSQPK
 mad2pfi4sW9q+41gZJ/D60djW0wwTKbCMaB7TGwTeTtwvnFHguvaA6HtE
 gCtc3HlvUuqhqHXmsitVSIXKnx4n4+UbUiT0tl/u2TS+vGvnPfA6is/vy
 LgtSuc4e1GMzutBgMjySpzUEC+JfJ2e2mh74ehmwVdxuCCI0BE0Baz8Ze
 vA3KfcwuHUr540/CoirSVZn/rF6tCqJ6d3lPtclRuEFTPa3uM/gAAGDlO A==;
X-CSE-ConnectionGUID: SE3xs9ZDT/Ck7ByNWwjWEg==
X-CSE-MsgGUID: 45xzzIslTx+HmXXhmvlEFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11760021"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="11760021"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:04:49 -0700
X-CSE-ConnectionGUID: 8btXhK/XTSuOGqbIvLqN0w==
X-CSE-MsgGUID: oOTcSj4wTLKSF9UBEqAcoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20207915"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 03:04:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, Lucas
 De Marchi <lucas.demarchi@intel.com>, kernel test robot <lkp@intel.com>,
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/13] drm/display: Convert helpers Kconfig symbols
 to depends on
In-Reply-To: <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240327-kms-kconfig-helpers-v3-0-eafee11b84b3@kernel.org>
 <a816fea-9974-d17f-bed6-69728e223@linux-m68k.org>
Date: Tue, 09 Apr 2024 13:04:42 +0300
Message-ID: <87sezu97id.fsf@intel.com>
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

On Tue, 09 Apr 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> The user should not need to know which helpers are needed for the driver
> he is interested in.  When a symbol selects another symbol, it should
> just make sure the dependencies of the target symbol are met.

It's really not "just make sure". This leads to perpetual illegal
configurations, and duct tape fixes. Select should not be used for
visible symbols or symbols with dependencies [1].

What we'd need for usability is not more abuse of select, but rather 1)
warnings for selecting symbols with dependencies, and 2) a way to enable
a kconfig option with all its dependencies, recursively. This is what we
lack.


BR,
Jani.


[1] Documentation/kbuild/kconfig-language.rst "reverse dependencies"


-- 
Jani Nikula, Intel
