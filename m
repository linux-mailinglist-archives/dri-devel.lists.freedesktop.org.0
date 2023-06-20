Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2DD7369C4
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 12:47:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD12E10E2AF;
	Tue, 20 Jun 2023 10:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B280E10E2AF
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 10:47:05 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so5944767e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 03:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687258023; x=1689850023;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BanzYfOAs/+LK0KUuxID5DuNcuAu4dyTjY5amtOp7CY=;
 b=yt3K7926CXy26DDCHOljWDzCnOoNmtnotKJOFweXwHqsSoOfOST492odDdIbNozCoy
 JwJJU820/ahdmpzuT6NJgwmcqQJ6/X34AwlN3RUbMIn+ccSUN/dsm7wLqaR4/Clnk6km
 u7ryvwTV/FPDM6e6+Fsj253VoPn+1bP3ghv9M7PPazeuCbbc56B4Tq/nt9gI5V8D6J5G
 I/wgigJ4GOJWcHaQmQj1ILEODB+sPpl7/F5aQWT875oEQNwR5vM36JP0JDx7AnrxP9HY
 NtKmKkyQbLPPiY3/8/ZiQ5SQ3swJ3EdTRvq8hSbeepWx4DRd2xif7p5hOrdnzN/ModUt
 1ZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687258023; x=1689850023;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BanzYfOAs/+LK0KUuxID5DuNcuAu4dyTjY5amtOp7CY=;
 b=OrWupILQ8QAOqltA+KhUeuDbLLgWOyalGBOpY5ILsThkmYMO8IMe3jul6GmTEW1NjD
 Llm4C/mPOXjHn4pcWFqM6vl6VeD1dOIIedoV+2ugrPJBY7s8KwEV9uY7arZHdo+UF5R8
 EY+lZIdxej42aImoswLEdKGV64qG5cdjt0/dUu0sBem5sC9tm8coWHbrEDasHB52f3B6
 IrE8DKw7pCunm1ocu9JKmJ9sSTAJthfj1SCwYY4mdx/H/nsv+accjzkiMM0JzOr7eLbL
 aog/qy8Q4JVbP+ir7y9N7bXxGfJOGiw+Wl5fqYnIITaFWb4nrOJVelUdm6g4UXTf0azY
 xJ7A==
X-Gm-Message-State: AC+VfDzwGez7gTr3gB749lT3IrUQYvnx+YrWTZ1xBgqZZmEBzf85nhCt
 DP3fBWN8wEtW8p+XWHiLR4kJ8Q==
X-Google-Smtp-Source: ACHHUZ4yw1nODKolfTWGMZpG34CpSQPnPV/9yBYVCrYybA03/xmKPKB9MJAMNkr+ZMGAAsvu74lXyg==
X-Received: by 2002:a05:6512:3d90:b0:4f8:5600:9e5e with SMTP id
 k16-20020a0565123d9000b004f856009e5emr8479659lfv.47.1687258023652; 
 Tue, 20 Jun 2023 03:47:03 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac25ec4000000b004edc72be17csm317269lfq.2.2023.06.20.03.47.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:47:03 -0700 (PDT)
Message-ID: <c0d94c16-45f5-c56c-4b8b-8e05663653f4@linaro.org>
Date: Tue, 20 Jun 2023 12:47:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/8] drm/msm/dpu: rework indentation in dpu_core_perf
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> dpu_core_perf.c contains several multi-line conditions which are hard to
> comprehent because of the indentation. Rework the identation of these
> conditions to make it easier to understand them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index ba146af73bc5..f8d5c87d0915 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -148,8 +148,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
> -		    (dpu_crtc_get_client_type(tmp_crtc) ==
> -				curr_client_type) && (tmp_crtc != crtc)) {
> +		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
> +		    tmp_crtc != crtc) {
>  			struct dpu_crtc_state *tmp_cstate =
>  				to_dpu_crtc_state(tmp_crtc->state);
>  
> @@ -194,8 +194,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  
>  	drm_for_each_crtc(tmp_crtc, crtc->dev) {
>  		if (tmp_crtc->enabled &&
> -			curr_client_type ==
> -				dpu_crtc_get_client_type(tmp_crtc)) {
> +		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
>  			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
>  
>  			perf.bw_ctl += dpu_cstate->new_perf.bw_ctl;
> @@ -325,10 +324,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>  			update_bus = true;
>  		}
>  
> -		if ((params_changed &&
> -			(new->core_clk_rate > old->core_clk_rate)) ||
> -			(!params_changed &&
> -			(new->core_clk_rate < old->core_clk_rate))) {
> +		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
> +		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
>  			old->core_clk_rate = new->core_clk_rate;
>  			update_clk = true;
>  		}
