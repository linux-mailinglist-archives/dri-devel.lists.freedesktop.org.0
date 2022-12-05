Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D78643527
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 21:01:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA4810E296;
	Mon,  5 Dec 2022 20:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6364210E296;
 Mon,  5 Dec 2022 20:01:33 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-1322d768ba7so14768431fac.5; 
 Mon, 05 Dec 2022 12:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSX39vKmXuqwX+fTD+qMgj/4K2o3+oTbZp823bxtf0I=;
 b=rIsb4BU3tG8zqQheY7lS7nZTYJU5BTt4yFSkaA1wSQtgpWE6+7JknCeYe2tJDyFps9
 o/Y2uMqjgB/yr7dvNgRDLHid0xyaUO+qxE3gsC8Fkx7ei917htF5QEJ2vPJmLbaTqWXJ
 xpDh3uooF6/6DiusUa//vbNHBqpaPomQNx9CcXnYD/KVJAox0r+8BGRGUfY/NGqcKkjj
 vW9AJcwW6OFynoen23VsU9DxvulHkCE9fy+XF4nmQ+eyD3ao470PBZ+vr/T2NmDpaOxF
 CqT8hpOW6HzgGvSBpHiol/Po9C/sEQUPMUKpCdfbnHYqb62fSqi4zXe+gApt492DaqwH
 trdQ==
X-Gm-Message-State: ANoB5pmqUDq0rrucKh3z48HCFPQPx7Gy3G3/uiuuB1nKAaZ7sZXJbVtL
 zeSFaA90YU4QHXhnn+SEWA==
X-Google-Smtp-Source: AA0mqf7OXOdswdIEFK3K6AKcJB+N4aK+DS5mjsDXBKv0xWYZIXbOXudLCFmGfWCu+kJS6Fhgrbq4HQ==
X-Received: by 2002:a05:6870:6c02:b0:143:80af:e36a with SMTP id
 na2-20020a0568706c0200b0014380afe36amr25413419oab.254.1670270492592; 
 Mon, 05 Dec 2022 12:01:32 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y30-20020a9d22a1000000b0066ea9650da8sm3508174ota.20.2022.12.05.12.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 12:01:32 -0800 (PST)
Received: (nullmailer pid 2498426 invoked by uid 1000);
 Mon, 05 Dec 2022 20:01:31 -0000
Date: Mon, 5 Dec 2022 14:01:31 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v4 08/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Message-ID: <167027049028.2498344.6160191617059564658.robh@kernel.org>
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-9-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221125123638.823261-9-bryan.odonoghue@linaro.org>
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, robh+dt@kernel.org, swboyd@chromium.org,
 agross@kernel.org, david@ixit.cz, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 25 Nov 2022 12:36:28 +0000, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. In the .txt description we marked these regulators as required,
> however, that requirement appears to have been in error.
> 
> Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
> come from GPIO controlled external regulators, not the SoC and in this case
> there's no need for vddio to power an I/O bus. Similarly the regulators for
> the LCD are controlled by the panel driver not by the dsi-ctrl driver.
> 
> It would be possible to connect a different type of panel to the DSI bus
> here in which case we may or may not want to make use of vdd, vdda or
> vddio.
> 
> This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
> regulators in the dsi-ctrl block are helpers not dependencies.
> 
> Add the description of vdd, vdda and vddio back in for the existing
> upstream dts where vdd, vdda or vddio are already declared but, don't
> declare those regulators required - they are not SoC requirements.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
