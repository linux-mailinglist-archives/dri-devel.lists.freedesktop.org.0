Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEAF367EDA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 12:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7546E372;
	Thu, 22 Apr 2021 10:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED316E372
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 10:41:23 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id d25so7873688oij.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 03:41:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZkoWU4pOXOH5nl2P4HSwkzSQBpPMbT0VUfATt/sd1IE=;
 b=a2HXHkP/bZ5Gat+DPQ3mdDT1yxDVc084o3R5RXWjoB/lvT6EEDdw25dnkcHxU/UbbX
 t1aVdAhuurXT3WBKcalWQ6hRy2enbFkPQ/pVb1DHV0Nembhj8KNEe9TMJRxsZVygPuCA
 PdcKhYCVN2LouVjDifwraK4c+Ogfra0wol7Uds1aP9kFXW6CYrvHRM+KdpVqyNhOQ5Wn
 718c3GzzLw1pC7fXkWfl5HQcj0oxaqq+R78U1EYtuoDm4xaD9p85w6Z8tdTAcWijXhoC
 ultkqhjUgv+TVF1ECzCSBCY9KHthKAl5lthRziknm+jUcBvVFNKynjaUnWS8fRzp3xd3
 e4tA==
X-Gm-Message-State: AOAM5304FaXu9pNuxoAl8VPy/CUELt8byePbwevNwkuh1ekg7cfT80kx
 b0KsRrMUe9k6NQgPEKdMytK7KzCU+vEGtz0B0Dw=
X-Google-Smtp-Source: ABdhPJz/8mzbKbTdBB4a2vYn5MZT4pcwu5nhZkckeIyYN1aDX+TAJ2gNPiuemuE0Conc0rPMX5voV09Ws9cAelaN388=
X-Received: by 2002:aca:2107:: with SMTP id 7mr6822209oiz.8.1619088082362;
 Thu, 22 Apr 2021 03:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210413170508.968148-1-kai.heng.feng@canonical.com>
 <CADnq5_P7_7jOZWTo+KCj3jOpmyDPN8eH3jNTgg3xLC4V9QM7kQ@mail.gmail.com>
 <CAKMK7uHR0VDk=C+u1d5qiiqQP+3ad5_gXQwvmPbJ56mG=3RjpQ@mail.gmail.com>
 <CADnq5_MpDz9myx8HiKihq-6_Ud48sN=NXN1_ga7WZa9LguzSjA@mail.gmail.com>
In-Reply-To: <CADnq5_MpDz9myx8HiKihq-6_Ud48sN=NXN1_ga7WZa9LguzSjA@mail.gmail.com>
From: Sudeep Holla <sudeep.holla@arm.com>
Date: Thu, 22 Apr 2021 11:41:11 +0100
Message-ID: <CAPKp9uYEwNfmBndCWt5BSZ7VQ+JHAhzd6aBsN8WO1nmMUQ2Mcw@mail.gmail.com>
Subject: Re: [PATCH] efifb: Check efifb_pci_dev before using it
To: Alex Deucher <alexdeucher@gmail.com>, 
 "open list:EFIFB FRAMEBUFFER DRIVER" <linux-fbdev@vger.kernel.org>, 
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 pjones@redhat.com
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
Cc: open list <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 8:20 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Apr 13, 2021 at 2:37 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Tue, Apr 13, 2021 at 8:02 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> > >
> > > On Tue, Apr 13, 2021 at 1:05 PM Kai-Heng Feng
> > > <kai.heng.feng@canonical.com> wrote:
> > > >
> > > > On some platforms like Hyper-V and RPi4 with UEFI firmware, efifb is not
> > > > a PCI device.
> > > >
> > > > So make sure efifb_pci_dev is found before using it.
> > > >
> > > > Fixes: a6c0fd3d5a8b ("efifb: Ensure graphics device for efifb stays at PCI D0")
> > > > BugLink: https://bugs.launchpad.net/bugs/1922403
> > > > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > >
> > > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > fbdev is in drm-misc, so maybe you can push this one too?
>
> Yes, pushed.  Thanks!
>

Can we have this pushed into the branch that gets merged into linux-next.
I still don't see this fix in -next and we are unable to do testing on our
platform as we hit a boot crash without this as reported in [1]. We prefer
running tests on -next without any additional patches or reverts, hence
the nagging, sorry for that.

Regards,
Sudeep

[1] https://lore.kernel.org/dri-devel/20210415102224.2764054-1-sudeep.holla@arm.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
