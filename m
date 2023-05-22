Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0319E70CE83
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 01:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DF210E2F3;
	Mon, 22 May 2023 23:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDB210E2F3;
 Mon, 22 May 2023 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684797006; x=1716333006;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Iw+mKtmu3YqR4FDu4CJKgFG9O81pQSIz08nsagv4Kz0=;
 b=g62EaQGIYUZ6L+ILDvFX/VfOjr+29FhXki1o0b91NiYQpjj2UQgz6/WK
 wavg+5+X27BGN1oEVd9u5vpnj1xC70NIN1d+Z1aZ5sLNEIDvcN52hCn+B
 moOyfC4xX+rKWvuHTyVANXIIevz34TwZEjm3xiFMPAPxxJli+BbjOcOzs
 zOkJ+Av1RAaSDuCuq1Ax9FJZZy5ce4AdK7qjbs5qn3yx7bUR6LOZpe+q2
 67w24u+RlJzr+XP1+UcW6iZ+IWaY65Ep10F/sOfSDBctASHSkkcSULvDO
 7MLYloquuodOKMzJV0fTBP9yxRezOe5okbXfjuPHFpIUwZWlpLXDxBiVV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="333431720"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="333431720"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 16:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="706728521"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="706728521"
Received: from baumgarp-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.129])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 16:10:04 -0700
Date: Tue, 23 May 2023 01:10:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 4/4] drm/i915: Expose RPS thresholds in sysfs
Message-ID: <ZGv2SLkhFppbch/c@ashyti-mobl2.lan>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
 <20230522115928.588793-4-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522115928.588793-4-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, May 22, 2023 at 12:59:28PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> User feedback indicates significant performance gains are possible in
> specific games with non default RPS up/down thresholds.
> 
> Expose these tunables via sysfs which will allow users to achieve best
> performance when running games and best power efficiency elsewhere.
> 
> Note this patch supports non GuC based platforms only.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> References: https://gitlab.freedesktop.org/drm/intel/-/issues/8389
> Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
