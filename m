Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AECE625657
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 10:13:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4273310E7C0;
	Fri, 11 Nov 2022 09:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9642B10E7C0;
 Fri, 11 Nov 2022 09:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668158004; x=1699694004;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=IVJlEJxcaLZjgj4B1SoJxrWJYgVgR68jgWpjx2f8kP0=;
 b=T3J+CAqi2taJsQ+BIHsNVVgkz+F90CK/Xt7WpbNuxQSfrh9xqTtrYXbB
 IuSyTXRbZBrtN/GzuKWpC2Aicf6ZGMnVFwWIlgb/LsMG2Q9IxnIPQiU8+
 wUwh3uvwTSsQ5F56fhIKTHqZ8IIbrh9uNPS6Jf4FcGq0K1uRgZXWJ6vga
 39pJDDQaAztRNxlrHBuliLhzEDzjpQ42xA4q1RSXptK+wwpo2D1udBuIq
 QIj5LQbEKTSte7kP9N9yvpYsFmYCLvj7d2QJDJqUsIoHqMF0RWuFMlUXs
 hhdT8OHXSY6adCW0Yhn1LXTdAQO0t3WOY3eISVOl57SCyoY2fPxY/WUlb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="294921497"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="294921497"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 01:13:24 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="706488000"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="706488000"
Received: from ldunne-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.15.227])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 01:13:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: coverity-bot <keescook@chromium.org>, Lyude Paul <lyude@redhat.com>
Subject: Re: Coverity: nouveau_dp_irq(): Null pointer dereferences
In-Reply-To: <202211100850.7A8DD75@keescook>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202211100850.7A8DD75@keescook>
Date: Fri, 11 Nov 2022 11:13:17 +0200
Message-ID: <87iljl6ehe.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Nathan E. Egge" <unlord@xiph.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Karol Herbst <kherbst@redhat.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
> Hello!
>
> This is an experimental semi-automated report about issues detected by
> Coverity from a scan of next-20221110 as part of the linux-next scan project:
> https://scan.coverity.com/projects/linux-next-weekly-scan
>
> You're getting this email because you were associated with the identified
> lines of code (noted below) that were touched by commits:
>
>   Mon Aug 31 19:10:08 2020 -0400
>     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")

Hi Kees, this looks like a good idea, but maybe double check the Cc list
generation? I was Cc'd on four mails today that I thought were
irrelevant to me.

Thanks,
Jani.

>
> Coverity reported the following:
>
> *** CID 1527266:  Null pointer dereferences  (REVERSE_INULL)
> drivers/gpu/drm/nouveau/nouveau_dp.c:237 in nouveau_dp_irq()
> 231     	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
> 232     	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
> 233     	struct nv50_mstm *mstm;
> 234     	u64 hpd = 0;
> 235     	int ret;
> 236
> vvv     CID 1527266:  Null pointer dereferences  (REVERSE_INULL)
> vvv     Null-checking "outp" suggests that it may be null, but it has already been dereferenced on all paths leading to the check.
> 237     	if (!outp)
> 238     		return;
> 239
> 240     	mstm = outp->dp.mstm;
> 241     	NV_DEBUG(drm, "service %s\n", connector->name);
> 242
>
> If this is a false positive, please let us know so we can mark it as
> such, or teach the Coverity rules to be smarter. If not, please make
> sure fixes get into linux-next. :) For patches fixing this, please
> include these lines (but double-check the "Fixes" first):
>
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527266 ("Null pointer dereferences")
> Fixes: a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
>
> Thanks for your attention!

-- 
Jani Nikula, Intel Open Source Graphics Center
