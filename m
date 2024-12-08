Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7675F9E83C5
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 07:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5347C10E3FA;
	Sun,  8 Dec 2024 06:13:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wkYCVIJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744EE10E31A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 06:13:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53f757134cdso635173e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 22:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733638423; x=1734243223; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Xh5h1+X8dlciqQ+QDklkZr3hyINk8+1Vx/kElDUH7P0=;
 b=wkYCVIJVhIOztvAl0jHCt/4FO5RtVbasS9XHYYwbwNIx7EfVWPZKhLidoO3L/+578N
 ngnc058sMh/9TMJu5AOYC5DCNMOE5bMNsXyaqHq9WWQmKKJZpLjblIssYpS32cVjHjqu
 5U5wEt6/yafqks2arb7qvwYmuE2RW4X34XXLknC43ZXmpj/s1Le9fnNLbSIdY8BoezwD
 NVbhfXxLgm08//4EVTWNzIZB3Ni2fJyfw0XA1Jw3qOfS3OHnmJDmjMi79S9BoVXbs7uF
 STPYW2F0BQs7udrFz7kVoSwtItittxVBQZ5fslxX4ZlpRDBlChwQB3FMDRZQhwwnHr8n
 hBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733638424; x=1734243224;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xh5h1+X8dlciqQ+QDklkZr3hyINk8+1Vx/kElDUH7P0=;
 b=Nsfy1iTTRlSQ+BQTiM0MjijvSbdxxXPN68frOrbDm9vFTZ5qXvu8IspBTwh4uUVMy3
 XaV3tJCdguAMQj7r8RQwUfxc6p0xMe61di4SCrFxUkyY+pdhCD3d9ZiKF6eRUhr6gZ+t
 o7t//A7ldv9wR1TbQ8GnXTTWv1dljEZWW78/q11f1iPLtIZtdyNMke7ctn0LBNtwcT/P
 RvlwajNpCxUNIStWVFEU1X8io+IvTCETmnKkQRSplFPI/uUEHrrril+OggwWkeqTABQB
 /gZ6xRJx9mIorbEKMH0w/3nKVOYcank7zfWGT1qHqEfdNlHcLbERYIhc1u/YSro/I7ZE
 pGsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZYQTMcEpIDHI8X8MxkHWPbYggrdnIwc6/UQCNhvzB6b5bF/LWHqMGdK+Ev6+Pv1QMmhw8/KR1BPM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4VFERFlTHgt8KaXCSzEugbDvkdeqaxQFyl16jiBqpOi03xDr9
 /QWfde3ssNnoYkcoRVNXRYMQjZ7FafirqbAuMf+nCHc3zabKvvDdRKq5G7S9WM0=
X-Gm-Gg: ASbGncu7sqxE2Eyqkj8C++V1TOIFV+DvY5PbocDhGlkxI8+Gz2Iuv6XLvr6coHH6JOB
 dLNfhXQxC+qI4qp98wjWj9a6Of+iOfi8TCN+mdK95cjrLNcFoIcsvLzkzW/VwGPgTRJx7hjAy1/
 ijOgvr0GDWlMih1U8x7skwVX+4CoBd4NPg7zR1sIWcbOPKMevVHgU7WYnh7VdlS+IOf4/0863r1
 NUeBWh9GQ7bvmhkiKVJteB9tqhdoMOXqKfkzi8VG5403qw7JGhRGZNUXNF/xduvl2I5WgkW7J1U
 RQU+ccaV0NtiHIU3Vprmf+uj08JzSA==
X-Google-Smtp-Source: AGHT+IGpphTHLfHX1jqQa+hOi9BEk6kgr/nyMZAnf083qv7il41stIiCcu8QmsN5TG7we4h6J6WvRQ==
X-Received: by 2002:a05:6512:128b:b0:53e:3a94:c2bc with SMTP id
 2adb3069b0e04-53e3a94c305mr1521632e87.18.1733638423464; 
 Sat, 07 Dec 2024 22:13:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm54571e87.58.2024.12.07.22.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 22:13:42 -0800 (PST)
