Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 718FA70CE4D
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 00:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3A410E2DA;
	Mon, 22 May 2023 22:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AED10E2BD;
 Mon, 22 May 2023 22:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684795723; x=1716331723;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=SSf6czB7RFWymzZ8g6/n89HWSPQ/IV+AsfLozjESbMc=;
 b=Cpy1Tnjxvu4JSSHFA+TfOurakzcqXf4aSYHJFUZP2jOAwl8rhQBNL1hK
 ww/jFXq2H4PSo0W6717qUBthlGjUtDQjoeJNHRMGvNcJI7bkCRDD5UK8z
 EkzHK0PovnKCQaTwk0QKnS9ZQbfExJm0fnV3tfaOcgnX+GbNIr/NvI/RU
 uiP6doI6Ydl6RI6tUAfMKm77DqESRnZ56YJGeMyC70Y7b6hJeQY0n4miC
 I0XK0Zop0+CeeqE8/a6uqDkBcx/cepKw90Ch7WvVzg81hM8G3+yJBeMBJ
 KnlhuJ7rK61YrjdWWeJ6qNMJcZBu17a/w4U2hDHBhCF7ZfRvD4y1ytGkt Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="381305165"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="381305165"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 15:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10718"; a="681132738"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="681132738"
Received: from baumgarp-mobl3.ger.corp.intel.com (HELO intel.com)
 ([10.252.55.129])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 15:48:40 -0700
Date: Tue, 23 May 2023 00:48:38 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Record default rps threshold
 values
Message-ID: <ZGvxRmNN2bG3i9Qb@ashyti-mobl2.lan>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
 <20230522115928.588793-2-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522115928.588793-2-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

On Mon, May 22, 2023 at 12:59:26PM +0100, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Record the default values as preparation for exposing the sysfs controls.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
