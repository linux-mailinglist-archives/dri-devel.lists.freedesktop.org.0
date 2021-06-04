Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C939BE55
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 19:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576776F62F;
	Fri,  4 Jun 2021 17:17:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C946F62E;
 Fri,  4 Jun 2021 17:17:17 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id t20so7530806qtx.8;
 Fri, 04 Jun 2021 10:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2wmazLLGsfTXVIzn4BhBH78YNgGvUwJNK95soFcTokk=;
 b=P6RO8fl8Xcr+/vCRve4bc7UGYodwuQwXQ3Ej9FKVnkQvXum3mUeUo0LgDodTKAx3GK
 BbfW7fn9x+tdc+ocCSMPt/p4oy/s5HRMIK5t5rQcbEB97gbc4iEujNx1wljYSkdPgaNU
 sdIfB9PIE/RVFQyM8tCGNcm9TSGZenGt95r95VIHv21JZ7gf/QmyzGfY/JoSxhSeraLl
 z65h/yY3vk3EI0Oktak5PmlAFA9Lp32H09XLFDTNDn//1O7oLzupq92sMIlcmG0F0nP5
 tBKRJ3Jv6cfTAL1vwm3C5W4Z8SYoUJ1J9rKEsDFZNG1GhZNBY29EOqPUCRwBM5VYnPry
 zNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2wmazLLGsfTXVIzn4BhBH78YNgGvUwJNK95soFcTokk=;
 b=uAzNxrAK/RDhGZ7qfEQc+EwynOf14Nt0dsEhZb+2dzcheIsElOf7A7rsPF7nRyIWgu
 Ghd5B7AE1uTc5BzixTVGovn623Bd1dYAM9pQbR33+1mfpPGdtP6ODNu1I92eWgSYq6hI
 2pH/61krbVsFCaPnjIyW+Y7DoeItEovktsYc82wLOBlCE1AqPaRqlRaXXWuce1r4DjuT
 nD5yJo9FkuJtEZR+JOGBSA4Nn7fM6rZyeFdRUZHzm6ax+gMC0bwUyF7nEV3sTPqSE5DD
 nH/NHfoNN0XTvXODhpE6xtcnp3hpXiawbEPu5EjS8uYGx0MHWnLRBPBfzqZe7anjOmCM
 2yFg==
X-Gm-Message-State: AOAM531e+lD4z5s2O5YZvpmouH08T3hjbbIWUi1JIQm1+j/wreXuEsZW
 aRfAWxCJl0LwgvLUs3j5tyLYUKNG092oEDNdAryUilgVBUGjZQ==
X-Google-Smtp-Source: ABdhPJypISXuGLvy+Ro2vdW7Zln9YQRKJ0fongdc3pDkW4RuBIbnthdWqifs4c2eOyh98Haxq0fOjOumvnbljm7AHUQ=
X-Received: by 2002:ac8:6f06:: with SMTP id g6mr5698528qtv.87.1622827036922;
 Fri, 04 Jun 2021 10:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdZOmE_BmA-QLRZiCGQ_C=kdhVOPbhy_YXr6vbHEZJxxTQ@mail.gmail.com>
In-Reply-To: <CACRpkdZOmE_BmA-QLRZiCGQ_C=kdhVOPbhy_YXr6vbHEZJxxTQ@mail.gmail.com>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Fri, 4 Jun 2021 10:16:50 -0700
Message-ID: <CA+E=qVeh4Ti=5NB=zXQA0bm4A+8MD+7cHDAkw_hF68F8ru071Q@mail.gmail.com>
Subject: Re: [Lima] LIMA kernel bug - help!
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Stephan Gerhold <stephan@gerhold.net>, Qiang Yu <yuq825@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 11:51 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Hi Qiang,

Hey Linus,

> I am using Lima on the ST-Ericsson U8500 SoC. It is one
> of the very earliest versions of MALI 400 MP. It mostly works
> on the mobile phones I have using PostmarkeOS and
> the Phosh UI (Wayland with MESA), but now I have an issue with
> one single specimen.
>
> I have this bug in my dmesg and after this the graphics
> start to act weird:
>
> [   48.662336] lima a0300000.gpu: mmu page fault at 0x2020400 from bus
> id 0 of type read on ppmmu0
> [   48.662464] lima a0300000.gpu: fail to save task state from phoc
> pid 1581: error task list is full
> [   48.662481] lima a0300000.gpu: pp task error 0 int_state=0 status=1
> [   48.662494] lima a0300000.gpu: mmu resume

It's not a kernel bug, GPU MMU just catched invalid memory access by
fragment shader. It's likely a mesa bug.

What mesa version do you use?

> In interrupts:
>
>  75:          5          0     GIC-0 147 Level     gp
>  76:          0          0     GIC-0 146 Level     gpmmu
>  77:          3          0     GIC-0 145 Level     pp0
>  78:          1          0     GIC-0 144 Level     ppmmu0
>
> My UI definitely want to render some more stuff so it gets
> stuck here.

It's stuck because context is marked as tainted and all the jobs that
are submitted from this context afterwards are essentially no-op.

> Any hints on how to troubleshoot this?

Please make sure that you still can reproduce the bug with mesa from
git main (ex-master), if it's still reproducible please open an issue
at https://gitlab.freedesktop.org/mesa/mesa/issues
Please also try to capture an apitrace of the failing app.

See "Bug Reporting" on [1].

[1] https://docs.mesa3d.org/drivers/lima.html

> Yours,
> Linus Walleij
> _______________________________________________
> lima mailing list
> lima@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/lima
