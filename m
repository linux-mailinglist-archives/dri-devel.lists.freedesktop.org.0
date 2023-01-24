Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F528679D24
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 16:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE27A10E6A9;
	Tue, 24 Jan 2023 15:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E2110E6AB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 15:15:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e3so14182576wru.13
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MLfhNxWlZAeQhqbXIl0WJDqT0bu46FmS2hyV9MEP+y8=;
 b=cSpDyZFmqKTE1LUu90OOSz0mHHn82WjSe+S0UdKb6VZJ3XyTz+eavrWNxdh0o7wcnN
 wp334lWd+OHBcDyxuoFC+m5ErEOgimr1jZ0rO7seAIAGA4wxxU0Q9Xv5ph/+qYdv67Jx
 y/qVLaxDkSaBswFztw5e1j6aqJUBcCEqBHua0zTXcRLQ34Ixdhk9Bi9GxsOCdJERFXO8
 KFG9zcPByHBdJSyV7bzGReb4oF0W1KtTk+cPkS7f2+WZxpEEKKfkTIOmJxv0CZjY/fKs
 0HPExl9sZ9Km5RmDMw8mLBkD6zL82zFlCmuEifJJGa6ohOuuyAQtwke1oICzUKyTvOFi
 0ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MLfhNxWlZAeQhqbXIl0WJDqT0bu46FmS2hyV9MEP+y8=;
 b=sXpskLkZyPTxMcSaK7xjEgp4Tx4DHYu18LOmp6S4jYT4RnQNBgoxV+R19RXTuZn4R+
 Md/bCjK4RrYqkd3ghg+27hBvPiHv2xizuKRT+JeLprSpouyCO3Kznsyl9tOSBsSE19m2
 JSerhB/qn+O4Ug2Z2JTiFPjtDfVb+7bfjINSJ8iT/qicP1am2kvjf2NUaOSian4/hYXz
 2m6zRITU3s9etEHkFno7QIn1w0ZUwb/EcSYmFsram0WWqmHGcHdGtrHnCZ/G90KvWHge
 deF0QgQX+4oNjcsbS/aysP1u+mnu8diz47iDoUYM/pDbSLVwFdTuKSkhJX7amXPB06tD
 IiEQ==
X-Gm-Message-State: AFqh2kp2kdjhaxqkU7TWi2yhiM7K/RyEzqZhyR7BvfpVVLm2PhogAyTR
 P2S/EE5lIZt6dcY6lMYHODV4ag==
X-Google-Smtp-Source: AMrXdXuXRd2oWrmtppukxku/3yXVUekA2RQXr8B5Pa2WOg7dGNIHzZfa0DJ8/3fqsVbudDVLmAMRgQ==
X-Received: by 2002:a5d:568f:0:b0:24f:11cc:86b7 with SMTP id
 f15-20020a5d568f000000b0024f11cc86b7mr23469414wrv.41.1674573336012; 
 Tue, 24 Jan 2023 07:15:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:ebd2:15b:f444:7985?
 ([2a01:e0a:982:cbb0:ebd2:15b:f444:7985])
 by smtp.gmail.com with ESMTPSA id
 z8-20020adfd0c8000000b002bcaa47bf78sm2082748wrh.26.2023.01.24.07.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 07:15:35 -0800 (PST)
Message-ID: <e4508d96-a6ff-7c26-9b3c-9f37ef5d541a@linaro.org>
Date: Tue, 24 Jan 2023 16:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 06/14] drm/msm/dp: add display compression related
 struct
