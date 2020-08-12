Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21262243495
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A584B6E542;
	Thu, 13 Aug 2020 07:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D356E081
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 16:44:11 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id e187so1711516ybc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2iquYo34B24ccVUFjjX9GsDTrAUF6/oZpH0oyCN98k=;
 b=eAMwB444A71l/cRUbD+Ov6X2M+XLfE3j2RwNgbktlSyqQRE98GrEcb8TF9WsarUwwr
 yoGMZUx3D+FSQbXcd4kFQytbcovydWsAdggBYrAJzlVEcQzKVNfHRAy1oUyEubVhxUIH
 qVVNEGopSMBuCfjO9qAwJ2Sd7A7D5evaTKOJMOsoUcTADVuA+eNbBvv4nId8gjcYdC2s
 PEKQhxE/fcN+iN8bg7ayC76b5AQ93ysEqLxXLDpzE0Bmn4qC76LjwOn4kIIVOF2okU4L
 Lo978xVQOdnQyO74JMHnE8yRQ8mBle1p/BaK2Ki/Zx4BYtUXGygtgLn+Bsz3OX1vI+Cx
 MDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2iquYo34B24ccVUFjjX9GsDTrAUF6/oZpH0oyCN98k=;
 b=KlFzIm9T0BLahv641Q0k8qczeP8jQ2kQUwgjVNk2LF2m+J0hXojHvD1n9yRX/Awr8g
 eStuTxnjB4YYbxPLckyZtYcHlncyDMFzYazfa6o3vIyXbhRI4+qa6wXgTiUnSifRLKlU
 lwlc3KZdU2R/VgOmMrzgm5WiLn3djtwwKrKiFGtEVzJeleCw/UQFb3z8bVoK4pNZXIVB
 Vbx48EwyOf8iClpnxbb9pAQlFnflBIMrP5EEeT6rUbVWd/Htwc+G5KVXbwyb0/c9kHFR
 B3p/YI9DA1E6mGOEXlGMQZNy/jdh1ShhMEgakfJK+TSzGOmc5wmg5HiL5Fx/BiyoiX+x
 1cqQ==
X-Gm-Message-State: AOAM5314eld1zb8KcDH4drSiWcEyizn1kx6/JQbtLOV47qk2Y9dr7f9g
 OqkziJpM0PAZ3wuqF8rr/p6EhN2nzkPgYk+W68g=
X-Google-Smtp-Source: ABdhPJxyQDmaRXdOzNXEYlfOCuSoxFSZaPeNK9+n9dM0SkJ0H7uMGBBt+8dZSyB8CYaVvKi2NFKSJCZQ3UbnYVl7EaE=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr305211ybp.25.1597250650957;
 Wed, 12 Aug 2020 09:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812163855.GU6057@pendragon.ideasonboard.com>
In-Reply-To: <20200812163855.GU6057@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 12 Aug 2020 17:43:44 +0100
Message-ID: <CA+V-a8uCuttdzdv7enetaxrXZJ2rkr-6OHZ7uXcQi1tCp9Cbxw@mail.gmail.com>
Subject: Re: [PATCH 0/9] r8a774e1 add support for DU, HDMI and LVDS
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@linux.ie>, Magnus Damm <magnus.damm@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Wed, Aug 12, 2020 at 5:39 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patches.
>
> On Wed, Aug 12, 2020 at 03:02:08PM +0100, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series adds support for DU, HDMI and LVDS to RZ/G2H SoC.
>
> I have added patches 1/9, 2/9, 4/9, 5/9 and 7/9 to my tree. I expect
> Geert to handle the rest.
>
Thank you for the review and taking care of LVDS documentation binding patch.

Cheers,
Prabhakar

> > Lad Prabhakar (1):
> >   arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks
> >
> > Marian-Cristian Rotariu (8):
> >   dt-bindings: display: renesas,du: Document r8a774e1 bindings
> >   drm: rcar-du: Add support for R8A774E1 SoC
> >   arm64: dts: renesas: r8a774e1: Populate DU device node
> >   dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
> >   dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
> >   arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
> >   drm: rcar-du: lvds: Add support for R8A774E1 SoC
> >   arm64: dts: renesas: r8a774e1: Add LVDS device node
> >
> >  .../display/bridge/renesas,dw-hdmi.txt        |  1 +
> >  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
> >  .../bindings/display/renesas,du.txt           |  2 +
> >  .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 11 ++++
> >  arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 61 ++++++++++++++++++-
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 30 +++++++++
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
> >  7 files changed, 104 insertions(+), 3 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
