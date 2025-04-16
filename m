Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE454A8B678
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 12:11:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F71C10E8C0;
	Wed, 16 Apr 2025 10:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="I5PRx6nJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 666C810E8C0;
 Wed, 16 Apr 2025 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1744798273;
 bh=K5EIWptPNf+bD6TCzDb13Bmy9OoJJigove2+9RXxBVM=;
 h=MIME-Version:From:Date:Message-ID:Subject:To;
 b=I5PRx6nJoic27KYtAOcNbeMau9M/QTdcBt7xmfH5ako/cgUC2H3IsFU2sj4nP3+5X
 pI85FHYuDR854/7UC5qs4ejtGX6JNoR6NjFzwMNkGC6+kmR7Cpz+zqCmwymnNt+nOX
 bO72Wn9uf8zCXzP05N/FDfDcDUJp3oH8rxfMBdmM=
X-QQ-mid: izesmtp27t1744798177t37bdd6e0
X-QQ-Originating-IP: c6bMcLBaknpeJudSLgcfGNCr5kNfv09wQR1rbeFJkZ8=
Received: from mail-yb1-f175.google.com ( [209.85.219.175])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 16 Apr 2025 18:09:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4125910165612876229
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e573136107bso5785999276.3; 
 Wed, 16 Apr 2025 03:09:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX/LM/DkVFTE3MbvWNKRov/o/+v+DtY75SJxbPhBkWXzghOqrm/Lo3Sv1bHP6DXrGd5aW5GlNa6xcbJ@lists.freedesktop.org,
 AJvYcCX8rJ6i9kBAf+RuQ6L+hjZ9OvSX4AxNJo0M+xtCzPPUJ0B9tEQFbvqO/1Rj/NpFABpnRm5hwxJ/DSU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YznJ7XZb2bakRe25csQs3tajm7rNNTBGFRCfCXVLxFX6dOxNDjf
 Pr1orojJjv+iWku27QriXJhMvgVspYJZ4dcLoqz3t9/vJ92MW6ChdU4B+ntRSZrrYfYFbu/R+ME
 dbTpAwa72R5NomsXGctIRbfrjn3o=
X-Google-Smtp-Source: AGHT+IFxOQerwyXR4s01cKj1FQCmW5mZBGS8EUkxg2eBy2yn8PQm4fMpJOhxMxu+WrXOTx3w5ulHOeUcX04b8xnFFTA=
X-Received: by 2002:a05:6902:2b8a:b0:e6d:eb74:272 with SMTP id
 3f1490d57ef6-e7275967af8mr1257382276.22.1744798174393; Wed, 16 Apr 2025
 03:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <E9B8B40E39453E89+20250411105306.89756-1-chenlinxuan@uniontech.com>
 <20250416044827.GA24153@lst.de>
In-Reply-To: <20250416044827.GA24153@lst.de>
From: Chen Linxuan <chenlinxuan@uniontech.com>
Date: Wed, 16 Apr 2025 18:09:22 +0800
X-Gmail-Original-Message-ID: <45D187D71349584D+CAC1kPDPYiUKqRmqW=hzOyGudvUXcwxo0kgDU_j40+t7rYHsU-g@mail.gmail.com>
X-Gm-Features: ATxdqUHphIIrq227AoMvNzUOdxFn7upg3kfvytoiynDmEPipLLJsDaFiQeVe_To
Message-ID: <CAC1kPDPYiUKqRmqW=hzOyGudvUXcwxo0kgDU_j40+t7rYHsU-g@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] kernel-hacking: introduce CONFIG_NO_AUTO_INLINE
To: Christoph Hellwig <hch@lst.de>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>,
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chengchang Tang <tangchengchang@huawei.com>, 
 Junxian Huang <huangjunxian6@hisilicon.com>, Leon Romanovsky <leon@kernel.org>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Sagi Grimberg <sagi@grimberg.me>, Yishai Hadas <yishaih@nvidia.com>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Kevin Tian <kevin.tian@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, 
 Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-rdma@vger.kernel.org, linux-nvme@lists.infradead.org, 
 kvm@vger.kernel.org, virtualization@lists.linux.dev, linux-mm@kvack.org, 
 llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: izesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: M94I2jolx1v3dFgSFVksbdON838YK1CwXxyiTMLXiOOQ3BG+Ld0EgNkS
 v4Ibj5OkTyj27cxOrUChG4T3BlKWSdHzGEqApIHb64x73AEFZrT0aZReJAxgLOLZN/X6rQx
 ce1HnL9H9ZhG3US3Cr0tw8FntQwW6TNAOFzU5ly6x7BDS83ZWbn3XQ5934KUT9jLTn7n7SD
 zIHdmLe8UF8cxWVMgKxIRH13oo5DGNgAwT+9Bn/i4OX3b2yj6YcBI/2yimv4vr6r1mGYD5E
 PiyZTRpJe7HKfCENdxOQ5PQIa51mrjEf8PzvsPRhSlWhOutFc1yODn8rC24I5Ge1jhwW4Cn
 iHGZobUi9IwrfDj+adzYxwr7UgwTJO+vF4xEbX9ItMiU5+HExmSms6GShhKq95p12dfxP0y
 tsTa+3uKeLgdxiZ76VjwM7jfH5DkhiHgmIDC7L7mDGTaFdvL/rgUIV1FR5VT1uPr7YWFfcg
 GdqWah5YMmjkBvVovv74HDcrttOXypD+bmYP2OyYJzCJkPV6+fKb1HRcENaNQO10JoereAN
 6l7ObMHsXB/YVCQmmHHNhTsxJjmNS8qkfFgnCLgB69KnEUJJ2oan44IbnkqNR+5U8kREqqh
 aF3+voGybKKYIzidF6QH3D/rfh7yBiFvZgN/AbURHGWVKtcED4SZn/3AzEJzLCYjcYaxVNB
 0umc/ki2TAeCVJ8nJQQVaCbsVKHvJugNit9wn26UVTegBS9dMxrZ9kaTtl7i1JTHx1PMPG+
 5DW1qvcyAJkrAjPItesKj7ZGVHpUJZn1B8+xlDOugYueikVRwkOd7YQ8qtWYXpcM9VGsbM1
 ea8MFiRCR7yZ7w23d8y650zv4wPeIoIvOLuQ8AAWUcAk0viZfSG+O9jL+83nyCuJALd6a5l
 DQmsVMT3u2EJ/+XXgEPYVUuVdyzC6jDkZDflVIqBT+eGZnFMCS7ZKiYxVouIV7raB/fs/Ms
 iFkDGfYvyaoX557uOLhaiYDE0Z2bDOgtR4BCrm81KdnkMYjDoxl4Z+0KMEKRbwbfn4OT+PS
 0QyzLw5x47hCZhA4pbOULDZwQC5+XOSI9Hy77ag0zoJWJ/Hrc47twcHTzBTOkabmbP+rkjX
 kNshwjJEfB1
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
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

Sorry for the mistake, v2 has been send:

https://lore.kernel.org/all/20250416-noautoinline-v2-0-e69a2717530f@uniontech.com/
