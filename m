Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB456632778
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 16:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6332F10E2EE;
	Mon, 21 Nov 2022 15:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 541C310E2EE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:12:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A7A4B81091
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:12:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C212AC433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669043526;
 bh=Y2awgxzkLXn6V7BTrm8gtaQXfSLTb8RLAcCS65ZDhoo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F3ijGoICNR9wHi5/fz7CdYAI9mQeZ9alLkqsoAF1PrfSMFgXCbzs+exVs8YBVGxuA
 8Da6ejJeLsfj40i6RUh/Shrm8foCHZlRu/K6q/rD4Q0YhZetpFstPz8j/Y9PUq/sPi
 Ek3gfenvjQpVdJdAV+OOWxO4RjkdLVjcW9gOsNUGAhPUIwhTDeKBu1Z53ThYihATbp
 VH1GsjDOjlpz4e7U1FEchNdUb0aTtu+X6KGwshZURSRLkgdp84vH6ptrSnQjNrcKw6
 gRVaOw9MUmDCoFnttED0weLKq9fifJxOGTyhvN3C63pujNdkaDJu7ERbkrkykCFsUQ
 cBA2aoQBnkAXA==
Received: by mail-yb1-f170.google.com with SMTP id i131so13909801ybc.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:12:06 -0800 (PST)
X-Gm-Message-State: ANoB5pnkaDo1T9N8tMwpuMXckkrI8b9q3wsxhIZLYTgpnFiF526Ffx6Y
 L0PX4yLr4VKkzD2OEXZBmqnl3HZBYEj7WqmcWbU=
X-Google-Smtp-Source: AA0mqf5/5xxD5cxs88zpMsUiAEvUlgBYebjN8ztc7BugrLv4fV04+FofRMCpOJDou4t7KLcL8prele+XwwE85kjzVxs=
X-Received: by 2002:a25:ed10:0:b0:6d0:5d59:dba1 with SMTP id
 k16-20020a25ed10000000b006d05d59dba1mr16252093ybh.68.1669043525889; Mon, 21
 Nov 2022 07:12:05 -0800 (PST)
MIME-Version: 1.0
References: <20221119204435.97113-1-ogabbay@kernel.org>
 <20221119204435.97113-3-ogabbay@kernel.org>
 <9ce1bf9f-a481-92e3-c7cc-a1b41270468d@quicinc.com>
In-Reply-To: <9ce1bf9f-a481-92e3-c7cc-a1b41270468d@quicinc.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 21 Nov 2022 17:11:39 +0200
X-Gmail-Original-Message-ID: <CAFCwf11doYdEEg8juX4Z3yOk8NfauWOV2hn8bCzmDY3k6-9sdg@mail.gmail.com>
Message-ID: <CAFCwf11doYdEEg8juX4Z3yOk8NfauWOV2hn8bCzmDY3k6-9sdg@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] accel: add dedicated minor for accelerator devices
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
 Christopher Friedt <chrisfriedt@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 20, 2022 at 11:47 PM Jeffrey Hugo <quic_jhugo@quicinc.com> wrote:
>
> On 11/19/2022 1:44 PM, Oded Gabbay wrote:
> > diff --git a/drivers/accel/drm_accel.c b/drivers/accel/drm_accel.c
> > index fac6ad6ac28e..703d40c4ff45 100644
> > --- a/drivers/accel/drm_accel.c
> > +++ b/drivers/accel/drm_accel.c
> > @@ -8,14 +8,25 @@
> >
> >   #include <linux/debugfs.h>
> >   #include <linux/device.h>
> > +#include <linux/xarray.h>
>
> Including xarray, but using idr
> This should be linux/idr.h
>
> This seems so minor, I don't think I advise spinning a v5 for it.  If a
> v5 is warranted elsewhere, obviously fix this.  If not, hopefully this
> can be fixed up by whoever applies it, or someone submits a follow up patch.
>
> Hopefully this is the only nit.  I would like to see this merged.
>
> -Jeff
Thanks,
I'll update it before sending the PR.
Oded
