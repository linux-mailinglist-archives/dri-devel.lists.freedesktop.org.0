Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC0566E42A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 17:56:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A74F10E58F;
	Tue, 17 Jan 2023 16:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245410E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 16:56:28 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id w14so28625490edi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 08:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TGV4flLnQ5GTALrRq/Zcwkc6MngRMczwaKltVAPchZ8=;
 b=a5DsX7tGttZrH4i9+WGxNwwdcC38Os+LgctGMXaNIWQ6lsx7+RQQCj6D6DGFLwa3ci
 NU9Ml9vzTBe/cZvC1evO6Ws/L3FRq3H19/Eb0eFV0SZO8B+Gjlf+LHxN/IKtEzQ0zXLL
 Dft50Bc1v+WbI9N+CPA4dwxF6CU6OvEB7LRH80csnkfF9rK2WHms2Wenrvy1kJKsDCmJ
 as7B6zMi8wulD8YebY7yxcHBLv7jpbUZnOPxr50Cy8LT0w9+aUPc4zIEC3LROnv5B56+
 HBYZ5VugYbWKLum+4U1pbXY0R2fWqTzqnT56d6Tftfy0MatcnVv6KMZMHRnulyoyX6pS
 ADTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TGV4flLnQ5GTALrRq/Zcwkc6MngRMczwaKltVAPchZ8=;
 b=S3mcREEggSjzNhi/KwNF1L4E8rs5X0gDhX6QuB4YViW5CLhQh8ARAo3sBeAntce9UJ
 dycyGLo4McSMn2PjA/eGI1fX9a+jhW77yZnGXc85qmaRqWTbD9PAGt8kloO8qsXx/p6A
 JXjBqLOqQyuEu2/ib0eFyAzOpD0n6cOpMvQOy7u5csP4JzLxGMimzUQOvXPPs+bY2Sl1
 Tdx1tG1suhkuRniz2rEVmOfMohxyJ5qtJOQtkojPaqvlBKiqfTcWBX9Klww4TaE4+mdE
 d9eVTbzLAAdVQI6jSt4VvXEDIsZea/Ws0cxDrEy21qx82bW/LiBwFR/nQW+2V7PbqnpY
 aICQ==
X-Gm-Message-State: AFqh2krY13KFJwUfrJWAcF9VN3YyJqPNfASXyMwShkUy23To9KfH9c2G
 OLyhOqqFRWGyOR1Cu2M54JNc0g==
X-Google-Smtp-Source: AMrXdXs7lqL6ddQMdEKsHzt3CWm0CKMQZkMNBqrtckHmN2Nt39+LVmJHknh3eXfQpzq5Xw0++bZ/Gg==
X-Received: by 2002:a05:6402:138b:b0:48e:a9a1:c584 with SMTP id
 b11-20020a056402138b00b0048ea9a1c584mr3764323edv.35.1673974586655; 
 Tue, 17 Jan 2023 08:56:26 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a50ef11000000b0049c4e3d4139sm5486233eds.89.2023.01.17.08.56.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 08:56:26 -0800 (PST)
Message-ID: <24ef467e-24a6-fc8f-3859-95ec0ae109ae@linaro.org>
Date: Tue, 17 Jan 2023 18:56:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] drm/msm/disp/dpu1: allow dspp selection for all the
 interfaces
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1673972488-30140-1-git-send-email-quic_kalyant@quicinc.com>
 <1673972488-30140-3-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1673972488-30140-3-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/01/2023 18:21, Kalyan Thota wrote:
> Allow dspps to be populated as a requirement for all the encoder
> types it need not be just DSI. If for any encoder the dspp
> allocation doesn't go through then there can be an option to
> fallback for color features.
> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b..e39b345 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -545,7 +545,8 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>   static struct msm_display_topology dpu_encoder_get_topology(
>   			struct dpu_encoder_virt *dpu_enc,
>   			struct dpu_kms *dpu_kms,
> -			struct drm_display_mode *mode)
> +			struct drm_display_mode *mode,
> +			struct drm_crtc_state *crtc_state)

Is this new argument used at all?

>   {
>   	struct msm_display_topology topology = {0};
>   	int i, intf_count = 0;
> @@ -563,8 +564,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	 * 1 LM, 1 INTF
>   	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
>   	 *
> -	 * Adding color blocks only to primary interface if available in
> -	 * sufficient number
> +	 * dspp blocks are made optional. If RM manager cannot allocate
> +	 * dspp blocks, then reservations will still go through with non dspp LM's
> +	 * so as to allow color management support via composer fallbacks
>   	 */

No, this is not the way to go.

First, RM should prefer non-DSPP-enabled LMs if DSPP blocks are not 
required.  Right now your patch makes it possible to allocate LMs, that 
have DSPP attached, for non-CTM-enabled encoder and later fail 
allocation of DSPP for the CRTC which has CTM blob attached.

Second, the decision on using DSPPs should come from 
dpu_crtc_atomic_check(). Pass 'bool need_dspp' to this function from 
dpu_atomic_check(). Fail if the need_dspp constraint can't be fulfilled.


>   	if (intf_count == 2)
>   		topology.num_lm = 2;
> @@ -573,11 +575,9 @@ static struct msm_display_topology dpu_encoder_get_topology(
>   	else
>   		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
>   
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI) {
> -		if (dpu_kms->catalog->dspp &&
> -			(dpu_kms->catalog->dspp_count >= topology.num_lm))
> -			topology.num_dspp = topology.num_lm;
> -	}
> +	if (dpu_kms->catalog->dspp &&
> +	    (dpu_kms->catalog->dspp_count >= topology.num_lm))
> +		topology.num_dspp = topology.num_lm;
>   
>   	topology.num_enc = 0;
>   	topology.num_intf = intf_count;
> @@ -643,7 +643,7 @@ static int dpu_encoder_virt_atomic_check(
>   		}
>   	}
>   
> -	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
> +	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
>   
>   	/* Reserve dynamic resources now. */
>   	if (!ret) {

-- 
With best wishes
Dmitry

