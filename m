Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D11861E1C4
	for <lists+dri-devel@lfdr.de>; Sun,  6 Nov 2022 11:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571210E0FA;
	Sun,  6 Nov 2022 10:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B32A10E0FA
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:56:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E979DB80B34
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F337C43149
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Nov 2022 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667732183;
 bh=P5+oK5y1DwgK+cZ5FV6rwH5/YDmYJLDEYA0g/u08A8E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aPwkX6c6CUAG++Y/NFl1aCaJL4kAldL8ZfDAbrBpQSHavM4g2AHZ1twp8lcCazMh5
 ZFUGOuL0JxDyfkIq/AqGxKaRtGC8ZwolOW8dS9l0pU2r7AFj/XVcdVHgsP8AI1NpmP
 sJdSEEnCiAd0bmoh1KYmrYaSn54czDN+caHmaD+azD9NDru+1STH/6mZAh5g6aDnwv
 5rDSMKCP7H6zHRU5rszvLWGbvjEcTVHVpBTh9R6Pr1zBCMAkjnLmS+EwXoAJ1rSSlz
 q/gQDcxwok8ldw9azBb7QkBJzfez2gpfi9dvATFaCpZ827L0Ic67vQW8FmYtjS7zkt
 I5y8fmeq57YcQ==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-367b8adf788so80733617b3.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Nov 2022 02:56:22 -0800 (PST)
X-Gm-Message-State: ACrzQf30dSN3tBfRoPWUAAZxDjt0rjR7Hlj0e0QxHBdMdBm2Q3Fz97Nj
 hUB/A7araoGsl8IX2ppA93MZHNeOby7TMiacgQs=
X-Google-Smtp-Source: AMsMyM6F5TjV3XEFGifBFFyTnxoEYOIx53CjGoI5BoOXmHjwgY51QZL2DiccNWXEsKvh28HauC6Coj1mObem968DBNQ=
X-Received: by 2002:a0d:f445:0:b0:345:89a2:9a8d with SMTP id
 d66-20020a0df445000000b0034589a29a8dmr41906097ywf.107.1667732182083; Sun, 06
 Nov 2022 02:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-4-ogabbay@kernel.org>
 <b6faacac-46f2-7643-7796-b34840fc94f5@quicinc.com>
In-Reply-To: <b6faacac-46f2-7643-7796-b34840fc94f5@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Sun, 6 Nov 2022 12:55:55 +0200
X-Gmail-Original-Message-ID: <CAFCwf11Fd6GZkmDi74TRVd2t3v7d0HTYSjLeEdM9UeK+fUofXw@mail.gmail.com>
Message-ID: <CAFCwf11Fd6GZkmDi74TRVd2t3v7d0HTYSjLeEdM9UeK+fUofXw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] drm: initialize accel framework
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jiho Chu <jiho.chu@samsung.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 2, 2022 at 11:30 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/2/2022 2:34 PM, Oded Gabbay wrote:
> > @@ -163,7 +174,11 @@ static int drm_minor_register(struct drm_device *dev, unsigned int type)
> >
> >       ret = drm_debugfs_init(minor, minor->index, drm_debugfs_root);
> >       if (ret) {
> > -             DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> > +             if (minor->type == DRM_MINOR_ACCEL)
> > +                     DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/accel.\n");
> > +             else
> > +                     DRM_ERROR("DRM: Failed to initialize /sys/kernel/debug/dri.\n");
> > +
> >               goto err_debugfs;
> >       }
> >
>
> This doesn't look right.  Don't you need to call drm_debugfs_init() with
> accel_debugfs_root for the case - minor->type == DRM_MINOR_ACCEL?
> Unless I fail to understand something, this will put all the accel
> devices under /sys/kernel/debug/dri
ofc, you are correct.
Will be fixed in v3.
Thanks,
Oded
