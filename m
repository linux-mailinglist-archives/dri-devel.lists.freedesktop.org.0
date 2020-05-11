Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E12671CDCD1
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 16:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8496E486;
	Mon, 11 May 2020 14:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6F16E484
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 14:15:05 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id s139so999114oos.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 07:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qaKk+yEGj0jFQST8DEnVdOnwenk91QCipY4dq3XlJ2U=;
 b=gntQ+sol5OQ/Vbs+K1qUG9fKYz621mtFM5l05dGItrnRfss8HI6N9qWXgVu23rpLgy
 ihSIQzNzyNNHMc+QpBXwT/fLiC14NAjcI4kJD/KffuhVSyLoxUoTIdhCH4ZPth8MNROe
 6ZrOcUjDKSWSnZoCHqwh6M0bHKTgK6b4GQQjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qaKk+yEGj0jFQST8DEnVdOnwenk91QCipY4dq3XlJ2U=;
 b=WJz196al4zVeyyP9l9qAh7HWpA78Nzh4YtVUk+JHZs3ziDN1E4nVG8sJh/k9n1vGm5
 9zl3rNx71GG0cKvxzYATIrqnXZdkvWsx75S21w6x4fiaj1vzJapiEGHmHto+sNXLE7Cn
 WZxQNYSLoPD7CMmWcmHk6ZKvPlKs85UIHRzYYGPA+Kqyq9ZuV5izIZlClSn8dh52WNha
 RUwcr6f+J8s1MtOee0QYiZSbLrMUHenEUM3PFtSS/kx4Pt8KedKD3kv7ERLpmHYnRrll
 tdqA58HcIy0mJPJh2uut0jI8E1R9Df43ueKuD81gaeKFdoefA+KY055v7Uftyn4L0j4W
 e+oQ==
X-Gm-Message-State: AGi0PuZInB57oFb1vdDxjfPLk4hJ71YeR0XTAzDVncz+rswOlt7zEBcK
 Lo7CE9sASl05EXJJK35S0RBG6gexPusPTh9qpB3OqA==
X-Google-Smtp-Source: APiQypKPh/Puo441x0mdTbOGGFru2eEyNnIVIYdN6JHa3U33HQkohYLKJPDp+3vStmWsaP5Cuj1PO9Cy/XtoQRetcqA=
X-Received: by 2002:a4a:d136:: with SMTP id n22mr13869652oor.85.1589206504836; 
 Mon, 11 May 2020 07:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
 <20200511114307.jfirnlvkikmulyhu@wunner.de>
 <CAKMK7uGA7XHPwuS3GF9u+YQ-GRBfZzf5CCRH15Tx_qnH3Pcchw@mail.gmail.com>
 <20200511140840.kd2yacwvyuaqkxkk@wunner.de>
In-Reply-To: <20200511140840.kd2yacwvyuaqkxkk@wunner.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 11 May 2020 16:14:53 +0200
Message-ID: <CAKMK7uFk3=iN7zdPgtX5wUkYYA2wMfSB0M7PcwpZarU6XJQekw@mail.gmail.com>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
To: Lukas Wunner <lukas@wunner.de>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 4:08 PM Lukas Wunner <lukas@wunner.de> wrote:
>
> On Mon, May 11, 2020 at 02:21:57PM +0200, Daniel Vetter wrote:
> > On Mon, May 11, 2020 at 1:43 PM Lukas Wunner <lukas@wunner.de> wrote:
> > > On Mon, May 11, 2020 at 11:54:33AM +0200, Daniel Vetter wrote:
> > > > - One unfortunate thing with drm_dev_unplug is that the driver core is
> > > >   very opinionated and doesn't tell you whether it's a hotunplug or a
> > > >   driver unload. In the former case trying to shut down hw just wastes
> > > >   time (and might hit driver bugs), in the latter case driver engineers
> > > >   very much expect everything to be shut down.
> > >
> > > You can get that information at the PCI bus level with
> > > pci_dev_is_disconnected().
> >
> > Ok, so at least for pci devices you could do something like
> >
> > if (pci_dev_is_disconnected())
> >     drm_dev_unplug();
> > else
> >     drm_dev_unregister();
> >
> > In the ->remove callback and both users and developers should be
> > happy.
>
> Basically yes.  But if the driver is unbound e.g. via sysfs and the
> device is hot-removed while it is being unbound, that approach fails.
>
> So you'll need checks for pci_dev_is_disconnected() further below in
> the call stack as well to avoid unpleasant side effects such as unduly
> delaying unbinding or ending up in infinite loops when reading "all ones"
> from PCI BARs, etc.
>
> It may also be worth checking for pci_dev_is_disconnected() in ioctls
> as well and directly returning -ENODEV, though of course that suffers
> from the same race.  (The device may disappear after the check for
> pci_dev_is_disconnected(), or it may have already disappeared but
> pciehp hasn't updated the device's channel state yet.)

I guess we could do a drm_pci_dev_enter which combines drm_dev_enter +
pci_dev_is_connected. Not perfect, but well then the only real
solution is just unconditionaly drm_dev_unplug in ->remove. I think if
we do an additional developer_mode module parameter, and if that's not
explicitly set, ignore the pci_dev_is_disconnected and just always
call drm_dev_unplug() that would be about as good as it gets.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
