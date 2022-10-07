Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D85F80F9
	for <lists+dri-devel@lfdr.de>; Sat,  8 Oct 2022 00:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78C610E0D9;
	Fri,  7 Oct 2022 22:47:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978C410E092
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 22:47:46 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id q9so5820121pgq.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Oct 2022 15:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yZqaicka3IU4vV1MYdOWb5w3mOcfwDVNwAUulPcr27Y=;
 b=iXQ9UvdzaG3zByw2GBNLz3/YVU1qnMbHWTkFhauTR657sXRQGAG+NlE+Q9rJd5luVx
 INuHridXF4858oAPsKtGfjtbkx2VdjBSQCDETBbwUrSMqp7tkUzuQxOHz4Iev7dLesfK
 vpnuiiKohn9Hx+Mnal9EiATSUtY0yZ8+mCOj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yZqaicka3IU4vV1MYdOWb5w3mOcfwDVNwAUulPcr27Y=;
 b=x7VUncYMdBs0zLmHWZADzVk7dml9y3omO/sButhF8yikw+W2O7rtkrOWBwrKS7qVVe
 TRRbz6zAzH6RAXr25nNaF1QDZcBD6AcrnnVBCW1TEowiCl2msi3lUVdml9IGib0kKpqj
 kFpyz4Mu7DZfV4Q75bLwizBaG9lvRgkAdcoP68BDg7MAvJ82HzM7FVNB24GFiG/QnAZ+
 IYSz+YbB2ygGAYkc6xOxMGxpNvZuy8uEs2q+gXB97CqlYl2Pr0K+3WZAq1wsBY9bvJM4
 Jspdv4+WUGPHXxIIpI2O//ofrdmWBBQAc8YB8SxeA2IA6MVkNqZBvZXXuYCygFWx+kdI
 RBXw==
X-Gm-Message-State: ACrzQf3PHKGoM1u3Oq65yojf567M2uPuRA9MthUhHHtKRqBrPAHyPm5x
 JawkB/xzRwDAzh/9FQKN7jmxtg==
X-Google-Smtp-Source: AMsMyM6iCBWc/uxIx6z9Rtqnu5DJFDtYNmNoozJCUMl1bWP400YM3aAZ5nfN+Rih1bQNvESsCMLxdQ==
X-Received: by 2002:a63:5a61:0:b0:41b:b021:f916 with SMTP id
 k33-20020a635a61000000b0041bb021f916mr6209429pgm.387.1665182866043; 
 Fri, 07 Oct 2022 15:47:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 z12-20020a1709027e8c00b0016dbaf3ff2esm2038893pla.22.2022.10.07.15.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 15:47:45 -0700 (PDT)
Date: Fri, 7 Oct 2022 15:47:44 -0700
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v4 2/6] treewide: use prandom_u32_max() when possible
Message-ID: <202210071241.445289C5@keescook>
References: <20221007180107.216067-1-Jason@zx2c4.com>
 <20221007180107.216067-3-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007180107.216067-3-Jason@zx2c4.com>
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
Cc: linux-wireless@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 x86@kernel.org, Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, kernel-janitors@vger.kernel.org,
 KP Singh <kpsingh@kernel.org>, dri-devel@lists.freedesktop.org,
 patches@lists.linux.dev, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, kasan-dev@googlegroups.com,
 "H . Peter Anvin" <hpa@zytor.com>, Andreas Noever <andreas.noever@gmail.com>,
 WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Airlie <airlied@redhat.com>, Paolo Abeni <pabeni@redhat.com>,
 "James E . J . Bottomley" <jejb@linux.ibm.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>, linux-media@vger.kernel.org,
 Marco Elver <elver@google.com>, Yury Norov <yury.norov@gmail.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Borislav Petkov <bp@alien8.de>,
 linux-nvme@lists.infradead.org, loongarch@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-mmc@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Florian Westphal <fw@strlen.de>, linux-kernel@vger.kernel.org,
 Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
 linux-crypto@vger.kernel.org, Jan Kara <jack@suse.com>,
 Thomas Graf <tgraf@suug.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 07, 2022 at 12:01:03PM -0600, Jason A. Donenfeld wrote:
> Rather than incurring a division or requesting too many random bytes for
> the given range, use the prandom_u32_max() function, which only takes
> the minimum required bytes from the RNG and avoids divisions.

I actually meant splitting the by-hand stuff by subsystem, but nearly
all of these can be done mechanically too, so it shouldn't be bad. Notes
below...

