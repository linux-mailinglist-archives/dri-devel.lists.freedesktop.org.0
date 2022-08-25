Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 022375A0F96
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 13:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6A11135F8;
	Thu, 25 Aug 2022 11:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDE41135F8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 11:51:04 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id l8so10356857lfc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 04:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=QslpZXG7w6+Zu0cuJpcihO4wL0ZcP7qpvE0bMlNnn88=;
 b=LimlF0C4WC4ny6FZr0Orj0k40ks11cTYtD5QO6JSOvOvUpPD6Tv8nuYA9QS41unyqI
 0XMpNFV+o0pFIMKNO2PvGCJVjErilKa8Ag04mNQX1YsdE75zQRkjq+c3e31bJUP6G7Qc
 pTsppBNUcnEnI4wqGFgVUDLx4ztOU3d/reKjqYDsWcQbNGjud8Wws64NEP2d2gkwR6IS
 qnzTm/627wp16BwyEkoJPPAe42iKhoVzlzs6orQzwu+l20/0VUmk4XRM/TJ5DvuUPfxe
 R/5bxx4a6QFN3EVbi3xGMdLw4HOo3hENHyQeuPrt+93o/IzoCqTYhXMtadmC0lT4V3rt
 /EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=QslpZXG7w6+Zu0cuJpcihO4wL0ZcP7qpvE0bMlNnn88=;
 b=OGylD1wtAr2A9gWxKJ5Rjp/UuveVWrHpBg6OX6SPNAWB9OJEfYmjFL/5IYN+1kgSE6
 5fLHM31leFmeJwUz9j5UEiQYTxaisacmwg5cmP5F/4yXSGPieJwoNoV/mAWFUMr7c85w
 88sUEcQGXQODguQxTnoCIEXYcHy4JFgKp1kaQIg2RzURiHKuhMw+vuADkjFkwfax0Odl
 F1KfxNtqAzRYCXpIkXxmLtnpc9MIm/4VNJtKMdNkMVJDCF1eUDwRbWYUBrSNzubOKKxq
 Xh3NAX6NkbGa0bRMKvX1wh6UsbbMthxo7cIHOQwi0EILCcx4yb8s3I2OE8o/K8oRq12+
 PMug==
X-Gm-Message-State: ACgBeo0FRpednfMzPwgjQeRARwAH+6Ft0XWjLp3gQVe6N99TLpdH3AVG
 8SX8UGSa7rFi6TrToW3e5ts2GA==
X-Google-Smtp-Source: AA6agR7b6cEUO9K0Iijpg8ftzYlO5oAvjsgLr4FBxw+igjm+vGxsRNZiXOqbvoyl252nS7ROZq43VQ==
X-Received: by 2002:a19:e04a:0:b0:492:f96f:85b7 with SMTP id
 g10-20020a19e04a000000b00492f96f85b7mr980042lfj.141.1661428262801; 
 Thu, 25 Aug 2022 04:51:02 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a056512314400b0048fdb3efa20sm455083lfi.185.2022.08.25.04.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 04:51:01 -0700 (PDT)
Message-ID: <0048ccbe-e8dc-2ce8-a8a7-68a5ad4194ac@linaro.org>
Date: Thu, 25 Aug 2022 14:51:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 01/10] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220825095103.624891-1-dmitry.baryshkov@linaro.org>
 <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825095103.624891-2-dmitry.baryshkov@linaro.org>
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

On 25/08/2022 12:50, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
