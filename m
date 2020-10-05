Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1762836DF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 15:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C8D88957D;
	Mon,  5 Oct 2020 13:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46308957D
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 13:50:18 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id u126so8725289oif.13
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 06:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uMTeVXr/m5HzdYhs4WD9dPdsSbIpts4am22UhAG32ws=;
 b=VYqfvlUMW+REA/emfJwX9tF7gmVlBN81nNGijhEOg/7fegPO2eajzQuixhNI/zGfCC
 lbx3H3zrPZqv6SUlhuv+WF+7qxs/vB74CmUx1QMOqKJhjxoPudU34fXVuSTbwSonlaBK
 Df3KKygE/S+qXqajyXT4DWolI7CZCUQcFxe4PZtBCOPRypcr7nxN5h84oFKXG28N9Vg2
 enFyjVlo7iNKS1hVD3xpSCZOBRQW25O+W05iav46VvtNNA21KL+eQ96i0W2Lzdq7mSUi
 C49I97qJcysr/UCFsw00MXPnF7gn0mrSrooEz0tPtfsTHTuk9x7QFhQEhMFGjX6X31xw
 uRBw==
X-Gm-Message-State: AOAM530hkzrjx0I0guMFOqe5sZLUS5e3yIqPOLGGhQfyxeuxvVvHVV8h
 CrqUPp0+i56jx8T84Lo2AA==
X-Google-Smtp-Source: ABdhPJxdcgI1IgoyO6zDjjLjO4OE16NOhrJ5doTvU6D3HYFwm/Up+DW1tV+2bByaGdw+T8CfHpdesw==
X-Received: by 2002:a05:6808:359:: with SMTP id
 j25mr9092936oie.85.1601905817893; 
 Mon, 05 Oct 2020 06:50:17 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m3sm3056570otc.72.2020.10.05.06.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 06:50:17 -0700 (PDT)
Received: (nullmailer pid 80511 invoked by uid 1000);
 Mon, 05 Oct 2020 13:50:15 -0000
Date: Mon, 5 Oct 2020 08:50:15 -0500
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace
 #pwm-cells
Message-ID: <20201005135015.GA77667@bogus>
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930223532.77755-2-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 30 Sep 2020 17:35:31 -0500, Bjorn Andersson wrote:
> While the signal on GPIO4 to drive the backlight controller indeed is
> pulse width modulated its purpose is specifically to control the
> brightness of a backlight.
> 
> Drop the #pwm-cells and instead expose a new property to configure the
> granularity of the backlight PWM signal.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml: properties:ti,backlight-scale: {'description': 'The granularity of brightness for the PWM signal provided on GPIO4, if this property is specified.', 'minimum': 0, 'maximum': 65535} is not valid under any of the given schemas (Possible causes of the failure):
	/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml: properties:ti,backlight-scale: 'not' is a required property

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml: ignoring, error in schema: properties: ti,backlight-scale
warning: no schema found in file: ./Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml


See https://patchwork.ozlabs.org/patch/1374751

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
