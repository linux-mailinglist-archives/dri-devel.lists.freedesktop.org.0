Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A61F47C9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8576C89CD8;
	Tue,  9 Jun 2020 20:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B571B89CD8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:11:01 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s1so26723654ljo.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8dCMnOVOgOR5s9pzdFxwTiGI9fgNOigFT29dTOODBP8=;
 b=idoEsbgOfkrWdv2SoJSX5CT2XH97WJ9sUbL5zFq8q2BHUv3RHnLEvo+3IiyG/Myqj7
 so84MIsk6lHz0s2UTPUoCb/GoodADdcoX/9p8kMHzwcQ6zTQBv1BTUyVMeh1QO1lARLf
 Ns6wZHPmwMxNt0CXVgr88IGdSDqcAoUSN0BrUPIZpBea60/teJ4dRkjsXQi4TtrKqQTN
 c7goJm8Cs9WLqcVLuKrTDGEJx/rVMqlDsg1+scK2a3H/X610ux6eWbs13A2/eatUTkBq
 RwUh/SLK1Bp5d5NzVjuBw5SAZzIkUbU8l7zqTyhVDAeFTAmPoMYEcVPa8/lfeO7bY9PE
 Hbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8dCMnOVOgOR5s9pzdFxwTiGI9fgNOigFT29dTOODBP8=;
 b=cP8uyJjgpqa7eCG4sny/pqp93ky+jU6bOFLoDrJuRLp0ORC17oxJqt21z++HgQCG91
 pIVsHfqLPniB8GW/tzO7HMJMGaZS+PQAuFpJ/Lkwaq6xuX1qBD3b4cS2T0TIxm/Dgc3z
 V0kT//db9JpiXD1EnJ00v/dVwNp9e6kRS7cV49LgDhtPul21hpBcK7LjEBZmIoj7Qcdr
 scBnBEwiiyM1xuO7zsAzibDlaQ5yf2R0iwPK1nJGxHFA1Oh/fqKzhCYlWROYixx/HSKA
 od7TIlcxhyfAdDls5V4L9crl9sR9bLhTgBDNg5J2WXX6/zd2+zFIJC2tQl3XI+/s2Sxn
 qhjQ==
X-Gm-Message-State: AOAM533wWClF7zgrfFr6dCBEQolp2gL9ZVur8TH6JhrP/LxXtMq/vgnp
 zImIN5fWr4nv5c1YjMpM293KUoni75+k9dplI4TRZA==
X-Google-Smtp-Source: ABdhPJywU+IvCcK+CxNrONN5RubwqDrv/dqAItFcp2X7x60N7mS14ofkN5Alm/E2jSrQHo51sWWCT94GkDp4ceibdN4=
X-Received: by 2002:a2e:9b09:: with SMTP id u9mr15962060lji.207.1591733460043; 
 Tue, 09 Jun 2020 13:11:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-1-linus.walleij@linaro.org>
 <20200609200446.153209-4-linus.walleij@linaro.org>
In-Reply-To: <20200609200446.153209-4-linus.walleij@linaro.org>
From: Eric Anholt <eric@anholt.net>
Date: Tue, 9 Jun 2020 13:10:49 -0700
Message-ID: <CADaigPX_9mBqr3hKA0-aC-TOY3hEnXnQremMiPopw8DUcGCzgQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: pl111: Update documentation
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: Russell King <linux@armlinux.org.uk>,
 DRI Development <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 9, 2020 at 1:08 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Remove notes about migrating from the old driver which is
> retired as all users are now migrated.
>
> Update the text to reflect that we support PL110 and PL111
> alike.
>
> Drop the bullet on memory bandwidth scaling: this has been
> implemented.
>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

FWIW, series is Reviewed-by: Eric Anholt <eric@anholt.net>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
