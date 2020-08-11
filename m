Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6109F242141
	for <lists+dri-devel@lfdr.de>; Tue, 11 Aug 2020 22:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA9C6E7EC;
	Tue, 11 Aug 2020 20:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5076E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 20:24:20 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id m15so7368572lfp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Aug 2020 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w1WZcT2N89epHZkK3xQi5ihJL9xPdQJm4LMVYnxpOeQ=;
 b=Jdca4/ZYgpMsTyJjgTNNaYtewzTQbzWV9F4EKgFOaUZUmmlPDvsgQPUuFmJ1Pa/7yF
 7EznhdA+ptpOxM9Wmr+RJmdYD/7YGx6zxF6dP5bx+pGRB00mBH1NpkNPvOBQjIeyWGHD
 kOWbHSON93RwyHAP7SUXqQf+Av7V3yw+C9G+t90xcZGXevboydr6bPqW14BtZ+tht3a5
 ztt83GSOKMX9/CwFzm7vuhbswxPi2CMhOswbDeYzunmIaQwSWQbSlLRm7VqItLPZk6O3
 hWBB+MT58mEfjmZueanspsP8Zy1u7LKJUE1MSNZopKkFFk4YvvC3Uj8DiVzm4DbYJvzE
 Xc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w1WZcT2N89epHZkK3xQi5ihJL9xPdQJm4LMVYnxpOeQ=;
 b=CujAXxD3OBW6mYkYNJ7X90pRA2VvqTuq6X04UctFJ5LULc4GVvRFiMjslG9UFXUKL0
 DMdPw1upBtp5Ed1pTWvP2QMI25/CCrLPUXRKy+2LxzhhKYIKckuF85g2KJBjpaeOkKJM
 oKCYYP4gryxhjX0ArKU+rF7096+G5u5Dk5CsUS9VHKSPkVq7XcEI0D0NZPbvwzTNvhtv
 /TzFT4l/XfU3gVl1oqH4WLZAYnnGlO9TLAwJs0Pc45Z6IiJCIYkah3u82aucTCFTWqZd
 8DUvF7Jm0rkKldbmxLOFmp8PUC1G5ad8+FFEGLgOOhFLC5+D4p6G+auiDWHsTJ0QbO23
 /rig==
X-Gm-Message-State: AOAM530Q5SqWViEjL3DAfKjM0oMFw2A9FUYsMKMlD2Tl0/x8luGtRP2V
 ilIBBHkbbbqB+OpnyvuNon019C+YNs1NSnvOCyD6Rw==
X-Google-Smtp-Source: ABdhPJxSu2O6bFSCtUt+63bmev8Wj62ChpgxO3Eh8tqpO9j9rm/9sxusSVHjaoRPYY3F90D5+kGqmMqF/mqyHFbsXQM=
X-Received: by 2002:ac2:488c:: with SMTP id x12mr3772463lfc.4.1597177458364;
 Tue, 11 Aug 2020 13:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200808224322.1507713-1-linus.walleij@linaro.org>
 <20200810130449.GR2352366@phenom.ffwll.local>
In-Reply-To: <20200810130449.GR2352366@phenom.ffwll.local>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Aug 2020 22:24:06 +0200
Message-ID: <CACRpkdb+CQxdd1gDbQCft8_AJjbX6b9c8sdmj1LXVByUE-mkpw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-notatek-nt35510: Fix MTP read init
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: newbytee@protonmail.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Stephan Gerhold <stephan@gerhold.net>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 10, 2020 at 3:04 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Sun, Aug 09, 2020 at 12:43:22AM +0200, Linus Walleij wrote:
> > In order to successfully read ID of the MTP panel the
> > panel MTP control page must be unlocked. Previously
> > this wasn't encountered because in the setup with this
> > panel the power wasn't ever really dropped. When power
> > gets dropped from the panel, MTP needs to be unlocked.
> >
> > Cc: newbytee@protonmail.com
> > Cc: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> I guess this needs to be merged together with the mcde changes, or things
> break?

Yes this should be merged first.

> Either way looks reasonable. Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Thanks!

BTW I need to merge v5.8 (final) into drm-misc-next so as to get
a smallish fix from the late -rc:s back. It is currently at v5.8-rc2.
Is that something you'd say I can be bold and attempt myself
of should I stay off it?

I asked on dri-devel but didn't get any help there.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
