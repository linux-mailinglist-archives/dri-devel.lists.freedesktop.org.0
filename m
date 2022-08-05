Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B596458A84A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 10:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594918FB2E;
	Fri,  5 Aug 2022 08:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6357B0DA3;
 Fri,  5 Aug 2022 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659689226; x=1691225226;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P2RYTSUTYhGd2GktSZ+m/j6HRfqcYiYAeUxGx7xguRQ=;
 b=NAM6Ga7BMLqg823ve5Xos76+x6PEWJ6+56bjyv/I4E1yXKsqcNjBt3Ib
 gg7AJgp4p2LzlTb5H6KcZ3d8SveXJ/TIgja5zC2jwtyE9eHU5Dgz+1YBE
 DPOmNgMAPTPCvYcAf7/L++utqq8gWVAxurtB+/nxK9ftR++39QcSCceWR
 oNAQgSUD+C7lcbtlTwSD9UjrYvFvjhDrVWEksKq91EizboPfUOMiM2Cv2
 mOMHEmZX/ESAEa6VQaepoe3ukw7Wb8foJ0CISw/ukwwwayk3dDgLY1CqC
 5oBpdiUQFzegnreBK3ZMHf3XrMIu+vXgmnWrPZuJzUAbGsfWkkUXeC215 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="277076799"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="277076799"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 01:47:05 -0700
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="662909092"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO maurocar-mobl2)
 ([10.252.33.203])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 01:47:02 -0700
Date: Fri, 5 Aug 2022 10:46:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PULL] drm-intel-next-fixes
Message-ID: <20220805104642.0f0e1410@maurocar-mobl2>
In-Reply-To: <YuwC0s6khQsun32+@intel.com>
References: <YuwC0s6khQsun32+@intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: dim-tools@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo,

On Thu, 4 Aug 2022 13:33:06 -0400
Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:

> Hi Dave and Daniel,
> 
> Here goes drm-intel-next-fixes-2022-08-04:
> 
> - disable pci resize on 32-bit systems (Nirmoy)
> - don't leak the ccs state (Matt)
> - TLB invalidation fixes (Chris)
> 
> Thanks,
> Rodrigo.
> 
> The following changes since commit 2bc7ea71a73747a77e7f83bc085b0d2393235410:
> 
>   Merge tag 'topic/nouveau-misc-2022-07-27' of git://anongit.freedesktop.org/drm/drm into drm-next (2022-07-27 11:34:07 +1000)
> 
> are available in the Git repository at:
> 
>   git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-next-fixes-2022-08-04
> 
> for you to fetch changes up to e57b9369e0c6f60155027e120fafd4b57e385b71:
> 
>   drm/i915/gt: Batch TLB invalidations (2022-08-01 09:48:06 -0400)
> 
> ----------------------------------------------------------------
> - disable pci resize on 32-bit systems (Nirmoy)
> - don't leak the ccs state (Matt)
> - TLB invalidation fixes (Chris)
> 
> ----------------------------------------------------------------
> Chris Wilson (4):
>       drm/i915/gt: Ignore TLB invalidations on idle engines
>       drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
>       drm/i915/gt: Skip TLB invalidations once wedged

>       drm/i915/gt: Batch TLB invalidations
This patch actually adds a regression due to a silly mistake. 
The fix is here:

	https://patchwork.freedesktop.org/patch/496249/?series=106805&rev=4

Regards,
Mauro
