Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2F96AFB21
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 01:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CBD10E576;
	Wed,  8 Mar 2023 00:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8FF10E576
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 00:31:24 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-176d93cd0daso7720823fac.4
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 16:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678235484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0N0vVa1h3Mrpxxp+FacYSNAxWlsrmv0a+CI104Imq8=;
 b=501NtZxGvuecXhU0difUcL/mP43YGSGJ0pwj0SqPv8/WRgOxD2y3y1FXJ+j0w430nb
 liEEtcBuKoaR1qXmjdOCX0FsnFWQcvTctdrzA3rMDn9CEeh5xfCiTYWABV7bmDJbGTkQ
 8H0bYmkiDTpVSgEj7ZE+6x0fApYatGf+8FH1wtN/k48lioXOhvPLFujWI/sS9yu3tXNR
 NZvTbmZZ338rQeGxmUAzZzmbwV5fcbUSLqsKldOE6KSj8hs01TwGChsGjJ+5hJA/qYcR
 asBdf2ujmf7eOTsXNtEoJ2UnZum9GP+Pe74JgCxUj3cYaVfg5sqXejliMj9iTlOjKvx1
 j4ww==
X-Gm-Message-State: AO0yUKUVEOhzoEkmtFe4qeGBSXC9fl3x1cA3MGtOIX4Wncha+mECEQ9k
 KA3i2GHsLVweGsGhw+Rcxg==
X-Google-Smtp-Source: AK7set8urRj86KjT6p6ca6TH+1d7WiTNHwu7LwngJMmJXYNx4lNvyYL4MUVFcNoMxtMf6owAX0HfHw==
X-Received: by 2002:a05:6870:14cc:b0:172:5b7b:19d6 with SMTP id
 l12-20020a05687014cc00b001725b7b19d6mr10893062oab.9.1678235483937; 
 Tue, 07 Mar 2023 16:31:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 x38-20020a4a97e9000000b005251f71250dsm5587810ooi.37.2023.03.07.16.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 16:31:23 -0800 (PST)
Received: (nullmailer pid 538253 invoked by uid 1000);
 Wed, 08 Mar 2023 00:31:22 -0000
Date: Tue, 7 Mar 2023 18:31:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/bridge: toshiba,tc358764:
 convert to dtschema
Message-ID: <167823547806.538132.10458902840268879408.robh@kernel.org>
References: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225160252.18737-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 25 Feb 2023 17:02:51 +0100, Krzysztof Kozlowski wrote:
> Convert the Toshiba TC358764 bridge bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/bridge/toshiba,tc358764.txt       | 35 --------
>  .../display/bridge/toshiba,tc358764.yaml      | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/toshiba,tc358764.yaml
> 

Applied, thanks!

