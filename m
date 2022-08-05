Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFE58A4DA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 04:49:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A94AE068;
	Fri,  5 Aug 2022 02:49:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064E1AE17F
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Aug 2022 02:48:27 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id x23so1482521pll.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Aug 2022 19:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=NJmpSabGYVySx6BZBYlXrVGI+AUkhQcvqbpP5TAjxAs=;
 b=KhuBnWDMJyITR1swyC10Dikh3DeQ8Cps4R1NrejKNF+SrrvfRiRUynX4tqfzZ2yoc4
 5Za8ftfsBAfx1IHMMaRWgHYBJAfP0/u6vjmZ9TCvx93nb26PvslquXUH3Gsr20sHBlYc
 qr0mkZGH44kWj59dMALKKCB1WU7EVnHy7ntu9ck7tZceaTdTKqJDw2LilCv8DfbRz6TC
 YSE8duWnL0OvXvSbsvJctfOuHa3bED4hXQT5qFKc9ZTeBFkh2zm+CgEIZDrZbC2EQDuv
 VdIIeMf/MaEfLgjpazk1lZWlyrcPI+1omNIJjv08cJIuG3Wz51bDaweV3eAa8qRiGn0v
 NLBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=NJmpSabGYVySx6BZBYlXrVGI+AUkhQcvqbpP5TAjxAs=;
 b=kDu8WCml2tIdfA+CVUX2VMJAwGFaNyY7a8ibOem4Sl5ZWlpy7m7MeXn3eDnzHwNXSr
 oDqwSfvUDT4qBEPVt0jxr4G2WuWWBind/bhUDRRsjH9ZjdSoVBvMKI5WpygguoIM5F4B
 yr2RBC8qBgTZEL1OSuAwLnk1Kt8L8sSMd1lO27U6xjpTKgHMLetDvaSQidZPAZzURQl2
 MY3ARDJGGQJPSba6Kx+Jx0hGvdFpq23huC5t+lFVdywn6KztlBL8hCnekM189MOpTw7W
 GeCK1q/TiRb5We+SWD/wvqcs8D1G5m6iYv0I9+c21hl5w4so2iW8b8Qk29R40slbS+dN
 S6KA==
X-Gm-Message-State: ACgBeo0AEd/k3j7yObCQ9HnW8UbqS/Jo9uWd04imICvTyWFJOgbUAM4G
 kpyMrId+Wn/Zn2MreA60dkDsIJsbQDcOZKwSyQ==
X-Google-Smtp-Source: AA6agR6gZikLvwmG4YAjYzlgW6RPbub+vhwTLBM35vXf/i9hvAAoKYKKSKGO1wlYtRNMJMFVbIxfKOFU5KSteImpazk=
X-Received: by 2002:a17:90b:388e:b0:1f5:40d4:828d with SMTP id
 mu14-20020a17090b388e00b001f540d4828dmr5379294pjb.31.1659667707464; Thu, 04
 Aug 2022 19:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220804124125.3506755-1-zheyuma97@gmail.com>
 <YuvbI8NEpzciTgfc@finarfin>
In-Reply-To: <YuvbI8NEpzciTgfc@finarfin>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Fri, 5 Aug 2022 10:48:16 +0800
Message-ID: <CAMhUBjnf6T=eJAhkOW=TOKBTjQojCmNwMB0ekOss8yf65aRBTg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Fix bugs in *_set_par() caused by user input
To: Ondrej Zajicek <santiago@crfreenet.org>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 adaplas@gmail.com, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Thu, Aug 4, 2022 at 10:43 PM Ondrej Zajicek <santiago@crfreenet.org> wrote:
>
> On Thu, Aug 04, 2022 at 08:41:22PM +0800, Zheyu Ma wrote:
> > In the function *_set_par(), the value of 'screen_size' is
> > calculated by the user input. If the user provides the improper value,
> > the value of 'screen_size' may larger than 'info->screen_size', which
> > may cause a bug in the memset_io().
>
> Hi
>
> I did not saw fbdev code in years, but should not this be already checked
> by *_check_var() ?
>
> arkfb_check_var():
>
>         ...
>         /* Check whether have enough memory */
>         mem = ((var->bits_per_pixel * var->xres_virtual) >> 3) * var->yres_virtual;
>         if (mem > info->screen_size)
>         ...

Thanks for the reminder. But since the user can control all the
parameters of the ioctl system call, it is possible to assign
'var->bits_per_pixel' to be 0 and thus 'mem' will be 0, bypassing this
check. And in *_set_par(), when 'var->bits_per_pixel' is 0,
'screen_size' will be calculated as follows:

    u32 bpp = info->var.bits_per_pixel;
    if (bpp != 0) {
        ...
    } else {
        ...
        screen_size = (info->var.xres_virtual * info->var.yres_virtual) / 64;
    }

resulting in a very large value.

regards,

Zheyu Ma
