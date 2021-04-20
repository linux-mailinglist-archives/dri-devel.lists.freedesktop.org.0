Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A967D365D38
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29796E866;
	Tue, 20 Apr 2021 16:24:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2436E866
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 16:24:58 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id u16so22194230oiu.7
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 09:24:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A8dVyfjRQex2uU+PHTE48uLGNVgNmujkBe81Of/rrYw=;
 b=CXOjeIC6FNwLJjrYvWPCHnwI2ijNC9WabofU2qB+DS9uLBy27glfObBHWOrduUSDti
 D6mG149N1B4N48Wrj+EbJje52T75F4nTHjHQerQ7yV41MLSd0BqklC6Bvy2m+1Uf15dl
 lNl0w/w+6fkEH7ymnvgYuYHfIJsyEFRWPbdKU1X3f2upbpCMKjjlQh/gGaLLYXVp4KIR
 zAGCy0d0DyXCP4AFNLUntMCqLCv+SEYRBB3YgsDO4LpYKpRlUs1jRozabb5ha8vSAqLO
 0uBAwENLbejjtoRDCw71z6rx+bgFzFidi9ulN/qxmKdNO0sqQW14nuHqSbvCVOPs83Yl
 Q22A==
X-Gm-Message-State: AOAM530zEqjVcZUlJSllU5CMe+TkrHSLiSIfLXXvz9GsvJ8lgRMGiCjn
 /TJzqM67fMG090O9Reljig==
X-Google-Smtp-Source: ABdhPJzwYqxFN2+jlPlIrVKF+pkBftc8P1b64ffzN6SRSJxNtkEw2eWPlANKkhIUOyrz343BVhv/gQ==
X-Received: by 2002:aca:b387:: with SMTP id c129mr3598986oif.30.1618935898028; 
 Tue, 20 Apr 2021 09:24:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i25sm4370603otf.37.2021.04.20.09.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 09:24:57 -0700 (PDT)
Received: (nullmailer pid 3431205 invoked by uid 1000);
 Tue, 20 Apr 2021 16:24:55 -0000
Date: Tue, 20 Apr 2021 11:24:55 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: display: mediatek, hdmi: Convert to
 use graph schema
Message-ID: <20210420162455.GA3431175@robh.at.kernel.org>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
 <20210419073244.2678688-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419073244.2678688-2-narmstrong@baylibre.com>
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
Cc: devicetree@vger.kernel.org, chunkuang.hu@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Apr 2021 09:32:40 +0200, Neil Armstrong wrote:
> Update the mediatek,dpi binding to use the graph schema.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
>  .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
>  .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
>  .../display/mediatek/mediatek,hdmi.yaml       | 132 +++++++++++++++++
>  4 files changed, 240 insertions(+), 136 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
