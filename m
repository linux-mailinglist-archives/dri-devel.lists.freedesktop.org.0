Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D45E3E3AA4
	for <lists+dri-devel@lfdr.de>; Sun,  8 Aug 2021 15:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404D589A75;
	Sun,  8 Aug 2021 13:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A8489A75
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Aug 2021 13:49:56 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso25577993pjf.4
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 06:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0Vlv4O+CiiGfTw/zofpUFed/v1n2oDY9+Y7Uzfj16wM=;
 b=KYiVC2VHaB71+mhgVAfQCeIDzoIcjQDknjKITc4iiH5+k9Gm88kp8ZtojDjeBlGOUj
 mQKOcFpLEOiU7ietPDo9fXihVtjcUzZSHmosSIc5fzV5dPpx9FMLwlzxusrkT3dwZBLw
 dY5OuHrGxD9YfHbtq73Ps9FcS/XDFG5CRGWJxvkPiBrNn5iCe5Z0DFoSMBkPdLWwvrnD
 FtCkZ0jhnZxQHR2IX0hM8Ph4Qf9EuSWKb30dBa1YIThdKyfzWlhVL8MCxNpiewEqYW8a
 5F+aQomnJnbAweXPkas5lUL5vrDJmuOvrQ2kP40TofmnSXRxzoEvYuUko3QJmHmtNXr9
 rc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Vlv4O+CiiGfTw/zofpUFed/v1n2oDY9+Y7Uzfj16wM=;
 b=sD8g0KdMNz+MB0zl/41dwfCGhnLO9IHoRamKHSHXhW2Q3nquDRPq/mRduTUun0hOOn
 svcK0unqbA3i8PT/XqGgLEAWFMFOZJYkwHORr5wOU8ZG2ZSoU+hXsETsOw5H0LOp45NM
 77/zLXWgGVfkVkoDbUPdTumgEizQsbj4SUEe/Tn/72CK6BIgJr/6MX0kCJ1Bj7UGpVAy
 grfBMZEyniCMAvEXeU7z2ZVTs09DYOcubRR2t8Xe2szuijeqQRl0pG0/gzUOvPUcAD70
 xv9awhzWl/QQe/xtBCHOwGZ9PNQB4DqmbAhtNg/4hI+k9oaPNXdroxI0SFcRzQIDml/h
 2gpg==
X-Gm-Message-State: AOAM533G9WmwssQMw84jzcwdezkfmKfh4DMSTgT1nnMOkx5Mcf+lPce0
 Z77eW//B1E6rObXQEjsoKtAK+g==
X-Google-Smtp-Source: ABdhPJzgiNdBxlMSy7McgB8x2BvYMF00cwvkEtpi2GPLT1TEg8DH/SM0TQ9ph+jndb0I53Nrmn3pYg==
X-Received: by 2002:a63:5119:: with SMTP id f25mr190692pgb.271.1628430596514; 
 Sun, 08 Aug 2021 06:49:56 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id r10sm16554406pff.7.2021.08.08.06.49.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 08 Aug 2021 06:49:56 -0700 (PDT)
Date: Sun, 8 Aug 2021 21:49:51 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Truly NT35521 panel driver
Message-ID: <20210808134950.GC6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-3-shawn.guo@linaro.org>
 <YQq/LOWEgTIk9zIT@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQq/LOWEgTIk9zIT@ravnborg.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Wed, Aug 04, 2021 at 06:24:12PM +0200, Sam Ravnborg wrote:
> Hi Shawn,
> 
> see a few comments in the following.

Thanks for the review comments!  All of them will be addressed in v2.

Shawn

> On Wed, Aug 04, 2021 at 04:13:52PM +0800, Shawn Guo wrote:
> > It adds a drm driver for Truly NT35521 5.24" 1280x720 DSI panel, which
> > can be found on Sony Xperia M4 Aqua phone.  The panel backlight is
> > managed through DSI link.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> >  drivers/gpu/drm/panel/Kconfig               |   9 +
> >  drivers/gpu/drm/panel/Makefile              |   1 +
> >  drivers/gpu/drm/panel/panel-truly-nt35521.c | 491 ++++++++++++++++++++
> >  3 files changed, 501 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panel/panel-truly-nt35521.c
