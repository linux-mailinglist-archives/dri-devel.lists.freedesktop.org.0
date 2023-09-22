Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEB37AB484
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 17:13:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF28A10E691;
	Fri, 22 Sep 2023 15:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id D565210E68B;
 Fri, 22 Sep 2023 15:12:58 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxXev0rg1l5QIrAA--.11971S3;
 Fri, 22 Sep 2023 23:12:53 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxfS_yrg1ljk8OAA--.29482S3; 
 Fri, 22 Sep 2023 23:12:52 +0800 (CST)
Message-ID: <8356e5b1-95a6-b4e3-ee8e-5c6c46e6ce0e@loongson.cn>
Date: Fri, 22 Sep 2023 23:12:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [3/8] drm/i915/display: Consider fractional vdsc bpp while
 computing m_n values
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230913060606.1105349-4-mitulkumar.ajitkumar.golani@intel.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230913060606.1105349-4-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxfS_yrg1ljk8OAA--.29482S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JF47ur4xKw1xXryUKFy7twc_yoW7Xr1rpw
 47uFyUCFyrZF1IgFW7JF4UZFW5WwsIqa43Grn8G3sI93ZrAF98JFsYka4UGFyDuFnrAF1f
 Xr97GF13Kw1jvrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
 14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
 0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUrNtx
 DUUUU
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
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com, ankit.k.nautiyal@intel.com,
 swati2.sharma@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 2023/9/13 14:06, Mitul Golani wrote:
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> MTL+ supports fractional compressed bits_per_pixel, with precision of
> 1/16. This compressed bpp is stored in U6.4 format.
> Accommodate this precision while computing m_n values.
>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 6 +++++-
>   drivers/gpu/drm/i915/display/intel_display.h | 2 +-
>   drivers/gpu/drm/i915/display/intel_dp.c      | 5 +++--
>   drivers/gpu/drm/i915/display/intel_dp_mst.c  | 6 ++++--
>   drivers/gpu/drm/i915/display/intel_fdi.c     | 2 +-
>   5 files changed, 14 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index afcbdd4f105a..b37aeac961f4 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -2380,10 +2380,14 @@ void
>   intel_link_compute_m_n(u16 bits_per_pixel, int nlanes,
>   		       int pixel_clock, int link_clock,
>   		       struct intel_link_m_n *m_n,
> -		       bool fec_enable)
> +		       bool fec_enable,
> +		       bool is_dsc_fractional_bpp)
>   {
>   	u32 data_clock = bits_per_pixel * pixel_clock;
>   
> +	if (is_dsc_fractional_bpp)
> +		data_clock = DIV_ROUND_UP(bits_per_pixel * pixel_clock, 16);
> +

The 'bits_per_pixel * pixel_clock' has already been computed
and its result is stored in the 'data_clock' local variable.
can we change it as "data_clock = DIV_ROUND_UP(data_clock, 16)" here ?

>   	if (fec_enable)
>   		data_clock = intel_dp_mode_to_fec_clock(data_clock);
>   
> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
> index 49ac8473b988..a4c4ca3cad65 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.h
> +++ b/drivers/gpu/drm/i915/display/intel_display.h
> @@ -398,7 +398,7 @@ u8 intel_calc_active_pipes(struct intel_atomic_state *state,
>   void intel_link_compute_m_n(u16 bpp, int nlanes,
>   			    int pixel_clock, int link_clock,
>   			    struct intel_link_m_n *m_n,
> -			    bool fec_enable);
> +			    bool fec_enable, bool is_dsc_fractional_bpp);
>   u32 intel_plane_fb_max_stride(struct drm_i915_private *dev_priv,
>   			      u32 pixel_format, u64 modifier);
>   enum drm_mode_status
> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
> index cb647bb38b12..6e09e21909a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@ -2562,7 +2562,7 @@ intel_dp_drrs_compute_config(struct intel_connector *connector,
>   
>   	intel_link_compute_m_n(link_bpp, pipe_config->lane_count, pixel_clock,
>   			       pipe_config->port_clock, &pipe_config->dp_m2_n2,
> -			       pipe_config->fec_enable);
> +			       pipe_config->fec_enable, false);
>   
>   	/* FIXME: abstract this better */
>   	if (pipe_config->splitter.enable)
> @@ -2741,7 +2741,8 @@ intel_dp_compute_config(struct intel_encoder *encoder,
>   			       adjusted_mode->crtc_clock,
>   			       pipe_config->port_clock,
>   			       &pipe_config->dp_m_n,
> -			       pipe_config->fec_enable);
> +			       pipe_config->fec_enable,
> +			       pipe_config->dsc.compression_enable);
>   
>   	/* FIXME: abstract this better */
>   	if (pipe_config->splitter.enable)
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 7bf0b6e4ac0b..8f6bd54532cb 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -172,7 +172,8 @@ static int intel_dp_mst_compute_link_config(struct intel_encoder *encoder,
>   			       adjusted_mode->crtc_clock,
>   			       crtc_state->port_clock,
>   			       &crtc_state->dp_m_n,
> -			       crtc_state->fec_enable);
> +			       crtc_state->fec_enable,
> +			       false);
>   	crtc_state->dp_m_n.tu = slots;
>   
>   	return 0;
> @@ -269,7 +270,8 @@ static int intel_dp_dsc_mst_compute_link_config(struct intel_encoder *encoder,
>   			       adjusted_mode->crtc_clock,
>   			       crtc_state->port_clock,
>   			       &crtc_state->dp_m_n,
> -			       crtc_state->fec_enable);
> +			       crtc_state->fec_enable,
> +			       crtc_state->dsc.compression_enable);
>   	crtc_state->dp_m_n.tu = slots;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/i915/display/intel_fdi.c b/drivers/gpu/drm/i915/display/intel_fdi.c
> index e12b46a84fa1..15fddabf7c2e 100644
> --- a/drivers/gpu/drm/i915/display/intel_fdi.c
> +++ b/drivers/gpu/drm/i915/display/intel_fdi.c
> @@ -259,7 +259,7 @@ int ilk_fdi_compute_config(struct intel_crtc *crtc,
>   	pipe_config->fdi_lanes = lane;
>   
>   	intel_link_compute_m_n(pipe_config->pipe_bpp, lane, fdi_dotclock,
> -			       link_bw, &pipe_config->fdi_m_n, false);
> +			       link_bw, &pipe_config->fdi_m_n, false, false);
>   
>   	ret = ilk_check_fdi_lanes(dev, crtc->pipe, pipe_config);
>   	if (ret == -EDEADLK)

