Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110E55BA1B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13824113676;
	Mon, 27 Jun 2022 13:47:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6A0113676
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:47:31 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n1so13128666wrg.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 06:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=thKvXG+JY3HbxZ4gHoPQEiQ+g4hVQKN6LBHIr47r/6k=;
 b=jHNN/E/FNcXapK91iIDirAbb8f+wGuCbENy43xqwJNYCKodSw6sMQw5o3qBrwoBv5/
 EBbdUO7C5KuSgFCPffAH0hqEQALbGoEhGlayBiez57/4mxZptaX6hEocri8MCD8m966N
 OME3Wcv0nSd6XZR/+W7O/B5zMbnkZvTMlu8LM5E9rwowE0h+aIvHeu4JnabkLnMtWNe4
 G8RV8szA1uuKsx5r46GEGat4w4/vEQAUFzl6zHJ1KxDpQl+86EpH8s4wTvkG459LGk/9
 tViG69hLpnyGmp44Y+BX5CWXoQwZF+1pPjCcH6OMt93d4h4vxXiWINOb52yB3mtjKJ5I
 y5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=thKvXG+JY3HbxZ4gHoPQEiQ+g4hVQKN6LBHIr47r/6k=;
 b=pvsVHBdFjZkvQIPuwYGpVugyBR5JD+HpmO6/O3MHPvaMvIIs55m8/+dpCljEDMq0CK
 TVlJfNWWcgzficXRnTnXeTJTKh4bxy7MvneLc00h6EGhiJYfeXl4X0WqmK7Tu7NNN4gK
 7EsNLQ45gsfoCFtKy0sjtEuVDZOL8Ha13i2evvElOc3nrGI2ooSHtzxKDIrWKbqa408B
 22MxKZa9GzAX63VjA/rFsQ3qtezpj9iKM393ENVkHxf+sQbcTy2wNy/4JfK0sgdDfBqn
 ytkon0ZShO/RHUUl+sTbP/vqTxNu0n+nYoBRH6FYjsDewzaOMOG34M5VBHT84rRJr8eV
 O7DA==
X-Gm-Message-State: AJIora9RlUELL05ska804cRfPfyNwGJVZL1uZwb23gkRmZamYfSmv0Nw
 R6fvihslmqkeepfmLGtkNFV1kw==
X-Google-Smtp-Source: AGRyM1u6bcKos2Ai+xOrhZQz5EBIS0SCQvcwH2heAPU9X0Nf/agWvME05l1J5jMwiTo3Zm2Bvu++Zg==
X-Received: by 2002:a05:6000:15c1:b0:21b:ad5e:2798 with SMTP id
 y1-20020a05600015c100b0021bad5e2798mr12340957wry.237.1656337649964; 
 Mon, 27 Jun 2022 06:47:29 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b003942a244f47sm18847964wmq.32.2022.06.27.06.47.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 06:47:29 -0700 (PDT)
Date: Mon, 27 Jun 2022 14:47:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v9 13/14] dt-bindings: mfd: Add i.MX8qm/qxp Control and
 Status Registers module binding
Message-ID: <Yrm07wceI4DfGVNG@google.com>
References: <20220611141421.718743-1-victor.liu@nxp.com>
 <20220611141421.718743-14-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220611141421.718743-14-victor.liu@nxp.com>
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
Cc: andrzej.hajda@intel.com, narmstrong@baylibre.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, jernej.skrabec@gmail.com,
 marcel.ziswiler@toradex.com, linux-imx@nxp.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de, jonas@kwiboo.se,
 s.hauer@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 11 Jun 2022, Liu Ying wrote:

> This patch adds bindings for i.MX8qm/qxp Control and Status Registers module.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v8->v9:
> * No change.
> 
> v7->v8:
> * No change.
> 
> v6->v7:
> * Add Rob's R-b tag.
> 
> v5->v6:
> * Drop 'select' schema. (Rob)
> 
> v4->v5:
> * Newly introduced in v5. (Rob)
> 
>  .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ++++++++++++++++++
>  1 file changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
