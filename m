Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F6C727291
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 00:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB10810E569;
	Wed,  7 Jun 2023 22:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A66110E569
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 22:59:10 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-77ac30e95caso79264439f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 15:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686178749; x=1688770749;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kFzGl5Y+j+urK0M5uIWGN6STqdqRcNA1KNyN7xsd4bE=;
 b=YnBREI4Odca3XahAebbgxHBMGOWUabI3cJbZxDtmjxksQE4BSo6f94VRGqZPBgNWQS
 KByQdzRispdYnA7P+WggX8gWf/8bGhA6gD+pursUu5fP3Rl8bkvO6MCEw1pYrV0rDsS2
 eLaOzPDPg7ehTS0bHvMA69lybwWVQP1gZUOL+ekTpJVMpxaunldDZhBrMem+NC5QWSHl
 aFR9dfyP+NIcckzjtl9Wo9L8yYOMOs7Jdj87oqlixJt/tf99j05n2ZAGPChPK4DS7+e/
 rYtRarY3qs0iDuuAenjWbx4IOc5lj3ZQqgOy5oBZMDmEYc+tJ+XvlVlkLPs8ZW7QvkIz
 Rcrw==
X-Gm-Message-State: AC+VfDyH23fdBN6/a+uQ2/xpM8byu5Mukr5cflULnVOU5kjj2bZ92Q/5
 S8QvZjO4LY9uIaniqI+B+Q==
X-Google-Smtp-Source: ACHHUZ7BnuCAFr2Z4+bfcxl0bBN4CcwOY5nGwEMqgQt5lDW2zkMr5TY+fuJnHMs9/ZGreuSuGR+eQg==
X-Received: by 2002:a6b:6511:0:b0:776:f6cd:f68e with SMTP id
 z17-20020a6b6511000000b00776f6cdf68emr9602991iob.1.1686178749147; 
 Wed, 07 Jun 2023 15:59:09 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 da26-20020a0566384a5a00b004165ca8e789sm3695833jab.117.2023.06.07.15.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 15:59:08 -0700 (PDT)
Received: (nullmailer pid 140068 invoked by uid 1000);
 Wed, 07 Jun 2023 22:59:06 -0000
Date: Wed, 7 Jun 2023 16:59:06 -0600
From: Rob Herring <robh@kernel.org>
To: Leonard =?iso-8859-1?Q?G=F6hrs?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH v1 1/8] dt-bindings: display: panel: mipi-dbi-spi: add
 shineworld lh133k compatible
Message-ID: <168617874553.140010.12334195424988048324.robh@kernel.org>
References: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230607115508.2964574-1-l.goehrs@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>, kernel@pengutronix.de,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 07 Jun 2023 13:55:00 +0200, Leonard Göhrs wrote:
> The Shineworld LH133K is a 1.3" 240x240px RGB LCD with a MIPI DBI
> compatible SPI interface.
> The initialization procedure is quite basic with the exception of
> requiring inverted colors.
> A basic mipi-dbi-cmd[1] script to get the display running thus looks
> like this:
> 
>     $ cat shineworld,lh133k.txt
>     command 0x11 # exit sleep mode
>     delay 120
> 
>     # The display seems to require display color inversion, so enable it.
>     command 0x21 # INVON
> 
>     # Enable normal display mode (in contrast to partial display mode).
>     command 0x13 # NORON
>     command 0x29 # MIPI_DCS_SET_DISPLAY_ON
> 
>     $ mipi-dbi-cmd shineworld,lh133k.bin shineworld,lh133k.txt
> 
> [1]: https://github.com/notro/panel-mipi-dbi
> 
> Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml   | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.yaml          | 2 ++
>  2 files changed, 3 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

