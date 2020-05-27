Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4872E1E3AA9
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAC16E297;
	Wed, 27 May 2020 07:34:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06E16E297
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 07:34:42 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id s198so20965829oie.6
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 00:34:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g/2V+ILho993Sc4aTyN2HNrz1xXkT4t8lrGCCn7EhH4=;
 b=kU1vSNrwBy3Gnp0Mhsj3ox3ZinPlklOM1TfoSw4Z4UJ5RIVJ/XktiBQdqCcxaASRrn
 967uI3Ad8Pv4U52m88cNFLVtMO7BjO/kOMOo2ri+ukyIez2sGKvWKknUlY/wBxmHFsgL
 OAjoJm6qkxRiZf8Ynsyxpo+LYTtAeXFTfoglNK0XIUSnGPHu5UJxs4uyfsHE754c6EM4
 jpC0KI0iSEUtbtIn7ineIAFcuwivGYBTZAvMJ1gIUfpySrLcORtTg6hFwbr6uyHMFG+h
 5OBHIBbEStAB5H+hZT1Tk3kD5vYrUx/TSjjlNxmrYVyx3TaxgbCClrtefVN8Q9JZ8T1C
 G78A==
X-Gm-Message-State: AOAM530VQmnTw+LdUPXDEldKewBBo6WgdVZXgwV7bjr2Ov1myCN9k1vc
 4VxuFwImn7Pg6vL9wAlXKRP771Yeoc+Edz7kV/0=
X-Google-Smtp-Source: ABdhPJxCq6xJytQR9MRrSZtC7WsUAZa4yYCcCrs2RUn5qA+cObxdWtdrNC7QR/jq6N/RUcvtStBbHCYsejgBNLFq/wA=
X-Received: by 2002:aca:210a:: with SMTP id 10mr1716582oiz.153.1590564881908; 
 Wed, 27 May 2020 00:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
In-Reply-To: <20200527071555.GA23912@lxhi-065.adit-jv.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2020 09:34:30 +0200
Message-ID: <CAMuHMdVGcFGL6V6_zDCPQA66VFyqM9bQ6choWs8eYfOieFu1ZQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
To: Eugeniu Rosca <erosca@de.adit-jv.com>
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
Cc: muroya@ksk.co.jp, David Airlie <airlied@linux.ie>,
 Michael Rodin <mrodin@de.adit-jv.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 gotthard.voellmeke@renesas.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 Simon Horman <horms@verge.net.au>, Sean Paul <seanpaul@chromium.org>,
 Michael Dege <michael.dege@renesas.com>,
 Harsha.ManjulaMallikarjun@in.bosch.com,
 Ezequiel Garcia <ezequiel@collabora.com>, efriedrich@de.adit-jv.com,
 ChaitanyaKumar.Borah@in.bosch.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eugeniu,

On Wed, May 27, 2020 at 9:16 AM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
> > CMM functionalities are retained between suspend/resume cycles (tested with
> > suspend-to-idle) without requiring a re-programming of the LUT tables.
>
> Hmm. Is this backed up by any statement in the HW User's manual?
> This comes in contrast with the original Renesas CMM implementation [**]
> which does make use of suspend (where the freeze actually happens).
>
> Can we infer, based on your statement, that we could also get rid of
> the suspend callback in [**]?

While the CMM state will be retained across suspend-to-idle, I'm quite
sure it will be lost by suspend-to-RAM, at least on the Salvator-X(S),
ULCB, and Ebisu development boards, as PSCI will ask the BD9571WMV
regulator to power down the R-Car SoC.

So IMHO we do need suspend/resume handling.

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
