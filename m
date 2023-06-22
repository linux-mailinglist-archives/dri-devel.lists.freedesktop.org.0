Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0516073A1ED
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9880810E565;
	Thu, 22 Jun 2023 13:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A322110E565;
 Thu, 22 Jun 2023 13:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687440951; x=1718976951;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vQ6rkJEF3ruEwzFBfVeGREL1m1atfFP0GWQnnVL7boo=;
 b=dr9tg9p1AcvEMELquFu4BqqflkNUAP4GEIYSHRbtERpk+RYGMHzlYUz1
 euWS7Z8xDlz42GPN+6g87V0q6Gl4eJvI6ntTuGAwCHmQj+oy0rFELqq/9
 gwppqmhB6jLzHI5W3znO4M/lTZmdySPGb0ERXap+j2jpqponpDYS6rGtS
 oF1xQdo2CHzmKXUgnX5jyZFU44WT6hJGSAjAJS+T67/3sKpH08CXT0Ni9
 t66PdTzx0NvY+0ACVNO1tG/PUayOsaHsnjoAFxIKgIb/U69FUwSljbNZH
 6HqTOlm+aXPuu5MgqQpPEe8SBWLiCFr6zG+TB8tFAXZwVpCmguENeF+iG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="390229917"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="390229917"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 06:35:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="718087254"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="718087254"
Received: from akivisil-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.96])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 06:35:47 -0700
Date: Thu, 22 Jun 2023 15:35:44 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [Intel-gfx] [PATCH] i915: avoid unused-but-set-variable warning
Message-ID: <ZJROMM5iN68XpjA7@ashyti-mobl2.lan>
References: <20230622101848.3482277-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622101848.3482277-1-arnd@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Thu, Jun 22, 2023 at 12:18:41PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The mchbar_addr variable is only used inside of an #ifdef:
> 
> drivers/gpu/drm/i915/soc/intel_gmch.c:41:6: error: variable 'mchbar_addr' set but not used [-Werror,-Wunused-but-set-variable]
> 
> Change this to an IS_ENABLED() check to let the compiler see how
> it's used and no longer warn about it.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
