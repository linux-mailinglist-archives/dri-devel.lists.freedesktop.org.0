Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C96AD610AD3
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 08:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAC2810E782;
	Fri, 28 Oct 2022 06:56:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6448610E785
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:56:52 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20221028065650epoutp01dfbada5bf0fd46d3f3cf1dbf63088721~iKUoMCo_H2782227822epoutp01W
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 06:56:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20221028065650epoutp01dfbada5bf0fd46d3f3cf1dbf63088721~iKUoMCo_H2782227822epoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1666940210;
 bh=f5AeGuQ91kgMx+p1pLQmTx7L0CdNWT5cP5Evk4stoEw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qiOWMybRgq3FJ9o9w2R71LGH7d1Ze2at/oTtYmhJ0DkXHgt4uHFIvtXONAV+vZmdk
 Gh60NfM+QVNc+tut4ss5jxyRbIqK6KJYi5el90vtSSVmiVB5cfeqH/0WNknAdPV47J
 VW6UuoxMnHdYYxL2mrXIT7oinC2d2cXzH7DI//cA=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221028065649epcas1p1009eb03e96ba85836aecb846f22f40d4~iKUnmJrvD0386903869epcas1p1n;
 Fri, 28 Oct 2022 06:56:49 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.38.235]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4MzCyS16qZz4x9Q7; Fri, 28 Oct
 2022 06:56:48 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 21.45.07146.A2D7B536; Fri, 28 Oct 2022 15:56:42 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221028065642epcas1p19a36e65931dc8e1a5fc56724c3852f40~iKUhLtIKI0604406044epcas1p1J;
 Fri, 28 Oct 2022 06:56:42 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221028065642epsmtrp2f569670b38dc450cbde5b7e9ea32ffdf~iKUhKeoVO2721527215epsmtrp2g;
 Fri, 28 Oct 2022 06:56:42 +0000 (GMT)
