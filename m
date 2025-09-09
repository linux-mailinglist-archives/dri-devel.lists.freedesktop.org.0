Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6ADB4A4AA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 10:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2032010E64E;
	Tue,  9 Sep 2025 08:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xk8U5fFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F79710E648;
 Tue,  9 Sep 2025 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757405459; x=1788941459;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Gc+AhIXf0DvCUKv/4shZpARMz/p92h4HZfyWLMrXsy4=;
 b=Xk8U5fFS4ToogRWuimKBPLgbQCHdFgVzCuN9wkVukpRTscxRv5gkPgk7
 ORsCYsPnr8z0pNEesd7mrH2L7HHieKB6aYfLidC/z33e3NDz9ReGxWCZK
 aiHmdQ1JLcfuq0crS9dw6qifM+obZ1YzUKLKJD2slEDVE4r4E+zuTdIPU
 L03wUnL3OZWwqWrFZMcbPjr1G5reAV7+xJ4wzQ+sk22cjni1kZ45bWMza
 A0mQ1s/3lPTSztGCqkCpJYHDReXK58CsYX9eRWTCftCbYAgClgsHnyB0Y
 gVMSJt1veGQ0kK17BPrSk7eJ+Z3129+aVxfzMGY9g1D/DavW3AifjOaBu g==;
X-CSE-ConnectionGUID: QjppZgq0QI2X61Zif2Y+cQ==
X-CSE-MsgGUID: mu/AkBxOQXaXiTvDbqcMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59605632"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59605632"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:10:59 -0700
X-CSE-ConnectionGUID: iQ3yNbqYStS5Kkot39ZC2A==
X-CSE-MsgGUID: baR9//ZySZCE7yqK7xhV3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="204008440"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 01:10:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com
Subject: Re: [PATCH 00/10]  Introduce drm sharpness property
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
Date: Tue, 09 Sep 2025 11:10:54 +0300
Message-ID: <fd486047085f57eaa516bd18d8266dcc4c591264@intel.com>
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

On Thu, 07 Aug 2025, Nemesa Garg <nemesa.garg@intel.com> wrote:
> Middleware MR link: https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3665
> IGT patchwork link: https://patchwork.freedesktop.org/series/130218/
>
> Continuing discussions from:  https://patchwork.freedesktop.org/series/129888/
>
> Got ack from kwin maintainer on the UAPI patch.

The Mutter part seems stuck, though.

Cc: Uma


BR,
Jani.

-- 
Jani Nikula, Intel
