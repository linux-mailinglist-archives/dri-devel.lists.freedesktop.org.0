Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39718621159
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 13:48:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F239510E286;
	Tue,  8 Nov 2022 12:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F369710E286
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:48:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7DD55B81ACB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:48:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF39C433D6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667911725;
 bh=/C+b508gAj/Q+BmeIpxPFXFveLDZojLGt927GrLKC/s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T5XI5kDaxuWTZFlRoTxCxMjci3972mvKPT1Js/gWkB4QwmGvSLR9AwDBnJK2CZOvs
 BpwvKvfXohfo44tUC4z7BDUfwN7o/4TG2+sVrKWmcuAssZ9lKqCVJTMJdTMqsBN8Sw
 jSEBWQHBJJN221ZCDrWEAH3SAdopIIwNkZiQCFH7V19QjvVfWMXoNAH2fPCkgQUIOf
 OqmjawYaRAToWUNGQg0XyvXtMeYb8HWpxyCKY8T7jOZqBbrSTA8VG31nARZqhIThup
 yxF/ydBFHmxSrqHbX9W7ihHn/V+TW6EfUq7F0sL8CLT8hWGDrL2mb+nCpOPobmUnVi
 s3wtUuAIC5eBw==
Received: by mail-yb1-f180.google.com with SMTP id 7so12679979ybp.13
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 04:48:45 -0800 (PST)
X-Gm-Message-State: ANoB5plOnzBP2cjgcX4jtcpSyvxMyvPZaOqyykX/eZb8TYKjMlHqWIkY
 gqlyrYRQWJjMeT+HNGRpStYmutqvZKlHwR68Gg0=
X-Google-Smtp-Source: AA0mqf6aAqrZKqRWPUmWG7Y6EiQsDi9ZjRKXAfj/lEixKDnfne0KRvlHho7AtHsaSH9EO35/AhsJIFG/EbpEjWqqjdI=
X-Received: by 2002:a25:2389:0:b0:6d8:7f81:edaf with SMTP id
 j131-20020a252389000000b006d87f81edafmr7102372ybj.443.1667911724199; Tue, 08
 Nov 2022 04:48:44 -0800 (PST)
MIME-Version: 1.0
References: <20221106210225.2065371-1-ogabbay@kernel.org>
 <20221106210225.2065371-2-ogabbay@kernel.org>
 <20221108124614.GA6397@linux.intel.com>
In-Reply-To: <20221108124614.GA6397@linux.intel.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 8 Nov 2022 14:48:17 +0200
X-Gmail-Original-Message-ID: <CAFCwf12D=nEsRyDvbEotXN6xCP+8FPu-d-heTQGzas9DwCPRSQ@mail.gmail.com>
Message-ID: <CAFCwf12D=nEsRyDvbEotXN6xCP+8FPu-d-heTQGzas9DwCPRSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] drivers/accel: define kconfig and register a
 new major
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
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
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Arnd Bergmann <arnd@arndb.de>, Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 8, 2022 at 2:46 PM Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Sun, Nov 06, 2022 at 11:02:23PM +0200, Oded Gabbay wrote:
> > Add a new Kconfig for the accel subsystem. The Kconfig currently
> > contains only the basic CONFIG_DRM_ACCEL option that will be used to
> > decide whether to compile the accel registration code. Therefore, the
> > kconfig option is defined as bool.
> >
> > The accel code will be compiled as part of drm.ko and will be called
> > directly from the DRM core code. The reason we compile it as part of
> > drm.ko and not as a separate module is because of cyclic dependency
> > between drm.ko and the separate module (if it would have existed).
> > This is due to the fact that DRM core code calls accel functions and
> > vice-versa.
> >
> > The accelerator devices will be exposed to the user space with a new,
> > dedicated major number - 261.
> >
> > The accel init function registers the new major number as a char device
> > and create corresponding sysfs and debugfs root entries, similar to
> > what is done in DRM init function.
> >
> > I added a new header called drm_accel.h to include/drm/, that will hold
> > the prototypes of the drm_accel.c functions. In case CONFIG_DRM_ACCEL
> > is set to 'N', that header will contain empty inline implementations of
> > those functions, to allow DRM core code to compile successfully
> > without dependency on CONFIG_DRM_ACCEL.
> >
> > I Updated the MAINTAINERS file accordingly with the newly added folder
> > and I have taken the liberty to appropriate the dri-devel mailing list
> > and the dri-devel IRC channel for the accel subsystem.
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
>
> Tested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
>
> I tested those patches with intel_vpu driver. After initial troubles,
> I got things worked with our driver and user mode components.
>
> Regards
> Stanislaw

Thanks!
Great to hear that.
Oded
