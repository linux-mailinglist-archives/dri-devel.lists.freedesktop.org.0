Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71334B21CC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:26:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372C710EA4E;
	Fri, 11 Feb 2022 09:26:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E7C10EA4E;
 Fri, 11 Feb 2022 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644571560; x=1676107560;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7wxD3XmbHKQZfcL4wsezG0ejXP4itSAtokCCThNLueo=;
 b=iAfm9fYsXXxD4Ku/ZKQvMVhX1R7B759sMSDyXTouR8GidfIt//o1V4IV
 LR95kxMe9kpRC+uM/wpMLBkwLESntwxiqjB8IgfaErn57m2DDsPlqoUU0
 mwOF+01SvKQk22HlWcF9W4FyiSfQ6tJW6fD+0f8TpLGSOkZcVuWS0b3M8
 /wjkz8/RtwRR3Tzhp8Qhiijk9kOIjDgi89o9HHox9CuNUq/x43mZYYjn+
 5FFhm4NEM96MfE8RIANKVGBljSm9qKZUyMWkx42iRMOG4+dq669a88Uym
 NGaGJ8f34BAAFIJsTB0XaHrHobp0a1yGoUh5WmFJhlMtnyxIajuU4Dfn2 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247291207"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="247291207"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:26:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774192354"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:25:58 -0800
Message-ID: <ddeff2de-a804-0e2e-2fac-f2076fba4f36@linux.intel.com>
Date: Fri, 11 Feb 2022 10:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 04/15] drm/i915/buddy: track available visible size
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220210121313.701004-5-matthew.auld@intel.com>
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
> Track the total amount of available visible memory, and also track
> per-resource the amount of used visible memory. For now this is useful
> for our debug output, and deciding if it is even worth calling into the
> buddy allocator. In the future tracking the per-resource visible usage
> will be useful for when deciding if we should attempt to evict certain
> buffers.
>
> v2:
>   - s/place->lpfn/lpfn/, that way we can avoid scanning the list if the
>     entire range is already mappable.
>   - Move the end declaration inside the if block(Thomas).
>   - Make sure to also account for reserved memory.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


