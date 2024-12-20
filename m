Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0499F8BAF
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 06:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ABE10EEB6;
	Fri, 20 Dec 2024 05:03:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xGAIgjVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7209F10EEB6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 05:03:11 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-3003943288bso15539061fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 21:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734670990; x=1735275790; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=m702/HGl5sKTUjvEqn+7bLtl2eVmqJKkLeGGTpjyQLw=;
 b=xGAIgjVJ02aEYVNc8MDiuq6qLpwHJ6hghvocgMpb4q81odKjewwmKnzXezdeb8D9d7
 bL/S1Mc1QsoPbdxHQGaBmPF4yMXmwSb8LcNT7HNvebLNIIRkeZw0XMcRua2QLA2hlQTy
 ypEknrsenQTPDPbVTLmxMPdY6BAVjfghpmxl3lmhR5Kh40UlDH1CK/j+QE6NI3MqfV2N
 RzLh/GoxUbJEjuiOChb2aWaFBsFMtYYyjbNUkiBlTRXB0KFY0eKmFW89Ny7v4hB46A+C
 1PKW+tLV/yUnychxkx6piYQg4BqTLQTN2ye3RARKUcgv+Yi0E+fTt2MwrErvz33jIT5L
 piVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734670990; x=1735275790;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m702/HGl5sKTUjvEqn+7bLtl2eVmqJKkLeGGTpjyQLw=;
 b=dfP+9qcj7hsOzV0EtaaOaBUGQNf5dn5ineNmN6NfNbmqNnuFchaf0n1hpd/0S+ul8Q
 uJDaZ/Y/hk2DXRw8ZL5Uyu8TdWkQfFeZwBPKILdzyqNTUl3ELj20IIabrGTK4cuHQHRD
 Di0SYJvJJak6UE5eIqvDoKz7P0S6culJ9Zzt5VoXTt7ztJ4zAV4K0K1D2OfnHjwR6/ii
 l573C+E5/bnr/JJxLbshXl1+YQRyvLcNPbORvdbKnSaG1zNkYrdVqx9o27npCmr4sDS3
 O3i92WK87JSpuRjAIURcPF5AG53JtpbUavUzyJqkCmPFqtD3m6E8WNIxUkV2YWjwOhW0
 mhlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYOMuqRf1DzHRsiZmmK02SnHU2ZfcT1W/CDpiOazq7TWlbm1+iS7wR5X9xJwMPMwgZukPeUvy6tXg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQOUNzo1Mw0c3lHIjcZq1s//6pNrwsLW6DzMRCqaXFPRlNRCVq
 m/11UVL/wKUNuKbiJmcRjJpTxf1AOYvrvrk2W3JZoiLyl6sejLiwkHoIx3JpdKk=
X-Gm-Gg: ASbGncsytaD7dyMN7ektVE4bU3eq9kcXh6JFrDXMdo9XY0u7wMiqQTExHDxWe8eR6vO
 3aHUaK38g9KxuRjFjOra8dhqWKBqnILyPBRYa2Ge/ZhQYlM2oUna+ATMlaxY5wUcYKcEkpNXYL8
 WSFw+4ATP/WqYVwRpO4HomNUSR7a8sYEkm0cbDRY0McFvyZKiedpT1rAveklgKhKVf7YK0Lf1i/
 DPgw2hnXrf5VLtnSWau1Sei9WpLgqQ4rHFhSlvduWZNrpQaKPUxIInRKi7fHYQLmWZw+vNWpb2S
 FAIIzrM053TKrq4mjmrG3Tbe0gsf3jYIiyOZ
X-Google-Smtp-Source: AGHT+IE7AMACdhYOmI1DWAlHJNG3mIkrNXzU71mUgxUjugwDV+QiqhXSa9rYSZx7k0oSHhKzOfItNw==
X-Received: by 2002:a05:651c:549:b0:300:1f2d:97a with SMTP id
 38308e7fff4ca-30468556d69mr4794531fa.16.1734670989582; 
 Thu, 19 Dec 2024 21:03:09 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045adac5bbsm4333921fa.53.2024.12.19.21.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 21:03:08 -0800 (PST)
Date: Fri, 20 Dec 2024 07:03:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4 15/25] drm/msm/dpu: Add CWB to msm_display_topology
Message-ID: <ki35rornnos35r3fzg5yyqzxnqua3dyfb6ewq2aefrh4u74vfi@opdnf44ntten>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
 <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216-concurrent-wb-v4-15-fe220297a7f0@quicinc.com>
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

On Mon, Dec 16, 2024 at 04:43:26PM -0800, Jessica Zhang wrote:
> Add the cwb_enabled flag to msm_display topology and adjust the toplogy
> to account for concurrent writeback

Why?

> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h   |  2 ++
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index b4bfded3d53025853cee112ca598533ece290318..b063c8fe4c0594772d84401fa56c9c21afc0ad18 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1198,6 +1198,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
>  					    &crtc_state->adjusted_mode);
>  
> +	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
> +
>  	/*
>  	 * Datapath topology selection
>  	 *
> @@ -1209,9 +1211,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
>  	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>  	 *
>  	 * Add dspps to the reservation requirements if ctm is requested
> +	 *
> +	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
> +	 * enabled. This is because in cases where CWB is enabled, num_intf will
> +	 * count both the WB and real-time phys encoders.
> +	 *
> +	 * For non-DSC CWB usecases, have the num_lm be decided by the
> +	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
>  	 */
>  
> -	if (topology.num_intf == 2)
> +	if (topology.num_intf == 2 && !topology.cwb_enabled)
>  		topology.num_lm = 2;
>  	else if (topology.num_dsc == 2)
>  		topology.num_lm = 2;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index b763ef19f4c60ae8a35df6a6ffb19e8411bc63f8..85adaf256b2c705d2d7df378b6ffc0e578f52bc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -382,8 +382,14 @@ static int _dpu_rm_reserve_ctls(
>  	int i = 0, j, num_ctls;
>  	bool needs_split_display;
>  
> -	/* each hw_intf needs its own hw_ctrl to program its control path */
> -	num_ctls = top->num_intf;
> +	/*
> +	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
> +	 * control path. Hardcode num_ctls to 1 if CWB is enabled
> +	 */

Why?

> +	if (top->cwb_enabled)
> +		num_ctls = 1;
> +	else
> +		num_ctls = top->num_intf;
>  
>  	needs_split_display = _dpu_rm_needs_split_display(top);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index b061dfdab52e04ab7d777e912a30173273cb3db7..12db21a2403ec6930894c36a58e898c5d94c2568 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -46,6 +46,7 @@ struct dpu_rm {
>   * @num_dspp:     number of dspp blocks used
>   * @num_dsc:      number of Display Stream Compression (DSC) blocks used
>   * @needs_cdm:    indicates whether cdm block is needed for this display topology
> + * @cwb_enabled:  indicates whether CWB is enabled for this display topology
>   */
>  struct msm_display_topology {
>  	u32 num_lm;
> @@ -53,6 +54,7 @@ struct msm_display_topology {
>  	u32 num_dspp;
>  	u32 num_dsc;
>  	bool needs_cdm;
> +	bool cwb_enabled;
>  };
>  
>  int dpu_rm_init(struct drm_device *dev,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
