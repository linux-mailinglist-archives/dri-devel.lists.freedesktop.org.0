Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 793BE3B2D40
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86DD6EA3D;
	Thu, 24 Jun 2021 11:08:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A166EA3D;
 Thu, 24 Jun 2021 11:08:28 +0000 (UTC)
IronPort-SDR: yMblOyYghEMNppFGfqnsHTSbl0X2M6lJf413YBtmY39yYo78QWjcTyWW2Bv7dLC3yg0p0H21kC
 Kwb6y5Qlhtzg==
X-IronPort-AV: E=McAfee;i="6200,9189,10024"; a="194587233"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="194587233"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:08:26 -0700
IronPort-SDR: lbU37YYi5etTQfSRWoSkj+F9nZWxbAjD37TmmvbEM7wFMciNzsaL9RUlt2ZKzEgSDRrfq+V3kV
 1qigic0HaA9Q==
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="556463191"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO [10.249.254.20])
 ([10.249.254.20])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 04:08:25 -0700
Subject: Re: [PATCH v2 1/2] drm/i915: support forcing the page size with lmem
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210623141615.291391-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <9563165c-2edd-02c1-1335-efdd68e4b214@linux.intel.com>
Date: Thu, 24 Jun 2021 13:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210623141615.291391-1-matthew.auld@intel.com>
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


On 6/23/21 4:16 PM, Matthew Auld wrote:
> For some specialised objects we might need something larger than the
> regions min_page_size due to some hw restriction, and slightly more
> hairy is needing something smaller with the guarantee that such objects
> will never be inserted into any GTT, which is the case for the paging
> structures.
>
> This also fixes how we setup the BO page_alignment, if we later migrate
> the object somewhere else. For example if the placements are {SMEM,
> LMEM}, then we might get this wrong. Pushing the min_page_size behaviour
> into the manager should fix this.
>
> v2(Thomas): push the default page size behaviour into buddy_man, and let
> the user override it with the page-alignment, which looks cleaner
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

