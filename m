Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 896964B221C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:37:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993BB10EA50;
	Fri, 11 Feb 2022 09:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAA210EA50;
 Fri, 11 Feb 2022 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644572258; x=1676108258;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rtynah4NFl+Ek6ZDUEiAml7VXgULiDcyGS3xe6jEGlA=;
 b=LeXfuR0IZGdgAV/3BqZ9xmjzy9IHSYY1SEeVBUvCc3yWx42dnhpE2RIX
 q7CPsO92Q6BwIGs9yCJJ1QjRZ8/rclXGrSsqsdasT6W0GyxRMcSUD1pkN
 fxNVX55+Y3K3YgH6fM7Lfnpz2YPsXl8imYkDJ07WH+RsPD6kRu2inzddH
 Jut0duOeTM7onT4INCkACyxMzStN+qzAm2chMlre0x07I6RtSnml2x1QA
 TPS5UaqoMhI3oTvDpUeqh3Hb9hw2PeMxbRzVtOmB2rpOtPocKBh/wKXYp
 /LxYIZ5Cb+37uO9id5bEc4WO7fTDYME1YCddv9parH45q8U5+gYzNjc31 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="247292921"
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="247292921"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:37:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,360,1635231600"; d="scan'208";a="774196994"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.193])
 ([10.249.254.193])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 01:37:37 -0800
Message-ID: <be0a81dc-6dcf-1617-338a-f9c6cdd8d30e@linux.intel.com>
Date: Fri, 11 Feb 2022 10:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 11/15] drm/i915/selftests: handle allocation failures
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220210121313.701004-1-matthew.auld@intel.com>
 <20220210121313.701004-12-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20220210121313.701004-12-matthew.auld@intel.com>
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
> If we have to contend with non-mappable LMEM, then we need to ensure the
> object fits within the mappable portion, like in the selftests, where we
> later try to CPU access the pages. However if it can't then we need to
> gracefully handle this, without throwing an error.
>
> Also it looks like TTM will return -ENOMEM, in ttm_bo_mem_space() after
> exhausting all possible placements.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


