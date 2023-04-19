Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B961E6E705E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 02:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2971210E82E;
	Wed, 19 Apr 2023 00:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F225A10E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 00:19:57 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-555bc7f6746so35882747b3.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 17:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681863597; x=1684455597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLuO0FT5ni9AWAkx5yPjYHqfEIyb0XFRqoQb1KsSeWo=;
 b=S8BVArrwZ18B3H56hONoNjBqSY2GxUdofcqWqzJDOYmkUDgGj9IW9Fss+xIx24ZCkH
 rWKWKRmOLpsNysUka+G3yQGMXlun/SmG15M859txABUKhY436kINzZCjVnYWXCndLvM4
 8KHJOYNMZqXDxbtjVZZM4j1GHgZRjuLWqaGnqf9DY6jWHCfIOcFQ0TWDGxJ4w2OBlCG9
 +JSdnkA9SIGgRIB5iqkgxNZ8A6iA/rheFVlWl6EFk9RcFCmKMMxW30OA4WDvr6Rym5YX
 IJCZboifMX1RPOAQv9vwqjSmJmFipGblaFwRTXNZ/3pg3QqIN44HhZanluq4/gRMiX6b
 fR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681863597; x=1684455597;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vLuO0FT5ni9AWAkx5yPjYHqfEIyb0XFRqoQb1KsSeWo=;
 b=XBkPC+mHfrnpRhxO50aueoeKhc6sMyNOz7GJCqa6hVJY3HR2rkDRpzDvRtdMonEhJ0
 adS5Meivm3W6TYDoSfVK1ZOGwmGf7+PW4n1nyxEbhE/nysPPW5W473OIlRkPJLw/bmzA
 hd4+FqZ1TdDN82PxGKdJ/nVlYY9cjAt3JAe7HHuhPHNd+N8G+e/jhT3VO4FNF6KF1AhG
 kyrjXRzPYxWLAfvsmJhEbonR3kL/B9vzc5l+pqwS+kCrvCL4hVCpnOwsgj6hMiJ5Uxyq
 F6iiRJ1AOSNL3bx+KZZkIiFEXK0nzchHAOQm/Ldpv9RXY68KUokeXsTWDfHkOYtt4D9n
 9QtA==
X-Gm-Message-State: AAQBX9cW5b/F3dIiF5PfySQ09jNsw//b+LH84bmI2myXBe1Tn1h3p/bb
 twEsCCFixJUI2420ItkEiWm7LHsL1hXGt5re7AU=
X-Google-Smtp-Source: AKy350acuABH35eqRI4cUGE5NLDSP0MyKmWLUWy3oJ4G7KYUoSorueyUHRaoZPEgopF3hbuWqZbe4hQVaXr24b3Qtd0=
X-Received: by 2002:a81:17d0:0:b0:552:ae41:50a2 with SMTP id
 199-20020a8117d0000000b00552ae4150a2mr693540ywx.21.1681863596964; Tue, 18 Apr
 2023 17:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
In-Reply-To: <1681863018-28006-1-git-send-email-justinpopo6@gmail.com>
From: Justin Chen <justinpopo6@gmail.com>
Date: Tue, 18 Apr 2023 17:19:46 -0700
Message-ID: <CAJx26kUvry0pTKmuqmt4ZK+wFg9-bWpi871jsUJWmVBRw1wuEA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/6] Brcm ASP 2.0 Ethernet controller
To: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 bcm-kernel-feedback-list@broadcom.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 18, 2023 at 5:10=E2=80=AFPM Justin Chen <justinpopo6@gmail.com>=
 wrote:
>
> From: Justin Chen <justin.chen@broadcom.com>
Woops, looks like I screwed up on some of my email addresses in the
patch set. Will fix in v2 after first round of reviews.

Justin
>
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165.
>
> Add support for 74165 10/100 integrated Ethernet PHY which also uses
> the ASP 2.0 Ethernet controller.
>
> Florian Fainelli (2):
>   dt-bindings: net: Brcm ASP 2.0 Ethernet controller
>   net: phy: bcm7xxx: Add EPHY entry for 74165
>
> Justin Chen (4):
>   dt-bindings: net: brcm,unimac-mdio: Add asp-v2.0
>   net: bcmasp: Add support for ASP2.0 Ethernet controller
>   net: phy: mdio-bcm-unimac: Add asp v2.0 support
>   MAINTAINERS: ASP 2.0 Ethernet driver maintainers
>
>  .../devicetree/bindings/net/brcm,asp-v2.0.yaml     |  146 ++
>  .../devicetree/bindings/net/brcm,unimac-mdio.yaml  |    2 +
>  MAINTAINERS                                        |    9 +
>  drivers/net/ethernet/broadcom/Kconfig              |   11 +
>  drivers/net/ethernet/broadcom/Makefile             |    1 +
>  drivers/net/ethernet/broadcom/asp2/Makefile        |    2 +
>  drivers/net/ethernet/broadcom/asp2/bcmasp.c        | 1527 ++++++++++++++=
++++++
>  drivers/net/ethernet/broadcom/asp2/bcmasp.h        |  636 ++++++++
>  .../net/ethernet/broadcom/asp2/bcmasp_ethtool.c    |  620 ++++++++
>  drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c   | 1425 ++++++++++++++=
++++
>  .../net/ethernet/broadcom/asp2/bcmasp_intf_defs.h  |  238 +++
>  drivers/net/mdio/mdio-bcm-unimac.c                 |    2 +
>  drivers/net/phy/bcm7xxx.c                          |    1 +
>  include/linux/brcmphy.h                            |    1 +
>  14 files changed, 4621 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/brcm,asp-v2.0.y=
aml
>  create mode 100644 drivers/net/ethernet/broadcom/asp2/Makefile
>  create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.c
>  create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp.h
>  create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c
>  create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf.c
>  create mode 100644 drivers/net/ethernet/broadcom/asp2/bcmasp_intf_defs.h
>
> --
> 2.7.4
>
