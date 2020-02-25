Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650D16EDBB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48D266EB7A;
	Tue, 25 Feb 2020 18:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F120E6EB7A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:17:32 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id a142so237922oii.7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:17:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=M0E7HviNSBsG8AdRJKzEgXOr8kHrjfuX94agJUStr7g=;
 b=bhAv/kqRVjYOLYLRrHj3Eemu9dRTrbbmIJ+xPKQ6qYB+TdwfCk0WhXQo4c2PROlqno
 q+XqAMXETLwMnWFsYbY0f6u47IJeXaRn0HYriX/T6tYYZ4MCSVqSO7NRLJs8E/GHJHph
 hoByHJVvHj5NeifPRk7n1saWuG+hF5JP7bDAWsGJRPv1gBdJC7sEABA1j7BYfTGnnULJ
 niXjtdWq4Gax3RsfOgGyaT7pa3xo5fhTY7+W6kNBPGMIHYzFmPgZXqko6W3IblJP1bGI
 N13Tjfs3XQ2wcNPgUiMcUB9HT0lhBY+aL/qRJgntmMCtPSGmScIXwv6Qy6dZE9CY9txl
 tozw==
X-Gm-Message-State: APjAAAUNYyDyYxv8lxx0fkq9eF28xD9U82EvTnsx/7Dmb6TWZRS+FIOK
 L7AO05HWDok2pP9vYVbHXA==
X-Google-Smtp-Source: APXvYqz1dylt8yKJtPhfpv45+IE1rLmfphrTF+EPA04MjmfXy9gQm/1y+8I9VO0b52zpWHhUF1c3oQ==
X-Received: by 2002:aca:b9c2:: with SMTP id j185mr181742oif.112.1582654652267; 
 Tue, 25 Feb 2020 10:17:32 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v25sm5890424otk.51.2020.02.25.10.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:17:31 -0800 (PST)
Received: (nullmailer pid 4562 invoked by uid 1000);
 Tue, 25 Feb 2020 18:17:30 -0000
Date: Tue, 25 Feb 2020 12:17:30 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 26/89] dt-bindings: clock: Add BCM2711 DVP binding
Message-ID: <20200225181730.GA4511@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <106e8a589a79eb70668b03d7160994c6a09a92c4.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <106e8a589a79eb70668b03d7160994c6a09a92c4.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2020 10:06:28 +0100, Maxime Ripard wrote:
> The BCM2711 has a unit controlling the HDMI0 and HDMI1 clock and reset
> signals. Let's add a binding for it.
> 
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml | 47 +++++++-
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2711-dvp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
