Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1F69E84D7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D472D10E315;
	Sun,  8 Dec 2024 11:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="msOUbg+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF9810E315
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:56:37 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53eec9021f6so926895e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658995; x=1734263795; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pOAwyqX0ldTVE84PV+ORU4SPmAJDMuBSaqC47OQg++s=;
 b=msOUbg+4uXFJQ+VHkCYfDbeud4VzRMpnkN5tpIcAszjp/zNR4405SN0AJETHjfbQgv
 KlDWHi34dAJnsflUMSzeG7h6vz3Dt6mf0nmaaeuxjnoRPUeYygODLRx14g3jh0Ss0k+O
 ambacTmMNJ3KYkpktnatHZv98l0H/tcB5eiY8hZ6t/9Uz/bkusFWZWWahu6Hy8EQnwTj
 fQE4Z0wVjsavOb58f4RT8F7CcQNqhjvqQvS7UnDFIvm7eX4xw3csfkL7UeY/ZZZUmU6k
 uAkURxWB7PivfXF20yy8XV/1X9EpEc8veuuOzjYejf31Ca9qruhZ8Vt1g/zhe7JXazTL
 9UQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658995; x=1734263795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pOAwyqX0ldTVE84PV+ORU4SPmAJDMuBSaqC47OQg++s=;
 b=KV+H/Lxtd+lm2V0qc/6ShJIx6kl9JLcg8I75KEUURdd0Lij4VJHvp4WudGEw3IlYaU
 aNMCTZcWNhR9X0ussNYP7uAZQyX1BAilVRm68FR1MNkJPkun39lGel3rpCzxvrPBHtlf
 9qxxDzE1LpbfM8ie/VETcpMA2pMuIMqQIjErvBWIURo5x6lCtn7FaoTpJd770f+FjLyO
 laurgfVHdOYuFWL4RVla7ProPGNPqqVv3SK89WoW6+HB9s36MhCGJljpfrdd+ZnmVOBT
 sBrK2YGMwoN1F05vJ7+AwYgVN/sw1nUklM8mlG8dEJI4J+s6OWmUe7TwrA5kN/YFv4tf
 A3bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYee6V0zTwp1uUTcLmzr+kpw+QDapytrvXfwCpHd5H48AAAgUSUhmwKJ2vPZwS9OnW03B+HfrRZFo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjnTGHFOjP7TkU80wqqmhzgXQcBEFI+5nMCblj/WxzURrjaIqp
 B+uASw041h2+pUf1LlBvWOOBXszCSgu85VQJkhhTgfloQmsoLyeR7rfQCNaepzg=
X-Gm-Gg: ASbGncuo8yBLDLN4gPrLQ+D3FJiD0Ib7qpokisOFWiUWLUtYXRgtl1kPP0qvBJkVrQ8
 DCkHselWYLd/wtg+UAVpVuIjiwR+hx5cfYZeaJmcWfiSfAgN8b5OH+yQGYf8qYekK6usURntbGg
 67TKl+klnO+gPW4HUITVMRAiasbYDOQHe5oOD0D9WdnhlKQ1fbQT27rOKp4dnM7sgOwFeBBE/tE
 2dei3oxtgG4SjxF3ycD76ex7Xq4ANENuALwQrXNm9ZvyqAfjni1Ul2DIFQFCT5nxjM3vrcySkcY
 qQMslwXy9hCL0NqkMMScWy9qnqJStg==
X-Google-Smtp-Source: AGHT+IElZN3RNDN+oy40fWovlokmqjWYMAvL7r94k082zliwfNbajhQWzK7ZKlu/0oW09/kjFwm7PA==
X-Received: by 2002:a05:6512:131d:b0:53e:23ec:b2e7 with SMTP id
 2adb3069b0e04-53e2c2c4b9dmr3131142e87.34.1733658995453; 
 Sun, 08 Dec 2024 03:56:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f232a9629sm387293e87.25.2024.12.08.03.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:56:34 -0800 (PST)
Date: Sun, 8 Dec 2024 13:56:31 +0200
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
Subject: Re: [PATCH 28/45] drm/msm/dp: add an API to initialize MST on sink
 side
Message-ID: <6xqscvg7kuxd6l3kjfhrbqedijjfmaql5j3ie2lsnsxt2htx76@4u5iub577mg4>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-28-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-28-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:59PM -0800, Abhinav Kumar wrote:
> If the DP controller is capable of supporting multiple streams
> then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> DPCD register to enable MST mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index e69cdfbbe10484e47475ef189849f8ff6628bd7a..033d238e956263c1212fce45aab01316ef341edb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -380,6 +380,35 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
>  	return 0;
>  }
>  
> +static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
> +{
> +	const unsigned long clear_mstm_ctrl_timeout_us = 100000;
> +	u8 old_mstm_ctrl;
> +	struct msm_dp *msm_dp = &dp->msm_dp_display;
> +	int ret;
> +
> +	/* clear sink mst state */
> +	drm_dp_dpcd_readb(dp->aux, DP_MSTM_CTRL, &old_mstm_ctrl);
> +	drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL, 0);
> +
> +	/* add extra delay if MST state is not cleared */
> +	if (old_mstm_ctrl) {
> +		drm_dbg_dp(dp->drm_dev, "MSTM_CTRL is not cleared, wait %luus\n",
> +			   clear_mstm_ctrl_timeout_us);

"is not cleared" usually means that we wrote 0 to it, but the value
still stays on. Please rephrase the message, drop wait time.

> +		usleep_range(clear_mstm_ctrl_timeout_us,
> +			     clear_mstm_ctrl_timeout_us + 1000);
> +	}
> +
> +	ret = drm_dp_dpcd_writeb(dp->aux, DP_MSTM_CTRL,
> +				 DP_MST_EN | DP_UP_REQ_EN | DP_UPSTREAM_IS_SRC);
> +	if (ret < 0) {

if (ret != 1) ?

> +		DRM_ERROR("sink mst enablement failed\n");
> +		return;
> +	}
> +
> +	msm_dp->mst_active = true;
> +}
> +
>  static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  {
>  	struct drm_connector *connector = dp->msm_dp_display.connector;
> @@ -414,6 +443,9 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	 */
>  	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>  
> +	if (dp->max_stream > DEFAULT_STREAM_COUNT && msm_dp_panel_read_mst_cap(dp->panel))
> +		msm_dp_display_mst_init(dp);
> +
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  	rc = msm_dp_ctrl_on_link(dp->ctrl, dp_display->mst_active);
>  	if (rc) {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
