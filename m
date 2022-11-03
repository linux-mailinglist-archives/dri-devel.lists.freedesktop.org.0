Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D87D16189B2
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 21:40:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF4610E2B8;
	Thu,  3 Nov 2022 20:40:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DA510E2B8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 20:40:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D438961FF8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 20:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEAE3C43142
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 20:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667508003;
 bh=8A5DvzoRi1Bdtzf7W7j/gUi5tTR9+uK5q+GZ6lGwTHw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p//QClwV8y/uM9tYtpafsZogTTKSps8F/sE/RMxFAIr6E/g3g2NV9ODqxF20ZGxoS
 2+cWai+HG9TB4/6+mTltMT/sqsOfTUnJ/70Ggfst/VOejaE/dDV/kY6+84mPs6dzrh
 n+ek8FglqHDqxoCH0vBSZr6tI+vDt/Opa+M7lc77czMC/EB2RToxa/apOP16+lDP8h
 UrgwWbHH6vU3Y3O0FHAKW8WPM4Kayb8or7a40LV3JB+qhjFCCmk2usNYJjbZfNxAg6
 hLHgwpnYqACOdSErgov7J0x/kucdiEeYETVQghR63NWSkQ5hXiKyAm7CN/pwVdwI8d
 QwPITuH02vjig==
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-368edbc2c18so26530167b3.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 13:40:03 -0700 (PDT)
X-Gm-Message-State: ACrzQf06gqo/cwDXF0Wl598o7eOfS6VIzMSFvy/RqJTK0mO8omYhybrX
 d6Tknha3crF779/8KN4PX7c/A996r4Mjhb/rPYo=
X-Google-Smtp-Source: AMsMyM4AppiZ5yG16T5S+vyeWvltrJ1MSfPLEx0hdL7lvqNIogE+iO0w06PWxJbVlJpszmYBlqqEe+9J9E3yweYTw7w=
X-Received: by 2002:a81:c11:0:b0:36a:bcf0:6340 with SMTP id
 17-20020a810c11000000b0036abcf06340mr30285263ywm.467.1667508002734; Thu, 03
 Nov 2022 13:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
In-Reply-To: <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 3 Nov 2022 22:39:36 +0200
X-Gmail-Original-Message-ID: <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
Message-ID: <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
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
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 stanislaw.gruszka@intel.com, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Kevin Hilman <khilman@baylibre.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 3, 2022 at 3:31 PM Oded Gabbay <ogabbay@kernel.org> wrote:
>
> On Thu, Nov 3, 2022 at 2:31 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Nov 02, 2022 at 10:34:03PM +0200, Oded Gabbay wrote:
> > > --- /dev/null
> > > +++ b/drivers/accel/Kconfig
> > > @@ -0,0 +1,24 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Compute Acceleration device configuration
> > > +#
> > > +# This framework provides support for compute acceleration devices, such
> > > +# as, but not limited to, Machine-Learning and Deep-Learning acceleration
> > > +# devices
> > > +#
> > > +menuconfig ACCEL
> > > +     tristate "Compute Acceleration Framework"
> > > +     depends on DRM
> > > +     help
> > > +       Framework for device drivers of compute acceleration devices, such
> > > +       as, but not limited to, Machine-Learning and Deep-Learning
> > > +       acceleration devices.
> > > +       If you say Y here, you need to select the module that's right for
> > > +       your acceleration device from the list below.
> > > +       This framework is integrated with the DRM subsystem as compute
> > > +       accelerators and GPUs share a lot in common and can use almost the
> > > +       same infrastructure code.
> > > +       Having said that, acceleration devices will have a different
> > > +       major number than GPUs, and will be exposed to user-space using
> > > +       different device files, called accel/accel* (in /dev, sysfs
> > > +       and debugfs)
> >
> > Module name if "M" is chosen?
> Will add
So, unfortunately, the path of doing accel as a kernel module won't
work cleanly (Thanks stanislaw for pointing this out to me).
The reason is the circular dependency between drm and accel. drm calls
accel exported symbols during init and when devices are registering
(all the minor handling), and accel calls drm exported symbols because
I don't want to duplicate the entire drm core code.

I'll keep this menuconfig to provide the ability to disable this code
for people who think it is too "experimental". And in the future, when
drivers will join this subsystem, they will need this place for their
kconfig.

Thanks,
Oded
