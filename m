Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF6A78D3E4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 10:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8860510E0B5;
	Wed, 30 Aug 2023 08:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE4F10E0B5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693383549; x=1724919549;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DWqtZM1A9MnM7DSa2MEayYsDKJ8aVGIEHjJ3izxHpNY=;
 b=g8rsywJ+XB0ub2NWoiSzDD+b4XT8hVdQY8CMxaHvMRTcBjo5PaU1KP66
 q4oRpH+GpmE+sj5W8G6sz7hmkBUZAv/CLOMMzoKdJYcnOwR8BKH1GxNkA
 ct1toP132ESdzTvjY8kVxb+NpQCC91/xDTmTCLrLVrHJu6kRQIDyPRGJg
 Xm7pJUSb+qFj9T6vIZenoEaTN4R5SZNnTnVGRQgBe22yrOJ2NKYbo8jOO
 ox9/ZYQMJZN3zGp2UhdFo/31w9FheKYZiJo+9cZCku3Krz6tTRgXIUWDZ
 UNuTTQsrKR7uF8QTKgGSf07vnOzr7/UXNbkMjxcTXOLIpdN1IwWfZXty7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374487583"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="374487583"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 01:19:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="912698690"
X-IronPort-AV: E=Sophos;i="6.02,213,1688454000"; d="scan'208";a="912698690"
Received: from msterni-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.170])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2023 01:19:05 -0700
Date: Wed, 30 Aug 2023 10:19:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and
 accel node v2
Message-ID: <ZO77dr0tyCWY135z@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829110115.3442-2-christian.koenig@amd.com>
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
Cc: ogabbay@kernel.org, ttayar@habana.ai, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On Tue, Aug 29, 2023 at 01:01:11PM +0200, Christian König wrote:
> We want to remove per minor debugfs directories. Start by stopping
> drivers from adding anything inside of those in the mid layer callback.
> 
> v2: drop it for the accel node as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Thanks,
Andi
