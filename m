Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D777BBC2
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 16:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49C410E215;
	Mon, 14 Aug 2023 14:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 410E610E215;
 Mon, 14 Aug 2023 14:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692023705; x=1723559705;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=gRZPy6mHGf74LzmsrxabP7mm6fPg22EAQVGoqIlfHfk=;
 b=hL3mIDpO3l/qMj1Gd8Ja9g8RzeGnVlATldQmdqQ8T4Qif22zE1F7Ur1c
 4Y4+OOHb1mnwQKMZ3QeS165klC4t/jmzVVvGCtv7fW4JiJ3s4zecnZCE8
 k3n0Lnzs4m3DXcKtqZLBPrPLeP9YBXl3nqzsycQFfwgNz0EndjFIj422e
 t4E4j+ZLs9yj1xufdUvTYmpzkDVtghQOqcrt4sSz/cS6R6q1qA0vSdDdP
 bElY7djYxZkQwZUod8OhaOAPAugIe4hg+OvFz+rm9J5e69fLypDMKsOKV
 NNmrbyT5NQeF3oVQmwFsUOU4U99Y2tEJO93dNPC7uERQzQ3YcClbFEvoW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="372045326"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="372045326"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:35:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="907259022"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; d="scan'208";a="907259022"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 07:35:00 -0700
Date: Mon, 14 Aug 2023 17:35:13 +0300
From: Imre Deak <imre.deak@intel.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [REGRESSION] HDMI connector detection broken in 6.3 on Intel(R)
 Celeron(R) N3060 integrated graphics
Message-ID: <ZNo7oXeH0JK+4GPG@ideak-desk.fi.intel.com>
References: <87v8dmr6ty.fsf@gmail.com>
 <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
 <87il9l2ymf.fsf@gmail.com>
 <3df95e6d-8237-1c43-e220-a9bdb5d6e044@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3df95e6d-8237-1c43-e220-a9bdb5d6e044@leemhuis.info>
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
Reply-To: imre.deak@intel.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 13, 2023 at 03:41:30PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
Hi,

> On 11.08.23 20:10, Mikhail Rudenko wrote:
> > On 2023-08-11 at 08:45 +02, Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> >> On 10.08.23 21:33, Mikhail Rudenko wrote:
> >>> The following is a copy an issue I posted to drm/i915 gitlab [1] two
> >>> months ago. I repost it to the mailing lists in hope that it will help
> >>> the right people pay attention to it.
> >>
> >> Thx for your report. Wonder why Dmitry (who authored a4e771729a51) or
> >> Thomas (who committed it) it didn't look into this, but maybe the i915
> >> devs didn't forward the report to them.
> 
> For the record: they did, and Jani mentioned already. Sorry, should have
> phrased this differently.
> 
> >> Let's see if these mails help. Just wondering: does reverting
> >> a4e771729a51 from 6.5-rc5 or drm-tip help as well?
> > 
> > I've redone my tests with 6.5-rc5, and here are the results:
> > (1) 6.5-rc5 -> still affected
> > (2) 6.5-rc5 + revert a4e771729a51 -> not affected
> > (3) 6.5-rc5 + two patches [1][2] suggested on i915 gitlab by @ideak -> not affected (!)
> > 
> > Should we somehow tell regzbot about (3)?
> 
> That's good to know, thx. But the more important things are:
> 
> * When will those be merged? They are not yet in next yet afaics, so it
> might take some time to mainline them, especially at this point of the
> devel cycle. Imre, could you try to prod the right people so that these
> are ideally upstreamed rather sooner than later, as they fix a regression?

I think the patches ([1] and [2]) could be merged via the drm-intel-next
(drm-intel-fixes) tree Cc'ing also stable. Jani, is this ok?

> * They if possible ideally should be tagged for backporting to 6.4, as
> this is a regression from the 6.3 cycle.
> 
> But yes, let's tell regzbot that fixes are available, too:
> 
> #regzbot fix: drm/i915: Fix HPD polling, reenabling the output poll work
> as needed
> 
> (for the record: that's the second of two patches apparently needed)
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> >> BTW, there was an earlier report about a problem with a4e771729a51 that
> >> afaics was never addressed, but it might be unrelated.
> >> https://lore.kernel.org/all/20230328023129.3596968-1-zhouzongmin@kylinos.cn/
> > [1] https://patchwork.freedesktop.org/patch/548590/?series=121050&rev=1
> > [2] https://patchwork.freedesktop.org/patch/548591/?series=121050&rev=1
> 
