Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394712642C8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E04356E8D9;
	Thu, 10 Sep 2020 09:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3C66E8D9
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:49:16 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id a3so5352353oib.4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n0TKrJTRREWx+qVe0GGlUx2oO/59rH6hytbSim7uux0=;
 b=KYDVy9wRsXb7wknkaQdBlLcibR8ukp3e3lapZqCVWudkSYk9zqRYYDU6R0k0zxS2U4
 LERBDm4voq2GbsUV5O4CaHPHGN0/zSbB5E0DLA8eZgyKSglKmpYB6Xlr2Xi9qjykdYIY
 5RCowvQx0S0P6UzxUsb016TgFKkQ38TABZRiOvou0J26fEgv+bej0PXTB40knHM2coPK
 35iQSeE7ChNG7p7YXu318J92jtLUliWbe5MMo8HBMnTXSIDE6TRmJD0pQ/rKnKnN1IXP
 UwBcGU/9xhf0U/GfU42aL9akkZs7necrzunGSodXQlaoxF8Xr2lwrilSUq9K//G46Tvp
 5QUw==
X-Gm-Message-State: AOAM530+Gf7YOjGuCcnznYjNxFoW4fcXzNeILOGWjReuhLViBFWaX2NH
 nxBYSH5liibOlVVoyigKgHuVam2qRQAZ2rSGvVM=
X-Google-Smtp-Source: ABdhPJxnT/vf2N1+yWJeFysPFXQogN8o3KOR5Mj57Mv60k4+/TY54wI+qZZ63QC/ecT2fwnb/Qiei2Z6P8v4RQMyGM4=
X-Received: by 2002:aca:4441:: with SMTP id r62mr3026774oia.153.1599731355901; 
 Thu, 10 Sep 2020 02:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:49:04 +0200
Message-ID: <CAMuHMdUj2dPe5p4O6ApAs_RoB=DR3NEBENSd1ZxF+msN8GJ+_A@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: renesas: r8a77961: Add DU device
 nodes
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
Cc: Linux-DT <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus <magnus.damm@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Laurent <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds DU device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
