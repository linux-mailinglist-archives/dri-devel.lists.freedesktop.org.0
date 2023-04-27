Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CD6F0342
	for <lists+dri-devel@lfdr.de>; Thu, 27 Apr 2023 11:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388110EAFB;
	Thu, 27 Apr 2023 09:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DB210EAFB;
 Thu, 27 Apr 2023 09:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682587249; x=1714123249;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=foW5Xb4qJ9zn4ZrRGO+AivWveJRiHVrXe4D9oKczTBg=;
 b=h9FL/AGJ2nxAOKxC8FttYQpwPK5fBmja6Zx+R8bIRtrtrotMyIVKpwel
 pN6phltCaK5Sfx8PrrkHnVXQFPHacq+DAwSxSon+nQwIHcBAxaxO5UQ5k
 S306pHsm35ON2kKXsWl5eRwFsf7aMaQkzCV7XNbkfXw7kz5maj82QLtUE
 CiJEq/nR+pu9sidcJ8R88PlSO7BkO0bj9j4Y23glvoPXaMNC8+sDRJQ3r
 +aPdJuqR+R663mgU2hIPYtZ6qIBPSmOVk9V//glKFdpQgbz0zGAf7DzM5
 0haflsqg7pPmdBokRPgBS4GgNUTe8Dg7q1djujt3ciQPkxgfRjYAuu3Lu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="327700848"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="327700848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 02:20:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868637740"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="868637740"
Received: from hdevries-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.36.70])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 02:20:46 -0700
Date: Thu, 27 Apr 2023 11:20:43 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [Intel-gfx] [PATCH v6 2/2] drm/i915/selftest: Update the SLPC
 selftest
Message-ID: <ZEo+aw9EeKAydtmI@ashyti-mobl2.lan>
References: <20230426003942.1924347-1-vinay.belgaumkar@intel.com>
 <20230426003942.1924347-2-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426003942.1924347-2-vinay.belgaumkar@intel.com>
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

Hi Vinay,

On Tue, Apr 25, 2023 at 05:39:42PM -0700, Vinay Belgaumkar wrote:
> Use the new efficient frequency toggling interface. Also
> create a helper function to restore the frequencies after
> the test is done.
> 
> v2: Restore max freq first and then min.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
