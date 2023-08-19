Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D26781C7C
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 07:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA25710E0FE;
	Sun, 20 Aug 2023 05:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1C710E0B4
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 16:12:18 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id
 a1e0cc1a2514c-79414715edeso382885241.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692461537; x=1693066337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B0DClhRtATWEjW5SsuPs3moh95yotSUJv5ef14wvRow=;
 b=Dy7/yh009XnqKLPfY7ID0NFuShQEayhHBRARlc7Qhd+EFGAbpNUBcDpLSRI4As0Dm8
 RT/k3F+Ae6/FY0Hvkwo0CW+GkgXyGwG0XScb7cwcKAFeTnYqW8hnj+jqSkYsF/1DSXdi
 B1QxpM3TvKspZZ5Jyy829ds72MeWTFHKyVeqH+ZuhbSgat2s/DfAxqc9Y7jeRKh5xwxv
 fIDWTh8AyNs3TU5UG/tAKMc4NKr322ktQ6CD8ObC55za7tqWADHrkmvboi5+ABVaPch3
 a6juojGO+W7F9W1OLpJfSaYBjQMjxerhTFXrnSEHXbqW/ewDA0b4WKu3IsKD70iJqBea
 Y28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692461537; x=1693066337;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B0DClhRtATWEjW5SsuPs3moh95yotSUJv5ef14wvRow=;
 b=UMoNB+ldX4HJpQY9rkbqJjDFyG6vkCM/fF/pgT8uTPJRRYMAwaPon/2n/vTs0A8lKU
 zvLiau/WYgeQmwXw+v3prhuubWUdF1RyGST4jA5ot9sx/DGnzgzGyq8GrqhdVCjyculT
 i+MndD4ERlnW+KiWQELkTFxlANrBeRqCAvugH2MKanDzg9hJGnlFCiOjrLjr8J/qA0MC
 MSFXtdLqxzR90MJu7e9xsdkUMyNF7+p0wG5rgM34ioZjmxiHDKGtgK2H29AOjpcArMdo
 ntPY5jfefYEotPB43TjrsorCkcygYbh2mz3Qyr3KxD7XR0+5rGGHR4iVyemsbAWEtnWx
 DUzg==
X-Gm-Message-State: AOJu0Yxvp4gOPlb6ITVJaocaccWJosDOlH8BKhn2kZQXt/o1Gz5ShxK1
 5cNVA24SXxxYD3gh0pKrzCAefe1ZJwm6vywvJ1I=
X-Google-Smtp-Source: AGHT+IFh0m4BQXMRNTaUxW3V40OrJMwg6EKPDFDV3ZolowmJV63SBq1rU/HbuSjB7lD1RB2tr30yAKIM++bjPAynnfU=
X-Received: by 2002:a05:6102:3a6a:b0:449:6e2c:56f9 with SMTP id
 bf10-20020a0561023a6a00b004496e2c56f9mr1245257vsb.2.1692461537221; Sat, 19
 Aug 2023 09:12:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230810015751.3297321-1-almasrymina@google.com>
 <20230810015751.3297321-7-almasrymina@google.com>
 <6adafb5d-0bc5-cb9a-5232-6836ab7e77e6@redhat.com>
 <CAF=yD-L0ajGVrexnOVvvhC-A7vw6XP9tq5T3HCDTjQMS0mXdTQ@mail.gmail.com>
 <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
In-Reply-To: <8f4d276e-470d-6ce8-85d5-a6c08fa22147@redhat.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Sat, 19 Aug 2023 12:11:40 -0400
Message-ID: <CAF=yD-LiR1J7iaGCfc+YKNB7W7QO3XvZGfgOSKjpGur_JZFsGQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 06/11] page-pool: add device memory support
To: Jesper Dangaard Brouer <jbrouer@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 20 Aug 2023 05:17:20 +0000
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
Cc: Mina Almasry <almasrymina@google.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 dri-devel@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 stephen@networkplumber.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Eric Dumazet <edumazet@google.com>, Hari Ramakrishnan <rharix@google.com>,
 sdf@google.com, Andy Lutomirski <luto@kernel.org>, brouer@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > Any regression in page pool can be avoided in the common case that
> > does not use device mem by placing that behind a static_branch. Would
> > that address your performance concerns?
> >
>
> No. This will not help.
>
> The problem is that every where in the page_pool code it is getting
> polluted with:
>
>    if (page_is_page_pool_iov(page))
>      call-some-iov-func-instead()
>
> Like: the very central piece of getting the refcnt:
>
> +static inline int page_pool_page_ref_count(struct page *page)
> +{
> +       if (page_is_page_pool_iov(page))
> +               return page_pool_iov_refcount(page_to_page_pool_iov(page));
> +
> +       return page_ref_count(page);
> +}
>
>
> The fast-path of the PP is used for XDP_DROP scenarios, and is currently
> around 14 cycles (tsc). Thus, any extra code in this code patch will
> change the fast-path.

With static_branch disabled, it would only insert a NOP?
