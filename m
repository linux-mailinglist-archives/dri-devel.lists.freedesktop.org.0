Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897949940B6
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 10:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0983D10E48C;
	Tue,  8 Oct 2024 08:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cvAQGOrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14E810E48C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728375169; x=1759911169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=EWtmxS0gTPT9PNhZWVAg0XvsbxAqnO0kUuB3LdkiNlw=;
 b=cvAQGOrXdoEC1hD02K2Re3SYbAIBljTnQHclZ7AEUEFel8FtzmNNqG3j
 ee7w5uTkenG8oxqAgYnFX49rgSUx+7hQlVp7mYur/Twt8jqnRUyFXn6f4
 mBGBnTByOnJf34kp+jC9EyZEwaOWdbMOctHLW4uNdpRCygyNm+tKrq65h
 joEjj4H9oU01NwDCfnsn7tUJYEfE84av9ZMtLmH535AQV81c5/NP31/Ob
 hWYTUX803hahldiBs/qcoPs4jSF1lw8RqMBxoL2prKikkPVAn4hdFl1x2
 UfU4J09slKBq/9mQzIOiuNld21cjfIjxj3m/UzjHjqEVXNx/S9MA7m08Z w==;
X-CSE-ConnectionGUID: d/l3ex1yQsOViSQjGjDfsw==
X-CSE-MsgGUID: LK2iLczBQLCF+mKaNqkHVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27685760"
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="27685760"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 01:12:49 -0700
X-CSE-ConnectionGUID: jqz2YI71RxmUygxskGe5vg==
X-CSE-MsgGUID: AOSAarT1QnCC6K/qBBczFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,186,1725346800"; d="scan'208";a="76179906"
Received: from unknown (HELO [10.217.160.106]) ([10.217.160.106])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 01:12:47 -0700
Message-ID: <a2ea4aac-3b12-4769-93b4-2437395c9e71@linux.intel.com>
Date: Tue, 8 Oct 2024 10:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add ipc_router channel
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_carlv@quicinc.com
Cc: ogabbay@kernel.org, corbet@lwn.net, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004164033.3825986-1-quic_jhugo@quicinc.com>
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

On 10/4/2024 6:40 PM, Jeffrey Hugo wrote:
> The ipc_router channel allows AF_QIPCRTR clients and services to
> communicate with the AIC100 device. The ipc_router MHI transport layer
> expects the channel to be named exactly "IPCR".
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  Documentation/accel/qaic/aic100.rst |  2 ++
>  drivers/accel/qaic/mhi_controller.c | 32 +++++++++++++++++++++++++++++
>  2 files changed, 34 insertions(+)
> 
> diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
> index 590dae77ea12..273da6192fb3 100644
> --- a/Documentation/accel/qaic/aic100.rst
> +++ b/Documentation/accel/qaic/aic100.rst
> @@ -229,6 +229,8 @@ of the defined channels, and their uses.
>  | _PERIODIC      |         |          | timestamps in the device side logs with|
>  |                |         |          | the host time source.                  |
>  +----------------+---------+----------+----------------------------------------+
> +| IPCR           | 24 & 25 | AMSS     | AF_QIPCRTR clients and servers.        |
> ++----------------+---------+----------+----------------------------------------+
>  
>  DMA Bridge
>  ==========
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index ada9b1eb0787..8ab82e78dd94 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -405,6 +405,38 @@ static const struct mhi_channel_config aic100_channels[] = {
>  		.auto_queue = false,
>  		.wake_capable = false,
>  	},
> +	{
> +		.name = "IPCR",
> +		.num = 24,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "IPCR",
> +		.num = 25,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_AMSS,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = true,
> +		.wake_capable = false,
> +	},
>  };
>  
>  static struct mhi_event_config aic100_events[] = {

