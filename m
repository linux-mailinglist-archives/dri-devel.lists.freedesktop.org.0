Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E41B7703D52
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 21:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4187C10E255;
	Mon, 15 May 2023 19:07:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69F10E255
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 19:07:35 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-528cb2ec137so6694249a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 12:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684177654; x=1686769654;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=xFQ6BaKkjgdTBjpn34wxJVuNtEcQXtwUwEd7418PjqE=;
 b=JuYLR5X0h/SijvimdD4P6z8hE52bUlPctx7U3AXULuAYdPapAYdXj4OHLU+jesv1e9
 MHD8Lj1brV1Npy46pM9iEXGc7wGUTxWx5S45qz+oF49+y23jmGnaSXuWfuvxKy9KlI32
 Hj3tzhYZW0L7IEI7hrXAP0QK8j1h/iBkzVacQ4G+iCXVlem0u2jrysU5Jy1+pmmQkIiS
 37u1TKNLXuqkmFNxlKyPYyrXLxlhP+oe0s01snkpX8vow2muHJ/gJ/9E3/Z8g6E6znWq
 LjYx6A8GjdqjoJArA5vnUgfV49yAKbwmFV4Q/QmYgCdQHL8+QmSU6eGY5cEBbL26CcKy
 ee8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684177654; x=1686769654;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xFQ6BaKkjgdTBjpn34wxJVuNtEcQXtwUwEd7418PjqE=;
 b=R7aIXSnya0KLB+oVL8jBh9zS6FoAy3YbG+3LjOGbYhFCa4D56VoXlGAfjH/4kOoXPH
 sHPa9yruB3KtnKJ7Jp+Kivp9NXUNlIshe37ium/p/341cQDzJH5JbK+owxT9wOjXv40I
 ZP/55VHKC4kSKCx8H6m6dV9ccWTLlCVlC7I04PAaPdXziK8fpM2fG8604vL9614xCe/x
 qvxty2kbtOwfadpTWRr+FBH60ODzta3KRa+eh7j46qU8MALJV9oHOPKvcfUJmGEhjNdj
 NowgPoEi+gDFZr7DLYfI5vn25T8FMB/WxAAR40nX4bkXrSd4dQDgab6yDFfvgBTJC8hu
 KJrg==
X-Gm-Message-State: AC+VfDzqQBfr8mO/HOgpc+Khtd5z7GDnHbPrq59EIZSiXop5fxxwWRFy
 2dmES2BIloAyYDxW/Pc42AmDUIFvUSY=
X-Google-Smtp-Source: ACHHUZ4P6L9nc0hf9pk7PqVX9406UpgOTZdsuzGyBat9IwfSmmaZ8nUqj18ulapGHZTegPpSzUo6g677OqY=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:6b4a:0:b0:4fc:2058:fa29 with SMTP id
 g71-20020a636b4a000000b004fc2058fa29mr9542105pgc.1.1684177654484; Mon, 15 May
 2023 12:07:34 -0700 (PDT)
Date: Mon, 15 May 2023 12:07:33 -0700
In-Reply-To: <b61d5999a4fc6d50b7e073cc3c3efa8fe79bbd94.1684097002.git.lstoakes@gmail.com>
Mime-Version: 1.0
References: <cover.1684097001.git.lstoakes@gmail.com>
 <b61d5999a4fc6d50b7e073cc3c3efa8fe79bbd94.1684097002.git.lstoakes@gmail.com>
Message-ID: <ZGKC9fHoE+kDs0ar@google.com>
Subject: Re: [PATCH v5 1/6] mm/gup: remove unused vmas parameter from
 get_user_pages()
From: Sean Christopherson <seanjc@google.com>
To: Lorenzo Stoakes <lstoakes@gmail.com>
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 amd-gfx@lists.freedesktop.org, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-sgx@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Dimitri Sivanich <dimitri.sivanich@hpe.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Xinhui Pan <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Christian Konig <christian.koenig@amd.com>,
 Jarkko Sakkinen <jarkko@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 14, 2023, Lorenzo Stoakes wrote:
