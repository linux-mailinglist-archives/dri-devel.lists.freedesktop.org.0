Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF7C65471D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 21:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED46610E57D;
	Thu, 22 Dec 2022 20:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BD110E57D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 20:28:06 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id r11so2877443oie.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 12:28:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=woCGv7/8V5+DgCxctIizIezO0GXF75G9DSlcq8wC02A=;
 b=1sBXObh+viyEdi9BqSacTWA/nax1tMEH33FcOz9SLrs5xE1RVfe1SbjUNkfobZRdTY
 84jUUMCMffMBxbHfz8z3ntyRRlIPItAhSqpOwnsu+CRCWg3oR+06f01oBRITlk9BW+j+
 g13/oZsq6u6wiWBWFY/ANEA4u/Lk6IslaFiSaV31FxGSGAIMKF7lpsWSSlFDB2JMeLKJ
 L/jvw8VD/yGoDT16tkx+aYBUdd3d/aaI1+jdoYUkommDRQ88d/xCvVvOWUMdyyKpfaUb
 iwuTh1vgZDDnKZGK0H83KfRpSZVR2aLMij+O9nS3we706LlYDC/EQ6hldrsSJgSOB8ML
 a4Qg==
X-Gm-Message-State: AFqh2koBsIfGqn8RDYQi2PVYHH8G5vBIwMO55p4YZ13UHeNfUIGbiCx6
 L6tGf4KFSon4ZccOYp2EBw==
X-Google-Smtp-Source: AMrXdXtqKbN/OPTnwnQNU/6pMgxhP8Q2rVkS0/IlBr4E6YM0ho5oZEvS/xsQPxtbRrQIy0lV9Hz3pQ==
X-Received: by 2002:a05:6808:8f:b0:355:1de8:bc80 with SMTP id
 s15-20020a056808008f00b003551de8bc80mr3269891oic.34.1671740885878; 
 Thu, 22 Dec 2022 12:28:05 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k20-20020a056808069400b0035b80dbf1easm720249oig.14.2022.12.22.12.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 12:28:05 -0800 (PST)
Received: (nullmailer pid 2068406 invoked by uid 1000);
 Thu, 22 Dec 2022 20:28:04 -0000
Date: Thu, 22 Dec 2022 14:28:04 -0600
From: Rob Herring <robh@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v6 08/17] dt-bindings: usb: convert fcs,fusb302.txt to yaml
Message-ID: <167174088325.2068348.12900872964177598466.robh@kernel.org>
References: <67771143-fd83-383d-41b2-68e8707134e8@gmail.com>
 <0336a3c4-4a43-c983-11d7-e2ae16187fc8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0336a3c4-4a43-c983-11d7-e2ae16187fc8@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, krzysztof.kozlowski+dt@linaro.org,
 linux-samsung-soc@vger.kernel.org, jernej.skrabec@gmail.com,
 linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com,
 devicetree@vger.kernel.org, jonas@kwiboo.se, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 andrzej.hajda@intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 sw0312.kim@samsung.com, hjc@rock-chips.com, robert.foss@linaro.org,
 kyungmin.park@samsung.com, philippe.cornu@foss.st.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 22 Dec 2022 15:28:53 +0100, Johan Jonker wrote:
> Convert fcs,fusb302.txt to yaml.
> 
> Changed:
>   Add vbus-supply property
> 
> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
> 
> Changed V6:
>   Add unevaluatedProperties
>   Drop unused labels
> ---
>  .../devicetree/bindings/usb/fcs,fusb302.txt   | 34 ----------
>  .../devicetree/bindings/usb/fcs,fusb302.yaml  | 67 +++++++++++++++++++
>  2 files changed, 67 insertions(+), 34 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/fcs,fusb302.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/fcs,fusb302.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
