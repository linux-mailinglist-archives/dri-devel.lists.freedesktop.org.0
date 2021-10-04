Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9A042158A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 19:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99C36EA74;
	Mon,  4 Oct 2021 17:51:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6AB6EA74
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 17:51:25 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id a3so22686790oid.6
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 10:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3vWwFoLU/AV3mlTHht+MMyQ5jmWKT/p5IFY/3H+BlVc=;
 b=sa3M9rzIFzqs0twjYHRLyMBwnHphdilyYWB/tE9I6/xnA8ve8wBr1MffaNEx96EYgL
 QNuNiCUOlMMdUFLANkNLW1a2penRRuNi/wdeDatowKHWY9rh7eGvdzPHon+eSJCnhrYm
 KLyTnmJs882MwQ1kTn52qHpgbJ0zUzlr4FT0Zk0X+PIznpNMTzpZPOpd6k5Uv9v+sSKW
 77ErD9U6JwLlK0dUOV4E094jz724lAiwLUc7Sv+KzzzJkkPcRvus/nRfQE4lYZTIDqHs
 7mzHHCzGxYEzsRgUJauygj4nJLjLLqSN3uvIh0VQYvzgTaE1sCsllRfjhm2jtpNGuq4J
 3HdA==
X-Gm-Message-State: AOAM532tXEmKu5Al00nUHWJ51wBfxAQEUOcebvGuCDEtHK0O35BuKFAT
 z18Pq9lAGkzgeAhl8HS6jCGgdse4Ww==
X-Google-Smtp-Source: ABdhPJya8ioCqBxAIdwFPEEysr8oQqLtz2mjK5uD+nxi59pFeB2kP5iwanEEqI6Hgjd2nBGMq4h/5g==
X-Received: by 2002:aca:ebd5:: with SMTP id j204mr14247424oih.14.1633369884850; 
 Mon, 04 Oct 2021 10:51:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bd24sm3029117oib.52.2021.10.04.10.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:51:24 -0700 (PDT)
Received: (nullmailer pid 1553251 invoked by uid 1000);
 Mon, 04 Oct 2021 17:51:23 -0000
Date: Mon, 4 Oct 2021 12:51:23 -0500
From: Rob Herring <robh@kernel.org>
To: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, sam@ravnborg.org, y.oudjana@protonmail.com,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 thierry.reding@gmail.com
Subject: Re: [PATCH 2/2] dt-bindings: panel-simple-dsi: add JDI R63452 panel
 bindings
Message-ID: <YVs/G9T6Jw7Y1AWn@robh.at.kernel.org>
References: <20210925103135.518443-1-raffaele.tranquillini@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210925103135.518443-1-raffaele.tranquillini@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Sep 2021 12:31:33 +0200, Raffaele Tranquillini wrote:
> This add the bindings for the JDI FHD_R63452 1080x1920 5.2" LCD DSI
>  panel used on the Xiaomi Mi 5 smartphone.
> 
> Signed-off-by: Raffaele Tranquillini <raffaele.tranquillini@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
