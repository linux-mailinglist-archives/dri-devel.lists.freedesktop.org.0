Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2C78F543
	for <lists+dri-devel@lfdr.de>; Fri,  1 Sep 2023 00:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B944A10E6EF;
	Thu, 31 Aug 2023 22:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAAA10E6EF
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693519595; x=1725055595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bAZJEXc5TJCzp/iwjODBXhXa4EykzXuiB29HA+HYVzc=;
 b=ESGxeQ6T541Gu0161dG1am61PFHi3tj44rmupxj9jZkGPS+96h7WnNlg
 QjYustI1ZMLgcS6zk2nEB5ZRu5c6+5ObeKjljDP8hZdsLtBUG28i+FWtd
 miMZ60NsxT4I0AeqOTGcB25QCv3EedsJ24cIF8id4S5/eviR8FfK9hmtB
 oMKFeAd37qkhuiT2CfB33zyHWoJAZGEnIA58T4uRcORMp58uoHJ5kqcwm
 0HyexJxCYyFVeghviSIc2h0MD1nBKUep1X1z1yqxfb9GJSI9MWpqf8GLl
 /xpi1+EXJqTkd0FJbSMLgdMZ6u+8s3MjNTRi7f1ax+yKNC5pcayBmUM6P A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442478061"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="442478061"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 15:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="809815091"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="809815091"
Received: from tkeuter-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.216])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 15:06:32 -0700
Date: Fri, 1 Sep 2023 00:06:29 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/5] drm/debugfs: rework drm_debugfs_create_files
 implementation v2
Message-ID: <ZPEO5Us2CihBQnqz@ashyti-mobl2.lan>
References: <20230829110115.3442-1-christian.koenig@amd.com>
 <20230829110115.3442-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829110115.3442-6-christian.koenig@amd.com>
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

On Tue, Aug 29, 2023 at 01:01:15PM +0200, Christian König wrote:
> Use managed memory allocation for this. That allows us to not keep
> track of all the files any more.
> 
> v2: keep drm_debugfs_cleanup(), but rename to drm_debugfs_unregister(),
>     we still need to cleanup the symlink
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
