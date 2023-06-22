Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9729A73950B
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 04:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24CE10E377;
	Thu, 22 Jun 2023 02:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD5310E366;
 Thu, 22 Jun 2023 02:00:46 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id
 ca18e2360f4ac-77ac14ff51bso269481339f.3; 
 Wed, 21 Jun 2023 19:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687399246; x=1689991246;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QPfkOWL+5FHVazix2bTeczr6wVtV3YUUaWTawgk744k=;
 b=G8xjJeAS3o0rC6I6mTtfHmeAm9Frj8LQtjBOjN6hWwF5AM8vxBorGYXFBSL0xiITPk
 5BpcUoCABnVGUngoWVOrrOp7T4mipGEUtLRBaxdQjxFr3wBOVo1SJk0qGEGYIbgsdsJg
 Ki3xM44loNClDIYfiBGOdXhS1E0J/mQx1Ow99f7864ofkF36ZcaPS0YVSQvVHYPNVTg6
 ShMroCKfqCh963EYhewlGWw/iPpKFqK0ApkS9GDfF/M63BQJOpv9dFPwQ48owkD2mC37
 NlxHgHwTc0UoM+7W2EX5+1IQs8UOJPCm33J7KQxBeeIopjLv19dS42MNmkerzfjT1Z61
 IHNQ==
X-Gm-Message-State: AC+VfDy0WtAn+oQKZh9cAazPffZXyeCW4keI9KXrmrRbtb96f3v5XItr
 dQ6V9mHSpC9Zb9knMLYp2w==
X-Google-Smtp-Source: ACHHUZ6SEbMTFHsbfIGdCv9COJO/+cOsDwJBi0mYIbdT7YAq1hrmmPL4I//mLfm4Si/c96SBEJVgWw==
X-Received: by 2002:a92:c108:0:b0:331:1c97:f679 with SMTP id
 p8-20020a92c108000000b003311c97f679mr13310177ile.10.1687399245834; 
 Wed, 21 Jun 2023 19:00:45 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a92290e000000b003427601b77esm1685209ilg.21.2023.06.21.19.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 19:00:45 -0700 (PDT)
Received: (nullmailer pid 54879 invoked by uid 1000);
 Thu, 22 Jun 2023 02:00:39 -0000
Date: Wed, 21 Jun 2023 20:00:39 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: msm: sm8450-mdss: document
 displayport controller subnode
Message-ID: <168739923947.54817.13314418974279219591.robh@kernel.org>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-2-8bf386b373eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-2-8bf386b373eb@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 21 Jun 2023 11:26:26 +0200, Neil Armstrong wrote:
> Document the optional document displayport controller subnode
> of the SM8450 MDSS.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml         | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

