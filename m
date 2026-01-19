Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 269BBD3A9AF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF32810E445;
	Mon, 19 Jan 2026 12:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWfqgjH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1C3C10E445
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768827579; x=1800363579;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=+xwMt0mGaf+N1fXJaEggGorapo50EdwQYHtZL8qLyug=;
 b=AWfqgjH+imJ7vjHQqUws2T03wY8qx/xQiDawQAA/9XHv00IvSVZ5PFZs
 hmOu9D5yU22eK1CM4E2OIBjpr2s2iGxAjSjMLoiqUH3ktj/UbVjEf8RzM
 O38Pr9wG2TPcWekKUED//xq9M6fBVsb0jvYNY30zzclto5DDskPoslxui
 czI4Ar3FLghriautF0ta3inp4IGwcZSxuoZ689whNM1O39F5kkRYXKogY
 /Tm/GGpUq8A+3JEN3G56ddyh+0qDToAQNjuZKtTgl7JNlCk0NSDPsZ2xe
 wzoWEcizejbXoR3OERaCkIaYKka6F9vw0DtcQUHYIF5hggmkHCDCjQzQr g==;
X-CSE-ConnectionGUID: fZm5J8w5Tk2sboc/juhR6g==
X-CSE-MsgGUID: xeLeph5BTqiX68h03L5SQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="81478565"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="81478565"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:59:38 -0800
X-CSE-ConnectionGUID: WiIuE7h7RgaQSFNEiHCWGA==
X-CSE-MsgGUID: aqCxEeD3QSqx1G52fSzn4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; d="scan'208";a="243442655"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 04:59:36 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] drm/rockchip: inno-hdmi: make inno_hdmi.h header
 self-contained
In-Reply-To: <20260107152704.2290146-1-jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260107152704.2290146-1-jani.nikula@intel.com>
Date: Mon, 19 Jan 2026 14:59:33 +0200
Message-ID: <8e109e67e09b1d991105edb1ca1b61d37a9f88a7@intel.com>
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


Ping?

On Wed, 07 Jan 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> Include linux/types.h for u8.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/bridge/inno_hdmi.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/drm/bridge/inno_hdmi.h b/include/drm/bridge/inno_hdmi.h
> index 8b39655212e2..5bbcaeea94e2 100644
> --- a/include/drm/bridge/inno_hdmi.h
> +++ b/include/drm/bridge/inno_hdmi.h
> @@ -6,6 +6,8 @@
>  #ifndef __INNO_HDMI__
>  #define __INNO_HDMI__
>  
> +#include <linux/types.h>
> +
>  struct device;
>  struct drm_encoder;
>  struct drm_display_mode;

-- 
Jani Nikula, Intel
