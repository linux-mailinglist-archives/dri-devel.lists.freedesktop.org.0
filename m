Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59229267987
	for <lists+dri-devel@lfdr.de>; Sat, 12 Sep 2020 12:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72146E137;
	Sat, 12 Sep 2020 10:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B20D46E137
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 10:29:13 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id y17so8395073lfa.8
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Sep 2020 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sh8GR/7pZB11LGvzAT1QMd2th8p/t/7zEkjcjUHusM4=;
 b=TNgkyHGdlSaMOhR26YBb4m0IXCyZXQjWLAAW/ZXZeLE95t9rDEiQyWonVgmRlCsEkF
 afQonjDBw+TKjovyOPcNgrtW0FKKnoNEo21fCoszBhFTDKx8UAoTdJsKCeQp3mYmkSUw
 fkfZkWEIVXPGZx1WwUbvJVbOApx3O7hdVBraB+5W6/cCUlixiP6NZxp1xb4x0K5G1ubU
 xwvKa2B8YuwnWAze92PN+5K7fQgehO08fvpUDhOt3LbBThIb+aB21W5uNUJ5gmmf91ly
 Dx7YZwjS1HNiiTgnliuJxDE9JkLeO11nu4LckBpTzUGppXNoVlWIUqEexL9u8Mpejh/T
 L64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sh8GR/7pZB11LGvzAT1QMd2th8p/t/7zEkjcjUHusM4=;
 b=TuUwoxuwUzdndeZHGw+xnR4BqLWDnoZidOBH48kHMrqQNqlJG4R//ew7KeFjW56MlT
 qcuvGblAuEmzMS92NkdZNEu3HyG9a7BJG54BQqN/4fO8RGiciKL7JT5eFSVt9Py3nRy5
 SKaaojR6DLucPNfncmY8DJCoOXKPkSIPXW4WoiYnwFBhlA6y1wQ12Q1F4QZ7eATjEkhC
 s4w/TE0kc7yP6dhO6BZOuXV7cSRAwgr7JEEJrO40z5cBjfE0/R7FKYiMlE1IFdgCh0Uy
 v/8nqC88lmII5pUACskN2xEmR4arKMgrKlr87h5mlNEkf+6APmM13iIoG+0w8OqXEWl3
 mLXA==
X-Gm-Message-State: AOAM5326AEeVDLwBTXOQNwWaBiARQnhjvduT2m+wNq2ETTBqpT31rKps
 rdJeuRjRg+qL0IgaVhJW7xTywPJywU1zh9rO72bTPg==
X-Google-Smtp-Source: ABdhPJz11pbUSU2XVIPKHOKOmzbLiy4FThQsEUg+6eDyrhbywiMLz00g4m1+ew8Z9bgnzGQAaalWTtQYUsED+DbJ1v8=
X-Received: by 2002:a05:6512:370b:: with SMTP id
 z11mr1447627lfr.571.1599906551801; 
 Sat, 12 Sep 2020 03:29:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200831113907.GA514373@mwanda>
In-Reply-To: <20200831113907.GA514373@mwanda>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Sep 2020 12:29:00 +0200
Message-ID: <CACRpkdbfud+RV=QprECZxq8SESKnEJO3+RvLq=4vhqcy+oq1Bg@mail.gmail.com>
Subject: Re: [bug report] drm/mcde: Add new driver for ST-Ericsson MCDE
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 1:39 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Hello Linus Walleij,
>
> The patch 5fc537bfd000: "drm/mcde: Add new driver for ST-Ericsson
> MCDE" from May 24, 2019, leads to the following static checker
> warning:
>
>         drivers/gpu/drm/mcde/mcde_display.c:570 mcde_configure_channel()
>         error: uninitialized symbol 'val'.

Could you send a patch fixing it? It is easy for me to just apply.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
