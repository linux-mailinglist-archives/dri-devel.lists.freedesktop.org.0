Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA1527EAC9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 16:19:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEF08999E;
	Wed, 30 Sep 2020 14:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B9A8999E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 14:19:15 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 77so2382707lfj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 07:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C9fW7N6Efp/dyg9dA4M+FpBrL2pXM9IFkX0jX5IXYLg=;
 b=Dq/5FAGO1lTCxm4kCMr+3RXdW+8i0y3V3XRNjSTC4reV77L3n1Ei8Pa6c+QF99JjqS
 tC4w+W30d14S0OS7zxgkDPe94UkLOiesyGZwitk9P2ogFWjHM7is4xT2KIMhzMEKW03d
 /VdjIS/ZHYDTmK5PNTiplYiwx6N/CzgI5uSFhMZbaX54hCPuwXchXsM1oen2GMoZbf9g
 AmIs0BpgcXP7D4GzBwWC//K/wr9o6xRtYcVqboldKsfq/NSGGDTWfLgA3A7nWytdVhSG
 Nb4lOiM7O6foW64DdP3Ac/3jeBLbbhX3eUONmtfi6BjSiwpvY7mswDYPWaGVTheCB9C1
 1llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C9fW7N6Efp/dyg9dA4M+FpBrL2pXM9IFkX0jX5IXYLg=;
 b=tyIf642gmj4FaDO/PdTJGIfpxyAgvww6JeRPMheNGgeM5+S0uMajjErCg1+4ZAX7Hu
 iWc2/PsDQSca+SodVsIEVWuaqgXCRgFAa2NNwOYkfoun/CpFsHh95f6ZET78U+6Lo4w/
 6UTEIyQHJjIN4W4dufCLfm8xnwPU3Iij837+2Gz6yH33f4lfKC58QCguqAfJIUyMTp4l
 n5sLnt1OZ0O3Mk6C+1OI9nPqPuNFBkCK214DmMyKiW5TrcgtE2ewchl4AlfxLr/mXxjE
 tCDpw7d9HcVyuJ30D/ntzaxmGGr6sJ3V4QgPARHrwBj435hL+4j3/Eysv2gZC79JYzVH
 rYOQ==
X-Gm-Message-State: AOAM531QBcRe0yRGfZhK6Qu4L65SzrEtlNY48Nx1xIhOCxz5aIbijQho
 omHHhjAEWgut/h6/x7oLJQZzh7eznKySjvltqS3yJw==
X-Google-Smtp-Source: ABdhPJz8053FVyDebbqL3M+8YAhidLF69O4X+YR6Lgh6A8WHEHjqTvdEfi3/f5h5gZm6pRp8gSlONEcrDzdJbXpaGiY=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr889047lfg.441.1601475553747;
 Wed, 30 Sep 2020 07:19:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200819205150.164403-1-linus.walleij@linaro.org>
 <20200819205150.164403-3-linus.walleij@linaro.org>
 <20200828104731.GQ1826686@dell>
In-Reply-To: <20200828104731.GQ1826686@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 30 Sep 2020 16:19:02 +0200
Message-ID: <CACRpkdaEXd4=zmbGYX0ZKX5BSP3de7UAp6j9Mw76LogXVo6X9Q@mail.gmail.com>
Subject: Re: [PATCH 3/3 v3] backlight: Add Kinetic KTD253 backlight driver
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 28, 2020 at 12:47 PM Lee Jones <lee.jones@linaro.org> wrote:

> >  create mode 100644 drivers/video/backlight/ktd253-backlight.c
>
> Applied, thanks.

Not to unnecessarily nag but I can't see this in linux-next and since we
are at -rc7 it makes me a bit nervous, is it still gonna be in v5.10?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
