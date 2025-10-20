Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D54BEF712
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 08:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B4810E261;
	Mon, 20 Oct 2025 06:17:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KVQpJywu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E1B10E261
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 06:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760941067; x=1792477067;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vaOnzfC60iu6YIVtK6usVRKW4rEfT+6uRxEg3uNMtGg=;
 b=KVQpJywuKYvVmXosQfOqwJt9Kq5Ngy/nAJhCNbuq2OdfPIfOoud6k5tQ
 mhvKhDaoW/XcxPepjnoJUPwzh6lrgzojUbhtH5iUkPh2qR6wzxyoQAF81
 +bfjc8/CfcaiPrjSaoOziySkU/Ctp9VFLwlmwgE84TLOKz/kcF2lXs094
 bDX2uyqTEPJoTlAPYyrk6Eq7sSjykGzWtwSAtue9Sax00vZohJMXZD70m
 1lqOuE1KHYTxdXQm3m6fyoF8m+u5zn4sQLOsG3qM0uwz56umrXyXTnP3M
 yISSBiMEVIoBHUBe7sUIIZIz2pfYFEpp5M5Mko447beU/BLO8k9BUF34e w==;
X-CSE-ConnectionGUID: +xEsCqiPS+G52vxWVIwNgg==
X-CSE-MsgGUID: m9nkRJBRTymHkTqyENqbkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="62088204"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="62088204"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:17:47 -0700
X-CSE-ConnectionGUID: d7RvmPwESXeRrONWq29zNg==
X-CSE-MsgGUID: HBxe83KURRewpXDd1V44ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="183270421"
Received: from unknown (HELO [10.102.88.18]) ([10.102.88.18])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2025 23:17:45 -0700
Message-ID: <bd7a0f8e-1d9a-4db1-81a9-2154e45d8a69@linux.intel.com>
Date: Mon, 20 Oct 2025 08:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Update the sahara image table for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Zack McKevitt <zmckevit@qti.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>
References: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Karol Wachowski <karol.wachowski@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20251017173432.1207656-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/17/2025 7:34 PM, Youssef Samir wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
>
> Update the Sahara image table for the AIC200 to add entries for:
> - qupv3fw.elf at id 54
> - xbl_config.elf at id 38
> - tz_qti_config.mbn at id 76
> And move pvs.bin to id 78 to avoid firmware conflict.
>
> Co-developed-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Co-developed-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
> Changes in V2:
> - Squashed the following patches:
>   * accel/qaic: Add QuPFW image entry for AIC200
>     Link: https://lore.kernel.org/all/20251007161733.424647-1-youssef.abdulrahman@oss.qualcomm.com
>   * accel/qaic: Add tz_qti_config.mbn entry for AIC200
>     Link: https://lore.kernel.org/all/20251007161929.426336-1-youssef.abdulrahman@oss.qualcomm.com
>   * accel/qaic: Add xbl_config image entry for AIC200
>     Link: https://lore.kernel.org/all/20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com
> - Moved pvs.bin to id 78
> ---
>  drivers/accel/qaic/sahara.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..6ac0384c7dc2 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>  	[23] = "qcom/aic200/aop.mbn",
>  	[32] = "qcom/aic200/tz.mbn",
>  	[33] = "qcom/aic200/hypvm.mbn",
> +	[38] = "qcom/aic200/xbl_config.elf",
>  	[39] = "qcom/aic200/aic200_abl.elf",
>  	[40] = "qcom/aic200/apdp.mbn",
>  	[41] = "qcom/aic200/devcfg.mbn",
> @@ -202,6 +203,7 @@ static const char * const aic200_image_table[] = {
>  	[49] = "qcom/aic200/shrm.elf",
>  	[50] = "qcom/aic200/cpucp.elf",
>  	[51] = "qcom/aic200/aop_devcfg.mbn",
> +	[54] = "qcom/aic200/qupv3fw.elf",
>  	[57] = "qcom/aic200/cpucp_dtbs.elf",
>  	[62] = "qcom/aic200/uefi_dtbs.elf",
>  	[63] = "qcom/aic200/xbl_ac_config.mbn",
> @@ -213,7 +215,8 @@ static const char * const aic200_image_table[] = {
>  	[69] = "qcom/aic200/dcd.mbn",
>  	[73] = "qcom/aic200/gearvm.mbn",
>  	[74] = "qcom/aic200/sti.bin",
> -	[75] = "qcom/aic200/pvs.bin",
> +	[76] = "qcom/aic200/tz_qti_config.mbn",
> +	[78] = "qcom/aic200/pvs.bin",
>  };
>  
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
Reviewed-by: Karol Wachowski <karol.wachowski@linux.intel.com>