> 
> [...]
> diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> index 92bcc1768f0b..87203429f802 100644
> --- a/arch/arm64/kernel/process.c
> +++ b/arch/arm64/kernel/process.c
> @@ -595,7 +595,7 @@ unsigned long __get_wchan(struct task_struct *p)
>  unsigned long arch_align_stack(unsigned long sp)
>  {
>  	if (!(current->personality & ADDR_NO_RANDOMIZE) && randomize_va_space)
> -		sp -= get_random_int() & ~PAGE_MASK;
> +		sp -= prandom_u32_max(PAGE_SIZE);
>  	return sp & ~0xf;
>  }
>  

@mask@
expression MASK;
@@

- (get_random_int() & ~(MASK))
+ prandom_u32_max(MASK)

> diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
> index f32c38abd791..8c9826062652 100644
> --- a/arch/loongarch/kernel/vdso.c
> +++ b/arch/loongarch/kernel/vdso.c
> @@ -78,7 +78,7 @@ static unsigned long vdso_base(void)
>  	unsigned long base = STACK_TOP;
>  
>  	if (current->flags & PF_RANDOMIZE) {
> -		base += get_random_int() & (VDSO_RANDOMIZE_SIZE - 1);
> +		base += prandom_u32_max(VDSO_RANDOMIZE_SIZE);
>  		base = PAGE_ALIGN(base);
>  	}
>  

@minus_one@
expression FULL;
@@

- (get_random_int() & ((FULL) - 1)
+ prandom_u32_max(FULL)

> diff --git a/arch/parisc/kernel/vdso.c b/arch/parisc/kernel/vdso.c
> index 63dc44c4c246..47e5960a2f96 100644
> --- a/arch/parisc/kernel/vdso.c
> +++ b/arch/parisc/kernel/vdso.c
> @@ -75,7 +75,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
>  
>  	map_base = mm->mmap_base;
>  	if (current->flags & PF_RANDOMIZE)
> -		map_base -= (get_random_int() & 0x1f) * PAGE_SIZE;
> +		map_base -= prandom_u32_max(0x20) * PAGE_SIZE;
>  
>  	vdso_text_start = get_unmapped_area(NULL, map_base, vdso_text_len, 0, 0);
>  

These are more fun, but Coccinelle can still do them with a little
Pythonic help:

// Find a potential literal
@literal_mask@
expression LITERAL;
identifier randfunc =~ "get_random_int|prandom_u32|get_random_u32";
position p;
@@

        (randfunc()@p & (LITERAL))

// Add one to the literal.
@script:python add_one@
literal << literal_mask.LITERAL;
RESULT;
@@

if literal.startswith('0x'):
        value = int(literal, 16) + 1
        coccinelle.RESULT = cocci.make_expr("0x%x" % (value))
elif literal[0] in '123456789':
        value = int(literal, 10) + 1
        coccinelle.RESULT = cocci.make_expr("%d" % (value))
else:
        print("I don't know how to handle: %s" % (literal))

// Replace the literal mask with the calculated result.
@plus_one@
expression literal_mask.LITERAL;
position literal_mask.p;
expression add_one.RESULT;
identifier FUNC;
@@

-       (FUNC()@p & (LITERAL))
+       prandom_u32_max(RESULT)

> diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
> index cb29c8c1b370..d2faaca7f19d 100644
> --- a/drivers/mtd/tests/stresstest.c
> +++ b/drivers/mtd/tests/stresstest.c
> @@ -45,9 +45,8 @@ static int rand_eb(void)
>  	unsigned int eb;
>  
>  again:
> -	eb = prandom_u32();
>  	/* Read or write up 2 eraseblocks at a time - hence 'ebcnt - 1' */
> -	eb %= (ebcnt - 1);
> +	eb = prandom_u32_max(ebcnt - 1);
>  	if (bbt[eb])
>  		goto again;
>  	return eb;

This can also be done mechanically:

@multi_line@
identifier randfunc =~ "get_random_int|prandom_u32|get_random_u32";
identifier RAND;
expression E;
@@

-       RAND = randfunc();
        ... when != RAND
-       RAND %= (E);
+       RAND = prandom_u32_max(E);

@collapse_ret@
type TYPE;
identifier VAR;
expression E;
@@

 {
-       TYPE VAR;
-       VAR = (E);
-       return VAR;
+       return E;
 }

@drop_var@
type TYPE;
identifier VAR;
@@

 {
-       TYPE VAR;
        ... when != VAR
 }

> diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
> index 998dd2ac8008..f4944c4dee60 100644
> --- a/fs/ext2/ialloc.c
> +++ b/fs/ext2/ialloc.c
> @@ -277,8 +277,7 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent)
>  		int best_ndir = inodes_per_group;
>  		int best_group = -1;
>  
> -		group = prandom_u32();
> -		parent_group = (unsigned)group % ngroups;
> +		parent_group = prandom_u32_max(ngroups);
>  		for (i = 0; i < ngroups; i++) {
>  			group = (parent_group + i) % ngroups;
>  			desc = ext2_get_group_desc (sb, group, NULL);

Okay, that one is too much for me -- checking that group is never used
after the assignment removal is likely possible, but beyond my cocci
know-how. :)

> diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
> index f73e5eb43eae..36d5bc595cc2 100644
> --- a/fs/ext4/ialloc.c
> +++ b/fs/ext4/ialloc.c
> @@ -463,10 +463,9 @@ static int find_group_orlov(struct super_block *sb, struct inode *parent,
>  			hinfo.hash_version = DX_HASH_HALF_MD4;
>  			hinfo.seed = sbi->s_hash_seed;
>  			ext4fs_dirhash(parent, qstr->name, qstr->len, &hinfo);
> -			grp = hinfo.hash;
> +			parent_group = hinfo.hash % ngroups;
>  		} else
> -			grp = prandom_u32();
> -		parent_group = (unsigned)grp % ngroups;
> +			parent_group = prandom_u32_max(ngroups);
>  		for (i = 0; i < ngroups; i++) {
>  			g = (parent_group + i) % ngroups;
>  			get_orlov_stats(sb, g, flex_size, &stats);

Much less easy mechanically. :)

> diff --git a/lib/test_hexdump.c b/lib/test_hexdump.c
> index 0927f44cd478..41a0321f641a 100644
> --- a/lib/test_hexdump.c
> +++ b/lib/test_hexdump.c
> @@ -208,7 +208,7 @@ static void __init test_hexdump_overflow(size_t buflen, size_t len,
>  static void __init test_hexdump_overflow_set(size_t buflen, bool ascii)
>  {
>  	unsigned int i = 0;
> -	int rs = (prandom_u32_max(2) + 1) * 16;
> +	int rs = prandom_u32_max(2) + 1 * 16;
>  
>  	do {
>  		int gs = 1 << i;

This looks wrong. Cocci says:

-       int rs = (get_random_int() % 2 + 1) * 16;
+       int rs = (prandom_u32_max(2) + 1) * 16;

> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
> index 4f2f2d1bac56..56ffaa8dd3f6 100644
> --- a/lib/test_vmalloc.c
> +++ b/lib/test_vmalloc.c
> @@ -151,9 +151,7 @@ static int random_size_alloc_test(void)
>  	int i;
>  
>  	for (i = 0; i < test_loop_count; i++) {
> -		n = prandom_u32();
> -		n = (n % 100) + 1;
> -
> +		n = prandom_u32_max(n % 100) + 1;
>  		p = vmalloc(n * PAGE_SIZE);
>  
>  		if (!p)

This looks wrong. Cocci says:

-               n = prandom_u32();
-               n = (n % 100) + 1;
+               n = prandom_u32_max(100) + 1;

> @@ -293,16 +291,12 @@ pcpu_alloc_test(void)
>  		return -1;
>  
>  	for (i = 0; i < 35000; i++) {
> -		unsigned int r;
> -
> -		r = prandom_u32();
> -		size = (r % (PAGE_SIZE / 4)) + 1;
> +		size = prandom_u32_max(PAGE_SIZE / 4) + 1;
>  
>  		/*
>  		 * Maximum PAGE_SIZE
>  		 */
> -		r = prandom_u32();
> -		align = 1 << ((r % 11) + 1);
> +		align = 1 << (prandom_u32_max(11) + 1);
>  
>  		pcpu[i] = __alloc_percpu(size, align);
>  		if (!pcpu[i])
> @@ -393,14 +387,11 @@ static struct test_driver {
>  
>  static void shuffle_array(int *arr, int n)
>  {
> -	unsigned int rnd;
>  	int i, j;
>  
>  	for (i = n - 1; i > 0; i--)  {
> -		rnd = prandom_u32();
> -
>  		/* Cut the range. */
> -		j = rnd % i;
> +		j = prandom_u32_max(i);
>  
>  		/* Swap indexes. */
>  		swap(arr[i], arr[j]);

Yup, agrees with Cocci on these.

-- 
Kees Cook
