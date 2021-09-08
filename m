Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812F40395E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 14:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B1D6E197;
	Wed,  8 Sep 2021 12:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com
 [209.85.161.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D1B76E196;
 Wed,  8 Sep 2021 12:00:52 +0000 (UTC)
Received: by mail-oo1-f44.google.com with SMTP id
 k20-20020a4ad114000000b0029133123994so687281oor.4; 
 Wed, 08 Sep 2021 05:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pIa+Ymh64lyH4Ksb3GNVCGfVEEWsQqehYzNJo9Tvkgw=;
 b=L+/+8nuhDRSMXoURsUDmNOOq5n6iri+RZkaqMLc65sMyyxHqlEAzCi/I+Etj94OToV
 9z0TLYA5IMLJYFM0u5UH+HDPuuzheKXVAVqwdy9OsuKxQcF53ZudkJJRWguOfPj+MEbe
 UjRgYDmZvWAEzWpgaYm9x7nfJg+aOKBDEqqGbydzgHIlglJhF0YQuExaFN8ZfityvqHo
 8uzKswSX03WxGh6FS9TUHY79BhQtXyo8DfjXlJlvjCRlsH+Q8rnBgv9Scq1FdYSqLNvJ
 vG38HTlx+O4gy2nPxRtEjekHLSZrTssJIIqj9f9/ruPUtWSeHGFjhwYo8gdII0sWSdK/
 V0dA==
X-Gm-Message-State: AOAM531iDXGxNnxCPtVvO6gciP5rmxbrFMy6g6ibOCVpp8i9Mt+J/eYW
 d0yy4ey/mXb37KyASrWH4A==
X-Google-Smtp-Source: ABdhPJyMOfCDqyxfhCpt75LbckaogIBcRViiXDtBG51ntFGEIU2DpplLlJ8npLttM1aYAd4r9ZrbDg==
X-Received: by 2002:a4a:a509:: with SMTP id v9mr2482404ook.73.1631102451023;
 Wed, 08 Sep 2021 05:00:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c14sm397800otd.62.2021.09.08.05.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 05:00:50 -0700 (PDT)
Received: (nullmailer pid 1853720 invoked by uid 1000);
 Wed, 08 Sep 2021 12:00:48 -0000
Date: Wed, 8 Sep 2021 07:00:48 -0500
From: Rob Herring <robh@kernel.org>
To: Sireesh Kodali <sireeshkodali1@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Krishna Manikandan <mkrishn@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: msm: dsi: Add MSM8953 dsi phy
Message-ID: <YTil8LIWywhwxu0N@robh.at.kernel.org>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
 <20210903170844.35694-2-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903170844.35694-2-sireeshkodali1@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 03, 2021 at 10:38:42PM +0530, Sireesh Kodali wrote:
> SoCs based on the MSM8953 platform use the 14nm DSI PHY driver
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index 72a00cce0147..d2cb19cf71d6 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -17,6 +17,8 @@ properties:
>      oneOf:
>        - const: qcom,dsi-phy-14nm
>        - const: qcom,dsi-phy-14nm-660
> +      - const: qcom,dsi-phy-14nm-8953
> +

This is going to conflict with v5.15-rc1, so you'll need to resend it.

>  
>    reg:
>      items:
> -- 
> 2.33.0
> 
> 
