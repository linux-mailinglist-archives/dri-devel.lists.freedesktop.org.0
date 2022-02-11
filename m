Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACDD4B21AF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE49310E537;
	Fri, 11 Feb 2022 09:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B603A10EA52;
 Fri, 11 Feb 2022 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644571434; x=1676107434;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bt1LyGIMeb9CQgL0MIPsLAJ52xj6IRwZaZwga1Roxys=;
 b=OXePp4tZ9ALfOX+9rQMSqoB3dpTvtyWnJBF1CqNhPW9CUZBAjBlUOe4R
 ppj8aynpaAREEKG/OIidU2IaUHmkyfW9/o3HPsOGdWMgoIqknKU1ohu/z
 5k2kQ+n0xPpabOjO06Xkl1mQKLxAv8Dy0sFT5nqCVeJ+8x1I3xDMYBMXj
 /jviCSJmfFsbp5hmwU2EdOmxFykkzQLEpkpZHyj4ljDQsu7ErXo4i7cY1
 /sRDpygF+KGMLjE+ZAhZN9yDyeC8WXXeoib0oPafdGeLKEQPLHab0qiPc
 6FBw476C7wpstzGVkQh+Dlfqi2ROlSfqODJU4QbyckO64Q1q5iNS4ImBn A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="248530618"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="248530618"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:23:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774191455"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:23:35 -0800
Message-ID: <3e964cee-df79-1349-787a-9ddeba75c85a@linux.intel.com>
Date: Fri, 11 Feb 2022 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 03/15] drm/i915: add I915_BO_ALLOC_GPU_ONLY
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-4-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220210121313.701004-4-matthew.auld@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 2/10/22 13:13, Matthew Auld wrote:
> If the user doesn't require CPU access for the buffer, then
> ALLOC_GPU_ONLY should be used, in order to prioritise allocating in the
> non-mappable portion of LMEM, on devices with small BAR.
>
> v2(Thomas):
>    - The BO_ALLOC_TOPDOWN naming here is poor, since this is pure lies on
>      systems that don't even have small BAR. A better name is GPU_ONLY,
>      which is accurate regardless of the configuration.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


