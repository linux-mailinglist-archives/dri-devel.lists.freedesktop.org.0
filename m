Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F687BC9F7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 23:42:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503F710E06A;
	Sat,  7 Oct 2023 21:42:36 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10AE10E063;
 Sat,  7 Oct 2023 21:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696714954; x=1728250954;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=d9qN3uPPOsdnm1kO4kw9GjK6xtUcXvNflL1OINjOCiU=;
 b=oDjDtMus5WXyp8dnWICs046KAAvg/xuD8nao4ouuMAr0YOmc2jdV1ODu
 Hw0IeqpH6iJEOMv3r7S1MdhIQkygVqizooQDyNXGmyRmU/YACpS4W4iNK
 Ia4PRdiwHbKbbuKyx53+nMEENLzVzjdrM8yoecMePhett1j3e0y55ynJf
 HJv/W3huejOmKqkGBiLloq8WzAwD59eGbyy6FMgtd/B61O/XXOF6qOoNl
 PX4nNjJdgB9MZ8/GFKLDhM2EVG0H37R6zBVP3nb6c0a/iI2Z7CRxIYnKS
 koSfqHw5LAZkBM0qdiVgCwEZxlD7QkGnVb81lQ/p+LdlXT73qOQNYz/WC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="2561781"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; 
   d="scan'208";a="2561781"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2023 14:42:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10856"; a="868775632"
X-IronPort-AV: E=Sophos;i="6.03,207,1694761200"; d="scan'208";a="868775632"
Received: from ahmadsay-mobl.gar.corp.intel.com (HELO intel.com)
 ([10.215.158.178])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2023 14:42:29 -0700
Date: Sat, 7 Oct 2023 23:42:21 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Update 'recommended' version
 to 70.12.1 for DG2/ADL-S/ADL-P/MTL
Message-ID: <ZSHQvRmfoXaCN8GE@ashyti-mobl2.lan>
References: <20231006145801.161868-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006145801.161868-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

> The latest GuC has new features and new workarounds that we wish to
> enable. So let the universe know that it is useful to update their
> firmware.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

CI is green, the patch is reviewed... I took the freedom to push
it to drm-intel-gt-next... hope it's fine with you.

Thanks,
Andi
