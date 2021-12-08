Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592A46D7C1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 17:09:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8016FFDD;
	Wed,  8 Dec 2021 16:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D91F6FF22;
 Wed,  8 Dec 2021 16:09:09 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10192"; a="237665885"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="237665885"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 08:09:08 -0800
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; d="scan'208";a="503099045"
Received: from faerberc-mobl2.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.148])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2021 08:09:05 -0800
Date: Wed, 8 Dec 2021 18:09:02 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915/xehpsdv: set min page-size to 64K
Message-ID: <YbDYnok7SrpoYE8U@intel.intel>
References: <20211208141613.7251-1-ramalingam.c@intel.com>
 <20211208141613.7251-3-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208141613.7251-3-ramalingam.c@intel.com>
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
Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ram,

On Wed, Dec 08, 2021 at 07:46:11PM +0530, Ramalingam C wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> LMEM should be allocated at 64K granularity, since 4K page support will
> eventually be dropped for LMEM when using the PPGTT.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Reviewed-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
