Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8019A16EDD2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879FA6EB76;
	Tue, 25 Feb 2020 18:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8796EB76
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:19:15 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id i1so235067oie.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=iSNFodvA5lKumKKqhkZzGA6DFgZu/Be6kzIV2/+7uvI=;
 b=R+C9cKhzMQNG1f8yytcjtBGtl6lDdkhoRVtu6UV4a4rCDSm9q4iZqoLq8s+Qr2wGEP
 LPeae+m4JFvnC12G8CZYQ5CW69dzkOjOdDGbf9wjzprv6UOysU8xAv+so3AmLLA1h6hF
 5ftVs+/a/5roWeUxUVA75B1gKmeUPiuzhM7NFNS0P+Mai2X9JoIP62Y52kk64sJSDwQ7
 3gtfD0Lk6LZc8y08eTSyFKPmVvU4Z4rE9aYozp8IK17l0Apr99Q5xXp+YZngLUno6RA5
 GJDZccDUN83ZBQp6A9NF7T5GRTlz8uSdae5J6nWxaITZUOYmj/lcq84EoFCCCoTNIf0N
 VlMg==
X-Gm-Message-State: APjAAAU6Yms5l+5RX+w3fbQjCLH8APf92apvqFSAcH4mHCneeKf74L6h
 dNmbEYhtU9VezE+5QYBGXA==
X-Google-Smtp-Source: APXvYqylGxOIYQjx7oEtM4f5L4ZlqydvtMZMW3lXsVUQ+Cx55CgvSY6HFR33P45JatrRLi9lFN5i7w==
X-Received: by 2002:aca:d544:: with SMTP id m65mr158319oig.177.1582654754520; 
 Tue, 25 Feb 2020 10:19:14 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id y6sm5921513oti.44.2020.02.25.10.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:19:14 -0800 (PST)
Received: (nullmailer pid 7582 invoked by uid 1000);
 Tue, 25 Feb 2020 18:19:13 -0000
Date: Tue, 25 Feb 2020 12:19:13 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 59/89] dt-bindings: display: vc4: pv: Add BCM2711 pixel
 valves
Message-ID: <20200225181913.GA7531@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <4a3c6e3cad10eeff93fafbc512c35b0c69dd1c68.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a3c6e3cad10eeff93fafbc512c35b0c69dd1c68.1582533919.git-series.maxime@cerno.tech>
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

On Mon, 24 Feb 2020 10:07:01 +0100, Maxime Ripard wrote:
> The BCM2711 comes with other pixelvalves that have different requirements
> and capabilities. Let's document their compatible.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
