Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5583862005B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 22:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450CD10E4B4;
	Mon,  7 Nov 2022 21:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA98210E4B4
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:07:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7AAE9B8169F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:07:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3294AC433C1
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 21:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667855228;
 bh=35Kt7RfXTGrpmnm+A+6ICvQbAqN4Rh+f2zdGLkqxYlQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EKoBGIv2z25CaP2ZaTUHxI2NDsDw2pq7HU2Pi3V+xT6qKnFVdplEQ8Gt1Zb2YI2Ko
 DxHI1sKGDggo3kOkbtl5m31tGbv3KhW72f3cdiOhBr3EllnT2AV39+nngiR8VeWaCi
 ESR+Oq8InGTavmbG/omzYfL5Fkbnzd5clbEmXjhQ+2gP1/w1xfmYqD6C4e4gVY+FtN
 OZX4RuJ+RvsPrKJPeYt9EO2i9OwwDQqTm3vVuJsnEMPFwi5d4puKFOBQA+Vprs/Aay
 +v/Lxx0w9HuCeFcWxqpT9q3ZRjuBdgKAe/jdET1gaYomVf6+4SKOcsto9DzbXJkFdp
 R11xlsjNhRemg==
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-36cbcda2157so116247147b3.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 13:07:08 -0800 (PST)
X-Gm-Message-State: ACrzQf0NSAwwPa18or7BQTRmKPy0gi7d7L7Fe+ucHGyST72Zin38JiM3
 KQPirJAQ4Ky5BgX3S7xsJHa+brMznVKDl2T2c4g=
X-Google-Smtp-Source: AMsMyM5OImNYpUi6MJAyaoHBG+PMmSj5RdM9uwWMSNW6HniZGG7MfQ9/cV022DRtOdso7B9q6QZg0WbcHQ/7IiZXcjw=
X-Received: by 2002:a05:690c:825:b0:36a:b160:21b with SMTP id
 by5-20020a05690c082500b0036ab160021bmr50210487ywb.211.1667855227298; Mon, 07
 Nov 2022 13:07:07 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-3-ogabbay@kernel.org>
 <2f415e77-9332-2d66-cd59-05db8d5790ea@quicinc.com>
In-Reply-To: <2f415e77-9332-2d66-cd59-05db8d5790ea@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 23:06:41 +0200
X-Gmail-Original-Message-ID: <CAFCwf11AMAYgKHJia87x0gsZ2ufVK1ZQqXqDLLimeeTVQVp2CA@mail.gmail.com>
Message-ID: <CAFCwf11AMAYgKHJia87x0gsZ2ufVK1ZQqXqDLLimeeTVQVp2CA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] accel: add dedicated minor for accelerator
 devices
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
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
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 6:20 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/6/2022 2:02 PM, Oded Gabbay wrote:
> > --- a/drivers/accel/drm_accel.c
> > +++ b/drivers/accel/drm_accel.c
> > @@ -8,14 +8,25 @@
> >
> >   #include <linux/debugfs.h>
> >   #include <linux/device.h>
> > +#include <linux/xarray.h>
>
> If we are not using xarray at this time, do we still need this include?
>
> >
> >   #include <drm/drm_accel.h>
> > +#include <drm/drm_debugfs.h>
> > +#include <drm/drm_drv.h>
> > +#include <drm/drm_file.h>
> >   #include <drm/drm_ioctl.h>
> >   #include <drm/drm_print.h>
> >
> > +static DEFINE_SPINLOCK(accel_minor_lock);
> > +static struct idr accel_minors_idr;
>
> I beleive we should have an explicit include for the IDR header.
>
> > --- a/include/drm/drm_accel.h
> > +++ b/include/drm/drm_accel.h
> > @@ -8,12 +8,56 @@
> >   #ifndef DRM_ACCEL_H_
> >   #define DRM_ACCEL_H_
> >
> > -#define ACCEL_MAJOR     261
> > +#include <drm/drm_file.h>
> > +
> > +#define ACCEL_MAJOR          261
> > +#define ACCEL_MAX_MINORS     256
>
> This diff seems really weird.  The changes to the ACCEL_MAJOR define
> could get pushed to the previous patch, no?
>
> > @@ -23,9 +67,31 @@ static inline void accel_core_exit(void)
> >
> >   static inline int __init accel_core_init(void)
> >   {
> > +     /* Return 0 to allow drm_core_init to complete successfully */
>
> Move to previous patch?
>
> > --- a/include/drm/drm_drv.h
> > +++ b/include/drm/drm_drv.h
> > @@ -94,6 +94,14 @@ enum drm_driver_feature {
> >        * synchronization of command submission.
> >        */
> >       DRIVER_SYNCOBJ_TIMELINE         = BIT(6),
> > +     /**
> > +      * @DRIVER_COMPUTE_ACCEL:
> > +      *
> > +      * Driver supports compute acceleration devices. This flag is mutually exclusive with
> > +      * @DRIVER_RENDER and @DRIVER_MODESET. Devices that support both graphics and compute
> > +      * acceleration should be handled by two drivers that are connected using auxiliry bus.
>
> auxiliry -> auxiliary
>
All comments will be fixed.
Thanks,
Oded