> No invocation of get_user_pages() use the vmas parameter, so remove it.
>=20
> The GUP API is confusing and caveated. Recent changes have done much to
> improve that, however there is more we can do. Exporting vmas is a prime
> target as the caller has to be extremely careful to preclude their use
> after the mmap_lock has expired or otherwise be left with dangling
> pointers.
>=20
> Removing the vmas parameter focuses the GUP functions upon their primary
> purpose - pinning (and outputting) pages as well as performing the action=
s
> implied by the input flags.
>=20
> This is part of a patch series aiming to remove the vmas parameter
> altogether.
>=20
> Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Christian K=EF=BF=BDnig <christian.koenig@amd.com> (for radeon =
parts)
> Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
> Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> ---
>  arch/x86/kernel/cpu/sgx/ioctl.c     | 2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c | 2 +-
>  drivers/misc/sgi-gru/grufault.c     | 2 +-
>  include/linux/mm.h                  | 3 +--
>  mm/gup.c                            | 9 +++------
>  mm/gup_test.c                       | 5 ++---
>  virt/kvm/kvm_main.c                 | 2 +-
>  7 files changed, 10 insertions(+), 15 deletions(-)

Acked-by: Sean Christopherson <seanjc@google.com> (KVM)

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index cb5c13eee193..eaa5bb8dbadc 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2477,7 +2477,7 @@ static inline int check_user_page_hwpoison(unsigned=
 long addr)
>  {
>  	int rc, flags =3D FOLL_HWPOISON | FOLL_WRITE;
> =20
> -	rc =3D get_user_pages(addr, 1, flags, NULL, NULL);
> +	rc =3D get_user_pages(addr, 1, flags, NULL);
>  	return rc =3D=3D -EHWPOISON;

Unrelated to this patch, I think there's a pre-existing bug here.  If gup()=
 returns
a valid page, KVM will leak the refcount and unintentionally pin the page. =
 That's
highly unlikely as check_user_page_hwpoison() is called iff get_user_pages_=
unlocked()
fails (called by hva_to_pfn_slow()), but it's theoretically possible that u=
serspace
could change the VMAs between hva_to_pfn_slow() and check_user_page_hwpoiso=
n() since
KVM doesn't hold any relevant locks at this point.

E.g. if there's no VMA during hva_to_pfn_{fast,slow}(), npages=3D=3D-EFAULT=
 and KVM
will invoke check_user_page_hwpoison().  If userspace installs a valid mapp=
ing
after hva_to_pfn_slow() but before KVM acquires mmap_lock, then gup() will =
find
a valid page.

I _think_ the fix is to simply delete this code. The bug was introduced by =
commit
fafc3dbaac64 ("KVM: Replace is_hwpoison_address with __get_user_pages").  A=
t that
time, KVM didn't check for "npages =3D=3D -EHWPOISON" from the first call t=
o
get_user_pages_unlocked().  Later on, commit 0857b9e95c1a ("KVM: Enable asy=
nc page
fault processing") reworked the caller to be:

	mmap_read_lock(current->mm);
	if (npages =3D=3D -EHWPOISON ||
	      (!async && check_user_page_hwpoison(addr))) {
		pfn =3D KVM_PFN_ERR_HWPOISON;
		goto exit;
	}

where async really means NOWAIT, so that the hwpoison use of gup() didn't s=
leep.

    KVM: Enable async page fault processing
   =20
    If asynchronous hva_to_pfn() is requested call GUP with FOLL_NOWAIT to
    avoid sleeping on IO. Check for hwpoison is done at the same time,
    otherwise check_user_page_hwpoison() will call GUP again and will put
    vcpu to sleep.

There are other potential problems too, e.g. the hwpoison call doesn't hono=
r
the recently introduced @interruptible flag.

I don't see any reason to keep check_user_page_hwpoison(), KVM can simply r=
ely on
the "npages =3D=3D -EHWPOISON" check.   get_user_pages_unlocked() is guaran=
teed to be
called with roughly equivalent flags, and the flags that aren't equivalent =
are
arguably bugs in check_user_page_hwpoison(), e.g. assuming FOLL_WRITE is wr=
ong.

TL;DR: Go ahead with this change, I'll submit a separate patch to delete th=
e
buggy KVM code.
