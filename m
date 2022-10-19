Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707F9604A42
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB8510F253;
	Wed, 19 Oct 2022 15:01:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D4BD10F259;
 Wed, 19 Oct 2022 15:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666191671; x=1697727671;
 h=message-id:date:mime-version:subject:from:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=fGGm2LnnEM2Cw9PIZx8vFdtMImBJbhBLRWV4crzJ5D8=;
 b=lOW2lRe0ayWQDj0Epc/WtXM5XSg7gjQjWCfWJKRnNlMT3vDJSg5Vz+Zi
 duhKZoFAgkZaulBoLuFsJy4oAWtI9xEA3ZAHYpOBwuI3fgHwFAGR38lpb
 HMqV5jfJpLi3AVCYZNd91HgMjjk8+4rcV4LHOzgGOIzMJw+4dm/yUjlEQ
 3ISvlBptRpxRXZ6XRdKQWvVwVFMFZBWosbpfgwRDKMgAOHCbPSF5rva9H
 pAy0j/zef04a9hEVGIxNXw2nNs05P8/NNdI8HrreHFUzFWv+BRtCXzluz
 G5sAXxIHlKOolb5trGPtw+tX5NAd/xIU+JUdPOyv3HtRGSpadJG6+ZLUf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="370651982"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="370651982"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:01:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="718522872"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="718522872"
Received: from mjmcener-mobl1.amr.corp.intel.com (HELO [10.213.233.40])
 ([10.213.233.40])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 08:01:06 -0700
Message-ID: <42c62a7c-f063-ee66-c643-c5d5d55ff2cf@linux.intel.com>
Date: Wed, 19 Oct 2022 16:01:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH 0/2] Selftest fixes for 6.1
Content-Language: en-US
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org
References: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221019121007.3229024-1-tvrtko.ursulin@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/10/2022 13:10, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Warning - not much tested, mainly bypassing trybot for quick turnaround.

Please ignore - this is quite broken and problem more complicated.

Regards,

Tvrtko

> Tvrtko Ursulin (2):
>    drm/i915/selftests: Fix waiting for threads to start
>    drm/i915/selftests: Fix selftests for 6.1 kthread_stop semantics
> 
>   .../drm/i915/gem/selftests/i915_gem_context.c |   9 +-
>   drivers/gpu/drm/i915/gt/selftest_execlists.c  |  13 +-
>   drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   5 +-
>   drivers/gpu/drm/i915/i915_selftest.h          |  14 ++
>   drivers/gpu/drm/i915/selftests/i915_request.c | 136 ++++++++++++------
>   .../gpu/drm/i915/selftests/i915_selftest.c    |  18 +++
>   6 files changed, 140 insertions(+), 55 deletions(-)
> 
