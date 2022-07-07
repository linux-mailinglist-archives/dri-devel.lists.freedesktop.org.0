Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8656ACF3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 22:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D52614AB7D;
	Thu,  7 Jul 2022 20:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E4814AB83
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 20:51:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id o7so4007113lfq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 13:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1yCn9FzE3TgPn9G9aMPiVPfAOGS2N8GQpGxVZMGerPY=;
 b=xOPoHYFsS3NPMHesqsz3d/V7flw6QibIRa52MJorz6ZxvJKN9QBEIYgo0qcMCT933D
 XLChc0UZYhnk66+HrEPy+AjH0K3NCiJ2Nd2Wi+cDxK2OJOeqa5oI+6+xfeEuLTVE1Kwc
 jdCw0eAubPWWwY6SLkdR7tFbawyksR/tx2pRe2fEuw1tMid/UMGjep+YwCLQFtq9n68k
 Ng2sagiJPQG80XifY2wKkPd1g7eNcfK8arcTcOYKzbzc5Hhl4IrcsGOKjMjHe/qh/4A2
 1Q+J8SqXGvSpHcSnN/zhZPv8gR4U6T8l2v60uv61WJAU0GmpLT4Qsn7aH5vTK4hFWWUR
 Ck5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1yCn9FzE3TgPn9G9aMPiVPfAOGS2N8GQpGxVZMGerPY=;
 b=6jFEJIWi/dp5xM0yl91nPu1zLb/K4A5SNGvR9JV4Tmgy/Ui9qp2lPP7tqdpWLQma2I
 NQBm4nFVaJXXX1pGubK7iygODPyrHiien0y7BNpVn6GtSGduT0pGG/XH/tn4C+4TYEC/
 m0nRCEkad39yY+F2hWVhm39QmxhJj6n2Mp2qrvWh/BA35y5P4jwAEqFZ99xghnLsNQ/h
 XAdotX6LKKU7eAjUZqp8idtoeL9zBHGPbrL3NiKikHqO/3DEWkJ54LvMIjZOWm+y5DTc
 QjeyTQkpqtbI3+EA3PUI6n0+dyzTaSCmIk0k7k7ms4859/lfbpKjNicrmVWcXp9TxSAL
 Kymw==
X-Gm-Message-State: AJIora/wPGmYjJMB7KzkuuEA+ZXca+LXK+bhmsQ0qNxOVTDdAroTQMY2
 jMy9uL9NAENCYWxyUS3pK0IWdg==
X-Google-Smtp-Source: AGRyM1tMDs6Igfr2CIm7SALgNlpy/riEx4RV4z/bsOQ3j14KxMMU9E3LGwhg9JehjwtKyPbRJFvJlQ==
X-Received: by 2002:a05:6512:3084:b0:47f:6c9e:952e with SMTP id
 z4-20020a056512308400b0047f6c9e952emr43810lfd.332.1657227063392; 
 Thu, 07 Jul 2022 13:51:03 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512358600b0047f8de9734asm7040369lfr.123.2022.07.07.13.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 13:51:02 -0700 (PDT)
Message-ID: <ecbbe366-b7c7-885d-f574-0ac900d7599a@linaro.org>
Date: Thu, 7 Jul 2022 23:51:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4] drm/msm/dp: make eDP panel as the first connected
 connector
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657135928-31195-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/07/2022 22:32, Kuogee Hsieh wrote:
> Some userspace presumes that the first connected connector is the main
> display, where it's supposed to display e.g. the login screen. For
> laptops, this should be the main panel.
> 
> This patch call drm_helper_move_panel_connectors_to_head() after
> drm_bridge_connector_init() to make sure eDP stay at head of
> connected connector list. This fixes unexpected corruption happen
> at eDP panel if eDP is not placed at head of connected connector
> list.
> 
> Changes in v2:
> -- move drm_helper_move_panel_connectors_to_head() to
> 		dpu_kms_drm_obj_init()
> 
> Changes in v4:
> -- move drm_helper_move_panel_connectors_to_head() to msm_drm_init()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/msm_drv.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 4a3dda2..4d518c2 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -419,6 +419,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   		}
>   	}
>   
> +	drm_helper_move_panel_connectors_to_head(ddev);
> +
>   	ddev->mode_config.funcs = &mode_config_funcs;
>   	ddev->mode_config.helper_private = &mode_config_helper_funcs;
>   


-- 
With best wishes
Dmitry
