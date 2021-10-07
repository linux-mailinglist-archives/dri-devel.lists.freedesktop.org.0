Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85795425191
	for <lists+dri-devel@lfdr.de>; Thu,  7 Oct 2021 12:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF876E83B;
	Thu,  7 Oct 2021 10:56:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B69016E83B;
 Thu,  7 Oct 2021 10:56:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8609E61215;
 Thu,  7 Oct 2021 10:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633604180;
 bh=ThIL5wTqkNiACMqeeSl39LO0ke5MAX68IFzHv68/mWI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YT2alqyBuji3GiowZLfZazBMG94K/C66fT1m30UGQAAj5PU+N440j1v/iR9khsZju
 5kViA2pY8LK6nXYdHpH46ejmMmzXbkLR5hYwao699vyKZ9ZAVV1Dr4tNjiFkn14n6F
 a6RPw/nc0+PvQtSGCg9rQGTg6uO6WZ0/sL2XKS6jCrDo1Dg71yjiCZgf0w15UMHENl
 xpWPlL5i2LpzXvyp5ZGOIG3W0aqahYSm6XdRg3VxVMIke7KgSdVnEaYC7kYptdjcR5
 Xpqkn2akCzaUcoN5I+WZ7BqwixRJc4b7CxKnnIkE/KiL0n7u/CEDyP7PumLO3KyK1X
 YlE7a6r6zfzxA==
Received: by mail-yb1-f169.google.com with SMTP id s64so12377651yba.11;
 Thu, 07 Oct 2021 03:56:20 -0700 (PDT)
X-Gm-Message-State: AOAM532sYQ/EWE6LPquBuERjbR59CUuwU6+89ZaR8wJZCjSSb0H+LvkK
 be5VlbwgfRxYFVjCqtc5X44lms7B6W35iQq2Tr0=
X-Google-Smtp-Source: ABdhPJzwxU3qp/2r+9YudGCUJue9BH8SS1W+JH6xZ5rfm/idWD4VsigFIU10SCXzX+AOt3Hbjgk+16k+dUIMb6/O+CE=
X-Received: by 2002:a25:9007:: with SMTP id s7mr3881247ybl.142.1633604179700; 
 Thu, 07 Oct 2021 03:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211003090756.117809-1-ogabbay@kernel.org>
In-Reply-To: <20211003090756.117809-1-ogabbay@kernel.org>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 7 Oct 2021 13:55:52 +0300
X-Gmail-Original-Message-ID: <CAFCwf13nkoyk9QmtsyAno6QZCgmh1EdhN=diKvUpKxwTXYQMvw@mail.gmail.com>
Message-ID: <CAFCwf13nkoyk9QmtsyAno6QZCgmh1EdhN=diKvUpKxwTXYQMvw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add p2p via dmabuf to habanalabs
To: "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@gmail.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Gal Pressman <galpress@amazon.com>, 
 Yossi Leybovich <sleybo@amazon.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-rdma <linux-rdma@vger.kernel.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Doug Ledford <dledford@redhat.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Leon Romanovsky <leonro@nvidia.com>, 
 Christoph Hellwig <hch@lst.de>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 3, 2021 at 12:08 PM Oded Gabbay <ogabbay@kernel.org> wrote:
>
> Hi,
> I'm sending v7 after the latest review from Jason.
> All the changes are detailed in the commit messages.
>
> Dave, I'll appreciate if you can also a-b this patchset.
>
> Thanks,
> Oded

Hi,
I would like to send a pull request with these patches next week, so
if you have any more comments, please let me know.
Oded
