Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B3E18AB16
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6756E981;
	Thu, 19 Mar 2020 03:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F4D6E981
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 03:19:35 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id l14so888681ilj.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 20:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o9b3Uen4TKgqfZYrJaC1MPXjmfmbCASsF1lbGTm/W6I=;
 b=ocL7WPiOji1hZa2aLz1n/f3vIQbpBHu1PuA0kkXr33FR//wX4FTF8OZcxOumogp9Pk
 eg15K0bGvo8oywCWWduItaL+jlzHCNNX9qoqptga7m7yIdDPo+fiSuFpeBORk2/Fy+c4
 mbi/yYTUHKYJfiuU/UP22/FbuzwKb/5BBwamHFsVbmWFIdYmhd0jk1kgzF1mrN6+2ktq
 flkxUzID6hEgIO/n1Jf0l9hX5u4kjI8N3ibswiJupbF5wXLv42avjq5vfqBosx1OLnPn
 w1eAcXpdX26THzOjQqfq6RkJ4IGkzZPAj8MO7UcNDbcPFW2U4Nc/s3WxgUTHeHdqqRat
 asbw==
X-Gm-Message-State: ANhLgQ3YZeQ5pw1u9hDMQwOjY4ISssvh2ztdPIcAcpLpXGp6GEUdJFRk
 vSZML7i5DkrsZYl4liQbdw==
X-Google-Smtp-Source: ADFU+vs9QKc42qrzBiOiCiUfMsqT/P6DVJLovLlzzKYtkp5n9BApkIjgYy0mbvSQRY/2NI4n72pO0w==
X-Received: by 2002:a92:d843:: with SMTP id h3mr1205216ilq.246.1584587974813; 
 Wed, 18 Mar 2020 20:19:34 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s25sm341377ilb.37.2020.03.18.20.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 20:19:33 -0700 (PDT)
Received: (nullmailer pid 22933 invoked by uid 1000);
 Thu, 19 Mar 2020 03:19:29 -0000
Date: Wed, 18 Mar 2020 21:19:29 -0600
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 31/36] dt-bindings: display: convert sharp, lq101r1sx01
 to DT Schema
Message-ID: <20200319031929.GJ29911@bogus>
References: <20200315134416.16527-1-sam@ravnborg.org>
 <20200315134416.16527-32-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200315134416.16527-32-sam@ravnborg.org>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Nikolaus Schaller <hns@goldelico.com>, Jonathan Bakker <xc-racer2@live.ca>,
 Sandeep Panda <spanda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Zhong <zyw@rock-chips.com>, Marco Franchi <marco.franchi@nxp.com>,
 Stefan Mavrodiev <stefan@olimex.com>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, Tony Lindgren <tony@atomide.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Chiras <robert.chiras@nxp.com>,
 Vinay Simha BN <simhavcs@gmail.com>, Marek Belisko <marek@goldelico.com>,
 Heiko Schocher <hs@denx.de>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, Guido Gunther <agx@sigxcpu.org>,
 Mark Brown <broonie@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Werner Johansson <werner.johansson@sonymobile.com>,
 Purism Kernel Team <kernel@puri.sm>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Lin Huang <hl@rock-chips.com>, Douglas Anderson <dianders@chromium.org>,
 linux-spi@vger.kernel.org, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 15, 2020 at 02:44:11PM +0100, Sam Ravnborg wrote:
> This bindings describes a panel with a secondary channel.
> 
> A few of the properties are only required for the
> main (non-secondary) node.
> This is properly described in the binding.
> 
> A few properties are only valid for the main node,
> this is not described in the binding.
> I failed to find a way to describe it.

if:
  required:
    - link2
then:
  not:
    required:
      - power-supply

Test that though as sometimes I still write crap for json-schema.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
