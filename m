Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF9756B12E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 05:58:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7FF12B3A0;
	Fri,  8 Jul 2022 03:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBCF12B37C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 03:57:16 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id t24so34370294lfr.4
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 20:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=d+W+CYgVHtPdSnaUFsEjZFbm2jY1agIXuYI2yF5T55s=;
 b=CUSWi9iZiYqV8xxuelbTxPoAfwl0RSCC5FtSv9FJHgRupYh7jA0kqdmc03Ttntsccn
 IGECCxuzBqfBpq+dyL4ZPuly0Kj45ZgfMX2JZxHKIF9+4evrZxah1Y3PeimYZEf2T+Hm
 NO9Qtk1vhQLUUcQNte/vg03RcSrtRZW5bhAEHuZa0ADAISlzWEBvMzJZx2GpA8ccGvtp
 Oi4WZVzynG6uv1YAsX9UrzYjC8QMDSrx2BCtr5V7FIWor1xKNvKkn3yLwjFsj/M2eKPq
 kZs4d2au+MZbK1Ve9cw2ln1wN36iBQmQ8RcxaIuEvDcXj7u7zYWXDwBBnjzJwi7QGTrE
 aYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d+W+CYgVHtPdSnaUFsEjZFbm2jY1agIXuYI2yF5T55s=;
 b=mTKqFSBEVnlvOfL4LkMT0jB2xxyMEM5gQM5lDiGju16SCLbtAxA5LpxFHOjwvcqYyP
 P9vU4gGg5vyvxturXsQ4SZaUEBc3QT62Uw1G39bqgkW29xDio7y5cP7WCdClCNa8dBYM
 CaPOGMb9QKCa/VIDjlJoy18sq3alL8UvW0D7yyZbKX/MF3M3KTt7h8TSpsT3sRd+uIgG
 /UD3+dG5OKJdIavqj4s4hVXhNMOX0V/Uj9aGMDCFzHSvTeqfSZ029LylHu+3JB4BEDT6
 Pv0jWnZSDFAZry0cvq0D4+aZKQMEsXXBpyxbkbE99rxQttrXivLu/5qhGin0LmaTne0U
 rAEA==
X-Gm-Message-State: AJIora8ZGHmY5cqYyNG0YS1FNTXNLOsGgtCLZZhWeQsVfp75FkoClysL
 M4JKe7vITDvO29z9R7ML+Ue7zw==
X-Google-Smtp-Source: AGRyM1v0VsbaUzE0u1YassAPiTUnCpM49yJzVyct4bGbaAQTJ3+q52gkGEn7IrfMV/C5w1BrzdrzQQ==
X-Received: by 2002:a05:6512:a8c:b0:47f:749e:8de3 with SMTP id
 m12-20020a0565120a8c00b0047f749e8de3mr943503lfu.568.1657252574779; 
 Thu, 07 Jul 2022 20:56:14 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a056512315500b0047f6e91d4fesm4788536lfi.141.2022.07.07.20.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 20:56:14 -0700 (PDT)
Message-ID: <88d21de7-58b8-7915-9fa4-783ed07efd62@linaro.org>
Date: Fri, 8 Jul 2022 06:56:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/9] dt-bindings: msm/dp: bring back support for legacy DP
 reg property
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-3-dmitry.baryshkov@linaro.org>
 <CAE-0n519u3S0WK-712aM-2zhZXrRvr7gh9aDSvRfMtkh-f4eUQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n519u3S0WK-712aM-2zhZXrRvr7gh9aDSvRfMtkh-f4eUQ@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/07/2022 04:29, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-07-07 14:31:57)
>> The commit 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
>> changed reg property to list separate register blocks, which broke
>> validation of DT files using single register block. Restore
>> compatibility with older (single register block) DT files by declaring
>> it as a deprecated alternative.
> 
> I think the intention was to quickly migrate the dts files to the
> multiple register regions. Why not just do that and drop this
> deprecation binding update?

Ack, will do in v2.

-- 
With best wishes
Dmitry
