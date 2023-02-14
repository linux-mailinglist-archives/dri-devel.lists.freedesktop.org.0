Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64AF697233
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 00:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B9A710E9DC;
	Tue, 14 Feb 2023 23:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B44D10E9BA;
 Tue, 14 Feb 2023 23:57:45 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id u8so6940357ilq.13;
 Tue, 14 Feb 2023 15:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pAHW4DhwJZbxilzfQorihYAlFt55J9Boo02H+OZ0j7Y=;
 b=v/xCihmVxy7yfi8tR/xZJ774Ibx99y+plQK6ZKJKF8Bv6qxdldANVRlRLqe0kE7K1q
 /chXw18vJAmkyRNaRxJzegBXQbBciGJr8NjWpkBlU2QM1p8L+RUVrzQIzEkeumaxQVfM
 lsDtd49GLKZhPq5Zx3PUll/Lf0q68kRvoBOF9J10a5xObL5Lj1dN6koxgcgMdEaZ7ROV
 OV90SnpjJHsicJ6G+3FinZE2Nyl5Oxs/SBwneCraV3xu0sR55d50aqeeGOGRFohlq2OP
 /pos4VWeT9clF785Z1Wjs62CtPrVed9fCec5XSvBjxQEvyKsnRi6dDuv+QrLV78hGQQA
 1q3A==
X-Gm-Message-State: AO0yUKWRRremxFmdqa0KTbuyReYhwVHdyFYW3JaTx3S29rZ9SUsPIAsI
 /TaRdmy6JiWAsrOT6WfZ/g==
X-Google-Smtp-Source: AK7set9wRNYosZORMASHpBqoeU49VUZ207K6fd05rz3fHMC+SorGlXnL8WC8q7ld5bzE/fEXJKnsEw==
X-Received: by 2002:a05:6e02:1807:b0:315:6e7f:f413 with SMTP id
 a7-20020a056e02180700b003156e7ff413mr248218ilv.4.1676419064254; 
 Tue, 14 Feb 2023 15:57:44 -0800 (PST)
Received: from robh_at_kernel.org ([65.158.198.5])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a056e021b8a00b00313be472e06sm5168520ili.67.2023.02.14.15.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 15:57:43 -0800 (PST)
Received: (nullmailer pid 56398 invoked by uid 1000);
 Tue, 14 Feb 2023 23:57:42 -0000
Date: Tue, 14 Feb 2023 17:57:42 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 01/10] dt-bindings: display/msm: dsi-controller-main: Add
 SM6350
Message-ID: <167641906184.56344.10104072482060372297.robh@kernel.org>
References: <20230211122656.1479141-1-konrad.dybcio@linaro.org>
 <20230211122656.1479141-2-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230211122656.1479141-2-konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 11 Feb 2023 13:26:47 +0100, Konrad Dybcio wrote:
> Add the DSI host found on SM6350.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

