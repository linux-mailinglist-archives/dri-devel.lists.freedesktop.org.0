Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1DE35E914
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 00:36:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208416E408;
	Tue, 13 Apr 2021 22:36:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA166E408
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 22:36:29 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x77so9238967oix.8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bx5OLW8AWrAh5PTyuugkoe6octVcCySAbvj9ENbK5Ns=;
 b=pE5DEZWx2/TgQcqpVnC47cDiHqpbpHEx3wfvwgCrfwNr7R/bLilrcJDDue2dXX2RjA
 D/0muFx+lzBn13XJcGXSSKtsEhir59A5FBXLm/HA5Nu6t6/V29Y+zo8mOdN6gb9iIQKi
 ICwuDkxX2l4GWZAz4YkkavoOkH267GJgizrOCEbfy8+Hwye8rZcOprHw7CNV7snC1gnt
 ricEEjBzUOHfOxJDwbNMQsdL2DkpoGyFtdf2I1mI/MYFZMBbBoEjHvdqZFLV8/C9ecoh
 t9/aO5e6fJlFYM+A4966q/LM+8PUa9iUqmePdfcoDJbAYvH8bEUDdQM+qnEzhnvs87ZN
 Z2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bx5OLW8AWrAh5PTyuugkoe6octVcCySAbvj9ENbK5Ns=;
 b=QVgi5Jjdw+SRB3mWEMP0GqHYPVjPgzciHXjc5SofeOnEO8i/p9rzoQ7iNka5ImOQfE
 /AkqDuroRPU0ryDnIcnVpleSO/uuqbYdYt8YOEa5xcN3EbxPRsmqu0mFvHv+4Xyide5L
 FPcDgiUutTtf4AIoYrOEaKIqZ8/8L06yGHeVjH8qOCrvticJKDozTQaUuXHL9nkvjFKI
 wgjTwuXMYyP9SOUFY2PHQ9+TRq3jrPyLq82XZEl/g6ClvS7Jgszv7bGnyiFHq5EtwiWN
 tVAlewhrsIco8I3GB/5dUXConIJOh0IFqsiIqh5IoJIXkoqh/Zil4vtNRM3R/99xCT0g
 0AIg==
X-Gm-Message-State: AOAM531YHoDbGBJdyzHJIm63eL/dHfji+Brz4qlD5YPdwcwphg5LBKlZ
 kI67WZQ26An/3vSSca5GYxRHMmrLvjefSJtCC3Q=
X-Google-Smtp-Source: ABdhPJwEdmwr7xDJd0k+ned0ruUp46LLigHsDmi5gLJyYlfy/iFttzbyPoczsn+KdUL9vH5TG82e74jcUuhNg4IXTTo=
X-Received: by 2002:aca:c08a:: with SMTP id q132mr2359oif.5.1618353388627;
 Tue, 13 Apr 2021 15:36:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210413170508.968148-1-kai.heng.feng@canonical.com>
 <CADnq5_P7_7jOZWTo+KCj3jOpmyDPN8eH3jNTgg3xLC4V9QM7kQ@mail.gmail.com>
 <CAKMK7uHR0VDk=C+u1d5qiiqQP+3ad5_gXQwvmPbJ56mG=3RjpQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHR0VDk=C+u1d5qiiqQP+3ad5_gXQwvmPbJ56mG=3RjpQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Apr 2021 18:36:17 -0400
Message-ID: <CADnq5_MpDz9myx8HiKihq-6_Ud48sN=NXN1_ga7WZa9LguzSjA@mail.gmail.com>
Subject: Re: [PATCH] efifb: Check efifb_pci_dev before using it
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 pjones@redhat.com, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 2:37 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Apr 13, 2021 at 8:02 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Tue, Apr 13, 2021 at 1:05 PM Kai-Heng Feng
> > <kai.heng.feng@canonical.com> wrote:
> > >
> > > On some platforms like Hyper-V and RPi4 with UEFI firmware, efifb is not
> > > a PCI device.
> > >
> > > So make sure efifb_pci_dev is found before using it.
> > >
> > > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > > BugLink: https://bugs.launchpad.net/bugs/1922403
> > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
> fbdev is in drm-misc, so maybe you can push this one too?

Yes, pushed.  Thanks!

Alex

> -Daniel
>
> >
> > > ---
> > >  drivers/video/fbdev/efifb.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> > > index f58a545b3bf3..8ea8f079cde2 100644
> > > --- a/drivers/video/fbdev/efifb.c
> > > +++ b/drivers/video/fbdev/efifb.c
> > > @@ -575,7 +575,8 @@ static int efifb_probe(struct platform_device *dev)
> > >                 goto err_fb_dealoc;
> > >         }
> > >         fb_info(info, "%s frame buffer device\n", info->fix.id);
> > > -       pm_runtime_get_sync(&efifb_pci_dev->dev);
> > > +       if (efifb_pci_dev)
> > > +               pm_runtime_get_sync(&efifb_pci_dev->dev);
> > >         return 0;
> > >
> > >  err_fb_dealoc:
> > > @@ -602,7 +603,8 @@ static int efifb_remove(struct platform_device *pdev)
> > >         unregister_framebuffer(info);
> > >         sysfs_remove_groups(&pdev->dev.kobj, efifb_groups);
> > >         framebuffer_release(info);
> > > -       pm_runtime_put(&efifb_pci_dev->dev);
> > > +       if (efifb_pci_dev)
> > > +               pm_runtime_put(&efifb_pci_dev->dev);
> > >
> > >         return 0;
> > >  }
> > > --
> > > 2.30.2
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
