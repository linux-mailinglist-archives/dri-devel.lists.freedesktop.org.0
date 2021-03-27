Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 571F734B848
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 17:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9F76E243;
	Sat, 27 Mar 2021 16:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1C6E243
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 16:42:43 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 y19-20020a0568301d93b02901b9f88a238eso8188796oti.11
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Mar 2021 09:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Adu3Op/lND4oC5P4MkNjHnwnlBxB8vPxviuUDes9aI=;
 b=DFxnIJwmyo0Rg48LHsoTFmJJJD/t1LdTb9g6GxptbFvfFcppi9F50FrB2ejEqTXrA2
 aQK4wb4x/fHlq47aSMlfOJVAQZ5rD2hCRwe8LQzur8NYEcFm9NzTdOfvwl4THZ0pIf6u
 ZTHiSpgy7snQG4AhdCpVbkgJWJGyqimBwvvCdN1ymU3XWJCWVq/5w8vcybL/Bvsr2OH1
 iLN/rwrZQkPLRz5M78EE3cEspCyQ/eHNC7s12gdfwn38WM3EWrgvzHaS4jE1YwYvb1A+
 pRj/SR2cm5jAM0YCC1bXYQDI/03u1O9RuVp457dsxqAW5C0Zo2QJouTNiQiLCQlyLbbR
 VAHQ==
X-Gm-Message-State: AOAM533QYdrpi9dPwUzzbBwor5upT2998s4r6O9eH4G6Oi19jPC1sb35
 4Lsv7TyLCvuJFvp8fAPjUw==
X-Google-Smtp-Source: ABdhPJxeQIDE4oB/aMKotfQ5MCqdfzWm41e7k0pkVPSry+xOdIxVkeNOaaIsWRPXbRcaRGLKgHA6Iw==
X-Received: by 2002:a9d:3a4a:: with SMTP id j68mr16230064otc.4.1616863362965; 
 Sat, 27 Mar 2021 09:42:42 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.140])
 by smtp.gmail.com with ESMTPSA id w7sm2868319ote.52.2021.03.27.09.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Mar 2021 09:42:42 -0700 (PDT)
Received: (nullmailer pid 220138 invoked by uid 1000);
 Sat, 27 Mar 2021 16:42:39 -0000
Date: Sat, 27 Mar 2021 10:42:39 -0600
From: Rob Herring <robh@kernel.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 01/11] dt-bindings: drm/bridge: ti-sn65dsi8: Make
 enable GPIO optional
Message-ID: <20210327164239.GA220109@robh.at.kernel.org>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322030128.2283-2-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 Mar 2021 05:01:18 +0200, Laurent Pinchart wrote:
> The SN65DSI86 EN pin can be hardwired to a high level, or connected to a
> global reset signal, not controllable by the kernel. Make it optional in
> those cases.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml         | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
