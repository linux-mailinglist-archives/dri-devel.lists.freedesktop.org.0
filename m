Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33072739509
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 04:00:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CCC10E145;
	Thu, 22 Jun 2023 02:00:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0623710E145;
 Thu, 22 Jun 2023 02:00:32 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id
 ca18e2360f4ac-77e2c42de06so231722839f.1; 
 Wed, 21 Jun 2023 19:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399231; x=1689991231;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d1hTON9k3kUIOBB37/7PUxl0PK0fb2GZFYePKsdMJFo=;
 b=gi0JxuAYzYnoqkzTLco03Kce9EgLKDm/SZtSusspeSIBu+OMzRUbfnVfJa+vQZQN8P
 PX4N9anuCRakYwkGQXLtYFHi3G3hpAQ2vyIbg+RqHY0FsNo4GDDCHh6yTKe8i0Av+W7j
 pLBc5JiFD4XdFWx14CE53j6rCgVADvjQmV8artqnHEF1Tj0vkRV8Ol8JxQG7R9ikvbzm
 B6AXPWaHV3oP/9InC9DSCCnp2KJhWQnSdBK3HqdR9F6B3JQw5HCHXWuxJnYO8VEwsWLA
 r+9lPtTL5pk25lp5MQtPEf/Z9g1EFb0fBmWlB05hl7B8eDCMErrdAKrhif6xGfJw8Tf8
 qtQQ==
X-Gm-Message-State: AC+VfDzKVgsWJ6wv4YrRvNyIwS0kazUmJyNOt0EETq/knrIQteQt3dgT
 A+XsTcsvyx5nbd8kbN5+Xg==
X-Google-Smtp-Source: ACHHUZ7PHAaESnvWc25GWM80Ls0vDP095cd+Mfu5NOZJhBwUtBO+yfU/nx4s4ZFJNpLM37IU/+AHew==
X-Received: by 2002:a05:6e02:102:b0:341:d9e7:9d88 with SMTP id
 t2-20020a056e02010200b00341d9e79d88mr16172126ilm.11.1687399231490; 
 Wed, 21 Jun 2023 19:00:31 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a02c818000000b0042672a015f0sm1733554jao.25.2023.06.21.19.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 19:00:30 -0700 (PDT)
Received: (nullmailer pid 54477 invoked by uid 1000);
 Thu, 22 Jun 2023 02:00:28 -0000
Date: Wed, 21 Jun 2023 20:00:28 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: sm8350-mdss: document
 displayport controller subnode
Message-ID: <168739922812.54419.5619568858048769577.robh@kernel.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
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
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 21 Jun 2023 11:26:25 +0200, Neil Armstrong wrote:
> Document the optional document displayport controller subnode
> of the SM8350 MDSS.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

