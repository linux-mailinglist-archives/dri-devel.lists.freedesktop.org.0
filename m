Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A309E6A00
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D471110F049;
	Fri,  6 Dec 2024 09:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ypyiiPM1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3739F10F048
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:25:57 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ffa974b2b0so16665601fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733477155; x=1734081955; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OoUr7wn0ZUiIfTkQsgOoOd0m6IiBq8HA9tyXLM1N7tU=;
 b=ypyiiPM1lQytqXRXhIXp3wu97YAUdHbDih4ieLQ6U3ItQPygkdIs/PPoaKOJNJ3BzB
 CwsmPnhJ1PYAP8h2UUjPjdqh1OQC4qkm5qsWp0/TOlp7PzoYC0DsJLeA1CANMTbLe0Dp
 gOLeX4z/LR7x6UfSAVbNVSBiYuusZ0WkGzAukgjuIpvOrkiYRCDEY2rqs7EdFndTMiN+
 l4gayUDbymCQTQGEuODenzoZJr3jTRKEzun6+VRQP7Sn/MrjA4/MW+Bj3loaUh5/bqx+
 WGaf7yQh70YN42IxkgDs/eyZ1G6DkQy+Vkst1sId31ptyOBUHBy5UtLSv4CH6maySjX+
 fMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733477155; x=1734081955;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OoUr7wn0ZUiIfTkQsgOoOd0m6IiBq8HA9tyXLM1N7tU=;
 b=v8FW5k2aeLpIF8hEbP+9x+eQP2tbIVPXERvO7VTwM1XTbK+u18didP5LHAHrvUHd7l
 Z9QX7uG7F6HB09qXzYigMf5lhN7XoD+B0eU5W98M+j/Y3BRSAf7daPDiMlZXaW7XjylR
 b4YfR1MZxQ4GNPHWrFtMqowXhAKbA1eh1N26ORJ1bAhZyKd+h8+/cttrSpCe0H4qyMu6
 po1nnJyvf6SLVBJW1Z8+IIXxqxIbyt7vrFDmkU4dinlrCJI5hV+OdojyAkFI4/gtk6wm
 EgaLi46V7XYJHCBEj/Xc7H4TziipYauJYMIqrzPG3sh77aJsFdWwWfh9B7TOQlcgs3S/
 SJRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhDwsKRidab/B7UPqmEjRPBcrJnDJCSWJNKPy22Qe8zvqmSb9XMbrEMRrExGlysD9pG4QzFVupVeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWWE0HYp9M1aZ3lh/CKikq3BqWoNn1Zn6MhbnzMkNRDEjjMv7v
 I2FIrPu0P+taKyzLFe2T8eMXTg465EhLHqMe1MONFdTu7N1BDWuEbWqkoT7rDZI=
X-Gm-Gg: ASbGncvRVr7venRXHhEcaLFUj29VsVJ+fvO4cT4dI06Lu8QZUtyzUBbexOucazHDmtF
 3ZDWtvhLM/zEmvRFsCw7Yjp2O7n311UEpV55yZp05VQM+K3jbG3nP1JGk1QOwhC2gj0yGecJ9bp
 v4OBigpiTJOeVqB0hMOeDm9ie+nUzGmMX+WNmKLSdOBKeYSfYp7d6fPQDEFIdDE4bb5Y0BVP+6w
 vtgzjrvA9r9L8uZLuO7nwC2PQp/jNCRPeeXOkxxIbeEzQfgYW0WgWSQqoxO0nuPeaJSVLEx2q3Q
 CpOO9WEDTTIp7OdFMLdKNb8Xlh3Sgg==
X-Google-Smtp-Source: AGHT+IHEPjXcBrm7XkLeyj1S9Myc1Ilx1u8zaCsZKn1lMH6hzLdh64MAK0T3iqxzwepLT5rGpHD/Mw==
X-Received: by 2002:a05:651c:553:b0:2ff:d7e8:b712 with SMTP id
 38308e7fff4ca-3002f8c88b6mr7541101fa.13.1733477155305; 
 Fri, 06 Dec 2024 01:25:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020d85356sm4231801fa.15.2024.12.06.01.25.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:25:54 -0800 (PST)
Date: Fri, 6 Dec 2024 11:25:51 +0200
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
Subject: Re: [PATCH 41/45] drm/msm/dpu: use msm_dp_get_mst_intf_id() to get
 the intf id
Message-ID: <tqxoqjrpi3smnjuipnog5idh4kjhld7jem7s637pdjhcoc4paf@75kcofgrxwdv>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-41-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-41-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:12PM -0800, Abhinav Kumar wrote:
> Use msm_dp_get_mst_intf_id() to get the intf id for the DP MST
> controller as the intf_id is unique for each MST stream of each
> DP controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 25 ++++++++++++++++++++-----
>  1 file changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 83de7564e2c1fe14fcf8c4f82335cafc937e1b99..ce2f0fa8ebb1efd1a229a99543593965dbccd752 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2512,17 +2512,23 @@ static int dpu_encoder_virt_add_phys_encs(
>  
>  static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  				 struct dpu_kms *dpu_kms,
> -				 struct msm_display_info *disp_info)
> +				 struct msm_display_info *disp_info,
> +				 int drm_enc_mode)

No need to, use dpu_enc->base.encoder_type

>  {
>  	int ret = 0;
>  	int i = 0;
>  	struct dpu_enc_phys_init_params phys_params;
> +	unsigned int intf_id;
> +	struct msm_drm_private *priv;
> +	struct drm_encoder *drm_enc;
>  
>  	if (!dpu_enc) {
>  		DPU_ERROR("invalid arg(s), enc %d\n", dpu_enc != NULL);
>  		return -EINVAL;
>  	}
>  
> +	drm_enc = &dpu_enc->base;
> +	priv = drm_enc->dev->dev_private;
>  	dpu_enc->cur_master = NULL;
>  
>  	memset(&phys_params, 0, sizeof(phys_params));
> @@ -2559,9 +2565,18 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>  		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>  				i, controller_id, phys_params.split_role);
>  
> -		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> -							   disp_info->intf_type,
> -							   controller_id);
> +		if (drm_enc_mode == DRM_MODE_ENCODER_DPMST) {
> +			intf_id = msm_dp_get_mst_intf_id(priv->dp[controller_id],
> +							 disp_info->stream_id);
> +			DPU_DEBUG("intf_id %d for disp_info->stream_id = %d\n", intf_id,
> +				  disp_info->stream_id);
> +			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_id);
> +
> +		} else {
> +			phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
> +								   disp_info->intf_type,
> +								   controller_id);
> +		}
>  
>  		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>  			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
> @@ -2662,7 +2677,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
>  	mutex_init(&dpu_enc->enc_lock);
>  	mutex_init(&dpu_enc->rc_lock);
>  
> -	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info);
> +	ret = dpu_encoder_setup_display(dpu_enc, dpu_kms, disp_info, drm_enc_mode);
>  	if (ret) {
>  		DPU_ERROR("failed to setup encoder\n");
>  		return ERR_PTR(-ENOMEM);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
