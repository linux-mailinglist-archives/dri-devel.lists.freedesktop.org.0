Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEABA16EDCA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 19:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C22A66EB7F;
	Tue, 25 Feb 2020 18:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25776EB7F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 18:18:43 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id g64so368456otb.13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:18:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yH2p3xs+aaL+WXkwsTjWjJdrjOI9O37tLapilDd5TUo=;
 b=VRAulyUuiaTamM2WDqfAdoeTWrz6hMPccTFWVQRWTTFATGSPxCW8Lw5BQhOiV+d6Lt
 DypaYo3yCUfVWtmItvxitemrFdO0AHec096qFy4Ul1/iVKfq1TG+uc6hPiGCsHZ4zY6q
 L6xU7RIC5+MD/HZuxJxz5vexRa8ptcwOTnY3AK19rinqR30uisZJKAkuP3YP2m/68m9/
 8XXcWKi6boaxtKBJJR2xZozvVj3ONvutM+2rSld9MC1XrDMeLgGhhShntS+ypHSTk5Q3
 ng8cnejvex0wuTsa7oHmR+6R/RBd5XWYtNtS4zedDRpvGt5L33rexK9F1p01GBME669D
 e23Q==
X-Gm-Message-State: APjAAAWp61IPCSFScVeeH1thSDEA32/ePiG2YhBNFJg51QzrALagaSQL
 jbeAW74lzcj9ouI406pNqQ==
X-Google-Smtp-Source: APXvYqyyeZ8ALcxDWMjiiWv1sZR+xuh4rkYVrqsLZj32FBSL2tBxLkUdVZM+IuRr/MNxXyTTRWlG2A==
X-Received: by 2002:a9d:774e:: with SMTP id t14mr44734522otl.358.1582654723053; 
 Tue, 25 Feb 2020 10:18:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id x22sm5922850otk.23.2020.02.25.10.18.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:18:42 -0800 (PST)
Received: (nullmailer pid 6637 invoked by uid 1000);
 Tue, 25 Feb 2020 18:18:41 -0000
Date: Tue, 25 Feb 2020 12:18:41 -0600
From: Rob Herring <robh@kernel.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 32/89] dt-bindings: display: vc4: hdmi: Add missing
 clock-names property
Message-ID: <20200225181841.GA6516@bogus>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <d549097789913d64104d6a5924af5b5981beef9b.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d549097789913d64104d6a5924af5b5981beef9b.1582533919.git-series.maxime@cerno.tech>
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

On Mon, 24 Feb 2020 10:06:34 +0100, Maxime Ripard wrote:
> While the device tree and the driver expected a clock-names property, it
> wasn't explicitly documented in the previous binding. The documented order
> was wrong too, so make sure clock-names is there and in the proper order.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
