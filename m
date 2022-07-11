Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC1A570AC3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 21:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFBB90C36;
	Mon, 11 Jul 2022 19:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A4C90C35
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 19:31:39 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id u20so5874620iob.8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BmO0BsTdvSsda0HsVx8sp/2MHsbGgulWtbJmBfZYCos=;
 b=v1DJz+Ci8M6naGDU8bHWPtid9hd914sROWKM3FiEaeJY/VT05OE7UkAHO1mTIQ99OY
 Vm/hfuWTMAzPJHEMMHft6zhDcUbdqZzefzwf+gWgKJb3igMq+Pee3hjM+M178inWHdnm
 GKUPyJHSsYSuRLEzY7Ng/U2zGxlGeWgZkQq9/UDr+hz9UvuZBj7gjF2WwWQ33n4t6Oa6
 eqVgPCYLIW08g3H6Fo/HFgBSnVQtrEKv0jjysU95U9DFjTonpT2CdF3qS98MMGw8opFc
 OzfCWIKrusc+8fH8Z5v0FbRqmjDeaJb+SZqyYuBv7HNnjh+QjTscKnqb2YDaAIdp0GlJ
 T8ig==
X-Gm-Message-State: AJIora9n/LdZVaXpqYSwHfilzWInuGQczXghSVZAmJfd5Bh5cLbxo2i/
 9iIM3OLs9JwOxba6fPSHyg==
X-Google-Smtp-Source: AGRyM1uaBO1tHBzdt0QJErXkf+tNW24+2epDd4jDKlZGTHLHkR8AAVFUiLhFAqnnC+iBOsvl0riMLw==
X-Received: by 2002:a5d:9919:0:b0:675:48c7:d959 with SMTP id
 x25-20020a5d9919000000b0067548c7d959mr10397563iol.27.1657567899184; 
 Mon, 11 Jul 2022 12:31:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 p133-20020a02298b000000b0033f3e34f3b4sm3257856jap.150.2022.07.11.12.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 12:31:38 -0700 (PDT)
Received: (nullmailer pid 141681 invoked by uid 1000);
 Mon, 11 Jul 2022 19:31:36 -0000
Date: Mon, 11 Jul 2022 13:31:36 -0600
From: Rob Herring <robh@kernel.org>
To: Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH v6 1/5] dt-bindings: display: bridge: Convert
 cdns,dsi.txt to yaml
Message-ID: <20220711193136.GA141620-robh@kernel.org>
References: <20220707101601.7081-1-r-ravikumar@ti.com>
 <20220707101601.7081-2-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707101601.7081-2-r-ravikumar@ti.com>
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
Cc: devicetree@vger.kernel.org, a-bhatia1@ti.com, narmstrong@baylibre.com,
 airlied@linux.ie, jpawar@cadence.com, jonas@kwiboo.se,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 mparab@cadence.com, vigneshr@ti.com, andrzej.hajda@intel.com,
 robh+dt@kernel.org, tomi.valkeinen@ideasonboard.com, jernej.skrabec@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sjakhade@cadence.com, lee.jones@linaro.org,
 robert.foss@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 07 Jul 2022 15:45:57 +0530, Rahul T R wrote:
> Convert cdns,dsi.txt binding to yaml format
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.txt      | 112 -------------
>  .../bindings/display/bridge/cdns,dsi.yaml     | 157 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
