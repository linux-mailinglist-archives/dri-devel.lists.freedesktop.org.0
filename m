Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB953E086E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 21:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEAA06E44D;
	Wed,  4 Aug 2021 18:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4B86E438
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628103592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6Y9wLKgvbcBXmzq59WFKbPsBB9KXRj1k5gZ7Uo0zgM=;
 b=icQX1Ams6B2JTt9m+5XXi+9DByF93OdInlih0qJhTCjc80sJXmpSpibjSfPDVO4s6yB/YG
 4iRqqY+AfVQxUBlVq5wXg92GU6TbjPcKQ22vcBKkudD1o2Vb7d++wnQKN/VTr0gCno88DD
 HNqb1Z9uL0wZ7WzFLdlVJD+zLJVCLlk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-0UFW88YzPVeOWvwe-opJRw-1; Wed, 04 Aug 2021 14:59:51 -0400
X-MC-Unique: 0UFW88YzPVeOWvwe-opJRw-1
Received: by mail-wm1-f69.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so952795wmr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Aug 2021 11:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6Y9wLKgvbcBXmzq59WFKbPsBB9KXRj1k5gZ7Uo0zgM=;
 b=mtlm5yRK38ObQjK7NihZeFJko2CawDmPHZfOqyQ/YwaNURLpVveYFgClRWRFmW3pRN
 QTVKBfaBZJc0iozbLj6VeyCcJJetnRGcpIaNEdmq3hsmfblkpdcz909hXxq1SnF4Jodb
 7oVxYGjXBIrATZ7ZK7IK8nuF0akUwnYatqg2MXUOw+2guRRew6/Kbre9bHsMiIJ2GQby
 A5fciBAWVqCfXxdnHL7T75rSblFH3rm7PLMwXtD3wDErNBCXXZSWcUEfzeVOy5+s6Ift
 SJk/UQZRViMbc5+iWcBDpOpiVl/Ph88saIeoPyd9MzR2tCkpQQ8DcBJJpZfgjvrS2LW5
 gztA==
X-Gm-Message-State: AOAM533Bdsr0HTaXpmZPBtdwBd8ChdyyM0DZj2+mM4RaiODvjWooWP5m
 56Q/QZxh3/7kNfqPQC/4Dn4R+7A9p5uT24XkiUBfk1rdUe1gwWgfmymZUha976GO4VJqcm6trID
 pHkxhp7DVLP+miB+OxVXvTSiINrwam+htAGxtvGUGLwGj
X-Received: by 2002:a1c:4c:: with SMTP id 73mr11093301wma.139.1628103590252;
 Wed, 04 Aug 2021 11:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhSQsWnmHBJ0c+6q+9oNf5P9jAy2HMqrpqSesVTuGeJ7py4jp3l1Ku85Qc9jxKYKufAhOS69CECl/Kud9SaJo=
X-Received: by 2002:a1c:4c:: with SMTP id 73mr11093289wma.139.1628103590064;
 Wed, 04 Aug 2021 11:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
 <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
In-Reply-To: <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Aug 2021 20:59:39 +0200
Message-ID: <CACO55tuy5Am9zbcR490KWYYAg7MguBN5m82vbjzifGN5KpGbxw@mail.gmail.com>
Subject: Re: [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more devices
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

On Wed, Aug 4, 2021 at 4:43 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > playing around a little bit with this, I think the original "select
> > > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > > drivers selecting and others depending on it. We could of course convert
> > > everything over to depend, and break those cycling dependency issues with
> > > this.
> > >
> > > Anyway this change on top of my initial patch is enough to make Kconfig
> > > happy and has the advantage of not having to mess with the deps of nouveau
> > > too much.
> >
> > Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> > option itself 'default FB || DRM' though, to ensure that defconfigs
> > keep working.
> >
>
> okay cool. Will send out a proper updated patch series soonish.
>

mhh, actually that breaks drivers selecting FB_BACKLIGHT as now
BACKLIGHT_CLASS_DEVICE might be disabled :(

somehow it doesn't feel like worth the effort converting it all over
to depend.. dunno.

Atm I would just use "select" in nouveau and deal with the conversion
later once somebody gets annoyed enough or so...

> >       Arnd
> >

