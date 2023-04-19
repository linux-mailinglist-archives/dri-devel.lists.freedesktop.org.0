Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB006E8456
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 00:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754F610EB00;
	Wed, 19 Apr 2023 22:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C325110E1FC;
 Wed, 19 Apr 2023 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681941712; x=1713477712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cTSz7vKChZd26tw23pvBhFC4jxf9dRG365W+KEWVXy4=;
 b=KY6OR//AbSlQbxWUUQWHiEB04XzdZ7rvYckFfZB0q/pi6gs7QzRVE0Vt
 Yx9qBNLQ3j30/DaGk8QulAOPoFNuUUKWsrpzbIz0qCPLSCWo/yNf/epQg
 MobJS9PVX502AlnjgFqKqoTPU0F5TO8iUw4yPbtnh/M1a307Y6L/chM0k
 KSrQX9FCx+Kem2Di77lqLTBBx8H/C1gVHwytq4ItK+09WEYAHjU5y4cL8
 C6Stoa22sthdW7net6ssoqwDUOrV7AuiSN68ONv0MaV/VEXpxSiv3k1r5
 w0NyK4QDzPjroupzebyuqjdct3zN9jbYkfE3Vhs5ay17RnbPQl5MTN065 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431847276"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="431847276"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="865996323"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200"; d="scan'208";a="865996323"
Received: from mmzakhar-mobl2.ccr.corp.intel.com (HELO intel.com)
 ([10.251.213.234])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 15:01:50 -0700
Date: Thu, 20 Apr 2023 00:01:46 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 3/8] drm/i915/mtl: Add PTE encode function
Message-ID: <ZEBkyokbUZkNEZMh@ashyti-mobl2.lan>
References: <20230419211219.2574008-1-fei.yang@intel.com>
 <20230419211219.2574008-4-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419211219.2574008-4-fei.yang@intel.com>
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

> PTE encode functions are platform dependent. This patch implements
> PTE functions for MTL, and ensures the correct PTE encode function
> is used by calling pte_encode function pointer instead of the
> hardcoded gen8 version of PTE encode.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

I think nothing opened here... one comment from Nirmoy I see that
has been addressed.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Acked-by: Nirmoy Das <nirmoy.das@intel.com>

Andi
