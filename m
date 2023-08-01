Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7F576AE34
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9D610E379;
	Tue,  1 Aug 2023 09:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C8D10E379;
 Tue,  1 Aug 2023 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690882612; x=1722418612;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=cVFmk5CKy6gTo0w9aV0IK8bC22Agg5xvhy/Cu1YAVQE=;
 b=ejbtK0t/usBmLfvj0Lk4MxOhO5TZ0Znb68cSvyRQ1UaUhNhcDRcwLqIT
 J6yApTRrdI4XaGXi2J7hk8ZlmaOeWDHL66PMSXxEm5kPVosA9Rqvic1OE
 DhOVuW9/21FvieX0prhpcNrI4MQHRnfRtpLtPfZHJkTKsFfJ7c6kcBPQF
 BRSPnu6ghhx2PeIwR3CtN/BKqkDdtS/cph9fw49rHiiVqxKtN5A9IJQMu
 PjzHk1sK5siXU2Sx71/OgfMeulct6lzCpW4z94KZMd4eAcoTXs4pEDgd5
 I8OAq37Pz7OAaHDoSawTvsRSP/LslG/YuvOvIGaL/EmGFwkVf6di/BdWl A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="368149827"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="368149827"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="722428493"
X-IronPort-AV: E=Sophos;i="6.01,246,1684825200"; d="scan'208";a="722428493"
Received: from igorban-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2023 02:36:49 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ran Sun <sunran001@208suo.com>, alexander.deucher@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: Re: [PATCH] drm/amd: Clean up errors in processpptables.c
In-Reply-To: <20230801091425.7181-1-sunran001@208suo.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230801091425.7181-1-sunran001@208suo.com>
Date: Tue, 01 Aug 2023 12:36:47 +0300
Message-ID: <87leevw1cg.fsf@intel.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Ran Sun <sunran001@208suo.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Aug 2023, Ran Sun <sunran001@208suo.com> wrote:
> Fix the following errors reported by checkpatch:
>
> ERROR: open brace '{' following function definitions go on the next line
> ERROR: code indent should use tabs where possible
> ERROR: space required before the open parenthesis '('

The commit message does not match the patch.

>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> index 1866fe20f9e2..f05f011c78be 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/processpptables.c
> @@ -676,7 +676,7 @@ static PP_StateClassificationFlags make_classification_flags(
>  static int init_non_clock_fields(struct pp_hwmgr *hwmgr,
>  						struct pp_power_state *ps,
>  							    uint8_t version,
> -			 const ATOM_PPLIB_NONCLOCK_INFO *pnon_clock_info) 
> +			 const ATOM_PPLIB_NONCLOCK_INFO *pnon_clock_info)

How about fixing *all* the style problems in the above in one go?

How about sending these fixes in a threaded series instead of filling
everyone's inboxes with individual patches? It's 30+ patches just today
already.


BR,
Jani.

>  {
>  	unsigned long rrr_index;
>  	unsigned long tmp;

-- 
Jani Nikula, Intel Open Source Graphics Center
