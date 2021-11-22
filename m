Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7A7458AE3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 09:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45266E888;
	Mon, 22 Nov 2021 08:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CD66E885;
 Mon, 22 Nov 2021 08:52:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="234983987"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="234983987"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:52:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="739117842"
Received: from djcarton-mobl.ger.corp.intel.com (HELO [10.252.21.92])
 ([10.252.21.92])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 00:52:36 -0800
Message-ID: <e0825c0c-1db1-7043-fdd7-9a7cc96d8db9@intel.com>
Date: Mon, 22 Nov 2021 08:52:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915/ttm: Fix error code in
 i915_ttm_eviction_valuable()
Content-Language: en-GB
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20211122061438.GA2492@kili>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211122061438.GA2492@kili>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Jason Ekstrand <jason@jlekstrand.net>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, Oak Zeng <oak.zeng@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/11/2021 07:41, Dan Carpenter wrote:
> This function returns a bool type so returning -EBUSY is equivalent to
> returning true.  It should return false instead.
> 
> Fixes: 7ae034590cea ("drm/i915/ttm: add tt shmem backend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
