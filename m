Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 847563BDFE9
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 01:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CD26E7D9;
	Tue,  6 Jul 2021 23:54:17 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C846E7D5;
 Tue,  6 Jul 2021 23:54:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="206202267"
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="206202267"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:54:11 -0700
X-IronPort-AV: E=Sophos;i="5.83,330,1616482800"; d="scan'208";a="481762826"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.212.78.157])
 ([10.212.78.157])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2021 16:54:10 -0700
Subject: Re: [PATCH 2/2] drm/i915/adlp: Add ADL-P GuC/HuC firmware files
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20210626004522.1699509-1-John.C.Harrison@Intel.com>
 <20210626004522.1699509-3-John.C.Harrison@Intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20664dd8-7edd-655e-767c-2fe9ebdf6995@intel.com>
Date: Tue, 6 Jul 2021 16:54:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210626004522.1699509-3-John.C.Harrison@Intel.com>
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



On 6/25/2021 5:45 PM, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Add ADL-P to the list of supported GuC and HuC firmware versions. For
> HuC, it reuses the existing TGL firmware file. For GuC, there is a
> dedicated firmware release.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index f05b1572e3c3..3a16d08608a5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -48,6 +48,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>    * firmware as TGL.
>    */
>   #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
> +	fw_def(ALDERLAKE_P, 0, guc_def(adlp, 62, 0, 3), huc_def(tgl, 7, 9, 3)) \

Kind of annoying that the guc adlp prefix isn't a 3 letter acronym, but 
I can see using just adl could be confusing given that ADL-S uses a 
different firmware.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>   	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
>   	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \
>   	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 9, 3)) \

