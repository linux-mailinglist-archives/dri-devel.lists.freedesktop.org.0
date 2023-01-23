Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58B678AC2
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D9C10E5AC;
	Mon, 23 Jan 2023 22:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD66D10E5A9
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:30:14 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id qx13so34326356ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qjrjuCucpka61T8msTGPJBC184g5enbFgn0K90gerd4=;
 b=Dkyl20IwRkmLQJxBnJJmGxrXUtyyv17Lc15AJXzsgKqolJqtybZcs+TtpaUWvpZKiQ
 b/JfzmQiGLaOkn2qTyQNxfnCUp339q4i19MQ36ZWkLHn7TUSKX3bug6y2GcY+SgKEaHl
 A9Tx23Zvycpmncvc2+Ycf83zkWDKzdkzubsXRWplXHB+uNI3OVb/L6F+3sY27prLTAgJ
 Ahqyjgk4JN7eW8J5A/VaUKfse+ESafXz2A3ugUYNQzmx934KvWQ6/QIakjIb4Ld8q5IB
 AZQ2sUM7JvoI0kGCq31vTzMtBnOScdw8jFcOcvCLcddTRfGNHiXLUwA4R3kHhrJJmln0
 PqhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qjrjuCucpka61T8msTGPJBC184g5enbFgn0K90gerd4=;
 b=HqQbVawKgEm0AP1NBiKe8WZaNmgs+Uwk2vsujETh3df/FWAtIIPvTKH0L0N/k7V9QY
 Wn9rgC4E4NJTM27dl82lc2O3qmAZrPHoTh/hFI34kWWHZcrnOWdVrBb11DZqQ0c7Nb0v
 kc82Blc7JlCd+QQnhrc+oEC080XM9Zx9SzxjM2Ec17MwEuxgwn0SFaOEkxfz69wCEZLh
 9ST3pmrfJ//BW3jEtMlkNxxhKECYbCAkkW7c6CIrnmVeq3jrYlrJZGGFloGHIhAYLHR3
 +lMMODaHmdKXnCns9LZdZrkhgVh3LF3o3p01rTOlkcY4xMEpCezjDssF8rQ+n1S9HL/A
 7lLQ==
X-Gm-Message-State: AFqh2kreEyZmNY5MupTZ1LQyvNssoOr21t5bKCMBbvje3W7wAN5d5ZTV
 oO90SgjsDGh/10nYb237JPLpvg==
X-Google-Smtp-Source: AMrXdXuPVIbEqmNe+aD7pV8MuPalyggpTTraPLKpP8hN/bWzPiSKYTarAsi0ZUI0NVPWn3Fnoig0ng==
X-Received: by 2002:a17:906:f218:b0:870:e823:c07 with SMTP id
 gt24-20020a170906f21800b00870e8230c07mr29158763ejb.2.1674513013111; 
 Mon, 23 Jan 2023 14:30:13 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 em1-20020a056402364100b00483dd234ac6sm256601edb.96.2023.01.23.14.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 14:30:11 -0800 (PST)
Message-ID: <1301e38b-e8d4-3a2d-4c95-09319307620a@linaro.org>
Date: Tue, 24 Jan 2023 00:30:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 08/14] drm/msm/dp: add dsc supporting functions to DP
 controller
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-9-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-9-git-send-email-quic_khsieh@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2023 20:24, Kuogee Hsieh wrote:
> This patch provides DSC required functions at DP controller to
> complete DSC feature. those functions include enable fec, configure
> dsc, configure dto, transmit pps and finally flush hardware registers.

Too many items for a single patch in my opinion.

> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_catalog.c | 139 ++++++++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h |  93 ++++++
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 132 ++++++++-
>   drivers/gpu/drm/msm/dp/dp_display.c |  61 +++-
>   drivers/gpu/drm/msm/dp/dp_panel.c   | 570 +++++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/msm/dp/dp_panel.h   |   4 +
>   drivers/gpu/drm/msm/dp/dp_reg.h     |  40 ++-
>   drivers/gpu/drm/msm/msm_drv.h       |  16 +
>   8 files changed, 1033 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 7ac37d8..20a86e7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -48,6 +48,11 @@
>   #define DP_INTERRUPT_STATUS2_MASK \
>   	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
>   
> +enum dp_flush_bit {
> +	DP_PPS_FLUSH,
> +	DP_DHDR_FLUSH,
> +};
> +
>   struct dp_catalog_private {
>   	struct device *dev;
>   	struct drm_device *drm_dev;
> @@ -277,6 +282,30 @@ static void dump_regs(void __iomem *base, int len)
>   	}
>   }
>   
> +void dp_catalog_fec_config(struct dp_catalog *dp_catalog, bool enable)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +		struct dp_catalog_private, dp_catalog);
> +	u32 reg;
> +
> +	reg = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +	/*
> +	 * fec_en = BIT(12)
> +	 * fec_seq_mode = BIT(22)
> +	 * sde_flush = BIT(23) | BIT(24)
> +	 * fb_boundary_sel = BIT(25)

This should go to #define's instead.

> +	 */
> +	if (enable)
> +		reg |= BIT(12) | BIT(22) | BIT(23) | BIT(24) | BIT(25);
> +	else
> +		reg &= ~BIT(12);
> +
> +	dp_write_link(catalog, REG_DP_MAINLINK_CTRL, reg);
> +	/* make sure mainlink configuration is updated with fec sequence */
> +	wmb();
> +}
> +
>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
> @@ -344,6 +373,54 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 cfg)
>   	dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
>   }
>   
> +void dp_catalog_config_dsc_dto(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +	struct dp_dsc_cfg_data *dsc_data = &dp_catalog->dsc_data;
> +	u32 reg;
> +
> +	dp_write_p0(catalog, MMSS_DP_DSC_DTO_COUNT, dsc_data->dto_count);
> +
> +	reg = dp_read_p0(catalog, MMSS_DP_DSC_DTO);
> +
> +	if (dsc_data->dto_en) {
> +		reg |= BIT(0);
> +		reg |= BIT(3);
> +		reg |= (dsc_data->dto_n << 8);
> +		reg |= (dsc_data->dto_d << 16);
> +	}
> +
> +	dp_write_p0(catalog, MMSS_DP_DSC_DTO, reg);
> +
> +	reg = 0;
> +	if (dsc_data->dsc_en) {
> +		reg = BIT(0);
> +		reg |= (dsc_data->eol_byte_num << 3);
> +		reg |= (dsc_data->slice_per_pkt << 5);
> +		reg |= (dsc_data->bytes_per_pkt << 16);
> +		reg |= (dsc_data->be_in_lane << 10);
> +	}
> +	dp_write_link(catalog, DP_COMPRESSION_MODE_CTRL, reg);
> +
> +	drm_dbg_dp(catalog->drm_dev, "compression:0x%x\n", reg);
> +}
> +
> +void dp_catalog_override_ack_dto(struct dp_catalog *dp_catalog, bool not_ack)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +        u32 dsc_dto;
> +
> +	dsc_dto = dp_read_p0(catalog, MMSS_DP_DSC_DTO);
> +        if (not_ack)
> +                dsc_dto &= ~BIT(1);
> +        else
> +                dsc_dto = BIT(1);
> +
> +	dp_write_p0(catalog, MMSS_DP_DSC_DTO, dsc_dto);

The indentation looks weird. It might be my email client. Or may be not.

