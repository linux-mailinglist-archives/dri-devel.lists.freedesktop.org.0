Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B396E8678
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 02:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043CB10E606;
	Thu, 20 Apr 2023 00:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5781410E585
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 00:27:39 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec817735a7so207515e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 17:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681950457; x=1684542457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OU1rCmbsnDfe9dKvPIpfOrN+IqTHtV2jf/biLiJ0fYs=;
 b=G4Mes1dXfAYTPB206qmpfb4Z9sZeeViY1Jf2EJ7v4NUDzzTrA82OOpBVceE3grdo4e
 kRJYtkilz/Eah+ougyY9pWRNXecsUou7rxk8NcShaK2+pAV3LHOTLKnjYOuUHroG0QgY
 af1w4wMSLX7Qq64ocNaQuY3NHY50ml3INARjGyWEbu9ZBCu2LKJDKVx12kYErj4AZ4JU
 UTBzjyLrBQLC0Ag1GeaXyN1JNX4Ez3fBby7VITwrWOUqbRkql9YourX7tcVshakOiw32
 iq908ZTjJrB7gx4vhSCsO+5RSqQDVdpkg+mmfxmGYUj1FRgI0Hh0R9bna62mLBdm/ITt
 FA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681950457; x=1684542457;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OU1rCmbsnDfe9dKvPIpfOrN+IqTHtV2jf/biLiJ0fYs=;
 b=cQIOYg4A913j/iX4y+5r51i87iMkk+6GkeVJE3B3iTYtVDbCfrmhKzrjjqnXJY0kHG
 5HJDHCQADHHg86V8iF40ecKyjarZQgxW/ZP9KNHekPmFkK647WrXFTacBadDbp4RLVEL
 oixOifmv1qqlhNYlJlUWPF6b31WZAeJY6p9EXnkjVDzbZkiiVVJdD164qMy5lEOfr2K7
 kW7IN9uPLHVmSlE/uhisI/iF+T0AFDH9cfyY6DUgOqDQPEdYXoMAD5MOtoBIwm6KTEnA
 aEW6bagBb8UatqWoVF4yt2pi45w7f8+UtXTpYxPzb1xN4cn9zm4FxWxYJUeDu3CM+3YT
 igNw==
X-Gm-Message-State: AAQBX9fSf/Zlb0w5y2ziRR6SliC0uwdXA1uFiOLxqtwq9ieKJSZiK0Df
 c9pD/qzKck3pZ7rAhB5fHMxKRg==
X-Google-Smtp-Source: AKy350YdOiukgpi5MS1TnPwjknJUjmT3eL0beMikzCX//Uctsz9WnSPzKL6NA3VmCj2so0rTtRiGpw==
X-Received: by 2002:ac2:5e89:0:b0:4eb:d8d:6c14 with SMTP id
 b9-20020ac25e89000000b004eb0d8d6c14mr4353732lfq.11.1681950457626; 
 Wed, 19 Apr 2023 17:27:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a2e938f000000b002a8aadcf15bsm10510ljh.120.2023.04.19.17.27.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 17:27:37 -0700 (PDT)
Message-ID: <5dcdbd51-d30a-b62a-b231-b416b69af135@linaro.org>
Date: Thu, 20 Apr 2023 03:27:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] drm/msm/mdss: Rename path references to mdp_path
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <20230417-topic-dpu_regbus-v1-3-06fbdc1643c0@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230417-topic-dpu_regbus-v1-3-06fbdc1643c0@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/04/2023 18:30, Konrad Dybcio wrote:
> The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
> CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
> calculated, but the latter one has static predefines spanning all SoCs.
> 
> In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
> the path-related struct members to include "mdp_".
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

