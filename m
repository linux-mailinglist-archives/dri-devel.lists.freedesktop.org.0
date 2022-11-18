Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E545C62F525
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 13:41:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E423D10E728;
	Fri, 18 Nov 2022 12:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEAE910E729
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 12:40:55 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id d3so6657436ljl.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 04:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y8WE/u9tZOiYp5XnpTK4zACGyHGGTIoHPFzXWbuKlnI=;
 b=JiNxHFMjg0MvK6nZZ10piyuS96/ljLLujdbV/XSU6rC7vhDzvyxsOVbC9yAgEvqdBF
 AEGImJM7Jv1ROchOG2/89OiSO/J6rbNPvUIi5xqWbxjaGHAm+d4RVsgW2B0q2MOKof63
 V5fu1sR+/BPvNdWpK5hzRxCRUQrvHCEbhtZK2yk5ATha1nFftzZOrl6QPuq0NZ3baN1D
 ycjKlEbGFRHqQ9jB5vVaPjiklX3Sr3TblRIcTbNpITsRNZ4gCeS/+7R14MrnK/PsY9qw
 X2Gcg5M1mh/VV9uh/BRIwKEk7geEmE4I/4YTGFX6F6MUlBIH0G7dKoCBySSFCqHDVqiO
 /WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Y8WE/u9tZOiYp5XnpTK4zACGyHGGTIoHPFzXWbuKlnI=;
 b=KQamzjM13DnziQiAfrTHMJVjnTnr7kdn/7mg4MQmeAxIqppYsSDqpkWobvhSLrBmDx
 q/VJGqrlpQmN3FD0CRUY0wvrHK8BBD0Ec3OaIYh+GY2Hh1ZHyIS7C2vLQRFaQLTvGZ5d
 sByu4WY786dAEWZOt8IQC/jjnL74Sw+DcX+ZWB1UEBJhgcJ/NlTgfKZk8WVNLLHwvqR9
 kjBHASRIiyxNbPhPXco8G405Z9l1AKxZK9bVCypQE3L9URKu7Y4C/u6bZsR3Vw2pk/U8
 indYkBSo8wVMDqE/Xzvlxo0GZVkV5YHvWtD2CKNS8zXAuyU7SqnArxbbm/tMy58t1qGx
 39kw==
X-Gm-Message-State: ANoB5pnvCkGVmgRM5bTDz9jt9pxtTjX/B6LEhLcbDT0N4lHGEBwn/mwf
 GbawX5MbkyFTdoONGHbACMD/uP/kGA9OOA==
X-Google-Smtp-Source: AA0mqf4nbHcm9nnkgG+UKIVDD8oMyJEYqAH2H1JDLHq9fJDN/Hjmi0rPJCq+0/lqvYMyZUoJWFUoAg==
X-Received: by 2002:a2e:7e0a:0:b0:277:6f0:5239 with SMTP id
 z10-20020a2e7e0a000000b0027706f05239mr2256879ljc.186.1668775254038; 
 Fri, 18 Nov 2022 04:40:54 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a2eb802000000b0027718ee951dsm638342ljo.37.2022.11.18.04.40.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 04:40:53 -0800 (PST)
Message-ID: <7da502e9-f52b-34ce-7911-988e2c356ef9@linaro.org>
Date: Fri, 18 Nov 2022 14:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 3/3] drm/msm/disp/dpu1: add color management support
 for the crtc
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1668773807-19598-1-git-send-email-quic_kalyant@quicinc.com>
 <1668773807-19598-4-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1668773807-19598-4-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/11/2022 15:16, Kalyan Thota wrote:
> Add color management support for the crtc provided there are
> enough dspps that can be allocated from the catalog.
> 
> Changes in v1:
> - cache color enabled state in the dpu crtc obj (Dmitry)
> - simplify dspp allocation while creating crtc (Dmitry)
> - register for color when crtc is created (Dmitry)
> 
> Changes in v2:
> - avoid primary encoders in the documentation (Dmitry)
> 
> Changes in v3:
> - add ctm for builtin encoders (Dmitry)
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>