> +}
> +
>   void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
> @@ -429,6 +506,15 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
>   	}
>   }
>   
> +static void dp_catalog_sdp_update( struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x01);
> +	dp_write_link(catalog, MMSS_DP_SDP_CFG3, 0x00);
> +}
> +
>   void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>   					u32 colorimetry_cfg,
>   					u32 test_bits_depth)
> @@ -504,7 +590,6 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>   	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
>   	dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
>   	dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
> -	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
>   }
>   
>   int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog,
> @@ -918,6 +1003,58 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
>   	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
>   }
>   
> +void dp_catalog_dsc_commit_pps(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +	struct dp_dsc_cfg_data *dsc_data = &dp_catalog->dsc_data;
> +	int i;
> +
> +	dp_write_link(catalog, DP_PPS_HB_0_3, 0x7F1000);
> +	dp_write_link(catalog, DP_PPS_PB_0_3, 0xA22300);
> +
> +	for (i = 0; i < dsc_data->parity_word_len; i++)
> +		dp_write_link(catalog, DP_PPS_PB_4_7 + (i << 2),
> +				dsc_data->parity_word[i]);
> +
> +	for (i = 0; i < dsc_data->pps_word_len; i++)
> +		dp_write_link(catalog, DP_PPS_PPS_0_3 + (i << 2),
> +				dsc_data->pps_word[i]);
> +}
> +
> +static void dp_catalog_dp_flush(struct dp_catalog *dp_catalog,
> +		enum dp_flush_bit flush_bit)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +	u32 dp_flush;
> +	struct dp_dsc_cfg_data *dsc_data = &dp_catalog->dsc_data;
> +
> +	dp_flush = dp_read_link(catalog, MMSS_DP_FLUSH);
> +
> +	dsc_data->continuous_pps = true;

This doesn't look like a part of the flush. Especially since you check 
this boolean on the next line.

> +
> +	if ((flush_bit == DP_PPS_FLUSH) && dsc_data->continuous_pps)
> +		dp_flush &= ~BIT(2);
> +
> +	dp_flush |= BIT(flush_bit);

I'd prefer to see BIT(n) as a defines rather than doing a BIT(enum_value).

> +	dp_write_link(catalog, MMSS_DP_FLUSH, dp_flush);
> +
> +	/*
> +	 * TODO: no dp_config_sdp_update() required?
> +	 */

Is it going to be resolved?

> +	dp_catalog_sdp_update(dp_catalog);
> +}
> +
> +void dp_catalog_pps_flush(struct dp_catalog *dp_catalog)
> +{
> +	struct dp_catalog_private *catalog = container_of(dp_catalog,
> +				struct dp_catalog_private, dp_catalog);
> +
> +	dp_catalog_dp_flush(dp_catalog, DP_PPS_FLUSH);
> +	drm_dbg_dp(catalog->drm_dev, "pps flush\n");
> +}
> +
>   struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io)
>   {
>   	struct dp_catalog_private *catalog;
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 990c162..537fb8d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -62,6 +62,27 @@ enum dp_catalog_audio_header_type {
>   	DP_AUDIO_SDP_HEADER_MAX,
>   };
>   
> +struct dp_dsc_cfg_data {
> +	bool dsc_en;
> +	bool continuous_pps;
> +	char pps[128];
> +	u32 pps_len;
> +	u32 pps_word[32];
> +	u32 pps_word_len;
> +	u8 parity[32];
> +	u8 parity_len;
> +	u32 parity_word[8];
> +	u32 parity_word_len;
> +	u32 slice_per_pkt;
> +	u32 bytes_per_pkt;
> +	u32 eol_byte_num;
> +	u32 be_in_lane;
> +	u32 dto_en;
> +	u32 dto_n;
> +	u32 dto_d;
> +	u32 dto_count;
> +};
> +
>   struct dp_catalog {
>   	u32 aux_data;
>   	u32 total;
> @@ -72,8 +93,74 @@ struct dp_catalog {
>   	enum dp_catalog_audio_header_type sdp_header;
>   	u32 audio_data;
>   	bool wide_bus_en;
> +	struct dp_dsc_cfg_data dsc_data;
>   };
>   
> +static inline u8 dp_ecc_get_g0_value(u8 data)
> +{
> +	u8 c[4];
> +	u8 g[4];
> +	u8 ret_data = 0;
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++)
> +		c[i] = (data >> i) & 0x01;
> +
> +	g[0] = c[3];
> +	g[1] = c[0] ^ c[3];
> +	g[2] = c[1];
> +	g[3] = c[2];
> +
> +	for (i = 0; i < 4; i++)
> +		ret_data = ((g[i] & 0x01) << i) | ret_data;
> +
> +	return ret_data;
> +}
> +
> +static inline u8 dp_ecc_get_g1_value(u8 data)
> +{
> +	u8 c[4];
> +	u8 g[4];
> +	u8 ret_data = 0;
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++)
> +		c[i] = (data >> i) & 0x01;
> +
> +	g[0] = c[0] ^ c[3];
> +	g[1] = c[0] ^ c[1] ^ c[3];
> +	g[2] = c[1] ^ c[2];
> +	g[3] = c[2] ^ c[3];
> +
> +	for (i = 0; i < 4; i++)
> +		ret_data = ((g[i] & 0x01) << i) | ret_data;
> +
> +	return ret_data;
> +}
> +
> +static inline u8 dp_header_get_parity(u32 data)
> +{
> +	u8 x0 = 0;
> +	u8 x1 = 0;
> +	u8 ci = 0;
> +	u8 iData = 0;
> +	u8 i = 0;
> +	u8 parity_byte;
> +	u8 num_byte = (data > 0xFF) ? 8 : 2;
> +
> +	for (i = 0; i < num_byte; i++) {
> +		iData = (data >> i*4) & 0xF;
> +
> +		ci = iData ^ x1;
> +		x1 = x0 ^ dp_ecc_get_g1_value(ci);
> +		x0 = dp_ecc_get_g0_value(ci);
> +	}
> +
> +	parity_byte = x1 | (x0 << 4);
> +
> +	return parity_byte;
> +}
> +

Why do we have them in the header? Are they used by more than one module?

