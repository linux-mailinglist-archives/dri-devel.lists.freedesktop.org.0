Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIBTNj7srmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512DD23C0F6
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9691E10E554;
	Mon,  9 Mar 2026 15:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NbA+Rb7E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1215F10E057
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 18:42:00 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-64ad9238d8fso10659917d50.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 11:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1772995319; cv=none;
 d=google.com; s=arc-20240605;
 b=R4uy/fynK3ZhEyul0YeEWaLyvSy11GGKs6kVH4BUtViAdGuXZ9BhtcBzf5ssArleSd
 M1PAN3TjHsUVWS3XOemRx25hcUiGsmeA090Y05C9u3c3acGDFAIXz39H/4BUnsSm+pvS
 cCtb387FSfTXDNJ4OiP3S8xbq4aLAiHPCJ/7gDSLq00OnX5VFuz5BBGQwK2boUjGGVi+
 pZzwBXq5TjKmuIhrOlgcSSDuPzPg6nCwXgJ20Ag3iuo3dWmslpOb0vhmL0ZSgYVPH7if
 tTDr4r/yfJTcTowmkDBBirMfcH7+r8o+cDdx7P1b7hntWpCzA0Reg9VNl4GtNH7T6/Jb
 LvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ZpzDnHDe78iWEUGuOKrGYfeMK0pcHHei4ODQ9kclWaI=;
 fh=9o4Td5a6REdeMPtqlgLFzeql0dyGa5lVb86maUOtWjg=;
 b=eMDgWmS0ETgfLM12Asn7FCggmaGtex/JZm3h68Fw1sVZHDWC8AxO0NprP/DqXQigcJ
 3fWYKy7XyMK+tzLo5/O1bugcyj3t+V73uk8Aqm+OHAo9eSfgrGGKIMx8B/y5vNw+Gbay
 LGnwISc4ZIGTUmKrAOtyoXf3WxaVOEkgfqpdpKPesBVGFoiFasTS0rUlVrKfZGQRgvmD
 CB8NkvwvlRLKPNuERFNHE244W1hmqxuM6auguClnQZdRy0FumbyvknY1hmTWKq/gnijH
 vV9uye+c8+3XX7QjS6SR0kQk8Uluuwpsa9ypK9UET83vpl3FZqb3kJ7DWE7q3r7OkMxC
 GHmw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772995319; x=1773600119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpzDnHDe78iWEUGuOKrGYfeMK0pcHHei4ODQ9kclWaI=;
 b=NbA+Rb7ESRo2jsls4RfwTt41pcwXyquDdRCS5oNsnFqPLtbG0WQC+8EN3KmiAqCv2A
 lqqt7i4gu51PthUIQWmQJmMhdETUe8On1Msexmxd4zCg8PZ53AY3z+QU/EuzxYNuPJYK
 LRvsBQVeHZqnZOCV7fIyAHRN2mq9c2xjp94neLjqtil7SKIFzQT3dCMYQT+a65P97WSj
 8XpeVZuwkAiyVAhtc/CTiYgAQ8ETLZDrPcAwkoHUvOo+aeFfayCBkm/De2b84mjl/BUV
 TfybAq7kAS5WNdCTEiv5uTB+tWWA0EUHRrk1YuHp8+/jCGaVk1I8G/3sIlvJL3zn3OfL
 nEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772995319; x=1773600119;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZpzDnHDe78iWEUGuOKrGYfeMK0pcHHei4ODQ9kclWaI=;
 b=tocIfl+3pJ2BWM0tlgCI2Dek1hQ2nUbGmGp1pTqjGV2uwYfhaCZ3pcI+WES/ZFujT9
 LgnprVhZshMZXUBulkLXN9R+vPhT6mmt9GJI5wiGC9ipZICNzMUeTDuLZC/9oiEVPcAz
 vZintDHTrJgQhg5fWYSMfg7m0Vc3uSFm9S98NqZ+qGkyk99i43QFwPya4ab6NLQ8u+3v
 a7x7RlXW0F1643eXK8TPy/fH8xMlQxxKf7TLT2wuSx/CafU0LA/XVnVkTAmVu9djTlfG
 c/bYibKarxD8pug7BUPwTvEglm82GaC8KvrAekUGV3ayUa4/u3h3mEI4zAMhsA+8cpxu
 7AKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe9XK2b+oj5ZqoOrBwv7Hyu2oHL5BOaZfs0+5u7vr49bLXPSQ1bjwGNEgCuUfNm9r6g+7PtPlKmuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7iykHJsq153StzJdIGfI2E+M7QQ8NhSZSjnFiCWyYH6O7xTkD
 /BFhwRGXSf23m+GhAbPlpVqBZ8QiOMcUbAXtPeLHUqyxKzM7NdvXturidYBn6Z6mK2KQeeg/SNP
 0aznYTetsH7kLpXb2hxEUW8foyUeMalE=
