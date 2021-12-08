Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD2A46D7B9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 17:08:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3986FD08;
	Wed,  8 Dec 2021 16:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338B66FD08;
 Wed,  8 Dec 2021 16:08:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="298652769"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="298652769"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 08:08:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="515811776"
Received: from faerberc-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.148])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 08:08:04 -0800
Date: Wed, 8 Dec 2021 18:08:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add has_64k_pages flag
Message-ID: <YbDYYGD2xszmRX3W@intel.intel>
References: <20211208141613.7251-1-ramalingam.c@intel.com>
 <20211208141613.7251-2-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208141613.7251-2-ramalingam.c@intel.com>
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ram,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

but just two notes on the patchstyle, no need to resend:

1. would be nice to have [PATCH v2...] otherwise it's difficult
   to see if I'm reading the correct version. (I don't see the
   difficulty 'git format-patch -v 2...')

> Add a new platform flag, has_64k_pages, to mark the requirement of 64K
> GTT page sizes or larger for device local memory access.
> 
> Also implies that we require or at least support the compact PT layout
> for the ppGTT when using 64K GTT pages.
> 
> v2: More explanation for the flag [Thomas]
> 
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

2. the tag part has a temporal meaning: Stuart has written the
   patch, Lucas has reviewed it and you are sending it,
   therefore, the correct order should be:

      Signed-off-by: Stuart Summers <stuart.summers@intel.com>
      Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
      Signed-off-by: Ramalingam C <ramalingam.c@intel.com>

Thanks,
Andi
