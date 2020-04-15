Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533EC1A9F99
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 14:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9756E9C5;
	Wed, 15 Apr 2020 12:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAD36E9BD
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 12:20:47 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id e20so3184864otl.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 05:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UE6rpdlwFvdfTXoFA7p11R3S7pUDfy1r6oxes6989jA=;
 b=BVSIAkfhGxqF6WKHixp5hfbrLcj7+o9z83sAtBUU567ipjEfJ5FZriMcrkhq6nrTJc
 k0F8z6FNwoNVuZxDsjw5ppQO9aPF8jghV2ATbcLvZF8ov9lTc0AzWgmM9FgYQKmLRunE
 Z9NkWyl/nQ17E6o4aehdF7tBVUrQi4Y55kTDU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UE6rpdlwFvdfTXoFA7p11R3S7pUDfy1r6oxes6989jA=;
 b=qrNuK6gXlMqUiWzvCW7uti1Y8g0X5O5O1/0Y5ASDS4fnQrF+FJz9RbAiWFYauBQuTN
 T5Y7mbapDaftGO2d62Ie7BAlChTerBfhRJ8ikhmQMO2RZRyIHymCdveKKt0lBLYULiZf
 L65ABfdNKw/dfL9+/LakD88ZRwO+tp3a4dulYCKR+0c8Z78jzUYyuAVnTUoZGIWIrMAj
 4A8xXCx13j3OfgOlEWIA0dDw1Vj9IRjzAhiCghjvd15RneEGhy8TY13eFXQRxnR6yyST
 VXaXoeXLYuKVhQGenvyWLHZ+KxEV1VvLQJECzTvzfT6bWDE2xUCzZWDhjrYFXwLq0G9d
 SQuQ==
X-Gm-Message-State: AGi0PuYE3PYa93wGl5f83QCkAAewMdGplLDkyI6BfjM/hZDINGIuCwvR
 1TahcC1n6TpKeKTbByqIY78Os1t0mGZPSrGDQrPalg==
X-Google-Smtp-Source: APiQypKaJSnQ+/NMG1CKvsHPl8qdTVtKGK/bnmiVVXU8nh64t/Vsk5/hvdUmAYmx0I63XbG6Jh/R1JxlCtB9eOjNidg=
X-Received: by 2002:a9d:2056:: with SMTP id n80mr23408571ota.281.1586953246529; 
 Wed, 15 Apr 2020 05:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-54-daniel.vetter@ffwll.ch>
 <20200415094512.GA30444@ravnborg.org>
 <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB14532DA5713E3B579ABFE1F4A1DB0@MWHPR12MB1453.namprd12.prod.outlook.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 15 Apr 2020 14:20:35 +0200
Message-ID: <CAKMK7uGDGgt8Cm_bFoyzeoP2CWyiUNdUwb7GL6Ohu3k0rP0p1w@mail.gmail.com>
Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 15, 2020 at 2:03 PM Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Daniel,
>
> > -----Original Message-----
> > From: Sam Ravnborg <sam@ravnborg.org>
> > Sent: Wednesday, April 15, 2020 12:45 PM
> > To: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>; Alexey Brodkin
> > <abrodkin@synopsys.com>; DRI Development <dri-devel@lists.freedesktop.org>; Daniel Vetter
> > <daniel.vetter@intel.com>
> > Subject: Re: [PATCH 53/59] drm/arc: Move to drm/tiny
> >
> > Hi Daniel.
> > On Wed, Apr 15, 2020 at 09:40:28AM +0200, Daniel Vetter wrote:
> > > Because it is.
> > >
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > Cc: Alexey Brodkin <abrodkin@synopsys.com>
> > > ---
> > >  MAINTAINERS                                         |  2 +-
> > >  drivers/gpu/drm/Kconfig                             |  2 --
> > >  drivers/gpu/drm/Makefile                            |  1 -
> > >  drivers/gpu/drm/arc/Kconfig                         | 10 ----------
> > >  drivers/gpu/drm/arc/Makefile                        |  3 ---
> > >  drivers/gpu/drm/tiny/Kconfig                        | 10 ++++++++++
> > >  drivers/gpu/drm/tiny/Makefile                       |  1 +
> > >  drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} |  0
> > >  8 files changed, 12 insertions(+), 17 deletions(-)
> > >  delete mode 100644 drivers/gpu/drm/arc/Kconfig
> > >  delete mode 100644 drivers/gpu/drm/arc/Makefile
> > >  rename drivers/gpu/drm/{arc/arcpgu_drv.c => tiny/arcpgu.c} (100%)
> >
> > We have "DRM: ARC: add HDMI 2.0 TX encoder support" which
> > adds another platform driver to drm/arc/
> > This speaks against the move to tiny IMO
>
> Indeed that's an interesting question, see v3 series here:
> https://lists.freedesktop.org/archives/dri-devel/2020-April/262352.html

Looking at this patch series, feels a bit like hand-rolling of bridge
code, badly. We should get away from that.

Once you have that I think the end result is tiny enough that it can
stay, bridges intergrate quite well into simple display pipe drivers.

> BTW should I pull that series in my tree and send you a pull-request
> or that kind of change needs to go through another tree?
>
> Also I'd like to test the change we discuss here to make sure stuff
> still works. Once we do that I'll send an update. Any hint on
> when that change needs to be acked/nacked?

Simplest is if this can all land through drm-misc, is arc not
maintained in there? And there's plenty of time for testing, I'm just
slowly crawling through the tree to get everything polished and
cleaned up in this area.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
