Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC980631548
	for <lists+dri-devel@lfdr.de>; Sun, 20 Nov 2022 17:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4D1E10E13D;
	Sun, 20 Nov 2022 16:53:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ACC110E138;
 Sun, 20 Nov 2022 16:53:22 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 p8-20020a056830130800b0066bb73cf3bcso6058611otq.11; 
 Sun, 20 Nov 2022 08:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aoQ4zuyTd7evirB3DHF86QcOknBwVYfLo01LRkadhOQ=;
 b=7IjHyOC4Hzez0FoRbWkjInHemNkvbDyM7THavScRwMy/SCA1PBzemRvp+d9W4pMImQ
 KRBqFjIfqXL+8hgwKcfTdj4NDbwlzQUCMo35+hJ59NjgGamWVmz9vApDfovOHPXGuUDT
 2dL4Apj5ipTX4pvMY6SvvM1uOAiVt0ehT4emOrI5sPol29QgptV4Ccvjjo/k+PXsUGLP
 CkT5NTm/qr18OssGqk+CSvDrDRArgixUmXz+zSxd2S6xhW3PCX4/rSv7Iq6/27RukXbk
 lBivroOtmSJpPy5efaTjduL6K1hgWVYQteVAHLVusTO1kKIrCG8vAbdUnIxuDcuqiu++
 Fz+w==
X-Gm-Message-State: ANoB5plnMZhjoN75ltjODyV6FRvoYrsk+LljZGh/sQ8bFBUF3zMonGa2
 uQ8MaqSkL5ANkHYl3czgXQ==
X-Google-Smtp-Source: AA0mqf7VoumVeOat8gcKUatjmfqniX6zO3MOiPw3zmmtuxnZ2rqYap6OXiFNILEtWXSN+2z5E8jX9A==
X-Received: by 2002:a9d:7e9a:0:b0:66c:6096:1878 with SMTP id
 m26-20020a9d7e9a000000b0066c60961878mr634215otp.203.1668963201355; 
 Sun, 20 Nov 2022 08:53:21 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:5cb3:df5a:23c3:86fb:15a6])
 by smtp.gmail.com with ESMTPSA id
 k5-20020a056870d0c500b0014185b2b3d5sm2833328oaa.18.2022.11.20.08.53.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 08:53:20 -0800 (PST)
Received: (nullmailer pid 3191260 invoked by uid 1000);
 Sun, 20 Nov 2022 16:53:22 -0000
Date: Sun, 20 Nov 2022 10:53:22 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH] dt-bindings: msm/dsi: Don't require vdds-supply on 10nm
 PHY
Message-ID: <166896320103.3191204.6491707287483372164.robh@kernel.org>
References: <20221116163218.42449-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116163218.42449-1-konrad.dybcio@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, patches@linaro.org,
 andersson@kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, agross@kernel.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 16 Nov 2022 17:32:18 +0100, Konrad Dybcio wrote:
> On some SoCs (hello SM6350) vdds-supply is not wired to any smd-rpm
> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
> which is voted for in the DSI ctrl node.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
