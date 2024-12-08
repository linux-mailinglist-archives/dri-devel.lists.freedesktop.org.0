Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C0A9E840A
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 07:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FE510E42D;
	Sun,  8 Dec 2024 06:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ppfazzf5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51110E42D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 06:44:57 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-2ffc86948dcso33462971fa.2
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 22:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733640295; x=1734245095; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hdGNHQAJUzYyjbohAt/0A6Ng2wZg9B9r6ItAJe2eaBk=;
 b=ppfazzf53Qz68UlfU79wVn0MZFSGCIuX/A8nMS+KFaqExowY82COT6dKeuBJyNEZYM
 V2H3qZMI5fuvPSwMs/nwbwvBEnoMs2gCOfFmORr3hPyrKTDGF5dEna0dTiZ9MqqmHIgK
 psmp9iGmJl4SxCD1KdBg/L/Pbu7NlEuuqutvzxCOZnJ3A5j/M3tOzeZ/08IoAJ/uIbK2
 HnnWasbaGXGqOfUUbEYDutIq98GKtfQeootnLcDyPtxCFu548QfCGtDCG0R151+kRx9f
 vtCFRVVO2cCseGnhUCvXkvL5IMT6rZpEs222nkt8Kg8F5HXfnCFNm59jywIKpXivqTub
 amzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733640295; x=1734245095;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hdGNHQAJUzYyjbohAt/0A6Ng2wZg9B9r6ItAJe2eaBk=;
 b=Mi+DV8Jd3Zds1fh+iXv5KeadLvheYfoPrS+1mOwsRERT57Z98/O2GqnNElu59CW0ZO
 S9hUg8Mx9EvPkxAw53VH+ovyqtxQuCAOQLxHMGxzJmUHkO6fuwXDzQxx4wwj1PDow49y
 rEe7T2D3D6S3ApmsgB7n9UdVV1r7Hbff3vFThRKgfxHPpcjM638MmGzph7UeSMqK8kPA
 U8M+i1VERzol877UA874/76QtbjoXDtVgebcOYTaeqj9YEsHQfCj6r9Tr3iZ41hIZiRM
 vp9c/SjM+HxTw8DObnqfpaLMcAKmL/w29zP6F/Ib4I8kpimYvV1dNe05VqsTSQH5O9sH
 VwIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/RL9PkIZ9muwP3+biFL0fu3rxhiKjjCaciw7r7PrJz6NagIyTpXR2pnhk70m4PG8j5iPBALzXOfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWktYMthnNxGojUwFOr97iQw9njxn/AlaOo6I1SAGeac4jsyqr
 C2Ez52yzZMEflrTrH7AEUX2XYsM3N36AMip5fOI/2BbH/2kGvc3JxA7SliysXKk=
X-Gm-Gg: ASbGnctRYA8AK1rZq2szvqjqYygWUzh27ZSwbLhbdl6K1g4YKOtjjavxkQ+Ic90rKx4
 5fc7uMWXkt7iz5PrwSF8fz+JWxaLBC+f2W3bCAQQcJCXxLulzykONaja96IwHH1vllRZsSqf8tN
 jMnRjP780pjX6JDvFH6vr5rznGr8DcHgcfMk8fWk2Yjw+AiQUgKXuND8YZOsdHpm/2ty2okYOgp
 8Qt9djlm8wyMjQiGVAfx8YDtuBvlYiucMUwycDZ0HY9Y6v/BZdk/1nPgL1sh/vfcKBR86IiBCPQ
 tk6TkBDGacLi+MI0THlMCtqfsViuVw==
X-Google-Smtp-Source: AGHT+IFRKf628IlWh4nLJD6CbktAnRSTG9qf3ocyzqfN6z84pO4+nuRak4uKnZ3RxXg2D8mepLotNg==
X-Received: by 2002:a2e:a98b:0:b0:302:1861:6df4 with SMTP id
 38308e7fff4ca-3021861726emr6312831fa.35.1733640295057; 
 Sat, 07 Dec 2024 22:44:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020d85076sm9314561fa.23.2024.12.07.22.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 22:44:53 -0800 (PST)
Date: Sun, 8 Dec 2024 08:44:52 +0200
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
Subject: Re: [PATCH 33/45] drm/msm/dp: add irq hpd callback for dp mst
Message-ID: <dp45ml6ozghkvz2rgzj2v5xupy2zncz5gksnj5umfaldvfmgu3@lqh672yqlgl3>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-33-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-33-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:32:04PM -0800, Abhinav Kumar wrote:
> Add irq hpd callback for the dp mst module which shall be
> invoked from the dp_display's irq hpd handler to perform
> mst specific operations in case of irq hpd. In MST case, route

Nit: MST, IRQ, HPD

