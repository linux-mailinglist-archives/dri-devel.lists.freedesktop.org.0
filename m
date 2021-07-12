Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057703C61BF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 19:18:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0E3899BC;
	Mon, 12 Jul 2021 17:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77603899BC
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 17:18:45 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id b6so10778974iln.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 10:18:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TiFkdBgaz2wMtnB/AoqFohTDPez/LJuB1eqRTUbRjdY=;
 b=M1FLflgyefG0bJzw+bDfPLkYM95Uj76pYdujv759BCaum7Eo+QWYglAZqPE80lITn1
 ZQEuvRkNQBsvS86Zhcv7hgZDE7tyKPqUfF2wM6LEf+x1xIgwfS7Rusaw96LghydAiHbd
 p4hxVoymS8V3IKnzhzp/95AlyoI2V+EkYJ3ucpmS4/qJjwp9fROgZ/caGh9uA1TMldKS
 Ss4wsjCwv2eYzFJ4MgQC4ieJ1HSClmVzSF0ohMKcMIYMPnW8G4w2Xd57OxZT3qc1loEu
 bAopflvp5cjDKsQBWetxQEdUboBzywT0YES8sWMFrAfr7T66SmliTQSEkZdQSmkoT5gs
 C7dg==
X-Gm-Message-State: AOAM530lob4rezGZEa87HShXUTEAMY+JG6WJZ0zgwr6DBXIL7rhGoF1C
 mVI3J/zyEpe49bVoXDnnYQ==
X-Google-Smtp-Source: ABdhPJyuhbHmm2mo85GbQP3+WFLWBgM1bAoYlXsHA4LIEG2y60tA0xG8KSMd+MSY2AmMu+OyHNJ6UQ==
X-Received: by 2002:a92:6610:: with SMTP id a16mr38109099ilc.124.1626110324850; 
 Mon, 12 Jul 2021 10:18:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id o7sm8607264ilt.29.2021.07.12.10.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 10:18:44 -0700 (PDT)
Received: (nullmailer pid 2137224 invoked by uid 1000);
 Mon, 12 Jul 2021 17:18:42 -0000
Date: Mon, 12 Jul 2021 11:18:42 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v3] drm/panel: Add DT bindings for Samsung LMS380KF01
Message-ID: <20210712171842.GA2137166@robh.at.kernel.org>
References: <20210707234315.242663-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210707234315.242663-1-linus.walleij@linaro.org>
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
Cc: devicetree@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, phone-devel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 08 Jul 2021 01:43:14 +0200, Linus Walleij wrote:
> This adds device tree bindings for the Samsung Mobile Displays
> LMS380KF01 RGB DPI display panel.
> 
> Cc: devicetree@vger.kernel.org
> Cc: phone-devel@vger.kernel.org
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Noralf Trønnes <noralf@tronnes.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes just resending with the series.
> ChangeLog v1->v2:
> - Expect SPI bindings to be pulled in for the client and state
>   spi-cpha: true etc.
> - Make port a required node.
> - Update the example to use a proper SPI controller (spi-gpio)
>   so we get full validation of the example.
> ---
>  .../display/panel/samsung,lms380kf01.yaml     | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
