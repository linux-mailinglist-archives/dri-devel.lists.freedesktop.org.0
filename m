Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AC5656A6F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Dec 2022 13:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A7B10E03D;
	Tue, 27 Dec 2022 12:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C729A10E03D
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 12:04:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AA564B80F91
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 12:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63DF7C433D2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142683;
 bh=YRZYZEZqxhYz5HBI5rM384SwiIQ90WVN3HJ7bun9/a0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WWroJKdpWh8nROQOp17fWmnds1ZxF9sSVoQ5vYrk9iyOU7SMmDIC9heFWfFoEg7hn
 GBK4liJhCpth4xzrOHebmxNCBTuwlNWTNpAHsoKDhXD5ueP+mBLloI3TAN8JYCAVj8
 EpSnYI3OcVNNYiwXFZi9JSq8lzLdBBywJafRFsOkY2rtIUutF3jbRhoAwiTLrdiP8F
 ng2/csTSoBWzq6SbLeuMRZ8QUVs/miS8BPurYyNhT0x4gVaXoc3rqmA1qSaeqUNEFn
 W5j5S2jNT9zdnFGBpcRvMRmNc/55AmvXV9Kov6hLnHC1y6PCwJWiPKMUJKC5Nt+H1t
 2EFPXOTVqpUSQ==
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-46198b81e5eso181504577b3.4
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 04:04:43 -0800 (PST)
X-Gm-Message-State: AFqh2kroCcJXy5qq/a0m01cZIVSD+gZB9Ni2trw5jAma5jlU4p6TzZjK
 r0nEhOs1YmIX3gerHXQjgCdtzFkQxPMhEf4hx5w=
X-Google-Smtp-Source: AMrXdXsnpkpmjYZ98UhnrdMq3SqJVtdECg4PGjHdo8XZNDH1D8kCqh5abl9tfvTR8KA5KCb+RxrWf3WVFwl4sBj1G74=
X-Received: by 2002:a81:1c54:0:b0:45b:1789:fe4c with SMTP id
 c81-20020a811c54000000b0045b1789fe4cmr1854507ywc.182.1672142681055; Tue, 27
 Dec 2022 04:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20221226213227.26953-1-ogabbay@kernel.org>
 <Y6qeDQY+X6ZRn3bi@kroah.com>
In-Reply-To: <Y6qeDQY+X6ZRn3bi@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Tue, 27 Dec 2022 14:04:14 +0200
X-Gmail-Original-Message-ID: <CAFCwf11GO4n-nOhyLDAG9k9MSJ1xfjj6_1nH=X9vKgdbvY62yw@mail.gmail.com>
Message-ID: <CAFCwf11GO4n-nOhyLDAG9k9MSJ1xfjj6_1nH=X9vKgdbvY62yw@mail.gmail.com>
Subject: Re: [PATCH 1/2] habanalabs/uapi: move uapi file to drm
To: Greg KH <gregkh@linuxfoundation.org>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 27, 2022 at 9:26 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 26, 2022 at 11:32:26PM +0200, Oded Gabbay wrote:
> > Move the habanalabs.h uapi file from include/uapi/misc to
> > include/uapi/drm, and rename it to habanalabs_accel.h.
> >
> > This is required before moving the actual driver to the accel
> > subsystem.
>
> What requires this?  Isn't this going to break userspace code?
Yes, most definitely it will break userspace code. Moreover, the
patches I'll send in 1-2 weeks to change the device char files will
also break it.
Having said that, I'm not worried because I don't believe anyone is
working with the upstream version because there is no NIC support
(yet).

If this is unacceptable, I can offer a couple of alternatives and we
can discuss what's best:

1. Do what AMD did a couple of years ago with radeon and amdgpu. We
keep the habanalabs original driver in misc to support Goya, Gaudi1
and Gaudi2 (only with the current features). Create a new habanalabs
driver in accel that will support only Gaudi2 and beyond. Our NIC
driver (which I will start upstreaming in a few months) anyway will
only support Gaudi2, so it will only work with the new driver. Make
the drivers mutually exclusive in Kconfig.
Gaudi2 as-is will be supported in the current driver, but if users
want to use new features (and NIC), they will need to move to the new
driver.

2. Move the driver to the new accel, but keep a copy of the uapi file
in misc (to prevent breaking include paths). In addition, expose both
new accel device char file (through drm code) and current habanalabs
char file. Users can "acquire" the device through either
/dev/accel/accel0 or /dev/hl0. Add new uapi content only to the uapi
file in include/uapi/drm. This is what I'm going to do in our internal
tree that we release as an out-of-tree driver to customers.

3. Keep the driver in misc. Clone it to accel only for next-gen ASIC,
whenever that may be.

WDYT ?
I'm sure there are additional variations of the three options above,
or a different option entirely.

Thanks,
Oded

>
> thanks,
>
> greg k-h