> the IRQ HPD messages to MST module.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 17 +++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_mst_drm.c | 36 +++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
>  3 files changed, 50 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 60316633cc6bcfdfad8ab356d803642d353add61..97f8228042773f51f23a9d39fc009de0798059d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -583,7 +583,9 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>  {
>  	int rc = 0;
>  	u32 sink_request;
> +

Drop.

>  	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>  
>  	/* check for any test request issued by sink */
>  	rc = msm_dp_link_process_request(dp->link);
> @@ -591,12 +593,18 @@ static int msm_dp_display_usbpd_attention_cb(struct device *dev)
>  		sink_request = dp->link->sink_request;
>  		drm_dbg_dp(dp->drm_dev, "hpd_state=%d sink_request=%d\n",
>  					dp->hpd_state, sink_request);
> -		if (sink_request & DS_PORT_STATUS_CHANGED)
> -			rc = msm_dp_display_handle_port_status_changed(dp);
> -		else
> +		if (sink_request & DS_PORT_STATUS_CHANGED) {
> +			if (!msm_dp_display->mst_active)
> +				rc = msm_dp_display_handle_port_status_changed(dp);

Why?

> +		} else {
>  			rc = msm_dp_display_handle_irq_hpd(dp);
> +		}
>  	}
>  
> +	/* let MST specific IRQ events be handled by its callback */
> +	if (msm_dp_display->mst_active)
> +		msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> +
>  	return rc;
>  }
>  
> @@ -736,7 +744,8 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
>  	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
>  			dp->msm_dp_display.connector_type, state);
>  
> -	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
> +	if ((state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) &&
> +	    !dp->msm_dp_display.mst_active) {

Why?

>  		/* wait until ST_CONNECTED */
>  		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
>  		mutex_unlock(&dp->event_mutex);
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> index 2934fe6a93ff8b927b035c01b6007f3f4ec91a3f..2d92084586b466d4953429e8a6fbf766d081cb9f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
> @@ -559,6 +559,40 @@ static struct msm_dp_mst_bridge_state *msm_dp_mst_br_priv_state(struct drm_atomi
>  										&bridge->obj));
>  }
>  
> +/* DP MST HPD IRQ callback */
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display)
> +{
> +	int rc;
> +	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
> +	u8 ack[8] = {};

4 should be enough

> +	u8 esi[14];
> +	unsigned int esi_res = DP_SINK_COUNT_ESI + 1;

inline

> +	bool handled;
> +
> +	rc = drm_dp_dpcd_read(mst->dp_aux, DP_SINK_COUNT_ESI,
> +			      esi, 14);

Why do we need 14 bytes? Other drivers read smaller chunks.
drm_dp_mst_hpd_irq_handle_event() explicitly documents just 4 bytes
there. Please consider extracting generic helper funciton that just
handles ESI read, drm_dp_mst_hpd_irq_handle_event() and writing of ACK.

> +	if (rc != 14) {
> +		DRM_ERROR("dpcd sink status read failed, rlen=%d\n", rc);
> +		return;
> +	}
> +
> +	drm_dbg_dp(dp_display->drm_dev, "mst irq: esi1[0x%x] esi2[0x%x] esi3[%x]\n",
> +		   esi[1], esi[2], esi[3]);
> +
> +	rc = drm_dp_mst_hpd_irq_handle_event(&mst->mst_mgr, esi, ack, &handled);
> +
> +	/* ack the request */
> +	if (handled) {
> +		rc = drm_dp_dpcd_writeb(mst->dp_aux, esi_res, ack[1]);
> +
> +		if (rc != 1)
> +			DRM_ERROR("dpcd esi_res failed. rc=%d\n", rc);
> +
> +		drm_dp_mst_hpd_irq_send_new_request(&mst->mst_mgr);
> +	}
> +	drm_dbg_dp(dp_display->drm_dev, "mst display hpd_irq handled:%d rc:%d\n", handled, rc);
> +}
> +
>  /* DP MST Connector OPs */
>  static int
>  msm_dp_mst_connector_detect(struct drm_connector *connector,
> @@ -570,7 +604,7 @@ msm_dp_mst_connector_detect(struct drm_connector *connector,
>  	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
>  	enum drm_connector_status status = connector_status_disconnected;
>  
> -	if (dp_display->link_ready)
> +	if (dp_display->link_ready && dp_display->mst_active)

Why is it a part of this patch?

>  		status = drm_dp_mst_detect_port(connector,
>  						ctx, &mst->mst_mgr, mst_conn->mst_port);
>  
> diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> index 9a8535b97193d911592b44fdfcf43ca2f252cea0..5fe5dc7596086467e9a3b3d7d04a665853fbb3d7 100644
> --- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> +++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
> @@ -103,4 +103,6 @@ int msm_dp_mst_drm_bridge_init(struct msm_dp *dp, struct drm_encoder *encoder);
>  int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams,
>  		    u32 max_dpcd_transaction_bytes, struct drm_dp_aux *drm_aux);
>  
> +void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
> +
>  #endif /* _DP_MST_DRM_H_ */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
