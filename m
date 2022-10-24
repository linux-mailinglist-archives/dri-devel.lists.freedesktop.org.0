Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7165609BD2
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:52:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AE2710E2BA;
	Mon, 24 Oct 2022 07:52:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D84510E2BA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:52:23 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id s3so5178334qtn.12
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2lDl36LG/JcyTlKxVA4dxBVzUz95+CXwb//i8WZcYZk=;
 b=an9OHIHO1pIh6zUhlv2uTUuLMIXGVi7zo7qgZo0I7/wyon3dVsOg3cLhHPbHEr0R46
 qah0WMeSKAj59w2EL9cOxjZVvOPbe+ObGvpfKVpFT59eDH8WAo44yqh8tQJWMPTC03j5
 lhppRWbs0jErQGif/c0xZ8fuP11Nn2em0HZTPzJWJp0U5Xv1frOATnG42/Hb+vcFX838
 ikxjHJzeztxWTBd6iZ5Yg1kU6OuXhXm5kjSud7oqk/zTCkcat9llXHxeEbAtjPI9ULYD
 PAhUOAVJ3G1EwFvoRTV2AhcKzzFInSPqKAdEFAYRmXvp9RuC6g61oDSip9irZhkoHVz2
 hYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2lDl36LG/JcyTlKxVA4dxBVzUz95+CXwb//i8WZcYZk=;
 b=H5ajlWE2Fer0I/enUnrWfTZZeNCobbNIgRyqO3l4Ih2pDD7LLpasWEZ6MQkpveXijx
 vopaHzF9Y4Nzn73nuMUlfTjJlzGUE5tOHcGNmjRnaUT9E0HE+FLzYfMw9WlMcycOETLK
 gjYYzocWtQf0DDRRATC/6TgvA8z98ERy5I/1SS8K1zH1z1Pu6HiNOoL6d3vX9F2g3uH0
 60RgYQzWwfriJuVeKuQvFrmTU43jwEQNq26upuO+qpvR6YpocKS/jzKSxk6uTf06pBco
 jSCxYQZawxCvRro7M38zi8w3dr30jlBjKyhiGkKu1eJVcxGnYLyHh6xZZHqjsdgTFSRA
 BRBA==
X-Gm-Message-State: ACrzQf2xyDMZ2RwiK+BfuTCkFtwuG1NDQikYDtfNzFpxqjnC85PBmjP7
 ePi0u3Q753CkAyxOGcZ8R+AlZGamZJ+M1SJl41w=
X-Google-Smtp-Source: AMsMyM5Df+AsSzaUUX3TXS9vMO/D4cMyQYQ/2fH+UUetYbRRWoGPOO1KSyBSmnfzb+yi7VlDg4saudpO1R7/pAh1jyk=
X-Received: by 2002:ac8:5b81:0:b0:39c:b735:6b8b with SMTP id
 a1-20020ac85b81000000b0039cb7356b8bmr26122809qta.416.1666597941957; Mon, 24
 Oct 2022 00:52:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-3-ogabbay@kernel.org>
 <Y1U2K+fAnGbYug/+@kroah.com>
 <CAFCwf11PxtcRZegVBxYfJQFpYO0AipobJXWWp4ch+7mMKRLuKg@mail.gmail.com>
In-Reply-To: <CAFCwf11PxtcRZegVBxYfJQFpYO0AipobJXWWp4ch+7mMKRLuKg@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Mon, 24 Oct 2022 17:52:10 +1000
Message-ID: <CAPM=9txP8N2kzeDHEbSbiO-oAy5cemJ_Ag4WqeCNzdx6b3quBA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm: define new accel major and register it
To: Oded Gabbay <ogabbay@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Oct 2022 at 17:23, Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Sun, Oct 23, 2022 at 3:40 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Oct 23, 2022 at 12:46:21AM +0300, Oded Gabbay wrote:
> > > The accelerator devices will be exposed to the user space with a new,
> > > dedicated major number - 261.
> > >
> > > The drm core registers the new major number as a char device and create
> > > corresponding sysfs and debugfs root entries, same as for the drm major.
> > >
> > > In case CONFIG_ACCEL is not selected, this code is not compiled in.
> > >
> > > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > > ---
> > >  Documentation/admin-guide/devices.txt |  5 +++
> > >  drivers/gpu/drm/drm_drv.c             | 45 +++++++++++++++++++++++
> > >  drivers/gpu/drm/drm_internal.h        |  3 ++
> > >  drivers/gpu/drm/drm_sysfs.c           | 52 +++++++++++++++++++++++++++
> > >  include/drm/drm_ioctl.h               |  1 +
> > >  5 files changed, 106 insertions(+)
> > >
> > > diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> > > index 9764d6edb189..06c525e01ea5 100644
> > > --- a/Documentation/admin-guide/devices.txt
> > > +++ b/Documentation/admin-guide/devices.txt
> > > @@ -3080,6 +3080,11 @@
> > >                 ...
> > >                 255 = /dev/osd255     256th OSD Device
> > >
> > > + 261 char    Compute Acceleration Devices
> > > +               0 = /dev/accel/accel0 First acceleration device
> > > +               1 = /dev/accel/accel1 Second acceleration device
> > > +                 ...
> > > +
> > >   384-511 char        RESERVED FOR DYNAMIC ASSIGNMENT
> > >               Character devices that request a dynamic allocation of major
> > >               number will take numbers starting from 511 and downward,
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 8214a0b1ab7f..b58ffb1433d6 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -67,6 +67,10 @@ static bool drm_core_init_complete;
> > >
> > >  static struct dentry *drm_debugfs_root;
> > >
> > > +#ifdef CONFIG_ACCEL
> > > +static struct dentry *accel_debugfs_root;
> > > +#endif
> > > +
> > >  DEFINE_STATIC_SRCU(drm_unplug_srcu);
> > >
> > >  /*
> > > @@ -1031,9 +1035,19 @@ static const struct file_operations drm_stub_fops = {
> > >       .llseek = noop_llseek,
> > >  };
> > >
> > > +static void accel_core_exit(void)
> > > +{
> > > +#ifdef CONFIG_ACCEL
> > > +     unregister_chrdev(ACCEL_MAJOR, "accel");
> > > +     debugfs_remove(accel_debugfs_root);
> > > +     accel_sysfs_destroy();
> > > +#endif
> > > +}
> >
> > Why is all of this in drm_drv.c?
> >
> > Why not put it in drm/accel/accel.c or something like that?  Then put
> > the proper stuff into a .h file and then you have no #ifdef in the .c
> > files.
> I thought about that, adding an accel.c in drivers/accel/ and putting
> this code there.
> Eventually I thought that for two functions it's not worth it, but I
> guess that in addition to the reason you gave, one can argue that
> there will probably be more code in that file anyway, so why not open
> it now.
> I'll change this if no one else thinks otherwise.

Seems like a good idea to start doing it now, might make things easier
to keep separated.

Dave.
