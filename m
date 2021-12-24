Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D647ED1E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2216E10E3FA;
	Fri, 24 Dec 2021 08:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45C1010E3EB
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 05:23:41 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bq20so16913036lfb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 21:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hqZ/4rm/mROQ5eziTAE/Z4BmR3YKmyI30tkx1zQHhg=;
 b=2KUMOPpdDIL7E1pp7ENF81+xjGCtKbQa4Q9uc17QZHXo2/K2UNLqbtuOz2Vd5r4L9q
 JhtZGM6fyB7UtuH7a3rugxV7y5ynPe729CltDoYASuHqfsGAnNcNxBj/ncFfj70THD2M
 nIPR1C7CZJWB8HsW1AaAZAEGtu60OS/bwvt0Zi8wrwu/ZHMbSOJVk0HsOP0H/HnkcBbg
 oyuFXK+8MzomeVOnY0nQM9QcRJcNe4Nck1S+MXGJa7qV+bL8qpOw4Lrvf6kCaDGliXn7
 g/WkltahELXil0G/hE6hTYQ18x03rpT75nbXnj1kZAA1sJjPlKjSFlLodOtTgC7bx8wC
 9icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3hqZ/4rm/mROQ5eziTAE/Z4BmR3YKmyI30tkx1zQHhg=;
 b=BZMGN6UNBqdCHs6s6Yhfu3WFcWDJt6Ee5aWOJ7Je8w6q6W6zsNsUJYZwCOp3NrcgbN
 KKWaV3HVYV+jNGlJCRpOFWa5SGuL0k74AGJy4rIr3yjcUlMuQepDTRcazqE4II/J5uXC
 0QDXpvlp6JA1uiVWWjRB7pmFbfATqoPWy4FqbqL7cdfODsNz3cInIH/TrSTxoZXy2h5V
 b1NqdOoxM/QrFOMW7mW6v7at5hgO7Tnb6MVZCGOLo7/zJWyB/HAGLu1as7jr+49Vck7C
 1JQPMn3h+VBum6+Mhdz8hXYCoigg8VL9z44Hi4ZTI8zAkh7gn5v872Ro8hZu7nzzHGfX
 sVBA==
X-Gm-Message-State: AOAM5335gPkXg7g2I7iYnPkmOY5R4oVCVk+jmyA3KqeFvIuFoxNP6z6V
 tLBr4X9k7R2YaebWoBnpqYmuAQ==
X-Google-Smtp-Source: ABdhPJxLPn8Kg5/Hzg/ID38WBqGzyJktOBSpOmtsdh61RiMMcDifHNhHMdly1GBALg693nCfUxU0fw==
X-Received: by 2002:a05:6512:22d6:: with SMTP id
 g22mr4214072lfu.199.1640323419570; 
 Thu, 23 Dec 2021 21:23:39 -0800 (PST)
Received: from cobook.home (nikaet.starlink.ru. [94.141.168.29])
 by smtp.gmail.com with ESMTPSA id e13sm702858lfs.306.2021.12.23.21.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 21:23:39 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] add R-Car M3-W+ (r8a99761) LVDS encoder support
Date: Fri, 24 Dec 2021 08:23:06 +0300
Message-Id: <20211224052309.1997096-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds support for the LVDS encoder inside R-Car M3-W+ SoC.
Hardware is the same as on other R-Car Gen-3 chips.

Nikita Yushchenko (3):
  drm: rcar-du: lvds: Add r8a77961 support
  arm64: dts: renesas: r8a77961: Add lvds0 device node
  dt-bindings: display: bridge: renesas,lvds: Document r8a77961 bindings

 .../bindings/display/bridge/renesas,lvds.yaml |  1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi     | 27 +++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
 3 files changed, 29 insertions(+)

-- 
2.30.2

