Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 366EE4B48EB
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9989910E49B;
	Mon, 14 Feb 2022 10:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4141810E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644833433; x=1676369433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lx+hV5yTC+6Zm6CjYhcbfB/UYfpwjtIBoJll8ctGi6k=;
 b=Fzda4SkTaex+tngI6SpAF77E/i6baNNl494cJbp7RI6BckBBuwkfZVSg
 bs1qNhD+nm/lffva8nWaSdy3UAfRkFMeeh6sNAjDUAM4JCEeWTEGa7ZR9
 Q3O9FNJVV9WYaXuRUCUrrdjPEWJYqaHru6p3jJVui31vX5YXHNI/FNkjg
 j0BNRDH8EsNhvUJPa+6lmTDcaYGvqUs8+Yg0sWAuI+lXBOJOSQgOFKabq
 tyUtmjwSUM5HKJQBhnhVAytp7UGIFpEDXO1znR4ZWe2jnOLPuiSfeXaMs
 20vJ5BAJi6wYdRT1sVKriygLLuJbk0eFeYV31gxXZ8563gaesvxk0AAhQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230023039"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="230023039"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:10:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="624098150"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 02:10:27 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nJYIV-004P8q-Jx; Mon, 14 Feb 2022 12:09:31 +0200
Date: Mon, 14 Feb 2022 12:09:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: qianfanguijin@163.com
Subject: Re: [PATCH] drivers: fbtft: Add property 'keep-bootlogo'
Message-ID: <YgoqWzZ/PYHZS9nt@smile.fi.intel.com>
References: <20220212053711.26481-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220212053711.26481-1-qianfanguijin@163.com>
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
Cc: linux-fbdev@vger.kernel.org, preid@electromag.com.au,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Feb 12, 2022 at 01:37:11PM +0800, qianfanguijin@163.com wrote:
> From: qianfan Zhao <qianfanguijin@163.com>
> 
> Keep the logo draw by bootloader

Please, Cc to fbdev maintainer. Personally I'm not sure we want this from
maintenance perspective, but I understand what you want to achieve with it.

-- 
With Best Regards,
Andy Shevchenko


