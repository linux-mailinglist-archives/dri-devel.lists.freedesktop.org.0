Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4A620888
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 05:54:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 094FB10E39C;
	Tue,  8 Nov 2022 04:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD69D10E39C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 04:53:50 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id kt23so35525543ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 20:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fra4yIWv6TZGqY5e50Ht4t7fKg9qXIteCxj5r9JD6vc=;
 b=k5nrvygDjfG84Jq8usw3TAeubZw8DjisC8BDW/Nl99poBxOVm3b4Emj6HmmfjmpRDg
 6UqJx+Zje8uwbw0492FSt+SP9nPZpSClhlI2a7jkV8gf4dZ+NQhHw/+vcVeKfiMshCy8
 l5vHZxgwLrsSFmUFQ9k9AqBdcglrJDMAIuZNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fra4yIWv6TZGqY5e50Ht4t7fKg9qXIteCxj5r9JD6vc=;
 b=aehryj0loulG9uzxCKhvhuoG8cwjS+as+0/Bms6HFyMYgjZNheX4OvhS1eQBpHhv8g
 c9KipP/oVQGcp29DFSC3gEWWo15GsaTKgKW0z1WXbouuitAaCu0m3fIZYP4XUjfPpqV1
 b1uw5ZJpMZ0lGT9GT4WWJo6zOzHhw0UQhg5ns4PmZHDXrfKqojM3M1lh5sEeuBYzY1X+
 IHgOLFZJIQ3b5fohb6BbotBR8uDEUMxJiimk8qLiwCW98+Y/mWSRc5UUgd5ueLhCUais
 XHB0i+f+tRBndbzbWXoGislgcZpmw7ZWDxXUp9BTlYoCVzjMPESt/3GZ0u5uezgBXJXd
 6dWQ==
X-Gm-Message-State: ACrzQf0FvApDsTop8B/TZHQ4OUmaCe5E+ogZtUQebAhHPMQoJdiAAalp
 T7Vxh4+gPynMrSysXunTVeKBLuFQJtCLxP5vtjQ=
X-Google-Smtp-Source: AMsMyM59NVtb4ugtyYgZzBDmr7mudWDcLH3HUzcFiJnD9NnDSVb6Tg0grE3rUpNWXNUeaTLoVRZBbw==
X-Received: by 2002:a17:906:8a57:b0:7ad:69fb:3a with SMTP id
 gx23-20020a1709068a5700b007ad69fb003amr49863116ejc.179.1667883229132; 
 Mon, 07 Nov 2022 20:53:49 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com.
 [209.85.208.49]) by smtp.gmail.com with ESMTPSA id
 ca21-20020aa7cd75000000b004580862ffdbsm5066397edb.59.2022.11.07.20.53.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 20:53:48 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id a5so20698371edb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Nov 2022 20:53:48 -0800 (PST)
X-Received: by 2002:a17:906:ee8e:b0:730:3646:d178 with SMTP id
 wt14-20020a170906ee8e00b007303646d178mr51989213ejb.426.1667882769115; Mon, 07
 Nov 2022 20:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20221107161740.144456-1-david@redhat.com>
 <20221107161740.144456-17-david@redhat.com>
In-Reply-To: <20221107161740.144456-17-david@redhat.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 8 Nov 2022 13:45:57 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Message-ID: <CAAFQd5C3Ba1WhjYJF_7tW06mgvzoz9KTakNo+Tz8h_f6dGKzHQ@mail.gmail.com>
Subject: Re: [PATCH RFC 16/19] mm/frame-vector: remove FOLL_FORCE usage
To: David Hildenbrand <david@redhat.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Nadav Amit <namit@vmware.com>, linux-kselftest@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, linux-samsung-soc@vger.kernel.org,
 linux-rdma@vger.kernel.org, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, John Hubbard <jhubbard@nvidia.com>,
 etnaviv@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 Muchun Song <songmuchun@bytedance.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oded Gabbay <ogabbay@kernel.org>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

On Tue, Nov 8, 2022 at 1:19 AM David Hildenbrand <david@redhat.com> wrote:
>
> FOLL_FORCE is really only for debugger access. According to commit
> 707947247e95 ("media: videobuf2-vmalloc: get_userptr: buffers are always
> writable"), the pinned pages are always writable.

Actually that patch is only a workaround to temporarily disable
support for read-only pages as they seemed to suffer from some
corruption issues in the retrieved user pages. We expect to support
read-only pages as hardware input after. That said, FOLL_FORCE doesn't
sound like the right thing even in that case, but I don't know the
background behind it being added here in the first place. +Hans
Verkuil +Marek Szyprowski do you happen to remember anything about it?

Best regards,
Tomasz

>
> FOLL_FORCE in this case seems to be a legacy leftover. Let's just remove
> it.
>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/media/common/videobuf2/frame_vector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/common/videobuf2/frame_vector.c b/drivers/media/common/videobuf2/frame_vector.c
> index 542dde9d2609..062e98148c53 100644
> --- a/drivers/media/common/videobuf2/frame_vector.c
> +++ b/drivers/media/common/videobuf2/frame_vector.c
> @@ -50,7 +50,7 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
>         start = untagged_addr(start);
>
>         ret = pin_user_pages_fast(start, nr_frames,
> -                                 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
> +                                 FOLL_WRITE | FOLL_LONGTERM,
>                                   (struct page **)(vec->ptrs));
>         if (ret > 0) {
>                 vec->got_ref = true;
> --
> 2.38.1
>
