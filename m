Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21673E179B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 17:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F8396EAC5;
	Thu,  5 Aug 2021 15:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15E96EAC5
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 15:09:25 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 b25-20020a4ac2990000b0290263aab95660so1390805ooq.13
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FjeAdMkeFHHGhkjNLhEc3XNFyNUvqTuO2bK1MCxp6+U=;
 b=jAQwBcBOp0RFNKz4B/PbZKgoOc+0tf6Fo5tcZ4HKh7QGVfOVN4FW5A9i+Y464WDNX5
 gR430j0+5655owPiyui4Zve86zWuFMOLyyW/Xq6555b0PkV3XZ3kcDN+zuPvz97ZmEZb
 +0L+el0oJLMNh966m/Y7wRAfmP9vEG2dmA+pE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FjeAdMkeFHHGhkjNLhEc3XNFyNUvqTuO2bK1MCxp6+U=;
 b=QgX9f4DoIe2dWkx9stwMesZXp3JKyZiiR4QmLElXWrtGjTQQNsTFgcs2QT2xmyFsVN
 9en8frBlLCjaRdiNE6SROqRoaglR/a/L0ajWE5CIBSKWh4GjQF20PIlblyTkNtDkQNah
 TNNOQzwoyg4ODWTwnedOWpycZQzy0FGMNXYxhYmDziZ06VTeqCQR/JCD2ZCBvQgXvOmH
 UZ6Hn3AO2QX5XDdsTcmdkO62BaYVQETTuRft4MWcUW2aq8TqLRhXl2zk1kJMlqD2jawo
 hij/oTqQmVmO7E+40J/o2qeUmLR1s+Q1r++LbpI2P5D9ZeL68T1qvlOZQjroEHEgg0ZQ
 3TmQ==
X-Gm-Message-State: AOAM531yAPr/sYZgdmaOnZQ/0X4BFroZMSuqu/pE4jloAAyc8HYUl5KL
 enM+YK17TTEIrm+afjJcQjLjlhp4eJizqtMW5tosVw==
X-Google-Smtp-Source: ABdhPJy7dwCEBon6sfhrIs3mMJ9ifZWYD2yETAyzQv2x2OMKLElwh0xtyM+1u6GIWFtUMna3+6c/Vjji1+jjG+0pX6Y=
X-Received: by 2002:a4a:8802:: with SMTP id d2mr3584574ooi.28.1628176165097;
 Thu, 05 Aug 2021 08:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210805105254.11834-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210805150708.14087.qmail@stuge.se>
In-Reply-To: <20210805150708.14087.qmail@stuge.se>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 5 Aug 2021 17:09:14 +0200
Message-ID: <CAKMK7uGwwcC35amx25HRQZbo9zQqmM1ozjUxaEvUjRJOR_tC8w@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Depend on CONFIG_OF
To: Peter Stuge <peter@stuge.se>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 dri-devel <dri-devel@lists.freedesktop.org>, Tomi Valkeinen <tomba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, Aug 5, 2021 at 5:07 PM Peter Stuge <peter@stuge.se> wrote:
> Laurent Pinchart wrote:
> > +++ b/drivers/gpu/drm/omapdrm/Kconfig
> > @@ -1,7 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  config DRM_OMAP
> >       tristate "OMAP DRM"
> > -     depends on DRM
> > +     depends on DRM && OF
> >       depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
> >       select OMAP2_DSS
> >       select DRM_KMS_HELPER
>
> Would it make sense to select OF instead?

select is extremely harmful for any user-visible symbols or symbols
with dependencies. So no, not a good idea.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
