Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2286E9D2C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 22:28:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39F610E0E9;
	Thu, 20 Apr 2023 20:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3710E0E9
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 20:28:29 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-38dec65ab50so817521b6e.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 13:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682022508; x=1684614508;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BN77bzqJ/yB3QRLGMq1KZD+vDxVUQ63pMFzLm/nky90=;
 b=PexOYeFhaBKIrRivgdv3uYBeojrZNahgXR8cF9MRSWdsj5VrJ4wdE8YwUGJptcjlv0
 +Yf/ZOvFCXl1rCLzq3m6W8KV4qog0T2wEsAogAJa+6aAv6Yk9tlhUhMrqfy6bWm/Yl4k
 lAUP3qup3sQcHY3Suot6NWYB/bdV7EiAany00bq+IsQUUjrgeCXKiYng5GlutnXwmOBL
 +IaLWjN4Cv+IWAb5S1H6J3Ilk4KMMuFZQXvWdMJe1fnwnpUtnjLxXEHzulO1XHOwdg4p
 F/qdZx9kTQIb5X+4w4Bnfbdtj181/l2FVWmndjr/kVWFHchE09tJk/Dl99jU8psHuISq
 ieZg==
X-Gm-Message-State: AAQBX9f/LgpdxlQMBm3TDHe+j8MjXEFX3c8ZoCS1u5QhHnf3dEBFNR+l
 RdafwtGdepQhdp0+NCTzVw==
X-Google-Smtp-Source: AKy350YP/wcJUWbAJZqPtERkTWpbOBn8zaoVA7FARmNZR360RMUPkqUkW8Gbr0sDfp/ANPlj4XEhCg==
X-Received: by 2002:a05:6808:1507:b0:38e:eaf:cf2d with SMTP id
 u7-20020a056808150700b0038e0eafcf2dmr1811511oiw.56.1682022508227; 
 Thu, 20 Apr 2023 13:28:28 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g5-20020a4a8945000000b0053dfd96fa61sm1008295ooi.39.2023.04.20.13.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 13:28:27 -0700 (PDT)
Received: (nullmailer pid 3448242 invoked by uid 1000);
 Thu, 20 Apr 2023 20:28:26 -0000
Date: Thu, 20 Apr 2023 15:28:26 -0500
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Fix lvds.yaml references
Message-ID: <168202248831.3447844.12379188835461282102.robh@kernel.org>
References: <20230418150658.1535120-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418150658.1535120-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Heiko Stuebner <heiko.stuebner@bq.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 18 Apr 2023 10:06:57 -0500, Rob Herring wrote:
> The trailing "/" in "lvds.yaml/#" is not a valid JSON pointer. The existing
> jsonschema package allows it, but coming changes make allowed "$ref" URIs
> stricter.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/display/panel/advantech,idk-1110wr.yaml | 2 +-
>  .../devicetree/bindings/display/panel/innolux,ee101ia-01d.yaml  | 2 +-
>  .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml | 2 +-
>  .../devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml | 2 +-
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 +-
>  .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml    | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 

Applied, thanks!

