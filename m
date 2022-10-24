Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBD9609B30
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:20:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEB210E290;
	Mon, 24 Oct 2022 07:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551CB10E290
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:20:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31AAE6101E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB68C43147
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666596020;
 bh=Ty9NkDJERk08rww6GWq0fv6JMZmjA9hkVm/1UTl6Gew=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=soqKKgIavXRhZ62v8koldR2f0U/tPr0CABp32vpxSlg6ct7kFsnJAPq3QCgK1kqvB
 MfxxSqO5E/C2Iy8fnf1d5VLTjSgELqca6fy+mfKH12YIK7VoHtBJ06LErJ6GmYxo0p
 LqHByjU05gCnWf+JyfowGoVSU6sO+87IZ1k+MPAD7PB3vb1mg8NETVZm2zDSpUb5pQ
 17X3kKHscLx83fm1GtQqq7f/Q89OzWSvllIjNb9THemBlK2bFCpwh+Sti4E0klVi1s
 J38ZYW54812l4J39xsMgVrtJfNlk2s8+b2aTQcupKA6l4rAVsshi9YbFEP/hwmOpqS
 1I0xgORQrgwtQ==
Received: by mail-ed1-f43.google.com with SMTP id a5so14737203edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 00:20:20 -0700 (PDT)
X-Gm-Message-State: ACrzQf26M/BoZP4l1FH35IaOAX1bP1SeTGqt/NKwpdGa2GH0VQ+02VK0
 IUMDhHTJMxLwXgd3+f2yEE1ClxredJu4VGJ2qGs=
X-Google-Smtp-Source: AMsMyM4TqziqZFrPulpnYOMDfvg5oeGxMZ+ThBB4Hrbl8U9QezIK7K/8pKnOjFAowp0Rgwci0DgtpbzSguFKiCXw6sM=
X-Received: by 2002:a17:907:3205:b0:770:8554:c4ee with SMTP id
 xg5-20020a170907320500b007708554c4eemr26613904ejb.39.1666596018653; Mon, 24
 Oct 2022 00:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-2-ogabbay@kernel.org>
 <Y1U2Sy3hHmYfveaD@kroah.com>
In-Reply-To: <Y1U2Sy3hHmYfveaD@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 24 Oct 2022 10:19:52 +0300
X-Gmail-Original-Message-ID: <CAFCwf11RLTsd2bfc3SoKVKDthVPJ9tbiYjsKPnkTfjFp5djeSg@mail.gmail.com>
Message-ID: <CAFCwf11RLTsd2bfc3SoKVKDthVPJ9tbiYjsKPnkTfjFp5djeSg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] drivers/accel: add new kconfig and update
 MAINTAINERS
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
> On Sun, Oct 23, 2022 at 12:46:20AM +0300, Oded Gabbay wrote:
> > Add a new Kconfig for the accel subsystem. The Kconfig currently
> > contains only the basic CONFIG_ACCEL option that will be used to
> > decide whether to compile the accel registration code as part of the
> > drm core functionality.
> >
> > I have taken the liberty to appropriate the dri-devel mailing list and
> > the dri-devel IRC channel for the accel subsystem.
> >
> > Signed-off-by: Oded Gabbay <ogabbay@kernel.org>
> > ---
> >  MAINTAINERS           |  8 ++++++++
> >  drivers/Kconfig       |  2 ++
> >  drivers/accel/Kconfig | 24 ++++++++++++++++++++++++
>
> YOu never use drivers/accel/ again in this patch series, was that
> intentional?
Yes, because I didn't plan for accel to have any core code at this stage.
But according to your other comments, this will probably change
(unless someone thinks otherwise).
Oded
>
> thanks,
>
> greg k-h
