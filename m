Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFEC84CCE1
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 15:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7ED10E809;
	Wed,  7 Feb 2024 14:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fxQvsSpG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF60610F336
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707316514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GS8oKSLwKnX/1OmCvP477VoPbNUPt8nzRLpvXwaBKqk=;
 b=fxQvsSpGPjicc4McUOvTraVlNQxZlZBWWf8PQbfLN1oqu0wadrYMrRykLhaLSIrjzM6SHh
 QnPAJvnTNnc3TUnLLIFcwBHW0t5vfxAOqNnpHmt0jootgEni9qI/HTk31/T5iY9FTklwgv
 wrtt0dnopoo77jRlXQ4Gm2uyieMvO1U=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-zBQ6f36xNtWH07lxWnQA2A-1; Wed, 07 Feb 2024 09:35:12 -0500
X-MC-Unique: zBQ6f36xNtWH07lxWnQA2A-1
Received: by mail-yb1-f199.google.com with SMTP id
 3f1490d57ef6-dc6bad01539so907909276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 06:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707316512; x=1707921312;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GS8oKSLwKnX/1OmCvP477VoPbNUPt8nzRLpvXwaBKqk=;
 b=jgR/7mBQOo7fAM7ZeY/yzI946G2mxFoDVyH3OwhyloXYrtHMuwprVddVUODayfGBrF
 +TOX6+JL4oB8HTYG9/lC4GB7tPV7fdKb8QfhfnAAdrPdKryI/AiEUp/PKYqZRnKsrQ+W
 CCyHJ2Be6H9z5ciN84GTABDecU8Jot9yTj1eKDHnmeFE9gisf/rI3AYSxaNSdp/D3vLV
 g3PvyULD/hOYMzShuSFWDiJTNTSBnObIC9EYfAOsz1z1B/ZSkKSCqmu9J8OCYD2XJMWg
 PYBvqGntt89E/3l/tC75rxFmK5hHVzAswdvak8FPOZVBFEgTTvbyWN/L68UBMmH6yvf0
 mkBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpvjGV/uk26Eyv2rRc3mHoADvPk5FJpLkrkm9RMTXfYFW4+klrkknlGdLTWTqpINzJ6+nW97svCzw/2UIyFfFj68COeSIJSfrUhb7PH9QO
X-Gm-Message-State: AOJu0YzFjfvPemOXpBUiFUdZD1FAZbVo4hGFv7MJ0/QhczHI7FAsqnSq
 DGnZpQSun+jqfnivrq94Q7WM/t1RrqzIMxMRvYvBbJj/Vvu0NGmWiaURXhYzVQ//HM1ij6okXym
 4bBEjZ1IKS2Wx2IsQp07faaQWTTwQ41yRbpP0dCbH3s+sLmOn16q2tMlcx/DUJcdrogs22wrwVB
 arugC3B2ctvkHKn+yONjisxmSIQ6Yfn4pF15TvNpLm
X-Received: by 2002:a25:ac4a:0:b0:dc2:6698:2c7f with SMTP id
 r10-20020a25ac4a000000b00dc266982c7fmr4891958ybd.33.1707316512043; 
 Wed, 07 Feb 2024 06:35:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE++5w1moQLuHaAqcodu9tX5wQSeMmoBwfQu91lEa9262GLOPvEjAZwMad0/0OUSEvws/4fl6Yzjr0KEw6orY=
X-Received: by 2002:a25:ac4a:0:b0:dc2:6698:2c7f with SMTP id
 r10-20020a25ac4a000000b00dc266982c7fmr4891893ybd.33.1707316511720; Wed, 07
 Feb 2024 06:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20231122-vfs-eventfd-signal-v2-0-bd549b14ce0c@kernel.org>
 <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
In-Reply-To: <20231122-vfs-eventfd-signal-v2-2-bd549b14ce0c@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 7 Feb 2024 15:34:59 +0100
Message-ID: <CABgObfaSVv=TFmwh+bxjaw3fpWAnemnf1Z5Us5kJtNN=oeGrag@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] eventfd: simplify eventfd_signal()
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Jan Kara <jack@suse.cz>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, 
 Xu Yilun <yilun.xu@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Leon Romanovsky <leon@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Frederic Barrat <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, 
 Fei Li <fei1.li@intel.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Johannes Weiner <hannes@cmpxchg.org>, 
 Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeelb@google.com>, Muchun Song <muchun.song@linux.dev>, 
 Kirti Wankhede <kwankhede@nvidia.com>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fpga@vger.kernel.org, 
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-usb@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, 
 linux-aio@kvack.org, cgroups@vger.kernel.org, linux-mm@kvack.org, 
 Jens Axboe <axboe@kernel.dk>, Pavel Begunkov <asml.silence@gmail.com>,
 io-uring@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Nov 22, 2023 at 1:49=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> Ever since the evenfd type was introduced back in 2007 in commit
> e1ad7468c77d ("signal/timer/event: eventfd core") the eventfd_signal()
> function only ever passed 1 as a value for @n. There's no point in
> keeping that additional argument.
>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---
>  arch/x86/kvm/hyperv.c                     |  2 +-
>  arch/x86/kvm/xen.c                        |  2 +-
>  virt/kvm/eventfd.c                        |  4 ++--
>  30 files changed, 60 insertions(+), 63 deletions(-)

For KVM:

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

