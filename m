Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71B8FA718
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 02:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9643010E286;
	Tue,  4 Jun 2024 00:40:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTr+9Tn1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C97710E17D;
 Tue,  4 Jun 2024 00:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717461643; x=1748997643;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=qK+3ZSS72HS0smR6HsQqZUVLAWf0HnI9NaHP1X3NWuo=;
 b=VTr+9Tn1ppxn43GOJG1UXKDwECQa/13JyLzqoZ85TBRHNwWM90NTDRTq
 UuaCBsEPQdbEEjtRVwm1bR86bI2y0C0M93jzlAb9ettEx4lmsFjapN9/F
 LXj3tzglXn+be86z3pAkNH9NBaD+ZLW8ttH+E/EDPCPTXDoPaaIqiQekU
 bPgbqnUna8gZoC1if5Vu/g6vvBgPkL8jBJsxnnFIXRVzReCs6UtxElUVT
 NJ6MD8/ZeElK1Dol+L4DwrvymCMnu8yi+1iJp1gO8WKKoKfTuGhXvLGBm
 JhMN/pHUcW9LgD+BjwN0iL7xX9Vy+/qgNfsiie/wzkTsnKly9oBvBrZYZ A==;
X-CSE-ConnectionGUID: 9HANDOCRTuSgxkBGKlTrfQ==
X-CSE-MsgGUID: QTzFx9B+RNWWwoieAlQjHQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="14167263"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="14167263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 17:40:41 -0700
X-CSE-ConnectionGUID: bpFkfS/kT0idItZ+EvVpxQ==
X-CSE-MsgGUID: UUu8x4eDQWq+WCAyFCjWjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41477562"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.65])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 17:40:40 -0700
Date: Tue, 4 Jun 2024 02:40:36 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "Niemiec, Krzysztof" <krzysztof.niemiec@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nirmoy.das@intel.com, janusz.krzysztofik@intel.com,
 chris.p.wilson@intel.com
Subject: Re: [PATCH] drm/i915/gt: Delete the live_hearbeat_fast selftest
Message-ID: <Zl5ihCI2WnELsjyt@ashyti-mobl2.lan>
References: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe2vu5h7v7ooxbhwpbfsypxg5mjrnt56gc3cgrqpnhgrgce334@qfrv2skxrp47>
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

Hi Krzysztof,

On Mon, Jun 03, 2024 at 06:20:22PM +0200, Niemiec, Krzysztof wrote:
> The test is trying to push the heartbeat frequency to the limit, which
> might sometimes fail. Such a failure does not provide valuable
> information, because it does not indicate that there is something
> necessarily wrong with either the driver or the hardware.
> 
> Remove the test to prevent random, unnecessary failures from appearing
> in CI.
> 
> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Niemiec, Krzysztof <krzysztof.niemiec@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
