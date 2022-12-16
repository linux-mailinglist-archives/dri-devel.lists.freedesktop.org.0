Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAFA64EAFB
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 12:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370310E5B8;
	Fri, 16 Dec 2022 11:54:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CC9F10E5B6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 11:54:45 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id x2so2030930plb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Dec 2022 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=huBK4pnPcMP3Dp4b4dISUFK+uPQVK//uEsObVOml/Uc=;
 b=QTP29AkHxsG5GSKYkWpFwsC5fOf4xFvn3wW8y+kEuyHZJNamVYi2usy9bVb0pEgu8E
 z4KZ1CNyHxOm5bPxmZpmo8LXzOobBv1tAxwcauY7RVIXPl5AhjI84boE1lq2CY+iJNtN
 Tg0A8g3YMmjmd2IDwXoVI70OygYT/Frc1AEQGLRqLda4la8SgmLGApLPoXyZcA8hlEbb
 ij+MDpmBsdyA8Q5WcAZj71OF4HyElUVMh3kBn7eIdRdjUlS17qowoAGlkG7dneMl0x3l
 vL59EGs8xSlatEPr568EuD3dety8lyZby4Q4E55+9HYKR7kEjGHu3TFO4VaSD9T9G1e/
 gt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=huBK4pnPcMP3Dp4b4dISUFK+uPQVK//uEsObVOml/Uc=;
 b=Ol+fD1ArtKTeT1iIc81+UuRxWMqhepRLqjU02fVaFet2BLe1chIkAgPsXXHsT4pl+u
 7isH4G8fGuLcc3Qcu8cZUVgYQIHUf+kuZPgwXYtbadOckfiy7xc0KJ3jj2ZOO2x5AMc0
 TlS7xUAiqxk4UfXlobT6pt0qE3M0093QFbwsKS+n5sfV8PahKDbXeDZvbkusWT1jLhAA
 RT8p8P20C6mDb8lvhmX06J41c865bKYmki3B3mGaWKdvsHwSNtjj/1504AJEDN6kOHPC
 WOFdy6USzR+30kO914wN+VN9gA5l/0sIfxUlLdueQcWRsCdRqAZOIQnJ2G0mthptQwcR
 af8Q==
X-Gm-Message-State: AFqh2kqrNHN0ipNBiw3964Hy+ZJ7LNEGmw3UM+g5lALexytAwE6rkQqy
 B9tTF6e3ZVoc4JoN8gjZk/aJhCIp4KJ556xB3Ho=
X-Google-Smtp-Source: AMrXdXvj6Ryf3QQAw27R0vIE+ZuX7E/vL5TuSWVcIglmRZdoXpJN+Ko9oKG200+cTpUQSLpI80ZgKJ9j0qKcfzlKJyI=
X-Received: by 2002:a17:90a:46c9:b0:219:c691:9933 with SMTP id
 x9-20020a17090a46c900b00219c6919933mr599041pjg.195.1671191683929; Fri, 16 Dec
 2022 03:54:43 -0800 (PST)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Dec 2022 08:54:26 -0300
Message-ID: <CAOMZO5Ba5eNCQO9GQezbEO5RX=C7EpUSz1zjO78Ki0kD3aK2uw@mail.gmail.com>
Subject: Driver for CFAF240320X0-020T display
To: noralf@tronnes.org, Sam Ravnborg <sam@ravnborg.org>, 
 Oliver Graute <oliver.graute@kococonnector.com>,
 Maxime Ripard <mripard@kernel.org>, damien.lemoal@wdc.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Does anyone know if the Crystalfontz CFAF240320X0-020T display is
supported in Linux?

https://www.crystalfontz.com/product/cfaf240320x0020t-2inch-240x320-color-tft

It uses a Sitronix ST7789V controller.

For the ST7789V, there is a drm driver:
drivers/gpu/drm/panel/panel-sitronix-st7789v.c

and also an fbtft one:
drivers/staging/fbtft/fb_st7789v.c

Documentation/devicetree/bindings/display/panel/sitronix,st7789v.yaml
shows a remote-endpoint property, so I assume this only works when st7789v
is connected via RGB parallel, correct?

On my board, the CFAF240320X0-020T is connected via SPI only, so I
guess I should try the fbtdt driver?

The arch/riscv/boot/dts/canaan/sipeed_maix_* boards use compatible =
"sitronix,st7789v"

Do these boards have st7789v functional? Are they using the fbtft or drm
driver?

Appreciate any suggestions.

Thanks,

Fabio Estevam
