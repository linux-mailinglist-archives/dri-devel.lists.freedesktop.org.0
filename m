Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23155A176E8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 06:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ACE010E4BD;
	Tue, 21 Jan 2025 05:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hhDtzLAC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C4210E4BD
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 05:17:32 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-21669fd5c7cso91112545ad.3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 21:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737436592; x=1738041392; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=BAke++1U5RWEwLy4C0asQPiSPopWRe55x+FydJix+Dk=;
 b=hhDtzLACS5EhsOL8AL4kJwYlmjBBoOVchA5SJuhuhj2rwnJPnN4uIuyi6Tsu8mOMjZ
 oco6YlTcWCFz8riDKHHHLkEfDhAHnWaRiyLQ0r0QOeMyxleSeS9V0JCFYxL7Lly46+CK
 RPwiP1QmR5bQ8Gm66BQ4+aBtSONmOlOKoNqCUXu2reCRMuFeUhDCyTd6X6uoLn9Oz4i6
 LwOIXW348BHDkVlXPshJVnH18mCHP6A7mvNE6OlZXOe2pSxPH4kr/dGKE3EPGmjiw6n9
 OvDopllTxLPFyCWeYT52G1KgM2D/5vKrcvngTaTYio8JgbqXOHWphHW6Df43VjFkzd1h
 XEHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737436592; x=1738041392;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAke++1U5RWEwLy4C0asQPiSPopWRe55x+FydJix+Dk=;
 b=QBH0Dqd9UZTXSiSNSDU6Vz8UQc7UfFknf3e35r3j2dyDfKSJ5U4EZ9i/DgSZ1rdLpb
 GvrDMXY4Vfg7zRa7SW68s6dyksNpS4qioiC7Wtd4j7haUkcBRKQUSQE2GN65rJ3xdpUG
 /rQtYACi8eAGOhlfotvRL08DFisCGkOJi8jSnVWe0VhqvfAiVR0FUnTFXtoy91lnYR+7
 /MI2fBbYryvrJlgtMNm76cmfm6RGWP8wZWssu3WcoCUSNSXVK6IAwRjKgzh6Bgq9dtYl
 osdWLsAzC7iNw2TmOMWuRrLc7R1rSTvQA9GDMqQ1Mgk8yt1x2s6kF6JvB7s1/sbxHpt2
 9RdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeuN4DZp5QT6N51oseys0Xtm1c3zXKRyv1k18p4W6A1KXPdcocxRgg8Nc10wrmWRHty93FkLpluqM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxu10EOP2pFBvMgUgKgp0VWnhCsbo6KMxHArrvTrtjZzUU68UML
 6bWfChm4qavMg2aokYvipWdebZmc494ZAQaNulDyfAdiRo0I4vX/h3kRjVjMqLF+MJZFazaCiJo
 =
X-Gm-Gg: ASbGncsWr8hKE49Q59yMaZBhCsbDlK/FGyRVu48oRT7jggFaQ5P+r8YbAfx4iepPqD4
 TEX91dbfrzs5ImDsIsAbXTB2Ow8fUuHyjffb1aWBkZx5kHiOpEv1FXyney4ss7R2KdzRc6MkUrm
 PZRZe235s6TAyksTYPOpdZU5nSxfdKQCb3ZUlu80iLjloy+MFZfGUeDKvIrXQGtkzsIgw/WYf3b
 gYtUQjy2/GBg2CzlWdLjE8D7DdyEJ+2oy5lF1JB3JbPiGslt0pGlLM9B02LFFd8fvMJUtCYv0wX
 eterU+s=
X-Google-Smtp-Source: AGHT+IGaI/RPreLjhhuind/TCwUpZY+YxPrRTkj36HP7T1seVjaQtPrzGdtX+VzPW62BORz2D5cyIQ==
X-Received: by 2002:a17:902:db10:b0:215:a2e2:53fe with SMTP id
 d9443c01a7336-21c355c7a3dmr250553465ad.40.1737436591419; 
 Mon, 20 Jan 2025 21:16:31 -0800 (PST)
