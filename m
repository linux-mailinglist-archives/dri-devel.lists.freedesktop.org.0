Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9466C5FC6FF
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 16:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0678A10E0D4;
	Wed, 12 Oct 2022 14:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C66710E0B4;
 Wed, 12 Oct 2022 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665583573; x=1697119573;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JbZdOESyaViIhlwGEhqtaCNMJ0TpjAfSAJde6s0rCzM=;
 b=LBBw9V8XNs2BSKymlzmtQyt41Qb151LeBJ7fPBunR+a9Va+u8sS1T8C2
 tOcuGW4HY5b+wb/AD6qeVqJjIm0KQkLmpOj2iX7hCqPg4C5uVaqDcMIlD
 UTU0VzL9t9SQbAL7ZR5JOletl77bcGKX+plxwstDMn8PJKDyVqRL2Dv/m
 rwD7vzixfnaluPMIbVk7VjxzCYVwsluLcpdfzH4fVCq+RHKJGylVc7k/p
 qYPe3kMqMPpPoy6JftGqizTvEdeE0siBLPA2XKRagbgnt3W4IpdRmp0eP
 bXes/ohWzmp7VEaCuT+qmJkj0QzAC6sX3qxfeArAE9P2jpzy3UQK7IdYp Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="285181507"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="285181507"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 07:05:43 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="577838785"
X-IronPort-AV: E=Sophos;i="5.95,179,1661842800"; d="scan'208";a="577838785"
Received: from jhpuonti-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.226])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 07:05:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2] drm: split build lists one per line and sort
In-Reply-To: <20221012131043.teqj46p6dpi4opil@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20221011140830.3257655-1-jani.nikula@intel.com>
 <87k055w7bz.fsf@intel.com> <20221012131043.teqj46p6dpi4opil@houat>
Date: Wed, 12 Oct 2022 17:05:39 +0300
Message-ID: <87h709w30s.fsf@intel.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Oct 2022, Maxime Ripard <maxime@cerno.tech> wrote:
> On Wed, Oct 12, 2022 at 03:32:32PM +0300, Jani Nikula wrote:
>> On Tue, 11 Oct 2022, Jani Nikula <jani.nikula@intel.com> wrote:
>> > While it takes more vertical space, sorted build lists with one object
>> > per line are arguably easier to manage, especially when there are
>> > conflicting changes.
>> >
>> > Split anything with more than one object file.
>> >
>> > v2: also split drm_cache.o and put it after drm_bridge.o (Andi)
>> >
>> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>> 
>> Cc: drm-misc maintainers, don't really want to push this without an
>> approval from you guys.
>
> Acked-by: Maxime Ripard <maxime@cerno.tech>
>
> Thanks for doing this

Thanks, pushed to drm-misc-next.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
