Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E3A32F555
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 22:36:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6655F6EC61;
	Fri,  5 Mar 2021 21:36:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A076EC61
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 21:36:47 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id 97so3177285otf.13
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 13:36:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A/znipdyOwAzgeuPaqqylgiCI8fL3ADaRxj51tLfbj8=;
 b=tXKFUbjWHEH4630Nk0KzwgVHjXbBoYh0JDRhjkxGamlPwVVI5YfXtI1WLQulrkXX/W
 KyQaqfB6CdmFjUuDthwKqsROVpJ4Ir6nQtEFXuVpt8PxpcMy6QiHLEXoj29mvGIdfr95
 2TPjEa7jK2hT4XAAlHBBWqU5vjeBQ1rxYt49/wkJF0RU7SldeZnM3df7kz5UiJNnBBYR
 QiV0dI6Q7VYW5hC+uH9POy2y7Vaeai7VyaLUoYkkOO/6BBahr8f/I64Y8CHkyAweW2Bd
 l1lpbntIozOB5lhBE8yZrbf4WKfry68800fDTT3zgKcmSJUeuFlSJT3xv9ZAuSoIJ62P
 d4ew==
X-Gm-Message-State: AOAM5338SjCLYlroJv54is78lxKp7qnYmfs8Nzocc9TIl7tKbi//ajxi
 2D1lkSUiWBrZaVn+ZyvAAg==
X-Google-Smtp-Source: ABdhPJzYXim21O+qXZpvHXpE/16+KL1gkOLIQx/2yYxHvK52IFy6UDRNy4I2+TRpgV+8VzYWa0fJKw==
X-Received: by 2002:a9d:7196:: with SMTP id o22mr9553570otj.107.1614980207112; 
 Fri, 05 Mar 2021 13:36:47 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d1sm783766oop.0.2021.03.05.13.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 13:36:46 -0800 (PST)
Received: (nullmailer pid 687938 invoked by uid 1000);
 Fri, 05 Mar 2021 21:36:45 -0000
Date: Fri, 5 Mar 2021 15:36:45 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 SN65DSI83/84/85
Message-ID: <20210305213645.GA687887@robh.at.kernel.org>
References: <20210214174453.104616-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210214174453.104616-1-jagan@amarulasolutions.com>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 Feb 2021 23:14:52 +0530, Jagan Teki wrote:
> SN65DSI83/84/85 devices are MIPI DSI to LVDS based bridge
> controller IC's from Texas Instruments.
> 
> SN65DSI83 - Single Channel DSI to Single-link LVDS bridge
> SN65DSI84 - Single Channel DSI to Dual-link LVDS bridge
> SN65DSI85 - Dual Channel DSI to Dual-link LVDS bridge
> 
> Right now the bridge driver is supporting Channel A with single
> link, so dt-bindings documented according to it.
> 
> Cc: Marek Vasut <marex@denx.de>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v3:
> - fixed Rob comments
> - updated commit message and file name to support all chip variants
> Changes for v2:
> - none
> 
>  .../bindings/display/bridge/ti,sn65dsi8x.yaml | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8x.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
