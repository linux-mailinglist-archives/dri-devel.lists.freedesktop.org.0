Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2675EFE43
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196B110EC85;
	Thu, 29 Sep 2022 20:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA21F10EC85;
 Thu, 29 Sep 2022 20:02:38 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id m81so2728735oia.1;
 Thu, 29 Sep 2022 13:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=FcSArAoOE9YNFJxfhSZSoEdEXfFa5H2DTIvc0TVFs54=;
 b=I5y4iTF5ru14/mRHvAkv21FoEsohsRPTQ1vUFFdN2oi10Bee6r2QKPWFB7QRy8ZFXC
 +iV43fOtpUBoYm7Re1ihFgoWoxitIC4aHn+L7mfqmMQHmsskc54qHmzfw/zsYbDuFR6I
 W5nQhC593myzSaQn3UKsjrZuI0F07PsmcG+k9pp507bTbKm9RKYcPh6KzJvQb65qgcZP
 wOlmonrmwSOtt7hcWDa3RJSzLhVzogtbuDa1sz5QHqwKpl4U25/bj568B5HignuO8nHA
 dfGSG0xa6b2F9k50nH+BI73fugnRPJHU0G1zG2r4GGNlWZVWAglIoBkDRxry2FpinYvI
 evLw==
X-Gm-Message-State: ACrzQf1WwE03MVHmSlOK5oMeSZ+DTdKMH9hgQBhIF13vBVUgx+VKu5Lh
 L9yNoROMGxvdW10IKsVJ+w==
X-Google-Smtp-Source: AMsMyM4kf4KcfgLkzzZeT7aj3So10PyIDWgeVap50vF/VlsPJjb12Ryzh19twyN3Q4aCUZ8jKsqHQA==
X-Received: by 2002:a05:6808:2094:b0:350:53c6:c7e0 with SMTP id
 s20-20020a056808209400b0035053c6c7e0mr2487507oiw.67.1664481757853; 
 Thu, 29 Sep 2022 13:02:37 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b4-20020a056830104400b0065126423321sm130756otp.76.2022.09.29.13.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:02:37 -0700 (PDT)
Received: (nullmailer pid 2647540 invoked by uid 1000);
 Thu, 29 Sep 2022 20:02:36 -0000
Date: Thu, 29 Sep 2022 15:02:36 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 05/12] dt-bindings: display/msm: move common MDSS
 properties to mdss-common.yaml
Message-ID: <166448175558.2647480.8054908621388589521.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-6-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:04 +0300, Dmitry Baryshkov wrote:
> Move properties common to all MDSS DT nodes to the mdss-common.yaml.
> 
> This extends qcom,msm8998-mdss schema to allow interconnect nodes, which
> will be added later, once msm8998 gains interconnect support.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-msm8998.yaml     | 41 +--------
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 51 ++----------
>  .../bindings/display/msm/dpu-sc7180.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sc7280.yaml      | 50 ++---------
>  .../bindings/display/msm/dpu-sdm845.yaml      | 54 ++----------
>  .../bindings/display/msm/mdss-common.yaml     | 83 +++++++++++++++++++
>  6 files changed, 111 insertions(+), 218 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
