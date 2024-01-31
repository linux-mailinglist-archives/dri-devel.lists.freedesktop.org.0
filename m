Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2218843FA2
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 13:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009BC10F99A;
	Wed, 31 Jan 2024 12:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264E10F99A;
 Wed, 31 Jan 2024 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706705351; x=1738241351;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8zob8Hu2TeGK78MDBo44QbIADeTAI1jM5g2oyhp+fOE=;
 b=QzRjQpZwvFuIsilgSkiOz7OMan5vd27hjJtGYyuXAMASzaGN7R2Kt3U3
 892O9/1jIfdUYJRLE3qXPEKJLGbuF0LZDosPnXmetcoEpr6iB/GdA+OQp
 BaFlFBEzQ+cNTw+KSfs591aFh/tTLnPxI/BLudfWr8/lgEh/JMvl/vLNV
 yvQ8aAz3O8H1+xw5bWxnh/L9IvmvtX+0w5zPaX8hcY2vUg8p9CuM1SgId
 keVKR4EczaMagE+/B5lcXpw6XnBzsdcCt1g3GXM4HJN8yiRKlURHd5niR
 UxzYfjbtMKtJqhiO1kAZ9UIjp3ENfu3F3fLd9qeTOBVOtWRbS+kDZEyIj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="403212915"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="403212915"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="931830813"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="931830813"
Received: from abarrete-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.174])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 04:49:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4/6] drm/imx: prefer snprintf over sprintf
In-Reply-To: <3f20b80fa45f171d26b2b02dea9f9a9acff9c28a.camel@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1704908087.git.jani.nikula@intel.com>
 <14c0108a54007a8360d84162a1d63cba9613b945.1704908087.git.jani.nikula@intel.com>
 <3f20b80fa45f171d26b2b02dea9f9a9acff9c28a.camel@pengutronix.de>
Date: Wed, 31 Jan 2024 14:49:06 +0200
Message-ID: <87bk91is71.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Jan 2024, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Hi Jani,
>
> On Mi, 2024-01-10 at 19:39 +0200, Jani Nikula wrote:
>> This will trade the W=1 warning -Wformat-overflow to
>> -Wformat-truncation. This lets us enable -Wformat-overflow subsystem
>> wide.
>>
>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks, pushed this one patch to drm-misc-next as prep work.

BR,
Jani.


-- 
Jani Nikula, Intel
