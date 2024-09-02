Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC129681C3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 10:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034F410E24A;
	Mon,  2 Sep 2024 08:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWS2HCVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3FC10E24C;
 Mon,  2 Sep 2024 08:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725265695; x=1756801695;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DYSBPcOtKIOt23SoN4rcguGH6srPkSaQ8dPaje/1vFQ=;
 b=mWS2HCVQ/PGpZwt4Dp+IbgVrwaV/xQXx7XQlsobHTqsc7/ACVgA9WQIg
 +VuJvNvggFC896z54eMMzB7VbvazGSLMIiMM9seECD3d1OJnn5fu4x0Y2
 NMSK9Z1o1qrrjZM9V2Jc6wjHFKw/Ri4wxE8u697Y8MLg4xV72MLJDhKl1
 EFojMyKUu14JR3RX5SO4kOYLEl/WYGQwpmFV2KhvEbPepWByqvYE/kw0N
 tzWJSpn8QhovzZ69wIzIUvwOd1G+sAxSiHMIbPEnk8I7+C787XtUtqQqx
 vTfJlXYr8O1AS7WebZqd8GnI7dMFob89alKnen3gbTnP0zimY06XiifM1 Q==;
X-CSE-ConnectionGUID: e7ZLmbS2R0q4suOCNShHMQ==
X-CSE-MsgGUID: vxLTCFW1SEiyy8TszRB06A==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="49239301"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="49239301"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 01:28:14 -0700
X-CSE-ConnectionGUID: NnCR8tGQR5uk4wKIhAbeGA==
X-CSE-MsgGUID: n5lNv2IZRpi6epXfQTS9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64168831"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 01:28:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/2] drm/i915/fence: A couple of build fixes
In-Reply-To: <87a5gvw4y9.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240829155950.1141978-1-andriy.shevchenko@linux.intel.com>
 <87cylrwahb.fsf@intel.com> <ZtCnhXwtO-gd1fMf@smile.fi.intel.com>
 <ZtC5oXSzUuuIgLiQ@smile.fi.intel.com>
 <20240829182255.GA1468662@thelio-3990X> <87a5gvw4y9.fsf@intel.com>
Date: Mon, 02 Sep 2024 11:27:57 +0300
Message-ID: <87frqiv4s2.fsf@intel.com>
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

On Thu, 29 Aug 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> The TL;DR is,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> on the series.

Both pushed to drm-intel-next, thanks for the patches and discussion.

I amended the commit message about clang, config options and commit
6863f5643dd7 ("kbuild: allow Clang to find unused static inline
functions for W=1 build") while pushing.

BR,
Jani.

-- 
Jani Nikula, Intel
