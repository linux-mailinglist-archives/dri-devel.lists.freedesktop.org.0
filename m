Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301EC62F126
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 10:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2F910E212;
	Fri, 18 Nov 2022 09:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829D310E212
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 09:27:47 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id f27so11666257eje.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LTV53IjLyTX2vAYvhYKIedftAswCCwSYXuzFP2rpIUI=;
 b=U5nkdhkssFKgO2+KPFBYapfmiiCyAZG4HigPiK6IhbIpajA3a6gdNzNiBX6DF8ipQX
 LTS53kvCO8yhoJqfYgA+WBXpfrGnuR2C4nx03HGZV/qBD0R3L2EOtNDqIp01Wsg7MLJ0
 C7pppXLsTM2LBYtnJitETl0y6WzSZF6XnF26U2vzrVdm2BsGsJqSm9jVxOpwrGzJ9OND
 p2SWrDlTLkFumPFWphxsbLdYqDKr5FpQEuxqHJzKPiLEHQZcPN45TxpxkoTAYdbVXA5K
 VEDFmM6qtPlq7HkFJJd6ZSfnjQ670sZTSDVEESDkwlYjzOzIwBiZwY5dmfLhbeGrwS4x
 ALyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LTV53IjLyTX2vAYvhYKIedftAswCCwSYXuzFP2rpIUI=;
 b=WNNPQWbEnKofOBsMQiorT6tLKVfXYQyNKTbo+mSDKlhJjig9pfHZjuKE2avy5OGGoR
 nIgT3JPZaL+5YqxM+H3izW6+9W3mAUTKMoQ0BLLoRw78bV+yX5DXtxSp7LxLqN10PqAS
 U51WDReN/CxFyYtwImTJBuI0A6MN4G+OHtAez5I7QyKW7QgFRiKf01BXQ0WU6BcsJYiL
 B85vbnqQrRj8dZ1fJM+6jHkkihTJ6j6WaU5EfCBmWBJMiP1XdgKWEctRDKHbz9kNuTT+
 DMGpp9IQk8E3J/3RLvUO9mEHOqzF1w4FUABras2fRvqv4FF8gkD1GoO8aXz1devElBv1
 PhjA==
X-Gm-Message-State: ANoB5pmBl2/CEfeO/Fz99IyjG8P/HJmuoqGeSH6/2JPn0AmsFLlrdW6k
 AJixemDWH1xKMsLaZIEexZ4Blw3tPudH6JepY7c=
X-Google-Smtp-Source: AA0mqf4b+pEbOxW77G+RWw6jQ4Ltx2BWetsnWN5Oklb/xBQtx86Xlt1Ohg8mLxGQO4vb/T+5dqfILCX3keBBsd9gALg=
X-Received: by 2002:a17:907:7650:b0:781:e568:294f with SMTP id
 kj16-20020a170907765000b00781e568294fmr5332578ejc.447.1668763665960; Fri, 18
 Nov 2022 01:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20220615221410.27459-6-laurent.pinchart@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Nov 2022 09:27:19 +0000
Message-ID: <CA+V-a8vy-wj6oyA76Z6+rPDxes1pt-uxYynT1_OjCNCa2A0qNw@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] ARM: dts: renesas: Use new media bus type macros
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Eugen Hristev <eugen.hristev@microchip.com>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

Thank you for the patch.

On Wed, Jun 15, 2022 at 11:21 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts       | 11 +++++++----
>  .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi     |  4 +++-
>  .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi     |  4 +++-
>  3 files changed, 13 insertions(+), 6 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
