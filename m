Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A6436CB9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 23:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1219B6E4C4;
	Thu, 21 Oct 2021 21:32:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21E006E4C4;
 Thu, 21 Oct 2021 21:32:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="216066894"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="216066894"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 14:32:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="445502291"
Received: from sghiemst-mobl2.amr.corp.intel.com (HELO ldmartin-desk2)
 ([10.254.10.154])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 14:32:15 -0700
Date: Thu, 21 Oct 2021 14:32:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: remove CNL leftover
Message-ID: <20211021213213.rl7dyux3sfaczyit@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20211021181847.1543341-1-lucas.demarchi@intel.com>
 <YXG6BGEtId+5oXFH@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YXG6BGEtId+5oXFH@intel.com>
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

On Thu, Oct 21, 2021 at 10:05:40PM +0300, Ville Syrjälä wrote:
>On Thu, Oct 21, 2021 at 11:18:47AM -0700, Lucas De Marchi wrote:
>> We left the definition IS_CANNONLAKE() macro while removing it from the
>> tree due to having to merge the changes in different branches. Now that
>> everything is back in sync and nobody is using IS_CANNONLAKE(), we can
>> safely ditch it.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
>I found another leftover somewhere else, but now I forgot where
>it was. I guess it'll come back to me eventually.

drivers/gpu/drm/i915/intel_pch.c, which I suspect is what you're talking
about due to your recent patches. But that one is correct as we still
have Cannon Lake Point (and I never remember if P in CNP is for PCH or
Point) 

there is another one in a comment in drivers/gpu/drm/i915/gt/intel_gt.c,
too.

Lucas De Marchi

>
>> ---
>>  drivers/gpu/drm/i915/i915_drv.h | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 357faa043b3a..5e23c0273cf0 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -1431,7 +1431,6 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>  #define IS_GEMINILAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_GEMINILAKE)
>>  #define IS_COFFEELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COFFEELAKE)
>>  #define IS_COMETLAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_COMETLAKE)
>> -#define IS_CANNONLAKE(dev_priv)	0
>>  #define IS_ICELAKE(dev_priv)	IS_PLATFORM(dev_priv, INTEL_ICELAKE)
>>  #define IS_JSL_EHL(dev_priv)	(IS_PLATFORM(dev_priv, INTEL_JASPERLAKE) || \
>>  				IS_PLATFORM(dev_priv, INTEL_ELKHARTLAKE))
>> --
>> 2.33.1
>
>-- 
>Ville Syrjälä
>Intel
