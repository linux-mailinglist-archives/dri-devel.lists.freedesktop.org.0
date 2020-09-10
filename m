Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF02642FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40386E8E8;
	Thu, 10 Sep 2020 09:56:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3BF96E8E8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:56:48 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h17so4872835otr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 02:56:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+aAW8fAjI/ukWO9Up4e4Jv1cLs+aHR0l/ub6mwFsiw=;
 b=jXL/7Puz+N2JPrpxyJJz8d36/LUgLaV1Z74zV8ZSM1bPt8/H3WNMNisruzOJPdJKoU
 //zrNjfU+bNShki3yNQQVFjw3rqa65f0Lr/Rqw32ubwFdo4GhuykK4255fxRVSmjrcXj
 VrH41TuUaOc4F5KJdUE9bmzLrWcr1ye2hOJGAb+8P59BoIsDoKh4WB0lQ6xhkBu2QEfd
 ujSGeEp413mMWLHyb4N+OQAHt0/I+nfPzcJpPSCd/Yr9ppQLGXC0CfUjukhdderR+U04
 UAO9Ew8I8vDY+JYKWChm8Veql3rZT+iUKcWcRvikJpFc/Q4/07LXMiRVY3632QExguCM
 hIiA==
X-Gm-Message-State: AOAM531JpS88txqMUVcAUk9o2O61bW0Hh5CBnmbNNF2HFOg+TavzgCyV
 nfmrB5h8sn0Wn/qVRqwUo74w00Qfu3We/16elAc=
X-Google-Smtp-Source: ABdhPJyWBOiHLisXP2jELsYF+4g3l8T9tKP9LhlfqQ+wtDxBiKMBl57vV0R6auq3wQFduBAUJGdXG59wYf/jm+y4Nyw=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr3152888otp.107.1599731807995; 
 Thu, 10 Sep 2020 02:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87blihrtus.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87blihrtus.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Sep 2020 11:56:37 +0200
Message-ID: <CAMuHMdVX=zMQ4sQ9PrzrHnt4WGAVJ_iuMURSDYaZroWj9CNo1Q@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Display support
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
> This patch enables HDMI Display on R-Car M3-W+ Salvator-XS board.
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
