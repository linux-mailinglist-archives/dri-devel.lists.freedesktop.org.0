Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C53354C58B0
	for <lists+dri-devel@lfdr.de>; Sun, 27 Feb 2022 00:32:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A00FC10E203;
	Sat, 26 Feb 2022 23:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0DD10E203
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 23:32:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b11so15376004lfb.12
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Feb 2022 15:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uAAifAuUillXLfQ7S+jdv/GEcpCcdBCKNAMWe6JBNCQ=;
 b=kl11QDr19mfELOll6E4duE12IWzb1KZJnezNEUMeKbnT52BQWSU2on3w5bbUe3b3EW
 rW3t8Br5tZpLcivUEk/wgLUs9+lOCoXY7uTd4WNNnXoGGA306Jvu0z30aTwIYWAfpOwz
 S79pIYJEmp+GFERuOgiC4x7JSTRcQ/8v05gtvfBYOdpvRHb4l+XWw9hddfR5NZsIZ88j
 4WLwfONr7lUMjEwRSNIQhLHHF1KNW7axMExyPQ89luM9cykWc+2wpJLp/WqDQ+kJjOvm
 t0ddBSdC/QeY+k5sC7iHqI4e9CRE9i2eRETY734XLUgur6PTpPk9rjYmKl4sTiDjCWoS
 fkpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uAAifAuUillXLfQ7S+jdv/GEcpCcdBCKNAMWe6JBNCQ=;
 b=0ati/bixGcwNNWv2VY1Vj24azfi9LF62ZlGZM6TyDnlfHghvBtj2ofAYQt00GjhLoU
 OF1nCxeU5M3MErQQh3/fyuhxjeWPSw4Tt4X2IWso+dwieWbEdsBc/o9qE6OY5DYGDDBC
 m+vP5AmJarrx9vsmoIvRahKu1HNuEe2+V3DUlqKl0KsW1DgLiQZe30hq0ZFj1xcwE/St
 xVj8xcGX5g3PUQLAoWlB+kV966BgaDCA0whrD0NGel3tiHbqmxU/Nmrhn87jd8WJwTRX
 Ovm4mqiwKWJGUdMsBgeqY2VSv2C2efShGahmA+vzYUR5FkxpOpxcDeqN4zJLkNtKjXI5
 YYww==
X-Gm-Message-State: AOAM533g9Rmz9fHSXInpK2lIuOI4z+SdZIzZr0kb/r8x6rh0H8WqU9oU
 TFdBAcKQLe//w7H+WtG/ByKpSA==
X-Google-Smtp-Source: ABdhPJyfWldaoFQncybaXzOhjS2bFagYJ2D6zN/7PsPqDmUkKFn53ZIxnFc/UfVapBieoSk7IZEt8Q==
X-Received: by 2002:ac2:5c09:0:b0:443:7ae5:c341 with SMTP id
 r9-20020ac25c09000000b004437ae5c341mr8956054lfp.623.1645918321159; 
 Sat, 26 Feb 2022 15:32:01 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 a11-20020ac2520b000000b0044363e18b34sm548911lfl.148.2022.02.26.15.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 15:32:00 -0800 (PST)
Message-ID: <33aac1d8-acea-215c-0a76-05f992831f87@linaro.org>
Date: Sun, 27 Feb 2022 02:31:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] drm/msm/dpu: Use indexed array initializer to prevent
 mismatches
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20220226194633.204501-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220226194633.204501-1-marijn.suijten@somainline.org>
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
Cc: Vinod Koul <vkoul@kernel.org>, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie <airlied@linux.ie>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/02/2022 22:46, Marijn Suijten wrote:
> While there's a comment pointing from dpu_intr_set to dpu_hw_intr_reg
> and vice-versa, an array initializer using indices makes it so that the
> indices between the enum and array cannot possibly get out of sync even
> if they're accidentially ordered wrongly.  It is still useful to keep
> the comment to be made aware where the register offset mapping resides
> while looking at dpu_hw_intr_reg.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 34 +++++++++----------
>   1 file changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index c515b7cf922c..c61b5b283f08 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -54,87 +54,87 @@ struct dpu_intr_reg {
>    * When making changes be sure to sync with dpu_hw_intr_reg
>    */
>   static const struct dpu_intr_reg dpu_intr_set[] = {
> -	{
> +	[MDP_SSPP_TOP0_INTR] = {
>   		MDP_SSPP_TOP0_OFF+INTR_CLEAR,
>   		MDP_SSPP_TOP0_OFF+INTR_EN,
>   		MDP_SSPP_TOP0_OFF+INTR_STATUS
>   	},
> -	{
> +	[MDP_SSPP_TOP0_INTR2] = {
>   		MDP_SSPP_TOP0_OFF+INTR2_CLEAR,
>   		MDP_SSPP_TOP0_OFF+INTR2_EN,
>   		MDP_SSPP_TOP0_OFF+INTR2_STATUS
>   	},
> -	{
> +	[MDP_SSPP_TOP0_HIST_INTR] = {
>   		MDP_SSPP_TOP0_OFF+HIST_INTR_CLEAR,
>   		MDP_SSPP_TOP0_OFF+HIST_INTR_EN,
>   		MDP_SSPP_TOP0_OFF+HIST_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF0_INTR] = {
>   		MDP_INTF_0_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_0_OFF+INTF_INTR_EN,
>   		MDP_INTF_0_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF1_INTR] = {
>   		MDP_INTF_1_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_1_OFF+INTF_INTR_EN,
>   		MDP_INTF_1_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF2_INTR] = {
>   		MDP_INTF_2_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_2_OFF+INTF_INTR_EN,
>   		MDP_INTF_2_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF3_INTR] = {
>   		MDP_INTF_3_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_3_OFF+INTF_INTR_EN,
>   		MDP_INTF_3_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF4_INTR] = {
>   		MDP_INTF_4_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_4_OFF+INTF_INTR_EN,
>   		MDP_INTF_4_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF5_INTR] = {
>   		MDP_INTF_5_OFF+INTF_INTR_CLEAR,
>   		MDP_INTF_5_OFF+INTF_INTR_EN,
>   		MDP_INTF_5_OFF+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_AD4_0_INTR] = {
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_EN_OFF,
>   		MDP_AD4_0_OFF + MDP_AD4_INTR_STATUS_OFF,
>   	},
> -	{
> +	[MDP_AD4_1_INTR] = {
>   		MDP_AD4_1_OFF + MDP_AD4_INTR_CLEAR_OFF,
>   		MDP_AD4_1_OFF + MDP_AD4_INTR_EN_OFF,
>   		MDP_AD4_1_OFF + MDP_AD4_INTR_STATUS_OFF,
>   	},
> -	{
> +	[MDP_INTF0_7xxx_INTR] = {
>   		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_0_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF1_7xxx_INTR] = {
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF2_7xxx_INTR] = {
>   		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF3_7xxx_INTR] = {
>   		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF4_7xxx_INTR] = {
>   		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
>   	},
> -	{
> +	[MDP_INTF5_7xxx_INTR] = {
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
>   		MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_STATUS
> 
> base-commit: 06aeb1495c39c86ccfaf1adadc1d2200179f16eb


-- 
With best wishes
Dmitry
