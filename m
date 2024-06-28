Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA4C91C544
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 19:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D87E10ECE3;
	Fri, 28 Jun 2024 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0VLyeXv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB9510ECE3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719597509; x=1751133509;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SLMLIlIwPxeoqGSeXB0AmCzYU+PGutTsVn/dsTy+csY=;
 b=f0VLyeXvDVKvqnL+29XBXvhOmOie9b+0TN+6vXlOhRBTu8GjHnuUp0ZZ
 vwYeapiQujw1WV5g5grVU8Zi6OBP+T/ABF4jBFvBXTPwB7YBkYmRsybQi
 yjpME2GG4AbShP0wb5xS745nqOY0dj+wsJtFW/64WoJbhwe05y7LHETPA
 kzbXVk8OuajLowcMgNyyABCeEB4XrFswcVIx5yqGDQXSx70af5eI/58og
 gQjz/sP7BaJkVJv9tGhp4MUmMDEESAJRYPJWlM017oLkcBsVDObjtDAxo
 qpSB9TvHAdnRX++UuO9RJfhxyBySZDHX++syPeG4nhxUPIJzVHeOx5Um/ w==;
X-CSE-ConnectionGUID: 89+dFRncRpuArMU/qCmajw==
X-CSE-MsgGUID: 5d5uKRViTk65crVhLLgwag==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16528362"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="16528362"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 10:58:29 -0700
X-CSE-ConnectionGUID: MuGJDCC9RO6Mghn9BdfYvg==
X-CSE-MsgGUID: agBB+jtoQv2UHY75WX5/jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; d="scan'208";a="49281196"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 28 Jun 2024 10:58:26 -0700
Received: from [10.245.96.165] (mwajdecz-MOBL.ger.corp.intel.com
 [10.245.96.165])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id BB2542877F;
 Fri, 28 Jun 2024 18:58:24 +0100 (IST)
Message-ID: <712046ed-2481-4644-80d7-707bbe8b5c20@intel.com>
Date: Fri, 28 Jun 2024 19:58:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the drm
To: Mark Brown <broonie@kernel.org>, Dave Airlie <airlied@redhat.com>,
 DRI <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: buildfailureaftermergeofthedrmtree@sirena.org.uk,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <Zn7s611xnutUFxR0@sirena.org.uk>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Zn7s611xnutUFxR0@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 28.06.2024 19:03, Mark Brown wrote:
> Hi all,
> 
> After merging the drm tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c: In function 'pf_get_threshold':
> /tmp/next/build/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:1788:27: error: unused variable 'xe' [-Werror=unused-variable]
>  1788 |         struct xe_device *xe = gt_to_xe(gt);
>       |                           ^~
> cc1: all warnings being treated as errors
> 
> Caused by commit
> 
>   629df234bfe73d ("drm/xe/pf: Introduce functions to configure VF thresholds")

it must have been something else wrong, as this commit [1] does not
contain this line, it was not part of patch itself [2] and I can't find
any other commit related to this function on drm-tip

but it was noticed today and some fixup was already applied [3]

[1]
https://gitlab.freedesktop.org/drm/xe/kernel/-/commit/629df234bfe73dacb4bb0daa4bc2c14824dba159
[2] https://patchwork.freedesktop.org/patch/594015/?series=133236&rev=2
[3]
https://patchwork.freedesktop.org/patch/601248/?series=135512&rev=1#comment_1094525

> 
> I have used the tree from 20240627 instead.
