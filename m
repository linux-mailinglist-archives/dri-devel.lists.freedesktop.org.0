Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8E6AFB18
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 01:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF22E10E57A;
	Wed,  8 Mar 2023 00:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D07C10E57A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 00:29:23 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-17711f56136so2213372fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 16:29:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678235362;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbkJoaBSLlit3t2d1saVpRVwe6uVOOAmLerdrHEmPA4=;
 b=uYor4MDpb+Fo40RjQ8OYE9aAuWfTgc9z/bwKV4KLpyG2blFIXnrPqIbkt4zRdcFxzs
 UxsxghhWwf8zv9W609ifLoqttXBeuTZE9ScLQ/r3gw2rhCiEtxbFx1HBqo8zbjxqn+bc
 yK/Hx4Mu5AX23BQ6W/EJu0Z7+tM3iCTMbTJfAUcRrV9xGdQfSJivjE38X/qu6k5FG7VB
 pAwiZaFzVtT9iA0T8w1K8lDPPpp/q1n2tW6eE7CduAnl83j1YjDIeKBPWFRShSGiH5er
 xM3Ylz/FXHLOVbIwqKM5L5jJyTWZtvf+KvinwNHC/KnjwctALxblPbT9NOdY0VPN1R5l
 AseQ==
X-Gm-Message-State: AO0yUKXnoWKHcZgddZY9+q4Dmq+F/sgiqz4L+qBdsKa4vRYrPGk9tual
 3YjFgkv7Pp59N2x6Chv3bA==
X-Google-Smtp-Source: AK7set83LoWLF5mpats1V58zuDPQ+pBXFeCwEfyRTuwpQDFg/1Md/+txVRbI6H1CFcRNahYc39uAKg==
X-Received: by 2002:a05:6870:c0d5:b0:176:55ad:9237 with SMTP id
 e21-20020a056870c0d500b0017655ad9237mr9249005oad.38.1678235362468; 
 Tue, 07 Mar 2023 16:29:22 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c22-20020a056870a59600b0017197629658sm5660538oam.56.2023.03.07.16.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 16:29:21 -0800 (PST)
Received: (nullmailer pid 535800 invoked by uid 1000);
 Wed, 08 Mar 2023 00:29:21 -0000
Date: Tue, 7 Mar 2023 18:29:21 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: bridge: parade,ps8622: convert to
 dtschema
Message-ID: <167823536016.535746.4969388774205630189.robh@kernel.org>
References: <20230221170955.62448-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221170955.62448-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 21 Feb 2023 18:09:55 +0100, Krzysztof Kozlowski wrote:
> Convert the Parade PS8622/PS8625 DisplayPort to LVDS Converter bindings
> to DT schema.  Changes during conversion: add missing vdd12-supply, used
> by Linux driver.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/bridge/parade,ps8622.yaml         | 115 ++++++++++++++++++
>  .../bindings/display/bridge/ps8622.txt        |  31 -----
>  2 files changed, 115 insertions(+), 31 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/parade,ps8622.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/ps8622.txt
> 

Applied, thanks!

