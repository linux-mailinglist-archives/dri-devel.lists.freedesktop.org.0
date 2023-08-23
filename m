Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EE078609F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 21:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24FC10E0D9;
	Wed, 23 Aug 2023 19:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681A010E0D9;
 Wed, 23 Aug 2023 19:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692819004; x=1724355004;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=O/K6buJTsts4lyk8qgqJ5lDMguNQN8GgLUMZdbG6uSI=;
 b=Um3dnkYYOLbwfWeUuM/Jb89eqytYe5lWVn2dtO51KgeuroaBirqwfplZ
 +nJlDXotxiPSqaASwF+362uSEQ6YKnN+BuNKUlLrjVfdIJePu8AdBVf2F
 RAN4RkMToaS4L7ZiOna6IDeQMvRKxXLhf+DiHrDsagrKIR5BKPEj1AwMh
 2IRbKmrTkq8+5pVmyMhxNcRTATrqGossKXHtEf0y1pkx1lkKZ6/75nFYb
 iUZr5iSKDiV1Y+o1sU3NhG10LHyVdXPZUM/uwf4k4rZqbg/EDsZAAfStl
 /SWdG6BeABcCc7cRCTMpz94nQHq5LGTE/PtQOi0R/8KqzAQnjMlF05UaM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="373138247"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="373138247"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="713697765"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; d="scan'208";a="713697765"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2023 12:29:59 -0700
Date: Wed, 23 Aug 2023 22:30:13 +0300
From: Imre Deak <imre.deak@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [REGRESSION] HDMI connector detection broken in 6.3 on Intel(R)
 Celeron(R) N3060 integrated graphics
Message-ID: <ZOZeRX2xZiZb61hH@ideak-desk.fi.intel.com>
References: <87v8dmr6ty.fsf@gmail.com>
 <f32b4636-969c-3b9e-6802-5991f511739e@leemhuis.info>
 <87il9l2ymf.fsf@gmail.com>
 <3df95e6d-8237-1c43-e220-a9bdb5d6e044@leemhuis.info>
 <ZNo7oXeH0JK+4GPG@ideak-desk.fi.intel.com>
 <87edk4d8qp.fsf@intel.com>
 <2xlfp5bz77tyoffqvr7orvmo45wcb7uz6nbpl7jbv6zhnqvlx3@2hxa4ltb3s3y>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2xlfp5bz77tyoffqvr7orvmo45wcb7uz6nbpl7jbv6zhnqvlx3@2hxa4ltb3s3y>
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
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 21, 2023 at 11:27:29AM +0200, Maxime Ripard wrote:
> On Tue, Aug 15, 2023 at 11:12:46AM +0300, Jani Nikula wrote:
> > On Mon, 14 Aug 2023, Imre Deak <imre.deak@intel.com> wrote:
> > > On Sun, Aug 13, 2023 at 03:41:30PM +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > Hi,
> > >
> > >> On 11.08.23 20:10, Mikhail Rudenko wrote:
> > >> > On 2023-08-11 at 08:45 +02, Thorsten Leemhuis <regressions@leemhuis.info> wrote:
> > >> >> On 10.08.23 21:33, Mikhail Rudenko wrote:
> > >> >>> The following is a copy an issue I posted to drm/i915 gitlab [1] two
> > >> >>> months ago. I repost it to the mailing lists in hope that it will help
> > >> >>> the right people pay attention to it.
> > >> >>
> > >> >> Thx for your report. Wonder why Dmitry (who authored a4e771729a51) or
> > >> >> Thomas (who committed it) it didn't look into this, but maybe the i915
> > >> >> devs didn't forward the report to them.
> > >> 
> > >> For the record: they did, and Jani mentioned already. Sorry, should have
> > >> phrased this differently.
> > >> 
> > >> >> Let's see if these mails help. Just wondering: does reverting
> > >> >> a4e771729a51 from 6.5-rc5 or drm-tip help as well?
> > >> > 
> > >> > I've redone my tests with 6.5-rc5, and here are the results:
> > >> > (1) 6.5-rc5 -> still affected
> > >> > (2) 6.5-rc5 + revert a4e771729a51 -> not affected
> > >> > (3) 6.5-rc5 + two patches [1][2] suggested on i915 gitlab by @ideak -> not affected (!)
> > >> > 
> > >> > Should we somehow tell regzbot about (3)?
> > >> 
> > >> That's good to know, thx. But the more important things are:
> > >> 
> > >> * When will those be merged? They are not yet in next yet afaics, so it
> > >> might take some time to mainline them, especially at this point of the
> > >> devel cycle. Imre, could you try to prod the right people so that these
> > >> are ideally upstreamed rather sooner than later, as they fix a regression?
> > >
> > > I think the patches ([1] and [2]) could be merged via the drm-intel-next
> > > (drm-intel-fixes) tree Cc'ing also stable. Jani, is this ok?
> > 
> > It's fine by me, but need drm-misc maintainer ack to merge [1] via
> > drm-intel.
> 
> That's fine for me

Thanks, I pushed the patches to drm-intel-next.

> Maxime


