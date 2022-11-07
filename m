Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18CB61F4EB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768D210E19D;
	Mon,  7 Nov 2022 14:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E08910E19D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:02:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8385610A3
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC74C43141
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 14:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667829749;
 bh=zpEewj5MVZ9bJoL7Xyycxj043AlHeiHMJ1ICTR3y2NY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pRZyW4UC7Ll6EfhjsbK2sIj0ikxPuum4Ko0AFlkCmugkQ/nuOe3IuDU6f8P+OSUl1
 Z8bM1GtcXmd2J73yD5qM7pUd6iRXB47W7Tp5xThpcYEqXk/z9x6cMA/Mq0DsO8wl36
 K8M8aejSY+kOhw+CpvJxPU0mvKr/Hu+19q2RNLZT+5psj5nyMiBZ398WhfplP2vVFx
 F0xfAzys7foBtOXggxlJGKl+wysv6IG/oXVvftlVaU8EZgH6KDRCVsl771ZkyumRL1
 IhpH68FqqTqCVe4dDG0j4MQfJAcCrmJ0RuxatsKsd4tbn1dR7/NpKkEBwPh5kj3jst
 eDGd0comBLbyg==
Received: by mail-yb1-f172.google.com with SMTP id z192so13753481yba.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 06:02:29 -0800 (PST)
X-Gm-Message-State: ACrzQf31JNfstB7spb9njNGeHw2fdCbhK5mrycfZfftn3MFdk6R/9b2k
 59q4NQ3UrJcvVlEU4wx18NpPn8jTjdoxYhwBu04=
X-Google-Smtp-Source: AMsMyM5LwoynkPx1YgLfmCY0hq4wGMOnnRu54M0d8kjmNIi1lWDudU/pHVKjj0vORMrz7+eEz3Io0Wz53F1fu2OMj3E=
X-Received: by 2002:a05:6902:152:b0:6ca:8fa:105b with SMTP id
 p18-20020a056902015200b006ca08fa105bmr49184993ybh.550.1667829748282; Mon, 07
 Nov 2022 06:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <Y2MMCIe5wND2XPqE@kroah.com>
 <CAFCwf13uLj=P6u6FAcY8M5qAXoaBdb+Ha-TYj0j2FAZnFAPFYg@mail.gmail.com>
 <CAFCwf12yRUG4593ozJMEwaaJBKyWqXTTCjef9O_fzWdQBxVrtw@mail.gmail.com>
 <Y2kAcCu4z2LUMN7u@nvidia.com>
 <CAFCwf10K-dTu455QfOK8i6thismY-FUN2Rws830EGiqOcGWFgA@mail.gmail.com>
 <Y2kDzPswkKyZyRpS@nvidia.com>
In-Reply-To: <Y2kDzPswkKyZyRpS@nvidia.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 7 Nov 2022 16:02:01 +0200
X-Gmail-Original-Message-ID: <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
Message-ID: <CAFCwf10A=-bj2nR8WasNxyQQ07D24Je04tzKxqv2X_XnA0BUSQ@mail.gmail.com>
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

On Mon, Nov 7, 2022 at 3:10 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Nov 07, 2022 at 03:01:08PM +0200, Oded Gabbay wrote:
> > I don't agree with your statement that it should be "a layer over top of DRM".
> > Anything on top of DRM is a device driver.
> > Accel is not a device driver, it is a new type of drm minor / drm driver.
>
> Yeah, I still think this is not the right way, you are getting almost
> nothing from DRM and making everything more complicated in the
> process.
>
> > The only alternative imo to that is to abandon the idea of reusing
> > drm, and just make an independant accel core code.
>
> Not quite really, layer it properly and librarize parts of DRM into
> things accel can re-use so they are not intimately tied to the DRM
> struct device notion.
>
> IMHO this is much better, because accel has very little need of DRM to
> manage a struct device/cdev in the first place.
>
> Jason
I'm not following. How can an accel device be a new type of drm_minor,
if it doesn't have access to all its functions and members ?
How will accel device leverage, for example, the GEM code without
being a drm_minor ?

Librarizing parts of DRM sounds nice in theory but the reality is that
everything there is interconnected, all the structures are
interdependent.
I would have to re-write the entire DRM library to make such a thing
work. I don't think this was the intention.

The current design makes the accel device an integral part of drm,
with very minimal code duplication and without re-writing DRM.

Oded
