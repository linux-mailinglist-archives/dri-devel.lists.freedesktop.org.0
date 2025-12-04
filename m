Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E1CA4F9E
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 19:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDA610E90C;
	Thu,  4 Dec 2025 18:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRajx92U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249F10E90C;
 Thu,  4 Dec 2025 18:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764873908; x=1796409908;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=k35oiKf23+7837s6yQnyuGUgREAkkaNntTJ9o0dbgDY=;
 b=PRajx92UW9tCCbPHd1ZgFX7AGF+tpCrStmpxQmN6loMkjsrk9v116w/a
 0x7HVBl3W/qjSiwjQnsKR3YtKqvn/NHLrg0ABRL8N61G8KDUBtLjMUG4h
 9he2Ld4Q1HdTz2LAUlqI7g/aZNboMv9FYHro6L8LFpXp+o8eQ+4adX08Q
 W0RHJOMnYgT0hgBE2RyrM2uOUnYEn/dMRYBF1WI5AKra7q0Ozi+MJ0EcP
 sJQIebvgmAR8IRHfXMoZAEDsB52/Y2syIoe4HTyFD9kx26octbZN/hLhr
 1hjphjOI1lwK4QBdlAteEYq+Z8DtIf449LcL41mHLHYvf7jVO0F2ffW/N Q==;
X-CSE-ConnectionGUID: qJFd1m9+TbuwIViJanlggw==
X-CSE-MsgGUID: exiVRT8ST0OxZDN5u1BrAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65902814"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="65902814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:45:08 -0800
X-CSE-ConnectionGUID: qzoExEDgRKW7SX/sxdEhxw==
X-CSE-MsgGUID: uIPduUQ/Qku2vBzbgLc6Gg==
X-ExtLoop1: 1
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.11])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 10:45:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, suraj.kandpal@intel.com, Uma
 Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>, Michel
 =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Victoria
 Brekenfeld <victoria@system76.com>, Sima <daniel@ffwll.ch>, Liviu Dudau
 <Liviu.Dudau@arm.com>
Subject: Re: [v8 00/15] Plane Color Pipeline support for Intel platforms
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251203085211.3663374-1-uma.shankar@intel.com>
Date: Thu, 04 Dec 2025 20:44:57 +0200
Message-ID: <328637065f79e8ef7e6ca0ab5a22b03887ad6b6b@intel.com>
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

On Wed, 03 Dec 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> This series intends to add support for Plane Color Management for
> Intel platforms. This is based on the design which has been agreed
> upon by the community. Series implementing the design for generic
> DRM core has been sent out by Alex Hung and Harry Wentland and is
> merged to upstream tree:
> https://patchwork.freedesktop.org/series/152970/

Thanks for the patches, pushed to topic/drm-intel-plane-color-pipeline,
and sent out the pull request [1].

BR,
Jani.


[1] https://lore.kernel.org/all/e7129c6afd6208719d2f5124da86e810505e7a7b@intel.com


-- 
Jani Nikula, Intel
