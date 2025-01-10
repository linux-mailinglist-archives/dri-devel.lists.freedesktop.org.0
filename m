Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A727A08E70
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 11:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E535110F065;
	Fri, 10 Jan 2025 10:49:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KBTIpvJo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E2F10F065;
 Fri, 10 Jan 2025 10:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736506176; x=1768042176;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SnaSAbsGFkROn6W4/INC/c7SsSto/JbQV557wm4ip3s=;
 b=KBTIpvJor2XZRzGufZdKWXp59fKCmzFmytsUroPs2XLSdVRCPlwfMJHq
 sWaBnz08JxPOdLHvqddnfs58ebBMkGUdu3y2O2D89HBKinhhkLe//uLg+
 1BYMgG5MqRMbrnqYmkezqHMfaCsgnKJBX80ODBvqrV4xmIXS65tod2lOC
 N1UxZqLu/vXSzCSO1qCd/ntTde/V6hD8LcmP8bs/jlISwqM2nt84jUDPt
 5ADQCIL++3YhiJvjgpWeFr4zxcVan4rC9kH0RmxitOksIW/jLeTgJIKIM
 XN3kRtv0+tkjQ4DB4BAELlMHKlqCSoUhFLVycOH0lSrRll2I0873h4WTj A==;
X-CSE-ConnectionGUID: c7+HwJxjQQW7J8uEUcEwHg==
X-CSE-MsgGUID: AuBoHvUKRYCd4+WqKlE8Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36012747"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36012747"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 02:49:35 -0800
X-CSE-ConnectionGUID: Wied2noTQkmsKeXxcLSpAA==
X-CSE-MsgGUID: tujqs8JnSW+sGWztNnVzxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103489544"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.15])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 02:49:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Zhenyu Wang
 <zhenyuw.linux@gmail.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, zhi.wang.linux@gmail.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: GVT-g status (was: Re: [PATCH 0/3] drm/i915/gvt: Deadcoding)
In-Reply-To: <Z4A7QDtTrU6w2Yhv@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241222002043.173080-1-linux@treblig.org>
 <Z2dcZfW8eNMnxT0v@gallifrey> <Z3uGjO36tfhQsnfp@dell-wzy>
 <Z4A7QDtTrU6w2Yhv@intel.com>
Date: Fri, 10 Jan 2025 12:49:27 +0200
Message-ID: <877c73j64o.fsf@intel.com>
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

On Thu, 09 Jan 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Mon, Jan 06, 2025 at 04:30:20PM +0900, Zhenyu Wang wrote:
>> On Sun, Dec 22, 2024 at 12:25:09AM +0000, Dr. David Alan Gilbert wrote:
>> > Note: zhenyuw@linux.intel.com's address bounces:
>> > 
>> 
>> yeah, I've left Intel so can't use that box any more, looks Rodrigo hasn't
>> queue up my address change patch yet. Rodrigo?
>
> pushed to drm-intel-next now, although I was assuming this to come
> on a gvt pull request...
>
> what about this patch here? coming in a PR or should I take this
> directly at drm-intel-next as well?

AFAICT the last gvt-next pull request was more than two years ago and
gvt-fixes slightly less than one year ago.

There's a single cleanup commit in gvt-next applied two years ago for
which there hasn't been a pull request.

The GVT github page [1] says, "This repository has been archived by the
owner on Oct 3, 2024. It is now read-only." The intel-gvt-dev mailing
list [2] appears to be mostly spam.

Seems to me something like this would be appropriate:

diff --git a/MAINTAINERS b/MAINTAINERS
index 1c3eab5d2b1a..161206fdaf05 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11557,11 +11557,10 @@ F:	drivers/gpio/gpio-tangier.h
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 M:	Zhenyu Wang <zhenyuw.linux@gmail.com>
 M:	Zhi Wang <zhi.wang.linux@gmail.com>
-L:	intel-gvt-dev@lists.freedesktop.org
 L:	intel-gfx@lists.freedesktop.org
-S:	Supported
+S:	Maintained
 W:	https://github.com/intel/gvt-linux/wiki
-T:	git https://github.com/intel/gvt-linux.git
+T:	git https://gitlab.freedesktop.org/drm/i915/kernel.git
 F:	drivers/gpu/drm/i915/gvt/
 
 INTEL HID EVENT DRIVER

But I don't think it would be far from the truth to have "S: Odd Fixes"
either. And the extreme would be to just remove the whole maintainers
entry and have it fall back to the i915 entry.

Thoughts?


BR,
Jani.


[1] https://github.com/intel/gvt-linux/
[2] https://lists.freedesktop.org/archives/intel-gvt-dev/


-- 
Jani Nikula, Intel
