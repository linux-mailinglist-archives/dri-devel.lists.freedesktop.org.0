Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A18445FC202
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 10:31:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A7B10E3B7;
	Wed, 12 Oct 2022 08:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3155510E3B0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665563443; x=1697099443;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oVLqGoXvkA91qwnb3oW4149KIT1m/o/W9ceeT0oU5k0=;
 b=DkjdHVhRlgFve5GtL6UuXbV5vCRybRhQ+twT7AwGkRl5zN6j1evgsPZT
 z6TUapcvjer/7JTj518ZtGlFG1zmSvBLoTnOPBmb1il2cqv8BRXbaVOQO
 OmbpEv0SpHPUe5DAL8ET5I41cPVuOIhkVXuqIn1t2V0L/PavKdxm8gikL
 ZOZwD8cVOrd1Qyg0CiNn7xJku+Xi0UR/8J6ooL12edvNCIl07wuhJRhPX
 q4tbZwZG83LmSwZLMn8eLJpPA1m9GXUccy4vnn2wq3si45jciomS7m2IF
 rKVeHbCBhqgTP4L65VZsFbyQy/v8wlGBBZaPBqp1PpZHGchFs81elOA5C w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="331226777"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="331226777"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 01:30:42 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="695388322"
X-IronPort-AV: E=Sophos;i="5.95,178,1661842800"; d="scan'208";a="695388322"
Received: from freeb-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.24])
 by fmsmga004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2022 01:30:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: tools@linux.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: pr-tracker-bot for drm subsystem?
In-Reply-To: <87a670spdw.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87a670spdw.fsf@intel.com>
Date: Wed, 12 Oct 2022 11:30:41 +0300
Message-ID: <87pmexwij2.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Ping?

On Thu, 15 Sep 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> Hey all, I'd be interested in having the pr-tracker-bot [1] set up for
> the drm subsystem, following the dri-devel mailing list [2] and
> notifying when the pull requests have been merged to either the drm-next
> or drm-fixes branches of the main drm repository [3].
>
> What would this require in terms of the tracker bot code?
>
> Is the idea that the service could be expanded to cover subsystems
> instead of just LKML and mainline, or would all subsystems have to set
> it up for themselves with their own cron jobs on their own servers?
>
> Other considerations?
>
>
> BR,
> Jani.
>
>
> [1] https://korg.docs.kernel.org/prtracker.html
> [2] https://lists.freedesktop.org/mailman/listinfo/dri-devel
> [3] https://cgit.freedesktop.org/drm/drm/

-- 
Jani Nikula, Intel Open Source Graphics Center
