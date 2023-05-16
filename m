Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7E1704B3F
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 12:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92DB410E341;
	Tue, 16 May 2023 10:59:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF85610E341
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 10:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684234779; x=1715770779;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MsV9UF0y2LGd+y9vUe5UzkGAxsqbpwKZg3R8pBhdO9Q=;
 b=kIkGRHsjS+kpjowAJlE/BuStIXQASjQwltmZGaTy8vEb3VA8+jegn1mE
 NjMhlwQjefp/umgreczSq6ogL1zEz8jFzZ9J4kQdUhmprIpfzA4F4XT5s
 jX3uR2vs0woWdpTbMySTOHyL7GDKq/yJm0J4KusLNXxJaJgP9qPkeiKuD
 8YoWkDDnFjLxNicu77vcXVe2SgS3PpIFygInnxe0nzM0ygHAPgD/1AMjy
 ckC/Aq859exisQVUMhZLrpqLfmzjuqvzgLmnH1BD+dJUfJvU7hxVRV4o+
 zWWw9KgbH6ojbyRmI4fa2e6+GR1hprGuvifP9pdiyj17zADbkn9azGuOy w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="353725698"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="353725698"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="651803000"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; d="scan'208";a="651803000"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2023 03:59:31 -0700
Date: Tue, 16 May 2023 12:59:29 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/5] drm/debugfs: drop debugfs_init() for the render and
 accel node v2
Message-ID: <20230516105929.GA492258@linux.intel.com>
References: <20230424123028.25986-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424123028.25986-1-christian.koenig@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 02:30:24PM +0200, Christian König wrote:
> We want to remove per minor debugfs directories. Start by stopping
> drivers from adding anything inside of those in the mid layer callback.
> 
> v2: drop it for the accel node as well
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

I tested with accel and ivpu driver.

I believe main concern of prevent access before registering
is already solved. Any plans to apply this ? 

Regards
Stanislaw

