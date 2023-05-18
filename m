Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D36708C8A
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 01:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8400A10E590;
	Thu, 18 May 2023 23:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7137910E58F;
 Thu, 18 May 2023 23:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684454050; x=1715990050;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+D5psDNyUmd7dAZ4+pd1QsJ/Pk3EYpwue9iEXA+aI5I=;
 b=ZF6jrqOSEJX9O2sLadcGCEJLQSDP/BPiBeuswXZcbVq/N9W7uG7CAAYM
 WitddU7nUsQvr4Rq1kadO8HmMqME52rBYqtzMlqly21eZ6TmaCvXmMQb+
 qPsI0NK3lnTh9zmhSv9iarbssWGUsqB1wh7iMBKUlLPQ6q065Yrxkrfmn
 ymCncNfShEgyDjscXol6TSfUl/nB3saxiAwVg02EzXMAnrUVQG8r0r7Oe
 4BiL3VbiWVoIQxfHNUdgtY8u4oMsrqFQ7UZxPGsmR/puKxNbwgfPng34E
 nTIEVUEaldbihR9ZYoPibzxLTHa37WKPRGFbXnyS9IJiubh/S5H0Xts20 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="336813417"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="336813417"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 16:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="846677814"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="846677814"
Received: from refaase-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.221.245])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 16:54:04 -0700
Date: Fri, 19 May 2023 01:54:00 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [Intel-gfx] [RESEND PATCH] drm/i915: constify pointers to
 hwmon_channel_info
Message-ID: <ZGa6mAe726ER7N4t@ashyti-mobl2.lan>
References: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511175446.282041-1-krzysztof.kozlowski@linaro.org>
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
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

On Thu, May 11, 2023 at 07:54:46PM +0200, Krzysztof Kozlowski wrote:
> Statically allocated array of pointers to hwmon_channel_info can be made
> const for safety.
> 
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi
