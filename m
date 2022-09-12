Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD88D5B5278
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 03:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0E810E108;
	Mon, 12 Sep 2022 01:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3219010E105;
 Mon, 12 Sep 2022 01:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662946070; x=1694482070;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Xmotxmw3nocnvBW51ZNXHo6s0m1J8j499zaBKXWXBX0=;
 b=ZqBH5gCrCU39yhoFYjaMRoc5MUx8ylTw8xReA4foLJB/0EiSl1+AhhQ2
 f6cj0lcQWPV592FLFB9srgplP7lHB3SMfFFNICzLyj7nQM5NEfY0FVWMB
 +tKQHNMCENQulmQk/ufrxsqOtNYUYn9AEtCt2JCYQlVQn5BMgEC/QSOTH
 VnPRpPpPzVkC7D/vxZvAhPqFMF6NmBpAWPSiJDffF31hpfMckV1wuemZo
 rwAHsgf+2jSWj7ycFPAvZt5cm8QnAuRUBbIKXLDGBnGCeokXiCEr/2imC
 rwPKRp1BU3iFMGtgggI1i1HU6xXb3pM1qjbRrispCriuG85Hd1J+iUys8 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="384063107"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="384063107"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 18:27:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="677897204"
Received: from dasegal-mobl.amr.corp.intel.com (HELO intel.com)
 ([10.249.46.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2022 18:27:45 -0700
Date: Mon, 12 Sep 2022 03:27:42 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 35/37] drm/i915: add descriptions for some RPM macros
 at intel_gt_pm.h
Message-ID: <Yx6LDoMBkL6IO0Gu@alfio.lan>
References: <cover.1662708705.git.mchehab@kernel.org>
 <997567dcc2b5942afde093d92d0666948e66d83a.1662708705.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <997567dcc2b5942afde093d92d0666948e66d83a.1662708705.git.mchehab@kernel.org>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, linux-doc@vger.kernel.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org, John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

[...]

> +/**
> + * intel_gt_pm_is_awake: Query whether the runtime PM is awake held
> + *
> + * @gt: pointer to the graphics engine

...

> +/**
> + * intel_gt_pm_get: grab a runtime PM reference ensuring that GT is powered up
> + * @gt: pointer to the graphics engine

...

> +/**
> + * __intel_gt_pm_get: Acquire the runtime PM reference again
> + * @gt: pointer to the graphics engine which contains the wakeref

...

> +/**
> + * intel_gt_pm_get_if_awake: Acquire the runtime PM reference if active
> + * @gt: pointer to the graphics engine which contains the PM reference

...

> +/**
> + * intel_gt_pm_put: Release the runtime PM reference
> + * @gt: pointer to the graphics engine which contains the PM reference

...

> +/**
> + * with_intel_gt_pm - get a GT reference ensuring that GT is powered up,
> + *	run some code and then put the reference away.
> + *
> + * @gt: pointer to the gt

as you can see sometimes you put that extra blank line and
sometimes not... can we please stick to one style?

Thanks,
Andi
