Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34392A897AE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D2B310E0C9;
	Tue, 15 Apr 2025 09:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LtaunLYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDE910E0C9;
 Tue, 15 Apr 2025 09:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744708510; x=1776244510;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cLJMYVTuK4TLhcHrYhobpIcIz4x8WNU5zTERdYVxmfg=;
 b=LtaunLYCWpBa/nY938PluRXH9TovfSsCfWg+cEtzSHYShikNup1U/mkx
 3xXuVVEBlkA0QPVE+R88rnMc7e8HjKtDowlf9E++iCTnXLXXzAXHurfq7
 mgjAFAcShZDYBoaPbB0SRaRfbPxx4BJk5RrYuVEBt7sczeeqZSYWWHFXs
 3qMFXlpCgQjmQmZ5AqsV4WZQa4wrVDNcxPzmuKa8XLiuRRrmXp21BjKP7
 AQpNV/3/1RttfTRb+55j0ID0P7MBpxoB4E4hbbUqyQUztMAJ7jKoowSUD
 RU9Na9vmw8lXGfgnO9XtvcpBnzTR8HTz8axjS+LrRQzDpEsNbDytIaaJe Q==;
X-CSE-ConnectionGUID: CyvRQ18rSZGr/viaqJlwEw==
X-CSE-MsgGUID: 0Tjd5zavS/qbbK3rJgWgDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46297121"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46297121"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:15:10 -0700
X-CSE-ConnectionGUID: xx1U5v9QTVCF4OUDMsEU3w==
X-CSE-MsgGUID: sdZSS8pIR7SQBj8IDMh1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="161047263"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:15:08 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Egor Vorontsov <sdoregor@sdore.me>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Egor Vorontsov <sdoregor@sdore.me>
Subject: Re: =?utf-8?Q?=E2=9C=97?= i915.CI.BAT: failure for series starting
 with [v3,1/2]
 drm/edid: Implement DisplayID Type IX & X timing blocks parsing
In-Reply-To: <7e2cb3cdcee84975a439980cb94d93eac14bae11.camel@sdore.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250214110643.506740-1-sdoregor@sdore.me>
 <173955656648.2118687.12350276607296168996@b555e5b46a47>
 <7e2cb3cdcee84975a439980cb94d93eac14bae11.camel@sdore.me>
Date: Tue, 15 Apr 2025 12:15:04 +0300
Message-ID: <87jz7lss4n.fsf@intel.com>
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

On Mon, 14 Apr 2025, Egor Vorontsov <sdoregor@sdore.me> wrote:
> The patchset seems stalled, presumably because of this CI dead end.
>
> Is there anything I can do about this issue, or did the thread just get
> lost? Some are even pinging me directly on the state of this now.

I'm sorry, totally my fault, I dropped the ball.

I resent the patches for fresh results [1], and will merge them via
drm-misc-next.

BR,
Jani.


[1] https://lore.kernel.org/r/cover.1744708239.git.jani.nikula@intel.com



-- 
Jani Nikula, Intel
