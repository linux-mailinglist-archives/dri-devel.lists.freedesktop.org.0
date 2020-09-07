Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD63225FC4B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BAA6E405;
	Mon,  7 Sep 2020 14:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090F36E405
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 14:52:30 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id h17so11665697otr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YR5nCLsMFYFwM3pRnFFBBgFgP7DthYxhn+lLufrwFRM=;
 b=m8w+uJUfyLkeO+ILuqlWGmj2EPS1+jANgHyjcU7uemLK3vNFQuFibZr4CYSCqHGfMx
 f+oo4zbvp1OJP3FhuH08S1ErywT8wlK1PRJ8cL2RoQiqned/zXs2kx2lpzzGnDlYZZ3z
 XVPTdbGdLSBQKCjTI5q3XiOfWtTxFJkW5PiA9Z4Ovy2h5MJX7OBb3aQrUdHODG6JQ4Hh
 Lrn/yjsNrKfiHuSncnfvMUgD4DxcVhDF5xUMeZBtH4m+/AHFaCMxsChBVElBbQ+Yoixm
 92a/XCOgFvOqvhKSi0f452YS4ii6RDvnf8YnDKf4ktD2yGYoT31UVospAFnuYeQh/KMM
 x0Mw==
X-Gm-Message-State: AOAM5319+YKl6LOIPR3Fql5Zz5ot37/opRX1J/btgVAi6Yrx0J8isQ/D
 hPPUrjBQ3GUPHOAltRfKwebVZFhNSeFBjZSDk0E=
X-Google-Smtp-Source: ABdhPJwMUIApW9HWKDkC3PKb6cFgsiRPnCVRrqTYBPT/r/sTcW9BIcPzvjDMKs+ttWmcC5MmxT2A7Giu82Aj7PG5r3o=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr13857111otp.107.1599490349290; 
 Mon, 07 Sep 2020 07:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87pn6y70sp.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87pn6y70sp.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2020 16:52:18 +0200
Message-ID: <CAMuHMdWC9uQ5ekntNsMQQFBZ1tEnf01+b_-ShgpVJsxqeOjEVA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: display: renesas: dw-hdmi: Add R8A77961
 support
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

On Mon, Sep 7, 2020 at 4:58 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds R-Car M3-W+ (R8A77961) SoC bindings.
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
