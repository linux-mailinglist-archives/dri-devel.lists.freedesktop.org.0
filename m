Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB66561FF97
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 21:33:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E4F210E495;
	Mon,  7 Nov 2022 20:33:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15BA510E45F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 20:33:36 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id s20so7931237qkg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 12:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tQ12e4GxkKyFcKEY5nkb37j7G30vKsrEMR9/r8hrDJ0=;
 b=qOA73a9Bu14wWQY9g3t4J1/QCrXaAC0kVgEP7vGn7s/hrSLZK1U5lSJdfg2csQ6fAK
 WwKqBdSf89jpNfxi2VzukRNviRsgtuVPSIMhup7OeZHHqpG5OSPrl0DXf4dSSli7uiim
 1ggrG3Hq8LIxqvz5HH/ip0y8FBKwNlk3dMGK1cun8A4sMzX7BcASPDkxk6Hv40GJeJKZ
 DOcJVRMK545RBtSxA+LQdBLupe342yB1UI515gfRhUBaglQQy2nwZvBfUqR91ayy8M3G
 Tu5CcIwxmd643GZbxFCoCcwmyLvUtWsgpSCNRPmH9VR8qa7ZtAhGUPAO7GhyZU8nkYmk
 ctpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tQ12e4GxkKyFcKEY5nkb37j7G30vKsrEMR9/r8hrDJ0=;
 b=dAL/vRIafzmtODYudhcV/DNNAD8tQiAr3M6ATjH3yTFjgcbfzhxSQxkYb1FIrl+zPP
 Y4Tmgp24/HhDT9H0yp5ZNQRGONeZkMUy5IR9w5QwwoNBSjSPOOCTp+VbGF9Nx58ao/tD
 C4XPsPaTfYKfCMgNPuIJEF2rhROnBJs8uKzIL7h+yU53jARuhX4YaQ0ab45ZgUcYh1mU
 McQ3wWrbpGqbJWricGWGjr8WRQ3t/IInmKjzL6n8E9MdYptCofoYTtbTiJQgQ6PMMJw7
 hVND830C2+pFwLk1mZTuLQyPL6bUsGGj74UL5gIvQ8TslM+N9scSmCsa2sGfzIsdCMW2
 WS8A==
X-Gm-Message-State: ACrzQf0nlsPzKtk7XPTsB63BK71LPksatc++5RilhZ9phU4LPRztc6WB
 MgDd0Hf/ZFo1Oc5/fyBH+Oc6uQEYM+uqZ5GxItI=
X-Google-Smtp-Source: AMsMyM6W0Bmt/046gPuBut+yT3A+X2p6Q2Q0RhxhI78tSZHtV+jn2n9Nhb0DbPX1ACdKiqOWowMD95Cq0zllpC3GhtI=
X-Received: by 2002:a05:620a:1009:b0:6fa:1245:ce4 with SMTP id
 z9-20020a05620a100900b006fa12450ce4mr37596615qkj.483.1667853215067; Mon, 07
 Nov 2022 12:33:35 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
 <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
 <Y2kRvyR8VrZrO/1H@nvidia.com>
 <CAFCwf12E4K7bpLcDvTtG1mKxoy1JnchXGCKDvcKAayCFvGWXXQ@mail.gmail.com>
 <Y2kyvswuCsO0x1/2@nvidia.com>
In-Reply-To: <Y2kyvswuCsO0x1/2@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 8 Nov 2022 06:33:23 +1000
Message-ID: <CAPM=9twxu3v4voSukrkror1BrajShRLY9CFxYWpL2rwK7fMiKQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > >
> > > "drm_minor" is not necessary anymore. Strictly managing minor numbers
> > > lost its value years ago when /dev/ was reorganized. Just use
> > > dynamic minors fully.
> > drm minor is not just about handling minor numbers. It contains the
> > entire code to manage devices that register with drm framework (e.g.
> > supply callbacks to file operations), manage their lifecycle,
> > resources (e.g. automatic free of resources on release), sysfs,
> > debugfs, etc.
>
> This is why you are having such troubles, this is already good library
> code. You don't need DRM to wrapper debugfs APIs, for instance. We
> have devm, though maybe it is not a good idea, etc
>
> Greg already pointed out the sysfs was not being done correctly
> anyhow.
>
> I don't think DRM is improving on these core kernel services. Just use
> the normal stuff directly.

At plumbers we decided a direction, I think the direction is good, if
there is refactoring to be done, I'd rather it was done in tree with a
clear direction.

Coming in now and saying we should go down a different path isn't
really helpful. We need to get rolling on this, we have drivers that
want to land somewhere now, which means we need to just get a
framework in place, leveraging drm code is the way to do it.

There is no need to an "accel" module, what does that even buy you,
the idea is to have an accel subsystem that allows drivers to use drm
features, not an accel subsystem that refactors drm features, that
would take years. There are already drivers for this subsystem wanting
to use GEM, and I don't think holding them up for a year to refactor
something that we don't have a clear reason or goal behind
refactoring.

If there is a problem with the drm subsystem interactions with the
kernel standard implementations then let's go fix that and accel will
also get fixed, but there's no reason to start going down that road at
the same time as introducing accel.

Also with the idr/xarray stuff, this isn't the patchset to be
introducing a bunch of new and divergent work, if this patchset
identifies deficiencies then let's document them and work on them in
parallel instead of blocking the initial landing in favour of some
future refactors with no in-tree users.

Dave.