Date: Sun, 8 Dec 2024 08:13:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 21/45] drm/msm/dp: add support for mst channel slot
 allocation
Message-ID: <nw4xqmzafwz2jaq4ognliqcmdpn7psbtbkphz65yqhrxetyy4j@3lhiilbxhui3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-21-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-21-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:52PM -0800, Abhinav Kumar wrote:
> For DP MST streams, the 64 MTP slots are time-shared between
> the streams. Add the support to calculate the rate governor,
> slots and reservation of the slots to the DP controller. Each
> DP MST stream shall reserve its streams by calling the
> dp_display_set_stream_info() from its bridge calls.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  77 +++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |   7 ++
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 148 ++++++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   7 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  33 ++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |   5 +-
>  drivers/gpu/drm/msm/dp/dp_panel.h   |   7 ++
>  drivers/gpu/drm/msm/dp/dp_reg.h     |   6 ++
>  8 files changed, 276 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index bdc66e5cab640c351708ba1a1bc3bca21784df6e..f9d21444d7891bcd043d282b31ae75711add4817 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1116,6 +1116,83 @@ bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *msm_dp_catalog)
>  	return msm_dp_read_link(catalog, REG_DP_MST_ACT);
>  }
>  
> +void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *msm_dp_catalog,
> +				      u32 ch, u32 ch_start_slot, u32 tot_slot_cnt)
> +{
> +	struct msm_dp_catalog_private *catalog;
> +	u32 i, slot_reg_1, slot_reg_2, slot;
> +	u32 reg_off = 0;
> +	int const num_slots_per_reg = 32;
> +
> +	if (!msm_dp_catalog || ch >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid input. ch %d\n", ch);
> +		return;
> +	}
> +
> +	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
> +	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
> +		DRM_ERROR("invalid slots start %d, tot %d\n",
> +			  ch_start_slot, tot_slot_cnt);
> +		return;
> +	}

This should be handled by the generic MST code.

> +
> +	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
> +
> +	drm_dbg_dp(catalog->drm_dev, "ch %d, start_slot %d, tot_slot %d\n",
> +		   ch, ch_start_slot, tot_slot_cnt);
> +
> +	if (ch == DP_STREAM_1)
> +		reg_off = REG_DP_DP1_TIMESLOT_1_32 - REG_DP_DP0_TIMESLOT_1_32;
> +
> +	slot_reg_1 = 0;
> +	slot_reg_2 = 0;
> +
> +	if (ch_start_slot && tot_slot_cnt) {
> +		ch_start_slot--;
> +		for (i = 0; i < tot_slot_cnt; i++) {
> +			if (ch_start_slot < num_slots_per_reg) {
> +				slot_reg_1 |= BIT(ch_start_slot);
> +			} else {
> +				slot = ch_start_slot - num_slots_per_reg;
> +				slot_reg_2 |= BIT(slot);
> +			}
> +			ch_start_slot++;
> +		}
> +	}
> +
> +	drm_dbg_dp(catalog->drm_dev, "ch:%d slot_reg_1:%d, slot_reg_2:%d\n", ch,
> +		   slot_reg_1, slot_reg_2);
> +
> +	msm_dp_write_link(catalog, REG_DP_DP0_TIMESLOT_1_32 + reg_off, slot_reg_1);
> +	msm_dp_write_link(catalog, REG_DP_DP0_TIMESLOT_33_63 + reg_off, slot_reg_2);

The more I look at the msm_dp_write_link(catalog, REG_DP_foo +
reg_offset), more I think that the I'd prefer to have explicit
(stream_id == STREAM_1 ?  REG_DP_DP1_TIMESLOT_1_32 :
REG_DP_DP0_TIMESLOT_1_32). There is a difference between selecting the
offset between two register spaces and overusing offset-like model to
select between two registers.