Content-Language: en-US
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, dmitry.baryshkov@linaro.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-7-git-send-email-quic_khsieh@quicinc.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <1674498274-6010-7-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 19:24, Kuogee Hsieh wrote:
> Add display compression related struct to support variant compression
> mechanism. However, DSC is the only one supported at this moment.
> VDC may be added later.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_panel.h | 42 ++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h     | 89 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 131 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 1153e88..4c45d51 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -21,12 +21,54 @@ struct edid;
>   #define DP_DOWNSTREAM_PORTS		4
>   #define DP_DOWNSTREAM_CAP_SIZE		4
>   
> +
> +#define DP_PANEL_CAPS_DSC	BIT(0)
> +
> +enum dp_output_format {
> +	DP_OUTPUT_FORMAT_RGB,
> +	DP_OUTPUT_FORMAT_YCBCR420,
> +	DP_OUTPUT_FORMAT_YCBCR422,
> +	DP_OUTPUT_FORMAT_YCBCR444,
> +	DP_OUTPUT_FORMAT_INVALID,
> +};
> +
> +
> +struct dp_panel_info {
> +	u32 h_active;
> +	u32 v_active;
> +	u32 h_back_porch;
> +	u32 h_front_porch;
> +	u32 h_sync_width;
> +	u32 h_active_low;
> +	u32 v_back_porch;
> +	u32 v_front_porch;
> +	u32 v_sync_width;
> +	u32 v_active_low;
> +	u32 h_skew;
> +	u32 refresh_rate;
> +	u32 pixel_clk_khz;
> +	u32 bpp;
> +	bool widebus_en;
> +	struct msm_compression_info comp_info;
> +	s64 dsc_overhead_fp;
> +};
> +
>   struct dp_display_mode {
>   	struct drm_display_mode drm_mode;
> +	struct dp_panel_info timing;
>   	u32 capabilities;
> +	s64 fec_overhead_fp;
> +	s64 dsc_overhead_fp;
>   	u32 bpp;
>   	u32 h_active_low;
>   	u32 v_active_low;
> +	/**
> +	 * @output_format:
> +	 *
> +	 * This is used to indicate DP output format.
> +	 * The output format can be read from drm_mode.
> +	 */
> +	enum dp_output_format output_format;
>   };
>   
>   struct dp_panel_in {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 9f0c184..f155803 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    * Copyright (C) 2013 Red Hat
>    * Author: Rob Clark <robdclark@gmail.com>
>    */
> @@ -70,6 +71,16 @@ enum msm_dp_controller {
>   #define MAX_H_TILES_PER_DISPLAY 2
>   
>   /**
> + * enum msm_display_compression_type - compression method used for pixel stream
> + * @MSM_DISPLAY_COMPRESSION_NONE:     Pixel data is not compressed
> + * @MSM_DISPLAY_COMPRESSION_DSC:      DSC compresison is used
> + */
> +enum msm_display_compression_type {
> +	MSM_DISPLAY_COMPRESSION_NONE,
> +	MSM_DISPLAY_COMPRESSION_DSC,
> +};
> +
> +/**
>    * enum msm_event_wait - type of HW events to wait for
>    * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
>    * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
> @@ -82,6 +93,84 @@ enum msm_event_wait {
>   };
>   
>   /**
> + * struct msm_display_dsc_info - defines dsc configuration
> + * @config                   DSC encoder configuration
> + * @scr_rev:                 DSC revision.
> + * @initial_lines:           Number of initial lines stored in encoder.
> + * @pkt_per_line:            Number of packets per line.
> + * @bytes_in_slice:          Number of bytes in slice.
> + * @eol_byte_num:            Valid bytes at the end of line.
> + * @bytes_per_pkt            Number of bytes in DSI packet
> + * @pclk_per_line:           Compressed width.
> + * @slice_last_group_size:   Size of last group in pixels.
> + * @slice_per_pkt:           Number of slices per packet.
> + * @num_active_ss_per_enc:   Number of active soft slices per encoder.
> + * @source_color_space:      Source color space of DSC encoder
> + * @chroma_format:           Chroma_format of DSC encoder.
> + * @det_thresh_flatness:     Flatness threshold.
> + * @extra_width:             Extra width required in timing calculations.
> + * @pps_delay_ms:            Post PPS command delay in milliseconds.
> + * @dsc_4hsmerge_en:         Using DSC 4HS merge topology
> + * @dsc_4hsmerge_padding     4HS merge DSC pair padding value in bytes
> + * @dsc_4hsmerge_alignment   4HS merge DSC alignment value in bytes
> + * @half_panel_pu            True for single and dual dsc encoders if partial
> + *                           update sets the roi width to half of mode width
> + *                           False in all other cases
> + */
> +struct msm_display_dsc_info {
> +	struct drm_dsc_config drm_dsc;
> +	u8 scr_rev;
> +
> +	int initial_lines;
> +	int pkt_per_line;
> +	int bytes_in_slice;
> +	int bytes_per_pkt;
> +	int eol_byte_num;
> +	int pclk_per_line;
> +	int slice_last_group_size;
> +	int slice_per_pkt;
> +	int num_active_ss_per_enc;
> +	int source_color_space;
> +	int chroma_format;
> +	int det_thresh_flatness;
> +	u32 extra_width;
> +	u32 pps_delay_ms;
> +	bool dsc_4hsmerge_en;
> +	u32 dsc_4hsmerge_padding;
> +	u32 dsc_4hsmerge_alignment;
> +	bool half_panel_pu;
> +};
> +
> +/*
> + * conver from struct drm_dsc_config to struct msm_display_dsc_info
> + */
> +#define to_msm_dsc_info(dsc) container_of((dsc), struct msm_display_dsc_info, drm_dsc)

This is weird, you consider dsc struct is in control of dpu, but no with DSC it's part
of the DSI panel struct.

msm_display_dsc_info->drm_dsc should be a pointer.

If some values caculated in msm_display_dsc_info are *really* needed, then a new structure
should be added, but as a companion of the dsm dsc pointer, not containing it.

> +
> +/**
> + * Bits/pixel target >> 4  (removing the fractional bits)
> + * returns the integer bpp value from the drm_dsc_config struct
> + */
> +#define DSC_BPP(config) ((config).bits_per_pixel >> 4)
> +
> +/**
> + * struct msm_compression_info - defined panel compression
> + * @enabled:          enabled/disabled
> + * @comp_type:        type of compression supported
> + * @comp_ratio:       compression ratio
> + * @src_bpp:          bits per pixel before compression
> + * @tgt_bpp:          bits per pixel after compression
> + * @msm_dsc_info:     msm dsc info if the compression supported is DSC
> + */
> +struct msm_compression_info {
> +	bool enabled;

I would rather use comp_type = MSM_DISPLAY_COMPRESSION_NONE instead of having a supplementary bool....

> +	enum msm_display_compression_type comp_type;
> +	u32 comp_ratio;
> +	u32 src_bpp;
> +	u32 tgt_bpp;

Those are never used outside of dp, so get them out.

> +	struct msm_display_dsc_info msm_dsc_info;
> +};
> +
> +/**
>    * struct msm_display_topology - defines a display topology pipeline
>    * @num_lm:       number of layer mixers used
>    * @num_intf:     number of interfaces the panel is mounted on

