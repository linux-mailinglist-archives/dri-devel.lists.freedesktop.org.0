Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381F6B1765
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 01:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E877F10E75D;
	Thu,  9 Mar 2023 00:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D50910E762;
 Thu,  9 Mar 2023 00:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678320117; x=1709856117;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=L8mJFeEuib6omOevxs+0qneHqkgXoH+0dfoFaHakng0=;
 b=I5MBFS7NTrWl+3VNYyBcA0LawOGjWxohI2Rm7uMWCrli/mqsMwwr9f78
 GDHjvfWnkMps4wHbuEr/N9NCZrZ+Fi8leLBn4huXDtYf5GWN9PaF3xAXB
 I0Tcgwb6pS9LFCrRV1lWgcR2+N0jEY1VJQYfHGs5cDqdUseLx9mJMjtdo
 SXJlKSyvmm0vLjH+1ioXHRh/tX0IIB9J5DjCyhcgiw8Xf+Q1cvUW46QWf
 Li8PGcaqfq1Vfgwy9ZG/QRmy7uqy4WTHnKperG0XPyNGVLEeX1v7RA9am
 jU31cErui3wsn+Yu3StZHWi1SpRYBydztjRZ/AvJzoTti6/uq1Di9Fy9w A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="398890707"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="398890707"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:01:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="766202216"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="766202216"
Received: from gbain-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.47.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 16:01:42 -0800
Date: Thu, 9 Mar 2023 01:01:39 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 2/4] drm/i915/display: use nop_clear_range instead of
 local function
Message-ID: <ZAkh4x1SOMT8x/bx@ashyti-mobl2.lan>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
 <20230308-guard_error_capture-v5-2-6d1410d13540@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230308-guard_error_capture-v5-2-6d1410d13540@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

On Wed, Mar 08, 2023 at 04:39:04PM +0100, Andrzej Hajda wrote:
> Since nop_clear_range is visible it can be used here.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
