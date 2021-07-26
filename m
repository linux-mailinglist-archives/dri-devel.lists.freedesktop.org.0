Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D823D56BF
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 11:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48886E8CF;
	Mon, 26 Jul 2021 09:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792266E8CF
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 09:42:51 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id t14so10252465oiw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jul 2021 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmkea5YDHGw17k/ybnZR0rAFGmyibzBzYCKsHFjIEzA=;
 b=pyjNPEEUkCDlGg18k4xOqInTRq+09N4hGdKi4FyCWX8axPRjR3KlqaZWcmGqrm+rSp
 gBiTp843hbax36haDP969DsSTuB0w+2oz0yClZpj07zj6uTib9llPknRlALQOO+64y4L
 sPWUYohijjrikV83ag9J0Bbib04C921VrSrKC7hURd8QyrJiS0wE5RwkKUS8T/UjziGw
 XaV6b9NAyx7EEssBgXkV6L7KSpyuicP5wNiQjiZBlCaQ9VAu2U0JVyX5uwFzhql4GiSx
 opipW05EZwpCsBBb8H3/JL/LWAhvkXextIeeLnjZ3OMMRfvE4we815oNII91P5/p4UwY
 iaZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmkea5YDHGw17k/ybnZR0rAFGmyibzBzYCKsHFjIEzA=;
 b=EpCuyoT1rJ3rz3Ss0NUOZ83Gp3Oafzj/zij9NyT1gN3XIUI835bmCt/fmPa7ySOpzP
 yFKyBONeduXcWNL689Ad39qKyEa4+Vv0HF7aX8RlTLWW9kG/RWA8xh8Xv0vDdz5av+IW
 6z8qtnWjlZOQNwxpBH+3yKWjKntgXLFTOqMVbnftf6Gw6ogzVhzdyxD4MaAADUL5D8fL
 05yZyF5yTty283RzyC9nMSnUaWFqbTZqdpWVVur1T1pcOQmsoHT1pYUvwayZloa2ob1h
 /GEUh8xau+Tyamg14u/hDSCRQ6HZReWd9Fy4NqgVXQvyrtgCu1A/zQ6z7dGHGlksBQaP
 VnkA==
X-Gm-Message-State: AOAM530oldwi5E+ig6rVQeM5Jmp6a7DMKtzXvOia8xws2UiaqixaJ2vW
 ppbllVZJpIpTYo0oFOaCT57rIvcfcBcDXybqP9TgmAg7FCDj
X-Google-Smtp-Source: ABdhPJxIgzRyC9Q9Eo0c7XHCyPeYoTsLo1zcVEOgH0skxN2GsCcZOc3VeoF4D0/YO4Ckd1zJwLLPp4dH+9ovajf1R5M=
X-Received: by 2002:a05:6808:1448:: with SMTP id
 x8mr10606901oiv.57.1627292570863; 
 Mon, 26 Jul 2021 02:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <1627179054-29903-1-git-send-email-zheyuma97@gmail.com>
 <YP3HI0rm9jVwm3ma@ravnborg.org>
In-Reply-To: <YP3HI0rm9jVwm3ma@ravnborg.org>
From: Zheyu Ma <zheyuma97@gmail.com>
Date: Mon, 26 Jul 2021 17:42:39 +0800
Message-ID: <CAMhUBj=hkmDjo4MseGsYRwwofQdeUm4HChsRWdwE0XF4WY9x9Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] add checks against divide error
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, adaplas@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 26, 2021 at 4:18 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Zheyu,
>
> On Sun, Jul 25, 2021 at 02:10:51AM +0000, Zheyu Ma wrote:
> > Zheyu Ma (3):
> >   video: fbdev: kyro: add a check against divide error
> >   video: fbdev: riva: add a check against divide error
> >   video: fbdev: asiliantfb: add a check against divide error
>
> I would prefer something a bit more descriptive - like:
>
> video: fbdev: <driver>: Error out if pixclk equals zero
>
> Please respin so we have something like the above.
> I looked briefly at the patches, they looked fine.

Thanks for your valuable comments, I will re-edit the commit log and
send the patches.

Regards,
Zheyu Ma
