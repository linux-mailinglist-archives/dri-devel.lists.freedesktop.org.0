Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 664BD4BA957
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 20:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576E510E21A;
	Thu, 17 Feb 2022 19:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5FC10E21A;
 Thu, 17 Feb 2022 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645125148; x=1676661148;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UrDfMpkAEv0VK8yjea3T2cx6XqPvHRRW0eKwMY6tJ+w=;
 b=MVEdCfDNPghQT7bW2JxRI3kwoPorPxdRR6uQABwKbKDr7v0HQi2YxjWR
 qMNFFYw89Svko3CgisSrFHdj6tliZuDaqbPBN/xyGLhfvCw8TjlZ0H+zx
 3yygp/vjn4g+n2CYBufXJwTC4SBu6pgqGzbfs5TJ9B4zj7KZQGqZsyVFy
 Kjkj8HNCxEnMO8CNYU8oCmQqNJ+d2LOOfionQp/xGZPJ/c9cDJFuc1Vs6
 7CPC9+jSyW+o+2YfJiwFGzDfmIL25HxX612iL5AU2lNGoVbww2ioRMbNy
 NoTCVFfAEXKt157ipbM1lfSA/E4ePgFycbTpMrj7HPEJ2BBmpn+F93l/y Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="250691463"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="250691463"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:12:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="637309889"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril-10.165.21.154)
 ([10.165.21.154])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 11:12:27 -0800
Date: Thu, 17 Feb 2022 11:12:26 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/i915/guc/slpc: Correct the param count for unset param
Message-ID: <20220217191226.GF34157@unerlige-ril-10.165.21.154>
References: <20220216181504.7155-1-vinay.belgaumkar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20220216181504.7155-1-vinay.belgaumkar@intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

On Wed, Feb 16, 2022 at 10:15:04AM -0800, Vinay Belgaumkar wrote:
>SLPC unset param H2G only needs one parameter - the id of the
>param.
>
>Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency limits")
>
>Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>---
> drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>index 13b27b8ff74e..ba21ace973da 100644
>--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>@@ -110,7 +110,7 @@ static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
> {
> 	u32 request[] = {
> 		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>-		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
>+		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),

lgtm,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
> 		id,
> 	};
>
>-- 
>2.34.0
>
