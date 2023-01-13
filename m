Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF1669BC2
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5C810E1F2;
	Fri, 13 Jan 2023 15:18:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B56C10EA22
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:18:56 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id s124so1122067oif.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 07:18:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ieDDnBbNB9JJsaMwpNzXJlERKk1wwpqLtOrBhJRfGpo=;
 b=CEcbkEU20l9RvxUPQ3eJlqh+qvKhH09uOkvzMa9OnpsARXM2TLKwgDNPiZTPVHFxBi
 7EXxpLpXEleD+ZKRg5QkXDkaFzD+7wM9X9SC3MPIdiyY9PhdJAve54xp4jyKvUg0A/no
 puGKrV0jV1xy8vvI1PZkpqkMcfDHCYM2l7W/GZiNUpUNnxQ4jLDnSBewm1YrRQAbmDs+
 OJfGih7FlXpIGIBq/Tz2RcrgghU99Ls4YgisYc4jbWI2wrNzu28ygykrGC5S+XFr6Nit
 3kKoCyMBJbdf6ZpL8g4q2MKQwRoIfoDa8WfxKY7nO/afh+PHQz6lwS+XJbE+D8hmEYX5
 7V2w==
X-Gm-Message-State: AFqh2krUNLNHAHngYTG99A8CgnOV32vebVNmxVpLaeOEBtooXiy/8P5H
 tAekeflGofTKyDBoq7sVKQ==
X-Google-Smtp-Source: AMrXdXvKjUuXqtnMP8HRUWF6KklExF2oSAG2rWu9CjnEqT3LUV2kOArvIgWmH2DzIBq+esFLR8R2ag==
X-Received: by 2002:a05:6808:996:b0:364:c003:e1ba with SMTP id
 a22-20020a056808099600b00364c003e1bamr517132oic.46.1673623135307; 
 Fri, 13 Jan 2023 07:18:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 w11-20020a0568080d4b00b0035c422bb303sm9298016oik.19.2023.01.13.07.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 07:18:54 -0800 (PST)
Received: (nullmailer pid 2206759 invoked by uid 1000);
 Fri, 13 Jan 2023 15:18:53 -0000
Date: Fri, 13 Jan 2023 09:18:53 -0600
From: Rob Herring <robh@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: remove arch/sh
Message-ID: <20230113151853.GA2184281-robh@kernel.org>
References: <20230113062339.1909087-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113062339.1909087-1-hch@lst.de>
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arch@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-gpio@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, linux-rtc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 13, 2023 at 07:23:17AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> arch/sh has been a long drag because it supports a lot of SOCs, and most
> of them haven't even been converted to device tree infrastructure.  These
> SOCs are generally obsolete as well, and all of the support has been barely
> maintained for almost 10 years, and not at all for more than 1 year.
> 
> Drop arch/sh and everything that depends on it.
> 
> Diffstat:
>  Documentation/sh/booting.rst                             |   12 
>  Documentation/sh/features.rst                            |    3 
>  Documentation/sh/index.rst                               |   56 
>  Documentation/sh/new-machine.rst                         |  277 -
>  Documentation/sh/register-banks.rst                      |   40 

Can you please also remove:

Documentation/devicetree/bindings/mtd/flctl-nand.txt
Documentation/devicetree/bindings/interrupt-controller/jcore,aic.txt
Documentation/devicetree/bindings/spi/jcore,spi.txt
Documentation/devicetree/bindings/timer/jcore,pit.txt

Rob
