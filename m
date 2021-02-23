Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF16322DD3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:47:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D6488130;
	Tue, 23 Feb 2021 15:47:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C6D6E9D2;
 Tue, 23 Feb 2021 15:47:04 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id i8so17541660iog.7;
 Tue, 23 Feb 2021 07:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q+CvRb8uJsnMhLBA4z+SJwvevSaxCnZTQPudMnhz+y8=;
 b=AeWapl4co9ZkJosmvA0IgSFwSNbO7+4rttRnp6JNidX+AWkrFF0mrFiBXHjl5eqtoh
 oC9kUTt4q2uh/U58gT5RgoeJtF/vBqpSGB0jgz2NYfPWAD0M23YLu1Rf1oSRUKXTw6zz
 S0W+W8UtftOLc+qHg+pkPsrj3aGj3cQnCUEx0/MvbdHXQqquPEfGf9CgoyFnGwc0xVRs
 6WhG/GRzt5Jw12WNntutbE8ecN0OcJNv3GVSeMZWwtmCLSKxYY3S9lRVJ9ELDCPnekq8
 SRfR2g9nwhFmyz2Cs3HPsPBP6Ba5HBmSSV3iouhaSYBtaZ8QMHpkB67kd4T8AOxd87ps
 Gjdg==
X-Gm-Message-State: AOAM530NiDcUG9NOAO0BMkBGA+d5rFUPf5q42NXKQHGQbQ6v/CySda/z
 1AtwLpN5SnuwiWfe//dXfDazOVm5gl0iftNaMQE=
X-Google-Smtp-Source: ABdhPJz1kFrzRXcSKPQzV0L9KIq7evTjzIK/fhnl6+WUHdZTdl5LT2+m6x7mNbscJ1uoZ/eP3Tr0b55SGQjjzmQLtUI=
X-Received: by 2002:a6b:f206:: with SMTP id q6mr20237814ioh.143.1614095223592; 
 Tue, 23 Feb 2021 07:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
 <YDUN+Re/alMVL0Zn@pflmari>
 <CAKb7UvhFkw23so-a4JKLzpQLhphzjzarOy-9h+FiKP-aAC=4xw@mail.gmail.com>
 <YDUg/9fjsvTkRUqr@pflmari>
In-Reply-To: <YDUg/9fjsvTkRUqr@pflmari>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 23 Feb 2021 10:46:52 -0500
Message-ID: <CAKb7Uvji_+N+b8HghZckU-uSBWn-=BZwNAiUff2oitbVuNUE2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor size to
 userspace
To: Alex Riesen <alexander.riesen@cetitec.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 James Jones <jajones@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jeremy Cline <jcline@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 23, 2021 at 10:36 AM Alex Riesen
<alexander.riesen@cetitec.com> wrote:
>
> Ilia Mirkin, Tue, Feb 23, 2021 15:56:21 +0100:
> > On Tue, Feb 23, 2021 at 9:26 AM Alex Riesen <alexander.riesen@cetitec.com> wrote:
> > > Lyude Paul, Tue, Jan 19, 2021 02:54:13 +0100:
> > > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > index c6367035970e..5f4f09a601d4 100644
> > > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > > @@ -2663,6 +2663,14 @@ nv50_display_create(struct drm_device *dev)
> > > >       else
> > > >               nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
> > > >
> > > > +     if (disp->disp->object.oclass >= GK104_DISP) {
> > > > +             dev->mode_config.cursor_width = 256;
> > > > +             dev->mode_config.cursor_height = 256;
> > > > +     } else {
> > > > +             dev->mode_config.cursor_width = 64;
> > > > +             dev->mode_config.cursor_height = 64;
> > > > +     }
> > > > +
> > > >       /* create crtc objects to represent the hw heads */
> > > >       if (disp->disp->object.oclass >= GV100_DISP)
> > > >               crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
> > >
> > > This change broke X cursor in my setup, and reverting the commit restores it.
> > >
> > > Dell Precision M4800, issue ~2014 with GK106GLM [Quadro K2100M] (rev a1).
> > > libdrm 2.4.91-1 (Debian 10.8 stable).
> > > There are no errors or warnings in Xorg logs nor in the kernel log.
> >
> > Could you confirm which ddx is driving the nvidia hw? You can find
> > this out by running "xrandr --listproviders", or also in the xorg log.
>
> xrandr(1) does not seem to list much:
>
> $ xrandr --listproviders
> Providers: number : 1
> Provider 0: id: 0x48 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 4 outputs: 5 associated providers: 0 name:modesetting

Thanks - this is what I was looking for. name:modesetting, i.e. the
modesetting ddx driver.

I checked nouveau source, and it seems like it uses a 64x64 cursor no
matter what. Not sure what the modesetting ddx does.

I'd recommend using xf86-video-nouveau in any case, but some distros
have decided to explicitly force modesetting in preference of nouveau.
Oh well. (And regardless, the regression should be addressed somehow,
but it's also good to understand what the problem is.)

Can you confirm what the problem with the cursor is?

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
