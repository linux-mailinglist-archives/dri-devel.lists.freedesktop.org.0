Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C00A03D04
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 11:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2513A10E23A;
	Tue,  7 Jan 2025 10:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RxlcYl5G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B80D10E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 10:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736247308; x=1767783308;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=segNsK1bClE37VYoyCZC0plMS53t1xW88+xHFXYR6eQ=;
 b=RxlcYl5GAufkf8+PC3OmKpJqz1jmjs6cswi0wxgze6HqZeP/9bMXpNHS
 mnjPYph24n2Hev6h2WYofIQdmVLUi8gepcxP5PKrXNeQhzsx0Ox30QyB1
 ER+NFEwuHiIktUL/EtEtaJDEZz0f/Nyl4sICZ+zCpfWMwpiipphEq9p6u
 K1BUD9c+kMNn88nEWqOrUmJ954eXOPRxgCWigSYpPrLpnHlouCgk6GU8+
 DIhCmBYlM8zJ00mlWuHyBDAZDQ/o0JAH9RX1RgeQn47gT6iPD5RDWXc65
 Lo7v6CtzT8Od6dGnxYPtqZfFBrB2WL19CbC2OZ6/Idq015CJbE/+ogHFP A==;
X-CSE-ConnectionGUID: s15FVmL2QA6ZlrSwt7sysQ==
X-CSE-MsgGUID: jYta+D5FTauOykJpc9DyYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36319345"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36319345"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 02:55:08 -0800
X-CSE-ConnectionGUID: 5faktFAbSNKYXZGckbBTSQ==
X-CSE-MsgGUID: s1UObTbcQQqedQ5g3QlLww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="102539584"
Received: from derekcam-mobl.ger.corp.intel.com (HELO [10.245.83.121])
 ([10.245.83.121])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 02:55:06 -0800
Message-ID: <7bd9c6f6-a0c2-46ed-a06f-fe386cedc644@linux.intel.com>
Date: Tue, 7 Jan 2025 11:55:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Change aic100_image_table definition
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_yabdulra@quicinc.com,
 quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241213185110.2469159-1-quic_jhugo@quicinc.com>
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

Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

On 12/13/2024 7:51 PM, Jeffrey Hugo wrote:
> From: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> aic100_image_table is currently defined as a "const char *" array,
> this can potentially lead to the accidental modification of the
> pointers inside. Also, checkpatch.pl gives a warning about it.
> 
> Change the type to a "const char * const" array to make the pointers
> immutable, preventing accidental modification of the images' paths.
> 
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/accel/qaic/sahara.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 21d58aed0deb..09c8b055aa81 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -160,7 +160,7 @@ struct sahara_context {
>  	struct work_struct		fw_work;
>  	struct work_struct		dump_work;
>  	struct mhi_device		*mhi_dev;
> -	const char			**image_table;
> +	const char * const		*image_table;
>  	u32				table_size;
>  	u32				active_image_id;
>  	const struct firmware		*firmware;
> @@ -177,7 +177,7 @@ struct sahara_context {
>  	bool				is_mem_dump_mode;
>  };
>  
> -static const char *aic100_image_table[] = {
> +static const char * const aic100_image_table[] = {
>  	[1]  = "qcom/aic100/fw1.bin",
>  	[2]  = "qcom/aic100/fw2.bin",
>  	[4]  = "qcom/aic100/fw4.bin",

