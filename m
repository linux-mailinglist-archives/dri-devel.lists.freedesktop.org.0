Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EA22168F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 22:49:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C3E389AD2;
	Wed, 15 Jul 2020 20:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc42.google.com (mail-oo1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE28289AD2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 20:49:09 +0000 (UTC)
Received: by mail-oo1-xc42.google.com with SMTP id t6so742151ooh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 13:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iKzzj8zSTXcQ4stpa90DPw4HD3mp4PdLWYGCtZd2rco=;
 b=JbTsxR3PBqZV5d7QZxMjf1cpYNU3NhB1eROFkpXVDZntkDw+HMdQfLbF4ukgRo6qZW
 lTAH8wcvfNRko0J+gKKP8BVm0QuLm34SnnCJ5C0V1wD9saZnr2Geo0nuRMU1sGwvJCj+
 vEoLoscckcK1Y1GdeZREEBQHeIcnp7yHdzHRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iKzzj8zSTXcQ4stpa90DPw4HD3mp4PdLWYGCtZd2rco=;
 b=STHISa+Q5DmCZGFlUeUMTjl6+ouHJW1xPppHwF646imXCFRpp8r20cQ3+H9VBlYWYe
 xYtvVZiuwqSuY1VEb0zWW7gJMbPWIL0aDzMUgrxvfWhiKbNAJBoAsYGY8QfalcmZ78M8
 RZ8DPDlLXvo36e/Atpf7pfBPgrwe7ucRX4qfJuGAl51APIRpNQoIqS7ed753NBv+n3Mg
 ogpcW77j//0VZ/UUhk0pUKzyM8j8aKejB7U/LAmdVxpEg6Lk0ePuZgmXrtlxdF8ztjaO
 3EC92TsfW7qtr7xm2ypVHp3J0yqXSFfwZjFmczUYsAQ491c3X3bIMWoqLn+AM4tWPmGK
 8EHA==
X-Gm-Message-State: AOAM532J29PvyRsVOql7yR4SB28W1EjIJvP8fGv5EgZjO219Ri6mgvL1
 QZgTOxGKL/uEsOCtcKMLPUvcPNRjvq9mzrp2WKQiIQ==
X-Google-Smtp-Source: ABdhPJziLvwDTEmy76j+v/HNPYt2tB3GXWPfceubgXWnsQk3Vt+k66GrFFtZFVuc8vR6ZZ6wSvsrbwu/5DqIrxTIi5g=
X-Received: by 2002:a4a:bb8a:: with SMTP id h10mr1049097oop.28.1594846149054; 
 Wed, 15 Jul 2020 13:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200715145902.13122-1-tzimmermann@suse.de>
 <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
In-Reply-To: <CAPM=9tx1+cNHR3aYWFNey9veYn18A=b1Tgm9Pa4UvKjUSFg22g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Jul 2020 22:48:58 +0200
Message-ID: <CAKMK7uE-7ggF0Sibkap64vxbZNbcMxFDuuxfDO+QDsXQfY0dQg@mail.gmail.com>
Subject: Re: [PATCH 0/8] drm/mgag200: Support desktop chips
To: Dave Airlie <airlied@gmail.com>
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
Cc: John Donnelly <john.p.donnelly@oracle.com>,
 kernel test robot <rong.a.chen@intel.com>, Egbert Eich <eich@suse.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 9:56 PM Dave Airlie <airlied@gmail.com> wrote:
>
> On Thu, 16 Jul 2020 at 00:59, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> >
> > This patchset puts device initialization in the correct order and
> > adds support for G200 Desktop chips (PCI ids 0x520 and 0x521).
>
> why? :-)
>
> I'm pretty sure I NAKed the previous version because the userspace
> experience for these old cards was probably better with
> xorg-x11-drv-mga, but hey maybe it isn't anymore and we should go
> ahead. I know SuSE use these for testing, but apart from that do we
> really think we have any users for this?

I'm more of the "why not" kind ... if you don't want this driver,
don't enable it. Maybe worst case the physical card driver ids should
be a Kconfig option or so. But if the goal is to stomp fbdev into the
ground I think we should be ok with having drivers for anything. Even
if it's kinda horrible :-)

Of course you're not going to get any kind of acceleration, but then
modern desktops don't accelerate if you have anything less than maybe
gles2 anyway, and that entire idea of a reasonable 2d api that's
actually generally useful died a hundred times already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
