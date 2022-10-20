Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADEA606571
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F6710E1D4;
	Thu, 20 Oct 2022 16:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA6810E1D4;
 Thu, 20 Oct 2022 16:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666282253; x=1697818253;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NafoE/aekxLZKz2izBbnKlFckKIiW7xKTfoNppLuaXE=;
 b=EycXPcFyljfSIC9ctZE5CuudME26ZpqX6LPaTQW75L9UaHI7xLocVpFY
 iWpVrHlvg4lRb9PrO6DK5DfFKGxyD6WfSF7vLFK5wZgENGMdIr1GFJjm7
 9Kft96e7azGbr9eHuBa2L0xclgp5vDpPToiWwb4qPX6KDm0LDkJg7iZor
 UVoZVF+XDBuv1G6qnI4twEWpqY1PBNpgPqFddF7SOmzrTmgEbQfx03Xv9
 9yRF0+miuTBzVBqlW6gD7dg6vv67enDQxBdcNPsq3JgXN2lswOPjCCG0j
 zDcmbLTkH6cbSp039Gfl+wcmKNtZcA5jHDXU5+LYNBNNdg08vPyM8ezDi g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="306750636"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="306750636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:07:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="629906091"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; d="scan'208";a="629906091"
Received: from xhallade-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.45.249])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 09:07:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: Random submitter change in Freedesktop Patchwork
In-Reply-To: <878rlaqyc7.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <878rlaqyc7.wl-ashutosh.dixit@intel.com>
Date: Thu, 20 Oct 2022 19:07:22 +0300
Message-ID: <871qr2h41x.fsf@intel.com>
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
Cc: tomi.p.sarvela@intel.com, Petri Latvala <petri.latvala@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Oct 2022, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> The freedesktop Patchwork seems to have a "feature" where in some cases the
> submitter for a series changes randomly to a person who did not actually
> submit a version of the series.
>
> Not sure but this changed submitter seems to be a maintainer:
>
> ------------------------------------------------
> https://patchwork.freedesktop.org/series/108156/
>
> Original submission by badal.nilawar@intel.com and subsequent submissions
> by me (ashutosh.dixit@intel.com) but current submitter is
> jani.nikula@linux.intel.com.
>
> For the above series I believe the submitter changed at v7 where perhaps a
> rebuild or a retest was scheduled (not sure if Jani did it and that changed
> something) but the build failed at v7. Also note root msg-id's for v6 and
> v7 are the same.
> ------------------------------------------------
> https://patchwork.freedesktop.org/series/108091/
>
> Original submission by me (ashutosh.dixit@intel.com) but current submitter
> is rodrigo.vivi@intel.com.
>
> Similarly here submitter seems to have changed at v3 where again the build
> failed. Also note root msg-id's for v2 and v3 are the same.
> ------------------------------------------------
>
> The problem this change of submitter causes is that if the actual original
> submitter wants to schedule a retest they cannot do it using the retest
> button.

I presume it's caused by me responding with a review comment that
patchwork interpreted as a new patch in the series [1], and changed the
series submitter too.

Sorry about that. It's a known issue that I sometimes forget to work
around when replying with diffs.


BR,
Jani.


[1] https://lore.kernel.org/r/87fsfki73i.fsf@intel.com


-- 
Jani Nikula, Intel Open Source Graphics Center
