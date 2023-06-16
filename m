Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205F3732C74
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8328C10E58E;
	Fri, 16 Jun 2023 09:49:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAE210E151
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 09:49:33 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f642a24555so579897e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 02:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686908972; x=1689500972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UZF9KFxIZfNMlNnN4a5urW2y13NYb+j9w9JbZAccnI0=;
 b=LfWXM+bRQRhDl55+u4QJwEWR5CJEukjUvCsWZAZFzHhp2yFtZl9WGm4OubFYJkZiXv
 3lhGyX2bLcQIZny1ciEPpo4t9xxxrI6LbCIGfruPUopKQQyrJv+BLTQgJiTyLdIIXzLj
 O0MZMtgBCvxbtU9Es+1ratCjaXLYRHzEzrunfJ+g3UoA1qhsWVPcO5GoxsVASmv9XwHb
 4tBbcihqgNfxTVE9N4YxRZeQ+8403ctzR6BB+ukLpkJk/27tXH2x0f4rWgs8kPQ0J6hC
 MXEu+XCEMuBM6czE1eGSW0gjMku5s/Jge2AmRAjHEQk236E8SOlwRWLOC0bL8Dv//K9s
 zcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686908972; x=1689500972;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UZF9KFxIZfNMlNnN4a5urW2y13NYb+j9w9JbZAccnI0=;
 b=hJmvdQh5h09rEk7X/kTP2W6SIqmx4S8oy+R4zT8wjh0b1aijdvpMvVI++q1E7s+c2j
 tRxLijo7IcHPis9Ica3Rn0AAdTdLckWnhGdSb4UFlSrhHDfzHDQIypJPMoK1s3SeL980
 jVnE65Jge5O+XJlwJ3O5ZyLJxTPIs9Qe1iX7YKS3zFtwq5Z5RQkvd78MlG9/qffzRVGL
 1LKTQZwOcvKlfLr4w0PAE5JlVRQnO9HZXxknZekgZCOSeA6KtRUevu6N1kptxuUHjKfr
 h9Jd7U8Xb0MovNZmfoxmJq1aJIzVnhAI1qDr6XP+1Xe6GTU5XgOugJe+GG7q1OA7YkAc
 uL1A==
X-Gm-Message-State: AC+VfDxeccCMUHej74LR6DtU/roOAIdLJF5Tu9qKEzquv7BdhPUvA9H8
 +vztlXmXElAWigq7LJhJPQ8O4Q==
X-Google-Smtp-Source: ACHHUZ6vKJ7mGdwajEVNIi/+OLER02kz5AF6qKLt13kQX+hdase2WXOCzr1xf/RqVopNxr3rMVXTKw==
X-Received: by 2002:a05:6512:54a:b0:4f4:cacb:4b4b with SMTP id
 h10-20020a056512054a00b004f4cacb4b4bmr940977lfl.18.1686908971946; 
 Fri, 16 Jun 2023 02:49:31 -0700 (PDT)
Received: from [192.168.1.151] (85-76-68-127-nat.elisa-mobile.fi.
 [85.76.68.127]) by smtp.gmail.com with ESMTPSA id
 d15-20020ac2544f000000b004f858848fefsm65878lfn.177.2023.06.16.02.49.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jun 2023 02:49:31 -0700 (PDT)
Message-ID: <f954a89f-a0f9-c30d-385d-6149dc360c1f@linaro.org>
Date: Fri, 16 Jun 2023 12:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 03/22] drm/msm/dpu: remove unused INTF_NONE interfaces
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
 <20230613001004.3426676-4-dmitry.baryshkov@linaro.org>
 <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6akejrsahbmrueanyhx5hdt5kipkm2fb4dylh4jzprfgzdbczk@x75wfsoza5ah>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/06/2023 01:26, Marijn Suijten wrote:
> On 2023-06-13 03:09:42, Dmitry Baryshkov wrote:
>> sm6115 and qcm2290 do not have INTF_0. Drop corresponding interface
>> definitions.
> 
> As Abhinav said, add sm6375.
> 
> If it wasn't for sc8280xp using INTF_NONE for fake MST, we could have
> dropped INTF_NONE and the special-cases in dpu_hw_interrupts.c and
> dpu_hw_intf.c entirely!  Is that your plan?

I have not thought about it yet. Generally I think INTF_NONE might still 
be useful to document interfaces that we do not want to support for some 
reason (e.g. MST or 8974/8084 eDP interfaces).

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> 

-- 
With best wishes
Dmitry

