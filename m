Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE18157D430
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 21:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 471BA8B394;
	Thu, 21 Jul 2022 19:35:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDFE8B3D9
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 19:35:22 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id q14so2148093iod.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wELlNsbxx1+JCD9yf/xGA7zb/NOKO+vQi/OmtkVLBls=;
 b=huRqEcALT7TCveTdRcQb8d8WYqf+k7X+HiyTd1BP2FKhyuOMl7/XuiNhVj104HwIhD
 PVQb2hMzCh9snss/JXGMXwS1V79mAnXZ2XXadtnUGdpMbRt473TK+valdWxb53Ddqa2E
 33+rLD+IUER8vIcS917pC/MyrJJEtTulUpg1tjWU/FAyTB7J99CkoXY8w6IobJucT0Ye
 WuBPJLlJGq8YADNzLU/bUKIF08ujJk4HnwhZ8zYYkNFGZyo+vrAkCM+eSgt04LazYvnI
 GsSYJOCaAVK3xYhptyNcI9y3u434ovS1CaK6ljEukSB0fTg6XVVoDl7TWGnGiZLRp2tu
 IQkw==
X-Gm-Message-State: AJIora812WuWYrxW57x5Fhb6NqCtMrVDXPAY9Q1cdJ7Zj1slB4EXz4bY
 3h1qOu3tF9n7+K4p1khAfQ==
X-Google-Smtp-Source: AGRyM1sZvXpaofV6KHrP6nEJBBOrB/+dB8AwbfGYEa2h8d3D2/C7aFPfZcwL3IFjDFf1dLcaryTpdg==
X-Received: by 2002:a05:6638:15ca:b0:33f:594a:52ba with SMTP id
 i10-20020a05663815ca00b0033f594a52bamr35159jat.217.1658432122023; 
 Thu, 21 Jul 2022 12:35:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 a70-20020a021649000000b003415545d938sm1107557jaa.166.2022.07.21.12.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:35:21 -0700 (PDT)
Received: (nullmailer pid 1799145 invoked by uid 1000);
 Thu, 21 Jul 2022 19:35:16 -0000
Date: Thu, 21 Jul 2022 13:35:16 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 5/6] dt-bindings: net: explicitly list SPI CPHA and CPOL
Message-ID: <20220721193516.GA1798385-robh@kernel.org>
References: <20220721153155.245336-1-krzysztof.kozlowski@linaro.org>
 <20220721153155.245336-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721153155.245336-6-krzysztof.kozlowski@linaro.org>
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

On Thu, Jul 21, 2022 at 05:31:54PM +0200, Krzysztof Kozlowski wrote:
> The spi-cpha and spi-cpol properties are device specific and should be
> accepted only if device really needs them.  Explicitly list them in
> device bindings in preparation of their removal from generic
> spi-peripheral-props.yaml schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/net/nfc/marvell,nci.yaml     | 12 ++++++++++--
>  .../devicetree/bindings/net/vertexcom-mse102x.yaml   | 12 +++++++++---
>  2 files changed, 19 insertions(+), 5 deletions(-)

This too should not be needed.

Rob
