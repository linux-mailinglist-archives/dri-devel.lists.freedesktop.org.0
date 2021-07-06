Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC623BDFDC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 01:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2DD6E5D3;
	Tue,  6 Jul 2021 23:50:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D90A26E5D1;
 Tue,  6 Jul 2021 23:50:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="188894628"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="188894628"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:50:45 -0700
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="481762062"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.212.78.157])
 ([10.212.78.157])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:50:45 -0700
Subject: Re: [PATCH 1/2] drm/i915/huc: Update TGL and friends to HuC 7.9.3
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20210626004522.1699509-1-John.C.Harrison@Intel.com>
 <20210626004522.1699509-2-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <e816f4fc-05f1-cc46-36db-a81e1907bd1b@intel.com>
Date: Tue, 6 Jul 2021 16:50:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626004522.1699509-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

On 6/25/2021 5:45 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> A new HuC is available for TGL and compatible platforms, so switch to
> using it.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index 9f23e9de3237..f05b1572e3c3 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -48,9 +48,9 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
> -	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
> -	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
> -	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
> +	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
> +	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
> +	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
>   	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
>   	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
>   	fw_def(ICELAKE,     0, guc_def(icl, 62, 0, 0), huc_def(icl,  9, 0, 0)) \

