Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74272492D0
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 04:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A046E199;
	Wed, 19 Aug 2020 02:18:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78226E199;
 Wed, 19 Aug 2020 02:18:07 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id d6so24415983ejr.5;
 Tue, 18 Aug 2020 19:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+FtZ30xD7F4CZ/+/kanc2qcUjEGS85bRNmxMV0hbX3I=;
 b=kOZno89ECZj6jVLAofx0JYLgCM7bLIMxM7XAq01DXsTvgmE6+vdVEGINNrEw9CrO6q
 hhfO8Ok5Qpm+QcIsUzJsuG41E1oKzmHRFBnEiUpFzDcckhfTl1O9G3xk+0Xdt+lJ28Ox
 84NBsEtRgRyWygzMTkVyQumtvunuhdFgfFhKJIVrC6SG7EXgKptI16hgZNUmwwLfq9I/
 xFHPSL9epK5Li4EZbsDm/XaTwhnkDABhW04Y75nreWj3/71so6UT5DOYbEtPsIH7HG5Q
 adO0CW/3HzSrSI/8upvsKMdC4Exvwltwp+4ZLXg/rDj9yHJnztmi3x1f/uoi/Cfz9zqV
 SEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+FtZ30xD7F4CZ/+/kanc2qcUjEGS85bRNmxMV0hbX3I=;
 b=QSBA2bN59DzzytzI7v+4PIzgx25PB+Q1mIiW+S9Gt5Ck3Nia3EUYOBdI/yaLPgJtKz
 vbezHYIIVx9v4IOcST0IuXkyhXCQ6lo/nH7ywUQBhVxo6RtBl9p1nQ49PwppFiP856ZV
 y0xEZmnLVRrNI/DvYYYYq+EvIJeS3gqOQtjxmK3NsM3gctfuTzB+bUShW88O2xJwFJgN
 OLazLbZIFHRgiBcIiuYzCJE8z8FaINLqYZ0hjT4/xn51M6ss1evxHSNPCT9d9yPHxyN+
 D6uq1CqOIn3fRE+TUm66glpsLMln/7HDVfdXkLMWzfgQNwU6t9cHdfm4vfEpJV27EoRW
 QpxA==
X-Gm-Message-State: AOAM533LyE8IFS6pcyFckJ03yCFmLsRG0L/20aDdaP+Qrb7V8qhWuROC
 fZXh26YjbAts0p2D13akzO90jE1lWU4rymgt78Ol3UO6COc=
X-Google-Smtp-Source: ABdhPJwOVxXlhVZPhM/VXYOHCZ5BD7otzTxtw2JShtHqq7RtGHtTEeWNcWBFLQm5bLFs+h/OjcLMVfdYi9hE5ww2B8Y=
X-Received: by 2002:a17:906:d054:: with SMTP id
 bo20mr24181293ejb.9.1597803486353; 
 Tue, 18 Aug 2020 19:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200817195846.14076-1-sean@poorly.run>
 <20200817200521.GA1551172@ravnborg.org>
 <CAMavQKL2=Gx+XCbMYc5p08jRNtH5ju=oadhxBxzgNf+gzo3fnA@mail.gmail.com>
 <CAMavQK+zsBHoMc_C=-=v-43u=tZ_pJ6XSGBhD6MLQN01pjbyEA@mail.gmail.com>
 <20200818053150.pwkga4vzipk7pf6t@sirius.home.kraxel.org>
In-Reply-To: <20200818053150.pwkga4vzipk7pf6t@sirius.home.kraxel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Aug 2020 12:17:55 +1000
Message-ID: <CAPM=9txiz6k2k7SBtPRbvA3C6NvoyH2TCaLgGM+-08yoouoSUQ@mail.gmail.com>
Subject: Re: [PATCH] drm/qxl: Fix build errors
To: Gerd Hoffmann <kraxel@redhat.com>
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <seanpaul@chromium.org>,
 spice-devel <spice-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>, Sidong Yang <realwakka@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Aug 2020 at 15:32, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > I guess things are never quite so easy :-). It looks like Daniel's
> > patch is in drm-misc-fixes and Sidong's patch is in drm-misc-next. On
> > their own they're fine, but once they are merged in drm-tip the build
> > error shows up.
>
> Ah, ok.  I've already wondered how that got past my build testing.
> This explains it.
>
> thanks for looking into it,

I've fixed this in drm-tip with a fixup.

In future when we find these silent conflicts, can someone please
https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html

follow those instructions to fix it up.

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