>   /* Debug module */
>   void dp_catalog_snapshot(struct dp_catalog *dp_catalog, struct msm_disp_state *disp_state);
>   
> @@ -137,4 +224,10 @@ void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
>   void dp_catalog_audio_init(struct dp_catalog *catalog);
>   void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
>   
> +void dp_catalog_fec_config(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_dsc_commit_pps(struct dp_catalog *catalog);
> +void dp_catalog_config_dsc_dto(struct dp_catalog *catalog);
> +void dp_catalog_override_ack_dto(struct dp_catalog *dp_catalog, bool not_ack);
> +void dp_catalog_pps_flush(struct dp_catalog *catalog);
> +
>   #endif /* _DP_CATALOG_H_ */
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ae9c2b8..b315bf3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -134,9 +134,13 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>   	tbd = dp_link_get_test_bits_depth(ctrl->link,
>   			ctrl->panel->dp_mode.bpp);
>   
> -	if (tbd == DP_TEST_BIT_DEPTH_UNKNOWN) {
> +	/*
> +	 * since dsc encoder output byte stream to dp controller,

outputs

> +	 * 8 bits bpc should be used as long as dsc eanabled
> +	 */
> +	if (tbd == DP_TEST_BIT_DEPTH_UNKNOWN || ctrl->panel->dsc_en) {
>   		pr_debug("BIT_DEPTH not set. Configure default\n");
> -		tbd = DP_TEST_BIT_DEPTH_8;
> +		tbd = DP_TEST_BIT_DEPTH_8 >> DP_TEST_BIT_DEPTH_SHIFT;
>   	}
>   
>   	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
> @@ -366,8 +370,8 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
>   	tu->lwidth_fp            = drm_fixp_from_fraction(in->hactive, 1);
>   	tu->orig_lwidth          = in->hactive;
>   	tu->hbp_relative_to_pclk_fp = drm_fixp_from_fraction(in->hporch, 1);
> -	tu->orig_hbp             = in->hporch;
> -	tu->rb2                  = (in->hporch <= 80) ? 1 : 0;
> +        tu->orig_hbp             = in->hporch;

No unnecessary indentation changes, please.

> +	tu->rb2                  = (in->hporch < 160) ? 1 : 0;


>   
>   	if (tu->pixelEnc == 420) {
>   		temp1_fp = drm_fixp_from_fraction(2, 1);
> @@ -399,6 +403,8 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
>   	if (!in->dsc_en)
>   		goto fec_check;
>   
> +	tu->bpp = 24; /* hardcode to 24 if DSC is enabled */
> +
>   	temp1_fp = drm_fixp_from_fraction(in->compress_ratio, 100);
>   	temp2_fp = drm_fixp_from_fraction(in->bpp, 1);
>   	temp3_fp = drm_fixp_div(temp2_fp, temp1_fp);
> @@ -1076,6 +1082,11 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
>   {
>   	struct dp_tu_calc_input in;
>   	struct drm_display_mode *drm_mode;
> +	struct dp_panel_info *timing;
> +	struct msm_compression_info *comp_info;
> +
> +	timing = &ctrl->panel->dp_mode.timing;
> +	comp_info = &timing->comp_info;
>   
>   	drm_mode = &ctrl->panel->dp_mode.drm_mode;
>   
> @@ -1086,12 +1097,22 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
>   	in.nlanes = ctrl->link->link_params.num_lanes;
>   	in.bpp = ctrl->panel->dp_mode.bpp;
>   	in.pixel_enc = 444;
> -	in.dsc_en = 0;
> +	in.dsc_en = ctrl->panel->dsc_en;
>   	in.async_en = 0;
> -	in.fec_en = 0;
> +	in.fec_en = ctrl->panel->fec_en;
>   	in.num_of_dsc_slices = 0;
>   	in.compress_ratio = 100;
>   
> +
> +	/*
> +	 * TODO: only one dsc slice supported for now
> +	 */
> +	if (ctrl->panel->dsc_en) {
> +		in.num_of_dsc_slices = 1;
> +		in.compress_ratio = mult_frac(100, comp_info->src_bpp,
> +                                comp_info->tgt_bpp);
> +	}
> +
>   	_dp_ctrl_calc_tu(ctrl, &in, tu_table);
>   }
>   
> @@ -1424,6 +1445,74 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>   	return ret;
>   }
>   
> +static void dp_ctrl_sink_fec_enable(struct dp_ctrl_private *ctrl)
> +{
> +	int rlen;
> +
> +	rlen = drm_dp_dpcd_writeb(ctrl->aux, DP_FEC_CONFIGURATION, 0x07);
> +	if (rlen < 1)
> +		DRM_ERROR("failed to enable sink fec\n");
> +
> +
> +}
> +
> +static void dp_ctrl_host_fec_start(struct dp_ctrl_private *ctrl)
> +{
> +	u8 fec_sts = 0;
> +	int i, max_retries = 3;
> +	bool fec_en_detected = false;
> +
> +	if (!ctrl->panel->fec_en)
> +		return;
> +
> +	/* Need to try to enable multiple times due to BS symbols collisions */
> +	for (i = 0; i < max_retries; i++) {
> +		dp_catalog_fec_config(ctrl->catalog, true);
> +
> +		/* wait for controller to start fec sequence */
> +		usleep_range(900, 1000);
> +
> +		/* read back FEC status and check if it is enabled */
> +		drm_dp_dpcd_readb(ctrl->aux, DP_FEC_STATUS, &fec_sts);
> +		if (fec_sts & DP_FEC_DECODE_EN_DETECTED) {
> +			fec_en_detected = true;
> +			break;
> +		}
> +	}
> +
> +	drm_dbg_dp(ctrl->drm_dev, "retries %d, fec_en_detected %d\n",
> +				i, fec_en_detected);
> +
> +	if (!fec_en_detected)
> +		DRM_ERROR("failed to enable sink fec\n");
> +}
> +
> +static void dp_ctrl_host_fec_stop(struct dp_ctrl_private *ctrl)
> +{
> +	dp_catalog_fec_config(ctrl->catalog, false);
> +}
> +
> +static void dp_ctrl_sink_dsc_enable(struct dp_ctrl_private *ctrl)
> +{
> +	int rlen;
> +	u32 dsc_enable;
> +	u8 xx = 0;
> +
> +
> +	if (!ctrl->panel->fec_en)
> +		return;
> +
> +	dsc_enable = ctrl->panel->dsc_en ? 1 : 0;
> +	rlen = drm_dp_dpcd_writeb(ctrl->aux, DP_DSC_ENABLE, dsc_enable);
> +	if (rlen < 1)
> +		DRM_ERROR("failed to enable sink dsc\n");
> +
> +
> +	dsc_enable = 0;

Why?

> +	drm_dp_dpcd_readb(ctrl->aux, DP_DSC_ENABLE, &xx);

Again, why do you need to read it back? And 'xx' doesn't sound like a 
good variable name.

> +
> +}
> +
>   static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>   			int *training_step)
>   {
> @@ -1442,6 +1531,9 @@ static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl,
>   	 * a link training pattern, we have to first do soft reset.
>   	 */
>   
> +	if (ctrl->panel->fec_en)
> +		dp_ctrl_sink_fec_enable(ctrl);
> +
>   	ret = dp_ctrl_link_train(ctrl, training_step);
>   
>   	return ret;
> @@ -1986,14 +2078,25 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   	 */
>   	reinit_completion(&ctrl->video_comp);
>   
> +	if (ctrl->panel->dsc_en)
> +		dp_panel_config_dsc(ctrl->panel, true);
> +
>   	dp_ctrl_configure_source_params(ctrl);
>   
>   	dp_catalog_ctrl_config_msa(ctrl->catalog,
>   		ctrl->link->link_params.rate,
>   		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
>   
> +	if (ctrl->panel->dsc_en) {
> +		dp_catalog_config_dsc_dto(ctrl->catalog);
> +		dp_catalog_dsc_commit_pps(ctrl->catalog);
> +		dp_catalog_pps_flush(ctrl->catalog);
> +	}
> +
>   	dp_ctrl_setup_tr_unit(ctrl);
>   
> +	dp_catalog_override_ack_dto(ctrl->catalog, true);
> +
>   	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
>   
>   	ret = dp_ctrl_wait4video_ready(ctrl);
> @@ -2004,6 +2107,12 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
>   	drm_dbg_dp(ctrl->drm_dev,
>   		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
>   
> +	if (ctrl->panel->dsc_en) {
> +		/* wait for link training completion before fec config as per spec */
> +		dp_ctrl_host_fec_start(ctrl);
> +		dp_ctrl_sink_dsc_enable(ctrl);
> +	}
> +
>   end:
>   	return ret;
>   }
> @@ -2019,6 +2128,9 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
>   	dp_io = &ctrl->parser->io;
>   	phy = dp_io->phy;
>   
> +	if (ctrl->panel->dsc_en)
> +		dp_panel_config_dsc(ctrl->panel, false);
> +
>   	/* set dongle to D3 (power off) mode */
>   	dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, true);
>   
> @@ -2093,6 +2205,14 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
>   	dp_io = &ctrl->parser->io;
>   	phy = dp_io->phy;
>   
> +	if (ctrl->panel->dsc_en) {
> +		dp_ctrl_host_fec_stop(ctrl);
> +		dp_panel_config_dsc(ctrl->panel, false);
> +		dp_catalog_config_dsc_dto(ctrl->catalog);
> +	}
> +
> +	dp_catalog_override_ack_dto(ctrl->catalog, false);
> +
>   	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
>   
>   	dp_catalog_ctrl_reset(ctrl->catalog);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bde1a7c..da59d13 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #include <linux/module.h>
> @@ -99,7 +100,7 @@ struct dp_display_private {
>   	struct dp_debug   *debug;
>   
>   	struct dp_usbpd_cb usbpd_cb;
> -	struct dp_display_mode dp_mode;
> +	struct dp_display_mode *dp_mode;
>   	struct msm_dp dp_display;
>   
>   	/* wait for audio signaling */
> @@ -831,6 +832,9 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
>   		goto error_link;
>   	}
>   
> +	/* both dp_display and dp_panel shared same dp_mode */
> +	dp->dp_mode = &dp->panel->dp_mode;
> +
>   	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
>   			       dp->power, dp->catalog, dp->parser);
>   	if (IS_ERR(dp->ctrl)) {
> @@ -1662,7 +1666,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>   	bool force_link_train = false;
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
> -	if (!dp_display->dp_mode.drm_mode.clock) {
> +	if (!dp_display->dp_mode->drm_mode.clock) {
>   		DRM_ERROR("invalid params\n");
>   		return;
>   	}
> @@ -1678,7 +1682,7 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
>   		return;
>   	}
>   
> -	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
> +	rc = dp_display_set_mode(dp, dp_display->dp_mode);
>   	if (rc) {
>   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>   		mutex_unlock(&dp_display->event_mutex);
> @@ -1744,6 +1748,10 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
>   	if (state == ST_DISCONNECT_PENDING) {
>   		/* completed disconnection */
>   		dp_display->hpd_state = ST_DISCONNECTED;
> +		if (dp_display->panel->dsc_en) {
> +			dp_display->dp_mode->timing.comp_info.enabled = false;
> +			dp_display->panel->dsc_en = false;
> +		}
>   	} else {
>   		dp_display->hpd_state = ST_DISPLAY_OFF;
>   	}
> @@ -1762,23 +1770,50 @@ void dp_bridge_mode_set(struct drm_bridge *drm_bridge,
>   
>   	dp_display = container_of(dp, struct dp_display_private, dp_display);
>   
> -	memset(&dp_display->dp_mode, 0x0, sizeof(struct dp_display_mode));
> +	memset(dp_display->dp_mode, 0x0, sizeof(struct dp_display_mode));
>   
>   	if (dp_display_check_video_test(dp))
> -		dp_display->dp_mode.bpp = dp_display_get_test_bpp(dp);
> +		dp_display->dp_mode->bpp = dp_display_get_test_bpp(dp);
>   	else /* Default num_components per pixel = 3 */
> -		dp_display->dp_mode.bpp = dp->connector->display_info.bpc * 3;
> +		dp_display->dp_mode->bpp = dp->connector->display_info.bpc * 3;
> +
> +	if (!dp_display->dp_mode->bpp)
> +		dp_display->dp_mode->bpp = 24; /* Default bpp */
> +
> +	drm_mode_copy(&dp_display->dp_mode->drm_mode, adjusted_mode);
> +
> +	dp_display->dp_mode->v_active_low =
> +		!!(dp_display->dp_mode->drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> +
> +	dp_display->dp_mode->h_active_low =
> +		!!(dp_display->dp_mode->drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +
> +
> +	if (dp_display->panel->dsc_en) {
> +		dp_display->dp_mode->capabilities |= DP_PANEL_CAPS_DSC;
> +		dp_panel_convert_to_dp_mode(dp_display->panel, dp_display->dp_mode);
> +	}
> +}
>   
> -	if (!dp_display->dp_mode.bpp)
> -		dp_display->dp_mode.bpp = 24; /* Default bpp */
> +void msm_dp_bridge_mode_set(struct drm_bridge *bridge,
> +				struct drm_display_mode *mode,
> +				struct drm_display_mode *adjusted_mode)
> +{
> +	dp_bridge_mode_set(bridge, mode, adjusted_mode);
> +}
>   
> -	drm_mode_copy(&dp_display->dp_mode.drm_mode, adjusted_mode);
> +struct msm_compression_info *msm_dp_bridge_get_compression(struct drm_bridge *drm_bridge)
> +{
> +	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
> +	struct msm_dp *dp_display = dp_bridge->dp_display;
> +	struct dp_display_private *dp;
> +
> +	dp = container_of(dp_display, struct dp_display_private, dp_display);
>   
> -	dp_display->dp_mode.v_active_low =
> -		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
> +	if (!dp->panel->dsc_en)
> +		return NULL;
>   
> -	dp_display->dp_mode.h_active_low =
> -		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
> +	return &dp->dp_mode->timing.comp_info;
>   }
>   
>   void dp_bridge_hpd_enable(struct drm_bridge *bridge)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 55bb6b0..19e2f07 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -5,11 +5,12 @@
>    */
>   
>   #include "dp_panel.h"
> -
> +#include "dpu_dsc_helper.h"

DP driver can not depend on DPU.

>   #include <drm/drm_fixed.h>
>   #include <drm/drm_connector.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_print.h>
> +#include <drm/display/drm_dsc_helper.h>
>   
>   #define DSC_TGT_BPP 10
>   
> @@ -612,6 +613,573 @@ u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel)
>   	return colorimetry;
>   }
>   
> +static inline int fixp2int_ceil(s64 a)
> +{
> +	return (a ? drm_fixp2int_ceil(a) : 0);
> +}

??

> +
> +struct dp_dsc_slices_per_line {
> +	u32 min_ppr;
> +	u32 max_ppr;
> +	u8 num_slices;
> +};
> +
> +struct dp_dsc_peak_throughput {
> +	u32 index;
> +	u32 peak_throughput;
> +};
> +
> +struct dp_dsc_slice_caps_bit_map {
> +	u32 num_slices;
> +	u32 bit_index;
> +};
> +
> +const struct dp_dsc_slices_per_line slice_per_line_tbl[] = {
> +	{0,     340,    1   },
> +	{340,   680,    2   },
> +	{680,   1360,   4   },
> +	{1360,  3200,   8   },
> +	{3200,  4800,   12  },
> +	{4800,  6400,   16  },
> +	{6400,  8000,   20  },
> +	{8000,  9600,   24  }
> +};
> +
> +const struct dp_dsc_peak_throughput peak_throughput_mode_0_tbl[] = {
> +	{0, 0},
> +	{1, 340},
> +	{2, 400},
> +	{3, 450},
> +	{4, 500},
> +	{5, 550},
> +	{6, 600},
> +	{7, 650},
> +	{8, 700},
> +	{9, 750},
> +	{10, 800},
> +	{11, 850},
> +	{12, 900},
> +	{13, 950},
> +	{14, 1000},
> +};
> +
> +const struct dp_dsc_slice_caps_bit_map slice_caps_bit_map_tbl[] = {
> +	{1, 0},
> +	{2, 1},
> +	{4, 3},
> +	{6, 4},
> +	{8, 5},
> +	{10, 6},
> +	{12, 7},
> +	{16, 0},
> +	{20, 1},
> +	{24, 2},
> +};
> +
> +static bool dp_panel_check_slice_support(u32 num_slices, u32 raw_data_1,
> +		u32 raw_data_2)
> +{
> +	const struct dp_dsc_slice_caps_bit_map *bcap;
> +	u32 raw_data;
> +	int i;
> +
> +	if (num_slices <= 12)
> +		raw_data = raw_data_1;
> +	else
> +		raw_data = raw_data_2;
> +
> +	for (i = 0; i < ARRAY_SIZE(slice_caps_bit_map_tbl); i++) {
> +		bcap = &slice_caps_bit_map_tbl[i];
> +
> +		if (bcap->num_slices == num_slices) {
> +			raw_data &= (1 << bcap->bit_index);
> +
> +			if (raw_data)
> +				return true;
> +			else
> +				return false;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static int dp_panel_dsc_prepare_basic_params(
> +		struct msm_compression_info *comp_info,
> +		const struct dp_display_mode *dp_mode,
> +		struct dp_panel *dp_panel)
> +{
> +	struct dp_panel_private *panel;
> +	struct drm_dsc_config *dsc;
> +	int i;
> +	const struct dp_dsc_slices_per_line *rec;
> +	const struct dp_dsc_peak_throughput *tput;
> +	u32 slice_width;
> +	u32 ppr = dp_mode->timing.pixel_clk_khz/1000;
> +	u32 max_slice_width;
> +	u32 ppr_max_index;
> +	u32 peak_throughput;
> +	u32 ppr_per_slice;
> +	u32 slice_caps_1;
> +	u32 slice_caps_2;
> +	u32 dsc_version_major, dsc_version_minor;
> +	bool dsc_version_supported = false;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	dsc_version_major = dp_panel->sink_dsc_caps.version & 0xF;
> +	dsc_version_minor = (dp_panel->sink_dsc_caps.version >> 4) & 0xF;
> +	dsc_version_supported = (dsc_version_major == 0x1 &&
> +			(dsc_version_minor == 0x1 || dsc_version_minor == 0x2))
> +			? true : false;
> +
> +	drm_dbg_dp(panel->drm_dev, "DSC version: %d.%d, dpcd value: %x\n",
> +			dsc_version_major, dsc_version_minor,
> +			dp_panel->sink_dsc_caps.version);
> +
> +	if (!dsc_version_supported) {
> +		dsc_version_major = 1;
> +		dsc_version_minor = 1;
> +		DRM_ERROR("invalid sink DSC version, fallback to %d.%d\n",
> +				dsc_version_major, dsc_version_minor);
> +	}
> +
> +	dsc = &comp_info->msm_dsc_info.drm_dsc;
> +	dsc->dsc_version_major = dsc_version_major;
> +	dsc->dsc_version_minor = dsc_version_minor;
> +	comp_info->msm_dsc_info.scr_rev = 0x0;
> +
> +
> +	comp_info->msm_dsc_info.slice_per_pkt = 0;
> +	for (i = 0; i < ARRAY_SIZE(slice_per_line_tbl); i++) {
> +		rec = &slice_per_line_tbl[i];
> +		if ((ppr > rec->min_ppr) && (ppr <= rec->max_ppr)) {
> +			comp_info->msm_dsc_info.slice_per_pkt = rec->num_slices;
> +			i++;
> +			break;
> +		}
> +	}
> +
> +	if (comp_info->msm_dsc_info.slice_per_pkt == 0)
> +		return -EINVAL;
> +
> +	ppr_max_index = dp_panel->dsc_dpcd[11] &= 0xf;
> +	if (!ppr_max_index || ppr_max_index >= 15) {
> +		drm_dbg_dp(panel->drm_dev,
> +				"Throughput mode 0 not supported");
> +		return -EINVAL;
> +	}
> +
> +	tput = &peak_throughput_mode_0_tbl[ppr_max_index];
> +	peak_throughput = tput->peak_throughput;
> +
> +	max_slice_width = dp_panel->dsc_dpcd[12] * 320;
> +	slice_width = (dp_mode->timing.h_active /
> +				comp_info->msm_dsc_info.slice_per_pkt);
> +
> +	ppr_per_slice = ppr/comp_info->msm_dsc_info.slice_per_pkt;
> +
> +	slice_caps_1 = dp_panel->dsc_dpcd[4];
> +	slice_caps_2 = dp_panel->dsc_dpcd[13] & 0x7;
> +
> +	/*
> +	 * There are 3 conditions to check for sink support:
> +	 * 1. The slice width cannot exceed the maximum.
> +	 * 2. The ppr per slice cannot exceed the maximum.
> +	 * 3. The number of slices must be explicitly supported.
> +	 */
> +	while (slice_width >= max_slice_width ||
> +			ppr_per_slice > peak_throughput ||
> +			!dp_panel_check_slice_support(
> +			comp_info->msm_dsc_info.slice_per_pkt, slice_caps_1,
> +			slice_caps_2)) {
> +		if (i == ARRAY_SIZE(slice_per_line_tbl))
> +			return -EINVAL;
> +
> +		rec = &slice_per_line_tbl[i];
> +		comp_info->msm_dsc_info.slice_per_pkt = rec->num_slices;
> +		slice_width = (dp_mode->timing.h_active /
> +				comp_info->msm_dsc_info.slice_per_pkt);
> +		ppr_per_slice = ppr/comp_info->msm_dsc_info.slice_per_pkt;
> +		i++;
> +	}
> +
> +	dsc->block_pred_enable = dp_panel->sink_dsc_caps.block_pred_en;
> +
> +	dsc->pic_width = dp_mode->timing.h_active;
> +	dsc->pic_height = dp_mode->timing.v_active;
> +	dsc->slice_width = slice_width;
> +
> +	if (dsc->pic_height % 108 == 0)
> +		dsc->slice_height = 108;
> +	else if (dsc->pic_height % 16 == 0)
> +		dsc->slice_height = 16;
> +	else if (dsc->pic_height % 12 == 0)
> +		dsc->slice_height = 12;
> +	else
> +		dsc->slice_height = 15;
> +
> +	dsc->bits_per_component = (dp_mode->timing.bpp / 3);
> +	dsc->bits_per_pixel = DSC_TGT_BPP << 4;
> +	dsc->slice_count = DIV_ROUND_UP(dp_mode->timing.h_active, slice_width);
> +
> +	comp_info->comp_type = MSM_DISPLAY_COMPRESSION_DSC;
> +	comp_info->tgt_bpp = DSC_TGT_BPP;
> +	comp_info->src_bpp = dp_mode->timing.bpp;
> +	comp_info->comp_ratio = dp_mode->timing.bpp / DSC_TGT_BPP;
> +	comp_info->enabled = true;
> +
> +	return 0;
> +}
> +
> +static void dp_panel_get_dto_params(u32 src_bpp, u32 tgt_bpp, u32 *num, u32 *denom)
> +{
> +	if ((tgt_bpp == 12) && (src_bpp == 24)) {
> +		*num = 1;
> +		*denom = 2;
> +	} else if ((tgt_bpp == 15) && (src_bpp == 30)) {
> +		*num = 5;
> +		*denom = 8;
> +	} else if ((tgt_bpp == 8) && ((src_bpp == 24) || (src_bpp == 30))) {
> +		*num = 1;
> +		*denom = 3;
> +	} else if ((tgt_bpp == 10) && (src_bpp == 30)) {
> +		*num = 5;
> +		*denom = 12;
> +	} else {
> +		DRM_ERROR("dto params not found\n");
> +		*num = 0;
> +		*denom = 1;
> +	}
> +}
> +
> +static void dp_panel_dsc_prepare_pps_packet(struct dp_panel *dp_panel)
> +{
> +	struct dp_panel_private *panel;
> +	struct dp_dsc_cfg_data *dsc_data;
> +	u8 *pps, *parity;
> +	u32 *pps_word, *parity_word;
> +	int i, index_4;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	dsc_data = &panel->catalog->dsc_data;
> +	pps = dsc_data->pps;
> +	pps_word = dsc_data->pps_word;
> +	parity = dsc_data->parity;
> +	parity_word = dsc_data->parity_word;
> +
> +	memset(parity, 0, sizeof(dsc_data->parity));
> +
> +	dsc_data->pps_word_len = dsc_data->pps_len >> 2;
> +	dsc_data->parity_len = dsc_data->pps_word_len;
> +	dsc_data->parity_word_len = (dsc_data->parity_len >> 2) + 1;
> +
> +	for (i = 0; i < dsc_data->pps_word_len; i++) {
> +		index_4 = i << 2;
> +		pps_word[i] = pps[index_4 + 0] << 0 |
> +				pps[index_4 + 1] << 8 |
> +				pps[index_4 + 2] << 16 |
> +				pps[index_4 + 3] << 24;
> +
> +		parity[i] = dp_header_get_parity(pps_word[i]);
> +	}
> +
> +	for (i = 0; i < dsc_data->parity_word_len; i++) {
> +		index_4 = i << 2;
> +		parity_word[i] = parity[index_4 + 0] << 0 |
> +				   parity[index_4 + 1] << 8 |
> +				   parity[index_4 + 2] << 16 |
> +				   parity[index_4 + 3] << 24;
> +	}
> +}
> +
> +void dp_panel_config_dsc(struct dp_panel *dp_panel, bool enable)
> +{
> +	struct dp_panel_private *panel;
> +	struct dp_panel_info *timing;
> +	struct msm_compression_info *comp_info;
> +	struct dp_dsc_cfg_data *dsc_data;
> +	struct drm_dsc_picture_parameter_set *pps_payload;
> +	struct drm_dsc_config *dsc;
> +
> +	if (!dp_panel->dsc_en)
> +		return;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	dsc_data = &panel->catalog->dsc_data;
> +	timing = &dp_panel->dp_mode.timing;
> +	comp_info = &timing->comp_info;
> +	dsc = &comp_info->msm_dsc_info.drm_dsc;
> +
> +	if (comp_info->comp_type == MSM_DISPLAY_COMPRESSION_DSC && enable) {
> +		memset(dsc_data->pps, 0, sizeof(dsc_data->pps));
> +		pps_payload = (struct drm_dsc_picture_parameter_set *)dsc_data->pps;
> +		drm_dsc_pps_payload_pack(pps_payload, dsc);
> +
> +		dsc_data->pps_len = DSC_1_1_PPS_PARAMETER_SET_ELEMENTS;
> +		dp_panel_dsc_prepare_pps_packet(dp_panel);
> +
> +		dsc_data->slice_per_pkt = comp_info->msm_dsc_info.slice_per_pkt - 1;
> +		dsc_data->bytes_per_pkt = comp_info->msm_dsc_info.bytes_per_pkt;
> +		dsc_data->bytes_per_pkt /= comp_info->msm_dsc_info.slice_per_pkt;
> +		dsc_data->eol_byte_num = comp_info->msm_dsc_info.eol_byte_num;
> +		dsc_data->dto_count = comp_info->msm_dsc_info.pclk_per_line;
> +		dsc_data->be_in_lane = 10;
> +		dsc_data->dsc_en = true;
> +		dsc_data->dto_en = true;
> +		dp_panel_get_dto_params(comp_info->src_bpp, comp_info->tgt_bpp, &dsc_data->dto_n,
> +				&dsc_data->dto_d);
> +	} else {
> +		dsc_data->dsc_en = false;
> +		dsc_data->dto_en = false;
> +		dsc_data->dto_n = 0;
> +		dsc_data->dto_d = 0;
> +		dsc_data->continuous_pps = false;
> +	}
> +}
> +
> +static void _dp_panel_dsc_get_num_extra_pclk(struct msm_compression_info *comp_info)
> +{
> +	unsigned int dto_n = 0, dto_d = 0, remainder;
> +	int ack_required, last_few_ack_required, accum_ack;
> +	int last_few_pclk, last_few_pclk_required;
> +	struct msm_display_dsc_info *dsc_info = &comp_info->msm_dsc_info;
> +	int start, temp, line_width = dsc_info->drm_dsc.pic_width/2;
> +	s64 temp1_fp, temp2_fp;
> +
> +	dp_panel_get_dto_params(comp_info->src_bpp, comp_info->tgt_bpp, &dto_n, &dto_d);
> +
> +	ack_required = dsc_info->pclk_per_line;
> +
> +	/* number of pclk cycles left outside of the complete DTO set */
> +	last_few_pclk = line_width % dto_d;
> +
> +	/* number of pclk cycles outside of the complete dto */
> +	temp1_fp = drm_fixp_from_fraction(line_width, dto_d);
> +	temp2_fp = drm_fixp_from_fraction(dto_n, 1);
> +	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +	temp = drm_fixp2int(temp1_fp);
> +	last_few_ack_required = ack_required - temp;
> +
> +	/*
> +	 * check how many more pclk is needed to
> +	 * accommodate the last few ack required
> +	 */
> +	remainder = dto_n;
> +	accum_ack = 0;
> +	last_few_pclk_required = 0;
> +	while (accum_ack < last_few_ack_required) {
> +		last_few_pclk_required++;
> +
> +		if (remainder >= dto_n)
> +			start = remainder;
> +		else
> +			start = remainder + dto_d;
> +
> +		remainder = start - dto_n;
> +		if (remainder < dto_n)
> +			accum_ack++;
> +	}
> +
> +	/* if fewer pclk than required */
> +	if (last_few_pclk < last_few_pclk_required)
> +		dsc_info->extra_width = last_few_pclk_required - last_few_pclk;
> +	else
> +		dsc_info->extra_width = 0;
> +}
> +
> +static void _dp_panel_dsc_bw_overhead_calc(struct dp_panel *dp_panel,
> +		struct msm_display_dsc_info *dsc_info,
> +		struct dp_display_mode *dp_mode, u32 dsc_byte_cnt)
> +{
> +	int num_slices, tot_num_eoc_symbols;
> +	int tot_num_hor_bytes, tot_num_dummy_bytes;
> +	int dwidth_dsc_bytes, eoc_bytes;
> +	u32 num_lanes;
> +	struct dp_panel_private *panel;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	num_lanes = panel->link->link_params.num_lanes;
> +	num_slices = dsc_info->slice_per_pkt;
> +
> +	eoc_bytes = dsc_byte_cnt % num_lanes;
> +	tot_num_eoc_symbols = num_lanes * num_slices;
> +	tot_num_hor_bytes = dsc_byte_cnt * num_slices;
> +	tot_num_dummy_bytes = (num_lanes - eoc_bytes) * num_slices;
> +
> +	if (!eoc_bytes)
> +		tot_num_dummy_bytes = 0;
> +
> +	dwidth_dsc_bytes = tot_num_hor_bytes + tot_num_eoc_symbols +
> +				tot_num_dummy_bytes;
> +
> +	drm_dbg_dp(panel->drm_dev, "dwidth_dsc_bytes:%d, tot_num_hor_bytes:%d\n",
> +			dwidth_dsc_bytes, tot_num_hor_bytes);
> +
> +	dp_mode->dsc_overhead_fp = drm_fixp_from_fraction(dwidth_dsc_bytes,
> +			tot_num_hor_bytes);
> +
> +	dp_mode->timing.dsc_overhead_fp = dp_mode->dsc_overhead_fp;
> +}
> +
> +static void dp_panel_dsc_pclk_param_calc(struct dp_panel *dp_panel,
> +		struct msm_compression_info *comp_info,
> +		struct dp_display_mode *dp_mode)
> +{
> +	int comp_ratio = 100, intf_width;
> +	int slice_per_pkt, slice_per_intf;
> +	s64 temp1_fp, temp2_fp;
> +	s64 numerator_fp, denominator_fp;
> +	s64 dsc_byte_count_fp;
> +	u32 dsc_byte_count, temp1, temp2;
> +	struct msm_display_dsc_info *dsc_info = &comp_info->msm_dsc_info;
> +
> +	intf_width = dp_mode->timing.h_active;
> +	if (!dsc_info || !dsc_info->drm_dsc.slice_width || !dsc_info->slice_per_pkt ||
> +			 (intf_width < dsc_info->drm_dsc.slice_width))
> +		return;
> +
> +	slice_per_pkt = dsc_info->slice_per_pkt;
> +	slice_per_intf = DIV_ROUND_UP(intf_width,
> +			dsc_info->drm_dsc.slice_width);
> +
> +	comp_ratio = mult_frac(100, comp_info->src_bpp, comp_info->tgt_bpp);
> +
> +	temp1_fp = drm_fixp_from_fraction(comp_ratio, 100);
> +	temp2_fp = drm_fixp_from_fraction(slice_per_pkt * 8, 1);
> +	denominator_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +	numerator_fp = drm_fixp_from_fraction(
> +			intf_width * dsc_info->drm_dsc.bits_per_component * 3, 1);
> +	dsc_byte_count_fp = drm_fixp_div(numerator_fp, denominator_fp);
> +	dsc_byte_count = fixp2int_ceil(dsc_byte_count_fp);
> +
> +	temp1 = dsc_byte_count * slice_per_intf;
> +	temp2 = temp1;
> +	if (temp1 % 3 != 0)
> +		temp1 += 3 - (temp1 % 3);
> +
> +	dsc_info->eol_byte_num = temp1 - temp2;
> +
> +	temp1_fp = drm_fixp_from_fraction(slice_per_intf, 6);
> +	temp2_fp = drm_fixp_mul(dsc_byte_count_fp, temp1_fp);
> +	dsc_info->pclk_per_line = fixp2int_ceil(temp2_fp);
> +
> +	_dp_panel_dsc_get_num_extra_pclk(comp_info);
> +	dsc_info->pclk_per_line--;
> +
> +	_dp_panel_dsc_bw_overhead_calc(dp_panel, dsc_info, dp_mode, dsc_byte_count);
> +}
> +
> +void dp_panel_convert_to_dp_mode(struct dp_panel *dp_panel,
> +		struct dp_display_mode *dp_mode)
> +{
> +	struct dp_panel_private *panel;
> +	const u32 num_components = 3, default_bpp = 24;
> +	struct drm_display_mode *drm_mode;
> +	struct dp_panel_info *timing;
> +	struct msm_compression_info *comp_info;
> +	bool dsc_cap = (dp_mode->capabilities & DP_PANEL_CAPS_DSC) ?
> +				true : false;
> +	int rc;
> +
> +	if (!dp_panel->dsc_en)
> +		return;
> +
> +	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
> +
> +	drm_mode = &dp_mode->drm_mode;
> +	timing = &dp_mode->timing;
> +
> +	timing->h_active = drm_mode->hdisplay;
> +	timing->h_back_porch = drm_mode->htotal - drm_mode->hsync_end;
> +	timing->h_sync_width = drm_mode->htotal -
> +                        (drm_mode->hsync_start + dp_mode->timing.h_back_porch);
> +
> +	timing->h_front_porch = drm_mode->hsync_start -
> +					 drm_mode->hdisplay;
> +	timing->h_skew = drm_mode->hskew;
> +
> +	timing->v_active = drm_mode->vdisplay;
> +	timing->v_back_porch = drm_mode->vtotal - drm_mode->vsync_end;
> +	timing->v_sync_width = drm_mode->vtotal -
> +                (drm_mode->vsync_start + dp_mode->timing.v_back_porch);
> +
> +	timing->v_front_porch = drm_mode->vsync_start - drm_mode->vdisplay;
> +
> +	timing->refresh_rate = drm_mode_vrefresh(drm_mode);
> +	timing->pixel_clk_khz = drm_mode->clock;
> +
> +	timing->v_active_low =
> +		!!(drm_mode->flags & DRM_MODE_FLAG_NVSYNC);
> +
> +	timing->h_active_low =
> +		!!(drm_mode->flags & DRM_MODE_FLAG_NHSYNC);
> +
> +	timing->bpp =
> +		dp_panel->connector->display_info.bpc * num_components;
> +	if (!timing->bpp)
> +		timing->bpp = default_bpp;
> +
> +	timing->widebus_en = dp_panel->widebus_en;
> +	timing->dsc_overhead_fp = 0;
> +
> +	comp_info = &timing->comp_info;
> +	comp_info->src_bpp = default_bpp;
> +	comp_info->tgt_bpp = default_bpp;
> +	comp_info->comp_type = MSM_DISPLAY_COMPRESSION_NONE;
> +	comp_info->comp_ratio = 1;
> +	comp_info->enabled = false;
> +
> +	/* As YUV was not supported now, so set the default format to RGB */
> +	dp_mode->output_format = DP_OUTPUT_FORMAT_RGB;
> +	/*
> +	 * If a given videomode can be only supported in YCBCR420, set
> +	 * the output format to YUV420. While now our driver did not
> +	 * support YUV display over DP, so just place this flag here.
> +	 * When we want to support YUV, we can use this flag to do
> +	 * a lot of settings, like CDM, CSC and pixel_clock.
> +	 */
> +	if (drm_mode_is_420_only(&dp_panel->connector->display_info,
> +			drm_mode)) {
> +		dp_mode->output_format = DP_OUTPUT_FORMAT_YCBCR420;
> +		drm_dbg_dp(panel->drm_dev, "YCBCR420 was not supported");
> +	}
> +
> +	timing->bpp = dp_panel_get_mode_bpp(dp_panel,
> +			timing->bpp, timing->pixel_clk_khz);
> +
> +
> +	if (dp_panel->dsc_en && dsc_cap) {
> +		if (dp_panel_dsc_prepare_basic_params(comp_info,
> +					dp_mode, dp_panel)) {
> +			drm_dbg_dp(panel->drm_dev,
> +					"prepare DSC basic params failed\n");
> +			return;
> +		}
> +
> +		rc = dpu_dsc_populate_dsc_config(&comp_info->msm_dsc_info.drm_dsc, 0);
> +		if (rc) {
> +			drm_dbg_dp(panel->drm_dev,
> +					"failed populating dsc params \n");
> +			return;
> +		}
> +
> +		rc = dpu_dsc_populate_dsc_private_params(&comp_info->msm_dsc_info,
> +				dp_mode->timing.h_active);
> +		if (rc) {
> +			drm_dbg_dp(panel->drm_dev,
> +					"failed populating other dsc params\n");
> +			return;
> +		}
> +
> +		dp_panel_dsc_pclk_param_calc(dp_panel, comp_info, dp_mode);
> +	}
> +	dp_mode->fec_overhead_fp = dp_panel->fec_overhead_fp;
> +}
> +
>   struct dp_panel *dp_panel_get(struct dp_panel_in *in)
>   {
>   	struct dp_panel_private *panel;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 4c45d51..576056c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -112,6 +112,7 @@ struct dp_panel {
>   	bool fec_feature_enable;
>   	bool dsc_en;
>   	bool fec_en;
> +	bool widebus_en;
>   	s64 fec_overhead_fp;
>   };
>   
> @@ -128,6 +129,9 @@ int dp_panel_get_modes(struct dp_panel *dp_panel,
>   void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
>   void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
>   u8 dp_panel_get_misc_colorimetry_val(struct dp_panel *dp_panel);
> +void dp_panel_config_dsc(struct dp_panel *dp_panel, bool enable);
> +void dp_panel_convert_to_dp_mode(struct dp_panel *dp_panel,
> +		struct dp_display_mode *dp_mode);
>   
>   /**
>    * is_link_rate_valid() - validates the link rate
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2686028..96d48d0c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -1,6 +1,7 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
>    * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2023. Qualcomm Innovation Center, Inc. All rights reserved
>    */
>   
>   #ifndef _DP_REG_H_
> @@ -167,7 +168,38 @@
>   #define MMSS_DP_PSR_CRC_RG			(0x00000154)
>   #define MMSS_DP_PSR_CRC_B			(0x00000158)
>   
> -#define REG_DP_COMPRESSION_MODE_CTRL		(0x00000180)
> +#define DP_COMPRESSION_MODE_CTRL		(0x00000180)
> +#define DP_PPS_HB_0_3				(0x00000184)
> +#define DP_PPS_PB_0_3				(0x00000188)
> +#define DP_PPS_PB_4_7				(0x0000018C)
> +#define DP_PPS_PB_8_11				(0x00000190)
> +#define DP_PPS_PB_12_15				(0x00000194)
> +#define DP_PPS_PB_16_19				(0x00000198)
> +#define DP_PPS_PB_20_23				(0x0000019C)
> +#define DP_PPS_PB_24_27				(0x000001A0)
> +#define DP_PPS_PB_28_31				(0x000001A4)
> +#define DP_PPS_PPS_0_3				(0x000001A8)
> +#define DP_PPS_PPS_4_7				(0x000001AC)
> +#define DP_PPS_PPS_8_11				(0x000001B0)
> +#define DP_PPS_PPS_12_15			(0x000001B4)
> +#define DP_PPS_PPS_16_19			(0x000001B8)
> +#define DP_PPS_PPS_20_23			(0x000001BC)
> +#define DP_PPS_PPS_24_27			(0x000001C0)
> +#define DP_PPS_PPS_28_31			(0x000001C4)
> +#define DP_PPS_PPS_32_35			(0x000001C8)
> +#define DP_PPS_PPS_36_39			(0x000001CC)
> +#define DP_PPS_PPS_40_43			(0x000001D0)
> +#define DP_PPS_PPS_44_47			(0x000001D4)
> +#define DP_PPS_PPS_48_51			(0x000001D8)
> +#define DP_PPS_PPS_52_55			(0x000001DC)
> +#define DP_PPS_PPS_56_59			(0x000001E0)
> +#define DP_PPS_PPS_60_63			(0x000001E4)
> +#define DP_PPS_PPS_64_67			(0x000001E8)
> +#define DP_PPS_PPS_68_71			(0x000001EC)
> +#define DP_PPS_PPS_72_75			(0x000001F0)
> +#define DP_PPS_PPS_76_79			(0x000001F4)
> +#define DP_PPS_PPS_80_83			(0x000001F8)
> +#define DP_PPS_PPS_84_87			(0x000001FC)
>   
>   #define MMSS_DP_AUDIO_CFG			(0x00000200)
>   #define MMSS_DP_AUDIO_STATUS			(0x00000204)
> @@ -178,6 +210,8 @@
>   
>   #define MMSS_DP_SDP_CFG				(0x00000228)
>   #define MMSS_DP_SDP_CFG2			(0x0000022C)
> +#define MMSS_DP_SDP_CFG3			(0x0000024C)
> +#define MMSS_DP_SDP_CFG4			(0x000004EC)
>   #define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
>   #define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
>   
> @@ -210,6 +244,9 @@
>   #define MMSS_DP_AUDIO_INFOFRAME_1		(0x000002AC)
>   #define MMSS_DP_AUDIO_INFOFRAME_2		(0x000002B0)
>   
> +#define MMSS_DP_FLUSH				(0x000002F8)
> +#define MMSS_DP1_FLUSH				(0x000002FC)
> +
>   #define MMSS_DP_GENERIC0_0			(0x00000300)
>   #define MMSS_DP_GENERIC0_1			(0x00000304)
>   #define MMSS_DP_GENERIC0_2			(0x00000308)
> @@ -268,6 +305,7 @@
>   
>   #define MMSS_DP_TPG_MAIN_CONTROL		(0x00000060)
>   #define MMSS_DP_DSC_DTO				(0x0000007C)
> +#define MMSS_DP_DSC_DTO_COUNT			(0x00000084)
>   #define DP_TPG_CHECKERED_RECT_PATTERN		(0x00000100)
>   
>   #define MMSS_DP_TPG_VIDEO_CONFIG		(0x00000064)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index cf4eb8d..6a46ed7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -476,6 +476,11 @@ void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_displa
>   
>   void msm_dp_debugfs_init(struct msm_dp *dp_display, struct drm_minor *minor);
>   bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
> +struct msm_compression_info *msm_dp_bridge_get_compression(struct drm_bridge *drm_bridge);
> +
> +void msm_dp_bridge_mode_set(struct drm_bridge *bridge,
> +				struct drm_display_mode *mode,
> +				struct drm_display_mode *adjusted_mode);

Why do you need to export this function?

>   
>   #else
>   static inline int __init msm_dp_register(void)
> @@ -510,6 +515,17 @@ static inline bool msm_dp_wide_bus_available(const struct msm_dp *dp_display)
>   	return false;
>   }
>   
> +static inline struct msm_compression_info *msm_dp_bridge_get_compression(
> +				struct drm_bridge *drm_bridge)
> +{
> +	return NULL;
> +}
> +static inline void msm_dp_bridge_mode_set(struct drm_bridge *bridge,
> +				struct drm_display_mode *mode,
> +				struct drm_display_mode *adjusted_mode)
> +{
> +
> +}
>   #endif
>   
>   #ifdef CONFIG_DRM_MSM_MDP4

-- 
With best wishes
Dmitry

