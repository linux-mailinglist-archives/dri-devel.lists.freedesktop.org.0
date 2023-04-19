Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37956E781B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 13:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADA910E936;
	Wed, 19 Apr 2023 11:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BE6F10E931;
 Wed, 19 Apr 2023 11:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681902498; x=1713438498;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rgzf1ysMsd5NBKHIp0YTK3BCwRPNpD+V0xZ39kCgpp8=;
 b=Ha4AIFRIA3tcb1NocXLGR6Eo5XWU+3hUGeh+GDu+wdmFvTxih0K2MMaA
 Ckef3F+A5qL2pwC3OkLeULCDAo5fQQwYYGH8RERRVG66hwcc7R2Wf5Dnr
 rnII4isaSyb7AKqknVh9H5oDkFZGzJGSJ27QgZMcC5UdiQLUKr7Ipv71t
 J+BzmVVNFVbXG+gZ/gnmI0MDcWjnzfYAx7oLiFFndQdzMyK3faw3EwxzE
 JHOQsTlzkUWsNyQyUFe4NdH8tPPrsWsx3A5Iu+iWlAPPxhojO5h1ZpNYR
 XIQsLWZ8h2YeQXYNSzrh1uVUgsXKjp2tf59hc9HxZgv/EucNZlEZGxRrY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="342901612"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="342901612"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="724018146"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="724018146"
Received: from crijnder-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.137])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 04:08:15 -0700
Date: Wed, 19 Apr 2023 13:08:12 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH 5/8] drm/i915/mtl: end support for set
 caching ioctl
Message-ID: <ZD/LnDUZxG3MkXXo@ashyti-mobl2.lan>
References: <20230417062503.1884465-1-fei.yang@intel.com>
 <20230417062503.1884465-6-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230417062503.1884465-6-fei.yang@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

On Sun, Apr 16, 2023 at 11:25:00PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The design is to keep Buffer Object's caching policy immutable through
> out its life cycle. This patch ends the support for set caching ioctl
> from MTL onward. While doing that we also set BO's to be 1-way coherent
> at creation time because GPU is no longer automatically snooping CPU
> cache.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
