Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05464603482
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 23:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ABA10E65D;
	Tue, 18 Oct 2022 21:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F093710E65D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Oct 2022 21:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666126801; x=1697662801;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MS5lqiyFkEj1JG8vGEUKYvL2cybacH/31OMfg56fb5U=;
 b=i5RD/kYLKp1Zjo1y19t7Grfq6nR9mxVPKNVFKYjzxP66gk2ZORPLuAVh
 38mbLlV8SLqPkiwO4bSIHcOzc3bsTWMz/KURu9njRoPngj1YSW7Agqwuv
 CG+hTLJDYeYWMhYfSIs4GzLivkg6SJTdoMGBQqNFECGYC4+OWGBcS0srA
 84c8QPhH7CbdbqPsWBIv4LJYb7UCRGxYttJpYFy0C6wBmzPJoOjXnEHmM
 RudjN7teXLCEY6hW8dE1HL4JEMCWow4Ij0H5NM9ibo/h1jLxQI6JMEFOt
 4bfmhZxQM0bQOxm57k4bk0eyFEf5QeO43L2OUKOztm1kTpeafA9pTu9ll Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307921508"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="307921508"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 14:00:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="623806532"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="623806532"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga007.jf.intel.com with ESMTP; 18 Oct 2022 13:59:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oktgs-009YQH-0g; Tue, 18 Oct 2022 23:59:58 +0300
Date: Tue, 18 Oct 2022 23:59:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zack Rusin <zackr@vmware.com>
Subject: Re: [PATCH v2] drm: Remove drm_mode_config::fb_base
Message-ID: <Y08TzSjcjH60y/h2@smile.fi.intel.com>
References: <20221018131754.351957-1-zack@kde.org>
 <20221018161201.365897-1-zack@kde.org>
 <Y08KoKYEd4fzE6wc@smile.fi.intel.com>
 <682C6980-00CA-4A86-A9FB-859FF9B3AE1E@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <682C6980-00CA-4A86-A9FB-859FF9B3AE1E@vmware.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 08:26:17PM +0000, Zack Rusin wrote:
> > On Oct 18, 2022, at 4:20 PM, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Oct 18, 2022 at 12:11:51PM -0400, Zack Rusin wrote:
> >> From: Zack Rusin <zackr@vmware.com>
> >> 
> >> v2: Thomas and Laurent noticed that in radeon_fb.c I forgot to set the
> >> info->apertures->ranges[0].base and Laurent noticed a neat little cleanup
> >> in the hisilicon driver as a result of the drm_mode_config::fb_base
> >> removal.
> > 
> > You need to address LKP comment.
> 
> That came after v3, and I fixed it in the meantime. I will wait with sending
> v4 until tomorrow to make sure I give everyone time to look at in case
> there’s something else.

Hmm... Am I missing v3? I answer to v2 and LKP complaint against v1.

-- 
With Best Regards,
Andy Shevchenko


