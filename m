Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7265635D03D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 20:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C9C89EA6;
	Mon, 12 Apr 2021 18:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6203C89EA6
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 18:24:06 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id a21so1295272oib.10
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 11:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I5HbeKDhcmeEzkTpL+s857z6JwOx8CcHKVixcQWeMqg=;
 b=NquthCkHUbFKxA7rrVnjJUoAT7BDg+lT6Wnc6OCAhz6ItO/BS/j/3HiyEd4LtA0Dd4
 xn98Msh0ah90BBU9GNvzrrnpmEbrPCF0bw8EWbp3j0G2BaT+FMCrPEYBw7TBIvIjMKqQ
 Oj3WQqlC1EcltE1VSRy7/OJFLz0p8vs26Im6MboaITWA0QbXGPCCcBsqoaXNlHCYXH93
 oV8PClKIDFXE9Md7OfV5uI41y6P8HOS5LoDgKgQy+sDWdICWg+WBgaqqoOWnSlPA42i4
 N4RIxGldNelZ9ZEQL2Pct663DuY41u3F60Uox//RReJbwWX0+OrZ0qlu/k+IH0HoC9dX
 cuaw==
X-Gm-Message-State: AOAM530k5dh/aRvskXyuRCHI87L6VEH+Sncv2LLsIN+RwolAI0z53j+U
 OryADKFZxVYn4EkiOl8FQQ==
X-Google-Smtp-Source: ABdhPJzVKlY/PDIKP5bFbIi5/h2pnazHJhpoBIZhzlLLlOribqb0QB7d3q70bueIT0GW3jShnMgK7g==
X-Received: by 2002:a05:6808:b3b:: with SMTP id
 t27mr337538oij.131.1618251845638; 
 Mon, 12 Apr 2021 11:24:05 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x2sm2886622ote.47.2021.04.12.11.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 11:24:04 -0700 (PDT)
Received: (nullmailer pid 4153852 invoked by uid 1000);
 Mon, 12 Apr 2021 18:24:03 -0000
Date: Mon, 12 Apr 2021 13:24:03 -0500
From: Rob Herring <robh@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: Re: [PATCH v6 1/2] dt-bindings: display: add
 google,cros-ec-anx7688.yaml
Message-ID: <20210412182403.GA4153823@robh.at.kernel.org>
References: <20210409161951.12365-1-dafna.hirschfeld@collabora.com>
 <20210409161951.12365-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210409161951.12365-2-dafna.hirschfeld@collabora.com>
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
Cc: megous@megous.com, devicetree@vger.kernel.org, jernej.skrabec@siol.net,
 drinkcat@chromium.org, narmstrong@baylibre.com, airlied@linux.ie,
 dafna3@gmail.com, linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, chunkuang.hu@kernel.org, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, hsinyi@chromium.org,
 enric.balletbo@collabora.com, kernel@collabora.com, jonas@kwiboo.se
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 09 Apr 2021 18:19:50 +0200, Dafna Hirschfeld wrote:
> ChromeOS EC ANX7688 is a display bridge that converts HDMI 2.0 to
> DisplayPort 1.3 Ultra-HDi (4096x2160p60). It is an Analogix ANX7688 chip
> which is connected to and operated by the ChromeOS Embedded Controller
> (See google,cros-ec.yaml). It is accessed using I2C tunneling through
> the EC and therefore its node should be a child of an EC I2C tunnel node
> (See google,cros-ec-i2c-tunnel.yaml).
> 
> ChromOS EC ANX7688 is found on Acer Chromebook R13 (elm)
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../bridge/google,cros-ec-anx7688.yaml        | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/google,cros-ec-anx7688.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
