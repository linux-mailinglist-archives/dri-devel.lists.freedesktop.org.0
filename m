Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E884210547
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCFB892EA;
	Wed,  1 Jul 2020 07:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8238892EA
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:47:40 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id k17so249025lfg.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 00:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iIDLsMEqEu6N2jaXdTulWkfEp7Kjn/2oh7q3WmCmgLs=;
 b=jhCYCyy9yFVY5gCDiHwYz6PmY8nom9rH+nB33U4cwyxeYk0JH44YqUgWCKpCsd4xvx
 YUbMO4iv6azZgxYQ7mQONcO+cCE+pUzwPohi2QRpvYKkg0vFWNCmZoKQlsKx1Iy8xJJ8
 BzmfQTT1ieWTFOWsU9Ny/q6AGkOL65X/9oqAlBhS/AG18zF7XMgKv/4YAgtqKG/Rxgeu
 FzXwgMxo15sq56v3jmlYvaq10jiYxNWryCh/oOQQV+wmai6gXYp7aNs6u8Wp3CyApTOf
 fsZXJy9R8HmnGvqrOXXE5NYgQjX/vfRyyb+RHcZDaffzcNCqar/xwgWB2YqZpwqPcGYC
 os5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIDLsMEqEu6N2jaXdTulWkfEp7Kjn/2oh7q3WmCmgLs=;
 b=n6naJK4I7V/CfCiccpvygA6IHa632bjagWvhF4cpP3gQcdGWaB7DLZzKyYcFJxYZLi
 KlUZAdXVJH8agzNyVcon9Hyg5w1vyr4+RWsMpSdUjIbAkWuniSdNHhqserpjrET0WQsp
 m/LMs0mRNeKvoMYIOeP9nAqpS1D2V8yHGhWtoCjzcyPGa6w7iRDkTzn+ws2v6nNBYuoi
 V1Y7yXxKY03seqRv2+BBNcsR7lWxeLm+fe4+ibneh2YjG/rrbeEgVWpyRL+SbcalMLPc
 RDS3nX9J38jSO9u8W/2+wnCUNY4tq2avsFbtrSxTjiLw6dcCgLGWLu9IPyL7hW9GIMPr
 F7fQ==
X-Gm-Message-State: AOAM531JdBBuxAxLs5PoYnZlrpjcyIKTvLKLXngodGLizaUDniSAPNvB
 0oi+ahRDptaWCIRkoziRpzHfyGw3gkED4WTc5D3Zlg==
X-Google-Smtp-Source: ABdhPJxuQhh9QuZuUqJPJjuR/b+dDLREBTmySJg4FX0sMHHxmx5c080ySCLZHwPZqCVaSh9Yel1Lc9f0B5OJmbWs5U4=
X-Received: by 2002:a05:6512:3150:: with SMTP id
 s16mr3346458lfi.47.1593589659102; 
 Wed, 01 Jul 2020 00:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200626005601.241022-1-megous@megous.com>
 <20200626005601.241022-5-megous@megous.com>
In-Reply-To: <20200626005601.241022-5-megous@megous.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Jul 2020 09:47:28 +0200
Message-ID: <CACRpkdbJqFHCGkLgMM3pzgE4kYL7wH2FyK0fpOf1Gva1xicxuA@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] drm/panel: rocktech-jh057n00900: Rename the
 driver to st7703
To: Ondrej Jirman <megous@megous.com>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Purism Kernel Team <kernel@puri.sm>,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Martijn Braam <martijn@brixit.nl>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Luca Weiss <luca@z3ntu.xyz>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 2:56 AM Ondrej Jirman <megous@megous.com> wrote:

> This rename is done so that the driver matches the name of the
> display controller and in preparation for adding support for more
> panels to the driver.
>
> This is just a basic file rename, with no code changes.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>

This is the right thing to do.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
