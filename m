Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD874D0B8
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 10:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE72D10E23E;
	Mon, 10 Jul 2023 08:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FD910E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 08:58:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b700e85950so61624921fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688979519; x=1691571519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u1UIiLg+gT8qOjGtWi3Tbab4/yTpTJvmt9y9TmQ5/zA=;
 b=EQKuXWGbXfD9YroxK3ye/LIBLgh8YRx5MkDCKqZXONhJuzG8BXXQYniZadZGY4K5ho
 RDEeah0l91/2rkYjwDeRRXf3dy/9k90efi0Tq86lx/V83eJ1bqeuDWx1EVkGoqwlcyrn
 N8frMSSbQdl5q9wfS2nyJSaYEt7W1GcFj+5mR2qSa+qhTGvmn/f/l+Db9e6N3hcisjaq
 dx75ofebgpR9tpbI1BPpGBwdsnVqzA+SIQebZG4ho7lFOW69eMGpKtjnWhVQ7ntPOdHF
 9RWm0S7zYjWTpU76mU4kILQchki9fH4qSpGGyhPho+qEX1V2FW7QJaeUjgwI7i4egQ7Q
 7leg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688979519; x=1691571519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u1UIiLg+gT8qOjGtWi3Tbab4/yTpTJvmt9y9TmQ5/zA=;
 b=dYuWQT6Ns1hnAK7ypGAZO4ptLDOBpAsc7kgmuiaplGRsXURVx5jcLGnYyXYWpKuND7
 fFACr5xRsOWhSfKB3PaW7JDOlv5LE+ZnIySC71vl+mfkTcslSu/BRIszycJQ4BVMt9Z1
 zIivMVmb4zQVZQWy1DS1EA6d/NJYeFy8rVgj6vZW3QjQwhq7bCMNNp3v90deYNlHBnce
 lClLpgCcWyj07FzDW/sOeZNnKTqWwYYyUxs5LuimqhN5DskIbdIWIWv5QApnpRHK4pSF
 YCneSSAJ85QyvP+/h1sjAP76DFKrXMQcitL7dNE14qbR1r6gL4ayq3MHL7OTr0nLQRg5
 C9eQ==
X-Gm-Message-State: ABy/qLYCWcvywiK2hsyusI6a3jmjL2iDFrnMdSlN35vV8H6asopt7PW7
 j01oOJ98oJqyYHF44ecWZcTRAQ==
X-Google-Smtp-Source: APBJJlERlzwAqBH/Uv5aSLjcEewODCu8JlenZIe3+3H6pzXx2WIrny8mnU1JjbuxVqM8sFJI3AhPwQ==
X-Received: by 2002:a2e:9497:0:b0:2b6:decf:5cbd with SMTP id
 c23-20020a2e9497000000b002b6decf5cbdmr8633024ljh.36.1688979519283; 
 Mon, 10 Jul 2023 01:58:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 ay26-20020a170906d29a00b009887f4e0291sm5800767ejb.27.2023.07.10.01.58.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jul 2023 01:58:38 -0700 (PDT)
Message-ID: <db81d100-1ed6-19a1-14f6-8cacf71bb1bd@linaro.org>
Date: Mon, 10 Jul 2023 10:58:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/5] dt-bindings: display: msm: dp-controller: document
 SM8250 compatible
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-2-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230709041926.4052245-2-dmitry.baryshkov@linaro.org>
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/07/2023 06:19, Dmitry Baryshkov wrote:
> It looks like DP controlled on SM8250 is the same as DP controller on
> SM8350. Use the SM8350 compatible as fallback for SM8250.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

