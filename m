Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5939557D411
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 21:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A64A18A9F9;
	Thu, 21 Jul 2022 19:23:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5E818A508
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 19:23:48 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id u20so2107962iob.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:23:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/TlTuh9GJgQKdQdbhy7UptGxxLX8hx6KcJUZFCAATpA=;
 b=7OEbgH18Q8M4o/LcHnRHl34dyCI8gQxejLIQJtnvJC+BYHuqp9a1UcSsr519c+AJN8
 evwx+NKQJIbEw5g/oh3Bu7MCCr5Je4VJbu2R0F8TSR9VFkABm1iUnN1FLhuEr+TtAK9w
 2Q2RtDkr7Xnk7qM31dnPuRIyh/OKzuw6EfL5Nr+7y3wZ6tVmd3LjozlNakHORQqGWAUU
 g4tzA40hP65LdQ00gpS+AuxLu1INjwT6RHBcyQNvD+xmBhodDx5QPzontxv6DxVkbokG
 zL7k4sEG4To4fB6mdXNtq7k1VZNGjqzzdStYjPGncBgQzQSP9xnfIf7E3uF0JX2+BVsX
 yU1Q==
X-Gm-Message-State: AJIora8S/c6wH8FF0Cm8ACskt4mB7gUQPx19C4URbGO1NfJk/FgU09mu
 DcY5FEJ+aMYPgZ8io/QXyw==
X-Google-Smtp-Source: AGRyM1v/2SIconk1vJlvwhmeezGHMoj7yuHsypltVnitbAzNuKCf+hL+v5b0iW7vpgjNPgbcN3o95g==
X-Received: by 2002:a05:6638:138f:b0:341:4711:4c2c with SMTP id
 w15-20020a056638138f00b0034147114c2cmr37837jad.178.1658431427322; 
 Thu, 21 Jul 2022 12:23:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a92cb88000000b002dcff50b2b8sm1006727ilo.7.2022.07.21.12.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 12:23:46 -0700 (PDT)
Received: (nullmailer pid 1783215 invoked by uid 1000);
 Thu, 21 Jul 2022 19:23:45 -0000
Date: Thu, 21 Jul 2022 13:23:45 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: add Densitron
Message-ID: <20220721192345.GA1783152-robh@kernel.org>
References: <20220721030327.210950-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220721030327.210950-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robert.foss@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jul 2022 05:03:27 +0200, Marek Vasut wrote:
> Densitron is a manufacturer of LCD panels.
> https://www.densitron.com
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Guido Günther <agx@sigxcpu.org>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
