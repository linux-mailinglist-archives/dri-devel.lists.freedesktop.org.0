Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E235BA265
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 23:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BB910E2D1;
	Thu, 15 Sep 2022 21:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2400E10E2D0;
 Thu, 15 Sep 2022 21:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663277807; x=1694813807;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rxSbHByYPwiwqefBbADhr5k62/VL+kPij1lBMCsvzOw=;
 b=bM78SsX9j7WdGhuqFwDiQG+THQJcAZIKPdlc5CqIwSXDZjktJZLJ7F0b
 CkbV+sLmj39NoeNjOoAA86/d0n18pZcDAQe6n26ySrUtxrN3Ueyx5upDI
 2DowwIfsEPjmjb7LliP3wU0q2wfUBLjCTf91osuFNdRIAOUV6zYLv9mxr
 /X+YbIutWKc1tbOAdZc08/IO5Zn4q5Ru4Y0vq6L8kPTmQBcfas1hhgnQv
 7no76pUN1j9JH82mgyUanjOHYe15ee2QkMT1yRnAd458Ow0lgP8oK5QlL
 ZE8ULdMKOPmqr4MUtlFuthTwzJw0AJ6T6WX+e7hNsw5cDeHpufRYien83 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="300206353"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="300206353"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 14:36:43 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="743089175"
Received: from eramir3-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.27])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 14:36:33 -0700
Date: Thu, 15 Sep 2022 23:36:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/i915: Make GEM suspend all GTs
Message-ID: <YyOazNv6HLU945/C@alfio.lan>
References: <20220914220427.3091448-1-matthew.d.roper@intel.com>
 <20220914220427.3091448-4-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220914220427.3091448-4-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Wed, Sep 14, 2022 at 03:04:26PM -0700, Matt Roper wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Walk all GTs when suspending.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I had this as well... thanks again!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
