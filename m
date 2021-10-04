Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098D42157B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 19:50:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACCAD6EA77;
	Mon,  4 Oct 2021 17:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBBB6EA77
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 17:50:25 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id w206so22691443oiw.4
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 10:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nExK0Sv28mbDB3Mt1OQhUPXvDIcix9XdHS0KQ339UaA=;
 b=Uuu7HEGnxjkNyKvPTNJJu276ZMWF4HjfpDtjkpKBbbmgLmzlMoo6mIdudCuvcj44R8
 59pfFe5AhGcIA11YwJ9ECynWpAwsyaUN4SY7fus0abyr+Hx4LtbX9THXzJT9NUPqd0g9
 eglg5Jwy/PfUSHbhiMyTXSQS4dxuZAKIH9mTqw4L8Jfk21x50O9ASoGP4YDUat5VYh0o
 ys5sbWNCexqfV38Zv5/Ys0ZW9wxrInMWdTbhxRmHVK2rmQ7oHusdzDVYxEOArQK6WlNH
 g3MyksvrNc5RlKS2gPDk4+BqsxvQjvbhiYguDXS1l6BU2/XRMZqj4/ckGgYQc8GP4uMz
 zhqA==
X-Gm-Message-State: AOAM531ezeC2ssnxrcqWhDOz4ACel7zcq/WXlaBnFoSVTSy9T5NGdrB0
 sU4wjkrKCnjkUOspeRaUPCumb8Deiw==
X-Google-Smtp-Source: ABdhPJxMQm9vu5rBQQ5RoKlPfiDHh/XfWflRLqQTnEdgqzQ6yZh5clCu6/D1ptFLE2757iK4ibZG7g==
X-Received: by 2002:aca:604:: with SMTP id 4mr14070540oig.8.1633369824777;
 Mon, 04 Oct 2021 10:50:24 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id p18sm3105444otk.7.2021.10.04.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:50:23 -0700 (PDT)
Received: (nullmailer pid 1551421 invoked by uid 1000);
 Mon, 04 Oct 2021 17:50:22 -0000
Date: Mon, 4 Oct 2021 12:50:22 -0500
From: Rob Herring <robh@kernel.org>
To: Justin Chen <justinpopo6@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Doug Berger <opendmb@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linaro-mm-sig@lists.linaro.org, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Michael Chan <michael.chan@broadcom.com>
Subject: Re: [PATCH net-next 2/5] dt-bindings: net: brcm,unimac-mdio: Add
 asp-v2.0
Message-ID: <YVs+3mfImSGq9ww9@robh.at.kernel.org>
References: <1632519891-26510-1-git-send-email-justinpopo6@gmail.com>
 <1632519891-26510-3-git-send-email-justinpopo6@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1632519891-26510-3-git-send-email-justinpopo6@gmail.com>
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

On Fri, 24 Sep 2021 14:44:48 -0700, Justin Chen wrote:
> The ASP 2.0 Ethernet controller uses a brcm unimac.
> 
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  Documentation/devicetree/bindings/net/brcm,unimac-mdio.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
