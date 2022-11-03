Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30E1617DE9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 14:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8942310E287;
	Thu,  3 Nov 2022 13:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257BC10E287
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:29:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2D56B8266F
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D2AEC433D6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 13:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667482150;
 bh=NBTXHeZbzlXiMhENl3g2+LKNqylGo+gAobQsaKkbE6o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hf28Sjru9tT+WFULq34ld1yEfOMfG+duNWqZGGI9uZ9bVKalnd8IPC7NPcr5XgiiZ
 V49Wcga0W2LprvcL/DQU29KMZs4qWCC3H5Hc+9enQNTEkqxjBev4bo7D4IZmzbHbQZ
 BOlxXgWv4y9cT41eqnC+QPwRtVfujMsckVkXGXWlxTzqpls10wyKj9ZnsmD4PnZwaX
 OGW8OIsESGmfypG2+OfZKK+tV3BejccjRnhGiqc/3aVe7VCP3sr7HsJTlCya1hb3d2
 CKf3xh4kWQk1GDuSFWjmn6kI61WevQ4bNrc9SHhytCttNNJUtAYYJb66T0gN8kIsC9
 FS+EyNGGTUz7A==
Received: by mail-yb1-f181.google.com with SMTP id y72so2154030yby.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 06:29:10 -0700 (PDT)
X-Gm-Message-State: ACrzQf3xX5O1iNYvvJl8LFGPiQWszhC48jbpvw/y/sYmxky2LCvV6+kp
 vJVSS4boUxX5ebkOpBdBX7bcSktjdAlMg838prU=
X-Google-Smtp-Source: AMsMyM6/bmKCjDBSeXX5Wnu8eHuoV1vSAbE8aoKVY6aJCJ8f/rScgQ+XT+AOSqaZsYyIilSJ4nQDxM8sFCx+mllMZyQ=
X-Received: by 2002:a25:a4e4:0:b0:6cb:d9ba:b0b0 with SMTP id
 g91-20020a25a4e4000000b006cbd9bab0b0mr16767304ybi.68.1667482149440; Thu, 03
 Nov 2022 06:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221102203405.1797491-1-ogabbay@kernel.org>
 <20221102203405.1797491-2-ogabbay@kernel.org>
 <5979d266-e864-cc1c-fe2b-2c81f5223076@quicinc.com>
In-Reply-To: <5979d266-e864-cc1c-fe2b-2c81f5223076@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 3 Nov 2022 15:28:43 +0200
X-Gmail-Original-Message-ID: <CAFCwf12J272cd+PzBagceocQoYLMPia9_1GobSkxwApM5+W1xA@mail.gmail.com>
Message-ID: <CAFCwf12J272cd+PzBagceocQoYLMPia9_1GobSkxwApM5+W1xA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/3] drivers/accel: define kconfig and register a
 new major
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

On Wed, Nov 2, 2022 at 11:04 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/2/2022 2:34 PM, Oded Gabbay wrote:
> > diff --git a/drivers/accel/accel_drv.c b/drivers/accel/accel_drv.c
> > new file mode 100644
> > index 000000000000..6132765ea054
> > --- /dev/null
> > +++ b/drivers/accel/accel_drv.c
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +/*
> > + * Copyright 2022 HabanaLabs, Ltd.
> > + * All Rights Reserved.
> > + *
> > + */
> > +
> > +#include <linux/module.h>
>
> Alphebetical order?
ok
>
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +
> > +#include <drm/drm_accel.h>
> > +#include <drm/drm_ioctl.h>
> > +#include <drm/drm_print.h>
> > +
> > +static struct dentry *accel_debugfs_root;
> > +struct class *accel_class;
>
> Static?
>
yes, thx.
