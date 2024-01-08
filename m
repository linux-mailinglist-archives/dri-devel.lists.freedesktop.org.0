Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C370E827951
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 21:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4246F10E2CA;
	Mon,  8 Jan 2024 20:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE71410E2A6;
 Mon,  8 Jan 2024 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704746816; x=1736282816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ysxA/zp0hOOuWwajvTnchvlZ9+DORxFTUedJeEkkADQ=;
 b=GakclAICnePG/kjYNx4B5B26VOMGtCgoCEgz+URSygqRUWd8Pu/8ltIM
 Ipc/Qb1mrDh30dTngHXVW3/tfCc3Frb3nV7VGzuuwd0j64oQaVJS/oa3L
 zIp+tvJhRPqPClnvXM1rvma6l6xCnI/A14GBaY2HIAlFAjZZkJVi8yJgS
 kRNBOBvzj4DWBHhmS+2dAg4/lfeVKgwCfnaqn7oQeyXJg0m030tinYJVr
 8qJu90xzNLBOE9nRFIKyPi5Tm6nL25ZsDuLqNdsZfXajxS5+YEoBP+coE
 NprUp0/cYc0Kgqi+dUnHJXdewvRm+lgVGE8C8fxy2YZ0LpwJ3FfXlIP8a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="5085375"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; 
   d="scan'208";a="5085375"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2024 12:46:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781543260"
X-IronPort-AV: E=Sophos;i="6.04,180,1695711600"; d="scan'208";a="781543260"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orsmga002.jf.intel.com with ESMTP; 08 Jan 2024 12:46:50 -0800
Received: from [10.249.149.159] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.149.159])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 6E90728165;
 Mon,  8 Jan 2024 20:46:49 +0000 (GMT)
Message-ID: <84a5c289-e2f6-4e30-a093-5a1c5b335057@intel.com>
Date: Mon, 8 Jan 2024 21:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
 <e5g3qkwvc3sjfpxcdvn43fiwbxthpblqgg2getxpbkd6g4lp5k@pgfm75tsg7wz>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <e5g3qkwvc3sjfpxcdvn43fiwbxthpblqgg2getxpbkd6g4lp5k@pgfm75tsg7wz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08.01.2024 15:07, Lucas De Marchi wrote:
> On Mon, Jan 08, 2024 at 12:05:57PM +0300, Dan Carpenter wrote:
>> The GUC_HXG_MSG_0_ORIGIN definition should be unsigned.  Currently it is
>> defined as INT_MIN.  This doesn't cause a problem currently but it's
>> still worth cleaning up.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> it seems there are a few more places to change to follow what was done
> in commit 962bd34bb457 ("drm/i915/uc: Fix undefined behavior due to
> shift overflowing the constant").
> 
> +Michal
> 
> Could we eventually share these abi includes with i915 so we don't
> keep fixing the same thing in 2 places?

it should be possible and I guess we should plan for that while
discussing all this new xe driver...

anyway, what about creating new intel/ folder under drm/ ?

 - drm/intel/include/abi
        guc_actions_abi.h
        guc_klvs_abi.h
        ...

the only question would be what prefix should be used for macros:
just GUC_ or INTEL_GUC_ or XE_GUC_ ?

then we can also think of creating library with common helpers for GuC
(for encoding/decoding HXG messages, preparing ADS, reading logs, etc)

btw, we can also consider sharing register definitions:

 - drm/intel/include/regs
        xe_engine_regs.h
        xe_gt_regs.h
        xe_regs_defs.h

Michal

> 
> Lucas De Marchi
> 
>> ---
>> drivers/gpu/drm/xe/abi/guc_messages_abi.h | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> index 3d199016cf88..c04606872e48 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_messages_abi.h
>> @@ -40,7 +40,7 @@
>>  */
>>
>> #define GUC_HXG_MSG_MIN_LEN            1u
>> -#define GUC_HXG_MSG_0_ORIGIN            (0x1 << 31)
>> +#define GUC_HXG_MSG_0_ORIGIN            (0x1U << 31)
>> #define   GUC_HXG_ORIGIN_HOST            0u
>> #define   GUC_HXG_ORIGIN_GUC            1u
>> #define GUC_HXG_MSG_0_TYPE            (0x7 << 28)
>> -- 
>> 2.42.0
>>
