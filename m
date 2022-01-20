Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E3A494B5A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 11:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C8C10E331;
	Thu, 20 Jan 2022 10:07:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755A110E317;
 Thu, 20 Jan 2022 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642673225; x=1674209225;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2H8+wSMLwf/hlVN86QTe/qiwN19RDIA9XRjPIDwNBZo=;
 b=H516ZZKQ7YC1D5aQrVcSuMlDRNIPBj7S8qAWS7ndZSW+lIOU6pAmUubA
 WDUR7UaIbKe3ZW8gHNXgk1tQtndrCdBfv5R9ma8ZHwfikPfrAM3ZP8dHP
 MlpaODH/nSTpQTubau+w5h3CuWo7SQo1bnSyhmik7Y4QzAY/jNy2N040W
 dyIGROCl9ZZrYvSD9lmemrj3EBZqGdKvMbFA5jPyIyashDEQ9UODrMZKm
 tRuO4cePyZIwlG6j9AcnR/uF68s4FNUilXZdv0BfiDA4YsbNtj18aEMom
 RQ76oKG8BIv5wZr3/M68q8s8B2CqT7hWBUtzutrc/0k22BkVaQs5lwyP3 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="245515492"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="245515492"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:07:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; d="scan'208";a="595702931"
Received: from kdevey-mobl2.ger.corp.intel.com (HELO [10.252.29.97])
 ([10.252.29.97])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 02:07:03 -0800
Message-ID: <c3ef1fe9-3e7f-6774-0db5-bbdcd5707fe8@intel.com>
Date: Thu, 20 Jan 2022 10:07:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/i915: Fix vma resource freeing
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220119174734.213552-1-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220119174734.213552-1-thomas.hellstrom@linux.intel.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2022 17:47, Thomas Hellström wrote:
> In some cases we use leftover kfree() instead of i915_vma_resource_free().
> Fix this.
> 
> Fixes: Fixes: 2f6b90da9192 ("drm/i915: Use vma resources for async unbinding")
> Reported-by: Robert Beckett <bob.beckett@collabora.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
