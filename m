Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC4551E19E
	for <lists+dri-devel@lfdr.de>; Sat,  7 May 2022 00:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A3B10E253;
	Fri,  6 May 2022 22:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FCC310E253
 for <dri-devel@lists.freedesktop.org>; Fri,  6 May 2022 22:39:57 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id r185so4204065oih.5
 for <dri-devel@lists.freedesktop.org>; Fri, 06 May 2022 15:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=h6f3Y9vrDdYYFTDNJT9zpurZsh7x1xQsR89Awh+MrAI=;
 b=bYcK/yR2NVQNfYV3CY4r7ADN6nftnM+5o67tPvIcDpCfgUuwhff5aO7uwzw0qEpaDm
 Gqs4wkoAHpgKfmjAlNhb6mUeT1jblYvz2v47WSr6PFxGCBiwecBs7gab0fDEAJoH11jQ
 4pantjcpJAWqFj0RqdO9Ji/jgLhpcUUWV7iHM0DQTyaRU23u1TsGgJFM0YvRWOx5RXmb
 ByqUky0QSp9DLzZ5UukRa2i6GhfX8DacNY1l8+7Zs1Yf5dq1ZMLMlGhh1J4xz25c1CUo
 C3s81zeL3cVdhBE3UzWvkl3rn3mtS8MgbXyRXXJ8+R80r/TCJ0uX18Dx4BqVIVi6QiDA
 ZzBA==
X-Gm-Message-State: AOAM532LjP9UHAU3PZ0ckafdrG90LLQ67zpnw87NwlBMBhuAtMASZyB7
 vYZ3sERCYbafZPm3IrScMQ==
X-Google-Smtp-Source: ABdhPJxYXgg20GjMyoMfP6GFwskmlW2eE/9SxYDmtFmaVd+42Ppf9qzFfTkX/9IUh8dQNSNxLfRU/w==
X-Received: by 2002:a05:6808:e89:b0:2f7:34db:6915 with SMTP id
 k9-20020a0568080e8900b002f734db6915mr2475740oil.284.1651876796724; 
 Fri, 06 May 2022 15:39:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r13-20020a9d5ccd000000b005b22a0d826csm2056138oti.1.2022.05.06.15.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 15:39:56 -0700 (PDT)
Received: (nullmailer pid 2407423 invoked by uid 1000);
 Fri, 06 May 2022 22:39:53 -0000
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20220506140533.3566431-10-andre.przywara@arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-10-andre.przywara@arm.com>
Subject: Re: [PATCH v2 09/11] dt-bindings: display: convert Arm HDLCD to DT
 schema
Date: Fri, 06 May 2022 17:39:53 -0500
Message-Id: <1651876793.696398.2407422.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Robin Murphy <robin.murphy@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 06 May 2022 15:05:31 +0100, Andre Przywara wrote:
> The Arm HDLCD is a display controller that scans out a framebuffer and
> hands a signal to a digital encoder to generate a DVI or HDMI signal.
> 
> Convert the existing DT binding to DT schema.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../devicetree/bindings/display/arm,hdlcd.txt | 79 ----------------
>  .../bindings/display/arm,hdlcd.yaml           | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 79 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/arm,hdlcd.txt
>  create mode 100644 Documentation/devicetree/bindings/display/arm,hdlcd.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


hdlcd@2a110000: 'port' is a required property
	arch/arm/boot/dts/vexpress-v2p-ca5s.dtb

hdlcd@2b000000: 'port' is a required property
	arch/arm/boot/dts/vexpress-v2p-ca15_a7.dtb
	arch/arm/boot/dts/vexpress-v2p-ca15-tc1.dtb

