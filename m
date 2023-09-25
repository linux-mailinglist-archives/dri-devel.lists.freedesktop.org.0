Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9589D7AD9FF
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 16:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692AF10E261;
	Mon, 25 Sep 2023 14:24:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD4A10E260;
 Mon, 25 Sep 2023 14:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695651848; x=1727187848;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jU+SI44HkxXMf7LySVpUI6Y7vjXW5jaFhvTqEb6o1Co=;
 b=lm4JJ6ZmWflTFp9VWDwqjzlaj/fZvV1yC7MfWfkU8/o/nf5nCPtuVMtd
 dXPyOM2LHH71jUfE1GH+oQCCNjdgRbkTo0b2ouBBAmHZVHCUfysuEH40T
 vZPItefpZ9QkhTvIKpqVhGjPPc8hOrV7eGvro9+Xa2kiuR9yxVaSpHOh7
 Dorq358YAlsezicxVoLYRa/rFjolPi0Qu/P7n3yhlO+g7D58MY1hvdQhK
 UkPzIpPK1eVxHFy8sj0anNq9GjRpxEMMJVZUXSgWJDrh9hGvTlZ4Qh5wp
 ZUGZNGXgH90b2gPu8IZ/ANtKfHd0NsKSjZsK/02Ca4+3nhX00mtARLHUD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447753669"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="447753669"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="838578588"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="838578588"
Received: from nurqayrx-mobl2.gar.corp.intel.com (HELO intel.com)
 ([10.213.34.118])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 07:24:05 -0700
Date: Mon, 25 Sep 2023 16:23:59 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: John.C.Harrison@intel.com
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Suppress 'ignoring reset
 notification' message
Message-ID: <ZRGX//mF6OUBpImU@ashyti-mobl2.lan>
References: <20230921182033.135448-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230921182033.135448-1-John.C.Harrison@Intel.com>
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi John,

On Thu, Sep 21, 2023 at 11:20:33AM -0700, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> If an active context has been banned (e.g. Ctrl+C killed) then it is
> likely to be reset as part of evicting it from the hardware. That
> results in a 'ignoring context reset notification: banned = 1'
> message at info level. This confuses/concerns people and makes them
> thing something has gone wrong when it hasn't.

/thing/think/

> There is already a debug level message with essentially the same
> information. So drop the 'ignore' info level one and just add the
> 'ignore' flag to the debug level one instead (which will therefore not
> appear by default but will still show up in CI runs).
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