> +}
> +
> +void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *msm_dp_catalog, u32 stream,
> +				   u32 x_int, u32 y_frac_enum)
> +{
> +	struct msm_dp_catalog_private *catalog;
> +
> +	u32 rg, reg_off = 0;
> +
> +	if (!msm_dp_catalog || stream >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid input. stream %d\n", stream);
> +		return;
> +	}
> +
> +	catalog = container_of(msm_dp_catalog, struct msm_dp_catalog_private, msm_dp_catalog);
> +
> +	rg = y_frac_enum;
> +	rg |= (x_int << 16);
> +
> +	drm_dbg_dp(catalog->drm_dev, "stream: %d x_int:%d y_frac_enum:%d rg:%d\n",
> +		   stream, x_int, y_frac_enum, rg);
> +
> +	if (stream == DP_STREAM_1)
> +		reg_off = REG_DP_DP1_RG - REG_DP_DP0_RG;
> +
> +	msm_dp_write_link(catalog, REG_DP_DP0_RG + reg_off, rg);
> +}
> +
>  void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
>  				struct drm_display_mode *drm_mode)
>  {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 07284f484e2861aeae12b115cd05a94afed1c9cb..560016e2f929d4b92d6ea764d81a099c09c0e668 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -31,6 +31,8 @@
>  #define DP_HW_VERSION_1_0	0x10000000
>  #define DP_HW_VERSION_1_2	0x10020000
>  
> +#define DP_MAX_TIME_SLOTS 64

Doesn't it depend on the encoding format?

> +
>  enum msm_dp_catalog_audio_sdp_type {
>  	DP_AUDIO_SDP_STREAM,
>  	DP_AUDIO_SDP_TIMESTAMP,
> @@ -140,4 +142,9 @@ void msm_dp_catalog_trigger_act(struct msm_dp_catalog *dp_catalog);
>  bool msm_dp_catalog_read_act_complete_sts(struct msm_dp_catalog *dp_catalog);
>  void msm_dp_catalog_mst_config(struct msm_dp_catalog *dp_catalog, bool enable);
>  
> +void msm_dp_catalog_mst_channel_alloc(struct msm_dp_catalog *ctrl,
> +				      u32 ch, u32 ch_start_slot, u32 tot_slot_cnt);
> +void msm_dp_catalog_ctrl_update_rg(struct msm_dp_catalog *ctrl, u32 stream,
> +				   u32 x_int, u32 y_frac_enum);
> +
>  #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 1c313cf33f398dffc2ad349d7d1bc995fb4b45b3..14562def1e70b769434243d1ce72661a7b4d4c6b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -69,6 +69,11 @@ struct msm_dp_vc_tu_mapping_table {
>  	u8 tu_size_minus1;
>  };
>  
> +struct msm_dp_mst_ch_slot_info {
> +	u32 start_slot;
> +	u32 tot_slots;
> +};
> +
>  struct msm_dp_ctrl_private {
>  	struct msm_dp_ctrl msm_dp_ctrl;
>  	struct drm_device *drm_dev;
> @@ -100,6 +105,8 @@ struct msm_dp_ctrl_private {
>  
>  	bool mst_active;
>  	bool stream_clks_on[DP_STREAM_MAX];
> +
> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>  };
>  
>  static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> @@ -2021,7 +2028,103 @@ int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl, bool force_li
>  	return ret;
>  }
>  
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel)
> +static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
> +					 struct msm_dp_panel *panel,
> +					 u32 *p_x_int, u32 *p_y_frac_enum)
> +{
> +	u64 min_slot_cnt, max_slot_cnt;
> +	u64 raw_target_sc, target_sc_fixp;
> +	u64 ts_denom, ts_enum, ts_int;
> +	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
> +	u64 lclk = 0;
> +	u64 lanes = ctrl->link->link_params.num_lanes;
> +	u64 bpp = panel->msm_dp_mode.bpp;
> +	u64 pbn = panel->mst_caps.pbn;
> +	u64 numerator, denominator, temp, temp1, temp2;
> +	u32 x_int = 0, y_frac_enum = 0;
> +	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
> +
> +	lclk = ctrl->link->link_params.rate;
> +
> +	/* min_slot_cnt */
> +	numerator = pclk * bpp * 64 * 1000;
> +	denominator = lclk * lanes * 8 * 1000;
> +	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
> +
> +	/* max_slot_cnt */
> +	numerator = pbn * 54 * 1000;
> +	denominator = lclk * lanes;
> +	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
> +
> +	/* raw_target_sc */
> +	numerator = max_slot_cnt + min_slot_cnt;
> +	denominator = drm_fixp_from_fraction(2, 1);
> +	raw_target_sc = drm_fixp_div(numerator, denominator);
> +
> +	/* target_sc */
> +	temp = drm_fixp_from_fraction(256 * lanes, 1);
> +	numerator = drm_fixp_mul(raw_target_sc, temp);
> +	denominator = drm_fixp_from_fraction(256 * lanes, 1);
> +	target_sc_fixp = drm_fixp_div(numerator, denominator);
> +
> +	ts_enum = 256 * lanes;
> +	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
> +	ts_int = drm_fixp2int(target_sc_fixp);
> +
> +	temp = drm_fixp2int_ceil(raw_target_sc);
> +	if (temp != ts_int) {
> +		temp = drm_fixp_from_fraction(ts_int, 1);
> +		temp1 = raw_target_sc - temp;
> +		temp2 = drm_fixp_mul(temp1, ts_denom);
> +		ts_enum = drm_fixp2int(temp2);
> +	}
> +
> +	/* target_strm_sym */
> +	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
> +	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
> +	temp = ts_int_fixp + ts_frac_fixp;
> +	temp1 = drm_fixp_from_fraction(lanes, 1);
> +	target_strm_sym = drm_fixp_mul(temp, temp1);
> +
> +	/* x_int */
> +	x_int = drm_fixp2int(target_strm_sym);
> +
> +	/* y_enum_frac */
> +	temp = drm_fixp_from_fraction(x_int, 1);
> +	temp1 = target_strm_sym - temp;
> +	temp2 = drm_fixp_from_fraction(256, 1);
> +	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
> +
> +	temp1 = drm_fixp2int(y_frac_enum_fixp);
> +	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
> +
> +	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
> +
> +	*p_x_int = x_int;
> +	*p_y_frac_enum = y_frac_enum;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "mst lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
> +		   lanes, lclk, x_int, y_frac_enum);
> +}
> +
> +static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
> +					 struct msm_dp_panel *panel,
> +					 u32 max_streams)
> +{
> +	u32 x_int, y_frac_enum;
> +
> +	drm_dbg_dp(ctrl->drm_dev, "mst stream channel allocation\n");
> +
> +	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl, max_streams);
> +
> +	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);

