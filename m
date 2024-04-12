Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1C8A26CA
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 08:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12CA10F492;
	Fri, 12 Apr 2024 06:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bW7l+kFf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EF8C10F492;
 Fri, 12 Apr 2024 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712904083; x=1744440083;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=nnftp3y20mnefQs/zA7rIGucHoCz77k4ThTY/2DnxXQ=;
 b=bW7l+kFfeiHCpO+f9v+ewoVM3v62jEy4R3osoWCw50fgFhS4TOsf3HRt
 gpSOqPccH0+k4HQ3Hz5h8PFY509kPQUNMYq9PFlhnyRndrWDTOMc4Uk1H
 XVuPFePk7MKGiu7F2Fy00qLcLHml2pfUHzMr5qxEnevPThSEHedcxajzR
 cMaWXH90l9VXt0Wr+z/5myxslo+DVqHhiVktucxLurFOaUgQsYQrWbUtx
 gtT3S1JAJKF/DJLwUgUHOb9UIzjTy1IQaqqUjXmoOFwiARPd5hiJpAb+8
 4UtEs75pl7Baik2IoO1Feec8gzN2J/MOvnaIgetZlsPhUoSzRyR4dlZkl g==;
X-CSE-ConnectionGUID: LY5O3jp5TM+EPtrR2nfP9A==
X-CSE-MsgGUID: 27vK3mYsQVGKcuymgYWHwg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19059685"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19059685"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 23:41:22 -0700
X-CSE-ConnectionGUID: gXMdnuYmRRqCKEW6OOQMYA==
X-CSE-MsgGUID: D1rZkMzDT4yyHA2nqy/ldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21056020"
Received: from gjantea-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.121])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 23:41:15 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thorsten Blum <thorsten.blum@toblux.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 speakup@linux-speakup.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-wireless@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-afs@lists.infradead.org, ecryptfs@vger.kernel.org,
 netfs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-unionfs@vger.kernel.org, linux-arch@vger.kernel.org,
 io-uring@vger.kernel.org, cocci@inria.fr, linux-perf-users@vger.kernel.org
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
In-Reply-To: <193B959E-60A3-499A-BFF3-EA7B2D0B6C12@toblux.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
 <0bd7ccc2-4d8c-455b-a6c2-972ebe1fcb08@moroto.mountain>
 <193B959E-60A3-499A-BFF3-EA7B2D0B6C12@toblux.com>
Date: Fri, 12 Apr 2024 09:41:10 +0300
Message-ID: <87y19j3wxl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Apr 2024, Thorsten Blum <thorsten.blum@toblux.com> wrote:
> On 11. Apr 2024, at 17:25, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>> 
>> It's tricky to know which tree a patch like this would go through.
>
> The patch is based on the mainline tree. Should I have sent it directly to
> Linus then?
>
> I'm relatively new here and therefore only sent it to the corresponding mailing
> lists.

It's not just about mailing lists, it's also about changes flowing in to
mainline via a plethora of subsystem and driver repos and branches. See
MAINTAINERS. Or this old LWN page [1]. The development happens in those
branches, and if you make treewide changes like this, it's not clear who
should take it, and you also risk unnecessary conflicts if those places
get modified in the individual branches. So it might just be easiest to
split this up to smaller patches sent to the appropriate lists.

Anyway, all that said,

Acked-by: Jani Nikula <jani.nikula@intel.com>

on the i915 changes here.


BR,
Jani.


[1] https://lwn.net/Articles/737094/

-- 
Jani Nikula, Intel
