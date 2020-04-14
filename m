Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EF1A897B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 20:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 140196E160;
	Tue, 14 Apr 2020 18:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809CE6E160
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 18:27:45 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id i27so661545ota.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kI/3eiVm1kw4HQZBFlJCA+YGkg5qdFUWdYWaFflp6bI=;
 b=UI5sT9gXX/4G+8ZnTf9W2U2Fok/eZU5h5JN4/A7znCGRtQKZOgZhbgfnwaza6CI7fS
 PY7BHcKr70S4Rv3suq1cGo+UcVqem66F++mkKcTUVjwCHIEFOE64b0JodncsdLRfKRwG
 QDsIgPkfF4M37TrpCgrjACgkMAydnXMga/jIeEIDad7Ny57Coxhu9Pg8IdocwSy8nctr
 hUQ9L1pPucIUg1h+Ld/7h3Hw0zFjco9mCHwpZsTzWYWnpI73EPhbVH+3RQ1dD2oSL+zH
 1irjge14jKHVgxC/T7pR1mDw/GUOjYmMLHtfxgDompVTmz2PXF62giioTfejPJ6WB7aa
 R3wA==
X-Gm-Message-State: AGi0PuZAa/zuEpwzypCOoc76as9daFkTL8n+Afrk3LTRQHNGYVibZ02d
 +ULWFOknUBM1LzfbPIDZiA==
X-Google-Smtp-Source: APiQypKdQLaKyJWhc/iZn1zA/BiC+KbyuEb28QVeOulOmFvbUxPbd8MM+Vxfne8Y5494a4QtdCw3FQ==
X-Received: by 2002:a4a:b489:: with SMTP id b9mr2193705ooo.71.1586888864743;
 Tue, 14 Apr 2020 11:27:44 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k4sm5681554otl.13.2020.04.14.11.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 11:27:43 -0700 (PDT)
Received: (nullmailer pid 22415 invoked by uid 1000);
 Tue, 14 Apr 2020 18:27:42 -0000
Date: Tue, 14 Apr 2020 13:27:42 -0500
From: Rob Herring <robh@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 08/36] dt-bindings: display: convert ilitek,ili9881c
 to DT Schema
Message-ID: <20200414182742.GA22348@bogus>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-9-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408195109.32692-9-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Apr 2020 21:50:41 +0200, Sam Ravnborg wrote:
> Updating this binding identified an issue in the example in
> the allwinner,sun6i-a31-mipi-dsi binding.
> Fix the example so no new warnings are introduced.
> 
> v2:
>   - fix example in allwinner,sun6i-a31-mipi-dsi (Rob)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../display/allwinner,sun6i-a31-mipi-dsi.yaml |  2 +-
>  .../display/panel/ilitek,ili9881c.txt         | 20 --------
>  .../display/panel/ilitek,ili9881c.yaml        | 50 +++++++++++++++++++
>  3 files changed, 51 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
