Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49CF619973
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 15:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4025410E818;
	Fri,  4 Nov 2022 14:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F1310E814
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 14:20:56 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id a27so3078317qtw.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 07:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bfe4QYAii/msXqogDnhvJDFD5ejC6/JC1TdZ0YZAnVI=;
 b=FyxE3aSUOkrzTK/QGnh5iwhxJxO5xXxYiHBPnlQynz1BLSctcEwCGCNrK6jxH+LRPN
 wi1al9drpsMVRxUoR0smZMxu2j0mE5aDRe63spjQNFBvpSYaL4yGKIkul4xq2Rugb7fZ
 V7qB0ImNu5yFaKKtsEJuh/eNL9JRTut59ys/uYhHfRd4dvXiMmVoa1rOn7plCP9oaH5d
 jkbWivYhY3PKK28TERpxgGsz5NoijL80qEi5BHDFkAD7CvnA69T6mVIPrh/qdzeSLXr4
 yAT+AOvd5JcuxdulYEJoJxCmT8saxJNVW8KLNMH1xnGGBzgKBtMyt5RaiOkaZuw/hqls
 IrcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bfe4QYAii/msXqogDnhvJDFD5ejC6/JC1TdZ0YZAnVI=;
 b=qXnFNdW3ekkf3Xdh5pFvhgIH5DyaDQ76LZ+M7jy+v98FuqrQXdk/ImZm8Mo5s3YbVa
 ph3MYmr1tRR650BVTQhnjGzqU6p9o2Hm3kFYOazuqpN0ik1/6/iHFw1GBBhU263Yqane
 KQ6H/Rl8/lbx0+5hTJ7u3sQLY0oPmYQIvRcR/7oHEIRi/xUq5nhVzPCpaiYNSDB+77u+
 2uRAPc8Fz0R8cjFOhbf1hvFm//7BFFDn7rEcBnajZ2ywmAp5DtYUDqXOXOqQFmTdVtNF
 CIFqQtxuoSXEQQpQaulezH1K+mo+O5URuANsxc26X7/3D8i1wEu07ZNr9mVPxhuB/rgf
 rkaA==
X-Gm-Message-State: ACrzQf26csaOC9R6zKX1O3Ow6CJlXwGiO3JZVClZB2Ep8gm6Y0hcTG3C
 n5BdDEmaTdUonW4njJxNoWrdcQ==
X-Google-Smtp-Source: AMsMyM7CV19Vj9XYnilruJJvftU1TZeOxpARoRc6S+ODrtdXMN3RA8hrkRGI8BdB7SK5VPuSclcvsg==
X-Received: by 2002:a05:622a:1ba2:b0:39c:ed3c:6310 with SMTP id
 bp34-20020a05622a1ba200b0039ced3c6310mr28888623qtb.516.1667571655926; 
 Fri, 04 Nov 2022 07:20:55 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 ey21-20020a05622a4c1500b003988b3d5280sm2518844qtb.70.2022.11.04.07.20.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 07:20:55 -0700 (PDT)
Message-ID: <aa1c6223-e56c-b0b3-ed74-25cdeee36fb7@linaro.org>
Date: Fri, 4 Nov 2022 10:20:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sm8450-hdk: Enable HDMI Display
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104131358.1025987-6-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/11/2022 09:13, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the HDMI display nodes and link it to DSI. Also enable missing dispcc
> nodes
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for your patch. There is something to discuss/improve.

> +&dispcc {
> +	status = "okay";
> +};
> +
>  &dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l6b_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +

Drop blank line.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

