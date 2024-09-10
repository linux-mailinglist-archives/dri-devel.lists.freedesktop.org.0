Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C82972D77
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 11:24:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B40110E73C;
	Tue, 10 Sep 2024 09:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kT++hLHB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C21810E73A;
 Tue, 10 Sep 2024 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725960278; x=1757496278;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cp4Wz4rdDumtQvwCFx0/3be/a0k5OuzS0gL4ze3Ol8o=;
 b=kT++hLHB1kN5nrtERIiXl7SF1y0G+vI2BgqjjXUxCmM2iDjOPAK0sDxR
 cDA73ocD5GzbmttJJo+BQsy1Wa4AFyGyUoMZ8HcgH1WnGawG1D1mLWKPw
 O/NOrcN35i5+gppAyoHz3WP7aP9dBFlMia4g5rLD9U8zXiQ95tpavqTNZ
 bSfvb1eaMjjNqeOUbHbzTzKEujXhGQXqOalrLGpuLGBogivXLKa+gOCTs
 fMMs8dFPDHH9f8LdoXsa4BiDVlLqD0NtAYn42MOfQRVA7N1VzAtpm/pwO
 2RpoV62ISipgKhJeCuWw+mCTjvWfoHV2QC58qYp7EsKh9F6LeQsOgrJEW Q==;
X-CSE-ConnectionGUID: NRTbHyQ+Q/qgkvnyOSf/Nw==
X-CSE-MsgGUID: kIINXep5RVqOLAXOdyvGsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24853796"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24853796"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:24:38 -0700
X-CSE-ConnectionGUID: 3yR7bSNCSQGUZ1jDbah2/w==
X-CSE-MsgGUID: i12r9PKqSkiC6dnnw8CI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="97785754"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.71])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:24:35 -0700
Date: Tue, 10 Sep 2024 11:24:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: zhanghe9702 <zhanghe9702@163.com>
Cc: andi.shyti@linux.intel.com, trivial@kernel.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/gt: Fixed an typo
Message-ID: <ZuAQUGMTa4btT-ga@ashyti-mobl2.lan>
References: <20240907092443.81661-1-zhanghe9702@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240907092443.81661-1-zhanghe9702@163.com>
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

Hi Zhanghe,

Thanks for your patch. Please next time check from
get_maintainers.pl the mailing lists that need to be included in
your patches.

In this case you should have included at least the
intel-gfx <intel-gfx@lists.freedesktop.org> and the
dri-devel <dri-devel@lists.freedesktop.org> mailing lists.

On Sat, Sep 07, 2024 at 05:24:43PM +0800, zhanghe9702 wrote:
> column header should be GPU, not CPU
> 
> Signed-off-by: zhanghe9702 <zhanghe9702@163.com>

Do you really want your name to appear as zhanghe9702? If you git
log the linux directory you will se that people normally use
the "Name Surname <email>" style. As you wish.

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 8d08b38874ef..b635aa2820d9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -431,7 +431,7 @@ static int llc_show(struct seq_file *m, void *data)
>  		max_gpu_freq /= GEN9_FREQ_SCALER;
>  	}
>  
> -	seq_puts(m, "GPU freq (MHz)\tEffective CPU freq (MHz)\tEffective Ring freq (MHz)\n");
> +	seq_puts(m, "GPU freq (MHz)\tEffective GPU freq (MHz)\tEffective Ring freq (MHz)\n");

This is correct:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
