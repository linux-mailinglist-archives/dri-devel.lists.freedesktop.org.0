Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BE71493A
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D97B10E286;
	Mon, 29 May 2023 12:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CD210E286
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:15:56 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af1822b710so33618411fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 05:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685362554; x=1687954554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4R+IfYo+E0SCCMD1zQpk0fCdlACgecdJiT+kGuqtiLg=;
 b=StPnAtUCsV6F1TvbGaGOO5K8T4D+osbaUPE84n7vpIgQLPOhWXmf2VSZHgGNsNizeP
 2b//hXbvsBdFFopE3FaEoZmmlb8QaYwAAB3lveJLIfFDuxdPAxICRVzi4zNiAJAJ+4S2
 ntcAgJWM07if4qmkSAuwZq9p8oZevZiorWXn+5R3W/stB3qWFsZ3XGchwnXBHZLoZ6qb
 DPXsVukBjItob1hHw0Gbl7M46z/FJeEFdHMWAsoorGjRbkS6Al3sajuxbFIoqIodI7+4
 qthetIQvflWchqqtCpp2gL0iAZTympVPgELG9DDU8qXqZdhqgsCgig/dPjeu3XSzPtF1
 UtXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685362554; x=1687954554;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4R+IfYo+E0SCCMD1zQpk0fCdlACgecdJiT+kGuqtiLg=;
 b=lulsUggOJDBxjjnDBhSpnLYuKH49U7HjPvJ9azri9f6ofIia4mxNtikd4Y35yw+IY4
 U4hm8EbNZmGUBaXAVtxCgoALkMi0yH/xOdqpiOxWfadUWGFKEV744BA1AEO6Bt2RlkY8
 hWgPn1uJJVzCQpNmUfQBuw2ed3UVa5SfVj62/Zt01ZtfYglADyr5vMwYsxfL22E3nZPI
 h9lNQHcmjxV+zUL8G0XvuXxt1Q09mAMf8/UXRpQ6iU618OdErMxw1B4Dt0GvCA1nBn57
 Ujk1fIyyRpVstlVRkbCF4W63jbiR+rBLLTUu4w1AZsPiVpPzEijF81EodIhRB0mCLWpG
 qnvg==
X-Gm-Message-State: AC+VfDyq+J9gG77DXwJTD+D7kJJemaScXFLUPH5fLzldx+YT3uOadzN2
 p31hW5eiPKNqeK/lZAnUMLarfA==
X-Google-Smtp-Source: ACHHUZ6aG6I3AHLtXeZR7Ibl3hYkDkhoUmq/6kFzkMFcm1XAR4QkvNx7jyhrqwijGbSD0P1l5QeOCw==
X-Received: by 2002:ac2:5204:0:b0:4f3:bb84:a780 with SMTP id
 a4-20020ac25204000000b004f3bb84a780mr3686586lfl.23.1685362554501; 
 Mon, 29 May 2023 05:15:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a19ad49000000b004edc55d3900sm1974509lfd.0.2023.05.29.05.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:15:53 -0700 (PDT)
Message-ID: <35662a02-a06d-017a-56bd-9e328fc0ae39@linaro.org>
Date: Mon, 29 May 2023 15:15:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/7] drm/msm/dsi: Add configuration for MSM8226
Content-Language: en-GB
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-5-679f335d3d5b@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-5-679f335d3d5b@z3ntu.xyz>
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/05/2023 12:44, Luca Weiss wrote:
> Add the config for the v1.0.2 DSI found on MSM8226. We can reuse
> existing bits from other revisions that are identical for v1.0.2.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>   2 files changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

