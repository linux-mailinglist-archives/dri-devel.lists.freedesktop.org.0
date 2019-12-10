Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4715A1188D0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 13:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E5889932;
	Tue, 10 Dec 2019 12:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E394689932
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 12:50:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E26C9AF76;
 Tue, 10 Dec 2019 12:49:59 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 84F101E0B23; Tue, 10 Dec 2019 13:49:57 +0100 (CET)
Date: Tue, 10 Dec 2019 13:49:57 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v8 23/26] mm/gup: pass flags arg to __gup_device_*
 functions
Message-ID: <20191210124957.GG1551@quack2.suse.cz>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
 <20191209225344.99740-24-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209225344.99740-24-jhubbard@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 09-12-19 14:53:41, John Hubbard wrote:
> A subsequent patch requires access to gup flags, so pass the flags
> argument through to the __gup_device_* functions.
> =

> Also placate checkpatch.pl by shortening a nearby line.
> =

> TODO: Christoph Hellwig requested folding this into the patch the uses
> the gup flags arguments.

You should probably implement this TODO? :)

								Honza

> =

> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: J=E9r=F4me Glisse <jglisse@redhat.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  mm/gup.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> =

> diff --git a/mm/gup.c b/mm/gup.c
> index 73aedcefa4bd..687d48506f04 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1957,7 +1957,8 @@ static int gup_pte_range(pmd_t pmd, unsigned long a=
ddr, unsigned long end,
>  =

>  #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HU=
GEPAGE)
>  static int __gup_device_huge(unsigned long pfn, unsigned long addr,
> -		unsigned long end, struct page **pages, int *nr)
> +			     unsigned long end, unsigned int flags,
> +			     struct page **pages, int *nr)
>  {
>  	int nr_start =3D *nr;
>  	struct dev_pagemap *pgmap =3D NULL;
> @@ -1983,13 +1984,14 @@ static int __gup_device_huge(unsigned long pfn, u=
nsigned long addr,
>  }
>  =

>  static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long =
addr,
> -		unsigned long end, struct page **pages, int *nr)
> +				 unsigned long end, unsigned int flags,
> +				 struct page **pages, int *nr)
>  {
>  	unsigned long fault_pfn;
>  	int nr_start =3D *nr;
>  =

>  	fault_pfn =3D pmd_pfn(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> -	if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
> +	if (!__gup_device_huge(fault_pfn, addr, end, flags, pages, nr))
>  		return 0;
>  =

>  	if (unlikely(pmd_val(orig) !=3D pmd_val(*pmdp))) {
> @@ -2000,13 +2002,14 @@ static int __gup_device_huge_pmd(pmd_t orig, pmd_=
t *pmdp, unsigned long addr,
>  }
>  =

>  static int __gup_device_huge_pud(pud_t orig, pud_t *pudp, unsigned long =
addr,
> -		unsigned long end, struct page **pages, int *nr)
> +				 unsigned long end, unsigned int flags,
> +				 struct page **pages, int *nr)
>  {
>  	unsigned long fault_pfn;
>  	int nr_start =3D *nr;
>  =

>  	fault_pfn =3D pud_pfn(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> -	if (!__gup_device_huge(fault_pfn, addr, end, pages, nr))
> +	if (!__gup_device_huge(fault_pfn, addr, end, flags, pages, nr))
>  		return 0;
>  =

>  	if (unlikely(pud_val(orig) !=3D pud_val(*pudp))) {
> @@ -2017,14 +2020,16 @@ static int __gup_device_huge_pud(pud_t orig, pud_=
t *pudp, unsigned long addr,
>  }
>  #else
>  static int __gup_device_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long =
addr,
> -		unsigned long end, struct page **pages, int *nr)
> +				 unsigned long end, unsigned int flags,
> +				 struct page **pages, int *nr)
>  {
>  	BUILD_BUG();
>  	return 0;
>  }
>  =

>  static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long a=
ddr,
> -		unsigned long end, struct page **pages, int *nr)
> +				 unsigned long end, unsigned int flags,
> +				 struct page **pages, int *nr)
>  {
>  	BUILD_BUG();
>  	return 0;
> @@ -2136,7 +2141,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
>  	if (pmd_devmap(orig)) {
>  		if (unlikely(flags & FOLL_LONGTERM))
>  			return 0;
> -		return __gup_device_huge_pmd(orig, pmdp, addr, end, pages, nr);
> +		return __gup_device_huge_pmd(orig, pmdp, addr, end, flags,
> +					     pages, nr);
>  	}
>  =

>  	page =3D pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
> @@ -2157,7 +2163,8 @@ static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, un=
signed long addr,
>  }
>  =

>  static int gup_huge_pud(pud_t orig, pud_t *pudp, unsigned long addr,
> -		unsigned long end, unsigned int flags, struct page **pages, int *nr)
> +			unsigned long end, unsigned int flags,
> +			struct page **pages, int *nr)
>  {
>  	struct page *head, *page;
>  	int refs;
> @@ -2168,7 +2175,8 @@ static int gup_huge_pud(pud_t orig, pud_t *pudp, un=
signed long addr,
>  	if (pud_devmap(orig)) {
>  		if (unlikely(flags & FOLL_LONGTERM))
>  			return 0;
> -		return __gup_device_huge_pud(orig, pudp, addr, end, pages, nr);
> +		return __gup_device_huge_pud(orig, pudp, addr, end, flags,
> +					     pages, nr);
>  	}
>  =

>  	page =3D pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
> -- =

> 2.24.0
> =

-- =

Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
