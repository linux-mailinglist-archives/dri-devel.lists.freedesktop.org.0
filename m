Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D07D455E01
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 15:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897126E937;
	Thu, 18 Nov 2021 14:30:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DED56E91F;
 Thu, 18 Nov 2021 14:30:07 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234141529"
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; d="scan'208";a="234141529"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 06:30:07 -0800
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; d="scan'208";a="473165922"
Received: from davidmor-mobl1.ger.corp.intel.com (HELO [10.252.9.238])
 ([10.252.9.238])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 06:30:05 -0800
Message-ID: <606ba1c7-32cf-46af-e425-efec53f2b51f@intel.com>
Date: Thu, 18 Nov 2021 14:30:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 4/6] drm/i915/ttm: Correctly handle waiting for gpu
 when shrinking
Content-Language: en-GB
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20211118130230.154988-1-thomas.hellstrom@linux.intel.com>
 <20211118130230.154988-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211118130230.154988-5-thomas.hellstrom@linux.intel.com>
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

On 18/11/2021 13:02, Thomas Hellström wrote:
> With async migration, the shrinker may end up wanting to release the
> pages of an object while the migration blit is still running, since
> the GT migration code doesn't set up VMAs and the shrinker is thus
> oblivious to the fact that the GPU is still using the pages.
> 
> Add waiting for gpu in the shrinker_release_pages() op and an
> argument to that function indicating whether the shrinker expects it
> to not wait for gpu. In the latter case the shrinker_release_pages()
> op will return -EBUSY if the object is not idle.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

