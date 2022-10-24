Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B88DC609B3C
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:23:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB10C10E2A1;
	Mon, 24 Oct 2022 07:23:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C43510E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:23:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9F023B80ED4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542D2C433B5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666596218;
 bh=+tGECJw0KWuji/MrGRLX10JD3/o6ij3Z0NBM4iKiq+I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NpuE3gaAeXsUvwGw4jso1bFBffavqwZ81byZqVDENFhV6+SBomHw4x6ZMp/3Faew3
 9yXQ0rRSJaTdIpUlCTc2xNdoqsCbDBzzBE8XMk4We+UBB60KGiSYVT1ZNKmGM9ev49
 MxpQZG/Gd5HQNUSzQfLuGNmBdBy+vah/r+IaJbCnOdTa7bWrlU1hb2Emz7hG1YYigX
 goaol77VLNeQ/xlTrlzRyApamzQH1sYNl8+sLzvpMPfDFpt5gVe+WPbQOafQLwiHfy
 g7BjTt8bwBHXcqx7s8woq+9PddSYB3ou/NChnzOhF2xr3BTvQANvkr2AK5/pfAPEZk
 8Gq43QF7mcBoA==
Received: by mail-ed1-f44.google.com with SMTP id x2so575051edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 00:23:38 -0700 (PDT)
X-Gm-Message-State: ACrzQf23hqCjhew08yco8A1y01UduIFWtFxu4OfWIPjbgtMukPXLaP4F
 bOcppawuGX79jJlRsoZgwA/uzGcTnV0p0ftAwkE=
X-Google-Smtp-Source: AMsMyM6DGYlSCvCdIa2Qv3nNMB+zrgeJbC4qks//K4OI933BXcTDRbe+Fc8B1FKqMjlvT6oj4QYACx3SPlbcSlXM3Iw=
X-Received: by 2002:a17:906:8a52:b0:78d:b6db:149d with SMTP id
 gx18-20020a1709068a5200b0078db6db149dmr26144824ejc.733.1666596216553; Mon, 24
 Oct 2022 00:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-3-ogabbay@kernel.org>
 <Y1U2K+fAnGbYug/+@kroah.com>
In-Reply-To: <Y1U2K+fAnGbYug/+@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 24 Oct 2022 10:23:10 +0300
X-Gmail-Original-Message-ID: <CAFCwf11PxtcRZegVBxYfJQFpYO0AipobJXWWp4ch+7mMKRLuKg@mail.gmail.com>
Message-ID: <CAFCwf11PxtcRZegVBxYfJQFpYO0AipobJXWWp4ch+7mMKRLuKg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] drm: define new accel major and register it
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 23, 2022 at 3:40 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Oct 23, 2022 at 12:46:21AM +0300, Oded Gabbay wrote:
> > The accelerator devices will be exposed to the user space with a new,
> > dedicated major number - 261.
> >
> > The drm core registers the new major number as a char device and create
> > corresponding sysfs and debugfs root entries, same as for the drm major.
> >
> > In case CONFIG_ACCEL is not selected, this code is not compiled in.
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >  Documentation/admin-guide/devices.txt |  5 +++
> >  drivers/gpu/drm/drm_drv.c             | 45 +++++++++++++++++++++++
> >  drivers/gpu/drm/drm_internal.h        |  3 ++
> >  drivers/gpu/drm/drm_sysfs.c           | 52 +++++++++++++++++++++++++++
> >  include/drm/drm_ioctl.h               |  1 +
> >  5 files changed, 106 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/devices.txt b/Documentation/admin-guide/devices.txt
> > index 9764d6edb189..06c525e01ea5 100644
> > --- a/Documentation/admin-guide/devices.txt
> > +++ b/Documentation/admin-guide/devices.txt
> > @@ -3080,6 +3080,11 @@
> >                 ...
> >                 255 = /dev/osd255     256th OSD Device
> >
> > + 261 char    Compute Acceleration Devices
> > +               0 = /dev/accel/accel0 First acceleration device
> > +               1 = /dev/accel/accel1 Second acceleration device
> > +                 ...
> > +
> >   384-511 char        RESERVED FOR DYNAMIC ASSIGNMENT
> >               Character devices that request a dynamic allocation of major
> >               number will take numbers starting from 511 and downward,
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 8214a0b1ab7f..b58ffb1433d6 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -67,6 +67,10 @@ static bool drm_core_init_complete;
> >
> >  static struct dentry *drm_debugfs_root;
> >
> > +#ifdef CONFIG_ACCEL
> > +static struct dentry *accel_debugfs_root;
> > +#endif
> > +
> >  DEFINE_STATIC_SRCU(drm_unplug_srcu);
> >
> >  /*
> > @@ -1031,9 +1035,19 @@ static const struct file_operations drm_stub_fops = {
> >       .llseek = noop_llseek,
> >  };
> >
> > +static void accel_core_exit(void)
> > +{
> > +#ifdef CONFIG_ACCEL
> > +     unregister_chrdev(ACCEL_MAJOR, "accel");
> > +     debugfs_remove(accel_debugfs_root);
> > +     accel_sysfs_destroy();
> > +#endif
> > +}
>
> Why is all of this in drm_drv.c?
>
> Why not put it in drm/accel/accel.c or something like that?  Then put
> the proper stuff into a .h file and then you have no #ifdef in the .c
> files.
I thought about that, adding an accel.c in drivers/accel/ and putting
this code there.
Eventually I thought that for two functions it's not worth it, but I
guess that in addition to the reason you gave, one can argue that
there will probably be more code in that file anyway, so why not open
it now.
I'll change this if no one else thinks otherwise.
Oded

>
> Keeping #ifdef out of C files is key, please do not do things like you
> have here.  Especially as it ends up with this kind of mess:
>
> > +static int __init accel_core_init(void)
> > +{
> > +#ifdef CONFIG_ACCEL
> > +     int ret;
> > +
> > +     ret = accel_sysfs_init();
> > +     if (ret < 0) {
> > +             DRM_ERROR("Cannot create ACCEL class: %d\n", ret);
> > +             goto error;
> > +     }
> > +
> > +     accel_debugfs_root = debugfs_create_dir("accel", NULL);
> > +
> > +     ret = register_chrdev(ACCEL_MAJOR, "accel", &drm_stub_fops);
> > +     if (ret < 0)
> > +             goto error;
> > +
> > +error:
> > +     /* Any cleanup will be done in drm_core_exit() that will call
> > +      * to accel_core_exit()
> > +      */
> > +     return ret;
> > +#else
> > +     return 0;
> > +#endif
> > +}
>
>
> That's just a mess.
>
> thanks,
>
> greg k-h