Use S16.16 (or U16.16) instead and pass required value as is

> +
> +	msm_dp_catalog_ctrl_update_rg(ctrl->catalog, panel->stream_id,
> +				      x_int, y_frac_enum);
> +}
> +
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
> +			  struct msm_dp_panel *msm_dp_panel, u32 max_streams)
>  {
>  	int ret = 0;
>  	bool mainlink_ready = false;
> @@ -2063,6 +2166,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  	if (!ctrl->mst_active)
>  		msm_dp_ctrl_setup_tr_unit(ctrl);
>  
> +	if (ctrl->mst_active)
> +		msm_dp_ctrl_mst_stream_setup(ctrl, msm_dp_panel, max_streams);
> +
>  	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>  
>  	if (ctrl->mst_active)
> @@ -2143,13 +2249,45 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
>  	dev_pm_opp_set_rate(ctrl->dev, 0);
>  	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
>  
> -	DRM_DEBUG_DP("Before, phy=%p init_count=%d power_on=%d\n",
> -		phy, phy->init_count, phy->power_count);
> +	drm_dbg_dp(ctrl->drm_dev, "Before, phy=%p init_count=%d power_on=%d\n",
> +		   phy, phy->init_count, phy->power_count);
>  
>  	phy_power_off(phy);
>  
> -	DRM_DEBUG_DP("After, phy=%p init_count=%d power_on=%d\n",
> -		phy, phy->init_count, phy->power_count);
> +	drm_dbg_dp(ctrl->drm_dev, "After, phy=%p init_count=%d power_on=%d\n",
> +		   phy, phy->init_count, phy->power_count);
> +}
> +
> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
> +				      enum msm_dp_stream_id strm,
> +				      u32 start_slot, u32 tot_slots)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +
> +	if (!msm_dp_ctrl || strm >= DP_STREAM_MAX) {
> +		DRM_ERROR("invalid input\n");
> +		return;
> +	}
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	ctrl->mst_ch_info[strm].start_slot = start_slot;
> +	ctrl->mst_ch_info[strm].tot_slots = tot_slots;
> +}
> +
> +// TO-DO : Check if we can do a dealloc instead of this one during teardown
> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl, u32 max_streams)
> +{
> +	struct msm_dp_ctrl_private *ctrl;
> +	int i;
> +
> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> +
> +	for (i = DP_STREAM_0; i < max_streams; i++) {
> +		msm_dp_catalog_mst_channel_alloc(ctrl->catalog,
> +						 i, ctrl->mst_ch_info[i].start_slot,
> +						 ctrl->mst_ch_info[i].tot_slots);
> +	}
>  }
>  
>  irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 81c05b1b2baac63e1f1888f3f517e62a98e230a7..b126651da24b3abdaf540268758b37dca9fe1291 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -18,7 +18,8 @@ struct msm_dp_ctrl {
>  struct phy;
>  
>  int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl, bool mst_active);
> -int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *msm_dp_panel);
> +int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl,
> +			  struct msm_dp_panel *msm_dp_panel, u32 max_streams);
>  int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *dp_ctrl, bool force_link_train);
>  void msm_dp_ctrl_off_link_stream(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl);
> @@ -47,5 +48,9 @@ void msm_dp_ctrl_clear_vsc_sdp_pkt(struct msm_dp_ctrl *msm_dp_ctrl,
>  void msm_dp_ctrl_psm_config(struct msm_dp_ctrl *msm_dp_ctrl);
>  void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>  int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *ctrl);
> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl, u32 max_streams);
> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
> +				      enum msm_dp_stream_id strm,
> +				      u32 start_slot, u32 tot_slots);
>  
>  #endif /* _DP_CTRL_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e19860ef3493fb100afbf04b09d14a136fd6b887..2a4a79317153817cb24537ea95fad07c9bc20715 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -33,6 +33,8 @@ MODULE_PARM_DESC(psr_enabled, "enable PSR for eDP and DP displays");
>  
>  #define HPD_STRING_SIZE 30
>  
> +#define DEFAULT_STREAM_COUNT 1
> +
>  enum {
>  	ISR_DISCONNECTED,
>  	ISR_CONNECT_PENDING,
> @@ -95,6 +97,8 @@ struct msm_dp_display_private {
>  	/* wait for audio signaling */
>  	struct completion audio_comp;
>  
> +	unsigned int max_stream;
> +
>  	/* event related only access by event thread */
>  	struct mutex event_mutex;
>  	wait_queue_head_t event_q;
> @@ -875,7 +879,7 @@ static int msm_dp_display_enable(struct msm_dp_display_private *dp)
>  		return 0;
>  	}
>  
> -	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel);
> +	rc = msm_dp_ctrl_on_stream(dp->ctrl, dp->panel, dp->max_stream);
>  	if (!rc)
>  		msm_dp_display->power_on = true;
>  
> @@ -963,11 +967,14 @@ int msm_dp_display_set_plugged_cb(struct msm_dp *msm_dp_display,
>  	return 0;
>  }
>  
> -int msm_dp_display_set_stream_id(struct msm_dp *dp,
> -				 struct msm_dp_panel *panel, u32 strm_id)
> +int msm_dp_display_set_stream_info(struct msm_dp *dp,
> +				   struct msm_dp_panel *panel, u32 strm_id, u32 start_slot,
> +				   u32 num_slots, u32 pbn, int vcpi)

