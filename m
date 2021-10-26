Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AD43AFE7
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 12:17:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE006E402;
	Tue, 26 Oct 2021 10:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEFD6E402;
 Tue, 26 Oct 2021 10:17:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="230147829"
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="230147829"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 03:17:13 -0700
X-IronPort-AV: E=Sophos;i="5.87,182,1631602800"; d="scan'208";a="724059114"
Received: from fnygreen-mobl1.ger.corp.intel.com (HELO [10.249.254.182])
 ([10.249.254.182])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 03:17:12 -0700
Message-ID: <a766bdee-6d36-6988-7ddf-d8880bd49112@linux.intel.com>
Date: Tue, 26 Oct 2021 12:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/2] drm/i915/gtt: stop caching the scratch page
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, 
 Ramalingam C <ramalingam.c@intel.com>
References: <20211022164847.2632366-1-matthew.auld@intel.com>
 <20211022164847.2632366-2-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211022164847.2632366-2-matthew.auld@intel.com>
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


On 10/22/21 18:48, Matthew Auld wrote:
> Normal users shouldn't be hitting this, likely this would indicate a
> userspace bug. So don't bother caching, which should be safe now that we
> manually flush the page.
>
> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Ramalingam C <ramalingam.c@intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


