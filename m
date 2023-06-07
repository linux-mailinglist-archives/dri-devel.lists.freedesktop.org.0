Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8E7272D9
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 01:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2114510E567;
	Wed,  7 Jun 2023 23:21:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B0210E56F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 23:21:08 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f4b384c09fso43044e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 16:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686180067; x=1688772067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5BRvWWvhCLGbcXd1+v4aBkM7sXnYeF061U3u5C8oRU0=;
 b=z0TzEhH1PG61Vx6RPciZ8/KgXo2NqjqmOMgU/fDHAmR4VbCmezy0MslKB3nIfBUtHL
 PTXfEGg4PN3TfMD32midA0h5iCOtY1By/WZCj2eMxxjUpMf4D1mqkb6PV5ilnjlYvi/M
 hx40aMkma5t1ieA+Yo1Hta3e4xC/X7660oW42LW7u8cWcr3qfQypJM8yc3m1Cl4T27g5
 2kOlvdgz1YKBfNlpbI7NykuH2kv3DHMC5RqycxQRJwxRGtMKZRVC8jwjGxFY0V/rOe+k
 sIv54563gl3FeUD8RBDRT1WfDcO0kqwcy/zSRn0ZSzkUG4FN7gPTavNVBX8Y5P4PlKMS
 danA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686180067; x=1688772067;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5BRvWWvhCLGbcXd1+v4aBkM7sXnYeF061U3u5C8oRU0=;
 b=es5hNceqSMJttVXwTXvx+70bjTrTzQ6ZeBuGVA5JVOZ21MZp90+rarXEhQzYRjlJ+7
 QFJE+Lg6r/weRSjKFFiMTVgcBNsWzFj6SvWhTXj1Tst3yCz91XQre8RYJ9toL1yWtdpM
 041h2ozR9WTx6E2wyCcud535S9GgqimeBukPnz4uJbRaIhttAmasCsjzppGjXXd3XvXk
 N4X65aNkAR/TVtE8Mgsl3v1ezYsbews9evjqTclfvdlYNeLFlDX9ulG+kGy16Y2Ai9MT
 l5hdhsA2Q1kIHQdGV4Ds2W5Jqak5ymmFKNoOCJ4kyBQwygCifY0N+ZLP09YgHIn6Scro
 E/rQ==
X-Gm-Message-State: AC+VfDwT3w4kR77fY/F2AIPIU7+985K7AdM+R4KHZLyirbDhWanaOzWA
 HMpuV6nKwggrqCXo2h75IUBwxw==
X-Google-Smtp-Source: ACHHUZ7rdziHqciH7iFMaX12zv5gokegQCsJ25zS5juFFtQ9fBof+gAcj4pDb3iXlirtt6YSJ/FFEw==
X-Received: by 2002:ac2:44d8:0:b0:4f3:94b5:3274 with SMTP id
 d24-20020ac244d8000000b004f394b53274mr2556046lfm.63.1686180066767; 
 Wed, 07 Jun 2023 16:21:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w5-20020ac24425000000b004edc2a023ffsm1938060lfl.36.2023.06.07.16.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 16:21:06 -0700 (PDT)
Message-ID: <d3e58850-6386-77fb-a134-cbaa98ce57f1@linaro.org>
Date: Thu, 8 Jun 2023 02:21:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v17] drm/msm/dpu: add DSC blocks to the catalog of MSM8998
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
 sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
 vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, agross@kernel.org,
 andersson@kernel.org, marijn.suijten@somainline.org
References: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1686082272-22191-1-git-send-email-quic_khsieh@quicinc.com>
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
 linux-kernel@vger.kernel.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/06/2023 23:11, Kuogee Hsieh wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Some platforms have DSC blocks which have not been declared in the catalog.
> Complete DSC 1.1 support for all platforms by adding the missing blocks to
> MSM8998.
> 
> Changes in v9:
> -- add MSM8998 and SC8180x to commit title
> 
> Changes in v10:
> -- fix grammar at commit text
> 
> Changes in v12:
> -- fix "titil" with "title" at changes in v9
> 
> Changes in v14:
> -- "dsc" tp "DSC" at commit title
> 
> Changes in v15:
> -- fix merge conflicts at dpu_5_1_sc8180x.h
> 
> Changes in v16
> -- fix cherry-pick error by deleting both redundant .dsc and .dsc_count
>     assignment from dpu_5_1_sc8180x.h
> 
> Changes in v17
> -- remove sc8180x from both commit title and text
> -- remove Reviewed-by
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'll fix the commit message.

-- 
With best wishes
Dmitry

