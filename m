Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E0057D426
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 21:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D311BF1B;
	Thu, 21 Jul 2022 19:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9745711BFC2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 19:32:27 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id w16so1344982ilh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:32:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RW1s9d0AAPQ8Q1ggcxkOL30thDKSyaQDJk2AQocHRzI=;
 b=VG9G/Ldz5u6VJx7G/fJe3/48XIIniAH7au5iQtCgxw1W5gDDbBGdUaEsLQ9vXPNLQ0
 7TrTlJtu13+53D2gIQdVdsaN/+20RVUiUkB0V4ge6s1BOLIyC/JcF/C0gfGNcitU6Kgf
 b1Jcx7Io/ZNdr/iqb0bRCKkrNBUg9wyqua/Vo0TjNpsH4Z9aElU8PYcD1GRHx7x3hnJL
 pyI0k0Y6vsAbSaV+urZa+6NlwAxtlzamH70bh39IwTYgvXNrpG5crtFfxspQEBOtWsKr
 6DIT055De78WZ+4b3Sy43UfpiWOtKYK5ffYAlXayieWyDfbF1SINMI2DmWTDpGlqzU2k
 wCTg==
X-Gm-Message-State: AJIora8QBnBDX9MADmdw7kACoumET6nUNzhVO3tlIFadcaO4V7H2zoIx
 NiO77xPO55K+UUDlxKIRugJ1qQ7/Jw==
X-Google-Smtp-Source: AGRyM1urApMk3RmAgAk80eaJYDGIiCddCIb635mCXcyV8VHha7Y/DzXmZJzaV4JfmCjlsWC3fhIGUw==
X-Received: by 2002:a92:b70e:0:b0:2dd:10f0:6f8d with SMTP id
 k14-20020a92b70e000000b002dd10f06f8dmr2526356ili.321.1658431946785; 
 Thu, 21 Jul 2022 12:32:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056638113300b0033f3ab94271sm1126125jar.139.2022.07.21.12.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:32:26 -0700 (PDT)
Received: (nullmailer pid 1794689 invoked by uid 1000);
 Thu, 21 Jul 2022 19:32:22 -0000
Date: Thu, 21 Jul 2022 13:32:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 3/6] dt-bindings: iio: explicitly list SPI CPHA and CPOL
Message-ID: <20220721193222.GA1792785-robh@kernel.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
 <20220721153155.245336-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721153155.245336-4-krzysztof.kozlowski@linaro.org>
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
Cc: Tomislav Denis <tomislav.denis@avl.com>,
 Markuss Broks <markuss.broks@gmail.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Oskar Andero <oskar.andero@gmail.com>,
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>,
 Nuno Sa <nuno.sa@analog.com>, Eric Dumazet <edumazet@google.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sankar Velliangiri <navin@linumiz.com>, linux-spi@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Christian Eggers <ceggers@arri.de>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Matt Ranostay <matt.ranostay@konsulko.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Stefan Popa <stefan.popa@analog.com>,
 Sean Nyekjaer <sean@geanix.com>, Jakub Kicinski <kuba@kernel.org>,
 Nishant Malpani <nish.malpani25@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Stefan Wahren <stefan.wahren@in-tech.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Alexandru Tachici <alexandru.tachici@analog.com>, devicetree@vger.kernel.org,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Marcelo Schmitt <marcelo.schmitt1@gmail.com>, Dan Murphy <dmurphy@ti.com>,
 linux-fbdev@vger.kernel.org, Matheus Tavares <matheus.bernardino@usp.br>,
 Marek Belisko <marek@goldelico.com>,
 =?UTF-8?Q?M=C3=A5rten_Lindahl?= <martenli@axis.com>,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Cristian Pop <cristian.pop@analog.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, Pratyush Yadav <p.yadav@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Mark Brown <broonie@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 05:31:52PM +0200, Krzysztof Kozlowski wrote:
> The spi-cpha and spi-cpol properties are device specific and should be
> accepted only if device really needs them.  Explicitly list them in
> device bindings in preparation of their removal from generic
> spi-peripheral-props.yaml schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/iio/accel/adi,adxl345.yaml   | 10 ++++++++--
>  .../devicetree/bindings/iio/adc/adi,ad7192.yaml      | 10 ++++++++--
>  .../devicetree/bindings/iio/adc/adi,ad7292.yaml      |  5 ++++-
>  .../devicetree/bindings/iio/adc/adi,ad7606.yaml      | 10 ++++++++--
>  .../devicetree/bindings/iio/adc/adi,ad7768-1.yaml    | 10 ++++++++--
>  .../bindings/iio/adc/microchip,mcp3201.yaml          | 12 ++++++++++--
>  .../devicetree/bindings/iio/adc/ti,adc084s021.yaml   | 11 +++++++++--
>  .../devicetree/bindings/iio/adc/ti,ads124s08.yaml    |  5 ++++-
>  .../devicetree/bindings/iio/adc/ti,ads131e08.yaml    |  5 ++++-
>  .../devicetree/bindings/iio/addac/adi,ad74413r.yaml  |  5 ++++-
>  .../devicetree/bindings/iio/dac/adi,ad5592r.yaml     |  5 ++++-
>  .../devicetree/bindings/iio/dac/adi,ad5755.yaml      | 10 ++++++++--
>  .../devicetree/bindings/iio/dac/adi,ad5758.yaml      |  6 +++++-
>  .../devicetree/bindings/iio/dac/adi,ad5766.yaml      |  5 ++++-
>  .../devicetree/bindings/iio/dac/ti,dac082s085.yaml   |  9 +++++++--
>  .../bindings/iio/gyroscope/adi,adxrs290.yaml         | 10 ++++++++--
>  .../devicetree/bindings/iio/imu/adi,adis16460.yaml   | 12 +++++++++---
>  .../devicetree/bindings/iio/imu/adi,adis16475.yaml   | 10 ++++++++--
>  .../devicetree/bindings/iio/imu/adi,adis16480.yaml   | 11 +++++++++--
>  .../bindings/iio/imu/invensense,icm42600.yaml        | 12 ++++++++++--
>  .../bindings/iio/proximity/ams,as3935.yaml           |  5 ++++-
>  .../devicetree/bindings/iio/resolver/adi,ad2s90.yaml | 10 ++++++++--
>  .../bindings/iio/temperature/maxim,max31855k.yaml    |  6 +++++-
>  .../bindings/iio/temperature/maxim,max31856.yaml     |  6 +++++-
>  .../bindings/iio/temperature/maxim,max31865.yaml     |  6 +++++-
>  25 files changed, 166 insertions(+), 40 deletions(-)

This whole patch can be dropped which will make merging easier.

Rob
