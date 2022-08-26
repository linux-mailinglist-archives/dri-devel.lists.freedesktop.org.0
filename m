Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B35A24EC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:49:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DE110E820;
	Fri, 26 Aug 2022 09:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C43210E815
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:49:32 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id w22so1064841ljg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=fgD8MArf1fhW9WPJLzTNQiXID3sIQlI/i4dJ7hULjQw=;
 b=pkIvtxZgK8rMviwZp9ukD+I1XdMf6fNNSJlASJL+GEQDb2yfYKwmodPS56zxUTI/yz
 Pre9JxUwDK0jZv4S6/AnQX/lnZWp0dtvfaUlgjNv0xMh4zzdKTl0G1tUNVxQmV7m1EDj
 hyfinRvPUPeiUauxLpJZP5jakcTjshy6k9UtIdnCZo0ko9d7alKBWBr4KI7hZyct7/BZ
 OLUINoeVLck1b+MxE0NNd/VXhW9RaxB8ulWABWAHR5xjF5Kz9JMr13CKSMOFwFqHT+U2
 MpQXB0ojp8I+0ZxOWBjrVLjPkSmooPyoE3pT+9LTOFtAwqAN7twPrHtl4X1hs9dB8vUO
 OyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=fgD8MArf1fhW9WPJLzTNQiXID3sIQlI/i4dJ7hULjQw=;
 b=c4bjWcQaqJo42Yk1W9ktO27FKgzvGI+AT8dlhRh5WPXkPmolmrTEmEXhwW6eBTnmtC
 bWQXlc7u7itphM9SkIBOixeWrhyYhR8XHHmbYwgblVIap0ijkvbIGh7WlbdQ9ibtUyMn
 qJGYqrN1Gzug42xgMKm9wAbYRyCXd7GxqqjXgoAQWKsiS/+jBI2uIihpuDwaBBRuGcah
 H3140sIjv55M1QoBvzotDRhPYIHFZPrZaK7rURDnhC4s5VPCfBulbzk2kNOC807DtyYQ
 4lHmU2BMJwPgFDemyoyR7/1b+caH6NeT3UmQG46LkquWChTOiGMYXIChXNoYRcrG/ceR
 g7ZA==
X-Gm-Message-State: ACgBeo0qX5d+DQ5ypx3ojU408tf/QsKD6NDaXvBQzMJZfbLWIAhFNzmH
 1iUALuzoc1mZwIzCDyVkHZoiuw==
X-Google-Smtp-Source: AA6agR7sEd1utbCeElTi22gwgYpzu+d48/EbFU6j2iMazTayKRbT7oIMBOoasmz4JE2cWrX5tHUG+g==
X-Received: by 2002:a2e:844a:0:b0:255:46b9:5e86 with SMTP id
 u10-20020a2e844a000000b0025546b95e86mr1976897ljh.388.1661507370397; 
 Fri, 26 Aug 2022 02:49:30 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 x14-20020ac259ce000000b0049306939413sm319933lfn.211.2022.08.26.02.49.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:49:30 -0700 (PDT)
Message-ID: <568516e1-6a8c-34b7-7525-ba9cc522a465@linaro.org>
Date: Fri, 26 Aug 2022 12:49:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 4/5] dt-bindings: display/msm: dpu-sc7280: add missing
 DPU opp-table
Content-Language: en-GB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220817062059.18640-1-krzysztof.kozlowski@linaro.org>
 <20220817062059.18640-5-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220817062059.18640-5-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/08/2022 09:20, Krzysztof Kozlowski wrote:
> The 'display-controller' child (DPU) of Display SubSystem (MDSS) uses
> opp-table, so reference it which allows restricting DPU schema to fixed
> list of properties.
> 
> Fixes: 57fd4f34ddac ("dt-bindings: msm: add DT bindings for sc7280")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

