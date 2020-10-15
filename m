Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AA928F76B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 19:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB60D6ED88;
	Thu, 15 Oct 2020 17:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E6B6ED92
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 17:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602781410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZ+HtkW9/US8p9eIWMS1JqM01+ysPLOkWvnGLPTK0bk=;
 b=OVoz5JfTln6kyMGNMmaTIg8E8ZOFzldDmWBX5WHjehr/iFjxZPYfEEcD4mhmllA0M8uBsz
 jD1jo0+PAPJSPE10kxgU+YChjIxi4JurTG5d1cEOv+5Dm7CBrLONRJklamWpTCqHcSCO6X
 tGIFzbtw+pO2e4MbOIiFZxjCqZ6geic=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-MV9SxAm_M_eZk3w6c2vZFA-1; Thu, 15 Oct 2020 13:03:26 -0400
X-MC-Unique: MV9SxAm_M_eZk3w6c2vZFA-1
Received: by mail-qt1-f198.google.com with SMTP id b12so2317714qte.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 10:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MZ+HtkW9/US8p9eIWMS1JqM01+ysPLOkWvnGLPTK0bk=;
 b=t4mvcR73w5yl2KM4lPUU9pDtRDOfF/GhdyEcJIM/Gs0ikHHN9cCDxWSS/SeeYE2p/X
 Hf9AzI9ftQKiQKqb14hkxgwnSRsYPmY/87ZpZ5v16bwUcUDqpvEDcBA0A3BJbcAXEuD2
 jR1ftZYZqCIuSglNYUJbaY88ASUizce4ofXN0wkizkT9G/Jb6V+DtfdJ86niJ7xNjDkm
 Za/SbYQLplDcOx/c7idKYj2LCdnpBXOAN23ldrsJSJLDAmcgR45RsONKHowBqXNDDuh7
 m27AU5DRJn/IjDPNgqJkmywpMrLb+CYK6HgVlfMxCcVcmMDhl7//3ACKbllcFacWH5aJ
 xVvQ==
X-Gm-Message-State: AOAM53145jNjXiUtgVtPkkjI4+1NwEben5IW6CH8sAO+RrWnc2sQgskM
 sjACSS83UV46NbdXF6z7lUH7XN2122pYanTLtiaqzuAIhSSRCkKp487FQUdOs2VIkRfxcDXgyi8
 SuvU0Fe5gf0CQjC+7bzL/uaAWYygTffIubKDQLmgMF1Lf
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr5081787qko.192.1602781405505; 
 Thu, 15 Oct 2020 10:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9/19KaH9fBtSabelwlRB2jV6hDoMo13yhmIvM2xtY6dLjjAeCvxgABDoRY001mtnGcqtc06Nfdel1kicxM30=
X-Received: by 2002:a05:620a:1668:: with SMTP id
 d8mr5081767qko.192.1602781405261; 
 Thu, 15 Oct 2020 10:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201014075419.19974-1-keitasuzuki.park@sslab.ics.keio.ac.jp>
 <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
In-Reply-To: <CACO55ttZCVZM2v1oWRq7mzZy3DVDe3h1fH80D6RNFM3xR4VjuQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Oct 2020 19:03:14 +0200
Message-ID: <CACO55ttfu1xbQ6e1rk0KZkNdJ7Jik91u0vp=e046hf6D7g1Z9Q@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH RFC] drm/nouveau: fix memory leak in
 nvkm_iccsense_oneinit
To: Ben Skeggs <bskeggs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: takafumi@sslab.ics.keio.ac.jp, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 6:32 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> Ben, I think this is like the 5th patch tackling this issue, I think
> we should merge one of those.
>

maybe I just confused that with reports, but it seems to turn up quite
a bit and maybe I should have pushed more of it as well...

Anyway, the patch itself looks good.

Reviewed-by: Karol Herbst <kherbst@redhat.com>

> On Thu, Oct 15, 2020 at 6:23 AM Keita Suzuki
> <keitasuzuki.park@sslab.ics.keio.ac.jp> wrote:
> >
> > struct pw_rail_t is allocated as an array in function nvios_iccsense_parse,
> > and stored to a struct member of local variable. However, the array is not
> > freed when the local variable becomes invalid, and the reference is not
> > passed on, leading to a memory leak.
> >
> > Fix this by freeing struct pw_rail_t when exiting nvkm_iccsense_oneinit.
> >
> > Signed-off-by: Keita Suzuki <keitasuzuki.park@sslab.ics.keio.ac.jp>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > index fecfa6afcf54..8ba8d8e3f52a 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > @@ -280,8 +280,10 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
> >                         }
> >
> >                         rail = kmalloc(sizeof(*rail), GFP_KERNEL);
> > -                       if (!rail)
> > +                       if (!rail) {
> > +                               kfree(stbl.rail);
> >                                 return -ENOMEM;
> > +                       }
> >
> >                         rail->read = read;
> >                         rail->sensor = sensor;
> > @@ -291,6 +293,7 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
> >                         list_add_tail(&rail->head, &iccsense->rails);
> >                 }
> >         }
> > +       kfree(stbl.rail);
> >         return 0;
> >  }
> >
> > --
> > 2.17.1
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> >

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
