Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735A7AB570
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 18:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B54C10E69F;
	Fri, 22 Sep 2023 16:03:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id E66BC10E69F;
 Fri, 22 Sep 2023 16:03:08 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8CxfOq5ug1lBQgrAA--.55768S3;
 Sat, 23 Sep 2023 00:03:05 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8DxjNy5ug1lA1sOAA--.29391S3; 
 Sat, 23 Sep 2023 00:03:05 +0800 (CST)
Message-ID: <2ca6b3f8-f11b-afc8-fe84-ef7112691734@loongson.cn>
Date: Sat, 23 Sep 2023 00:03:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [7/8] drm/i915/dsc: Add debugfs entry to validate DSC fractional
 bpp
Content-Language: en-US
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230913060606.1105349-8-mitulkumar.ajitkumar.golani@intel.com>
From: Sui Jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <20230913060606.1105349-8-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8DxjNy5ug1lA1sOAA--.29391S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGw45XF48tF1DZrW8Wr1ktFc_yoW5Cw17p3
 yUuayrAFWrXF42gFyDAF4DWFZI93ykX3W3Kr9xGw15G3WkGr1vyFW8tFyDXFykCryrAry3
 Z3Wq9rW7KFn093gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUU92b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
 Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
 8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
 xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07AlzV
 AYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
 bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
 AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
 42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
 IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
 xhVjvjDU0xZFpf9x07URKZXUUUUU=
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
> From: Swati Sharma <swati2.sharma@intel.com>
>
> DSC_Sink_BPP_Precision entry is added to i915_dsc_fec_support_show
> to depict sink's precision.
> Also, new debugfs entry is created to enforce fractional bpp.
> If Force_DSC_Fractional_BPP_en is set then while iterating over
> output bpp with fractional step size we will continue if output_bpp is
> computed as integer. With this approach, we will be able to validate
> DSC with fractional bpp.
>
> v2:
> Add drm_modeset_unlock to new line(Suraj)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   .../drm/i915/display/intel_display_debugfs.c  | 83 +++++++++++++++++++
>   .../drm/i915/display/intel_display_types.h    |  1 +
>   2 files changed, 84 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> index f05b52381a83..776ab96def1f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
> @@ -1244,6 +1244,8 @@ static int i915_dsc_fec_support_show(struct seq_file *m, void *data)
>   								      DP_DSC_YCbCr420_Native)),
>   			   str_yes_no(drm_dp_dsc_sink_supports_format(intel_dp->dsc_dpcd,
>   								      DP_DSC_YCbCr444)));
> +		seq_printf(m, "DSC_Sink_BPP_Precision: %d\n",
> +			   drm_dp_dsc_sink_bpp_incr(intel_dp->dsc_dpcd));
>   		seq_printf(m, "Force_DSC_Enable: %s\n",
>   			   str_yes_no(intel_dp->force_dsc_en));
>   		if (!intel_dp_is_edp(intel_dp))
> @@ -1436,6 +1438,84 @@ static const struct file_operations i915_dsc_output_format_fops = {
>   	.write = i915_dsc_output_format_write
>   };
>   
> +static int i915_dsc_fractional_bpp_show(struct seq_file *m, void *data)
> +{
> +	struct drm_connector *connector = m->private;
> +	struct drm_device *dev = connector->dev;
> +	struct drm_crtc *crtc;
> +	struct intel_dp *intel_dp;
> +	struct intel_encoder *encoder = intel_attached_encoder(to_intel_connector(connector));

The 'to_intel_connector()' inline function get used twice in this function,
if it were me, I will cache it with a local variable to prevent over long in horizontal.


         struct intel_connector *intel_connector = to_intel_connector(connector);
         struct intel_encoder *encoder = intel_attached_encoder(intel_connector);

> +	int ret;
> +
> +	if (!encoder)
> +		return -ENODEV;
> +
> +	ret = drm_modeset_lock_single_interruptible(&dev->mode_config.connection_mutex);
> +	if (ret)
> +		return ret;
> +
> +	crtc = connector->state->crtc;
> +	if (connector->status != connector_status_connected || !crtc) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	intel_dp = intel_attached_dp(to_intel_connector(connector));


          intel_dp = intel_attached_dp(intel_connector);

But this patch is OK, I just give a suggestion.

