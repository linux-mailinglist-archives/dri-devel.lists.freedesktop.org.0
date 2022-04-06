Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D504F56DA
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 09:37:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F9A10F516;
	Wed,  6 Apr 2022 07:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD92E10F516;
 Wed,  6 Apr 2022 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649230673; x=1680766673;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=TQzg629lZ5Al3lFGJDcjOJYM3c+Mn4qzy6CwJ7hMZmQ=;
 b=Go5PTMDK0buzs/9vbXScUwuxjOrdpiB3cvH2BLrMM4zHfSVy4uLDyA8R
 RDg7C9s4Y9I6B+0Jrgv8ihyEO/HWso+pvoUE+Wtm3hQWZh1Qf9MHhIAyM
 jNLHJddzNMmOw8HWZn330B7fiCGa/uaUt74FboTLE3B4mrTiJ8ySqeBe2
 kRmWuNS5Em3kQPtsdXJhJNImrA6B19XDkY0XFEWhf4Kvy/indsAM66Xk+
 4LlDGXfIIPlpMyvcmVkQic2evMES7dSa7GB/iJT300hbRmeBPJyVrNeku
 KRm0lo0LxEZ438UmlqRQltOLRtwbZ6aU6N2P9KJeN4bKkthfI0ktIJtHu Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="241562031"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="241562031"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 00:37:53 -0700
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="523817539"
Received: from aghafar1-mobl2.ger.corp.intel.com (HELO [10.213.220.12])
 ([10.213.220.12])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 00:37:50 -0700
Message-ID: <18487536-ccb2-ce68-1586-a68870f56214@linux.intel.com>
Date: Wed, 6 Apr 2022 08:37:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Fixup kerneldoc in struct
 i915_gem_context
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220405155345.3292769-1-tvrtko.ursulin@linux.intel.com>
 <YkxowQIS5SZer86X@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <YkxowQIS5SZer86X@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/04/2022 17:05, Daniel Vetter wrote:
> On Tue, Apr 05, 2022 at 04:53:45PM +0100, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Mixup in rebasing and patchwork re-runs made me push the wrong version of
>> the patch. Or I even forgot to send out the fixed version. Fix it up.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 748716041dfa ("drm/i915: Track all user contexts per client")
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> You picked the wrong sha1. Sure you're on the right tree? :-)

Yeah, my sha1 was of a fixed version of the patch which I never sent out..

> Fixes: 49bd54b390c2 ("drm/i915: Track all user contexts per client")
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks, pushed.

Regards,

Tvrtko
