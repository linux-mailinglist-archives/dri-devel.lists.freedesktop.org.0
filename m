Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2968E54308A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A7A10E98E;
	Wed,  8 Jun 2022 12:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A87C10E98E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:37:58 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id v1so30512106ejg.13
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NHIetuJMCCtxZ99NkRHS0VtGi8XQFFhwLSYL0Z9zvSg=;
 b=XxfX5E6ZIq2gg6arJxbd1VWHNHNd8ze3UjlEriuPNrOGHnYCMI7mah53xfcVh/aSdg
 7GIAQ4LI2gGc73+XLyIiv0n64nTwuGbgCLsYJylmxNDVAoOsBdgSRJPsjxms4wbv4A4/
 Iyx111eTK9xZBykGyFKpj/gc8kVV2FEhq9T0r2gmeIUHzkisSapdLi4cAiNl1f7L0ArE
 A37xUGJmxX6yhEKaZ8o7HZe5fbdNAldU9F7RrdUX/NPPlUItlCszUk4ZbeuWH0ZVa8SH
 iHrjM4Jb91fb2BKRbsoIknZb1lIptQTJFZowbZUZOmw1HWFUdxognHXvYLe8z9zkrsyF
 NiQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NHIetuJMCCtxZ99NkRHS0VtGi8XQFFhwLSYL0Z9zvSg=;
 b=kbajt1Rx7g6n8f8EOAIuzQ5lUObfNMhjSgduCf6nLi8SMaitIfLCpxn2tTgaA0KxPx
 RYxdrBtuno7sSPPOjkNma0LA4gB6fzQHS3OwxXBT/3fMYXgP8aelbYZHdTkt68W58Qv6
 1W7VLNcAUGz4yYQHf5srz/zMbM5jHF9dajRudLDOfdfTl/PDtQza8pmtMONyS1zxqE/o
 HhtpJSDhXHFuG5BsQStAGokOn83jRZAamoYAFTfW0z1pS07Rk/Un7J6QI10ByeZUFpI7
 uzg5BrepQLfIVhX479XFl/Gie9Fz3UjDeUWLNFQHC6HkYnzJRzBHT615YR48gWKRZ/Pt
 2s3g==
X-Gm-Message-State: AOAM5312FpF1H7XfA3UJOIxL8HONolh6UQScoR52vh4Z/fIrxPZDw60p
 ONLnIymtCQ8L+utuR/nSH5sP6Q==
X-Google-Smtp-Source: ABdhPJw9TCJr3FEiqfRvqPTVN3ZNekIiUPP4dDLMm5LkpOs1Bj7RM6hndPutXi1h9Rha1wG0AAaRDg==
X-Received: by 2002:a17:907:1628:b0:711:e3fe:50a9 with SMTP id
 hb40-20020a170907162800b00711e3fe50a9mr6738850ejc.746.1654691876853; 
 Wed, 08 Jun 2022 05:37:56 -0700 (PDT)
Received: from [192.168.0.192] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05640207cf00b0042dd60352d1sm12304001edy.35.2022.06.08.05.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 05:37:56 -0700 (PDT)
Message-ID: <1abaa0ae-1080-1f78-70a8-6d263ded94cd@linaro.org>
Date: Wed, 8 Jun 2022 14:37:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 02/12] dt-bindings: display/msm: hdmi: mark old GPIO
 properties as deprecated
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/06/2022 14:07, Dmitry Baryshkov wrote:
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
