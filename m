Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A984C38E9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 23:42:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F6A10E838;
	Thu, 24 Feb 2022 22:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E14710E838
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 22:42:13 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id p15so5482234oip.3
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 14:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TPgNpyc66QmnNVuY9AEEqHQNq1Atb18rdJ0fs2Kteuw=;
 b=1mkthpOzdeb6BEwykZSVmNj/0CBtdFhUlAW9y2j+k7Q1EFrT7CVwc3Es4CzIbDuexz
 H7+cYPakXxiRR3stJ2FdDPU6rmTc8lwnPUfmzJZnYDf7Bcel7gHb11JT+8yAzlaK90xT
 wu1hUAGL3AdwCk1cHuMDhClR9MTpVSMGgOj5IIS7+a35GX74zLSKxL0gkqrsJkWFt7/j
 0/vJ5gbrDexgBvv7mf7+H1z3FKd9UtPxHQiGwdnHz70+jOZJ++R62y4i+LqIBoF88RiX
 +Jq+2tx7So+bdgmuDsHn6cX0xbZRvKLIgvzZEkdYB5lhaAuVCSOLWgWdrNwpOW5sFvUG
 23Vw==
X-Gm-Message-State: AOAM53325nLIL393FrMKVPka8jfVC5IxSRWlq5WzKb1ntrTo2qxwZKqq
 NyFJc+uNqyibSeIjkBngbg==
X-Google-Smtp-Source: ABdhPJxd1sEAdFyM8rb47906jSUwAsUCKNtBuXPZXHfMFy2eJ+YEnWZKbVwTI9/JvZKJJSJAcTmolw==
X-Received: by 2002:a05:6808:309b:b0:2d5:7c4b:79df with SMTP id
 bl27-20020a056808309b00b002d57c4b79dfmr181064oib.190.1645742532602; 
 Thu, 24 Feb 2022 14:42:12 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 w11-20020a4a274b000000b0031c10e27c1esm302871oow.3.2022.02.24.14.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 14:42:11 -0800 (PST)
Received: (nullmailer pid 3727866 invoked by uid 1000);
 Thu, 24 Feb 2022 22:42:11 -0000
Date: Thu, 24 Feb 2022 16:42:11 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V3 01/12] dt-bindings: display: bridge: tc358867:
 Document DPI output support
Message-ID: <YhgJwzOg0KUuoAHW@robh.at.kernel.org>
References: <20220224195817.68504-1-marex@denx.de>
 <20220224195817.68504-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220224195817.68504-2-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 24 Feb 2022 20:58:06 +0100, Marek Vasut wrote:
> The TC358767/TC358867/TC9595 are all capable of operating in multiple
> modes, DPI-to-(e)DP, DSI-to-(e)DP, DSI-to-DPI. Document support for the
> DPI output port, which can now be connected both as input and output.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: devicetree@vger.kernel.org
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Rebase on next-20220217
> V3: - No change
> ---
>  .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml  | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
