Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3064678CD6
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 01:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BFA10E21C;
	Tue, 24 Jan 2023 00:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5812110E21C
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 00:28:25 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id mp20so34925774ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tjyTsMDmt31BlHBQvSSudpSDBFGEGpfCK49ak+UpW5k=;
 b=P515i+qerySP0rO8132vsKoOq+GVeAoI15L9AMuVLVTM4+ZZh8VsLaByOg14BfyHYX
 tW+MEBsmfDdWXrS6sKL4v+c9OS5NfQhT2Pz4VQF5q4V6uYvgab/D/1b63zid9e6D5IDp
 N9EvUdDcVMo/En+2u/2CleaVoWbYdsq2+bpfk8luk96Tz0QpsU2fVovteieiE62zF0MG
 pnLtJxFnFsl0rtH0g2VbZP/iRjKpQt8fzuG83JXDBF1XwaNbCJt0828rn08C2Mag7jBW
 3rIGOLxYYTIN27BQBviNIYo3cnHA/4KeTRCTyPQJeFdbsMkF6QIVEV3M5OpaWKBM0H39
 Rnlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tjyTsMDmt31BlHBQvSSudpSDBFGEGpfCK49ak+UpW5k=;
 b=hbkk42M6wnP9FaqCXk8qu17GDqwz59e2MwHUSdBS7aaXpKjM+ajH5sHW+a40lv1iNO
 3m4aJXft6K5FVUjHEL6GCs7FUTUv3epahhB09BcVgBVPthoIFOkgmrnZ+TUoVpK72r9X
 lw2odOYpIGxOfzlOYI1aJfkh4z/ZWL0KFXSc9ygf30UIvfjre14EkAKjyO139oMUAQsy
 8ybtqpGNsLG7IopTUrjW7pkMpmJwWx4FWgs6fA+8sntzR9YMs2qus1X5QNLg6IohTOI2
 52gHquEX+pAHINxRA7cvBeTYuetOIz3siirMmr7sIgVNDPVD411Zit3RZiTDG+vvjqLM
 IICA==
X-Gm-Message-State: AFqh2kqq9QWLfwbOoos8PWxqgrDSmVN7uNCk1X81QeOhSsvWt4pOfFNr
 4SckvHZH9tUJNOA9rFUAKewn+w==
X-Google-Smtp-Source: AMrXdXtJNgmulgrS5IsJGPMlnQVhgsp5jvWOBziGMmwq1XGGY9/FU/MrN1uBYi0aVJN6/hYj/TMTag==
X-Received: by 2002:a17:906:5f82:b0:871:45b2:19fb with SMTP id
 a2-20020a1709065f8200b0087145b219fbmr26389997eju.25.1674520103910; 
 Mon, 23 Jan 2023 16:28:23 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 ko26-20020a170907987a00b00846734faa9asm121355ejc.164.2023.01.23.16.28.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 16:28:23 -0800 (PST)
Message-ID: <69a62eb8-a7dd-3a73-e02d-b4bc332e2aef@linaro.org>
Date: Tue, 24 Jan 2023 02:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH Resend v11 14/15] drm/msm/disp/dpu: clear active interface
 in the datapath cleanup
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1674138393-475-1-git-send-email-quic_vpolimer@quicinc.com>
 <1674138393-475-15-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1674138393-475-15-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_sbillaka@quicinc.com, dianders@chromium.org,
 quic_bjorande@quicinc.com, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, linux-kernel@vger.kernel.org,
 quic_khsieh@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/01/2023 16:26, Vinod Polimera wrote:
> Clear interface active register from the datapath for a clean shutdown of
> the datapath.
> 
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9cf1263..30dee50 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2085,6 +2085,9 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   	if (phys_enc->hw_pp->merge_3d)
>   		intf_cfg.merge_3d = phys_enc->hw_pp->merge_3d->idx;
>   
> +	if (phys_enc->hw_intf)
> +		intf_cfg.intf = phys_enc->hw_intf->idx;
> +
>   	if (ctl->ops.reset_intf_cfg)
>   		ctl->ops.reset_intf_cfg(ctl, &intf_cfg);
>   

This is already handled as a part of the commit
9811913a6dd0 ("drm/msm/dpu: populate wb or intf before reset_intf_cfg")
-- 
With best wishes
Dmitry

