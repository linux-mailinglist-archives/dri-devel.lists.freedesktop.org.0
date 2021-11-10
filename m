Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEEC44BEB4
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 11:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B8C6E063;
	Wed, 10 Nov 2021 10:31:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 268126E063;
 Wed, 10 Nov 2021 10:31:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="213373282"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="213373282"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:31:08 -0800
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="642492835"
Received: from browns-mobl.ger.corp.intel.com (HELO [10.249.254.114])
 ([10.249.254.114])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 02:31:07 -0800
Message-ID: <ca6147d1-c862-b727-dca4-85dee33912b0@linux.intel.com>
Date: Wed, 10 Nov 2021 11:31:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/i915/ttm: Fix illegal addition to shrinker list
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20211110085527.1033475-1-thomas.hellstrom@linux.intel.com>
 <a58e1d8e-68f8-0a81-4c2d-4cc21aeb37e3@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <a58e1d8e-68f8-0a81-4c2d-4cc21aeb37e3@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/10/21 11:29, Matthew Auld wrote:
> On 10/11/2021 08:55, Thomas Hellström wrote:
>> There's a small window of opportunity during which the adjust_lru()
>> function can be called with a GEM refcount of zero from the TTM
>> eviction code. This results in a kernel BUG().
>>
>> Ensure that we don't attempt to modify the GEM shrinker lists unless
>> we have a GEM refcount.
>>
>> Fixes: ebd4a8ec7799 ("drm/i915/ttm: move shrinker management into 
>> adjust_lru")
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>


Thanks for reviewing, Matt.

/Thomas


