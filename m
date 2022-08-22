Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3759C829
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 21:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43ACCA0403;
	Mon, 22 Aug 2022 19:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DBFA03F2;
 Mon, 22 Aug 2022 19:10:59 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-11d2dcc31dbso5925985fac.7; 
 Mon, 22 Aug 2022 12:10:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=RyQ2R2dv/3M8lzsIjXV0R+NCfbe4VzghtrRY+W8bSpw=;
 b=Ddj3CDlAJ4/LyfJRrb+vnVXkV2nmNUsgzmHfIN82t3qbuCY/NSeMbj4YJWxgjeBYIn
 d5fFOXCA7lBWd8/1VzXn9I6YyNMJV17SOXtJBgeU5u2SXNE7aMTWdBZJG38emUsf5seG
 gn6ws00JA8oK1mWRkc9HZ04/hQppGSp6XfdhnZg3IwjcJ16x/yqtaiDnY8WqaP3jR52M
 PE2Hs4/XUrIp4qPocUTPaEbKFGA9IF8pLBUTVMYVTnZELNtEqNjHqWJfAZj+3OE18Pig
 sTFAy/OKEw53aNn7PhGdrurToaXdz2sgFSfbgq8Ekx3B0WPtqIT5H09ubEzkJXbJDFbT
 oByg==
X-Gm-Message-State: ACgBeo0CvT0O5czMNUCoxnomJ5Iiy20cPDXmgF/dOrA4R7dUG9bzdvdX
 gTTo7UGd1cL5T85jeRQ/Tw==
X-Google-Smtp-Source: AA6agR5bA4WycmNTvTD2/U7R6fOagPZP//u9KeaYWrui4/55tDupOwumUUqlIU8jnWDyBbSuSIc46Q==
X-Received: by 2002:a05:6870:1715:b0:11d:80d4:9972 with SMTP id
 h21-20020a056870171500b0011d80d49972mr1394577oae.52.1661195458566; 
 Mon, 22 Aug 2022 12:10:58 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j23-20020a056808035700b003449ff2299esm2752348oie.4.2022.08.22.12.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 12:10:58 -0700 (PDT)
Received: (nullmailer pid 223613 invoked by uid 1000);
 Mon, 22 Aug 2022 19:10:57 -0000
Date: Mon, 22 Aug 2022 14:10:57 -0500
From: Rob Herring <robh@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: Re: [PATCH v4 5/6] dt-bindings: drm/msm/gpu: Add optional resets
Message-ID: <20220822191057.GA223526-robh@kernel.org>
References: <1660927246-11327-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220819221017.v4.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, krzysztof.kozlowski@linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 19 Aug 2022 22:10:44 +0530, Akhil P Oommen wrote:
> Add an optional reference to GPUCC reset which can be used to ensure cx
> gdsc collapse during gpu recovery.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
> Changes in v4:
> - New patch in v4
> 
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
