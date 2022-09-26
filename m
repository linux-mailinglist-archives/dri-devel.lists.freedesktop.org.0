Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A23D5EB55F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 01:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E3A610E81D;
	Mon, 26 Sep 2022 23:18:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013810E81D;
 Mon, 26 Sep 2022 23:18:14 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id n124so10097421oih.7;
 Mon, 26 Sep 2022 16:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=/VPqA+Ek8QtP5pfgu0YyQnv/XSoVrA0G4H3niIHpRLw=;
 b=HzR5nk32IjxnJgJ3dFp5jGYLykqpCADlgoGjZdK53D5g4ywzlOmlfacqFrrWMzm0fY
 ZQ9/unXqZ5NDWWw2qUrLcj+6lHEJkYDcS0//fMButHf83+QhXMDWIZ8rDcINp4zUiDYI
 7C+OP5m8fLdaamqgIrOcIw76oE9egyJSwk0PCqWd05HnPOsy1uODda70BX2hlDCChk1T
 25U5nTJ3ItV2XIX4lWJik4L+KtMmNVvh0yifLkfJBymXyCgHDya0VJw5o42k0BS/+Wq9
 UbonPsvCjdJPEoTgG2jaofml5PQ+9/l/Hkz4c/deRGBVOFql5V2HqZN0z+UOErStXq4B
 pdag==
X-Gm-Message-State: ACrzQf14usrpXf0qixAJckkwBU0S/8tOPTK2+AmPXzQv/pg+Wg0bfVMA
 PNQWSJN61qaWzD7p5iVBpA==
X-Google-Smtp-Source: AMsMyM7gXM9sEcSlW/jlbRbRX1jbCgTiZp1J8NlO3IV8x9BQR2Y84Aa7gOjkqLc+YV+CpPU5wjUD2g==
X-Received: by 2002:a05:6808:118e:b0:345:9c3e:121d with SMTP id
 j14-20020a056808118e00b003459c3e121dmr541410oil.211.1664234293408; 
 Mon, 26 Sep 2022 16:18:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 7-20020a9d0c07000000b00655c6b2655esm8247356otr.68.2022.09.26.16.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 16:18:13 -0700 (PDT)
Received: (nullmailer pid 3156327 invoked by uid 1000);
 Mon, 26 Sep 2022 23:18:12 -0000
Date: Mon, 26 Sep 2022 18:18:12 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display/msm: Add QCM2290 DSI phy
Message-ID: <20220926231812.GA3156261-robh@kernel.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924121900.222711-2-dmitry.baryshkov@linaro.org>
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
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:18:59 +0300, Dmitry Baryshkov wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> QCM2290 platform uses the 14nm DSI PHY driver.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
