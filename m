Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D955638A4B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 13:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40C510E752;
	Fri, 25 Nov 2022 12:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D393F10E752
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 12:40:21 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3938dc90ab0so40397697b3.4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 04:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJvvaRVnW9ZgCdHIVKF2PrQVDqoqC87Jwai48Lir2hs=;
 b=O2TrOcSoMSPPNFrvlY93xaeJbIgs/oQ9H/+Gb7jZBIWNMmgJiDe0/Lj3gZID0IIOzA
 SnuSB80yT9Uh9zjHp1xTAuj8lj9pj+UvQOZTA3ULws0gHmOsMiFYjBQzTXQlyBx/Mfn2
 gw927LDXJhNTC4UH8QsmmJqyeUP4Gu1tQ0ShFI30ekR3VyWGXkKBdOzRClBf8wOyUsY6
 O4C9ywDZCaHhrsfG1P8VPx0U9g2sF6nWT+koRQkdFRLQOvCHyjhj60UauuXJE2nibkA1
 hfysOZN85vAkRRiV79XxuC7lksRPQldOhXY9Lc1iLWcbqwgjskx5OFIWQJTYXyMh9KCM
 PRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LJvvaRVnW9ZgCdHIVKF2PrQVDqoqC87Jwai48Lir2hs=;
 b=REndNfSQTj+M+gbAKBTCMruLdPpJkM53/QhkD8XMuXv9R2aaBSyQj+FoWLB1z86Wi9
 UHAybJwoDzpDTiYZb0kKmc45MlO3Xd7dNeZJaxl97/lp1lQ5Of8OOmBOcHn7ujl+x8Qx
 SGvQFrc3/IP7Utz+eScSoscrtoybwJHCQd5rsuz2knNpj+zbwlg74yuPahTcZD8f1Hy8
 lx2Yzn0RHBxBrGRFWf6ZwAChpUdTi/tAjhOUERYymCpKfGYGAk/PcL/uYdEThEH4WlSP
 /MEps4MevpchRmNpVKICJLNGSGNUPILcRlCdLKE8xbbuQvYYER5FJFGB+DdQ9h2WxLAc
 UK5g==
X-Gm-Message-State: ANoB5pmOiAFoYdoZpk3pmtxPS/6euQaDno5Wn0yyHebXvxQOH4lghE7u
 ywSegsFgtY8cDuHETOAkr0rHnlF5pahmH+Z30uszhA==
X-Google-Smtp-Source: AA0mqf6wqlrhFuxCJsFnMqo1XalNys4dk7skiW0xrMU30Zsm37eAFw1t09Kpc0OW/Yg848bZ5UL7IVLAuiNWTZI9ayU=
X-Received: by 2002:a81:92c1:0:b0:3bc:d289:f4b6 with SMTP id
 j184-20020a8192c1000000b003bcd289f4b6mr865960ywg.417.1669380020560; Fri, 25
 Nov 2022 04:40:20 -0800 (PST)
MIME-Version: 1.0
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-2-gregkh@linuxfoundation.org>
 <20221125115529.05af1513@sal.lan>
In-Reply-To: <20221125115529.05af1513@sal.lan>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 25 Nov 2022 18:10:09 +0530
Message-ID: <CAO_48GGrxs9=BUu3FH5FcgSkbJnrFaLn=TC+54W76DxePfD7iA@mail.gmail.com>
Subject: Re: [PATCH 2/5] driver core: make struct class.devnode() take a const
 *
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, Justin Sanders <justin@coraid.com>,
 Anton Vorontsov <anton@enomsg.org>, Sean Young <sean@mess.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, John Stultz <jstultz@google.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Eli Cohen <elic@nvidia.com>,
 Gautam Dawar <gautam.dawar@xilinx.com>, Kees Cook <keescook@chromium.org>,
 Parav Pandit <parav@nvidia.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kvm@vger.kernel.org,
 Leon Romanovsky <leon@kernel.org>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>, x86@kernel.org,
 Frank Haverkamp <haver@linux.ibm.com>, Dan Carpenter <error27@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 linux-input@vger.kernel.org, Laura Abbott <labbott@redhat.com>,
 virtualization@lists.linux-foundation.org, linux-media@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Colin Cross <ccross@android.com>, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>,
 Reinette Chatre <reinette.chatre@intel.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 linux-scsi@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Liam Mark <lmark@codeaurora.org>,
 FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>,
 Xie Yongji <xieyongji@bytedance.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>, linux-usb@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Greg,

