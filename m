Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231219E5367
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 12:09:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7452010E397;
	Thu,  5 Dec 2024 11:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw6+BEj7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC110E38E;
 Thu,  5 Dec 2024 11:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733396964; x=1764932964;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=MIr/pkaDvrA1YiE96XmOz/7jR2d0fIhmmoqKrzF/nkI=;
 b=Pw6+BEj7hLUhWIL8VUKC6oLCu/1FnY6Z3mW8WZI8Y4mHr4o18RJ+uHLk
 uHtf7RQaZ3HC9BvmBK3QCW+C7f9/14Qt8svUG8tgjv4xdcIKZRd6pdINk
 WdOGAAeT1SF5rZ8SMjCKrpi9D1wqDXw7CedU5OSlDnki0nCXSziDX+93o
 IpOInQ0LfoKYLr5lYO2Yzz7OM/oCmv1gTYzrhixyCLlbJaNpOz1VsvCrP
 99E6kxDniruBPMrSSxlccuCHkzfWUBvSqxaekoEs/mdLMJCgB11/5MOPu
 NGp0oshFtT/3FktfqWXlVuNtRRI8PPBT9ZQJJz9JL27iLOI/8pjiW+nfP g==;
X-CSE-ConnectionGUID: DBFyteZWRMSWJbc13EVcgw==
X-CSE-MsgGUID: 5TrA8CVDR9qyTz0YGpeM+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51240259"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51240259"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:09:23 -0800
X-CSE-ConnectionGUID: rXpyDj1rQc+HUJEX9AE1hw==
X-CSE-MsgGUID: Majcwft9Q+6NwLFVcddAJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="124882256"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.27])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 03:09:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm: remove driver date
In-Reply-To: <cover.1733322525.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1733322525.git.jani.nikula@intel.com>
Date: Thu, 05 Dec 2024 13:09:18 +0200
Message-ID: <87o71q1j4x.fsf@intel.com>
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

On Wed, 04 Dec 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Resend, crunched this through more configs enabled to be sure.
>
> BR,
> Jani.
>
>
>
> Jani Nikula (3):
>   drm/xen: remove redundant initialization info print
>   accel/ivpu: remove DRIVER_DATE conditional drm_driver init
>   drm: remove driver date from struct drm_driver and all drivers

Thanks for the reviews and acks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel
