Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539411304AB
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 22:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FF96E055;
	Sat,  4 Jan 2020 21:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D156E055
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 21:29:45 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n21so43192915ioo.10
 for <dri-devel@lists.freedesktop.org>; Sat, 04 Jan 2020 13:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O4H4SgxYFF1sZ0FF/6Ems4wMDN7ra7/R/gc5/aNjkHc=;
 b=CHGNBpS4U+bAWAb5YCvFFISg0GTQKCVIL2QYW1Sgd6Y0VrRI/SERble9aSDnYG1JJ+
 vNZtyi+ZIt3nplCcIKxoXXLjFZHd0SzJ7ISmreAz44JzqaTtTEX6fCMInEmohC7CLdBJ
 pcDoGkcYxEKH8QKsoBLUebnpOTsLi5bQrcNsmd8sWRdb0vTOIXvFIQTB8hZlEvUV8THJ
 OXwdn7ujnF17CMPDnQfwk0y1SskVBQKfpvf7c75wGRwZVtsisCAxzlFwoQm8pCa1IKDZ
 0B97s6VdixTPt3E5EhIhR/qetF8przS3+bnAts90LPYfDYO7eGwyirVqLxWGNnNapQW0
 sucA==
X-Gm-Message-State: APjAAAVsxP6Wv7R4KGwVMKzeL669M8AGvgw836ddbvByImWcQETtB9tl
 ZZay9T64fakhwNGSrakdOdKJOBE=
X-Google-Smtp-Source: APXvYqxopQElbi0Yb5UbBki1savmI9/gM76wwlmODR2TwFu/MHtIl60gGxl/3qaqvWPUZXxJt+caIQ==
X-Received: by 2002:a6b:b48d:: with SMTP id
 d135mr60656525iof.280.1578173384055; 
 Sat, 04 Jan 2020 13:29:44 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id h3sm22121720ilh.6.2020.01.04.13.29.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2020 13:29:43 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2219ec
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Sat, 04 Jan 2020 14:29:42 -0700
Date: Sat, 4 Jan 2020 14:29:42 -0700
From: Rob Herring <robh@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: display: rockchip-lvds: Document
 PX30 PHY
Message-ID: <20200104212942.GA18654@bogus>
References: <20191224143900.23567-1-miquel.raynal@bootlin.com>
 <20191224143900.23567-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191224143900.23567-3-miquel.raynal@bootlin.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Dec 2019 15:38:51 +0100, Miquel Raynal wrote:
> PX30 SoCs use a single PHY shared by two display pipelines: MIPI DSI
> and LVDS. In the case of the LVDS IP, document the possibility to fill
> a PHY handle.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/display/rockchip/rockchip-lvds.txt     | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
