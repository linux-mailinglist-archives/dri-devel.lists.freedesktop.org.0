Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D050643522
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 21:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621DC10E28F;
	Mon,  5 Dec 2022 20:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8B210E29B;
 Mon,  5 Dec 2022 20:00:13 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-144bd860fdbso1611490fac.0; 
 Mon, 05 Dec 2022 12:00:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q3fVj6v3LruTTu+ByPEHUKRATHKnRWFUX12drFvN6zk=;
 b=HZYF9ndTQZWxGS67sYxiCAdOFjG5guxHSEUFFK/WXgwclC1T/67Un9jayWUBQ4jLkM
 NxSnAnCVUO27fa8ts4chyBKZiCtMAvwu6DnmF/A1Uc+REuWPdhnU9FC9FoaEuoa4YfA8
 up8TJPPCfbtT4X4Dk10vtkULG8E3ojmisVeLBEJ4gCYdW2BUAUMMiZ/ovCiZ4IZjLfzc
 JEkQD91+tL4ijgNsygqp+mSNAfbwOshBpXFbbsZJZ18vD7kUCaT8L2RIZ1BIVIpccWwg
 v0bUxqJYFhztwywk50G2JrZX70UOjhfQoQ6wXHvlYEg9IN3hOXBV8mtkqSuOSGxTzKht
 huRA==
X-Gm-Message-State: ANoB5pk7JlVvnI4twjrRZQDkx6EYJA4bGwmJ8Sn2vaKuQEuMK8Ru8Z3m
 Neq79gwwAx9RfBUn8CdlAg==
X-Google-Smtp-Source: AA0mqf5Kq7aCH/7UElbfkgcbQsvNIhjJjr62XqJdJEwBt5NiKuud40G6Vkoqh+eVupl5JyLyWf+atw==
X-Received: by 2002:a05:6870:807:b0:144:4e1a:80c2 with SMTP id
 fw7-20020a056870080700b001444e1a80c2mr7133704oab.138.1670270412333; 
 Mon, 05 Dec 2022 12:00:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z20-20020a4a9c94000000b004a3527e8279sm521141ooj.0.2022.12.05.12.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 12:00:12 -0800 (PST)
Received: (nullmailer pid 2496556 invoked by uid 1000);
 Mon, 05 Dec 2022 20:00:11 -0000
Date: Mon, 5 Dec 2022 14:00:11 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 07/18] dt-bindings: msm: dsi-controller-main: Fix
 clock declarations
Message-ID: <167027041070.2496499.14501080606552606185.robh@kernel.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-8-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125123638.823261-8-bryan.odonoghue@linaro.org>
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
Cc: sean@poorly.run, freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, agross@kernel.org, david@ixit.cz,
 krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 25 Nov 2022 12:36:27 +0000, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml dt-binding descriptions we appear to
> have missed some of the previous detail on the number and names of
> permissible clocks.
> 
> Fix this by listing the clock descriptions against the clock names at a
> high level.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml      | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
