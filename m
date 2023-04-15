Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28CC6E33A7
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 22:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15AA10E220;
	Sat, 15 Apr 2023 20:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B121010E220;
 Sat, 15 Apr 2023 20:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681592042; x=1713128042;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5+M2slWUmfm/I6vbhYZR2/db23/MJ6ovoNIIbsj965k=;
 b=TLzdrhXAiaIRqK2TO/lIHBqZGi4bBqoUzi0/m3sRI6M/s34dz8DNorEJ
 p9QwunYyg1IjqX326SM/FyW9dspqY8WyG1olaTl0DsVM0TjsZH7AVAf56
 BVF7brUYkG5+GFooHWz6KkefhM9GHC1RtoIo+vF0A6qrsznEkE9yAOLkU
 ticinZUaORUWC8GAFdd7EPrteYRtLF6iEubiuiuxUBZICDwgW9qxVUzjC
 Y2mJk1Tq6gPAiWt200A95P+BS9e+kBekYy3TCPG5Jamfn4aaaxUt4AzRw
 tr3r4uE3RJIT1zvUoaqdIr6a6TNKHBFc6DkOwurIgAN9aFUfE+UReA868 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="333467625"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; d="scan'208";a="333467625"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2023 13:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10681"; a="720692335"
X-IronPort-AV: E=Sophos;i="5.99,200,1677571200"; d="scan'208";a="720692335"
Received: from akhursev-mobl1.ccr.corp.intel.com (HELO intel.com)
 ([10.252.46.153])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2023 13:53:58 -0700
Date: Sat, 15 Apr 2023 22:53:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915: Fix memory leaks in i915 selftests
Message-ID: <ZDsOzZu/GtorSHhj@ashyti-mobl2.lan>
References: <20230414224109.1051922-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414224109.1051922-1-andi.shyti@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Cong Liu <liucong2@kylinos.cn>, Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 15, 2023 at 12:41:09AM +0200, Andi Shyti wrote:
> From: Cong Liu <liucong2@kylinos.cn>
> 
> This patch fixes memory leaks on error escapes in function fake_get_pages
> 
> Fixes: c3bfba9a2225 ("drm/i915: Check for integer truncation on scatterlist creation")
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>

pushed to drm-intel-gt-next.

Thanks Cong for your fix,
Andi