On Fri, 25 Nov 2022 at 17:25, Mauro Carvalho Chehab <mchehab@kernel.org> wr=
ote:
>
> Em Wed, 23 Nov 2022 13:25:20 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
>
> > The devnode() in struct class should not be modifying the device that i=
s
> > passed into it, so mark it as a const * and propagate the function
> > signature changes out into all relevant subsystems that use this
> > callback.
>
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
Please feel free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>
for the dma-buf portion.

Best,
Sumit.
> > Cc: Fenghua Yu <fenghua.yu@intel.com>
> > Cc: Reinette Chatre <reinette.chatre@intel.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: Borislav Petkov <bp@alien8.de>
> > Cc: Dave Hansen <dave.hansen@linux.intel.com>
> > Cc: x86@kernel.org
> > Cc: "H. Peter Anvin" <hpa@zytor.com>
> > Cc: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: Justin Sanders <justin@coraid.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Laura Abbott <labbott@redhat.com>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: John Stultz <jstultz@google.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Leon Romanovsky <leon@kernel.org>
> > Cc: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Sean Young <sean@mess.org>
> > Cc: Frank Haverkamp <haver@linux.ibm.com>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Cornelia Huck <cohuck@redhat.com>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Anton Vorontsov <anton@enomsg.org>
> > Cc: Colin Cross <ccross@android.com>
> > Cc: Tony Luck <tony.luck@intel.com>
> > Cc: Jaroslav Kysela <perex@perex.cz>
> > Cc: Takashi Iwai <tiwai@suse.com>
> > Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Cc: Xie Yongji <xieyongji@bytedance.com>
> > Cc: Gautam Dawar <gautam.dawar@xilinx.com>
> > Cc: Dan Carpenter <error27@gmail.com>
> > Cc: Eli Cohen <elic@nvidia.com>
> > Cc: Parav Pandit <parav@nvidia.com>
> > Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
> > Cc: alsa-devel@alsa-project.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: kvm@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > Cc: linux-block@vger.kernel.org
> > Cc: linux-input@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-rdma@vger.kernel.org
> > Cc: linux-scsi@vger.kernel.org
> > Cc: linux-usb@vger.kernel.org
> > Cc: virtualization@lists.linux-foundation.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  arch/x86/kernel/cpu/resctrl/pseudo_lock.c  | 4 ++--
> >  arch/x86/kernel/cpuid.c                    | 2 +-
> >  arch/x86/kernel/msr.c                      | 2 +-
> >  block/bsg.c                                | 2 +-
> >  drivers/block/aoe/aoechr.c                 | 2 +-
> >  drivers/char/mem.c                         | 2 +-
> >  drivers/char/misc.c                        | 4 ++--
> >  drivers/dma-buf/dma-heap.c                 | 2 +-
> >  drivers/gpu/drm/drm_sysfs.c                | 2 +-
> >  drivers/infiniband/core/user_mad.c         | 2 +-
> >  drivers/infiniband/core/uverbs_main.c      | 2 +-
> >  drivers/infiniband/hw/hfi1/device.c        | 4 ++--
> >  drivers/input/input.c                      | 2 +-
> >  drivers/media/dvb-core/dvbdev.c            | 4 ++--
> >  drivers/media/pci/ddbridge/ddbridge-core.c | 4 ++--
> >  drivers/media/rc/rc-main.c                 | 2 +-
> >  drivers/misc/genwqe/card_base.c            | 2 +-
> >  drivers/tty/tty_io.c                       | 2 +-
> >  drivers/usb/core/file.c                    | 2 +-
> >  drivers/vdpa/vdpa_user/vduse_dev.c         | 2 +-
> >  drivers/vfio/vfio_main.c                   | 2 +-
> >  fs/pstore/pmsg.c                           | 2 +-
> >  include/linux/device/class.h               | 2 +-
> >  sound/sound_core.c                         | 2 +-
> >  24 files changed, 29 insertions(+), 29 deletions(-)
> >
> > diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kerne=
l/cpu/resctrl/pseudo_lock.c
> > index d961ae3ed96e..4e4231a58f38 100644
> > --- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> > +++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> > @@ -1560,9 +1560,9 @@ static const struct file_operations pseudo_lock_d=
ev_fops =3D {
> >       .mmap =3D         pseudo_lock_dev_mmap,
> >  };
> >
> > -static char *pseudo_lock_devnode(struct device *dev, umode_t *mode)
> > +static char *pseudo_lock_devnode(const struct device *dev, umode_t *mo=
de)
> >  {
> > -     struct rdtgroup *rdtgrp;
> > +     const struct rdtgroup *rdtgrp;
> >
> >       rdtgrp =3D dev_get_drvdata(dev);
> >       if (mode)
> > diff --git a/arch/x86/kernel/cpuid.c b/arch/x86/kernel/cpuid.c
> > index 6f7b8cc1bc9f..621ba9c0f17a 100644
> > --- a/arch/x86/kernel/cpuid.c
> > +++ b/arch/x86/kernel/cpuid.c
> > @@ -139,7 +139,7 @@ static int cpuid_device_destroy(unsigned int cpu)
> >       return 0;
> >  }
> >
> > -static char *cpuid_devnode(struct device *dev, umode_t *mode)
> > +static char *cpuid_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "cpu/%u/cpuid", MINOR(dev->devt));
> >  }
> > diff --git a/arch/x86/kernel/msr.c b/arch/x86/kernel/msr.c
> > index ed8ac6bcbafb..708751311786 100644
> > --- a/arch/x86/kernel/msr.c
> > +++ b/arch/x86/kernel/msr.c
> > @@ -250,7 +250,7 @@ static int msr_device_destroy(unsigned int cpu)
> >       return 0;
> >  }
> >
> > -static char *msr_devnode(struct device *dev, umode_t *mode)
> > +static char *msr_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "cpu/%u/msr", MINOR(dev->devt));
> >  }
> > diff --git a/block/bsg.c b/block/bsg.c
> > index 2ab1351eb082..08046bd9207d 100644
> > --- a/block/bsg.c
> > +++ b/block/bsg.c
> > @@ -232,7 +232,7 @@ struct bsg_device *bsg_register_queue(struct reques=
t_queue *q,
> >  }
> >  EXPORT_SYMBOL_GPL(bsg_register_queue);
> >
> > -static char *bsg_devnode(struct device *dev, umode_t *mode)
> > +static char *bsg_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "bsg/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/block/aoe/aoechr.c b/drivers/block/aoe/aoechr.c
> > index 8eea2529da20..7a368c90467d 100644
> > --- a/drivers/block/aoe/aoechr.c
> > +++ b/drivers/block/aoe/aoechr.c
> > @@ -273,7 +273,7 @@ static const struct file_operations aoe_fops =3D {
> >       .llseek =3D noop_llseek,
> >  };
> >
> > -static char *aoe_devnode(struct device *dev, umode_t *mode)
> > +static char *aoe_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "etherd/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> > index 5611d127363e..83bf2a4dcb57 100644
> > --- a/drivers/char/mem.c
> > +++ b/drivers/char/mem.c
> > @@ -746,7 +746,7 @@ static const struct file_operations memory_fops =3D=
 {
> >       .llseek =3D noop_llseek,
> >  };
> >
> > -static char *mem_devnode(struct device *dev, umode_t *mode)
> > +static char *mem_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (mode && devlist[MINOR(dev->devt)].mode)
> >               *mode =3D devlist[MINOR(dev->devt)].mode;
> > diff --git a/drivers/char/misc.c b/drivers/char/misc.c
> > index cba19bfdc44d..88c6995b9a3d 100644
> > --- a/drivers/char/misc.c
> > +++ b/drivers/char/misc.c
> > @@ -254,9 +254,9 @@ void misc_deregister(struct miscdevice *misc)
> >  }
> >  EXPORT_SYMBOL(misc_deregister);
> >
> > -static char *misc_devnode(struct device *dev, umode_t *mode)
> > +static char *misc_devnode(const struct device *dev, umode_t *mode)
> >  {
> > -     struct miscdevice *c =3D dev_get_drvdata(dev);
> > +     const struct miscdevice *c =3D dev_get_drvdata(dev);
> >
> >       if (mode && c->mode)
> >               *mode =3D c->mode;
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 8f5848aa144f..4d7150791315 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -299,7 +299,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       return err_ret;
> >  }
> >
> > -static char *dma_heap_devnode(struct device *dev, umode_t *mode)
> > +static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> > index 430e00b16eec..14bf156b3f1b 100644
> > --- a/drivers/gpu/drm/drm_sysfs.c
> > +++ b/drivers/gpu/drm/drm_sysfs.c
> > @@ -90,7 +90,7 @@ static void drm_sysfs_acpi_register(void) { }
> >  static void drm_sysfs_acpi_unregister(void) { }
> >  #endif
> >
> > -static char *drm_devnode(struct device *dev, umode_t *mode)
> > +static char *drm_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "dri/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/infiniband/core/user_mad.c b/drivers/infiniband/co=
re/user_mad.c
> > index 98cb594cd9a6..f83954180a33 100644
> > --- a/drivers/infiniband/core/user_mad.c
> > +++ b/drivers/infiniband/core/user_mad.c
> > @@ -1224,7 +1224,7 @@ static struct attribute *umad_class_dev_attrs[] =
=3D {
> >  };
> >  ATTRIBUTE_GROUPS(umad_class_dev);
> >
> > -static char *umad_devnode(struct device *dev, umode_t *mode)
> > +static char *umad_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "infiniband/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/infiniband/core/uverbs_main.c b/drivers/infiniband=
/core/uverbs_main.c
> > index d54434088727..bdb179a09d77 100644
> > --- a/drivers/infiniband/core/uverbs_main.c
> > +++ b/drivers/infiniband/core/uverbs_main.c
> > @@ -1237,7 +1237,7 @@ static void ib_uverbs_remove_one(struct ib_device=
 *device, void *client_data)
