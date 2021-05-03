Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8337220E
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 22:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3BA6E8FA;
	Mon,  3 May 2021 20:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCB46E8FA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 20:53:02 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 g4-20020a9d6b040000b029029debbbb3ecso6346713otp.7
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 13:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f8RDeY6rU/O7UGBkZst+Pj0wnhGP4S/ZmW7eY0KJBR4=;
 b=NbUbT3Pzaj7j6lOmOVf9jT8OJQAWKpV+5yZRL+8mTi2d0NWwV0kBI7vvJWZD0gEx8X
 nn81sPUIdtxM/W+HuSdlNOfacqH7v8uZLtmKD1/7VySxT8Qx308x5Foo0v5AiV2oBBuK
 Pm5ynwucU5byFgF8JLuML7wW2LMg47RHi3/74t77NWk3ZmmPewnGQIWepPT5MEG8UJlP
 6fjAqtXQX4Q2qLOr+Sz+GL8WTU5YBqaS+kLAYf4+qjk/n4fVzrKDBFOmv88PCw6jNecY
 2TuMBJam4N4DKW/CPyX+XAJ/i6uzE1+/p1BzEAuKq56HMFj1K7DS8Zml0nUqA9rD1X8v
 z8lA==
X-Gm-Message-State: AOAM5307vn6ouP4FGAb8si+HzQ4dXhMFqLA1xQtXeN0CfjGJ7I94xgKP
 LB1/IKLs3zEa4zMLn8TOtw==
X-Google-Smtp-Source: ABdhPJyYx+D8CXse8tsdmIgX0/OVAOGsEQfvIZJ8AUeEtlp4tZwUkm+8LzFXK2YD1AMNdOTB6ObF9A==
X-Received: by 2002:a9d:b87:: with SMTP id 7mr16356866oth.107.1620075181880;
 Mon, 03 May 2021 13:53:01 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z9sm230382otj.44.2021.05.03.13.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 13:53:01 -0700 (PDT)
Received: (nullmailer pid 2380104 invoked by uid 1000);
 Mon, 03 May 2021 20:53:00 -0000
Date: Mon, 3 May 2021 15:53:00 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] dt-bindings: display: renesas, du: Add missing
 power-domains property
Message-ID: <20210503205300.GA2379757@robh.at.kernel.org>
References: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <600d42256515f180bc84b72e8bdb5c5d9126ab62.1619700459.git.geert+renesas@glider.be>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 29 Apr 2021 14:47:56 +0200, Geert Uytterhoeven wrote:
> "make dtbs_check" complains:
> 
>     arch/arm/boot/dts/r8a7779-marzen.dt.yaml: display@fff80000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77970-v3msk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77970-eagle.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77980-condor.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
>     arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dt.yaml: display@feb00000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the power-domains property.
> 
> Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
