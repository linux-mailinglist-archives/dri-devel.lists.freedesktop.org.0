Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD7331467A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 03:37:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35FB46EA7F;
	Tue,  9 Feb 2021 02:37:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9206EA7F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 02:37:02 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 18so6794875oiz.7
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Feb 2021 18:37:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hQRP/+c33BpQI1+/tGbsJuFwMmZpjkX8hC1DLcxfDkY=;
 b=ZtkTHQQRII4TgMBbYC65E0Y+Ps0oSX4qAhDTldubjMhlw+1NZUDCjGpsVlAEWx60dX
 OiOeqDkzTJyiP2IWoddSYjbRuqDy8Wp3n5Oxl0XeQfmbrIOUFrQi9WD435p/vY1wQCEY
 8I1Z58y1k8n5ZSYq2NlfNzhsaUFw8JpM5QJ0Hx1m6R7IK30Q2Vfv63pwt2nGQlYvO4dz
 HLxEnKetFgStYhbeoDXI1VGnpdo2mXJn2ZfSwm9U1kwuX1mhhANkrRvEOfx4D82C3lve
 EYH8ojS7mURisU1TpD+ea5IZil+vJqugOOF+r8wBUupCCBYMVFZR7fngdZ4ILMxwgk5Y
 8aEg==
X-Gm-Message-State: AOAM532jVm02ExawITm6bCnPwIvIwHv9iDfXQThWlnAfXKQ0zppsExWH
 1ibpvFaHzMznDihY/fgFVQ==
X-Google-Smtp-Source: ABdhPJxkPuqOi9xyaFRQXxdHtZhbsO1UswFQc/qFPL5GP+QGiKA/i3qF0K1U7CmEp7pB+Nmy2xEC7g==
X-Received: by 2002:aca:5941:: with SMTP id n62mr1130055oib.135.1612838220567; 
 Mon, 08 Feb 2021 18:37:00 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p20sm2024040oos.46.2021.02.08.18.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 18:36:59 -0800 (PST)
Received: (nullmailer pid 2568970 invoked by uid 1000);
 Tue, 09 Feb 2021 02:36:58 -0000
Date: Mon, 8 Feb 2021 20:36:58 -0600
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple: add Innolux
 G070Y2-T02 panel
Message-ID: <20210209023658.GA2568914@robh.at.kernel.org>
References: <20210121061141.23062-1-o.rempel@pengutronix.de>
 <20210121061141.23062-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210121061141.23062-2-o.rempel@pengutronix.de>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Robin van der Gracht <robin@protonic.nl>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 David Jander <david@protonic.nl>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jan 2021 07:11:35 +0100, Oleksij Rempel wrote:
> Add binding for the Innolux G070Y2-T02 panel. It is 7" WVGA (800x480)
> TFT LCD panel with TTL interface and a backlight unit.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
