Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A229E84CF
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 12:51:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6184710E336;
	Sun,  8 Dec 2024 11:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mELXXTMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27FA10E32F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 11:51:09 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso1132211e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2024 03:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733658668; x=1734263468; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BjiC5PAenMu08TFijRNbc2fm2ozHjMgrzs8cxLgoxyE=;
 b=mELXXTMtUc9U9HCJGBDfwcRIUpCe50E1QvuyG04leOjqmnZGdMFXptYPeKBWbpq1UH
 6Nt/K2FdXqRHjhb5eAMoyO0Mh7lsL8nrOINQbcObScqNx2YcxgMa1NOYFl80lvsqf9MQ
 QB3C9j32m/dk0mS8KB75LbjR8Mf3Rd+KpbntctjtvvLCvEpQNqkqjMK2Uf4Dnp8CGvq+
 I+ZWTTWpqHiFrlb4gTyg0OLwpxjGTIfqJgI3BBeza7q3gzGBx2zkyV2kEyca8fMjI9IA
 v9YISgpR2LT1D6MVpJtFxb2+mdb7mXCbPJTYyIduXxC47wjAsq4w4j6rHA2m7i6cOp+n
 hpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733658668; x=1734263468;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjiC5PAenMu08TFijRNbc2fm2ozHjMgrzs8cxLgoxyE=;
 b=ah9Jn1HmYnasRBQkNDDx2uZ60joZN6vtgwVhEmO/Dj6sA0htZp25oBcsw0PRj3Omi/
 oPrudLET6TXZtTyy2rcTDxzPWaOVXuUta2uSIngwZIdqIEcdP0lES5PIa+ihmI4ZNFi+
 mjn61wvyHvhm/ov2CnXJP/iZ/sc2eXr3Fu/D/GNvgrO3nVQuLmub5zBSKxl1bP2p+Jx7
 QoUVMqCOIxUIMBCJ75tD7XRPFNlbFVSBNBUqWIFJPFjJRvUyV40r0VqJ8ZqeT8v5HGNu
 az90afzn7vvpuBR3589XFV63gbZd3Ky9qCxnFnsgeMPMEaHNm6yKDipodOyWovsFOGUz
 wT9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS74YfVf4S/TOaGh557gw01+2+NoHK6tQcUY/S1EdA1jd9DU3Wo5MblcSii+EyDDUHOmMIfjcFbl8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywoh/RYlxqR0/orga8dcx5FZHULUFDq3L9bGaEdV5UC+KOcnpS3
 De3OR+Ry3lc74w+QXmE/amom28kSLF+uVJWLDv2VNabp6E6O6E4dwgNZgecj1vA=
X-Gm-Gg: ASbGncsJ3vjuke1qtKv4OqEiBcwvzftmAH8Iz5ZZTuntyHBHKio8TXSb8ZK+tCyg+Ln
 p8EJ7RdckPqYEmndliF53nTrcBLx01t8bTWqYQRVYIUZV5mDLSJtk+x3nmmDAXruNOBts6AKKRl
 NtZ1RH3jN1eKsW6ptJpXJAa0PLa7MtQ4otw0zx5TxM2DW0J2codgqkFdy+3OzQcsYYy6eWeXaOy
 yR0ar3Mi/o46fHWH65GQpcTkW2wEaUxs7ynAdgYlyrKAe5CKpM+/5L0t9nDM7fGiU8tkqaCOqQu
 OA+bJzy9Xwe908DLwAiW2hPRR9e95A==
X-Google-Smtp-Source: AGHT+IETn40N7+7crT4iVG8T/A8ynVmzE/UWImTWcqofhQT1b5XaQk0o+SD2OB6XC+TybBpfRfOZsQ==
X-Received: by 2002:a05:6512:12c1:b0:540:1be6:f15e with SMTP id
 2adb3069b0e04-5401be6f545mr507128e87.0.1733658667917; 
 Sun, 08 Dec 2024 03:51:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53f93369b98sm354427e87.280.2024.12.08.03.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2024 03:51:06 -0800 (PST)
Date: Sun, 8 Dec 2024 13:51:04 +0200
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
Subject: Re: [PATCH 27/45] drm/msm/dp: make the SST bridge disconnected when
 mst is active
Message-ID: <mzo5hjocxp666mfadqdmzzbkcbzcga3aatqtv7p5jfrlfeide2@hmmamwhvbfik>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-27-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:58PM -0800, Abhinav Kumar wrote:

missing commit message

> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index 920392b3c688821bccdc66d50fb7052ac3a9a85a..225858c6240512cf2c5ca3b5eb52cf9b7f4db3e3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -27,7 +27,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
>  	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
>  		(dp->link_ready) ? "true" : "false");
>  
> -	return (dp->link_ready) ? connector_status_connected :
> +	return (dp->link_ready && !dp->mst_active) ? connector_status_connected :
>  					connector_status_disconnected;
>  }
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
