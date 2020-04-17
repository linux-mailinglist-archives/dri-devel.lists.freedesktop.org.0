Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1161AE6BE
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 22:27:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7C86E13A;
	Fri, 17 Apr 2020 20:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1126E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 20:27:21 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id f8so2833499lfe.12
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 13:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sFVeP60ycMsUVn8rAG+W7sV8htYi61dn7Bz9V8tHbJY=;
 b=GF/O9I9YEBFtOzdDBV7vdlfDMNLjhMF3VMZcgQoGj3iSlXijVXvPwhS8hZoL2iZlIt
 nWKNoLXNftYapV6G943ffgnn7ikiBhUxuUPMWwlSrD6psFHTM1IscvNzMOKc6I4xbuF2
 Ie5q4F7s2pJQE7HTgy7zl457yksbjjXUxyfbUijIxRr0MEJwY1q/yk37G+CGNcPNOsfB
 tPzCvWq9GitY00yuSE66BE8jW3qSIyfAhHcMiaBEFyXs34oOeebixWQ/HwN/KUCDimUd
 iW0448Il0Qt5dSdL7E5V2sj0KK8YnAqAmNeMAkA9+U6CvYyGNYf/Ze2MBi4Ji7KKOXP2
 D+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sFVeP60ycMsUVn8rAG+W7sV8htYi61dn7Bz9V8tHbJY=;
 b=dKFeDBVvuLUnaYjqvasXbk1ZU2S1JtCINFcfEjyXq2aRA8OYuXBOK2dbNqhoR8WBk/
 W8cImwUSHjstKq8howmQkUkLNESD/79U1FHsNLMC1j17DaFIWMZVipUjQr6t9+APBWdR
 xRl/5Z/gBMlDGRZw2pPMA0hSll4UVN4B4bqVPW6VeEIyGND6HNpYiw2MmFBbgf2VeLw5
 8t72HWAwx4v/45dw+y0pohRHmfnP1CKLshD42AdhHrqKyVFjh7jRrv8ECTGAz6ZmSUUt
 xgmfeRjdSF4EUfPWt5S3Hl9L4lY7OGVDhMkLHspR+3KQ/q2ygWlDbT8AvOSy2PqDgTG7
 +99A==
X-Gm-Message-State: AGi0PuaclQGdTCCspkE9ldzk8HXBnbP7pinV74QCdxpFrJs6XiM378BV
 3KO4tJN/18V/KiiQ+LTAyPnOL3X+eaZPMOSiARAV5w==
X-Google-Smtp-Source: APiQypIwXsxqULDsgITbS/cOPiGXDq1WRUsu9PtBlGV978qY3TXn8oQz2KBm4oUwDN+6veOIq1QkFziCf4uLCuZoQ68=
X-Received: by 2002:a05:6512:685:: with SMTP id
 t5mr3088797lfe.47.1587155239924; 
 Fri, 17 Apr 2020 13:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-4-robh@kernel.org>
In-Reply-To: <20200409013947.12667-4-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Apr 2020 22:27:08 +0200
Message-ID: <CACRpkdZaxKxF9QuAH8D78C8L0f-01a0V+w5tSGYLvGajYh6nPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: pl111: Move VExpress setup into versatile init
To: Rob Herring <robh@kernel.org>
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 9, 2020 at 3:39 AM Rob Herring <robh@kernel.org> wrote:

> Since the VExpress setup in pl111_vexpress.c is now just a single
> function call, let's move it into pl111_versatile.c and we can further
> simplify pl111_versatile_init() by moving the other pieces for VExpress
> into pl111_vexpress_clcd_init().
>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Yeah that's much nicer, the other boards get a copy of the
Vexpress code but it's so little so it doesn't matter and besides
the Vexpress already had copies of the other boards init code.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
