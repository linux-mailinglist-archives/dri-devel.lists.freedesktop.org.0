Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F99705B46
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 01:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7602210E385;
	Tue, 16 May 2023 23:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B9F10E380
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 23:22:46 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f14f266b72so166878e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 16:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684279365; x=1686871365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7VAhpo92jN54Fe2L3yyfkmVB4msq33PbAZ9pt+KT4z8=;
 b=PEjKzkKFwg9DhWnkbxJIppl3GBnbkXu3XtMQpwJuourIFZZZmC5fiZnifNiPLMTCjU
 SnbTkokLPCSXFA37zY/8Rv7xKY/0oKMGKzm7Ly/pA25Sm8ULpecPptiYZgAMj3aeZKO9
 h764fhx/OgSu/GsW2Mj5DHnkceGTUY3fSuSI+xY/2m+1cEtiR2gvu/MgGSz1SsTuhKkA
 VdQ81FC9pEQb7QmaXuFANifFA0ywpBkaZCIEX5lUBjf/5PWaOGpJfwJr86AEpL48qjdl
 V4EweawUNHyM8ZbYHrPS7nKv7hg384jkBl140aRR32GLgB3E1TJB+KTdrUDGueSmvCZj
 G/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684279365; x=1686871365;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7VAhpo92jN54Fe2L3yyfkmVB4msq33PbAZ9pt+KT4z8=;
 b=ieO5gS7P49wVaoZN7vn8hM9Vn+zxwyHulOJncG+Nf1d+LeY8z2JLYZUBGmAyqYhf6q
 1x63dvAaZUo2C2xtL+GzX7sJuIyjxJuKUGfZ1XzyZREa8RXwIhlUbfH93gPTVlVm+NsH
 DpiI/h/BsD217g/m0sWQqL8bkti+yqrXoDZTjMCMChhlCVlBk8T7hxpYv1IEjC0kwRCC
 /YZxHjRfPeDGXuJ1TygZYELZ8nlIekq6B1trumtJwLs+Qe4Y6KXt1ztzJ+SwzbCIDX+V
 SDZ/guoKJjeA1HgBFbdnPzkGKEeZh4Cfq/VoQ4eQJQZRKDpwvmjvMa3ndW6Fn8kOwzc2
 zWcA==
X-Gm-Message-State: AC+VfDwqvJ1EPEEH+gyIMY53/5pZV6QEtWnYNq4krb8bLRMRgtJ445uz
 +pnA/ZLZaN1AiPcLQ9eL+a92Uw==
X-Google-Smtp-Source: ACHHUZ6ZLHWS6AxNdvby7Rx3xUbbWtDDyrWiA8gw73Uk9O49w5tJDuZUC7wwOX77tlraOpnpmbnTBQ==
X-Received: by 2002:ac2:46f6:0:b0:4f3:7b1b:ff7b with SMTP id
 q22-20020ac246f6000000b004f37b1bff7bmr3043742lfo.9.1684279364857; 
 Tue, 16 May 2023 16:22:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a19f70c000000b004db3d57c3a8sm3119886lfe.96.2023.05.16.16.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 16:22:44 -0700 (PDT)
Message-ID: <aec4f825-482a-5e8f-66e1-d74b218e1a8d@linaro.org>
Date: Wed, 17 May 2023 02:22:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] drm/msm: Be more shouty if per-process pgtables
 aren't working
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org
References: <20230516222039.907690-1-robdclark@gmail.com>
 <20230516222039.907690-2-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230516222039.907690-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2023 01:20, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Otherwise it is not always obvious if a dt or iommu change is causing us
> to fall back to global pgtable.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_iommu.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

