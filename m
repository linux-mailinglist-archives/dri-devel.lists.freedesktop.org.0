Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA00D80C7DD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2663610E3A4;
	Mon, 11 Dec 2023 11:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77A410E3A4
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702293823; x=1733829823;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NR2nCw8aKkNwXdT8fawfe2md2lSctPB3xDzprjVV3UQ=;
 b=KSMJVQK8n7PdMis7rw22tCimU9zPrIKDQpFXsrco2wLg8Wk273s2Vj+h
 ELZ4LLkJvZEHkSyIc9hfR21v3+E+0KhjtPrEFjRrQd4L6cCrMgr/tZ7e3
 eE0Mwcn/y9lNVnMxf/FTQlEEcccUDDRBIEvnLLe6WCfPYqJxEUzQpidtT
 mHm7FWfelnUK9EaPFSDgPZtSduiE3yZy3NpAwozzXZDa4MdXz4GNwbf09
 9OlaXpoj6LL+tTKM3STzQt2Xivk7FVUq3FcMHWooPh1yvzhqIIA9ZP6Tu
 owwwYJOBXgUME/J56cTVsGk1LauQFMjUNAdAP9EsGltXo2d2haHuT+kcM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="379626887"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="379626887"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:23:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="891091361"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="891091361"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.128.67])
 ([10.249.128.67])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:23:42 -0800
Message-ID: <57343233-91eb-4caf-b2e6-b42e97268552@linux.intel.com>
Date: Mon, 11 Dec 2023 12:23:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] accel/qaic: Fix MHI channel struct field order
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <20231208163457.1295993-1-quic_jhugo@quicinc.com>
 <20231208163457.1295993-4-quic_jhugo@quicinc.com>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20231208163457.1295993-4-quic_jhugo@quicinc.com>
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

On 08.12.2023 17:34, Jeffrey Hugo wrote:
> The timesync channels have their struct fields out of order with the rest
> of the channels. Fix them so there is a consistent style in the file.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 832464f2833a..364eede0ac02 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -358,8 +358,8 @@ static struct mhi_channel_config aic100_channels[] = {
>  		.wake_capable = false,
>  	},
>  	{
> -		.num = 21,
>  		.name = "QAIC_TIMESYNC",
> +		.num = 21,
>  		.num_elements = 32,
>  		.local_elements = 0,
>  		.event_ring = 0,
> @@ -390,8 +390,8 @@ static struct mhi_channel_config aic100_channels[] = {
>  		.wake_capable = false,
>  	},
>  	{
> -		.num = 23,
>  		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 23,
>  		.num_elements = 32,
>  		.local_elements = 0,
>  		.event_ring = 0,
