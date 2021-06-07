Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F7A39E776
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 21:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393A56E9E0;
	Mon,  7 Jun 2021 19:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D2B86E53C;
 Mon,  7 Jun 2021 19:24:26 +0000 (UTC)
IronPort-SDR: t777BnElepB+3zXUIyXtCNT3/sUYlBtd9/+9Khcr7GfCgl8xBB2xgy5HSN+An9DX6ogIlQUkKa
 3HMe0OBBMHjw==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="192020866"
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="192020866"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 12:24:01 -0700
IronPort-SDR: AF0p3eE6UsE9chrD29Dmmtvsgu6e438WE+D2ZMGwLeK/73aXlFSxhvqCWdeG7J/JQP5bD3LmH1
 g2+dbTYpPlNQ==
X-IronPort-AV: E=Sophos;i="5.83,255,1616482800"; d="scan'208";a="449211015"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 12:23:59 -0700
Date: Mon, 7 Jun 2021 12:17:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 13/13] drm/i915/guc: Update firmware to v62.0.0
Message-ID: <20210607191703.GA25703@sdutt-i7>
References: <20210607180356.165785-1-matthew.brost@intel.com>
 <20210607180356.165785-14-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607180356.165785-14-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Mon, Jun 07, 2021 at 11:03:55AM -0700, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index df647c9a8d56..9f23e9de3237 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -48,19 +48,19 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
>   * firmware as TGL.
>   */
>  #define INTEL_UC_FIRMWARE_DEFS(fw_def, guc_def, huc_def) \
> -	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
> -	fw_def(ROCKETLAKE,  0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
> -	fw_def(TIGERLAKE,   0, guc_def(tgl, 49, 0, 1), huc_def(tgl,  7, 5, 0)) \
> -	fw_def(JASPERLAKE,  0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
> -	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 49, 0, 1), huc_def(ehl,  9, 0, 0)) \
> -	fw_def(ICELAKE,     0, guc_def(icl, 49, 0, 1), huc_def(icl,  9, 0, 0)) \
> -	fw_def(COMETLAKE,   5, guc_def(cml, 49, 0, 1), huc_def(cml,  4, 0, 0)) \
> -	fw_def(COMETLAKE,   0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
> -	fw_def(COFFEELAKE,  0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
> -	fw_def(GEMINILAKE,  0, guc_def(glk, 49, 0, 1), huc_def(glk,  4, 0, 0)) \
> -	fw_def(KABYLAKE,    0, guc_def(kbl, 49, 0, 1), huc_def(kbl,  4, 0, 0)) \
> -	fw_def(BROXTON,     0, guc_def(bxt, 49, 0, 1), huc_def(bxt,  2, 0, 0)) \
> -	fw_def(SKYLAKE,     0, guc_def(skl, 49, 0, 1), huc_def(skl,  2, 0, 0))
> +	fw_def(ALDERLAKE_S, 0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
> +	fw_def(ROCKETLAKE,  0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
> +	fw_def(TIGERLAKE,   0, guc_def(tgl, 62, 0, 0), huc_def(tgl,  7, 5, 0)) \
> +	fw_def(JASPERLAKE,  0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
> +	fw_def(ELKHARTLAKE, 0, guc_def(ehl, 62, 0, 0), huc_def(ehl,  9, 0, 0)) \
> +	fw_def(ICELAKE,     0, guc_def(icl, 62, 0, 0), huc_def(icl,  9, 0, 0)) \
> +	fw_def(COMETLAKE,   5, guc_def(cml, 62, 0, 0), huc_def(cml,  4, 0, 0)) \
> +	fw_def(COMETLAKE,   0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
> +	fw_def(COFFEELAKE,  0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
> +	fw_def(GEMINILAKE,  0, guc_def(glk, 62, 0, 0), huc_def(glk,  4, 0, 0)) \
> +	fw_def(KABYLAKE,    0, guc_def(kbl, 62, 0, 0), huc_def(kbl,  4, 0, 0)) \
> +	fw_def(BROXTON,     0, guc_def(bxt, 62, 0, 0), huc_def(bxt,  2, 0, 0)) \
> +	fw_def(SKYLAKE,     0, guc_def(skl, 62, 0, 0), huc_def(skl,  2, 0, 0))
>  
>  #define __MAKE_UC_FW_PATH(prefix_, name_, major_, minor_, patch_) \
>  	"i915/" \
> -- 
> 2.28.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
