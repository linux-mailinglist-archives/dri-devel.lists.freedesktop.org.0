Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2796723BA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:43:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2510E7A9;
	Wed, 18 Jan 2023 16:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7091810E7A9;
 Wed, 18 Jan 2023 16:43:23 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 d6-20020a056830138600b0068585c52f86so5348684otq.4; 
 Wed, 18 Jan 2023 08:43:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ExV51LRKxSAfszSznfMkdCY4p5XYR1eAwLcuflAXfzM=;
 b=6ei5Z/cWfqWwGYJ8ekPiSw/+ZCZ8y3MJsYoz11LZnRjqNm8PlNcLPOKsg+eMTulUdw
 SJmrn9/f5qVuRPQQ7pHFEVRSthCCM5e7SdQzzh2Q178Vec0XCEjRFut+snFGe4ii/nYp
 IeLvWR6fLnrgflmu3BfS3QHZLcKodhi98eQWKA5iOdOm/h07LevlL3cv5Ot78m1PHUFF
 XlMFae4r6h4fh+JOZtK2efD88uqLA8tOIBrF0I1ruWaGk03VRlBxLcp7G5solcXAhbOo
 n8fv8H9fG0B5dzWoNju3C23WA7iwy7hW/oZMaYhWYeuzYN3fMky7sDc3yoxFZJ5L9xWg
 WuKQ==
X-Gm-Message-State: AFqh2kqBDzzrxdwMTDw6GbRr+67owFEkAG444dB4y4KKT2j4hwhcHUM7
 CtLyk0BxjrBt1nE8dw7tgQ==
X-Google-Smtp-Source: AMrXdXtupd2qdij/8GDAp9D/q94uWH1RoHb3vxZY7KCP70YaeSd4XIvdEVydTbRXgGGGq+MIANQ4jg==
X-Received: by 2002:a05:6830:1086:b0:66e:40bd:436c with SMTP id
 y6-20020a056830108600b0066e40bd436cmr3937187oto.15.1674060202672; 
 Wed, 18 Jan 2023 08:43:22 -0800 (PST)
Received: from robh_at_kernel.org ([4.31.143.193])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a9d6948000000b00684152e9ff2sm2365769oto.0.2023.01.18.08.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 08:43:22 -0800 (PST)
Received: (nullmailer pid 140766 invoked by uid 1000);
 Wed, 18 Jan 2023 16:43:21 -0000
Date: Wed, 18 Jan 2023 10:43:21 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v7 03/11] dt-bindings: display/msm: add core clock to the
 mdss bindings
Message-ID: <167406020100.140733.1559118899199486603.robh@kernel.org>
References: <20230118041243.1720520-1-dmitry.baryshkov@linaro.org>
 <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118041243.1720520-4-dmitry.baryshkov@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 18 Jan 2023 06:12:35 +0200, Dmitry Baryshkov wrote:
> Add (optional) core clock to the mdss bindings to let the MDSS driver
> access hardware registers before MDP driver probes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/qcom,mdss.yaml       | 32 +++++++++++++------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
