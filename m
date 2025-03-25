Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1652A6EE3D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 11:53:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB98010E3A0;
	Tue, 25 Mar 2025 10:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+eNs7zh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DF010E395;
 Tue, 25 Mar 2025 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742899985; x=1774435985;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VFFYzYQU3f6H+Y3MVYCLuwga76YvydQ6beONiwv9+0Q=;
 b=T+eNs7zhWe1LkREB2kOuNcjOEmI+uG7KxIokcp6F24aIPNKoIBTV/7PE
 VUTHzLa33ugCGo2Yf8n2F5TT/MzdgVkDjTQrZSYj97zj2O5EVMVCKtUtr
 0Fr91Jm1nMcF8lzAvBlYKgl+SJi64ipnnenC8y3341RuWAHJKAiOKukqa
 Q2Br8R3yKh4iewhLE9cvpXI/UzGvRT9/nDLGguU6fXSKzeaMxWAo4VOI2
 eY4WoBh+724FGGeciywjBoVfYpN/Zxqj49YCWlB+z2vlLoyEDBKPt9CMG
 8DAjXd4w2NRkXMiNoEAiAQWOteuNFwAlifT7VDvRcD06Mwa6WZfNFcsIg Q==;
X-CSE-ConnectionGUID: SK9Y/JNLTd+fK5RDa/aC9g==
X-CSE-MsgGUID: /4z3B4/OStyT7cZZdXKdRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44295648"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="44295648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:53:05 -0700
X-CSE-ConnectionGUID: khSp4csVQlWRDhZDC5oghw==
X-CSE-MsgGUID: kfZ1hBaNTzmSW7f7rcXpIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="161549426"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 03:53:01 -0700
Date: Tue, 25 Mar 2025 11:52:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Usharani Ayyalasomayajula <usharani.ayyalasomayajula@intel.com>
Subject: Re: [PATCH v4 00/15] CCS static load balance
Message-ID: <Z-KLCnjl3vjHAZAL@ashyti-mobl2.lan>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
 <174289108243.28532.3277935060267794468@jlahtine-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174289108243.28532.3277935060267794468@jlahtine-mobl>
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

Hi Joonas,

thanks a lot for your reply!

On Tue, Mar 25, 2025 at 10:24:42AM +0200, Joonas Lahtinen wrote:
> Quoting Andi Shyti (2025-03-24 15:29:36)
> > Back in v3, this patch series was turned down due to community
> > policies regarding i915 GEM development. Since then, I have
> > received several requests from userspace developers, which I
> > initially declined in order to respect those policies.
> > 
> > However, with the latest request from UMD users, I decided to
> > give this series another chance. I believe that when a feature
> > is genuinely needed, our goal should be to support it, not to
> > dismiss user and customer needs blindly.
> 
> We had plenty of community bug reports when the move to fixed CCS mode
> was initially implemented with some bugs.
> 
> After those bugs were fixed, nobody was reporting impactful performance
> regressions.
> 
> Do you have a reference to some GitLab issues or maybe some external
> project issues where regressions around here are discussed?

AFAIK, there's no GitLab issue for this because we're not fixing
a bug here; we're adding a new sysfs interface.

All known issues and reports related to CCS load balancing have
already been addressed.

What we're still missing is a way for compute applications to
tweak CCS load balancing settings. I already shared the link [1],
but if you take a look at that code, you'll find
'execution_environment_drm.cpp' [2], where the new interface is
used.

If you're feeling lazy, I can point out the relevant parts,
otherwise, feel free to skip to the final greetings :-)

In 'void ExecutionEnvironment::configureCcsMode()', the app sets
up the path like this:

    const std::string drmPath = "/sys/class/drm";
    const std::string expectedFilePrefix = drmPath + "/card";

    ...

    auto gtFiles = Directory::getFiles(gtPath.c_str());
    auto expectedGtFilePrefix = gtPath + "/gt";

    ...

    std::string ccsFile = gtFile + "/ccs_mode";

Then it writes the desired CCS mode value:

    uint32_t ccsValue = 0;
    ssize_t ret = SysCalls::read(fd, &ccsValue, sizeof(uint32_t));

    ...

    do {
        ret = SysCalls::write(fd, &ccsMode, sizeof(uint32_t));
    } while (ret == -1 && errno == -EBUSY);

Arshad and Usha can definitely help if there are any technical
questions about how the application uses the interface.

Usha, would you please be able to share your use case?

Thanks,
Andi

[1] https://github.com/intel/compute-runtime
[2] https://github.com/intel/compute-runtime/blob/master/shared/source/execution_environment/execution_environment_drm.cpp
