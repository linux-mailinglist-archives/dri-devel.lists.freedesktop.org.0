Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DD36D28D3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 21:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2485810E219;
	Fri, 31 Mar 2023 19:53:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB3D10E219
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 19:53:01 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-177b78067ffso24338893fac.7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 12:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680292381;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OR6Sr6ibp9FVI2jjBSZUEmNbqrgLKUfxZHmJ3tN2tJI=;
 b=Lk+P/2wXcFOyrK9c0ojJGfSXE8uYLKUyhMuqy/z7VOtTJv4Ms+B5ZIaWEoBfF8OdXJ
 zb1TZMQo/njSuvXIKAWTLntL7WN4I7Rhwd4jvDDPpxwa9+SilYDYy32MZp0NoZVXYdiC
 BdqBq4J7iI8Fkj/ayb2fOLfrQwS/ruDs1PrqqF2tZI/RJ8zz4v7FVZ5Xpe3hmJepePOB
 gXbBlIUdCIPZiDREAMj+J/qczTqG9jEbdasVBKSRB9Y9RNC5dnpESeH29jA+OW67i5hx
 GboqozEWsgeu4wP1Sum1oGuV9ATn5vNeDHD1RLLeZLQqoODNH9wGN32IO5p5cYebSdKB
 FuWg==
X-Gm-Message-State: AO0yUKUx0xii+hw3jPCmoF5LDf9mWMR/MlhBfzpsP8GcAfLYkb5ppuoT
 g6rLyBUssf88UDiHS2fwOA==
X-Google-Smtp-Source: AKy350aVgOblYLSQB383WBUZwUCaOxItDWChiJ9N7LF68Gj3/qWb/jew5Lt93ZW0Oov6eR+Q0ew0Hg==
X-Received: by 2002:a05:6870:fbaa:b0:177:824d:e944 with SMTP id
 kv42-20020a056870fbaa00b00177824de944mr16919253oab.51.1680292380887; 
 Fri, 31 Mar 2023 12:53:00 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r4-20020a056830134400b00697be532609sm451922otq.73.2023.03.31.12.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Mar 2023 12:53:00 -0700 (PDT)
Received: (nullmailer pid 2120917 invoked by uid 1000);
 Fri, 31 Mar 2023 19:52:59 -0000
Date: Fri, 31 Mar 2023 14:52:59 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: xinpeng,xpp055c272: document
 port
Message-ID: <20230331195259.GA2098403-robh@kernel.org>
References: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230326204224.80181-1-krzysztof.kozlowski@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Mar 26, 2023 at 10:42:21PM +0200, Krzysztof Kozlowski wrote:
> Panels are supposed to have one port (defined in panel-common.yaml
> binding):
> 
>   px30-evb.dtb: panel@0: 'port' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/panel/xinpeng,xpp055c272.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied series to drm-misc.

Rob
