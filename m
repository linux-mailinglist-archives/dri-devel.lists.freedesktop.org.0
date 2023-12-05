Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CC48058F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 16:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A9A10E56D;
	Tue,  5 Dec 2023 15:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBB510E56D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 15:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701790777; x=1733326777;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P/s8Ij2APql3LS1hwneGVYB+IntlzsbwSd5J/kTbtYM=;
 b=BgoGkzNEofXAeGho2m92/6Ofal5qNrEufZUTvSxE4l1GROAGRXYP4a1G
 +KdMQaCBrFLgAr8PVLasJQVpVggPm3EmwoMNfAzKNKNW8eff0rg1DwS93
 1MFffGXfolrVnoYlCSGvxB1GO48WSv6lga9aYSTdtg8/NIH4pOtM4xhdr
 ob6tOFZ4RoQ3fGMoFg5WUqdw4L5+UlNRRt0Byc+FKn2GWw+1Z+GCrw3D1
 pQgj7p4zl+vS6KYZv5k8hOVdxZeQ/i3d+O7UVCvbf1HX0mFCbdwCqWz/m
 X6jp5WRU/y2n+jepZmWw+Mh4eRTDZKbi+lpq17kUyN4wkMs5/vZw5uBLz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="460396633"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="460396633"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:39:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="770959769"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; d="scan'208";a="770959769"
Received: from ckochhof-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.33.179])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2023 07:39:35 -0800
Date: Tue, 5 Dec 2023 16:39:32 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Karolina Stolarek <karolina.stolarek@intel.com>
Subject: Re: [PATCH v8 0/8] Improve test coverage of TTM
Message-ID: <ZW9ENFoRHlec4HNE@ashyti-mobl2.lan>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701257386.git.karolina.stolarek@intel.com>
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
Cc: Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Karolina and Christian,

> Karolina Stolarek (8):
>   drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>   drm/ttm/tests: Add tests for ttm_tt
>   drm/ttm/tests: Add tests for ttm_bo functions
>   drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
>   drm/ttm/tests: Use an init function from the helpers lib
>   drm/ttm/tests: Test simple BO creation and validation
>   drm/ttm/tests: Add tests with mock resource managers
>   drm/ttm/tests: Add test cases dependent on fence signaling

I see that all these files (and previous patches, as well) don't
have a consistent prefix system, like kunit_ttm_*. But they all
start with ttm_*, thread_*, drm_*, etc, which makes it a bit
difficult to follow and grep through.

Can we please maintain a consistent prefix system?

I know it looks bad to come out with it after this series (and
previous work too) has been out for several months already. I
need to say my "mea culpa" as well as I've been in the review
loop, as well.

Thanks,
Andi
