Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849B74EC37
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 13:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8EF10E365;
	Tue, 11 Jul 2023 11:05:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B114C10E365;
 Tue, 11 Jul 2023 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689073542; x=1720609542;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=u4G29Csk0GISlcJVq1vZJ1qdOszOnxbulO/hys6vaGw=;
 b=PGh00Yfx53GBcM3s0kM5pbBlja767cYMyB3VMt4X5yk8LQqjtwitlptU
 B1KPx3t5sRUmAix+26e3f1ZnK9sH11h0bpRhCnxmnZRfnJ4CnTz6FGSj2
 cuzVXvzlNMNACNQQK9KdUa8MOmmcN8XRZWIg81q9NEeOoMmNNpfTCqz+i
 5gI7KhWWyWFWyumM8K75FTTsvqQHHMewDu8feqQYy25U06dmDJN4ARk5e
 UhxLSD2RLu2u63oz3eHbn3i3fcffd512prDeGSJjjqyiHsnQu8Z9cCurj
 sswu0BrpAL6VJYbB5I/HBM1cTqgtBFulQx0QmW6fwxFvHWYY3M6S7qAhk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="362052376"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="362052376"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:05:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="811152524"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; d="scan'208";a="811152524"
Received: from sneaga-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.252.52.179])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:05:11 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: John Garry <john.g.garry@oracle.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
Subject: Re: i915 build issue
In-Reply-To: <4bec2735-d501-5359-2ac1-ed0d1fca1cd1@oracle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ad2601c0-84bb-c574-3702-a83ff8faf98c@oracle.com>
 <878rbmixbn.fsf@intel.com>
 <4bec2735-d501-5359-2ac1-ed0d1fca1cd1@oracle.com>
Date: Tue, 11 Jul 2023 14:05:09 +0300
Message-ID: <87ttuahfoa.fsf@intel.com>
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

On Tue, 11 Jul 2023, John Garry <john.g.garry@oracle.com> wrote:
> On 11/07/2023 10:58, Jani Nikula wrote:
>>> I didn't notice anything on dri-devel mailing list about this.
>> I presume you're using CONFIG_WERROR=y or W=e.
>
> I'm just using whatever vanilla x86_64_defconfig gives.
>
>> 
>> See [1] and [2]. I'm undecided how we should treat this.

Seeing that the x86 defconfigs enable CONFIG_WERROR=y, we're probably
going to have to roll this back.

https://patchwork.freedesktop.org/patch/msgid/20230711110214.25093-1-jani.nikula@intel.com

BR,
Jani.


>
> Ok.
>
> Thanks,
> John
>

-- 
Jani Nikula, Intel Open Source Graphics Center
