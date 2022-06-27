Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463A155BC3F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 00:03:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8CE310E0B1;
	Mon, 27 Jun 2022 22:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5771110E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 22:02:56 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id y18so11088905iof.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 15:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jdv65aYoH3wngx7Fdw7tsT2p4p1oistmuOoKV/y1rZU=;
 b=mTXpamOrxY3pm83NWFfShP7e1t9MQhNReCxqOkhr4JzjY5DwgUPVJHJgvlDd2G4hyM
 G567AgfHZ75+h51f5VwRqs+B2Z3dB9IucMQMWpZVtgg5w+L1cUoyuuHENAaGc3Br105r
 GWCh/RGx+LuSVRw+M8Sj2p0qGtwWYzVYMXtGA+l0w0ADXbwLOtZighoMGaO+FzGlW91c
 AVL4oKljCpkhrKam81T7cvbu6U2HjFNND4LUi2c5YO0sVqzmqVnldb/LQBeNd2kPchej
 W0efat0Sbwb90JfpjwJLR0ODTs/dVokIa7aHJBuKbCgYa+IBoARC4zgB/jkxDr3BMwcx
 Qz6Q==
X-Gm-Message-State: AJIora998br7oLj3bhR62GcgKrH67J2l1c0saQ6l2fL/LIiMKZub+eWY
 h5Vs0LJfT79oG/2VXQvt2aR+Qm15uw==
X-Google-Smtp-Source: AGRyM1sSDQYqJH4dsXWvmX5/Ry1DdbydVr5ZtoGq5S6BuADCTCcLi5R+m9kGUrb7nupJ9XoLcmy2kQ==
X-Received: by 2002:a05:6638:2110:b0:33b:b100:551e with SMTP id
 n16-20020a056638211000b0033bb100551emr9607569jaj.116.1656367375677; 
 Mon, 27 Jun 2022 15:02:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a027a56000000b00339ead526e5sm5290440jad.19.2022.06.27.15.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 15:02:55 -0700 (PDT)
Received: (nullmailer pid 3044113 invoked by uid 1000);
 Mon, 27 Jun 2022 22:02:53 -0000
Date: Mon, 27 Jun 2022 16:02:53 -0600
From: Rob Herring <robh@kernel.org>
To: Suniel Mahesh <sunil@amarulasolutions.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: sunxi: Add binding for
 RenewWorldOutReach R16-Vista-E board
Message-ID: <20220627220253.GA3044042-robh@kernel.org>
References: <20220615093900.344726-1-sunil@amarulasolutions.com>
 <20220615093900.344726-2-sunil@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615093900.344726-2-sunil@amarulasolutions.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 devicetree@vger.kernel.org, Christopher Vollo <chris@renewoutreach.org>,
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Jun 2022 15:08:59 +0530, Suniel Mahesh wrote:
> Add a binding for the RenewWorldOutReach R16-Vista-E board based on
> allwinner R16.
> 
> Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> Signed-off-by: Suniel Mahesh <sunil@amarulasolutions.com>
> ---
> Changes for v2:
> - Add missing compatible string
> - insert missing signatures of contributors
> ---
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