Received: from thinkpad ([117.213.102.234]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3a913csm69871065ad.117.2025.01.20.21.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 21:16:31 -0800 (PST)
Date: Tue, 21 Jan 2025 10:46:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: quic_carlv@quicinc.com, quic_yabdulra@quicinc.com,
 quic_mattleun@quicinc.com, quic_thanson@quicinc.com,
 ogabbay@kernel.org, lizhi.hou@amd.com,
 jacek.lawrynowicz@linux.intel.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mhi@lists.linux.dev
Subject: Re: [PATCH v2 7/7] accel/qaic: Add AIC200 support
Message-ID: <20250121051624.nhest7s6iyh2ll4m@thinkpad>
References: <20250117170943.2643280-1-quic_jhugo@quicinc.com>
 <20250117170943.2643280-8-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117170943.2643280-8-quic_jhugo@quicinc.com>
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

On Fri, Jan 17, 2025 at 10:09:43AM -0700, Jeffrey Hugo wrote:
> Add basic support for the new AIC200 product. The PCIe Device ID is
> 0xa110. With this, we can turn on the lights for AIC200 by leveraging
> much of the existing driver.
> 
> Co-developed-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One suggestion for future cleanup: Consider using the macro definitions for
channel and event config.

- Mani

> Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>  drivers/accel/qaic/mhi_controller.c | 360 ++++++++++++++++++++++++++--
>  drivers/accel/qaic/mhi_controller.h |   2 +-
>  drivers/accel/qaic/qaic.h           |   1 +
>  drivers/accel/qaic/qaic_drv.c       |  11 +-
>  drivers/accel/qaic/sahara.c         |  39 ++-
>  5 files changed, 395 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
> index 8ab82e78dd94..13a14c6c6168 100644
> --- a/drivers/accel/qaic/mhi_controller.c
> +++ b/drivers/accel/qaic/mhi_controller.c
> @@ -20,6 +20,11 @@ static unsigned int mhi_timeout_ms = 2000; /* 2 sec default */
>  module_param(mhi_timeout_ms, uint, 0600);
>  MODULE_PARM_DESC(mhi_timeout_ms, "MHI controller timeout value");
>  
> +static const char *fw_image_paths[FAMILY_MAX] = {
> +	[FAMILY_AIC100] = "qcom/aic100/sbl.bin",
> +	[FAMILY_AIC200] = "qcom/aic200/sbl.bin",
> +};
> +
>  static const struct mhi_channel_config aic100_channels[] = {
>  	{
>  		.name = "QAIC_LOOPBACK",
> @@ -439,6 +444,297 @@ static const struct mhi_channel_config aic100_channels[] = {
>  	},
>  };
>  
> +static const struct mhi_channel_config aic200_channels[] = {
> +	{
> +		.name = "QAIC_LOOPBACK",
> +		.num = 0,
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
> +		.name = "QAIC_LOOPBACK",
> +		.num = 1,
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
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 2,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SAHARA",
> +		.num = 3,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_SSR",
> +		.num = 6,
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
> +		.name = "QAIC_SSR",
> +		.num = 7,
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
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_CONTROL",
> +		.num = 10,
> +		.num_elements = 128,
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
> +		.name = "QAIC_CONTROL",
> +		.num = 11,
> +		.num_elements = 128,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
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
> +		.name = "QAIC_LOGGING",
> +		.num = 12,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_TO_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_LOGGING",
> +		.num = 13,
> +		.num_elements = 32,
> +		.local_elements = 0,
> +		.event_ring = 0,
> +		.dir = DMA_FROM_DEVICE,
> +		.ee_mask = MHI_CH_EE_SBL,
> +		.pollcfg = 0,
> +		.doorbell = MHI_DB_BRST_DISABLE,
> +		.lpm_notify = false,
> +		.offload_channel = false,
> +		.doorbell_mode_switch = false,
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_STATUS",
> +		.num = 14,
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
> +		.name = "QAIC_STATUS",
> +		.num = 15,
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
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TELEMETRY",
> +		.num = 16,
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
> +		.name = "QAIC_TELEMETRY",
> +		.num = 17,
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
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
> +	{
> +		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 22,
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
> +		.name = "QAIC_TIMESYNC_PERIODIC",
> +		.num = 23,
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
> +		.auto_queue = false,
> +		.wake_capable = false,
> +	},
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
> +};
> +
>  static struct mhi_event_config aic100_events[] = {
>  	{
>  		.num_elements = 32,
> @@ -454,16 +750,44 @@ static struct mhi_event_config aic100_events[] = {
>  	},
>  };
>  
> -static struct mhi_controller_config aic100_config = {
> -	.max_channels = 128,
> -	.timeout_ms = 0, /* controlled by mhi_timeout */
> -	.buf_len = 0,
> -	.num_channels = ARRAY_SIZE(aic100_channels),
> -	.ch_cfg = aic100_channels,
> -	.num_events = ARRAY_SIZE(aic100_events),
> -	.event_cfg = aic100_events,
> -	.use_bounce_buf = false,
> -	.m2_no_db = false,
> +static struct mhi_event_config aic200_events[] = {
> +	{
> +		.num_elements = 32,
> +		.irq_moderation_ms = 0,
> +		.irq = 0,
> +		.channel = U32_MAX,
> +		.priority = 1,
> +		.mode = MHI_DB_BRST_DISABLE,
> +		.data_type = MHI_ER_CTRL,
> +		.hardware_event = false,
> +		.client_managed = false,
> +		.offload_channel = false,
> +	},
> +};
> +
> +static struct mhi_controller_config mhi_cntrl_configs[] = {
> +	[FAMILY_AIC100] = {
> +		.max_channels = 128,
> +		.timeout_ms = 0, /* controlled by mhi_timeout */
> +		.buf_len = 0,
> +		.num_channels = ARRAY_SIZE(aic100_channels),
> +		.ch_cfg = aic100_channels,
> +		.num_events = ARRAY_SIZE(aic100_events),
> +		.event_cfg = aic100_events,
> +		.use_bounce_buf = false,
> +		.m2_no_db = false,
> +	},
> +	[FAMILY_AIC200] = {
> +		.max_channels = 128,
> +		.timeout_ms = 0, /* controlled by mhi_timeout */
> +		.buf_len = 0,
> +		.num_channels = ARRAY_SIZE(aic200_channels),
> +		.ch_cfg = aic200_channels,
> +		.num_events = ARRAY_SIZE(aic200_events),
> +		.event_cfg = aic200_events,
> +		.use_bounce_buf = false,
> +		.m2_no_db = false,
> +	},
>  };
>  
>  static int mhi_read_reg(struct mhi_controller *mhi_cntrl, void __iomem *addr, u32 *out)
> @@ -545,8 +869,9 @@ static int mhi_reset_and_async_power_up(struct mhi_controller *mhi_cntrl)
>  }
>  
>  struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> -						    int mhi_irq, bool shared_msi)
> +						    int mhi_irq, bool shared_msi, int family)
>  {
> +	struct mhi_controller_config mhi_config = mhi_cntrl_configs[family];
>  	struct mhi_controller *mhi_cntrl;
>  	int ret;
>  
> @@ -581,11 +906,18 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>  	if (shared_msi) /* MSI shared with data path, no IRQF_NO_SUSPEND */
>  		mhi_cntrl->irq_flags = IRQF_SHARED;
>  
> -	mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
> +	mhi_cntrl->fw_image = fw_image_paths[family];
> +
> +	if (family == FAMILY_AIC200) {
> +		mhi_cntrl->name = "AIC200";
> +		mhi_cntrl->seg_len = SZ_512K;
> +	} else {
> +		mhi_cntrl->name = "AIC100";
> +	}
>  
>  	/* use latest configured timeout */
> -	aic100_config.timeout_ms = mhi_timeout_ms;
> -	ret = mhi_register_controller(mhi_cntrl, &aic100_config);
> +	mhi_config.timeout_ms = mhi_timeout_ms;
> +	ret = mhi_register_controller(mhi_cntrl, &mhi_config);
>  	if (ret) {
>  		pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>  		return ERR_PTR(ret);
> diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
> index 500e7f4af2af..8939f6ae185e 100644
> --- a/drivers/accel/qaic/mhi_controller.h
> +++ b/drivers/accel/qaic/mhi_controller.h
> @@ -8,7 +8,7 @@
>  #define MHICONTROLLERQAIC_H_
>  
>  struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev, void __iomem *mhi_bar,
> -						    int mhi_irq, bool shared_msi);
> +						    int mhi_irq, bool shared_msi, int family);
>  void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up);
>  void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>  void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
> index cf97fd9a7e70..0dbb8e32e4b9 100644
> --- a/drivers/accel/qaic/qaic.h
> +++ b/drivers/accel/qaic/qaic.h
> @@ -34,6 +34,7 @@
>  
>  enum aic_families {
>  	FAMILY_AIC100,
> +	FAMILY_AIC200,
>  	FAMILY_MAX,
>  };
>  
> diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
> index 4e63e475b389..3b415e2c9431 100644
> --- a/drivers/accel/qaic/qaic_drv.c
> +++ b/drivers/accel/qaic/qaic_drv.c
> @@ -36,6 +36,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>  
>  #define PCI_DEVICE_ID_QCOM_AIC080	0xa080
>  #define PCI_DEVICE_ID_QCOM_AIC100	0xa100
> +#define PCI_DEVICE_ID_QCOM_AIC200	0xa110
>  #define QAIC_NAME			"qaic"
>  #define QAIC_DESC			"Qualcomm Cloud AI Accelerators"
>  #define CNTL_MAJOR			5
> @@ -66,6 +67,13 @@ static const struct qaic_device_config aic100_config = {
>  	.dbc_bar_idx = 2,
>  };
>  
> +static const struct qaic_device_config aic200_config = {
> +	.family = FAMILY_AIC200,
> +	.bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
> +	.mhi_bar_idx = 1,
> +	.dbc_bar_idx = 2,
> +};
> +
>  bool datapath_polling;
>  module_param(datapath_polling, bool, 0400);
>  MODULE_PARM_DESC(datapath_polling, "Operate the datapath in polling mode");
> @@ -568,7 +576,7 @@ static int qaic_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		return ret;
>  
>  	qdev->mhi_cntrl = qaic_mhi_register_controller(pdev, qdev->bar_mhi, mhi_irq,
> -						       qdev->single_msi);
> +						       qdev->single_msi, config->family);
>  	if (IS_ERR(qdev->mhi_cntrl)) {
>  		ret = PTR_ERR(qdev->mhi_cntrl);
>  		qaic_destroy_drm_device(qdev, QAIC_NO_PARTITION);
> @@ -637,6 +645,7 @@ static struct mhi_driver qaic_mhi_driver = {
>  static const struct pci_device_id qaic_ids[] = {
>  	{ PCI_DEVICE_DATA(QCOM, AIC080, (kernel_ulong_t)&aic080_config), },
>  	{ PCI_DEVICE_DATA(QCOM, AIC100, (kernel_ulong_t)&aic100_config), },
> +	{ PCI_DEVICE_DATA(QCOM, AIC200, (kernel_ulong_t)&aic200_config), },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(pci, qaic_ids);
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 09c8b055aa81..3ebcc1f7ff58 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -188,6 +188,34 @@ static const char * const aic100_image_table[] = {
>  	[10] = "qcom/aic100/fw10.bin",
>  };
>  
> +static const char * const aic200_image_table[] = {
> +	[5]  = "qcom/aic200/uefi.elf",
> +	[12] = "qcom/aic200/aic200-nsp.bin",
> +	[23] = "qcom/aic200/aop.mbn",
> +	[32] = "qcom/aic200/tz.mbn",
> +	[33] = "qcom/aic200/hypvm.mbn",
> +	[39] = "qcom/aic200/aic200_abl.elf",
> +	[40] = "qcom/aic200/apdp.mbn",
> +	[41] = "qcom/aic200/devcfg.mbn",
> +	[42] = "qcom/aic200/sec.elf",
> +	[43] = "qcom/aic200/aic200-hlos.elf",
> +	[49] = "qcom/aic200/shrm.elf",
> +	[50] = "qcom/aic200/cpucp.elf",
> +	[51] = "qcom/aic200/aop_devcfg.mbn",
> +	[57] = "qcom/aic200/cpucp_dtbs.elf",
> +	[62] = "qcom/aic200/uefi_dtbs.elf",
> +	[63] = "qcom/aic200/xbl_ac_config.mbn",
> +	[64] = "qcom/aic200/tz_ac_config.mbn",
> +	[65] = "qcom/aic200/hyp_ac_config.mbn",
> +	[66] = "qcom/aic200/pdp.elf",
> +	[67] = "qcom/aic200/pdp_cdb.elf",
> +	[68] = "qcom/aic200/sdi.mbn",
> +	[69] = "qcom/aic200/dcd.mbn",
> +	[73] = "qcom/aic200/gearvm.mbn",
> +	[74] = "qcom/aic200/sti.bin",
> +	[75] = "qcom/aic200/pvs.bin",
> +};
> +
>  static int sahara_find_image(struct sahara_context *context, u32 image_id)
>  {
>  	int ret;
> @@ -748,8 +776,15 @@ static int sahara_mhi_probe(struct mhi_device *mhi_dev, const struct mhi_device_
>  	context->mhi_dev = mhi_dev;
>  	INIT_WORK(&context->fw_work, sahara_processing);
>  	INIT_WORK(&context->dump_work, sahara_dump_processing);
> -	context->image_table = aic100_image_table;
> -	context->table_size = ARRAY_SIZE(aic100_image_table);
> +
> +	if (!strcmp(mhi_dev->mhi_cntrl->name, "AIC200")) {
> +		context->image_table = aic200_image_table;
> +		context->table_size = ARRAY_SIZE(aic200_image_table);
> +	} else {
> +		context->image_table = aic100_image_table;
> +		context->table_size = ARRAY_SIZE(aic100_image_table);
> +	}
> +
>  	context->active_image_id = SAHARA_IMAGE_ID_NONE;
>  	dev_set_drvdata(&mhi_dev->dev, context);
>  
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
