Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69129A766A6
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:15:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B0810E3FF;
	Mon, 31 Mar 2025 13:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bd7XmI8g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C5310E3F5;
 Mon, 31 Mar 2025 13:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743426925; x=1774962925;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hbMM/hwWPqSBlAW0N2b/T0Z9OrxUPzwkk7vf0HT68q8=;
 b=Bd7XmI8gzUSLKiZkfCqiHwkg58z+gUOw5vFFPcstgvlQhPpJSk+1V/G4
 5z9/MYQz7Vo1A8ab05fBOP8OfQcJ1xKTv0X4rDj0YmPmI8x5rymrYyuv7
 LtVCAxT6VpyRO9CePlIso0ONolDRQgPqMwsf6vR6946UTXIM5vw/jxZ90
 dYsRq2l9y2LgchMDYHr2ag6390xRpf3N1e9YENWupD0RheUQCPPysLUyq
 8upRQZLsjHZ4FZAOGilEz9PPHXxt/aRUVfFBDPz5initvSVPGdUZ3Jhur
 TPZmL8Tc1StdztU/8x22e2ing+eBeLw4LGedf1pbsBVGO6Y6WcerAkq4y w==;
X-CSE-ConnectionGUID: LXQHkeNnSDypI1M3NGkU/A==
X-CSE-MsgGUID: 0t0+cvAVQ0eLxi9uQ4qGAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54910251"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="54910251"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:15:24 -0700
X-CSE-ConnectionGUID: +6qw4c1eRuKOGeDsDrtfmA==
X-CSE-MsgGUID: qbKYyFv3RIycm3tjavKx8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="125907515"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.191])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:15:22 -0700
Date: Mon, 31 Mar 2025 15:15:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH] drm/i915/gem: Convert SPDX headers to single-line format
Message-ID: <Z-qVZzxzM6YmRyKQ@ashyti-mobl2.lan>
References: <20250327232629.2939-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327232629.2939-1-andi.shyti@linux.intel.com>
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

Hi,

On Fri, Mar 28, 2025 at 12:26:29AM +0100, Andi Shyti wrote:
> Replace multi-line SPDX license headers with single-line
> equivalents (// SPDX-License-Identifier: MIT or /* ... */ for
> headers), as preferred by current kernel coding style.
> 
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

merged to drm-intel-gt-next.

Andi
