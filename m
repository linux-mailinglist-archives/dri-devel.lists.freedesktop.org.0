Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C755EEE10
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 08:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0008010E088;
	Thu, 29 Sep 2022 06:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6AB10E088
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 06:51:00 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id m3so645595eda.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kz+Hz89yA+A9oD9zEfvonQT4s+M88L6q5qK2Vlp3lgE=;
 b=jPxlW2Gpq61LZNNd9XbbMxTif/2kP/CNqmt+e+8NGztRZwXJTJxhfX69UTbSWAjzjn
 1j3t9YkS5Hjcd7JjuJfXOMTJHZVeEO4ArMzNK9cfdCJBBWREzxSQ+BnDr5+FkJZHQ9/z
 IiOl86coXlXkGaE1WO96tnv90zLSBiTQQtTItJFnfS3keBSvNCJc8BnuL2x1VkvukzWQ
 XSJDvEEushcnWpF3yt9Z+z0kLD+xMXjUOrZfF3gL1XYsbwjx3YBCTv0jxOjaX7y8WWg3
 zYvjaPSGUIQBaBIBANHP/gOCKJAPNooKlzxWCStk1JdWgrJD5SsmT/LDhDpAf2zP0Mm2
 gbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kz+Hz89yA+A9oD9zEfvonQT4s+M88L6q5qK2Vlp3lgE=;
 b=e8oLWWHkoEULSUlRnTvuIEkN/3sVOR9xd7HjDqNKr348kKJr+tc4Xt8fSg2UeagUxJ
 QhnNcMbCbDYsq3tIOR4N64n7DkXnOOlacpX+cdRbDqDBH+iuu1nrkM4POpOJZgGuQpvq
 EfG2bdTYqqOkv0ki9wfOroInSSdfeFUGWh9vjd3CGCtejfGM/dlEiNwCtdLLqq/W/D/K
 zGKiNkUZddpcZKfMXbF8aGfQ2lVjcECrNNWPrRKIZPGw6f+87ReJ2DDk7Zc83s75HH4X
 p6GNxxVMAQHKw3/wkTBKyS+cj+8jUQQM7hlcEb9qUF0bqxHI4766joU3VJZmg76CayWp
 S56Q==
X-Gm-Message-State: ACrzQf2ImMU8NcIiF5Fqeo8hU4SF6P26H/NpP4pQp8gWM4Hap8gtbRdp
 lmMiCeyP3NSzdoVe24TWv2kCyRksHx5mH334mNI=
X-Google-Smtp-Source: AMsMyM7pAOByQ+JlAqWeadB7wDkmtiAkOJq9mbdDha5uTS8eKtGbIIWaoNoqMpecvObUgF7XAi0+59p3qe/tHleL0l4=
X-Received: by 2002:a05:6402:380a:b0:451:ae08:7a6c with SMTP id
 es10-20020a056402380a00b00451ae087a6cmr1714322edb.161.1664434258601; Wed, 28
 Sep 2022 23:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCwf12P6DckVUJL7V_Z7ASj+8A3yyx9eX5MpZPF47Rzg6CjEA@mail.gmail.com>
 <7hh71uixd9.fsf@baylibre.com>
 <CAFCwf12mjshsf+GC-Y9irvPFT=W4Uis10OnZ4PNN1txjXyzLSA@mail.gmail.com>
 <YzFfzWJYsuhpUiPG@infradead.org>
In-Reply-To: <YzFfzWJYsuhpUiPG@infradead.org>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Thu, 29 Sep 2022 09:50:31 +0300
Message-ID: <CAFCwf11L2krr6Tzj6G+NO1Dsfp3drQ-+N4f+7xo6Ez-sVPgg8w@mail.gmail.com>
Subject: Re: New subsystem for acceleration devices
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiho Chu <jiho.chu@samsung.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alexandre Bailon <abailon@baylibre.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 26, 2022 at 11:16 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> Btw, there is another interesting thing around on the block:
>
> NVMe Computational Storage devices.  Don't be fooled by the name, much
> of it is not about neither computation not storage, but it allows to
> use the existing NVMe queuing model model to allow access to arbitrary
> accelerators, including a way to expose access to on-device memory.
>
> The probably most current version is here:
>
> https://www.snia.org/educational-library/nvme-computational-storage-update-standard-2022
Thanks for the link. Indeed, there were some people in the BOF that
mentioned computational storage as something that is relevant.
I'll watch the presentation to understand the direction it is going
and how it maps to what we were planning to do.

>
> The first version will be rather limited and miss some important
> functionality like directly accessing host DRAM or CXL integration,
> but much of that is planned.  The initial version also probably won't
> be able to be supported by Linux at all, but we need to think hard about
> how to support it.
>
> It woud also be really elpful to get more people with accelerator
> experience into the NVMe working group.
I will be happy to help and contribute.

Oded
