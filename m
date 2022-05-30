Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D684537E24
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4307210EC14;
	Mon, 30 May 2022 13:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 333 seconds by postgrey-1.36 at gabe;
 Mon, 30 May 2022 13:51:33 UTC
Received: from mail-qt1-x831.google.com (unknown [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C166B10EBFD
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:51:33 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id k6so1961372qtq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8tubySlO9EL1sX7JJbgIYlj3V7gJSLQUkL2tqjiHPYE=;
 b=qGFcst+H2sU9jethczFKj5MxMnXaCOn7OK090+/w4SslVfP0RhOPM+PrM/s6zmntEl
 F0i0jWuXjup30AM1FCFtkmrQsYf603Ww0X7DlWH4G1X8DXidwxDvsLuIyOSA46WT96pb
 gk/ByJ8wJJ6VG89vBxpWS4sT4viGby0Q7/aGVZjueV2Ol45MU6QR/kGUMziF9kEKL5jr
 Vq5IvoXl5vRQyKgPRCK8sxmINhmRSQBk+B7MLNnt8CZ+4eyNendacm1T2oVMcG8QIJLi
 JWs9iipRsPWjnyyw+uAEIr8g/Vhe0bmPXgyg2Sg9dqgZeemBHQFV9hvvB+/wubuuBXQ7
 z3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8tubySlO9EL1sX7JJbgIYlj3V7gJSLQUkL2tqjiHPYE=;
 b=QrXrzIWWXzdvk3R4lHWQCPSH8uqhn2zaDA6aAAl1E/KGzNj8m0OqkgJlwFKxLHRqbY
 3r6AhGKtfxcGLI86se9rMz+0zXb15mapqNM9zT5NVRh0dwrmucyW3OGJR+5BQPkkR4yb
 4RrPn/14q1LtlQZ3j6BDTpj/CdU70h+aO6WJW9NzEamZDfJpY85mzOAUfvFKRHJBke2m
 ee7MZIGkP1ZPA70kicRgFub9Ozx6biGNwvjQSnp/YZQ0QVk28oBYSbxmmYJTpgfni3y3
 mM48Hi9nueBFd3QOfm54AgPVfIud5ajWsH18QcRIPJSYDBd/oe45oVXgSeOrNNQJaa5k
 9CBQ==
X-Gm-Message-State: AOAM531A6zFm8p/cU9xHc76RlDAbHQf+bTgY2bf/pByenMDMMFpk4pQ1
 nruTHShfbeyGrPPRS5HL7V6e078NlLCdtb6LakRVsHtD
X-Google-Smtp-Source: ABdhPJw9o/+WDde4Jga387TqM8IY0EJdHUkX7NWLrzCofs5w6vulQVu5Xs2CiFpqzcOEIKw7lNGA0rRWaL1NB5GNp1o=
X-Received: by 2002:a05:620a:40d1:b0:6a5:b4a3:dfbe with SMTP id
 g17-20020a05620a40d100b006a5b4a3dfbemr14550181qko.340.1653918359158; Mon, 30
 May 2022 06:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220525115445.93500-1-roman.o.stratiienko@globallogic.com>
 <20220530132232.himfp7ubiacbmkpx@penduick>
In-Reply-To: <20220530132232.himfp7ubiacbmkpx@penduick>
From: Roman Stratiienko <r.stratiienko@gmail.com>
Date: Mon, 30 May 2022 16:45:48 +0300
Message-ID: <CAGphcdnPnFeafky=8-vyd_wKgbuTJc+MOb9UsM_0P-hVL_oiMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix blend route/enable register corruption for
 DE2.0/DE3.0
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Samuel Holland <samuel@sholland.org>, airlied@linux.ie,
 Roman Stratiienko <roman.o.stratiienko@globallogic.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 megi@xff.cz, =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

=D0=BF=D0=BD, 30 =D0=BC=D0=B0=D1=8F 2022 =D0=B3. =D0=B2 16:22, Maxime Ripar=
d <maxime@cerno.tech>:
>
> Hi Roman,
>
> On Wed, May 25, 2022 at 11:54:45AM +0000, Roman Stratiienko wrote:
> > By this commit 2 related issues are solved:
> >
> >   Issue #1. Corruption in blend route/enable register:
> >
> > Register corruption happens after using old_state->zpos to disable laye=
r
> > state. Blend route/enable registers are shared with other layers
> > and other layers may have already assigned this PIPE to valid value.
> >
> > Solution: Do not use old_state->zpos to disable the plane pipe in
> > blend registers.
> >
> >   Issue #2. Remove disabled layer from blend route/enable registers:
> >
> > Since sun4i/drm are using normalized_zpos, .atomic_update() will setup
> > blend route/enable pipes starting from PIPE0 to PIPEX, where X+1 is a
> > number of layers used by the CRTC in this frame.
> >
> > Remaining pipes (PIPE[X+1] - PIPE[MAX]) can have old data that MUST be
> > updated.
> >
> > new_state->normalized_zpos can't be used, since drm helpers won't updat=
e
> > it for disabled planes.
> >
> > Solution:
> >
> > 1. Track the number of total used planes for crtc.
> > 2. Use this number instead of zpos to disable unused blend pipes.
> >
> > Signed-off-by: Roman Stratiienko <roman.o.stratiienko@globallogic.com>
>
> If there's two issues, and two solutions, it should be two patches.

I would say.. It's a single complex issue.
Solving one part without solving another will make things only worse.

>
> Maxime
