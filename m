Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A28AC6614
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 11:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E580910E185;
	Wed, 28 May 2025 09:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gu3XtXWI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3774710E5C4
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 09:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748424933; x=1779960933;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Tc3OsSurpH1z0gI4HzRiSDSFs/zdI+P7OXdjEkrhJJA=;
 b=Gu3XtXWIpAFG3hExvEFL/0gRBXZmaTVKjGLiYQ0n4NF1Q32i69sp7kOd
 lGo4YihAxeRqV6jq1Apet3EhYqJQwbZwXR16g+w8U0fiB+GSEP08nCcN4
 JC+XcmY+RpIJqZdIbZLzCgQKNXuC/85wgx9tSG4eYxw07fzPiqEAEa0pI
 Cm00P4xwsN+7JpWyWIfLv+JohBHn38tfxF3d5GOMMAQXiwGB0wNf19NBy
 CWXfgaCc/P+iNEDi6GC4FYw3eDNgIzPcxEdPaGBpDmQoQen7ZJD649jH0
 TiWHxg4eJMxpDlHRa+ZKKSQmTlVK7qzrk3zqlupS7LzY0vZCFuOCD03fR g==;
X-CSE-ConnectionGUID: AkFZb9wVSqapyjSz6YsUOQ==
X-CSE-MsgGUID: vEIUPkjhTJ+kP7kTtypwBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="72976081"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="72976081"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:35:32 -0700
X-CSE-ConnectionGUID: XS4TX1aOSFq76kElmSZ4pg==
X-CSE-MsgGUID: WiBiIuMNRiyKaiuvGN+x1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="180423109"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.23])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 02:35:30 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: [git pull] drm for 6.16-rc1
In-Reply-To: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyv4CODKMbTW0Xwx4xYWgKPA0rMgThLgCy8OkF-DvVTNg@mail.gmail.com>
Date: Wed, 28 May 2025 12:35:27 +0300
Message-ID: <7aff9a7076ada15146d4fe60d2c6cd9d99370385@intel.com>
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

On Wed, 28 May 2025, Dave Airlie <airlied@gmail.com> wrote:
> The disgusting turds removal patchset is also in here.

I don't think it is. At least I didn't merge it. The existing thing just
still depends on BROKEN.

I had a few attempts at fixing it, Linus was okay with the patches,
Masahiro was not, and that was that. I don't think it's possible to meet
Linus' requirements of genericity without touching kbuild makefiles, and
Masahiro apparently doesn't want it in kbuild.

I still think what we want to do is reasonable. I'm not looking to
impose any header checks on anyone outside of drm, and not even on all
of drm. But I can't hide it inside drm makefiles. I don't know where to
go from here.


BR,
Jani.

-- 
Jani Nikula, Intel
