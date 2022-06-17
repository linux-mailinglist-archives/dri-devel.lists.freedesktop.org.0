Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7FF54FD41
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 21:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328BD10F696;
	Fri, 17 Jun 2022 19:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7010F696
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 19:13:43 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id r5so5461262iod.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 12:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FAlxY7C70942+6ZI8In0KZR6RDzNAw7pB8H0QURf/C0=;
 b=FUVLAZBaqlYjlHVs8qGTZd56k7P64/Q1n+V8FLYmLzY8+CHAQyJZd0OtbaDwQewWi6
 F0jtjgWkSjgSuFNF3Qy3lMfaE5n+M6J2hhFmfKqYSXIQeSKEyULQ4mcl8UdEq2gqnB3T
 nz9JT1F23W8PW4YB7DOcO/bfyHxdtTDBb+3fLrPAbg/VcejYIfD3itJ+pahH4wDIl/hw
 bO7OdFaK7BT5rMwXDwHMZJ0zMNkmeHsYCoRhi4QpvJoi3ufKXbr3Aq8RQo10PUytWRNt
 XdI2fvhjVJhnFByKLA60771cBuysvylVzKOkxe1UOo06nvOCds/dbEQPHI5+PeRJkg4/
 LQ2A==
X-Gm-Message-State: AJIora/vowkMmf5fC72pJTQhIKzYxYYBkcDRZRY+ZsEc3d3BqHgqnh2K
 aeNXa0Ij7UbcwaeqJSrcNQ==
X-Google-Smtp-Source: AGRyM1tN15Vyauv/t5I2I81uJqs0mSjvkhJPD/uPhy2wr2HRbI7QXMOLyrKAh0Z8TX5E/7FySM9zSg==
X-Received: by 2002:a05:6638:1c07:b0:331:a800:1062 with SMTP id
 ca7-20020a0566381c0700b00331a8001062mr6332880jab.4.1655493223286; 
 Fri, 17 Jun 2022 12:13:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a056602242800b00665881f9182sm2875926iob.20.2022.06.17.12.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 12:13:42 -0700 (PDT)
Received: (nullmailer pid 2123808 invoked by uid 1000);
 Fri, 17 Jun 2022 19:13:41 -0000
Date: Fri, 17 Jun 2022 13:13:41 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: Add Arm virtual platforms display
Message-ID: <20220617191341.GA2123705-robh@kernel.org>
References: <20220613145709.3729053-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613145709.3729053-1-robh@kernel.org>
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
 Andre Przywara <andre.przywara@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 08:57:09 -0600, Rob Herring wrote:
> 'arm,rtsm-display' is a panel for Arm, Ltd. virtual platforms (e.g. FVP).
> The binding has been in use for a long time, but was never documented.
> 
> Some users and an example have a 'panel-dpi' compatible, but that's not
> needed without a 'panel-timing' node which none of the users have since
> commit 928faf5e3e8d ("arm64: dts: fvp: Remove panel timings"). The
> example does have a 'panel-timing' node, but it should not for the
> same reasons the node was removed in the dts files. So update the
> example in arm,pl11x.yaml to match the schema.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Make arm,rtsm-display its own schema file instead of using
>    panel-simple.
> ---
>  .../bindings/display/arm,pl11x.yaml           | 15 +----------
>  .../display/panel/arm,rtsm-display.yaml       | 27 +++++++++++++++++++
>  2 files changed, 28 insertions(+), 14 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/arm,rtsm-display.yaml
> 

Applied, thanks!