Where is this used with anything else than 0 start / num / pbn/ vcpi?

>  {
>  	int rc = 0;
>  	struct msm_dp_display_private *msm_dp_display;
> +	const int max_slots = 64;
> +
>  
>  	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>  
> @@ -981,8 +988,18 @@ int msm_dp_display_set_stream_id(struct msm_dp *dp,
>  		return -EINVAL;
>  	}
>  
> -	if (panel)
> +	if (start_slot + num_slots > max_slots) {
> +		DRM_ERROR("invalid channel info received. start:%d, slots:%d\n",
> +			  start_slot, num_slots);
> +		return -EINVAL;
> +	}
> +
> +	msm_dp_ctrl_set_mst_channel_info(msm_dp_display->ctrl, strm_id, start_slot, num_slots);
> +
> +	if (panel) {
>  		panel->stream_id = strm_id;
> +		panel->mst_caps.pbn = pbn;
> +	}
>  
>  	return rc;
>  }
> @@ -1370,6 +1387,7 @@ static int msm_dp_display_probe(struct platform_device *pdev)
>  	dp->msm_dp_display.is_edp =
>  		(dp->msm_dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
>  
> +	dp->max_stream = DEFAULT_STREAM_COUNT;
>  	rc = msm_dp_init_sub_modules(dp);
>  	if (rc) {
>  		DRM_ERROR("init sub module failed\n");
> @@ -1602,7 +1620,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp)
>  
>  	mutex_lock(&msm_dp_display->event_mutex);
>  
> -	msm_dp_display_set_stream_id(dp, msm_dp_display->panel, 0);
> +	msm_dp_display_set_stream_info(dp, msm_dp_display->panel, 0, 0, 0, 0, 0);
>  
>  	if (dp->prepared) {
>  		rc = msm_dp_display_enable(msm_dp_display);
> @@ -1630,8 +1648,11 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>  
>  	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>  
> -	if (dp->mst_active)
> +	if (msm_dp_display->max_stream > DEFAULT_STREAM_COUNT) {

Why? I liked the previous condition more. There is no connection between
_default_ and supporting only SST.

> +		msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl,
> +							  msm_dp_display->max_stream);
>  		msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl);
> +	}
>  }
>  
>  static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index 38ca25491b1ccfd95e027a9c8f659abb3cd576d3..258c240de580b634c05cf5895a8e52160449eba1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -53,7 +53,8 @@ void msm_dp_display_mode_set(struct msm_dp *dp,
>  enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>  					       const struct drm_display_info *info,
>  					       const struct drm_display_mode *mode);
> -int msm_dp_display_set_stream_id(struct msm_dp *dp,
> -				 struct msm_dp_panel *panel, u32 strm_id);
> +int msm_dp_display_set_stream_info(struct msm_dp *dp,
> +				   struct msm_dp_panel *panel, u32 strm_id,
> +				   u32 start_slot, u32 num_slots, u32 pbn, int vcpi);
>  
>  #endif /* _DP_DISPLAY_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9af2272da697e7aa49377c02abdb97e72f07c0bd..b4f6efaff7ed227d6e3fc846986aba375cdbbadb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -33,6 +33,11 @@ struct msm_dp_panel_psr {
>  	u8 capabilities;
>  };
>  
> +struct mst_caps {
> +	u32 pbn_no_overhead;

Doesn't seem to be used

> +	u32 pbn;

Why is it a part of capabilities structure?

> +};
> +
>  struct msm_dp_panel {
>  	/* dpcd raw data */
>  	u8 dpcd[DP_RECEIVER_CAP_SIZE];
> @@ -52,6 +57,8 @@ struct msm_dp_panel {
>  	u32 max_dp_link_rate;
>  
>  	u32 max_bw_code;
> +
> +	struct mst_caps mst_caps;
>  };
>  
>  int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel);
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 46400973eb499066e9e805b16df759b1db34cf22..8bc2a431462fc1fb45b1fe8e43a0a0ec7f75e5b1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -332,6 +332,12 @@
>  
>  /* DP MST related registers */
>  #define REG_DP_MST_ACT                          (0x00000500)
> +#define REG_DP_DP0_RG				(0x000004F8)
> +#define REG_DP_DP1_RG				(0x000004FC)
> +#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
> +#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
> +#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
> +#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)

- sort by register
- lowercase hex numbers

>  
>  /* DP HDCP 1.3 registers */
>  #define DP_HDCP_CTRL                                   (0x0A0)
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