X-Gm-Gg: ATEYQzwLTsaFfqXUiDnzRmtnH/eUzAeW0uvBDKMz+2rd5Lm4GUNKasOi58PbdhkECEx
 i1Mc3yibRtQ1EE1EgJD4wduaQQSMOffG/uyKj/iRr9sXyHsvXbEHRNp09A19V1oc2bFL8Qh+gci
 /hXV7gagKi3hUGifdibHo39K1ZWHdbesqPqhKSanukO+rey6JZ0cdQo0u/mvWnIxXkCm45SMrFY
 7MbUyxVCtm/WlKD+9WlJSUVerPcmjMgjqO1F6SKt8bTsrx2FjwADcNpAX0cSoTw6lsNtx1Y7DF+
 v+Rc/5SO13UnemDgOmqWJTcGnhqy4mAweIILiocZ6aBVGQRQ
X-Received: by 2002:a53:b442:0:b0:64c:ed24:13da with SMTP id
 956f58d0204a3-64d142c7f83mr6741794d50.57.1772995318771; Sun, 08 Mar 2026
 11:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260308-scatterlist-v1-1-39c4566b0bba@gmail.com>
 <20260308180826.GG1687929@ziepe.ca>
In-Reply-To: <20260308180826.GG1687929@ziepe.ca>
From: Julian Orth <ju.orth@gmail.com>
Date: Sun, 8 Mar 2026 19:41:48 +0100
X-Gm-Features: AaiRm51KnGt1Ocvg1JS9VA3riuFsR3OYVC6SxA9saLbhpmRB0QADzrk-wJNj6tE
Message-ID: <CAHijbEX=LN_ntp6zwsqy3sW7EB+E6cBCWnrKZb_RqdNG=Et_3g@mail.gmail.com>
Subject: Re: [PATCH] lib/scatterlist: fix sg_page_count and sg_dma_page_count
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>, Imre Deak <imre.deak@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, 
 linux-kernel@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 09 Mar 2026 15:50:13 +0000
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
X-Rspamd-Queue-Id: 512DD23C0F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jgg@ziepe.ca,m:akpm@linux-foundation.org,m:imre.deak@intel.com,m:sakari.ailus@linux.intel.com,m:thellstrom@vmware.com,m:linux-kernel@vger.kernel.org,m:kraxel@redhat.com,m:vivek.kasireddy@intel.com,m:sumit.semwal@linaro.org,m:christian.koenig@amd.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.971];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[juorth@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ziepe.ca:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, Mar 8, 2026 at 7:08=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Sun, Mar 08, 2026 at 02:55:27PM +0100, Julian Orth wrote:
> > A user reported memory corruption in the Jay wayland compositor [1]. Th=
e
> > corruption started when archlinux enabled
> > CONFIG_TRANSPARENT_HUGEPAGE_SHMEM_HUGE_WITHIN_SIZE in kernel 6.19.5.
> >
> > The compositor uses udmabuf to upload memory from memfds to the GPU.
> > When running an affected kernel, the following warnings are logged:
> >
> >     a - addrs >=3D max_entries
> >     WARNING: drivers/gpu/drm/drm_prime.c:1089 at drm_prime_sg_to_dma_ad=
dr_array+0x86/0xc0, CPU#31: jay/1864
> >     [...]
> >     Call Trace:
> >      <TASK>
> >      amdgpu_bo_move+0x188/0x800 [amdgpu 3b451640234948027c09e9b39e6520b=
c7e5471cf]
> >
> > Disabling the use of huge pages at runtime via
> > /sys/kernel/mm/transparent_hugepage/shmem_enabled fixes the issue.
> >
> > udmabuf allocates a scatterlist with buffer_size/PAGE_SIZE entries. Eac=
h
> > entry has a length of PAGE_SIZE. With huge pages disabled, it appears
> > that sg->offset is always 0. With huge pages enabled, sg->offset is
> > incremented by PAGE_SIZE until the end of the huge page.
>
> This was broken by 0c8b91ef5100 ("udmabuf: add back support for
> mapping hugetlb pages") which switched from a working
> sg_alloc_table_from_pages() to a messed up sg_set_pages loop:
>
> +       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> +               sg_set_page(sgl, ubuf->pages[i], PAGE_SIZE, ubuf->offsets=
[i]);
> [..]
> +               ubuf->offsets[*pgbuf] =3D subpgoff << PAGE_SHIFT;
>
> Which is just the wrong way to use the scatterlist API.
>
> This was later changed to sg_set_folio() which I'm also suspecting has
> a bug, it should be setting page_link to the proper tail page because
> as you observe page_offset must fall within 0 to PAGE_SIZE-1 to make
> the iterator work.
>
> I think the whole design here in udmabuf makes very little sense. It
> starts out with an actual list of folios then expands them to a per-4K
> double array of folio/offset. This is nonsensical, if it wants to
> build a way to direct index the mapping for mmap it should just build
> itself a page * array like the code used to do and continue to use
> sg_alloc_table_from_pages() which builds properly formed scatterlists.
>
> This would save memory, use the APIs properly and build a correct and
> optimized scatterlist to boot. It uses vmf_insert_pfn() and
> vm_map_ram() anyhow so it doesn't even use a folio :\
>
> Here, a few mins of AI shows what I think udmabuf should look like. If
> you wish to persue this please add my signed-off-by and handle testing
> it and getting it merged. I reviewed it enough to see it was showing
> what I wanted.

I don't know enough about folios or udmabuf to efficiently work on this.

If offset is supposed to be in [0, PAGE_SIZE-1], then my patch is
incorrect and it's probably better if some of the udmabuf maintainers
take a look at this. I've added them to CC.

>
> Jason
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 94b8ecb892bb17..5d687860445137 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -26,10 +26,10 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a dmabuf=
, in megabytes. Default is
>
>  struct udmabuf {
>         pgoff_t pagecount;
> -       struct folio **folios;
> +       struct page **pages;
>
>         /**
> -        * Unlike folios, pinned_folios is only used for unpin.
> +        * Unlike pages, pinned_folios is only used for unpin.
>          * So, nr_pinned is not the same to pagecount, the pinned_folios
>          * only set each folio which already pinned when udmabuf_create.
>          * Note that, since a folio may be pinned multiple times, each fo=
lio
> @@ -41,7 +41,6 @@ struct udmabuf {
>
>         struct sg_table *sg;
>         struct miscdevice *device;
> -       pgoff_t *offsets;
>  };
>
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -55,8 +54,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf=
)
>         if (pgoff >=3D ubuf->pagecount)
>                 return VM_FAULT_SIGBUS;
>
> -       pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -       pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +       pfn =3D page_to_pfn(ubuf->pages[pgoff]);
>
>         ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
>         if (ret & VM_FAULT_ERROR)
> @@ -73,8 +71,7 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf=
)
>                 if (WARN_ON(pgoff >=3D ubuf->pagecount))
>                         break;
>
> -               pfn =3D folio_pfn(ubuf->folios[pgoff]);
> -               pfn +=3D ubuf->offsets[pgoff] >> PAGE_SHIFT;
> +               pfn =3D page_to_pfn(ubuf->pages[pgoff]);
>
>                 /**
>                  * If the below vmf_insert_pfn() fails, we do not return =
an
> @@ -109,22 +106,11 @@ static int mmap_udmabuf(struct dma_buf *buf, struct=
 vm_area_struct *vma)
>  static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>  {
>         struct udmabuf *ubuf =3D buf->priv;
> -       struct page **pages;
>         void *vaddr;
> -       pgoff_t pg;
>
>         dma_resv_assert_held(buf->resv);
>
> -       pages =3D kvmalloc_objs(*pages, ubuf->pagecount);
> -       if (!pages)
> -               return -ENOMEM;
> -
> -       for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -               pages[pg] =3D folio_page(ubuf->folios[pg],
> -                                      ubuf->offsets[pg] >> PAGE_SHIFT);
> -
> -       vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
> -       kvfree(pages);
> +       vaddr =3D vm_map_ram(ubuf->pages, ubuf->pagecount, -1);
>         if (!vaddr)
>                 return -EINVAL;
>
> @@ -146,22 +132,18 @@ static struct sg_table *get_sg_table(struct device =
*dev, struct dma_buf *buf,
>  {
>         struct udmabuf *ubuf =3D buf->priv;
>         struct sg_table *sg;
> -       struct scatterlist *sgl;
> -       unsigned int i =3D 0;
>         int ret;
>
>         sg =3D kzalloc_obj(*sg);
>         if (!sg)
>                 return ERR_PTR(-ENOMEM);
>
> -       ret =3D sg_alloc_table(sg, ubuf->pagecount, GFP_KERNEL);
> +       ret =3D sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->pagecoun=
t, 0,
> +                                       ubuf->pagecount << PAGE_SHIFT,
> +                                       GFP_KERNEL);
>         if (ret < 0)
>                 goto err_alloc;
>
> -       for_each_sg(sg->sgl, sgl, ubuf->pagecount, i)
> -               sg_set_folio(sgl, ubuf->folios[i], PAGE_SIZE,
> -                            ubuf->offsets[i]);
> -
>         ret =3D dma_map_sgtable(dev, sg, direction, 0);
>         if (ret < 0)
>                 goto err_map;
> @@ -207,12 +189,8 @@ static void unpin_all_folios(struct udmabuf *ubuf)
>
>  static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t pg=
cnt)
>  {
> -       ubuf->folios =3D kvmalloc_objs(*ubuf->folios, pgcnt);
> -       if (!ubuf->folios)
> -               return -ENOMEM;
> -
> -       ubuf->offsets =3D kvzalloc_objs(*ubuf->offsets, pgcnt);
> -       if (!ubuf->offsets)
> +       ubuf->pages =3D kvmalloc_objs(*ubuf->pages, pgcnt);
> +       if (!ubuf->pages)
>                 return -ENOMEM;
>
>         ubuf->pinned_folios =3D kvmalloc_objs(*ubuf->pinned_folios, pgcnt=
);
> @@ -225,8 +203,7 @@ static __always_inline int init_udmabuf(struct udmabu=
f *ubuf, pgoff_t pgcnt)
>  static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>  {
>         unpin_all_folios(ubuf);
> -       kvfree(ubuf->offsets);
> -       kvfree(ubuf->folios);
> +       kvfree(ubuf->pages);
>  }
>
>  static void release_udmabuf(struct dma_buf *buf)
> @@ -344,8 +321,8 @@ static long udmabuf_pin_folios(struct udmabuf *ubuf, =
struct file *memfd,
>                 ubuf->pinned_folios[nr_pinned++] =3D folios[cur_folio];
>
>                 for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> -                       ubuf->folios[upgcnt] =3D folios[cur_folio];
> -                       ubuf->offsets[upgcnt] =3D subpgoff;
> +                       ubuf->pages[upgcnt] =3D folio_page(folios[cur_fol=
io],
> +                                               subpgoff >> PAGE_SHIFT);
>                         ++upgcnt;
>
>                         if (++cur_pgcnt >=3D pgcnt)
>
