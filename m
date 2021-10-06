Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18262424893
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 23:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F8D36EE82;
	Wed,  6 Oct 2021 21:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1464D6EE82
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 21:11:47 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so4924380otj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 14:11:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TMbBbaTkeRvCJm9ZSb70KRzbl0JkE0P9uF9VW3nfCtQ=;
 b=B47ULTYf54uq0e7vndElBUZEfV7aQdQcbTwepC7qeKUThkX1xsEohSCiY0hs0RxDzl
 ELBCIN9mSax3zrlBCeQNe01HevlL/FF7ZpJNWSt/uBA0PsmXdRpuTwSmNmNTRiVNZWVK
 qbYUz/wvmljbD92OhPjYibPeYnjfmFi5oARH3vP1ZNhGKdVr4Ej8cZvoVQdee+PejZ0x
 ENzuj5d+gbFp/KNx3KT2oTwyLgOOb5svS3nkqA11tBTH+QucMKN5lDzatay1wRBkIZPJ
 VF12AQLVHSSE3Ea0pkwdeUhdi4Wc4VDJBhl2/ctwFVjJJoPOGS0zwCCgGx6atEQRH+Gj
 EKLw==
X-Gm-Message-State: AOAM532//otXY6mpUo21d/B7sc9gluj89Gko3vRXZvQeIFrEAWNU4In9
 y1f96alV2yXt2ZIk+4YhFg==
X-Google-Smtp-Source: ABdhPJysTlpXIwh+eH0MNk3KRrWFzHG9RUfNxtyx3upahYuQW6NDt0Jb1U1HAxVzlGHOIU8B9ArvBA==
X-Received: by 2002:a9d:7410:: with SMTP id n16mr417037otk.71.1633554706283;
 Wed, 06 Oct 2021 14:11:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id bl23sm2552476oib.40.2021.10.06.14.11.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 14:11:45 -0700 (PDT)
Received: (nullmailer pid 2882794 invoked by uid 1000);
 Wed, 06 Oct 2021 21:11:44 -0000
Date: Wed, 6 Oct 2021 16:11:44 -0500
From: Rob Herring <robh@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: display: simple: add Innolux
 G070Y2-T02 panel
Message-ID: <YV4REJzcUezYmAMN@robh.at.kernel.org>
References: <20210930100501.15690-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930100501.15690-1-o.rempel@pengutronix.de>
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

On Thu, 30 Sep 2021 12:04:59 +0200, Oleksij Rempel wrote:
> Add binding for the Innolux G070Y2-T02 panel. It is 7" WVGA (800x480)
> TFT LCD panel with TTL interface and a backlight unit.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
