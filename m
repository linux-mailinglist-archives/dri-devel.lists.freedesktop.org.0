Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F72A74E26B
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 02:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93DB910E193;
	Tue, 11 Jul 2023 00:04:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A6110E16D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 00:04:03 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b69f958ef3so80767841fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 17:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689033842; x=1691625842;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V/dX5K/ss3x0ciVNd3aGlR4JXcHpqL/PpCCOLWFx+LU=;
 b=bff2RHeCIczRdsZbNq2tUaXQiFpucPzuUmWWOXPGQ4SAr6olSBCt7WL2nUpZzrF1gt
 gSZ5+lUbOASJpXJ7IOfH4AFidBOgj6GWWYBt11VauuiijYUhlF5WfrY7wSo/OxxeDNc6
 xRVL5RXhcVFwIlByLXbXlxUmm92OXePSiiOIzo0nWCKvww3YXP09N1ZkyvNCI3s99k+3
 /iqXTuI7JeiDVN9e2Rm3Y9BqzR9g1BEeGNtqi/XqjG2y4FYwQ5WxL7Mz5lw931ZCyU0+
 qkrWyozbhuySBBMS+nsM3Ok7XruduIOm5IOquzTEVTlFWfgtVtMKTxf0GbIrdCeaw08k
 nfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689033842; x=1691625842;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V/dX5K/ss3x0ciVNd3aGlR4JXcHpqL/PpCCOLWFx+LU=;
 b=ajYcYYagBDSnHySNRYhuNlEs3RytwydPEvQMCW5Sa0pSSHOgDBWaVORvVpF+6kIKlz
 pDvic7jvCz/mOU4TmRWX/WLRrl9YBvuJd53hj74JB8aTkL5pidkK+Zxl1CLu1JA3MFr4
 qzWz5nQDKPbBpRUQWQ7qJ2lOvME0eymZbpdT28Gjg0j4AwNz5ua1QepPpdLvV1O2JPhB
 hCgFZpmH3woMmTsBd2+rloLx2P6YXP9OLd3HqfR5af7Hrx/DQAmMQOOmtHjhyziPIxPB
 +QZi7gHJC6PcZsCi0XGl9JmWYl1+D37tQH99PQPh2VHMVwpEKTd5TVY0klZEAf+T5Ka+
 SCZg==
X-Gm-Message-State: ABy/qLaiiY2Wz1dSORfHEoPZPwok0RNS1OJMv83rqflbhIz8uiTSoE22
 KhpgSXchHSMJPsC0W107Llthxg==
X-Google-Smtp-Source: APBJJlEuKphZX/mQW/8zaQsAfg/oLoPfdo42uJwdfWTi2a1CBy9Un701xs1VX++nJ0yk9il+OIo1vw==
X-Received: by 2002:a2e:8eca:0:b0:2b6:a827:164f with SMTP id
 e10-20020a2e8eca000000b002b6a827164fmr11447647ljl.10.1689033841931; 
 Mon, 10 Jul 2023 17:04:01 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a2e86d8000000b002b6cde9f325sm173232ljj.105.2023.07.10.17.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 17:04:01 -0700 (PDT)
Message-ID: <25c12da7-e79d-af19-fbc9-47ebf7041406@linaro.org>
Date: Tue, 11 Jul 2023 03:04:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] drm/msm/dsi: Enable BURST_MODE for command mode for
 DSI 6G v1.3+
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230608-b4-add-burst-mode-v2-1-2ff468457d46@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/06/2023 23:31, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v2:
> - Moved MDP_CTRL2 register setting to dsi_ctrl_config() (Dmitry/Marijn)
> - Read previous value of MDP_CTRL2 register before writing to it
>    (Dmitry)
> - Link to v1: https://lore.kernel.org/r/20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 3f6dfb4f9d5a..cdb404885f3c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -752,6 +752,13 @@ static void dsi_ctrl_enable(struct msm_dsi_host *msm_host,
>   		/* Always insert DCS command */
>   		data |= DSI_CMD_CFG1_INSERT_DCS_COMMAND;
>   		dsi_write(msm_host, REG_DSI_CMD_CFG1, data);
> +
> +		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> +				msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3) {

Nit: please intent in future to the same level (vim: "set cino=(0").

> +			data = dsi_read(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2);
> +			data |= DSI_CMD_MODE_MDP_CTRL2_BURST_MODE;
> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2, data);
> +		}
>   	}
>   
>   	dsi_write(msm_host, REG_DSI_CMD_DMA_CTRL,
> 
> ---
> base-commit: a0364260213c96f6817f7e85cdce293cb743460f
> change-id: 20230608-b4-add-burst-mode-a5bb144069fa
> 
> Best regards,

-- 
With best wishes
Dmitry

