Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5EC6DFA2E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 17:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D294010E87A;
	Wed, 12 Apr 2023 15:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62D610E876;
 Wed, 12 Apr 2023 15:33:10 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 39-20020a9d04aa000000b006a1370e214aso3921421otm.11; 
 Wed, 12 Apr 2023 08:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681313589; x=1683905589;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EOjaCPYafQTgElcWLu+C+9q7oFGdFz1gmtpWgWQoSzo=;
 b=Kiad2VJQh4ioQXPve47/sIgz/xfKpzR7Dqot9sdga3n5d0RyKW0/ABIFN0K6grZBNJ
 jHqhsuIVgbYnjItU5xBKl5H9ar6MewqgrDHU3sr6hmZZvB1MvKV560BIwpmcrZ5ZMf+A
 claf1yiMparAfHppW0KyTrQTPiwYs/qgiIras0MGv75LYe/XIW3ILRFexS2ftgperfWn
 B1/8IN8EdtZw12vnLU2FZeV8HMlTxci/dc3BOu1EJIaKd5RMtDDNPtMcJJ3gjcmMUbId
 gR7lWtVHtudZFsl+cVkaZkFV8UQ/WHrPmhb3L60fiXK6DlrInPhYCZvqYQ3+/7NzytZL
 GedQ==
X-Gm-Message-State: AAQBX9eh25Yad2yEUz4ogLWrbZfu7DkyjRCCdG7oQbj2Uz8GQhgUihZm
 H8TDTkhmC+NvknxqyLYxfA==
X-Google-Smtp-Source: AKy350aJpoIwH0hm0Dtc/H4sRBjBI6NWqyeiXLeGnh9wj1Cv9m157DT65w5pOWUg7WSbSXvkfU/l4Q==
X-Received: by 2002:a05:6830:1e4d:b0:69f:65de:9914 with SMTP id
 e13-20020a0568301e4d00b0069f65de9914mr9393639otj.4.1681313589629; 
 Wed, 12 Apr 2023 08:33:09 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 f7-20020a9d6c07000000b006a205a8d5bdsm6668119otq.45.2023.04.12.08.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Apr 2023 08:33:09 -0700 (PDT)
Received: (nullmailer pid 2472906 invoked by uid 1000);
 Wed, 12 Apr 2023 15:33:08 -0000
Date: Wed, 12 Apr 2023 10:33:08 -0500
From: Rob Herring <robh@kernel.org>
To: Jianhua Lu <lujianhua000@gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: dsi-controller-main: Document
 qcom,master-dsi and qcom,sync-dual-dsi
Message-ID: <168131358792.2472835.6239404234836108897.robh@kernel.org>
References: <20230411143149.16742-1-lujianhua000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411143149.16742-1-lujianhua000@gmail.com>
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
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 11 Apr 2023 22:31:49 +0800, Jianhua Lu wrote:
> This fixes warning:
>   sm8250-xiaomi-elish-csot.dtb: dsi@ae94000: Unevaluated properties are not allowed ('qcom,master-dsi', 'qcom,sync-dual-dsi' were unexpected)
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

