Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C153AE6B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 23:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352010EDF2;
	Wed,  1 Jun 2022 21:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com
 [209.85.160.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5F9010EDF2
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 21:09:40 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-f2cbceefb8so4333321fac.11
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 14:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lz9YkXmluzI1p168QLYr9xM1kRCaRjaM0/FGvCuSWY8=;
 b=mP2pDoOFMqxge1CwCiaZZ8d3oEZFghl8+Bj1K5NqBUNN3YuWJ1Xa8gPrl2TYobKJ3h
 wL+3268JbC1jyULBNLYppbCOyHOzS0FpqsmzGiWYrqenwFwkldSQmGCqr3/Ptyur44U5
 Dd8Du01hIH1eoGFhKUytou3hQLFLPmFZ1ylbC3KUXm6Wo5/utZHSqd4P8buzAB+BEpFT
 XyHKFaGry/q5kX5oS4f9CUFir6hm23OCmo8eX4zVx9UIUqGkpb5iX1Qfu2nVjC3vhy6H
 2utqizsCyZzP9HvYb0kiQuST33rdicyoObfwu4Z2ZmrBWNNuCWdEFnGqqKXMShK5AsvE
 o9xg==
X-Gm-Message-State: AOAM5337w5p7nbICCMg7t4SqGWzp8PG13XL80YUlP96cX3TchaZCrt84
 BUm5bP1PjDIeMRomPJoG1Q==
X-Google-Smtp-Source: ABdhPJzrWF2c69+FrFYHc/YQUqCI9lL1oAgA5F5TgXFwkCpLR8CEM1a7l1cxJ8pd4y096o7Y6Bbn3w==
X-Received: by 2002:a05:6870:f587:b0:f5:eee4:d01c with SMTP id
 eh7-20020a056870f58700b000f5eee4d01cmr2201713oab.117.1654117780078; 
 Wed, 01 Jun 2022 14:09:40 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q8-20020a056830440800b0060aeccf6b44sm1367078otv.41.2022.06.01.14.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 14:09:39 -0700 (PDT)
Received: (nullmailer pid 457426 invoked by uid 1000);
 Wed, 01 Jun 2022 21:09:38 -0000
Date: Wed, 1 Jun 2022 16:09:38 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v3] dt-bindings: display: bridge: sil, sii9022: Convert to
 json-schema
Message-ID: <20220601210938.GA457343-robh@kernel.org>
References: <2f8e12b4980a82788c1dd413ceedf8d144fdca91.1652967387.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f8e12b4980a82788c1dd413ceedf8d144fdca91.1652967387.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 15:41:06 +0200, Geert Uytterhoeven wrote:
> Convert the Silicon Image sii902x HDMI bridge Device Tree binding
> documentation to json-schema.
> 
> Add missing sil,sii9022-cpi and sil,sii9022-tpi compatible values.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Add comments clarifying CPI/TPI,
>   - Improve wording,
>   - Drop port@2,
>   - Add port descriptions,
>   - Add schema references to individual ports.
> 
> v2:
>   - Rework sil,i2s-data-lanes,
>   - Add schema reference to ports.
> ---
>  .../bindings/display/bridge/sii902x.txt       |  78 -----------
>  .../bindings/display/bridge/sil,sii9022.yaml  | 131 ++++++++++++++++++
>  2 files changed, 131 insertions(+), 78 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/sii902x.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/sil,sii9022.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
