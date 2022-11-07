Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD0061F3DA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 14:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A1210E30A;
	Mon,  7 Nov 2022 13:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8794210E30A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:01:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5E4D4B81147
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED5BC43150
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 13:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667826096;
 bh=lUkKGeRcTh9+9SDsnCQSKtY+GaKD9H0OWbszG978hiQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iNI8NkJ/V5F/2NCktntulgQY17wwt26e4vO6hEE+vwwM/i0HpIOAU71M8kL9eLtpI
 NUGrWXwpsJQHPLHODetlsJQ5VDWYM+hQNRU517DapPbVhuPxld2VwoT7Z+2xiOaK1Y
 rQL9Lb+V2kjM08ZdfOSvG6/fDch1LxTmPWxDwUHDUThddG/fKOVeWvut+m7Xs8Js4J
 CZeFrHgXBCe8ftHNk8KjPzhngcyvhM2UIvHqn6nSJcxHfNRASX75nA4RDY9ngTTRCl
 OjD3nYKWN1/gkONsFLVBp8zO1cuuUnM2kPQq9otJQatBi3Vq4wQSJ7dVz6PCtR51N0
 IZgK5P4oXqZgQ==
Received: by mail-yb1-f173.google.com with SMTP id 63so13487776ybq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 05:01:36 -0800 (PST)
X-Gm-Message-State: ACrzQf0aD7B4l89hHlDk+YafT2Pwa6tUEnnR7ShaKsEX0gKHEGfmJupz
 f2ewW+BTmg1mNjq9WL8kC7pYUu0r4UYvecrijNg=
X-Google-Smtp-Source: AMsMyM6kMAOKhCxiBtqGjN9Ku/e1kNsQnBUMowcJSFo2vUMahevwCtyGkyXu3Db6AdnKTs3gy17trTjMwVNHjuL7Sk0=
X-Received: by 2002:a25:1e89:0:b0:6bf:9e55:5cb4 with SMTP id
 e131-20020a251e89000000b006bf9e555cb4mr49430658ybe.642.1667826094690; Mon, 07
 Nov 2022 05:01:34 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
In-Reply-To: <Y2kAcCu4z2LUMN7u@nvidia.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 15:01:08 +0200
X-Gmail-Original-Message-ID: <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
Message-ID: <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Jason Gunthorpe <jgg@nvidia.com>
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
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 stanislaw.gruszka@intel.com, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 7, 2022 at 2:56 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Thu, Nov 03, 2022 at 10:39:36PM +0200, Oded Gabbay wrote:
> > On Thu, Nov 3, 2022 at 3:31 PM Oded Gabbay <ogabbay@kernel.org> wrote:
> > >
> > > On Thu, Nov 3, 2022 at 2:31 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Wed, Nov 02, 2022 at 10:34:03PM +0200, Oded Gabbay wrote:
> > > > > --- /dev/null
> > > > > +++ b/drivers/accel/Kconfig
> > > > > @@ -0,0 +1,24 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0-only
> > > > > +#
> > > > > +# Compute Acceleration device configuration
> > > > > +#
> > > > > +# This framework provides support for compute acceleration devices, such
> > > > > +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> > > > > +# devices
> > > > > +#
> > > > > +menuconfig ACCEL
> > > > > +     tristate "Compute Acceleration Framework"
> > > > > +     depends on DRM
> > > > > +     help
> > > > > +       Framework for device drivers of compute acceleration devices, such
> > > > > +       as, but not limited to, Machine-Learning and Deep-Learning
> > > > > +       acceleration devices.
> > > > > +       If you say Y here, you need to select the module that's right for
> > > > > +       your acceleration device from the list below.
> > > > > +       This framework is integrated with the DRM subsystem as compute
> > > > > +       accelerators and GPUs share a lot in common and can use almost the
> > > > > +       same infrastructure code.
> > > > > +       Having said that, acceleration devices will have a different
> > > > > +       major number than GPUs, and will be exposed to user-space using
> > > > > +       different device files, called accel/accel* (in /dev, sysfs
> > > > > +       and debugfs)
> > > >
> > > > Module name if "M" is chosen?
> > > Will add
> > So, unfortunately, the path of doing accel as a kernel module won't
> > work cleanly (Thanks stanislaw for pointing this out to me).
> > The reason is the circular dependency between drm and accel. drm calls
> > accel exported symbols during init and when devices are registering
> > (all the minor handling), and accel calls drm exported symbols because
> > I don't want to duplicate the entire drm core code.
>
> I really don't think this is the right way to integrate with
> DRM. Accel should be a layer over top of DRM, not have these wakky
> co-dependencies.
>
> The fact you are running into stuff like this already smells really
> bad.
>
> Jason
I don't agree with your statement that it should be "a layer over top of DRM".
Anything on top of DRM is a device driver.
Accel is not a device driver, it is a new type of drm minor / drm driver.

Please look at v3 of the patch-set. There I abandoned the idea of
having accel as a separate module and instead it is part of drm.ko, as
it should be because it is just a new drm minor.

The only alternative imo to that is to abandon the idea of reusing
drm, and just make an independant accel core code.

Oded
