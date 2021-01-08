Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFC52EEF0D
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 10:03:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CEF89A8B;
	Fri,  8 Jan 2021 09:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DE689A8B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 09:03:41 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id j20so9048441otq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Jan 2021 01:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Vdt966ZQ+bhnlfBJJTQZef6ngeUx7tP6w5riL86+M8=;
 b=X0dLTcNKymzgCBzMaRSOBtI+U2p3V3K3/ehfN+azQEBhATiIGQti2npPvJGvOoL+DC
 9F0+yjCFfl7/VSDY6CllDykE21frhSmSj5fOyIZZv7bJpcqw09MxD01aowyNMsw2KtcP
 jwA0zGhsFFt9aeU7UgUPNowfxCDAZYDmBekyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Vdt966ZQ+bhnlfBJJTQZef6ngeUx7tP6w5riL86+M8=;
 b=l65RgdJD/gHkLOMrOGHJmto6zMEVQ6mOsDF/ce18DWBwNYU7oDZ1Uei4bZaXdU0Mca
 nSKAuvps3w1Gf5HcZ/UV36QHuBLIHv7bsWu2lzty+ssG4gz2BSZFTpjOncA+qUe1hIbx
 gWe0xtx3vs9PP0cFE+SnaxIt0m8wqGw+QCONX+uIVLwC5tKdkaR8RhVT56xQ0/3lRcDT
 qJsVsMDkcI6ONPhLJEMKVd5gAx6aiV+LBJASpzd/NR2h7FJTpGoIZbAjOVZtl099PSSI
 pSqkFKFFmIr3c+oaV+nZGeduBuxjY0j6DhKxJYp2yJ/ueb0uArCDy47djdEOdPzFCI6s
 lFLg==
X-Gm-Message-State: AOAM530lZQ7eSDvOt7slCpBBGl0wV/C4X6/gKifh7ew5j0BtP2+zTUQU
 GV6snm26MCkixD2THhGlyV/JxOdZBRKvAlSiWDx35Q==
X-Google-Smtp-Source: ABdhPJzLB5NlYV45pIJuUMVagY3L6xMxbUFIq2s+ZNpP1onBVgqJSX6FdxQ7mdxdsTZ9Lnv8pd7hqCa1JK4jWk9XWz4=
X-Received: by 2002:a9d:23ca:: with SMTP id t68mr1903105otb.281.1610096621321; 
 Fri, 08 Jan 2021 01:03:41 -0800 (PST)
MIME-Version: 1.0
References: <20210107140103.0cca6432@canb.auug.org.au>
 <e1042fe6-10e9-b62c-fae9-0d3b66e42866@infradead.org>
In-Reply-To: <e1042fe6-10e9-b62c-fae9-0d3b66e42866@infradead.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 8 Jan 2021 10:03:30 +0100
Message-ID: <CAKMK7uGP6tmmSx8jFcGK_kLDYQO6PBy-TYMEj=WWh5VRTJ7cFQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Jan 7
 (drivers/gpu/drm/imx/parallel-display.o)
To: Randy Dunlap <rdunlap@infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 8, 2021 at 9:55 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/6/21 7:01 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20210106:
> >
>
> on x86_64:
>
> ld: drivers/gpu/drm/imx/parallel-display.o: in function `imx_pd_connector_get_modes':
> parallel-display.c:(.text+0x8d): undefined reference to `of_get_drm_display_mode'

Probably something in the pull from philipp that I just merged
yesterday. Philip, can you pls take care?
-Daniel

>
>
> Full randconfig file is attached.
>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
