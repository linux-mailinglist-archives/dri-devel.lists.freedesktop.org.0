Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB61688AA7
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 00:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F2D10E683;
	Thu,  2 Feb 2023 23:18:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1BA310E683
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 23:18:34 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-1631b928691so4619534fac.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 15:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43Zx/TXvhDMaAc5zx1VXMsMBlYbMLZIPlizKehYEi8M=;
 b=3gFF8MP349EA41GwTrZKb7C8qWMHAxvzTWaWOzaBpba1ABOsFFfMci5js4fsWOyflX
 NtVeji9fGEKFabzeZc73UovHsSbN2W4WCk0n9LTry6DH8WZMIlIgKcfEIizCCFsJQG6Y
 dZFHevkOYvoyFvnWWfw9d/hEbliA1j5oXX3DdAjfrxXc2XgdFb5SYEW/LWca3sKz3O3N
 Cvt5clNj87Wot1vHlPEpe4i0uv5E2Tdl1+dtIdkjyN0WBOF1qlNogZ3wLfA3jWmuemf5
 wPMqg46FFyiCCa5wcC3rhp2Xve3cVzYEiF87/p69t47SsKRfENA31CQ1KBddAQOTIai/
 zD7w==
X-Gm-Message-State: AO0yUKVFxyFxYcMdxVNqLP7I0KYdefNF4/8uRjIEY0dPB6DZ+Z6a1XPg
 kUuBv54rhKo8hnlqfUUxVg==
X-Google-Smtp-Source: AK7set8mqduKSve5eUbYJLI6XzJzquyQUbxvo8aniumgEc7aq0q/oJssG6sfbcHEikJBI9mH4paZlA==
X-Received: by 2002:a05:6870:8a2c:b0:15f:c483:214d with SMTP id
 p44-20020a0568708a2c00b0015fc483214dmr3932667oaq.9.1675379913776; 
 Thu, 02 Feb 2023 15:18:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k21-20020a056870d39500b0014ff15936casm300283oag.40.2023.02.02.15.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 15:18:33 -0800 (PST)
Received: (nullmailer pid 2888273 invoked by uid 1000);
 Thu, 02 Feb 2023 23:18:32 -0000
Date: Thu, 2 Feb 2023 17:18:32 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: sil, sii8620: convert to
 dtschema
Message-ID: <167537990980.2888174.4316773506332943399.robh@kernel.org>
References: <20230129160537.32275-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129160537.32275-1-krzysztof.kozlowski@linaro.org>
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
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 29 Jan 2023 17:05:37 +0100, Krzysztof Kozlowski wrote:
> Convert the Silicon Image SiI8620 HDMI/MHL bridge bindings to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Require also port@1 (Laurent)
> ---
>  .../bindings/display/bridge/sil,sii8620.yaml  | 108 ++++++++++++++++++
>  .../bindings/display/bridge/sil-sii8620.txt   |  33 ------
>  2 files changed, 108 insertions(+), 33 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii8620.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sil-sii8620.txt
> 

Applied, thanks!

