Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457E9678C4B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 00:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868B010E5D9;
	Mon, 23 Jan 2023 23:56:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B11110E219
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 23:56:17 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id 18so16528331edw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 15:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pPNhSAw/z7h70LdfhbtUBAIe8d37mc/gIRx5pLphU6I=;
 b=MAsgP1dw4KHhIxYQUmXwrFq4MVNIy8u4J4xExkoLB09x0w4dtflvW7JD7+Ua21t1oG
 zVTbkZDWT11QCQ4epWHAxnFse2/gmSkvQed8QTN7pKBINEmWsRmHJXLdWex+3VBhsoU8
 Mdowza/2w2LGDAZDGbKvX1uRc+CNiUBi0N1jaGg0l3hCV9T7JtOjSqusG+ExKGEjICKE
 zSaHhEnBm0sgIgvSUBF+OeOIH42c+gmJTihKz1bBTcxcZbJ1t0Pd5lA+RhYloQhtDba/
 CeLeJQLft3IlKJpK2mtiQOZA53BtcS1mxvdQo9T7MOO+M7EoGUHew+IYkSA/CNXbbkMy
 ITjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPNhSAw/z7h70LdfhbtUBAIe8d37mc/gIRx5pLphU6I=;
 b=5euCFCv0hcikinCCH4Tqhd1tGiJ5LHPyzP/VapP21cvvwoaxAzQp0AUiMFJCOc4YXt
 JJhEx69meHjc/WQ7FtdWcy2wIyh00c3O0xpCsa6bbPPpuOjWjP0ihxb5A5Zxy7SKlTll
 85wC93dEsTE4AwI3wxCnGctDZd/+td2Bmyennv/meZf76rofFMrc/TbEox1+BYlWE4F0
 Rws67E+hm98eEDcz9+vdp7kYkl6s4h66cUN+8mCCws7C8n3yUovVAjWJt9YQ5ufdWopN
 F5yk7a8STFPI50/5Bjm7C7Tm0aGx5awUgtdEDg7OFBRJlAC4vCKvuRiULzsE52ycPJr3
 8VTA==
X-Gm-Message-State: AFqh2kp6WMFUKSCZGwMQ1GfReiqOTV9yqR0CpwdOV90HH+TlJpSSN45f
 mmfCSaJGo47mrwigF/nzG8QfBw==
X-Google-Smtp-Source: AMrXdXvVBrGr66nSZlTYUbs+n++m5I2ZbPExy6nGJViDVip/hfUtVHHuljctV9faw7y+NU/zEdRz2g==
X-Received: by 2002:a05:6402:3220:b0:49e:1d59:794f with SMTP id
 g32-20020a056402322000b0049e1d59794fmr34038753eda.22.1674518175873; 
 Mon, 23 Jan 2023 15:56:15 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa7c796000000b004972644b19fsm339577eds.16.2023.01.23.15.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 15:56:15 -0800 (PST)
