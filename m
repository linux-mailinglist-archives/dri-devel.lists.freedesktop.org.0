Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57612652684
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 19:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C43E10E103;
	Tue, 20 Dec 2022 18:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0A10E102;
 Tue, 20 Dec 2022 18:46:10 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-14449b7814bso16492943fac.3; 
 Tue, 20 Dec 2022 10:46:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BtGYA4nYrfpj33PGdbVkenftz/iHxuFbKXLM7Hq+aW4=;
 b=Zu9QRgjPcJq1rooUJzozGY5UHx03eNl9pUc4iyEQrvgab9gAzFgkx8y8Ye0EF5sf63
 J3kBiAONZstBhl14vMdcwo4F5Wz52pC4hQ8CBJFFqegzY0/gkYcvxeKSQEuird2lTh/H
 MHq69orh725woQloYDiV28UsvophVQVTNKjsvTZ73XX8KUH1sNU2E31SMGsAOdVF54/J
 5+4oI2OTWpcO++42N8dgKtrV3k+WOATRCghZWXsUldo7CUv9TeGmaFfoK7tdFe+CCRiy
 zuWtfMbNDwY8ak8DoRK1wbnISYzI/swZTem0CAxtulgLi4gkfk26Y8nalc4FJnF2MbMZ
 2foQ==
X-Gm-Message-State: ANoB5plSt7o7O4/aRByX89QRjb0MiyJxUC/1MMI73yxRNRet8Iv2/UIg
 3MJPrCrwUikfdfSa32iw3w==
X-Google-Smtp-Source: AA0mqf4O68SSZaVnZpk87bzzNvcns3v8OXsGoUJYBI+nOMXBUa8lR9WDvgexUnTy4bpkQsGY4tiZWg==
X-Received: by 2002:a05:6870:ec87:b0:144:6a45:bafb with SMTP id
 eo7-20020a056870ec8700b001446a45bafbmr25763414oab.42.1671561969241; 
 Tue, 20 Dec 2022 10:46:09 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eh5-20020a056870f58500b001446480a042sm6309134oab.58.2022.12.20.10.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 10:46:08 -0800 (PST)
Received: (nullmailer pid 893173 invoked by uid 1000);
 Tue, 20 Dec 2022 18:46:07 -0000
Date: Tue, 20 Dec 2022 12:46:07 -0600
From: Rob Herring <robh@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v15 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Message-ID: <167156196670.893113.12368377615757761659.robh@kernel.org>
References: <1671227102-21717-1-git-send-email-quic_khsieh@quicinc.com>
 <1671227102-21717-3-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1671227102-21717-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: devicetree@vger.kernel.org, quic_sbillaka@quicinc.com, vkoul@kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 konrad.dybcio@somainline.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 freedreno@lists.freedesktop.org, robh+dt@kernel.org, agross@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 16 Dec 2022 13:44:59 -0800, Kuogee Hsieh wrote:
> To increase the flexibility of supporting different DP main link configuration
> at different platform, add both data-lanes and link-frequencies property
> into endpoint so that different platform can specify its own main link
> combination of both data lanes and max supported link rate.
> 
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Changes in v10:
> -- add menu item to data-lanes and link-frequecnis
> 
> Changes in v11:
> -- add endpoint property at port@1
> 
> Changes in v12:
> -- use enum for item at data-lanes and link-frequencies
> 
> Changes in v13:
> -- revised changes at port@0
> -- use correct ref schemas for both port@0 and port@1
> -- mark both port@0 and port@1 are required
> -- add line between data-lanes and link-frequencies properties
> 
> Changes in v14:
> -- add "unevaluatedProperties: false: to endpoint at port@1
> -- remove unnecessary quote to $ref
> -- re store "$ref: /schemas/graph.yaml#/properties/port" to port@0
> 
> Changes in v15:
> -- re store desciption of port@0
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 25 +++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