X-AuditID: b6c32a35-47bfe70000021bea-a7-635b7d2a01d9
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 75.54.14392.A2D7B536; Fri, 28 Oct 2022 15:56:42 +0900 (KST)
Received: from jiho-chu04.tn.corp.samsungelectronics.net (unknown
 [10.113.112.236]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221028065642epsmtip2583922363b8ea09946dcd287d6000d2e~iKUg3orPI0626306263epsmtip2h;
 Fri, 28 Oct 2022 06:56:42 +0000 (GMT)
Date: Fri, 28 Oct 2022 15:56:42 +0900
From: Jiho Chu <jiho.chu@samsung.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
Message-Id: <20221028155642.460c2ece8a7abbfa52eb4539@samsung.com>
In-Reply-To: <CAFCwf11kg-ZvYjEKf=VrvgvM03QZp7GejFhJ=gbCp4up++4h2w@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.30; i686-pc-mingw32)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf1CTdRzH77tnezY07GFofKOC+aDnwTW2yQZfPfA0PXs6uZgZpdVJazwB
 N9jmnqH8qOSn8dMYYSIHhgRBJBFzLBg/7OBOEpEE50UkIXcpify04MQ5a+OR7L/35/N9fb7v
 7+fzua8AE+bxfQUJWiNt0KoSSXwN19obKBFLPn5XLV0oFKOffqnhoC9udvCQs/QSH/1jNWHI
 nnuah+yLczjK/qoZR1dKXEjZoJOH/jaX4Mj+uBOglts1fDRX2IGh5U8tHHTdVomjcwutXJSZ
 PYKhE/lf81B30QJAA+ceYKjvcRqyTJtcd04qd/pQTQvjPCp32IlTjoelgJobyeVTXUvVXOrP
 RStGtVeM8akLDUGUuTEfp85e3k9drDrPp8YL+zhUcfYsTpk6P6FOWhoBdeFKulL4jiY8nlbF
 0gYRrVXrYhO0cRHkvgMxu2MUoVKZWLYNhZEirSqJjiD3RCrFexMSXYMgRUdVicmulFLFMKRk
 R7hBl2ykRfE6xhhB0vrYRL1CH8yokphkbVywljZul0mlWxUu8H1N/PKZVo7+mjjl5ugNfga4
 JCoAHgJIyKHdMQEKwBqBkGgD8PfF1eA+gINDWTgbLAFYv9jPWy2xjnTx2IMuAE/3XeWyQR4H
 tg11r1BcYjOss90Bbo279Jny8/wCIBCsJzbBoTq5m8eIeRxOt5ziufPeRBS0dcnduCexCzZn
 WTG39iD2w+mZaQ5rjOBYUcMK7kl4QWebtzuNEf7wh5lKjEU6PKC5NcCNQGIPLLilZ9PecKrP
 wme1L/xrtgtntQaW5dVwWa2Hg5OtGFsaAocaYt0SIwJhs03CEhthu6MKsKbr4OxiEY+lPWHe
 CSGLkLD2Ue8TIwhPlS89eToFxwe+WzFyjZkDJy8TJUBU8bSTiv91UvHUtxpgjeA5Ws8kxdGM
 TC/7b7dqXZIZrHyJIEUbMM3MB/cAjgD0ACjAyPWeV0feVgs9Y1WpabRBF2NITqSZHqBwbcWE
 +W5Q61x/SmuMkcm3SeWhW0PkSBYqI308M8qD1EIiTmWkNTStpw2rdRyBh28GJ/MDx+Sj6PRj
 f7yxOcQR5lUaF3KLa2l86G2zN5yVH1N+fiPnaGoC4//z8Icpd6kXuz77yDzxZnH5RclI//KX
 r/4ICqtHi7YsjO0zWsx6+VTBM+JNv5qjo5r8pmqfrxd0Kw/dS2/7dsr2fUsoXRuUdaikKqDe
 1n/krSxrddrxKq+XXtOFxy71wTv3f+vNUpWV1OZrd5OVnRHD1ZKA+uBgTXHIC8cjMfthrmi+
 Tvys5N5hcufLvDTSakySDftnTmxUTO3YFTBoMh4ZeN3Z/l7ggbBMpS8e6ePXet1RePda5Tc5
 Gw4O1DXd9lsrcAJNQudo6va1J9f1bjn4SnROinSc8YlqeMCQXCZeJQvCDIzqX7MY016bBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRmVeSWpSXmKPExsWy7bCSvK5WbXSywarzMhYnri9isph2Zzer
 xd9Jx9gt/m+byGxxpXU6q8WVr+/ZLJoXr2ezOD0BqGTKub+sFl82TWCzuPJvD6PFxqeL2C3e
 d+9mtvjZvoXJ4vKuOWwWCz9uZbFobL7BbNHWuYzVYl/PR0aLMwt/MFsc/1dlseXNRKCZzwMc
 xD3WfrzP6tF66S+bx+9fkxg93t9oZffY+20Bi8eLr9uYPXbOusvusXmFlsemVZ1sHvNOBnrs
 n7uG3eN+93Emj97md2weE/fUefRtWcXosfl0dYBQFJdNSmpOZllqkb5dAlfGz5lbmQou6Fbc
 uXWVvYHxmEIXIyeHhICJxLYbe1lBbCGB3YwSa6ZyQcQlJDbdW87cxcgBZAtLHD5c3MXIBVTS
 xiSxs+MmM0gNi4CqxNJdzxhBbDYge+aMNewg9SICKhIXl5qA1DMLfGCT2Ld9JitIXFjAX2LX
 XhOQcl4BR4n1TdvAxnAKBEq8efuGCeKEHUwSz08KQJxgIXG3ZwVYK6+AoMTfHcIgYWYBLYmH
 v26xQNjyEtvfzmGewCg4C6FqFpKqWUiqFjAyr2KUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vO
 z93ECE4AWpo7GLev+qB3iJGJg/EQowQHs5II79kb4clCvCmJlVWpRfnxRaU5qcWHGKU5WJTE
 eS90nYwXEkhPLEnNTk0tSC2CyTJxcEo1MFWHHs2d9pVrsuFO68N7a89bn0ju+/Fxy/9vZ42a
 Vhnx2Ditbru5tdNR5clvYz+1DTvmnIkILlbvFN4o8GPvJo2/pWErH83Vv7D777v9mpXfprb3
 c64QnWIh9FAkRPjOpsdrzlp88F1+WoHnY5U4f9i7+3Wvch+4T+FSl2DWN5BKOh4n0eLrW8sQ
 Lnn/Z6PkEd1jeaHSZjwfZOUmxbU/nd0XFbLz5O8DnF/8Sh089FI0Tm+7rWr+iu3UI8fUj95F
 mossRTea6l3d+/jDxmSNp2EPLwtefaZnuTR/9+bu6sWB+YePNF1Q7U++lBn02v1r7X/vBuWy
 tt1S6dskF93aK37MIWOtWJvDkpn3D838b6bEUpyRaKjFXFScCABeoe+0bwMAAA==
X-CMS-MailID: 20221028065642epcas1p19a36e65931dc8e1a5fc56724c3852f40
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221022214657epcas1p18a2625c84cd6470b5404cb71f9836cc8
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <CGME20221022214657epcas1p18a2625c84cd6470b5404cb71f9836cc8@epcas1p1.samsung.com>
 <20221022214622.18042-4-ogabbay@kernel.org>
 <20221025154330.a3a839357363da6d5de96c89@samsung.com>
 <CAFCwf11kg-ZvYjEKf=VrvgvM03QZp7GejFhJ=gbCp4up++4h2w@mail.gmail.com>
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 26 Oct 2022 09:38:13 +0300
Oded Gabbay <ogabbay@kernel.org> wrote:

> On Tue, Oct 25, 2022 at 9:43 AM Jiho Chu <jiho.chu@samsung.com> wrote:
> >
> >
> > On Sun, 23 Oct 2022 00:46:22 +0300
> > Oded Gabbay <ogabbay@kernel.org> wrote:
> >
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index b58ffb1433d6..c13701a8d4be 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -56,6 +56,9 @@ MODULE_LICENSE("GPL and additional rights");
> > >  static DEFINE_SPINLOCK(drm_minor_lock);
> > >  static struct idr drm_minors_idr;
> > >
> > > +static DEFINE_SPINLOCK(accel_minor_lock);
> > > +static struct idr accel_minors_idr;
> > > +
> > >  /*
> > >   * If the drm core fails to init for whatever reason,
> > >   * we should prevent any drivers from registering with it.
> > > @@ -94,6 +97,8 @@ static struct drm_minor **drm_minor_get_slot(struct drm_device *dev,
> > >               return &dev->primary;
> > >       case DRM_MINOR_RENDER:
> > >               return &dev->render;
> > > +     case DRM_MINOR_ACCEL:
> > > +             return &dev->accel;
> > >       default:
> > >               BUG();
> > >       }
> > > @@ -108,9 +113,15 @@ static void drm_minor_alloc_release(struct drm_device *dev, void *data)
> > >
> > >       put_device(minor->kdev);
> > >
> > > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > > -     idr_remove(&drm_minors_idr, minor->index);
> > > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +     if (minor->type == DRM_MINOR_ACCEL) {
> > > +             spin_lock_irqsave(&accel_minor_lock, flags);
> > > +             idr_remove(&accel_minors_idr, minor->index);
> > > +             spin_unlock_irqrestore(&accel_minor_lock, flags);
> > > +     } else {
> > > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > > +             idr_remove(&drm_minors_idr, minor->index);
> > > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +     }
> > >  }
> > >
> > >  static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> > > @@ -127,13 +138,23 @@ static int drm_minor_alloc(struct drm_device *dev, unsigned int type)
> > >       minor->dev = dev;
> > >
> > >       idr_preload(GFP_KERNEL);
> > > -     spin_lock_irqsave(&drm_minor_lock, flags);
> > > -     r = idr_alloc(&drm_minors_idr,
> > > -                   NULL,
> > > -                   64 * type,
> > > -                   64 * (type + 1),
> > > -                   GFP_NOWAIT);
> > > -     spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +     if (type == DRM_MINOR_ACCEL) {
> > > +             spin_lock_irqsave(&accel_minor_lock, flags);
> > > +             r = idr_alloc(&accel_minors_idr,
> > > +                     NULL,
> > > +                     64 * (type - DRM_MINOR_ACCEL),
> > > +                     64 * (type - DRM_MINOR_ACCEL + 1),
> > > +                     GFP_NOWAIT);
> > > +             spin_unlock_irqrestore(&accel_minor_lock, flags);
> > > +     } else {
> > > +             spin_lock_irqsave(&drm_minor_lock, flags);
> > > +             r = idr_alloc(&drm_minors_idr,
> > > +                     NULL,
> > > +                     64 * type,
> > > +                     64 * (type + 1),
> > > +                     GFP_NOWAIT);
> > > +             spin_unlock_irqrestore(&drm_minor_lock, flags);
> > > +     }
> >
> > Hi,
> > There are many functions which checks drm type and decides its behaviors. It's good to
> > re-use exiting codes, but accel devices use totally different major/minor, and so it needs to be moved to
> > /drvier/accel/ (maybe later..). How about seperating functions for alloc/release minor (accel_minor_alloc..)?
> > also, for others which have drm type related codes.
> My feeling was moving the minor code handling to a different file (in
> addition to moving the major code handling) will cause too much
> duplication.
> My main theme is that an accel minor is another minor in drm, even if
> a bit different. i.e. It uses the same drm_minor structure.
> The driver declares he wants to use this minor using a drm driver feature flag.
> imo, all of that indicates the code should be inside drm.
> >
> >
> >
> >
> > > @@ -607,6 +652,14 @@ static int drm_dev_init(struct drm_device *dev,
> > >       /* no per-device feature limits by default */
> > >       dev->driver_features = ~0u;
> > >
> > > +     if (drm_core_check_feature(dev, DRIVER_COMPUTE_ACCEL) &&
> > > +                             (drm_core_check_feature(dev, DRIVER_RENDER) ||
> > > +                             drm_core_check_feature(dev, DRIVER_MODESET))) {
> > > +
> > > +             DRM_ERROR("DRM driver can't be both a compute acceleration and graphics driver\n");
> > > +             return -EINVAL;
> > > +     }
> > > +
> >
> > It's fine for the device only for acceleration, but can't graphic devices have acceleration feature?
> Of course they can :) In that case, and if they want to expose an
> accel device char, they should write an accel driver and connect it to
> their main graphics driver via auxiliary bus.
> 
> I could have added two flags - compute_accel, and compute_accel_only
> (similar to a patch that was sent to add render only flag), but imo it
> would make the code more convoluted. I prefer the clean separation and
> using standard auxiliary bus.
> 
> Thanks,
> Oded
> 

I understood. Seperation would be good as you mentioned in other mail.
This subsystem would be better choice for acceleration only devices, who need some features
of drm, but deoesnot want to include whole graphics related considerations.
I'll prepare Samsung's NPU driver using this after your reference driver is presented (maybe habana').

Thanks.
Jiho Chu


