Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DBCA075F2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 13:42:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2B310EDA2;
	Thu,  9 Jan 2025 12:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UiZGmcc1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D574C10EDA2;
 Thu,  9 Jan 2025 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736426572; x=1767962572;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=pXb3J5/MDM/JRxgrXrNymwNsZk7Vq3QCDxx/Unn1YIo=;
 b=UiZGmcc1E4SI0JrRdCekgzAmojPK/RWOhQQBvLN0ewV8H7PTgopc/Fig
 s4R8fWcRZLoY5Mqwg1Yx1iylV9paGn/r1RlFKRIDXEJT3O+QtloPYCmQQ
 XTeXMO+zHIVUwXQ2WZjndVHweZV5l+hIl8Myllgq3Sdp83QSVm3r5k37v
 7SGCqZbWL4fckptemZzFCVbnIBO3G34QMlP+3ukgLhwIFbvjkRAdF/7G8
 4/BISEo3OLaC5/2qbNYbFV40WsAls+wDJ1nhXXsWuUYy6m4JiLEOSWq3K
 e/8PZsXNTGIrqkCaUTDj6r9a7UtJxsVUdCII3nkmEgsL60CfUjLrQRCd5 w==;
X-CSE-ConnectionGUID: 0q1CLhWmS7iIfrOtXQzFjg==
X-CSE-MsgGUID: SCNxn62KTYu1cNTBAFouRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47671284"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="47671284"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 04:42:52 -0800
X-CSE-ConnectionGUID: 8RNv4ig7TICaN3a9JpE2Cg==
X-CSE-MsgGUID: An8aZnsBRcq/dF7jnC8qWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104270578"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 04:42:49 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, Kieran
 Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/3] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
In-Reply-To: <20241205160234.GN10736@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1733410889.git.jani.nikula@intel.com>
 <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
 <20241205160234.GN10736@pendragon.ideasonboard.com>
Date: Thu, 09 Jan 2025 14:42:41 +0200
Message-ID: <87plkwjgzi.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 05 Dec 2024, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Dec 05, 2024 at 05:03:00PM +0200, Jani Nikula wrote:
>> Building with clang and and W=1 leads to warning about unused
>> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
>> 
>> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
>> inline functions for W=1 build").
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> https://lore.kernel.org/r/20240911095113.GB4470@pendragon.ideasonboard.com
>
> I wonder if Dave and Sima are starting to ignore my pull request in the
> hope I'll switch to using drm-misc :-S I'll send another one.

Have you sent the pull request again? I haven't seen one.

BR,
Jani.

>
>> ---
>> 
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: Nathan Chancellor <nathan@kernel.org>
>> ---
>>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> index 26a2f5ad8ee5..ea52b0af9226 100644
>> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
>> @@ -32,7 +32,7 @@ struct rcar_cmm {
>>  	} lut;
>>  };
>>  
>> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>>  {
>>  	return ioread32(rcmm->base + reg);
>>  }

-- 
Jani Nikula, Intel
