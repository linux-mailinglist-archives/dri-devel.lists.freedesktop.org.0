Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E7C4E64E8
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 15:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD10210E8CB;
	Thu, 24 Mar 2022 14:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E5410E8C9;
 Thu, 24 Mar 2022 14:17:47 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id dr20so9455915ejc.6;
 Thu, 24 Mar 2022 07:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uAr2LmhOnG9njQ3xLzX6xb3TsAHcFF9ng+jWbhHfouU=;
 b=Rx7bw6F2aTfUuibc2EHQdy16IUd4XsjJ7bVb1tF5hl56Wgr7GVmNpCSTse60Yzzqot
 4wDNA6sbJt+IgMxd/qmKSdYuIiIAis+m+bmW47Y6XUA+O4LQ1z8UesqWiH1TrUWyPaVi
 zVyI/hIi5POsco4lzBZuQVo7x8iOa21K+WaTWrUd14msxVx01pbtqS6WhU2tGXMI6vhV
 dTRkEboqHaE91lTNgayiuKG428PJKxUlgCgOxektDCrwLexma5xiwif4JqJ+0xVn7tDn
 /Xm/6gsAG1J78OgDxSE0a6tQJ8OQyKWD6jd0F5n9+GON2BEIS0/FzYp/eVFbZ1STnDxk
 2FHQ==
X-Gm-Message-State: AOAM533V0gP1Jk8HqhIa1YSyoeWmiRbUarpFtge0/sGVVerqg2aysHgj
 mkUIyW79Ywp+PbsaEheEADTKQCnZaJMZ7g==
X-Google-Smtp-Source: ABdhPJxxIzTIDlCaGLEv2LtBqkMu53tRhx3kR6Bbq/H21Vu7dtcvHnJzVijXpA0abZ88DVONT+kmTQ==
X-Received: by 2002:a17:907:6d2a:b0:6df:e513:5410 with SMTP id
 sa42-20020a1709076d2a00b006dfe5135410mr5920079ejc.544.1648131465364; 
 Thu, 24 Mar 2022 07:17:45 -0700 (PDT)
Received: from [192.168.0.157] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 ks20-20020a170906f85400b006e091a0cf8bsm254970ejb.16.2022.03.24.07.17.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 07:17:44 -0700 (PDT)
Message-ID: <6616ccbe-2836-25f6-97e9-c4b25a0bab62@kernel.org>
Date: Thu, 24 Mar 2022 15:17:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] dt-bindings: display/msm: another fix for the dpu-qcm2290
 example
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>
References: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/03/2022 12:55, Dmitry Baryshkov wrote:
> Make dpu-qcm2290 example really follow the defined schema:
> - Drop qcom,mdss compatible. It's only used for MDP5 devices.
> - Change display controller name to display-controller as specified in
>   the yaml
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index d31483a78eab..6fb7e321f011 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -160,7 +160,7 @@ examples:
>      mdss: mdss@5e00000 {
>          #address-cells = <1>;
>          #size-cells = <1>;
> -        compatible = "qcom,qcm2290-mdss", "qcom,mdss";
> +        compatible = "qcom,qcm2290-mdss";

That's quite unfortunate choice of compatibles. I would assume qcom,mdss
is a generic fallback compatible but it is used in different way - as a
specific compatible for MDP v5. The bindings here are for a newer
device, right?

It's already in the bindings, so not much could be fixed now...

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>


Best regards,
Krzysztof
