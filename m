Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E6F5A54D4
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 21:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B517210E582;
	Mon, 29 Aug 2022 19:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E21410E57A
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 19:54:41 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so11732448fac.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 12:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=en3iithyevFDMatFS08w+upETMWdwpkw/XCDou7WR5U=;
 b=BA+EmKWiFDgXa21WzMaeb4eXic+/YYx9vSkEGmPQIOEX+3ovhqgvk9phYGO7ZFC9v/
 nyOligjU8q6M0vV9xCsvxKt317wNZ0PQCDoOdBExeGXw2JkM/mcvu1HqQOe1KMfCUFjB
 qvsN/IuIM9nPc4rcy99Ik+nZHFL/8egJA+lAa4Y5gHxRuKdMz+wfiW5ZZvk7QFOSyrjA
 kCeCsCaaiD+ClkNERcnZvEFFnE6OyYOWA8VDxWL/mroUu84q7caeVbXmX2NGxGvPfV9V
 kx5l7J9DeoJrrD8t5+sAbA4EFZB17uHLZ3XtD0uViHoLIMqKRz3xmL4yI01TEI02OLyU
 YTxg==
X-Gm-Message-State: ACgBeo1MDnOAx5BrzAynGYIHvyn58a+g0ROVqZP8XX6MoBgde4tTe+Pw
 A45SNfIIGR/ErOHKDbOmFg==
X-Google-Smtp-Source: AA6agR7rAR5OhLrkKvgL0sKFBxfUGYd4vR/SwtAF4HU/wjmE/n1PKq6py+EqKTY+iSpPcaT9UGHZ7Q==
X-Received: by 2002:a05:6870:4606:b0:10d:c8b2:7f7d with SMTP id
 z6-20020a056870460600b0010dc8b27f7dmr8443721oao.238.1661802880370; 
 Mon, 29 Aug 2022 12:54:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 bk9-20020a056830368900b006370b948974sm5942235otb.32.2022.08.29.12.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Aug 2022 12:54:40 -0700 (PDT)
Received: (nullmailer pid 2309224 invoked by uid 1000);
 Mon, 29 Aug 2022 19:54:38 -0000
Date: Mon, 29 Aug 2022 14:54:38 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: synopsys, dw-hdmi: drop ref from
 reg-io-width
Message-ID: <20220829195438.GA2309143-robh@kernel.org>
References: <20220823101031.387082-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823101031.387082-1-krzysztof.kozlowski@linaro.org>
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Aug 2022 13:10:31 +0300, Krzysztof Kozlowski wrote:
> reg-io-width is a standard property, so no need for defining its type
> with $ref.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied, thanks!