> >       put_device(&uverbs_dev->dev);
> >  }
> >
> > -static char *uverbs_devnode(struct device *dev, umode_t *mode)
> > +static char *uverbs_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (mode)
> >               *mode =3D 0666;
> > diff --git a/drivers/infiniband/hw/hfi1/device.c b/drivers/infiniband/h=
w/hfi1/device.c
> > index 8ceff7141baf..1f4496032170 100644
> > --- a/drivers/infiniband/hw/hfi1/device.c
> > +++ b/drivers/infiniband/hw/hfi1/device.c
> > @@ -72,7 +72,7 @@ const char *class_name(void)
> >       return hfi1_class_name;
> >  }
> >
> > -static char *hfi1_devnode(struct device *dev, umode_t *mode)
> > +static char *hfi1_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (mode)
> >               *mode =3D 0600;
> > @@ -85,7 +85,7 @@ static const char *class_name_user(void)
> >       return hfi1_class_name_user;
> >  }
> >
> > -static char *hfi1_user_devnode(struct device *dev, umode_t *mode)
> > +static char *hfi1_user_devnode(const struct device *dev, umode_t *mode=
)
> >  {
> >       if (mode)
> >               *mode =3D 0666;
> > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > index ebb2b7f0f8ff..50597165dc54 100644
> > --- a/drivers/input/input.c
> > +++ b/drivers/input/input.c
> > @@ -1913,7 +1913,7 @@ static const struct device_type input_dev_type =
=3D {
> >  #endif
> >  };
> >
> > -static char *input_devnode(struct device *dev, umode_t *mode)
> > +static char *input_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "input/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/d=
vbdev.c
> > index 6ef18bab9648..e73f5240cc2c 100644
> > --- a/drivers/media/dvb-core/dvbdev.c
> > +++ b/drivers/media/dvb-core/dvbdev.c
> > @@ -1018,9 +1018,9 @@ static int dvb_uevent(const struct device *dev, s=
truct kobj_uevent_env *env)
> >       return 0;
> >  }
> >
> > -static char *dvb_devnode(struct device *dev, umode_t *mode)
> > +static char *dvb_devnode(const struct device *dev, umode_t *mode)
> >  {
> > -     struct dvb_device *dvbdev =3D dev_get_drvdata(dev);
> > +     const struct dvb_device *dvbdev =3D dev_get_drvdata(dev);
> >
> >       return kasprintf(GFP_KERNEL, "dvb/adapter%d/%s%d",
> >               dvbdev->adapter->num, dnames[dvbdev->type], dvbdev->id);
> > diff --git a/drivers/media/pci/ddbridge/ddbridge-core.c b/drivers/media=
/pci/ddbridge/ddbridge-core.c
> > index fe833f39698a..ee8087f29b2c 100644
> > --- a/drivers/media/pci/ddbridge/ddbridge-core.c
> > +++ b/drivers/media/pci/ddbridge/ddbridge-core.c
> > @@ -2716,9 +2716,9 @@ static const struct file_operations ddb_fops =3D =
{
> >       .release        =3D ddb_release,
> >  };
> >
> > -static char *ddb_devnode(struct device *device, umode_t *mode)
> > +static char *ddb_devnode(const struct device *device, umode_t *mode)
> >  {
> > -     struct ddb *dev =3D dev_get_drvdata(device);
> > +     const struct ddb *dev =3D dev_get_drvdata(device);
> >
> >       return kasprintf(GFP_KERNEL, "ddbridge/card%d", dev->nr);
> >  }
> > diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
> > index eba0cd30e314..527d9324742b 100644
> > --- a/drivers/media/rc/rc-main.c
> > +++ b/drivers/media/rc/rc-main.c
> > @@ -1017,7 +1017,7 @@ static void ir_close(struct input_dev *idev)
> >  }
> >
> >  /* class for /sys/class/rc */
> > -static char *rc_devnode(struct device *dev, umode_t *mode)
> > +static char *rc_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "rc/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/misc/genwqe/card_base.c b/drivers/misc/genwqe/card=
_base.c
> > index 693981891870..0f00687f72d4 100644
> > --- a/drivers/misc/genwqe/card_base.c
> > +++ b/drivers/misc/genwqe/card_base.c
> > @@ -1349,7 +1349,7 @@ static struct pci_driver genwqe_driver =3D {
> >   * Default mode should be rw for everybody. Do not change default
> >   * device name.
> >   */
> > -static char *genwqe_devnode(struct device *dev, umode_t *mode)
> > +static char *genwqe_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (mode)
> >               *mode =3D 0666;
> > diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> > index de06c3c2ff70..aad8171f6c21 100644
> > --- a/drivers/tty/tty_io.c
> > +++ b/drivers/tty/tty_io.c
> > @@ -3494,7 +3494,7 @@ void tty_default_fops(struct file_operations *fop=
s)
> >       *fops =3D tty_fops;
> >  }
> >
> > -static char *tty_devnode(struct device *dev, umode_t *mode)
> > +static char *tty_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (!mode)
> >               return NULL;
> > diff --git a/drivers/usb/core/file.c b/drivers/usb/core/file.c
> > index 558890ada0e5..da7d88e069e6 100644
> > --- a/drivers/usb/core/file.c
> > +++ b/drivers/usb/core/file.c
> > @@ -62,7 +62,7 @@ static struct usb_class {
> >       struct class *class;
> >  } *usb_class;
> >
> > -static char *usb_devnode(struct device *dev, umode_t *mode)
> > +static char *usb_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       struct usb_class_driver *drv;
> >
> > diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_use=
r/vduse_dev.c
> > index 35dceee3ed56..0dd3c1f291da 100644
> > --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> > +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> > @@ -1656,7 +1656,7 @@ static const struct file_operations vduse_ctrl_fo=
ps =3D {
> >       .llseek         =3D noop_llseek,
> >  };
> >
> > -static char *vduse_devnode(struct device *dev, umode_t *mode)
> > +static char *vduse_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "vduse/%s", dev_name(dev));
> >  }
> > diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
> > index 6e8804fe0095..5bf4b3454918 100644
> > --- a/drivers/vfio/vfio_main.c
> > +++ b/drivers/vfio/vfio_main.c
> > @@ -1812,7 +1812,7 @@ EXPORT_SYMBOL(vfio_set_irqs_validate_and_prepare)=
;
> >  /*
> >   * Module/class support
> >   */
> > -static char *vfio_devnode(struct device *dev, umode_t *mode)
> > +static char *vfio_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       return kasprintf(GFP_KERNEL, "vfio/%s", dev_name(dev));
> >  }
> > diff --git a/fs/pstore/pmsg.c b/fs/pstore/pmsg.c
> > index d8542ec2f38c..b31c9c72d90b 100644
> > --- a/fs/pstore/pmsg.c
> > +++ b/fs/pstore/pmsg.c
> > @@ -46,7 +46,7 @@ static int pmsg_major;
> >  #undef pr_fmt
> >  #define pr_fmt(fmt) PMSG_NAME ": " fmt
> >
> > -static char *pmsg_devnode(struct device *dev, umode_t *mode)
> > +static char *pmsg_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (mode)
> >               *mode =3D 0220;
> > diff --git a/include/linux/device/class.h b/include/linux/device/class.=
h
> > index 94b1107258e5..42cc3fb44a84 100644
> > --- a/include/linux/device/class.h
> > +++ b/include/linux/device/class.h
> > @@ -60,7 +60,7 @@ struct class {
> >       struct kobject                  *dev_kobj;
> >
> >       int (*dev_uevent)(const struct device *dev, struct kobj_uevent_en=
v *env);
> > -     char *(*devnode)(struct device *dev, umode_t *mode);
> > +     char *(*devnode)(const struct device *dev, umode_t *mode);
> >
> >       void (*class_release)(struct class *class);
> >       void (*dev_release)(struct device *dev);
> > diff --git a/sound/sound_core.c b/sound/sound_core.c
> > index 3332fe321737..3e7dd6fcb7cf 100644
> > --- a/sound/sound_core.c
> > +++ b/sound/sound_core.c
> > @@ -30,7 +30,7 @@ MODULE_DESCRIPTION("Core sound module");
> >  MODULE_AUTHOR("Alan Cox");
> >  MODULE_LICENSE("GPL");
> >
> > -static char *sound_devnode(struct device *dev, umode_t *mode)
> > +static char *sound_devnode(const struct device *dev, umode_t *mode)
> >  {
> >       if (MAJOR(dev->devt) =3D=3D SOUND_MAJOR)
> >               return NULL;



--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