With two minor nits (stated below) fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 5 +++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 6 ++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 7 +++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 7 ++++++-
>   4 files changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 4170fbe..6cacaaf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1571,7 +1571,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
>   
>   /* initialize crtc */
>   struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
> -				struct drm_plane *cursor)
> +				struct drm_plane *cursor, bool ctm)
>   {
>   	struct drm_crtc *crtc = NULL;
>   	struct dpu_crtc *dpu_crtc = NULL;
> @@ -1583,6 +1583,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   
>   	crtc = &dpu_crtc->base;
>   	crtc->dev = dev;
> +	dpu_crtc->color_enabled = ctm;
>   
>   	spin_lock_init(&dpu_crtc->spin_lock);
>   	atomic_set(&dpu_crtc->frame_pending, 0);
> @@ -1604,7 +1605,7 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
>   
>   	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
>   
> -	drm_crtc_enable_color_mgmt(crtc, 0, true, 0);
> +	drm_crtc_enable_color_mgmt(crtc, 0, dpu_crtc->color_enabled, 0);
>   
>   	/* save user friendly CRTC name for later */
>   	snprintf(dpu_crtc->name, DPU_CRTC_NAME_SIZE, "crtc%u", crtc->base.id);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 539b68b..1ec9517 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -136,6 +136,7 @@ struct dpu_crtc_frame_event {
>    * @enabled       : whether the DPU CRTC is currently enabled. updated in the
>    *                  commit-thread, not state-swap time which is earlier, so
>    *                  safe to make decisions on during VBLANK on/off work
> + * @color_enabled : whether crtc supports color management
>    * @feature_list  : list of color processing features supported on a crtc
>    * @active_list   : list of color processing features are active
>    * @dirty_list    : list of color processing features are dirty
> @@ -164,7 +165,7 @@ struct dpu_crtc {
>   	u64 play_count;
>   	ktime_t vblank_cb_time;
>   	bool enabled;
> -
> +	bool color_enabled;

Keep the empty line after color_enabled please.

>   	struct list_head feature_list;
>   	struct list_head active_list;
>   	struct list_head dirty_list;
> @@ -269,10 +270,11 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc);
>    * @dev: dpu device
>    * @plane: base plane
>    * @cursor: cursor plane
> + * @ctm: ctm flag
>    * @Return: new crtc object or error
>    */
>   struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
> -			       struct drm_plane *cursor);
> +			       struct drm_plane *cursor, bool ctm);
>   
>   /**
>    * dpu_crtc_register_custom_event - api for enabling/disabling crtc event
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 574f2b0..102612c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -572,6 +572,7 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> +			struct dpu_crtc *dpu_crtc,
>   			struct drm_display_mode *mode)
>   {
>   	struct msm_display_topology topology = {0};
> @@ -600,7 +601,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> +	if (dpu_crtc->color_enabled) {
>   		if (dpu_kms->catalog->dspp &&
>   			(dpu_kms->catalog->dspp_count >= topology.num_lm))
>   			topology.num_dspp = topology.num_lm;
> @@ -635,6 +636,7 @@ static int dpu_encoder_virt_atomic_check(
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> +	struct dpu_crtc *dpu_crtc;
>   	int i = 0;
>   	int ret = 0;
>   
> @@ -645,6 +647,7 @@ static int dpu_encoder_virt_atomic_check(
>   	}
>   
>   	dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	dpu_crtc = to_dpu_crtc(crtc_state->crtc);
>   	DPU_DEBUG_ENC(dpu_enc, "\n");
>   
>   	priv = drm_enc->dev->dev_private;
> @@ -670,7 +673,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, dpu_crtc, adj_mode);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 4784db8..b57e261 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -747,6 +747,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   
>   	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
>   	int max_crtc_count;
> +
>   	dev = dpu_kms->dev;
>   	priv = dev->dev_private;
>   	catalog = dpu_kms->catalog;
> @@ -804,7 +805,11 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
>   	/* Create one CRTC per encoder */
>   	i = 0;
>   	drm_for_each_encoder(encoder, dev) {
> -		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i]);
> +		bool _ctm = false;
> +		if (catalog->dspp_count && dpu_encoder_is_builtin(encoder) &&
> +			encoder->encoder_type != DRM_MODE_ENCODER_VIRTUAL)

The last condition should be handled in the dpu_encoder_is_bultin()

> +			_ctm = true;
> +		crtc = dpu_crtc_init(dev, primary_planes[i], cursor_planes[i], _ctm);
>   		if (IS_ERR(crtc)) {
>   			ret = PTR_ERR(crtc);
>   			return ret;

-- 
With best wishes
Dmitry

