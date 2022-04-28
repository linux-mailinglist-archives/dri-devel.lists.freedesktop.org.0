Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9F513450
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 15:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE4010E6CF;
	Thu, 28 Apr 2022 13:00:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64D3410E377;
 Thu, 28 Apr 2022 13:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651150800; x=1682686800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=17VrZYR4fHqhZkQ8eseQ3vQW0/iKu+4rH9HWrkZ+Q3w=;
 b=dE89dMoQbTG5Iyvbu2HnMXQHwo/vULhcXfTIdu2Ui2ndUpHsWs2Ovq73
 buXRZOauXJaijrLhYkSFbwe0pqQoPCAbh+X64+GkuITxrj8yQjA73Vpzf
 mQWTQ/KV/i8usrc216W+2s7OurYEXa6GWMEHJltZPqEpj3Ai2I7Jx21m3
 4LoxVJhSr2quC3z6ELWoI1FkAjwMEu8KeXN4q3oUSspytCne36DLnBsGV
 nXle8BSPOJN4BZ9piqI89Ut7ney1KogzCHF/BBWpJm9Nv2SQMsfLByEGn
 i9zBKpcSGpW0EwRQ2ePaW3JM0zHzU5l+E+iXTCU5rDh3lJoKZ6VCBT/Tl Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="253662551"
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="253662551"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:59:59 -0700
X-IronPort-AV: E=Sophos;i="5.91,295,1647327600"; d="scan'208";a="581352447"
Received: from sbacanu-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.217.212])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 05:59:58 -0700
Date: Thu, 28 Apr 2022 14:59:55 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v2 1/4] drm/i915/uapi: Add kerneldoc for engine class enum
Message-ID: <YmqPy6g/dCbg2XSt@intel.intel>
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
 <20220428041926.1483683-2-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220428041926.1483683-2-matthew.d.roper@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matt,

On Wed, Apr 27, 2022 at 09:19:23PM -0700, Matt Roper wrote:
> We'll be adding a new type of engine soon.  Let's document the existing
> engine classes first to help make it clear what each type of engine is
> used for.
> 
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thank you for splitting this patch,
Andi
