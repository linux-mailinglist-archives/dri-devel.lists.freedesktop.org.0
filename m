Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B215F0017
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 00:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ABE10EB82;
	Thu, 29 Sep 2022 22:29:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30C6C10EB82
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 22:29:08 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 z9-20020a4a4909000000b0047651b95fbdso1081008ooa.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 15:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=eIYGb01iP1uQvHx/5dIICXkInZ12bMRqgZXdcsdsQ4Y=;
 b=wtBlRfxvgAiUSKuPBJBPooRqgVCNICadpzZFaHMMexDbn0U3tqy9pAvReXZkAyZshu
 OTnhKTGKok6Jb8FsS8Wn0VzO8smqgf/3CeYnqHbkqb1wcHiqHPfDA/d9dbqtQvoaj/0F
 tx8OzqsT5vuBtFV6ZrShYjkXjJrFpvHdgOnsP8r1BQWf88YZ3OY3GxBhqF4jLIGr0jU1
 6lE96uQrurY1BB9DOam/+FRDIxgNNjlI4jDTKzREl5lCi1Jfqorw49aRfalUPBIoVwCB
 x4uC1Jr/Li3Sc7iQqKdPP3dcVYtuWOH7UAOcosFHYk0T3KsQWZJPXVtanGMj2yj5i3J8
 A3/A==
X-Gm-Message-State: ACrzQf2rm63v8jzCzYUfrj/VX1k9Oyp0mv6omZ5KP2j0zrawNlC9eTJY
 l1GS0YSVXAMqJyXX3+lm7A==
X-Google-Smtp-Source: AMsMyM50FnMOFQvequxk7j7Nh7qAyE+AcDJlo33zrXe+tKrvwzRBMhdM+kIm70/KBE4j9TMMpbCaeg==
X-Received: by 2002:a05:6830:1d3:b0:65a:659:20c1 with SMTP id
 r19-20020a05683001d300b0065a065920c1mr2330171ota.113.1664490547266; 
 Thu, 29 Sep 2022 15:29:07 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h94-20020a9d2f67000000b0065932853f5esm205532otb.61.2022.09.29.15.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 15:29:06 -0700 (PDT)
Received: (nullmailer pid 2879517 invoked by uid 1000);
 Thu, 29 Sep 2022 22:29:06 -0000
Date: Thu, 29 Sep 2022 17:29:06 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: display: st, stm32-dsi: Handle data-lanes in
 DSI port node
Message-ID: <166449054453.2879455.4591283514406157909.robh@kernel.org>
References: <20220926234501.583115-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220926234501.583115-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 Sep 2022 01:45:01 +0200, Marek Vasut wrote:
> Handle 'data-lanes' property of the DSI output endpoint, it is possible
> to describe DSI link with 1 or 2 data lanes this way.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: linux-arm-kernel@lists.infradead.org
> ---
>  .../bindings/display/st,stm32-dsi.yaml          | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 

Applied, thanks!
