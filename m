Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1F054D384
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 23:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31551132B2;
	Wed, 15 Jun 2022 21:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67E0D1132B2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 21:18:28 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso3172626pjh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 14:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AdSNYlarnghZLL4+EwD5Nxa+VwtZOE12n1YSRFgSAD0=;
 b=rq4HnFWbq6xo4ji9uDTZmvctRQPOMXHvVKyRxreJHg5eITcoxkEQ6nZOWfWPBms4Fl
 zKZ61g6FzYqexv/S1p1JkHv3DWL7dHqvtn0J4/fF1v9m8yX4qTbP/s6ZyY93Jlqzc2Sj
 gLyuPHqzLXNHJe0FwYjs645KMSKe6FSsJi4rbByhr4xKMEId9b3FldShsDEwNo2C8B1S
 NeODmLsRDJ+3tVZ788Hah7dyxkh0ZqqCxb33Nta7jTiNPVDRwwmKg9QcKGMKlG9Alvbf
 UoeEFLICKmbY7LfDudU4Mu1CEG6Ld7nyvMFn/dYae2vOXm5A9YFTHfIs3lAgBP4oaYtv
 Xjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AdSNYlarnghZLL4+EwD5Nxa+VwtZOE12n1YSRFgSAD0=;
 b=FtJug/vPieg7YaBEifQ5znYnQ8QVQIUYw2olmMAWw1oXsCEmcES4osBYXq/o/jDhA+
 YrGvkGOPeJsdaaZwys/nn6leAagvG3nNVtq+fBdxbR3WslrIvtVi4tGhod0V+fIKZGE+
 X7jU2US7QUrh+oxhiqB+RFVNYMtq0JOF5DnVbjXbGNmqiUeKGQmVRx/WoOUt241Dtvz5
 l2d5XfSVyuHRJtXPx37XcUHKCluWDR5ixjMTKQcBJjy+ygJFwG/w86pSNeshE/Fd/GzU
 WQn0oNTnNVpgQas1cbx0KhOYqO0xVCW17Hcv/UaVLgGbihEqf/2W+QoH1NqNstvFneuC
 S88g==
X-Gm-Message-State: AJIora9g2O/j4RPqkpK1J9yFf3nk/u41MHoPG7yVtQzQckYtJZ0/zgoC
 3WC0SvGLYcq5+VkI2U4HLIPRXQ==
X-Google-Smtp-Source: AGRyM1tA/elZAAtrJW4sA4e2iACdIX7S4wavbn+hv4qN9/qOkHwSZUGjW/opaYx+1Ur/YEnpVMCSaQ==
X-Received: by 2002:a17:903:230b:b0:167:5310:9eed with SMTP id
 d11-20020a170903230b00b0016753109eedmr1469945plh.46.1655327907931; 
 Wed, 15 Jun 2022 14:18:27 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a17090a6b4800b001e2d4ef6160sm39763pjl.27.2022.06.15.14.18.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 14:18:27 -0700 (PDT)
Message-ID: <90bf6d4b-68bd-3508-7a28-4b45287ee4cb@linaro.org>
Date: Wed, 15 Jun 2022 14:18:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: hdmi: split and
 convert to yaml
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
 <20220609122350.3157529-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220609122350.3157529-2-dmitry.baryshkov@linaro.org>
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
 Stephen Boyd <swboyd@chromium.org>, David Heidelberg <david@ixit.cz>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2022 05:23, Dmitry Baryshkov wrote:
> Convert Qualcomm HDMI binding into HDMI TX and PHY yaml bindings.
> 
> Changes to schema:
> HDMI:
>  - fixed reg-names numbering to match 0..3 instead 0,1,3,4
>  - dropped qcom,tx-ddc-* from example, they were not documented
>  - make phy-names deprecated, drop it from the examples
> 
> PHY:
>  - moved into phy/ directory
>  - split into QMP and non-QMP PHY schemas
> 
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
