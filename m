Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30637B9109D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 14:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A728E10E44E;
	Mon, 22 Sep 2025 12:04:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUFfhLHl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E092F10E44D;
 Mon, 22 Sep 2025 12:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758542650; x=1790078650;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CpEQla+RaHq/h9AtWdTfjtus9FxZ1QKaIdNkR5z2xQA=;
 b=IUFfhLHlb9A0Mje+IYK1AXr2YKYjHle7MpcTl/hdCmD0YwFficYsehdk
 no0h9655kp9qld1KyS5zyuElDITT7lHHovuZyCRjZYavepOuwYtU7231C
 2P5i9qlT86c2qExGik8UXI4/SQXL8SvGwMellxJPLaU90cr1hj1lEL0go
 tniJPgrPxSmXd9zUUFAioio8yb0N5FRlcWfRpTasibb5heRb+NPCzAhqI
 bCRxqsPrzwcsDRnvIlMcdqO9ZunPF3AF6b5wowOJiPQvcIy9ZjxC3drD7
 X26Dtn2JWhSNK/jfgJFy/dS7gn6RylPpYwFFBEH5+KyITblMG6KqLlhVD w==;
X-CSE-ConnectionGUID: vAXMjhhwTW+swX+iSJfIwg==
X-CSE-MsgGUID: r4Lv2u//RLGqk8IKQth5Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72227152"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="72227152"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:04:09 -0700
X-CSE-ConnectionGUID: n1b6bT6WRNCWt0rKk1Xdqw==
X-CSE-MsgGUID: iS9J6X1gT7KG974hpU863A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="200174887"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO [10.245.244.135])
 ([10.245.244.135])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 05:04:05 -0700
Message-ID: <83089cef-9981-450d-b7ab-239fb16672c5@linux.intel.com>
Date: Mon, 22 Sep 2025 14:04:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] Revert "drm/gem: Acquire references on GEM handles
 for framebuffers"
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com, mripard@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20250919155519.1104256-1-mwen@igalia.com>
 <20250919155519.1104256-3-mwen@igalia.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20250919155519.1104256-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

On 2025-09-19 17:54, Melissa Wen wrote:
> This reverts commit 5307dce878d4126e1b375587318955bd019c3741.
> 
> We've already reverted all other commits related to dma_bug handling and
> there is still something wrong with this approach that does not allow
> unloading a driver. By reverting this commit, we'd just go back ot the
> old behavior.

This is actually important to keep. i915 and xe already do this for similar reasons, so I'm glad it's enforced across all drivers.
Without this you can do this:
- CreateFB
- destroy gem object
- Have random memory being scanout.

I'd rather keep it. If amd no longer unloads, figure out why. I know there are igt tests for module load, do those work?

Best regards,
~Maarten
