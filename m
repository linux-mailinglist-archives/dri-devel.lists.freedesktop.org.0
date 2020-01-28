Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC514BC72
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2020 15:58:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C4A89DD8;
	Tue, 28 Jan 2020 14:58:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3489DD8;
 Tue, 28 Jan 2020 14:58:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Jan 2020 06:58:20 -0800
X-IronPort-AV: E=Sophos;i="5.70,374,1574150400"; d="scan'208";a="222128769"
Received: from lodierna-mobl.ger.corp.intel.com (HELO [10.252.22.225])
 ([10.252.22.225])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES256-SHA;
 28 Jan 2020 06:58:18 -0800
Subject: Re: [Intel-gfx] [PATCH 1/2] drm/i915/gem: initial conversion to new
 logging macros using coccinelle
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Wambui Karuga <wambui.karugax@gmail.com>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
 <20200122125750.9737-2-wambui.karugax@gmail.com>
 <b97de5b8-b87f-3b2d-e8bc-942fc21b266e@linux.intel.com>
 <87h80fd751.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <58651951-e9fe-6196-46b2-6859add5b12b@linux.intel.com>
Date: Tue, 28 Jan 2020 14:58:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87h80fd751.fsf@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/01/2020 13:48, Jani Nikula wrote:
> On Tue, 28 Jan 2020, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>>> -DRM_DEBUG(
>>> +drm_dbg(&T->drm,
>>
>> This changes DRM_UT_CORE to DRM_UT_DRIVER so our typical drm.debug=0xe
>> becomes much more spammy.
> 
> This is what I've instructed Wambui to do in i915. It's my mistake that
> I haven't requested this to be pointed out in the commit message.
> 
> DRM_DEBUG() and DRM_DEBUG_DRIVER() have been conflated over the
> years. The former is supposed to be for drm core code only, but drivers
> are littered with it. I'm hoping drivers are less likely to use the new
> drm_dbg_core() which maps to DRM_DEBUG(). The shorter drm_dbg() is the
> new DRM_DEBUG_DRIVER().
> 
> If you think drm.debug=0xe is too spammy now, the fix is not to abuse
> DRM_UT_CORE as a spare category.

For i915 negative impact (in terms of amount of new logging produced) is 
probably limited to CI runs. Maybe developer testing to a lesser extent. 
I think wait and see approach will be okay.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
