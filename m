Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7376EB12F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 19:50:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB44910E65E;
	Fri, 21 Apr 2023 17:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F63810E327
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 17:50:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2a8ba5f1d6bso18547051fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682099439; x=1684691439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KhFQgubx3BwRpneR+uPik55kKaBM11rBostrxvE6DUg=;
 b=ZpfuMSjahsn2zfIK1YJS7GIdwB6UzWp+2za1evy8drzjnxvPZie5KKG0nDOoM6LnVj
 GqFraHvvzX9vPHUV5WF70e5oM7Hc9QhzR8LJtNZ5NWsaBhm8ZKOxW2ufSMQQVif1vpb5
 ujUsGDnwLHMi0SAZZzM0utYvrcaSwJiCkyb0ejIjOJDySLJHl9ap+qT+g+SGYjqRpnIZ
 U9dOEwdeYy6fsQGWKXYW0qB3ghe4So06E3DbbhTQ/lm14BkMdNtz5zGbOkE34OzpQqa7
 YZ9tx36Gy11cBPzdlV02uEEqtfAfOEarEYkZjF0bt2aKJcvq69/Ma1mtOeug+KsyvOp4
 FsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682099439; x=1684691439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KhFQgubx3BwRpneR+uPik55kKaBM11rBostrxvE6DUg=;
 b=jtt375SGQ4lDQncSmvRjc8gg1r1UBgxvwYtlxAsFuTg+uRZ2tFu4Rg1mn6tT2oakIX
 MMGQgNzT2Hs22j2GqIh3Zm2rmUmeNi+JWPafXjMd4fmmPt5qzfqJ1/6W8sfyo+dd+hmN
 b0PIVpHb1kGxb1IrAb3dORubTRYPDm3u73Oofv/D8G11ts2Z0EiG1rY4XB0PmP1p3HcK
 y7I+SG5y9WyZAFWOEDj2ri8tPeEPDxwXmGvvP55KDWVt+EztHvTsBKp3LHBVV8R18A+r
 HoF89m76A3KIo6OKd9AWt12rtaZqo22nrQ99iT4ayJfL2sL86/s6hJ8YLn8zQ94IKZDY
 PSrA==
X-Gm-Message-State: AAQBX9dcW3GxpuzA+JFn3Z45USStMcrstm4CMu8veSciq0y2VrhJY+Nq
 jf+EtW27U88eixL5pWsEqW2+Fw==
X-Google-Smtp-Source: AKy350YLl37LWk+3RtVor9s7w8AS7YAJyV+v7/RwqjI5kuzAKNNFDYjrD1jErrVutbXwsdxB1F4ZLQ==
X-Received: by 2002:a2e:8350:0:b0:2a8:e4d3:11e2 with SMTP id
 l16-20020a2e8350000000b002a8e4d311e2mr832615ljh.39.1682099439063; 
 Fri, 21 Apr 2023 10:50:39 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a2e8783000000b002a8e4678da4sm679206lji.139.2023.04.21.10.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 10:50:38 -0700 (PDT)
Message-ID: <73e49bab-78a7-1fc2-e521-ede5429ed62e@linaro.org>
Date: Fri, 21 Apr 2023 20:50:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/2] drm/msm/dpu: drop the regdma configuration
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230420222558.1208887-1-dmitry.baryshkov@linaro.org>
 <911e0a6e-eae4-8f98-8247-f6b2e8a0aeb9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <911e0a6e-eae4-8f98-8247-f6b2e8a0aeb9@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 20:46, Abhinav Kumar wrote:
> 
> 
> On 4/20/2023 3:25 PM, Dmitry Baryshkov wrote:
>> The regdma is currently not used by the current driver. We have no way
>> to practically verify that the regdma is described correctly. Drop it
>> now.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
> 
> As Marijn noted, perhaps we can drop even DPU_CLK_CTRL_REG_DMA. But you 
> can add that separately, hence

I'd say it's not worth the trouble.

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

