Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 821296E9734
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 16:34:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0605910EC68;
	Thu, 20 Apr 2023 14:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 340A710EC68
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 14:33:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2a8b766322bso5477281fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682001235; x=1684593235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ofr40ek0G9BZfkBPDY70rNqEWnYDL1CgRLdFieoxIVY=;
 b=HYlmKc71wctRPq+LnqBHZDTdPLQxNak+gf4Z3CQg+nrr7Enfl+wK3NGELZIRMEADQm
 RawxDawGU8X+/+fQWqFG7cLDeWsNGxWAKLCUwZRPe5xGhy8bGAgJ7Hwzu1EF0Nrf/ci2
 B8QCh9uvlnvV8/neIeQT553iVGTFWGdfb+DO5RCKrLU+G4xNpaypDYHv4fKMzboen+LA
 0VIue93TzAVMS4oi/D9sIpLB23bPLEEKpyrf9E8Etz2am/z74+9nrxq3YEhQBhAmJ3ia
 /TixsC2+Lp0UutrMjZ1bc1HAJRwHrnL8f2pNF3VLF625ud+qnCzSZPOtL5t498Y2Nu7Y
 YXkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682001235; x=1684593235;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ofr40ek0G9BZfkBPDY70rNqEWnYDL1CgRLdFieoxIVY=;
 b=Fhr9wtCxxkihjqKWqWyCYRwfTb4FpBKjGF1RyJM7OoS5i/d59mZve2+RB8oobm6wjV
 z++wZ2mdNNyYgPY7ixcrbMKS4EbclE+zDbqQrVF06MobCmGwDoLuMjNYzL+mZxW6cvQY
 JeWINfcj5Da7sl1RPxU8KAtmGWjRiLZNLJxpbY7WAJiJPJypOPxuOpJtqIWjd4G4PCrG
 oJCXzbwesy5EiJZsNJLVTkFv/17zVs1IKdDJn/KxkG22AxbaY0kT6iVQtLoPQmdOvXIg
 r1I4AXslfAke/DmM15bljbsduSeR/l61Kjq2M/OAy55XK+bMPJY1e/6zJyvv3MW2aXwB
 9W2w==
X-Gm-Message-State: AAQBX9cIBgfBkqJAnn68EUydD+oGrknmxtGYTmrTkW54d0tVu0TglQP3
 MIQp5jforCiOxFq4Ts7nVgX6lA==
X-Google-Smtp-Source: AKy350a1RnFHhnCb4nDHDUFDZEK3G1dY2NlIYfiSjSWKmf67vTEDnztfUAcirZhbgAH7loNvBK2aGw==
X-Received: by 2002:a19:ae0a:0:b0:4d7:44c9:9f4b with SMTP id
 f10-20020a19ae0a000000b004d744c99f4bmr451467lfc.1.1682001235170; 
 Thu, 20 Apr 2023 07:33:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a197403000000b004dda87ecae3sm233446lfe.246.2023.04.20.07.33.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:33:54 -0700 (PDT)
Message-ID: <7ad86cd9-4b30-e7f1-780f-2c1c7093087e@linaro.org>
Date: Thu, 20 Apr 2023 17:33:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] drm/msm/dpu: Drop unused members from HW structs
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230418-dpu-drop-useless-for-lookup-v1-0-b9897ceb6f3e@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-dpu-drop-useless-for-lookup-v1-1-b9897ceb6f3e@somainline.org>
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
Cc: Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 02:14, Marijn Suijten wrote:
> Some of these members were initialized while never read, while others
> were not even assigned any value at all.  Drop them to save some space,
> and above all confusion when looking at these members.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Fixes: 84a33d0fd921 ("drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks")

The fixes headers are slightly questionable, as unused fields are not a 
bug. Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h   | 5 -----
>   6 files changed, 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 84ee2efa9c66..a9c90249a6ac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -374,7 +374,6 @@ struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
>   	 */
>   	c->idx = idx;
>   	c->cap = cfg;
> -	c->mdss = m;
>   	_setup_intf_ops(&c->ops, c->cap->features);
>   
>   	return c;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 643dd10bc030..e07b2e33af3e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -90,7 +90,6 @@ struct dpu_hw_intf {
>   	/* intf */
>   	enum dpu_intf idx;
>   	const struct dpu_intf_cfg *cap;
> -	const struct dpu_mdss_cfg *mdss;
>   
>   	/* ops */
>   	struct dpu_hw_intf_ops ops;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index cf70a9bd1034..bb3ddec5c7d7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -812,7 +812,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
>   	}
>   
>   	/* Assign ops */
> -	hw_pipe->catalog = catalog;
>   	hw_pipe->ubwc = catalog->ubwc;
>   	hw_pipe->idx = idx;
>   	hw_pipe->cap = cfg;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 74b98b6b3bc3..5004a02fd61e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -341,7 +341,6 @@ struct dpu_hw_sspp_ops {
>    * struct dpu_hw_sspp - pipe description
>    * @base: hardware block base structure
>    * @hw: block hardware details
> - * @catalog: back pointer to catalog
>    * @ubwc: ubwc configuration data
>    * @idx: pipe index
>    * @cap: pointer to layer_cfg
> @@ -350,7 +349,6 @@ struct dpu_hw_sspp_ops {
>   struct dpu_hw_sspp {
>   	struct dpu_hw_blk base;
>   	struct dpu_hw_blk_reg_map hw;
> -	const struct dpu_mdss_cfg *catalog;
>   	const struct dpu_ubwc_cfg *ubwc;
>   
>   	/* Pipe */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 2d28afdf860e..db5e6040017f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -262,7 +262,6 @@ struct dpu_hw_wb *dpu_hw_wb_init(enum dpu_wb idx,
>   	}
>   
>   	/* Assign ops */
> -	c->mdp = &m->mdp[0];
>   	c->idx = idx;
>   	c->caps = cfg;
>   	_setup_wb_ops(&c->ops, c->caps->features);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> index 3ff5a48541e2..b91923f879f1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
> @@ -76,15 +76,12 @@ struct dpu_hw_wb_ops {
>   /**
>    * struct dpu_hw_wb : WB driver object
>    * @hw: block hardware details
> - * @mdp: pointer to associated mdp portion of the catalog
>    * @idx: hardware index number within type
>    * @wb_hw_caps: hardware capabilities
>    * @ops: function pointers
> - * @hw_mdp: MDP top level hardware block
>    */
>   struct dpu_hw_wb {
>   	struct dpu_hw_blk_reg_map hw;
> -	const struct dpu_mdp_cfg *mdp;
>   
>   	/* wb path */
>   	int idx;
> @@ -92,8 +89,6 @@ struct dpu_hw_wb {
>   
>   	/* ops */
>   	struct dpu_hw_wb_ops ops;
> -
> -	struct dpu_hw_mdp *hw_mdp;
>   };
>   
>   /**
> 

-- 
With best wishes
Dmitry

