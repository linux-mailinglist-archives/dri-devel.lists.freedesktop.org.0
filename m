Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449EE6E82CE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 22:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B5010EB0D;
	Wed, 19 Apr 2023 20:37:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC0810EAFF;
 Wed, 19 Apr 2023 20:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681936658; x=1713472658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MJNtlJbwqR8+qo05ouosF5HNTfa/H4h2E4Mb58fcB+g=;
 b=hP4Qg8G64LPhpc422bGhq1lyPo8mLajFJPt8QurH8QQIpgmkzaZ1WfmN
 TEyR9N0709gRaHdzcxwacUjSNd4GmDm+9t2qhHzj2s8QvXsAsQVwWd1NR
 s4k8AN2FIYVEnxw/n86Jyd/e/+WF+9sZP/HAXSD55phEiyeH4Zv4CTQHt
 sc5uQygUU5FALEYV9iP3h9BX+40ZzXkashCxN7USwZyS+ScG/MIqdTqNn
 xWmT8Z6TN2SwqOqlR1ec9h0v3zDazcOXHXZaqBY0p/wPRhLe1t7D9AYhI
 CbaZib1fZx6vizXQXl3dbofsSBKj5BPzdt9XM690TnMuN1laduS+cybld Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325888863"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="325888863"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="694213881"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="694213881"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 13:37:35 -0700
Date: Wed, 19 Apr 2023 22:37:32 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 0/8] drm/i915/mtl: Define MOCS and PAT tables
 for MTL
Message-ID: <ZEBRDLC4RidF6Xga@ashyti-mobl2.lan>
References: <20230419180942.2494156-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419180942.2494156-1-fei.yang@intel.com>
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

Hi Fei,

On Wed, Apr 19, 2023 at 11:09:34AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The series includes patches needed to enable MTL.
> Also add new extension for GEM_CREATE uAPI to let
> user space set cache policy for buffer objects.
> 
> v2: addressing review comments and checkpatch warnings
> 
> Fei Yang (7):
>   drm/i915/mtl: Set has_llc=0
>   drm/i915/mtl: Add PTE encode function
>   drm/i915/mtl: workaround coherency issue for Media
>   drm/i915/mtl: end support for set caching ioctl
>   drm/i915: preparation for using PAT index
>   drm/i915: use pat_index instead of cache_level
>   drm/i915: Allow user to set cache at BO creation
> 
> Madhumitha Tolakanahalli Pradeep (1):
>   drm/i915/mtl: Define MOCS and PAT tables for MTL

next time could you please add all the r-b's you got, as it's
hard to track them down?

And, could you please version your patches with format patch:

   git format-patch -v X

and also add a changelog. The changelog might be a bit annoying
but it's very useful to understand what has changed.

As a reviewer, in order to check the different versions I had to
check the date sent.

Thanks,
Andi
