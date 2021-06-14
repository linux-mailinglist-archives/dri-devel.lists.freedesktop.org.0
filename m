Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3C3A5F24
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 11:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A58989D9B;
	Mon, 14 Jun 2021 09:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DEE489C27;
 Mon, 14 Jun 2021 09:31:34 +0000 (UTC)
IronPort-SDR: amJUXEV818F+Z5TY6cf7Xh7iW/uFAdCSyTyaCGZGPz/6ppJHeEBT74mpQI7sp7RrsdWh+9ltWL
 1EiSQ8qZ64fg==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="266931959"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="266931959"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:31:33 -0700
IronPort-SDR: Xohx6h68fkP4wmSPugTaEuNENEv21i2bYk3IM2h8zULVWQrMTH8Aga8n0onO8J9oBIbjJEv5FD
 1+V/oAgXLrXw==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="403837221"
Received: from janlundk-mobl1.ger.corp.intel.com (HELO [10.249.254.32])
 ([10.249.254.32])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:31:31 -0700
Subject: Re: [PATCH] drm/i915: allow DG1 autoprobe for CONFIG_BROKEN
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210614092227.97421-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <326d55b2-d7e2-8707-e1ad-85167f125193@linux.intel.com>
Date: Mon, 14 Jun 2021 11:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614092227.97421-1-matthew.auld@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/14/21 11:22 AM, Matthew Auld wrote:
> Purely for CI so we can get some pre-merge results for DG1. This is
> especially useful for cross driver TTM changes where CI can hopefully
> catch regressions. This is similar to how we already handle the DG1
> specific uAPI, which are also hidden behind CONFIG_BROKEN.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Dave Airlie <airlied@gmail.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

+ CC: Christian König,

With this in place, I think The mock memory_region and hugepages 
selftests will be sensitive to changes in TTM on most intel platforms, 
as well as all DG1 selftests, and any passing DG1 igt tests.

/Thomas


