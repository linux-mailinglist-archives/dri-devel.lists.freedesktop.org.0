Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C587974F8F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 12:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7237210E045;
	Wed, 11 Sep 2024 10:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmPMCvBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E711110E035;
 Wed, 11 Sep 2024 10:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726050097; x=1757586097;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ybypotxL6xwRDLFzYoQz+aSH4RrX5xRB2iJEAbEekKA=;
 b=BmPMCvBqIlc/AZGcuG0jJvDkCv8AG50P5fSDb5jvFDEi0OWFOb/wmvv9
 nHXhPbt/SPnM3FUszrFZ+eAf8rpJum2LpaJU/eyC1QqzGKTEQ8Jri+S1H
 2BWyjoO7K16PjluH6hA2FgxVroLqwGwJXJkP+AnFloA2P4CBmCRlXe9S/
 bRDm1oEMWN/v++QC0fqvrtVcSTNVhjTlr4uJVbYf7+WfBh5GcDMiLNlmu
 rrQGIrX6lLiivNUxBQLitZj+f8EZVBmIawdrgJ3s7ssl0zIWfQonfSbBw
 ECW6RX0GjUL32D4NnaFrUlFo8xygvATqsO3gKeQoFqqF1JVD+7L9y6j+g w==;
X-CSE-ConnectionGUID: LbfU0yeORyKQXbbF+VeI7A==
X-CSE-MsgGUID: 3hvXvyHzTvSFHsE2HElSIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24986772"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24986772"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:21:36 -0700
X-CSE-ConnectionGUID: wZAUmiH8TCy8CYjUfZOLWA==
X-CSE-MsgGUID: /776MYdhSHyv+rpwdDzXxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="104780772"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:21:32 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/8] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
In-Reply-To: <20240911095113.GB4470@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1725962479.git.jani.nikula@intel.com>
 <f2b721e28b9ee2711d7848abf1774ecb8ce8e5e2.1725962479.git.jani.nikula@intel.com>
 <CAMuHMdWJDKO-0o9GiGzuZ=yuYpZ1myB+A00zYwNj=+6baAq3Rw@mail.gmail.com>
 <87jzfjk4vy.fsf@intel.com>
 <20240911095113.GB4470@pendragon.ideasonboard.com>
Date: Wed, 11 Sep 2024 13:21:27 +0300
Message-ID: <87bk0ujxso.fsf@intel.com>
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

On Wed, 11 Sep 2024, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Jiapeng Chong has sent a patch to drop the function, and I've reviewed
> it. See https://lore.kernel.org/r/20240619075436.86407-1-jiapeng.chong@linux.alibaba.com

Even better, thanks!

BR,
Jani.

-- 
Jani Nikula, Intel
