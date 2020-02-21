Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C25B1686D7
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 19:41:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A4996E110;
	Fri, 21 Feb 2020 18:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9EF6E110
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 18:41:05 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id f5so2450003ilq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 10:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dVPlcvNxwx9ZkHS9f2hEWtvziykNwBPT78iqxEtnB8s=;
 b=W/Xs7ojIqaiVfFgz1JozgRSCx9Xorm7HfK3vxIkt0eH5m+QMMN1E+Ft83fwx6bAEL0
 W3oFAs+IZYaphnFpE7zKEYQ1SUQezKWhBO6asB+zO1kzm8FQZDmmPvj1Gs/JniOBur7g
 2cCqtJzEwV7Nz284Vkj47KD41dn0JcWf/yJ1v2BmCma2DZVTmjy1P22+uABw4yCzTMez
 mT7CbRCCEz8iH9+js+l09Y1UFb7V8n5MIw7Lm3+iQLMrFwIS6vCbq4dtaxf2h0Tvn23D
 qQ/POf11DGLpzoH7oNBMb3QabjvZVOqbKcF+hLKSfVrhxpAOsJJp5PVPr5WAT0evBiU/
 AFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dVPlcvNxwx9ZkHS9f2hEWtvziykNwBPT78iqxEtnB8s=;
 b=hTcQT6c7wprNZONiNnSsVnT5st/i+PddwjSK+qRqRKycEXYSLYDgl9C09yNeKsaFNC
 ZbrP8TpUGUzP4Lq5dM90P9EvhG6sJ6t2XhGSZlEV9dWnQ7IowiAovcLwczwwS3DMiSac
 kXeKm9M2F5X6Y90QLLWB2mHgXtljp9DLl0MJqdG4E951QxT8AyKPvdTUiwx3M+HaiKOT
 zYpONXJEs+l+NToWvS5/tufBoUvakUt45E5C5vxNXqsBAPafDm3pN2b+xTRgKNEbiZ4i
 mpRb8KrTHuvbgrL5TXwuEfUHVKdjQa7WKMrSJ354we4wdcTLh/Q5iEq2IyYNKB458ecB
 LNoQ==
X-Gm-Message-State: APjAAAVMI2o5ri9/p0uE0Km3f4HrYkul0lPcW5kmxTf4ouuxPGosgrxs
 BRZ8s9a82IcscdMsUQv05LXBTOmXnBgzb7F2ujQ=
X-Google-Smtp-Source: APXvYqxdEG5HGWeFUff/aWEuEdpbB8sDRBhfZT2zh46Kt6vQOkU2J71Cb2dTE3mppzkZlArCA4ihBJ3jFjQKwAcN2Zk=
X-Received: by 2002:a92:4a0a:: with SMTP id m10mr39059215ilf.84.1582310465029; 
 Fri, 21 Feb 2020 10:41:05 -0800 (PST)
MIME-Version: 1.0
References: <VI1PR0802MB22374AD8B80182D2F186ABB483130@VI1PR0802MB2237.eurprd08.prod.outlook.com>
 <CAPaKu7Rqbw=v7Cr4ksh+C1FMHEcCK=yZ9DARLMmTH38Gt_-F+A@mail.gmail.com>
 <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
In-Reply-To: <VI1PR0802MB22377E26E3ACB09F0527BE1583120@VI1PR0802MB2237.eurprd08.prod.outlook.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 21 Feb 2020 10:40:54 -0800
Message-ID: <CAPaKu7Snxz=AwRMeDPokuHmZyQrptmySS9tUtsW4f7GwgJ06Tw@mail.gmail.com>
Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
To: Guillaume Gardet <Guillaume.Gardet@arm.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Catalin Marinas <Catalin.Marinas@arm.com>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 2:06 AM Guillaume Gardet
<Guillaume.Gardet@arm.com> wrote:
>
> Hi,
>
> > -----Original Message-----
> > From: Chia-I Wu <olvaffe@gmail.com>
> > Sent: 20 February 2020 19:41
> > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > Cc: dri-devel@lists.freedesktop.org; Gerd Hoffmann <kraxel@redhat.com>;
> > Daniel Vetter <daniel.vetter@ffwll.ch>; Catalin Marinas
> > <Catalin.Marinas@arm.com>; nd <nd@arm.com>
> > Subject: Re: [Bug] virtio-gpu broken with qemu/kvm on arm64 on kernel 5.5+
> >
> > On Thu, Feb 20, 2020 at 4:44 AM Guillaume Gardet <Guillaume.Gardet@arm.com>
> > wrote:
> > >
> > > Hi,
> > >
> > > With (guest) kernel 5.5+ with qemu/kvm on arm64, I get lots of display
> > corruptions leading to this kind of screen:
> > > https://openqa.opensuse.org/tests/1174521#step/yast2_i/24
> > Looking at the screenshot, it seems cacheline-related?
>
> It could be.
>
> >
> > There was a change of memory type
> >
> >   https://lists.freedesktop.org/archives/dri-devel/2019-August/233456.html
> >
> > While the guest memory type is ignored on Intel, it is honored on ARM.
> > This attempt to fix it
> >
> >   https://lists.freedesktop.org/archives/dri-devel/2019-December/248271.html
> >
> > does not seem to land.
>
> I applied this patch on top of 5.5.4, but it does not fix the problem.
> Maybe more similar changes are required?
The patch looks legit.  Maybe the memory type is not the root cause?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