Message-ID: <8447b199-1fe7-e67e-67d1-e6352df0df80@linaro.org>
Date: Tue, 24 Jan 2023 01:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 05/14] drm/msm/dp: upgrade tu calculation base on
 newest algorithm
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1674498274-6010-1-git-send-email-quic_khsieh@quicinc.com>
 <1674498274-6010-6-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674498274-6010-6-git-send-email-quic_khsieh@quicinc.com>
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
> At display port, the pixel data is packed into TU (transfer units)
> which is used to carry main video stream data during its horizontal active
> period. TUs are mapping into the main-Link to facilitate the support of
> various lane counts regardless of the pixel bit depth and colorimetry
> format. Stuffing symbols are required if packed data rate less than link
> symbol rate. TU size is calculated base on factors such as, pixel rate,
> BPP, main link rate, main link lane and etc, and shall be 32 to 64
> link symbols per lane. Each vendor has its own algorithm to calculate
> TU size. This patch upgrade TU size calculation base on newest algorithm.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_ctrl.c | 702 +++++++++++++++++++++++----------------
>   1 file changed, 416 insertions(+), 286 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index d0d1848..ae9c2b8 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -182,18 +182,24 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>    */
>   struct tu_algo_data {
>   	s64 lclk_fp;
> +	s64 orig_lclk_fp;
>   	s64 pclk_fp;
> +	s64 orig_pclk_fp;
>   	s64 lwidth;
>   	s64 lwidth_fp;
> +	int orig_lwidth;
>   	s64 hbp_relative_to_pclk;
>   	s64 hbp_relative_to_pclk_fp;
>   	int nlanes;
> +	int orig_hbp;
>   	int bpp;
>   	int pixelEnc;
>   	int dsc_en;
>   	int async_en;
> +	int fec_en;
>   	int bpc;
>   
> +	int rb2;
>   	uint delay_start_link_extra_pixclk;
>   	int extra_buffer_margin;
>   	s64 ratio_fp;
> @@ -250,19 +256,30 @@ struct tu_algo_data {
>   	int even_distribution_BF;
>   	int even_distribution_legacy;
>   	int even_distribution;
> +
> +	int hbp_delayStartCheck;
> +	int pre_tu_hw_pipe_delay;
> +	int post_tu_hw_pipe_delay;
> +	int link_config_hactive_time;
> +	int delay_start_link_lclk;
> +	int tu_active_cycles;
> +	s64 parity_symbols;
> +	int resolution_line_time;
> +	int last_partial_lclk;
> +
>   	int min_hblank_violated;
>   	s64 delay_start_time_fp;
>   	s64 hbp_time_fp;
>   	s64 hactive_time_fp;
>   	s64 diff_abs_fp;
> -
> +	int second_loop_set;
>   	s64 ratio;
>   };
>   
>   static int _tu_param_compare(s64 a, s64 b)
>   {
> -	u32 a_sign;
> -	u32 b_sign;
> +	u32 a_int, a_frac, a_sign;
> +	u32 b_int, b_frac, b_sign;
>   	s64 a_temp, b_temp, minus_1;
>   
>   	if (a == b)
> @@ -270,8 +287,12 @@ static int _tu_param_compare(s64 a, s64 b)
>   
>   	minus_1 = drm_fixp_from_fraction(-1, 1);
>   
> +	a_int = (a >> 32) & 0x7FFFFFFF;
> +	a_frac = a & 0xFFFFFFFF;
>   	a_sign = (a >> 32) & 0x80000000 ? 1 : 0;
>   
> +	b_int = (b >> 32) & 0x7FFFFFFF;
> +	b_frac = b & 0xFFFFFFFF;
>   	b_sign = (b >> 32) & 0x80000000 ? 1 : 0;
>   
>   	if (a_sign > b_sign)
> @@ -295,6 +316,21 @@ static int _tu_param_compare(s64 a, s64 b)
>   	}
>   }
>   
> +static s64 fixp_subtract(s64 a, s64 b)
> +{
> +	s64 minus_1 = drm_fixp_from_fraction(-1, 1);
> +
> +	if (a >= b)
> +		return a - b;
> +
> +	return drm_fixp_mul(b - a, minus_1);
> +}
> +
> +static inline int fixp2int_ceil(s64 a)
> +{
> +	return a ? drm_fixp2int_ceil(a) : 0;
> +}
> +
>   static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
>   					struct tu_algo_data *tu)
>   {
> @@ -305,6 +341,7 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
>   	s64 pclk_dsc_fp;
>   	s64 dwidth_dsc_fp;
>   	s64 hbp_dsc_fp;
> +	s64 overhead_dsc;
>   
>   	int tot_num_eoc_symbols = 0;
>   	int tot_num_hor_bytes   = 0;
> @@ -315,16 +352,22 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
>   	s64 temp1_fp, temp2_fp, temp3_fp;
>   
>   	tu->lclk_fp              = drm_fixp_from_fraction(in->lclk, 1);
> +	tu->orig_lclk_fp         = tu->lclk_fp;
>   	tu->pclk_fp              = drm_fixp_from_fraction(in->pclk_khz, 1000);
> +	tu->orig_pclk_fp         = tu->pclk_fp;
>   	tu->lwidth               = in->hactive;
>   	tu->hbp_relative_to_pclk = in->hporch;
>   	tu->nlanes               = in->nlanes;
>   	tu->bpp                  = in->bpp;
>   	tu->pixelEnc             = in->pixel_enc;
>   	tu->dsc_en               = in->dsc_en;
> +	tu->fec_en               = in->fec_en;
>   	tu->async_en             = in->async_en;
>   	tu->lwidth_fp            = drm_fixp_from_fraction(in->hactive, 1);
> +	tu->orig_lwidth          = in->hactive;
>   	tu->hbp_relative_to_pclk_fp = drm_fixp_from_fraction(in->hporch, 1);
> +	tu->orig_hbp             = in->hporch;
> +	tu->rb2                  = (in->hporch <= 80) ? 1 : 0;
>   
>   	if (tu->pixelEnc == 420) {
>   		temp1_fp = drm_fixp_from_fraction(2, 1);
> @@ -378,6 +421,7 @@ static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
>   	dwidth_dsc_bytes = (tot_num_hor_bytes +
>   				tot_num_eoc_symbols +
>   				(eoc_bytes == 0 ? 0 : tot_num_dummy_bytes));
> +	overhead_dsc     = dwidth_dsc_bytes / tot_num_hor_bytes;
>   
>   	dwidth_dsc_fp = drm_fixp_from_fraction(dwidth_dsc_bytes, 3);
>   
> @@ -409,12 +453,12 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
>   	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
>   
> -	tu->new_valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
> +	tu->new_valid_boundary_link = fixp2int_ceil(temp2_fp);
>   
>   	temp = (tu->i_upper_boundary_count *
>   				tu->new_valid_boundary_link +
>   				tu->i_lower_boundary_count *
> -				(tu->new_valid_boundary_link-1));
> +				(tu->new_valid_boundary_link - 1));
>   	tu->average_valid2_fp = drm_fixp_from_fraction(temp,
>   					(tu->i_upper_boundary_count +
>   					tu->i_lower_boundary_count));
> @@ -489,11 +533,11 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   
>   	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
>   	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
> -	tu->n_n_err_fp = tu->effective_valid_fp - temp2_fp;
> +	tu->n_n_err_fp = fixp_subtract(tu->effective_valid_fp, temp2_fp);
>   
>   	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
>   	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
> -	tu->n_err_fp = tu->average_valid2_fp - temp2_fp;
> +	tu->n_err_fp = fixp_subtract(tu->average_valid2_fp, temp2_fp);
>   
>   	tu->even_distribution = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
>   
> @@ -501,11 +545,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	temp2_fp = tu->lwidth_fp;
>   	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
>   	temp2_fp = drm_fixp_div(temp1_fp, tu->average_valid2_fp);
> -
> -	if (temp2_fp)
> -		tu->n_tus_incl_last_incomplete_tu = drm_fixp2int_ceil(temp2_fp);
> -	else
> -		tu->n_tus_incl_last_incomplete_tu = 0;
> +	tu->n_tus_incl_last_incomplete_tu = fixp2int_ceil(temp2_fp);
>   
>   	temp1 = 0;
>   	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
> @@ -513,9 +553,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	temp1_fp = tu->average_valid2_fp - temp2_fp;
>   	temp2_fp = drm_fixp_from_fraction(tu->n_tus_incl_last_incomplete_tu, 1);
>   	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
> -
> -	if (temp1_fp)
> -		temp1 = drm_fixp2int_ceil(temp1_fp);
> +	temp1 = fixp2int_ceil(temp1_fp);
>   
>   	temp = tu->i_upper_boundary_count * tu->nlanes;
>   	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
> @@ -524,32 +562,20 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	temp2_fp = temp1_fp - temp2_fp;
>   	temp1_fp = drm_fixp_from_fraction(temp, 1);
>   	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +	temp2 = fixp2int_ceil(temp2_fp);
>   
> -	if (temp2_fp)
> -		temp2 = drm_fixp2int_ceil(temp2_fp);
> -	else
> -		temp2 = 0;
>   	tu->extra_required_bytes_new_tmp = (int)(temp1 + temp2);
>   
>   	temp1_fp = drm_fixp_from_fraction(8, tu->bpp);
>   	temp2_fp = drm_fixp_from_fraction(
>   	tu->extra_required_bytes_new_tmp, 1);
>   	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
> -
> -	if (temp1_fp)
> -		tu->extra_pclk_cycles_tmp = drm_fixp2int_ceil(temp1_fp);
> -	else
> -		tu->extra_pclk_cycles_tmp = 0;
> +	tu->extra_pclk_cycles_tmp = fixp2int_ceil(temp1_fp);
>   
>   	temp1_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles_tmp, 1);
>   	temp2_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
>   	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> -
> -	if (temp1_fp)
> -		tu->extra_pclk_cycles_in_link_clk_tmp =
> -						drm_fixp2int_ceil(temp1_fp);
> -	else
> -		tu->extra_pclk_cycles_in_link_clk_tmp = 0;
> +	tu->extra_pclk_cycles_in_link_clk_tmp = fixp2int_ceil(temp1_fp);
>   
>   	tu->filler_size_tmp = tu->tu_size - tu->new_valid_boundary_link;
>   
> @@ -562,6 +588,57 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link_tmp, 1);
>   	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
>   
> +	if (tu->rb2) {
> +		temp1_fp = drm_fixp_mul(tu->delay_start_time_fp, tu->lclk_fp);
> +		tu->delay_start_link_lclk = fixp2int_ceil(temp1_fp);
> +
> +		if (tu->remainder_tus > tu->i_upper_boundary_count) {
> +			temp = (tu->remainder_tus - tu->i_upper_boundary_count) *
> +							(tu->new_valid_boundary_link - 1);
> +			temp += (tu->i_upper_boundary_count * tu->new_valid_boundary_link);
> +			temp *= tu->nlanes;
> +		} else {
> +			temp = tu->nlanes * tu->remainder_tus * tu->new_valid_boundary_link;
> +		}
> +
> +		temp1 = tu->i_lower_boundary_count * (tu->new_valid_boundary_link - 1);
> +		temp1 += tu->i_upper_boundary_count * tu->new_valid_boundary_link;
> +		temp1 *= tu->paired_tus * tu->nlanes;
> +		temp1_fp = drm_fixp_from_fraction(tu->n_symbols - temp1 - temp, tu->nlanes);
> +		tu->last_partial_lclk = fixp2int_ceil(temp1_fp);
> +
> +		tu->tu_active_cycles = (int)((tu->n_tus_per_lane * tu->tu_size) +
> +								tu->last_partial_lclk);
> +		tu->post_tu_hw_pipe_delay = 4 /*BS_on_the_link*/ + 1 /*BE_next_ren*/;
> +		temp = tu->pre_tu_hw_pipe_delay + tu->delay_start_link_lclk +
> +					tu->tu_active_cycles + tu->post_tu_hw_pipe_delay;
> +
> +		if (tu->fec_en == 1) {
> +			if (tu->nlanes == 1) {
> +				temp1_fp = drm_fixp_from_fraction(temp, 500);
> +				tu->parity_symbols = fixp2int_ceil(temp1_fp) * 12 + 1;
> +			} else {
> +				temp1_fp = drm_fixp_from_fraction(temp, 250);
> +				tu->parity_symbols = fixp2int_ceil(temp1_fp) * 6 + 1;
> +			}
> +		} else { //no fec BW impact
> +			tu->parity_symbols = 0;
> +		}
> +
> +		tu->link_config_hactive_time = temp + tu->parity_symbols;
> +
> +		if (tu->resolution_line_time >= tu->link_config_hactive_time + 1 /*margin*/)
> +			tu->hbp_delayStartCheck = 1;
> +		else
> +			tu->hbp_delayStartCheck = 0;
> +	} else {
> +		compare_result_3 = _tu_param_compare(tu->hbp_time_fp, tu->delay_start_time_fp);
> +		if (compare_result_3 < 2)
> +			tu->hbp_delayStartCheck = 1;
> +		else
> +			tu->hbp_delayStartCheck = 0;
> +	}
> +
>   	compare_result_1 = _tu_param_compare(tu->n_n_err_fp, tu->diff_abs_fp);
>   	if (compare_result_1 == 2)
>   		compare_result_1 = 1;
> @@ -574,13 +651,6 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	else
>   		compare_result_2 = 0;
>   
> -	compare_result_3 = _tu_param_compare(tu->hbp_time_fp,
> -					tu->delay_start_time_fp);
> -	if (compare_result_3 == 2)
> -		compare_result_3 = 0;
> -	else
> -		compare_result_3 = 1;
> -
>   	if (((tu->even_distribution == 1) ||
>   			((tu->even_distribution_BF == 0) &&
>   			(tu->even_distribution_legacy == 0))) &&
> @@ -588,7 +658,7 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   			compare_result_2 &&
>   			(compare_result_1 || (tu->min_hblank_violated == 1)) &&
>   			(tu->new_valid_boundary_link - 1) > 0 &&
> -			compare_result_3 &&
> +			(tu->hbp_delayStartCheck == 1) &&
>   			(tu->delay_start_link_tmp <= 1023)) {
>   		tu->upper_boundary_count = tu->i_upper_boundary_count;
>   		tu->lower_boundary_count = tu->i_lower_boundary_count;
> @@ -607,342 +677,402 @@ static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
>   	}
>   }
>   
> +static void _dp_calc_boundary(struct tu_algo_data *tu)
> +{
> +	s64 temp1_fp = 0, temp2_fp = 0;
> +
> +	do {
> +		tu->err_fp = drm_fixp_from_fraction(1000, 1);
> +
> +		temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
> +		temp2_fp = drm_fixp_from_fraction(
> +				tu->delay_start_link_extra_pixclk, 1);
> +		temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
> +		tu->extra_buffer_margin = fixp2int_ceil(temp1_fp);
> +
> +		temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
> +		temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
> +		tu->n_symbols = fixp2int_ceil(temp1_fp);
> +
> +		for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
> +			for (tu->i_upper_boundary_count = 1;
> +				tu->i_upper_boundary_count <= 15;
> +				tu->i_upper_boundary_count++) {
> +				for (tu->i_lower_boundary_count = 1;
> +					tu->i_lower_boundary_count <= 15;
> +					tu->i_lower_boundary_count++) {
> +					_tu_valid_boundary_calc(tu);
> +				}
> +			}
> +		}
> +		tu->delay_start_link_extra_pixclk--;
> +	} while (!tu->boundary_moderation_en &&
> +		tu->boundary_mod_lower_err == 1 &&
> +		tu->delay_start_link_extra_pixclk != 0 &&
> +		((tu->second_loop_set == 0 && tu->rb2 == 1) || tu->rb2 == 0));
> +}
> +
> +static void _dp_calc_extra_bytes(struct tu_algo_data *tu)
> +{
> +	u64 temp = 0;
> +	s64 temp1_fp = 0, temp2_fp = 0;
> +
> +	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
> +	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
> +	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
> +	temp2_fp = temp1_fp - temp2_fp;
> +	temp1_fp = drm_fixp_from_fraction(tu->n_tus + 1, 1);
> +	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +
> +	temp = drm_fixp2int(temp2_fp);
> +	if (temp)
> +		tu->extra_bytes = fixp2int_ceil(temp2_fp);
> +	else
> +		tu->extra_bytes = 0;
> +
> +	temp1_fp = drm_fixp_from_fraction(tu->extra_bytes, 1);
> +	temp2_fp = drm_fixp_from_fraction(8, tu->bpp);
> +	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +	tu->extra_pclk_cycles = fixp2int_ceil(temp1_fp);
> +
> +	temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
> +	temp2_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles, 1);
> +	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
> +	tu->extra_pclk_cycles_in_link_clk = fixp2int_ceil(temp1_fp);
> +}
> +
> +
>   static void _dp_ctrl_calc_tu(struct dp_ctrl_private *ctrl,
>   				struct dp_tu_calc_input *in,
>   				struct dp_vc_tu_mapping_table *tu_table)
>   {
> -	struct tu_algo_data *tu;
> +	struct tu_algo_data tu;
>   	int compare_result_1, compare_result_2;
> -	u64 temp = 0;
> +	u64 temp = 0, temp1;
>   	s64 temp_fp = 0, temp1_fp = 0, temp2_fp = 0;
>   
>   	s64 LCLK_FAST_SKEW_fp = drm_fixp_from_fraction(6, 10000); /* 0.0006 */
> -	s64 const_p49_fp = drm_fixp_from_fraction(49, 100); /* 0.49 */
> -	s64 const_p56_fp = drm_fixp_from_fraction(56, 100); /* 0.56 */
>   	s64 RATIO_SCALE_fp = drm_fixp_from_fraction(1001, 1000);
>   
>   	u8 DP_BRUTE_FORCE = 1;
>   	s64 BRUTE_FORCE_THRESHOLD_fp = drm_fixp_from_fraction(1, 10); /* 0.1 */
>   	uint EXTRA_PIXCLK_CYCLE_DELAY = 4;
> -	uint HBLANK_MARGIN = 4;
> +	s64 HBLANK_MARGIN = drm_fixp_from_fraction(4, 1);
> +	s64 HBLANK_MARGIN_EXTRA = 0;
>   
> -	tu = kzalloc(sizeof(*tu), GFP_KERNEL);
> -	if (!tu)
> -		return;
>   
> -	dp_panel_update_tu_timings(in, tu);
> +	memset(&tu, 0, sizeof(tu));
>   
> -	tu->err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
> +	dp_panel_update_tu_timings(in, &tu);
> +
> +	tu.err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
>   
>   	temp1_fp = drm_fixp_from_fraction(4, 1);
> -	temp2_fp = drm_fixp_mul(temp1_fp, tu->lclk_fp);
> -	temp_fp = drm_fixp_div(temp2_fp, tu->pclk_fp);
> -	tu->extra_buffer_margin = drm_fixp2int_ceil(temp_fp);
> +	temp2_fp = drm_fixp_mul(temp1_fp, tu.lclk_fp);
> +	temp_fp = drm_fixp_div(temp2_fp, tu.pclk_fp);
> +	tu.extra_buffer_margin = fixp2int_ceil(temp_fp);
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
> -	temp2_fp = drm_fixp_mul(tu->pclk_fp, temp1_fp);
> -	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
> +	if (in->compress_ratio == 375 && tu.bpp == 30)
> +		temp1_fp = drm_fixp_from_fraction(24, 8);
> +	else
> +		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
> +
> +	temp2_fp = drm_fixp_mul(tu.pclk_fp, temp1_fp);
> +	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
>   	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
> -	tu->ratio_fp = drm_fixp_div(temp2_fp, tu->lclk_fp);
> -
> -	tu->original_ratio_fp = tu->ratio_fp;
> -	tu->boundary_moderation_en = false;
> -	tu->upper_boundary_count = 0;
> -	tu->lower_boundary_count = 0;
> -	tu->i_upper_boundary_count = 0;
> -	tu->i_lower_boundary_count = 0;
> -	tu->valid_lower_boundary_link = 0;
> -	tu->even_distribution_BF = 0;
> -	tu->even_distribution_legacy = 0;
> -	tu->even_distribution = 0;
> -	tu->delay_start_time_fp = 0;
> -
> -	tu->err_fp = drm_fixp_from_fraction(1000, 1);
> -	tu->n_err_fp = 0;
> -	tu->n_n_err_fp = 0;
> -
> -	tu->ratio = drm_fixp2int(tu->ratio_fp);
> -	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
> -	div64_u64_rem(tu->lwidth_fp, temp1_fp, &temp2_fp);
> -	if (temp2_fp != 0 &&
> -			!tu->ratio && tu->dsc_en == 0) {
> -		tu->ratio_fp = drm_fixp_mul(tu->ratio_fp, RATIO_SCALE_fp);
> -		tu->ratio = drm_fixp2int(tu->ratio_fp);
> -		if (tu->ratio)
> -			tu->ratio_fp = drm_fixp_from_fraction(1, 1);
> +	tu.ratio_fp = drm_fixp_div(temp2_fp, tu.lclk_fp);
> +
> +	tu.original_ratio_fp = tu.ratio_fp;
> +	tu.boundary_moderation_en = false;
> +	tu.upper_boundary_count = 0;
> +	tu.lower_boundary_count = 0;
> +	tu.i_upper_boundary_count = 0;
> +	tu.i_lower_boundary_count = 0;
> +	tu.valid_lower_boundary_link = 0;
> +	tu.even_distribution_BF = 0;
> +	tu.even_distribution_legacy = 0;
> +	tu.even_distribution = 0;
> +	tu.hbp_delayStartCheck = 0;
> +	tu.pre_tu_hw_pipe_delay = 0;
> +	tu.post_tu_hw_pipe_delay = 0;
> +	tu.link_config_hactive_time = 0;
> +	tu.delay_start_link_lclk = 0;
> +	tu.tu_active_cycles = 0;
> +	tu.resolution_line_time = 0;
> +	tu.last_partial_lclk = 0;
> +	tu.delay_start_time_fp = 0;
> +	tu.second_loop_set = 0;
> +
> +	tu.err_fp = drm_fixp_from_fraction(1000, 1);
> +	tu.n_err_fp = 0;
> +	tu.n_n_err_fp = 0;
> +
> +	temp = drm_fixp2int(tu.lwidth_fp);
> +	if ((((u32)temp % tu.nlanes) != 0) && (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 2)
> +			&& (tu.dsc_en == 0)) {
> +		tu.ratio_fp = drm_fixp_mul(tu.ratio_fp, RATIO_SCALE_fp);
> +		if (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 1)
> +			tu.ratio_fp = DRM_FIXED_ONE;
>   	}
>   
> -	if (tu->ratio > 1)
> -		tu->ratio = 1;
> +	if (_tu_param_compare(tu.ratio_fp, DRM_FIXED_ONE) == 1)
> +		tu.ratio_fp = DRM_FIXED_ONE;
>   
> -	if (tu->ratio == 1)
> -		goto tu_size_calc;
> -
> -	compare_result_1 = _tu_param_compare(tu->ratio_fp, const_p49_fp);
> -	if (!compare_result_1 || compare_result_1 == 1)
> -		compare_result_1 = 1;
> -	else
> -		compare_result_1 = 0;
> -
> -	compare_result_2 = _tu_param_compare(tu->ratio_fp, const_p56_fp);
> -	if (!compare_result_2 || compare_result_2 == 2)
> -		compare_result_2 = 1;
> -	else
> -		compare_result_2 = 0;
> -
> -	if (tu->dsc_en && compare_result_1 && compare_result_2) {
> -		HBLANK_MARGIN += 4;
> -		drm_dbg_dp(ctrl->drm_dev,
> -			"increase HBLANK_MARGIN to %d\n", HBLANK_MARGIN);
> +	if (HBLANK_MARGIN_EXTRA != 0) {
> +		HBLANK_MARGIN += HBLANK_MARGIN_EXTRA;
> +		DRM_DEBUG("Info: increase HBLANK_MARGIN to %d. (PLUS%d)\n", HBLANK_MARGIN,
> +			HBLANK_MARGIN_EXTRA);

This code results in format string warnings.

>   	}
>   
> -tu_size_calc:
> -	for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
> -		temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
> -		temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
> -		temp = drm_fixp2int_ceil(temp2_fp);
> +	for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
> +		temp1_fp = drm_fixp_from_fraction(tu.tu_size, 1);
> +		temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
> +		temp = fixp2int_ceil(temp2_fp);
>   		temp1_fp = drm_fixp_from_fraction(temp, 1);
> -		tu->n_err_fp = temp1_fp - temp2_fp;
> +		tu.n_err_fp = temp1_fp - temp2_fp;
>   
> -		if (tu->n_err_fp < tu->err_fp) {
> -			tu->err_fp = tu->n_err_fp;
> -			tu->tu_size_desired = tu->tu_size;
> +		if (tu.n_err_fp < tu.err_fp) {
> +			tu.err_fp = tu.n_err_fp;
> +			tu.tu_size_desired = tu.tu_size;
>   		}
>   	}
>   
> -	tu->tu_size_minus1 = tu->tu_size_desired - 1;
> +	tu.tu_size_minus1 = tu.tu_size_desired - 1;
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
> -	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
> -	tu->valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
> +	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
> +	temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
> +	tu.valid_boundary_link = fixp2int_ceil(temp2_fp);
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
> -	temp2_fp = tu->lwidth_fp;
> +	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
> +	temp2_fp = tu.lwidth_fp;
>   	temp2_fp = drm_fixp_mul(temp2_fp, temp1_fp);
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
> +	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
>   	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
> -	tu->n_tus = drm_fixp2int(temp2_fp);
> +	tu.n_tus = drm_fixp2int(temp2_fp);
>   	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
> -		tu->n_tus += 1;
> -
> -	tu->even_distribution_legacy = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
> -
> -	drm_dbg_dp(ctrl->drm_dev,
> -			"n_sym = %d, num_of_tus = %d\n",
> -			tu->valid_boundary_link, tu->n_tus);
> -
> -	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
> -	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
> -	temp1_fp = drm_fixp_from_fraction(tu->valid_boundary_link, 1);
> -	temp2_fp = temp1_fp - temp2_fp;
> -	temp1_fp = drm_fixp_from_fraction(tu->n_tus + 1, 1);
> -	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> -
> -	temp = drm_fixp2int(temp2_fp);
> -	if (temp && temp2_fp)
> -		tu->extra_bytes = drm_fixp2int_ceil(temp2_fp);
> -	else
> -		tu->extra_bytes = 0;
> -
> -	temp1_fp = drm_fixp_from_fraction(tu->extra_bytes, 1);
> -	temp2_fp = drm_fixp_from_fraction(8, tu->bpp);
> -	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +		tu.n_tus += 1;
>   
> -	if (temp && temp1_fp)
> -		tu->extra_pclk_cycles = drm_fixp2int_ceil(temp1_fp);
> -	else
> -		tu->extra_pclk_cycles = drm_fixp2int(temp1_fp);
> +	tu.even_distribution_legacy = tu.n_tus % tu.nlanes == 0 ? 1 : 0;
> +	DRM_DEBUG("Info: n_sym = %d, num_of_tus = %d\n",
> +		tu.valid_boundary_link, tu.n_tus);
>   
> -	temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
> -	temp2_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles, 1);
> -	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
> +	_dp_calc_extra_bytes(&tu);
>   
> -	if (temp1_fp)
> -		tu->extra_pclk_cycles_in_link_clk = drm_fixp2int_ceil(temp1_fp);
> -	else
> -		tu->extra_pclk_cycles_in_link_clk = drm_fixp2int(temp1_fp);
> +	tu.filler_size = tu.tu_size_desired - tu.valid_boundary_link;
>   
> -	tu->filler_size = tu->tu_size_desired - tu->valid_boundary_link;
> +	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
> +	tu.ratio_by_tu_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
> -	tu->ratio_by_tu_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
> -
> -	tu->delay_start_link = tu->extra_pclk_cycles_in_link_clk +
> -				tu->filler_size + tu->extra_buffer_margin;
> +	tu.delay_start_link = tu.extra_pclk_cycles_in_link_clk +
> +				tu.filler_size + tu.extra_buffer_margin;
>   
> -	tu->resulting_valid_fp =
> -			drm_fixp_from_fraction(tu->valid_boundary_link, 1);
> +	tu.resulting_valid_fp =
> +			drm_fixp_from_fraction(tu.valid_boundary_link, 1);
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->tu_size_desired, 1);
> -	temp2_fp = drm_fixp_div(tu->resulting_valid_fp, temp1_fp);
> -	tu->TU_ratio_err_fp = temp2_fp - tu->original_ratio_fp;
> +	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
> +	temp2_fp = drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
> +	tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
>   
> -	temp1_fp = drm_fixp_from_fraction(HBLANK_MARGIN, 1);
> -	temp1_fp = tu->hbp_relative_to_pclk_fp - temp1_fp;
> -	tu->hbp_time_fp = drm_fixp_div(temp1_fp, tu->pclk_fp);
> +	temp1_fp = drm_fixp_from_fraction((tu.hbp_relative_to_pclk - HBLANK_MARGIN), 1);
> +	tu.hbp_time_fp = drm_fixp_div(temp1_fp, tu.pclk_fp);
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link, 1);
> -	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
> +	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
> +	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
>   
> -	compare_result_1 = _tu_param_compare(tu->hbp_time_fp,
> -					tu->delay_start_time_fp);
> -	if (compare_result_1 == 2) /* if (hbp_time_fp < delay_start_time_fp) */
> -		tu->min_hblank_violated = 1;
> +	compare_result_1 = _tu_param_compare(tu.hbp_time_fp,
> +					tu.delay_start_time_fp);
> +	if (compare_result_1 == 2) /* hbp_time_fp < delay_start_time_fp */
> +		tu.min_hblank_violated = 1;
>   
> -	tu->hactive_time_fp = drm_fixp_div(tu->lwidth_fp, tu->pclk_fp);
> +	tu.hactive_time_fp = drm_fixp_div(tu.lwidth_fp, tu.pclk_fp);
>   
> -	compare_result_2 = _tu_param_compare(tu->hactive_time_fp,
> -						tu->delay_start_time_fp);
> +	compare_result_2 = _tu_param_compare(tu.hactive_time_fp,
> +						tu.delay_start_time_fp);
>   	if (compare_result_2 == 2)
> -		tu->min_hblank_violated = 1;
> -
> -	tu->delay_start_time_fp = 0;
> +		tu.min_hblank_violated = 1;
>   
>   	/* brute force */
>   
> -	tu->delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
> -	tu->diff_abs_fp = tu->resulting_valid_fp - tu->ratio_by_tu_fp;
> +	tu.delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
> +	tu.diff_abs_fp = tu.resulting_valid_fp - tu.ratio_by_tu_fp;
>   
> -	temp = drm_fixp2int(tu->diff_abs_fp);
> -	if (!temp && tu->diff_abs_fp <= 0xffff)
> -		tu->diff_abs_fp = 0;
> +	temp = drm_fixp2int(tu.diff_abs_fp);
> +	if (!temp && tu.diff_abs_fp <= 0xffff)
> +		tu.diff_abs_fp = 0;
>   
>   	/* if(diff_abs < 0) diff_abs *= -1 */
> -	if (tu->diff_abs_fp < 0)
> -		tu->diff_abs_fp = drm_fixp_mul(tu->diff_abs_fp, -1);
> +	if (tu.diff_abs_fp < 0)
> +		tu.diff_abs_fp = drm_fixp_mul(tu.diff_abs_fp, -1);
> +
> +	tu.boundary_mod_lower_err = 0;
> +
> +	temp1_fp = drm_fixp_div(tu.orig_lclk_fp, tu.orig_pclk_fp);
> +
> +	temp2_fp = drm_fixp_from_fraction(tu.orig_lwidth + tu.orig_hbp, 2);
> +	temp_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +	tu.resolution_line_time = drm_fixp2int(temp_fp);
> +	tu.pre_tu_hw_pipe_delay = fixp2int_ceil(temp1_fp) + 2 /*cdc fifo write jitter+2*/
> +				+ 3 /*pre-delay start cycles*/
> +				+ 3 /*post-delay start cycles*/ + 1 /*BE on the link*/;
> +	tu.post_tu_hw_pipe_delay = 4 /*BS_on_the_link*/ + 1 /*BE_next_ren*/;
> +
> +	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
> +	temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
> +	tu.n_symbols = fixp2int_ceil(temp1_fp);
> +
> +	if (tu.rb2) {
> +		temp1_fp = drm_fixp_mul(tu.delay_start_time_fp, tu.lclk_fp);
> +		tu.delay_start_link_lclk = fixp2int_ceil(temp1_fp);
> +
> +		tu.new_valid_boundary_link = tu.valid_boundary_link;
> +		tu.i_upper_boundary_count = 1;
> +		tu.i_lower_boundary_count = 0;
> +
> +		temp1 = tu.i_upper_boundary_count * tu.new_valid_boundary_link;
> +		temp1 += tu.i_lower_boundary_count * (tu.new_valid_boundary_link - 1);
> +		tu.average_valid2_fp = drm_fixp_from_fraction(temp1,
> +				(tu.i_upper_boundary_count + tu.i_lower_boundary_count));
> +
> +		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
> +		temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
> +		temp2_fp = drm_fixp_div(temp1_fp, tu.average_valid2_fp);
> +		tu.n_tus = drm_fixp2int(temp2_fp);
> +
> +		tu.n_tus_per_lane = tu.n_tus / tu.nlanes;
> +		tu.paired_tus = (int)((tu.n_tus_per_lane) /
> +				(tu.i_upper_boundary_count + tu.i_lower_boundary_count));
> +
> +		tu.remainder_tus = tu.n_tus_per_lane - tu.paired_tus *
> +				(tu.i_upper_boundary_count + tu.i_lower_boundary_count);
> +
> +		if (tu.remainder_tus > tu.i_upper_boundary_count) {
> +			temp = (tu.remainder_tus - tu.i_upper_boundary_count) *
> +							(tu.new_valid_boundary_link - 1);
> +			temp += (tu.i_upper_boundary_count * tu.new_valid_boundary_link);
> +			temp *= tu.nlanes;
> +		} else {
> +			temp = tu.nlanes * tu.remainder_tus * tu.new_valid_boundary_link;
> +		}
>   
> -	tu->boundary_mod_lower_err = 0;
> -	if ((tu->diff_abs_fp != 0 &&
> -			((tu->diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
> -			 (tu->even_distribution_legacy == 0) ||
> -			 (DP_BRUTE_FORCE == 1))) ||
> -			(tu->min_hblank_violated == 1)) {
> -		do {
> -			tu->err_fp = drm_fixp_from_fraction(1000, 1);
> +		temp1 = tu.i_lower_boundary_count * (tu.new_valid_boundary_link - 1);
> +		temp1 += tu.i_upper_boundary_count * tu.new_valid_boundary_link;
> +		temp1 *= tu.paired_tus * tu.nlanes;
> +		temp1_fp = drm_fixp_from_fraction(tu.n_symbols - temp1 - temp, tu.nlanes);
> +		tu.last_partial_lclk = fixp2int_ceil(temp1_fp);
> +
> +		tu.tu_active_cycles = (int)((tu.n_tus_per_lane * tu.tu_size) +
> +								tu.last_partial_lclk);
> +
> +		temp = tu.pre_tu_hw_pipe_delay + tu.delay_start_link_lclk +
> +						tu.tu_active_cycles + tu.post_tu_hw_pipe_delay;
> +
> +		if (tu.fec_en == 1) {
> +			if (tu.nlanes == 1) {
> +				temp1_fp = drm_fixp_from_fraction(temp, 500);
> +				tu.parity_symbols = fixp2int_ceil(temp1_fp) * 12 + 1;
> +			} else {
> +				temp1_fp = drm_fixp_from_fraction(temp, 250);
> +				tu.parity_symbols = fixp2int_ceil(temp1_fp) * 6 + 1;
> +			}
> +		} else { //no fec BW impact
> +			tu.parity_symbols = 0;
> +		}
>   
> -			temp1_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
> -			temp2_fp = drm_fixp_from_fraction(
> -					tu->delay_start_link_extra_pixclk, 1);
> -			temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
> +		tu.link_config_hactive_time = temp + tu.parity_symbols;
>   
> -			if (temp1_fp)
> -				tu->extra_buffer_margin =
> -					drm_fixp2int_ceil(temp1_fp);
> -			else
> -				tu->extra_buffer_margin = 0;
> +		if (tu.link_config_hactive_time + 1 /*margin*/ >= tu.resolution_line_time)
> +			tu.min_hblank_violated = 1;
> +	}
>   
> -			temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
> -			temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
> +	tu.delay_start_time_fp = 0;
>   
> -			if (temp1_fp)
> -				tu->n_symbols = drm_fixp2int_ceil(temp1_fp);
> -			else
> -				tu->n_symbols = 0;
> -
> -			for (tu->tu_size = 32; tu->tu_size <= 64; tu->tu_size++) {
> -				for (tu->i_upper_boundary_count = 1;
> -					tu->i_upper_boundary_count <= 15;
> -					tu->i_upper_boundary_count++) {
> -					for (tu->i_lower_boundary_count = 1;
> -						tu->i_lower_boundary_count <= 15;
> -						tu->i_lower_boundary_count++) {
> -						_tu_valid_boundary_calc(tu);
> -					}
> -				}
> -			}
> -			tu->delay_start_link_extra_pixclk--;
> -		} while (tu->boundary_moderation_en != true &&
> -			tu->boundary_mod_lower_err == 1 &&
> -			tu->delay_start_link_extra_pixclk != 0);
> +	if ((tu.diff_abs_fp != 0 &&
> +			((tu.diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
> +			 (tu.even_distribution_legacy == 0) ||
> +			 (DP_BRUTE_FORCE == 1))) ||
> +			(tu.min_hblank_violated == 1)) {
> +		_dp_calc_boundary(&tu);
>   
> -		if (tu->boundary_moderation_en == true) {
> +		if (tu.boundary_moderation_en) {
>   			temp1_fp = drm_fixp_from_fraction(
> -					(tu->upper_boundary_count *
> -					tu->valid_boundary_link +
> -					tu->lower_boundary_count *
> -					(tu->valid_boundary_link - 1)), 1);
> +					(tu.upper_boundary_count *
> +					tu.valid_boundary_link +
> +					tu.lower_boundary_count *
> +					(tu.valid_boundary_link - 1)), 1);
>   			temp2_fp = drm_fixp_from_fraction(
> -					(tu->upper_boundary_count +
> -					tu->lower_boundary_count), 1);
> -			tu->resulting_valid_fp =
> +					(tu.upper_boundary_count +
> +					tu.lower_boundary_count), 1);
> +			tu.resulting_valid_fp =
>   					drm_fixp_div(temp1_fp, temp2_fp);
>   
>   			temp1_fp = drm_fixp_from_fraction(
> -					tu->tu_size_desired, 1);
> -			tu->ratio_by_tu_fp =
> -				drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
> +					tu.tu_size_desired, 1);
> +			tu.ratio_by_tu_fp =
> +				drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
>   
> -			tu->valid_lower_boundary_link =
> -				tu->valid_boundary_link - 1;
> +			tu.valid_lower_boundary_link =
> +				tu.valid_boundary_link - 1;
>   
> -			temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
> -			temp1_fp = drm_fixp_mul(tu->lwidth_fp, temp1_fp);
> +			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
> +			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
>   			temp2_fp = drm_fixp_div(temp1_fp,
> -						tu->resulting_valid_fp);
> -			tu->n_tus = drm_fixp2int(temp2_fp);
> +						tu.resulting_valid_fp);
> +			tu.n_tus = drm_fixp2int(temp2_fp);
>   
> -			tu->tu_size_minus1 = tu->tu_size_desired - 1;
> -			tu->even_distribution_BF = 1;
> +			tu.tu_size_minus1 = tu.tu_size_desired - 1;
> +			tu.even_distribution_BF = 1;
>   
>   			temp1_fp =
> -				drm_fixp_from_fraction(tu->tu_size_desired, 1);
> +				drm_fixp_from_fraction(tu.tu_size_desired, 1);
>   			temp2_fp =
> -				drm_fixp_div(tu->resulting_valid_fp, temp1_fp);
> -			tu->TU_ratio_err_fp = temp2_fp - tu->original_ratio_fp;
> +				drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
> +			tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
>   		}
>   	}
>   
> -	temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu->lwidth_fp);
> +	if (tu.async_en) {
> +		temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu.lwidth_fp);
> +		temp = fixp2int_ceil(temp2_fp);
>   
> -	if (temp2_fp)
> -		temp = drm_fixp2int_ceil(temp2_fp);
> -	else
> -		temp = 0;
> -
> -	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
> -	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
> -	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
> -	temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
> -	temp1_fp = drm_fixp_from_fraction(temp, 1);
> -	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> -	temp = drm_fixp2int(temp2_fp);
> +		temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
> +		temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
> +		temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
> +		temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
> +		temp1_fp = drm_fixp_from_fraction(temp, 1);
> +		temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
> +		temp = drm_fixp2int(temp2_fp);
>   
> -	if (tu->async_en)
> -		tu->delay_start_link += (int)temp;
> +		tu.delay_start_link += (int)temp;
> +	}
>   
> -	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link, 1);
> -	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
> +	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
> +	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
>   
>   	/* OUTPUTS */
> -	tu_table->valid_boundary_link       = tu->valid_boundary_link;
> -	tu_table->delay_start_link          = tu->delay_start_link;
> -	tu_table->boundary_moderation_en    = tu->boundary_moderation_en;
> -	tu_table->valid_lower_boundary_link = tu->valid_lower_boundary_link;
> -	tu_table->upper_boundary_count      = tu->upper_boundary_count;
> -	tu_table->lower_boundary_count      = tu->lower_boundary_count;
> -	tu_table->tu_size_minus1            = tu->tu_size_minus1;
> -
> -	drm_dbg_dp(ctrl->drm_dev, "TU: valid_boundary_link: %d\n",
> -				tu_table->valid_boundary_link);
> -	drm_dbg_dp(ctrl->drm_dev, "TU: delay_start_link: %d\n",
> -				tu_table->delay_start_link);
> -	drm_dbg_dp(ctrl->drm_dev, "TU: boundary_moderation_en: %d\n",
> +	tu_table->valid_boundary_link       = tu.valid_boundary_link;
> +	tu_table->delay_start_link          = tu.delay_start_link;
> +	tu_table->boundary_moderation_en    = tu.boundary_moderation_en;
> +	tu_table->valid_lower_boundary_link = tu.valid_lower_boundary_link;
> +	tu_table->upper_boundary_count      = tu.upper_boundary_count;
> +	tu_table->lower_boundary_count      = tu.lower_boundary_count;
> +	tu_table->tu_size_minus1            = tu.tu_size_minus1;
> +
> +	DRM_DEBUG("TU: valid_boundary_link: %d\n", tu_table->valid_boundary_link);
> +	DRM_DEBUG("TU: delay_start_link: %d\n", tu_table->delay_start_link);
> +	DRM_DEBUG("TU: boundary_moderation_en: %d\n",
>   			tu_table->boundary_moderation_en);
> -	drm_dbg_dp(ctrl->drm_dev, "TU: valid_lower_boundary_link: %d\n",
> +	DRM_DEBUG("TU: valid_lower_boundary_link: %d\n",
>   			tu_table->valid_lower_boundary_link);
> -	drm_dbg_dp(ctrl->drm_dev, "TU: upper_boundary_count: %d\n",
> +	DRM_DEBUG("TU: upper_boundary_count: %d\n",
>   			tu_table->upper_boundary_count);
> -	drm_dbg_dp(ctrl->drm_dev, "TU: lower_boundary_count: %d\n",
> +	DRM_DEBUG("TU: lower_boundary_count: %d\n",
>   			tu_table->lower_boundary_count);
> -	drm_dbg_dp(ctrl->drm_dev, "TU: tu_size_minus1: %d\n",
> -			tu_table->tu_size_minus1);
> -
> -	kfree(tu);
> +	DRM_DEBUG("TU: tu_size_minus1: %d\n", tu_table->tu_size_minus1);
>   }
>   
>   static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
> -		struct dp_vc_tu_mapping_table *tu_table)
> +				struct dp_vc_tu_mapping_table *tu_table)
>   {
>   	struct dp_tu_calc_input in;
>   	struct drm_display_mode *drm_mode;

-- 
With best wishes
Dmitry

