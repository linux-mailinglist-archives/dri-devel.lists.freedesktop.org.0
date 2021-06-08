Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA8839F2CF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 11:50:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3716EB91;
	Tue,  8 Jun 2021 09:50:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FBA96EB91;
 Tue,  8 Jun 2021 09:50:03 +0000 (UTC)
IronPort-SDR: pzqnwBbBI1rrb5aW8gb404Jh0t6+ty2GMiTGp8jZ8ZF0mTLHQVwW5vqWMgL+q/Sf6/ub8b2o0A
 X3/GuxM+lOZQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="192135873"
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="192135873"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:50:02 -0700
IronPort-SDR: 5p26V7VOzfpAOcgTgG/MGlF2Kd27ZSUbUNq9wxqmXst40fHV0FJcRMrKo7LVZGxxCjkN1NPPrG
 uzokEHed8kUg==
X-IronPort-AV: E=Sophos;i="5.83,257,1616482800"; d="scan'208";a="447836973"
Received: from mkayyal-mobl.ger.corp.intel.com (HELO [10.249.254.115])
 ([10.249.254.115])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2021 02:50:01 -0700
Subject: Re: [PATCH v2 6/6] drm/i915/ttm: restore min_page_size behaviour
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210608084428.142676-1-matthew.auld@intel.com>
 <20210608084428.142676-7-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <03674b49-d1a0-133f-0ad7-0c062536bac0@linux.intel.com>
Date: Tue, 8 Jun 2021 11:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608084428.142676-7-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/8/21 10:44 AM, Matthew Auld wrote:
> We now have bo->page_alignment which perfectly describes what we need if
> we have min page size restrictions for lmem. We can also drop the flag
> here, since this is the default behaviour for all objects.
>
> v2(Thomas):
>      - bo->page_alignment is in page units
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


