Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4DC146356
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5184A6FB33;
	Thu, 23 Jan 2020 08:20:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2EF6F8FB
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 21:33:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 20so260211wmj.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 13:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OTrm6LuWBv0/YMwbvKMuzQhWw/6VZQ9ZG3P7VHtMSIM=;
 b=c8tRf39ItktteljlT7FffnkYsvYDcI3IWBP5NTaHeuHGtVSiq0+WtrLuXXwhJ7XO+/
 XrTJS1n2lXBbVf3mqnyU384R7EQ+EEIutQ3xW3jJl5CtSJymUsYpZLwpoA6hg3xcR+7k
 Oiuhc6IlsNrPcXI3E2M2agxAL0pINtAxE+/YR+RqvFQ4m8jJxCuMyV4nI1F2dM9OGMGl
 TZoS/oh/TluL+ktbijLrQUIpv6qoH5xo9fxvPXH/tsaeTWTm/GP3PrnNaEj6Xrk2LGb6
 9FMrjVgKibs/aepnfx2PXy4k1a9c8QsDoFk+gZhis52So9b42QrMAGu6Js9SgmXxHbOg
 kB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OTrm6LuWBv0/YMwbvKMuzQhWw/6VZQ9ZG3P7VHtMSIM=;
 b=SEj6XKhFlsH4/IXIWAhcjyjJ6wLks5D5p+Pz2HI6pgTkidwclXk3fzNZLKErciZIls
 HZv0bEh9k2qssS1zvCP6Q/LkRVhxihN3PEKNcll+ySAH0HS6rq5SKb73wsUQSGqXRP6V
 pIwxslFcs5oMikKC1ivAme0pp+ZXASivzHGwUBw/8G7X1kfmUeTIiq3vBjxddix+m6Z0
 Yk8/AxTqbIVFbudqMkDzyWw+r2ypzBxpzhmDpM94f8RNxGZ0VygkVw7lY3FID3XJoDkb
 obuLi8Mr1hvdGAsxpSxvu2lxMFF1o2K85ATg92g647gPq41p5YAsFGCt+fW3O/6agA9E
 DOog==
X-Gm-Message-State: APjAAAUqdxBbA4QRLzUa19oCsjp1y2A6JD9Iu66N8o3bLDieiMQO/E3P
 yIDdQRiz7dpOHGlWJKIMfP4=
X-Google-Smtp-Source: APXvYqxiiA4W87BxO4EFj0stiKNv0mHUYQt1b7kZwMG05Ed7bQdYgKtENWWyzCRoWwH343smsudGbQ==
X-Received: by 2002:a1c:3906:: with SMTP id g6mr206005wma.49.1579728828617;
 Wed, 22 Jan 2020 13:33:48 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id w8sm6474630wmd.2.2020.01.22.13.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 13:33:48 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/3] mtd: rawnand: brcmnand: Add support for flash-edu for
 dma transfers
Date: Wed, 22 Jan 2020 16:33:10 -0500
Message-Id: <20200122213313.35820-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 23 Jan 2020 08:19:47 +0000
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
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Paul Burton <paulburton@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linaro-mm-sig@lists.linaro.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 James Hogan <jhogan@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2 Changes:
Refactored drivers/mtd/nand/raw/brcmnand/brcmnand.c  based on initial review comments 

V3 Changes :
No change ignore this patch set 

V4 changes :
- Included cover letter to resend the patch set 
 .../devicetree/bindings/mtd/brcm,brcmnand.txt - Added Reviewed-by tag
 arch/mips/boot/dts/brcm/bcm7425.dtsi          - Added Reviwed-by, Acked-by tag
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      - refactored code based on V2 review changes 

Kamal Dasu (3):
  dt: bindings: brcmnand: Add support for flash-edu
  arch: mips: brcm: Add 7425 flash-edu support
  mtd: rawnand: brcmnand: Add support for flash-edu for dma transfers

 .../devicetree/bindings/mtd/brcm,brcmnand.txt |  10 +-
 arch/mips/boot/dts/brcm/bcm7425.dtsi          |   4 +-
 drivers/mtd/nand/raw/brcmnand/brcmnand.c      | 293 +++++++++++++++++-
 3 files changed, 294 insertions(+), 13 deletions(-)

-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
