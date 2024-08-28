Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D214962D42
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 18:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C253610E558;
	Wed, 28 Aug 2024 16:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cemGBgcd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEB310E552;
 Wed, 28 Aug 2024 16:06:34 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-5d615ed1d2bso212554eaf.3; 
 Wed, 28 Aug 2024 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724861193; x=1725465993; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFho8RiZ83kbcV3m0nrOWSeKb7iDv9gWtyqOVRDpJ78=;
 b=cemGBgcdFZnXF1fMdUrpNVcXPeyX2dIhUnd1kVAlUYijatUF0tzTOoQMWpH2wntrxz
 N9Gt7++oBULyX3tJ+Dw5ry1ycEKWqcd06PU8o4k6ZBObbxG7MDnKEFEnFBWJBrkevH8W
 TuLMVf26mqfv1a6WGwAP2+8UOww4xWBxAQtCnIruobV2eA4Fw6e/j9aOYYJbXB00hJY8
 +KcF1AVLiXFePBnLhX3Oi2oF9ElSSHqYRz4jXTxqBhD6eZFCnywQA5vDiaOgEkIi67Ja
 gKRF+0RCWyGUyt+smSdo1nPLmRU6Be2sTxl0BtVtsNpQwfj6kU6yIXZAFsb4Xo6Fd4R5
 kvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724861193; x=1725465993;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YFho8RiZ83kbcV3m0nrOWSeKb7iDv9gWtyqOVRDpJ78=;
 b=k/tiWbrA2+AGwSEjdA+Z97oB8pTJIWLIemqhrbr+7ixAuyIe7iEEYEgCmuh8wSKaQB
 GUatDKYvpomUXZIGfNXNtk0JAzz56aYV9g2LZqqxoB5RCHZIDuK+HdSmxvHsBHbjRP2F
 +oHvycsUmyLP71bSqHibjA7pRlrZqcUYdosHbGdPz5tchAYVxO0r0UzJYn2kv//2oH2O
 Q8gct+XsTY6SYgoU1ZoUvrWZPJVZQafVVRupGq1Pvc4Skwx8aqNGTJ0RfWYD1LCZsJhA
 H5iGZAwgkQRbBXsNUCPFuvLmcKnuFU1+ulxvAaIqpJnjmehjxZFT553Mw9Dr5t05yn83
 ozjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ui91q2V2RtAHqHz9DjzeuMYs8p25fMMVpdsBfbULtcecJ4YtHdW3EO/5cNbTn3CVCVZxOr+K1T8=@lists.freedesktop.org,
 AJvYcCUhwX0m2nH+Rr9R9FEwQ8tFUMyyojIDDvin3igJA+W1SZkpNNDia8DZeeibnCH6boycNzW5iXE//oA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTXb3uaIEuNNaaZLEdAkCqWuTLLIyEHOLkBGn/iuFLOHeseN9o
 o5MTSMecR9L3cKHrMd1tmr3AjDcRm6ySjewkfbxyk+m/hG9L5zcx5k60uFK5keVEZGLT0mbJTC6
 mNQWXg4+eWyLmlTB6le0B1rsUj8I=
X-Google-Smtp-Source: AGHT+IHKDH1ngCMIRt7bk2Vo2Ds1BWvQAmQOPqJwrebxfYrZglzyFgdQ6kT5L011snZFdSZ+T4rvaPatb3sNfb68HUE=
X-Received: by 2002:a05:6359:4c9a:b0:1ac:a26c:9e91 with SMTP id
 e5c5f4694b2df-1b603d19d05mr11731355d.4.1724861192260; Wed, 28 Aug 2024
 09:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-6-matthew.brost@intel.com>
 <Zs80t6LxPt2bXMPA@phenom.ffwll.local>
 <c1d455a7-f682-43ac-8bbd-af0727954d5d@amd.com>
 <Zs9FtNM/UVSSCAhR@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zs9FtNM/UVSSCAhR@DUT025-TGLU.fm.intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 28 Aug 2024 12:06:19 -0400
Message-ID: <CADnq5_NByopbW3Bw3buhtn1_EG2Ygg9V=U6j+SJOToLmCa=bNQ@mail.gmail.com>
Subject: Re: [RFC PATCH 05/28] drm/gpusvm: Add support for GPU Shared Virtual
 Memory
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, airlied@gmail.com, 
 thomas.hellstrom@linux.intel.com, matthew.auld@intel.com, daniel@ffwll.ch
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

On Wed, Aug 28, 2024 at 11:53=E2=80=AFAM Matthew Brost <matthew.brost@intel=
.com> wrote:
>
> On Wed, Aug 28, 2024 at 04:46:24PM +0200, Christian K=C3=B6nig wrote:
> > Am 28.08.24 um 16:31 schrieb Daniel Vetter:
> > > On Tue, Aug 27, 2024 at 07:48:38PM -0700, Matthew Brost wrote:
> > > > +         if (!ctx->mmap_locked) {
> > > > +                 /*
> > > > +                  * XXX: HMM locking document indicates only a rea=
d-lock
> > > > +                  * is required but there apears to be a window be=
tween
> > > > +                  * the MMU_NOTIFY_MIGRATE event triggered in a CP=
U fault
> > > > +                  * via migrate_vma_setup and the pages actually m=
oving
> > > > +                  * in migrate_vma_finalize in which this code can=
 grab
> > > > +                  * garbage pages. Grabbing the write-lock if the =
range
> > > > +                  * is attached to vram appears to protect against=
 this
> > > > +                  * race.
> > > > +                  */
>
> Thanks the comments, replying to both of you inline.
>
> > > This one is really scary, since it means the entire migrate pte trick=
ery
> > > is essentially completely busted. Grabbing the mmap write lock just m=
eans
> > > you block out pretty much everything interesting from concurrently
> > > happening.
> > >
> > > My gut feeling says we need to figure out what's happening here, beca=
use
> > > this looks a bit too fundamental to me.
>
> I agree. I haven=E2=80=99t looked into this issue for a couple of months =
but
> really need to understand what is going on.
>
> I should have mentioned this in the cover letter: the goal of this
> series was to produce something for review that is stable and supports
> UMDs/user applications. It was not intended to be presented as a final
> solution. This issue certainly falls into the category of "needs to be
> understood and requires a proper fix."
>
> One open question I have is whether the test case that triggers this
> issue is even defined behavior. The test creates concurrent access
> between the GPU and CPU to the same memory address, resulting in GPU and
> CPU faults racing against each other. It=E2=80=99s possible that this is
> undefined behavior, so data corruption might be acceptable=E2=80=94i.e., =
the
> kernel can=E2=80=99t crash, but incorrect results might be permissible.
>
> e.g. This is the only defined usage model:
>
> alloc_memory();
> start_compute_kernel();
> sync_on_compute_kernel_completion();
> read_memory();
>
> Hopefully, in the next week or so, I'll be heavily engaging with the UMD
> teams. Development can then start, and applications will be running soon
> after. This will allow us to address issues like this, collect data on
> memory usage, and verify some of the assumptions I've made, such as
> optimizing for 2M+ allocations.
>
> >
> > I think I have at least a high level understanding what's going on here=
,
> > Felix and especially Philip should know more of the details.
> >
>
> I meant to reach out to AMD for issues like this. So, Felix
> (felix.kuehling@amd.com) and Philip (Philip.Yang@amd.com) would be good
> contacts?

Yes.

Alex

>
> > In general grabbing the mm_lock to protect PTEs from changing is comple=
tely
> > nonsense. The mm_lock is to protect the VMAs and *not* the PTEs!
> >
>
> Thanks for the hint. I believe that in the AMD implementation, I noticed
> some additional locks for migration, which might be how you mitigated
> this issue.
>
> I must say it is a bit unfortunate that the HMM locking documentation
> doesn=E2=80=99t mention this. I believe the documentation needs additiona=
l
> information, which I can add once we finalize the solution.
>
> Matt
>
> > Even with the write side of the mm_lock taken it is perfectly possible =
that
> > PTE change. It's just less likely.
> >
> > We run into multiple issues before we figured out this important distin=
ction
> > as well.
> >
> > Christian.
> >
> > > -Sima
> > >
> > >
> > > > +                 if (vram_pages)
> > > > +                         mmap_write_lock(mm);
> > > > +                 else
> > > > +                         mmap_read_lock(mm);
> > > > +         }
> > > > +         err =3D hmm_range_fault(&hmm_range);
> > > > +         if (!ctx->mmap_locked) {
> > > > +                 if (vram_pages)
> > > > +                         mmap_write_unlock(mm);
> > > > +                 else
> > > > +                         mmap_read_unlock(mm);
> > > > +         }
> > > > +
> > > > +         if (err =3D=3D -EBUSY) {
> > > > +                 if (time_after(jiffies, timeout))
> > > > +                         break;
> > > > +
> > > > +                 hmm_range.notifier_seq =3D mmu_interval_read_begi=
n(notifier);
> > > > +                 continue;
> > > > +         }
> > > > +         break;
> > > > + }
> > > > + if (!ctx->mmap_locked)
> > > > +         mmput(mm);
> > > > + if (err)
> > > > +         goto err_free;
> > > > +
> > > > + pages =3D (struct page **)pfns;
> > > > +
> > > > + if (ctx->prefault) {
> > > > +         range->pages =3D pages;
> > > > +         goto set_seqno;
> > > > + }
> > > > +
> > > > +map_pages:
> > > > + if (is_device_private_page(hmm_pfn_to_page(pfns[0]))) {
> > > > +         WARN_ON_ONCE(!range->vram_allocation);
> > > > +
> > > > +         for (i =3D 0; i < npages; ++i) {
> > > > +                 pages[i] =3D hmm_pfn_to_page(pfns[i]);
> > > > +
> > > > +                 if (WARN_ON_ONCE(!is_device_private_page(pages[i]=
))) {
> > > > +                         err =3D -EOPNOTSUPP;
> > > > +                         goto err_free;
> > > > +                 }
> > > > +         }
> > > > +
> > > > +         /* Do not race with notifier unmapping pages */
> > > > +         drm_gpusvm_notifier_lock(gpusvm);
> > > > +         range->flags.has_vram_pages =3D true;
> > > > +         range->pages =3D pages;
> > > > +         if (mmu_interval_read_retry(notifier, hmm_range.notifier_=
seq)) {
> > > > +                 err =3D -EAGAIN;
> > > > +                 __drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +         }
> > > > +         drm_gpusvm_notifier_unlock(gpusvm);
> > > > + } else {
> > > > +         dma_addr_t *dma_addr =3D (dma_addr_t *)pfns;
> > > > +
> > > > +         for_each_dma_page(i, j, npages, order) {
> > > > +                 if (WARN_ON_ONCE(i && order !=3D
> > > > +                                  hmm_pfn_to_map_order(pfns[i]))) =
{
> > > > +                         err =3D -EOPNOTSUPP;
> > > > +                         npages =3D i;
> > > > +                         goto err_unmap;
> > > > +                 }
> > > > +                 order =3D hmm_pfn_to_map_order(pfns[i]);
> > > > +
> > > > +                 pages[j] =3D hmm_pfn_to_page(pfns[i]);
> > > > +                 if (WARN_ON_ONCE(is_zone_device_page(pages[j]))) =
{
> > > > +                         err =3D -EOPNOTSUPP;
> > > > +                         npages =3D i;
> > > > +                         goto err_unmap;
> > > > +                 }
> > > > +
> > > > +                 set_page_dirty_lock(pages[j]);
> > > > +                 mark_page_accessed(pages[j]);
> > > > +
> > > > +                 dma_addr[j] =3D dma_map_page(gpusvm->drm->dev,
> > > > +                                            pages[j], 0,
> > > > +                                            PAGE_SIZE << order,
> > > > +                                            DMA_BIDIRECTIONAL);
> > > > +                 if (dma_mapping_error(gpusvm->drm->dev, dma_addr[=
j])) {
> > > > +                         err =3D -EFAULT;
> > > > +                         npages =3D i;
> > > > +                         goto err_unmap;
> > > > +                 }
> > > > +         }
> > > > +
> > > > +         /* Huge pages, reduce memory footprint */
> > > > +         if (order) {
> > > > +                 dma_addr =3D kmalloc_array(j, sizeof(*dma_addr),
> > > > +                                          GFP_KERNEL);
> > > > +                 if (dma_addr) {
> > > > +                         for (i =3D 0; i < j; ++i)
> > > > +                                 dma_addr[i] =3D (dma_addr_t)pfns[=
i];
> > > > +                         kvfree(pfns);
> > > > +                         kfree_mapping =3D true;
> > > > +                 } else {
> > > > +                         dma_addr =3D (dma_addr_t *)pfns;
> > > > +                 }
> > > > +         }
> > > > +
> > > > +         /* Do not race with notifier unmapping pages */
> > > > +         drm_gpusvm_notifier_lock(gpusvm);
> > > > +         range->order =3D order;
> > > > +         range->flags.kfree_mapping =3D kfree_mapping;
> > > > +         range->flags.has_dma_mapping =3D true;
> > > > +         range->dma_addr =3D dma_addr;
> > > > +         range->vram_allocation =3D NULL;
> > > > +         if (mmu_interval_read_retry(notifier, hmm_range.notifier_=
seq)) {
> > > > +                 err =3D -EAGAIN;
> > > > +                 __drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +         }
> > > > +         drm_gpusvm_notifier_unlock(gpusvm);
> > > > + }
> > > > +
> > > > + if (err =3D=3D -EAGAIN)
> > > > +         goto retry;
> > > > +set_seqno:
> > > > + range->notifier_seq =3D hmm_range.notifier_seq;
> > > > +
> > > > + return 0;
> > > > +
> > > > +err_unmap:
> > > > + for_each_dma_page(i, j, npages, order)
> > > > +         dma_unmap_page(gpusvm->drm->dev,
> > > > +                        (dma_addr_t)pfns[j],
> > > > +                        PAGE_SIZE << order, DMA_BIDIRECTIONAL);
> > > > +err_free:
> > > > + if (alloc_pfns)
> > > > +         kvfree(pfns);
> > > > +err_out:
> > > > + return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_range_unmap_pages - Unmap pages associated with a GP=
U SVM range
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + * @ctx: GPU SVM context
> > > > + *
> > > > + * This function unmaps pages associated with a GPU SVM range. If =
@in_notifier
> > > > + * is set, it is assumed that gpusvm->notifier_lock is held in wri=
te mode; if it
> > > > + * is clear, it acquires gpusvm->notifier_lock in read mode. Must =
be called on
> > > > + * each GPU SVM range attached to notifier in gpusvm->ops->invalid=
ate for IOMMU
> > > > + * security model.
> > > > + */
> > > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > > +                           struct drm_gpusvm_range *range,
> > > > +                           const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > + if (ctx->in_notifier)
> > > > +         lockdep_assert_held_write(&gpusvm->notifier_lock);
> > > > + else
> > > > +         drm_gpusvm_notifier_lock(gpusvm);
> > > > +
> > > > + __drm_gpusvm_range_unmap_pages(gpusvm, range);
> > > > +
> > > > + if (!ctx->in_notifier)
> > > > +         drm_gpusvm_notifier_unlock(gpusvm);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migration_put_page - Put a migration page
> > > > + * @page: Pointer to the page to put
> > > > + *
> > > > + * This function unlocks and puts a page.
> > > > + */
> > > > +static void drm_gpusvm_migration_put_page(struct page *page)
> > > > +{
> > > > + unlock_page(page);
> > > > + put_page(page);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migration_put_pages - Put migration pages
> > > > + * @npages: Number of pages
> > > > + * @migrate_pfn: Array of migrate page frame numbers
> > > > + *
> > > > + * This function puts an array of pages.
> > > > + */
> > > > +static void drm_gpusvm_migration_put_pages(unsigned long npages,
> > > > +                                    unsigned long *migrate_pfn)
> > > > +{
> > > > + unsigned long i;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i) {
> > > > +         if (!migrate_pfn[i])
> > > > +                 continue;
> > > > +
> > > > +         drm_gpusvm_migration_put_page(migrate_pfn_to_page(migrate=
_pfn[i]));
> > > > +         migrate_pfn[i] =3D 0;
> > > > + }
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_get_vram_page - Get a reference to a VRAM page
> > > > + * @page: Pointer to the page
> > > > + * @zdd: Pointer to the GPU SVM zone device data
> > > > + *
> > > > + * This function associates the given page with the specified GPU =
SVM zone
> > > > + * device data and initializes it for zone device usage.
> > > > + */
> > > > +static void drm_gpusvm_get_vram_page(struct page *page,
> > > > +                              struct drm_gpusvm_zdd *zdd)
> > > > +{
> > > > + page->zone_device_data =3D drm_gpusvm_zdd_get(zdd);
> > > > + zone_device_page_init(page);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_map_pages() - Map migration pages for GPU SV=
M migration
> > > > + * @dev: The device for which the pages are being mapped
> > > > + * @dma_addr: Array to store DMA addresses corresponding to mapped=
 pages
> > > > + * @migrate_pfn: Array of migrate page frame numbers to map
> > > > + * @npages: Number of pages to map
> > > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > > + *
> > > > + * This function maps pages of memory for migration usage in GPU S=
VM. It
> > > > + * iterates over each page frame number provided in @migrate_pfn, =
maps the
> > > > + * corresponding page, and stores the DMA address in the provided =
@dma_addr
> > > > + * array.
> > > > + *
> > > > + * Return: 0 on success, -EFAULT if an error occurs during mapping=
.
> > > > + */
> > > > +static int drm_gpusvm_migrate_map_pages(struct device *dev,
> > > > +                                 dma_addr_t *dma_addr,
> > > > +                                 long unsigned int *migrate_pfn,
> > > > +                                 unsigned long npages,
> > > > +                                 enum dma_data_direction dir)
> > > > +{
> > > > + unsigned long i;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i) {
> > > > +         struct page *page =3D migrate_pfn_to_page(migrate_pfn[i])=
;
> > > > +
> > > > +         if (!page)
> > > > +                 continue;
> > > > +
> > > > +         if (WARN_ON_ONCE(is_zone_device_page(page)))
> > > > +                 return -EFAULT;
> > > > +
> > > > +         dma_addr[i] =3D dma_map_page(dev, page, 0, PAGE_SIZE, dir=
);
> > > > +         if (dma_mapping_error(dev, dma_addr[i]))
> > > > +                 return -EFAULT;
> > > > + }
> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_unmap_pages() - Unmap pages previously mappe=
d for GPU SVM migration
> > > > + * @dev: The device for which the pages were mapped
> > > > + * @dma_addr: Array of DMA addresses corresponding to mapped pages
> > > > + * @npages: Number of pages to unmap
> > > > + * @dir: Direction of data transfer (e.g., DMA_BIDIRECTIONAL)
> > > > + *
> > > > + * This function unmaps previously mapped pages of memory for GPU =
Shared Virtual
> > > > + * Memory (SVM). It iterates over each DMA address provided in @dm=
a_addr, checks
> > > > + * if it's valid and not already unmapped, and unmaps the correspo=
nding page.
> > > > + */
> > > > +static void drm_gpusvm_migrate_unmap_pages(struct device *dev,
> > > > +                                    dma_addr_t *dma_addr,
> > > > +                                    unsigned long npages,
> > > > +                                    enum dma_data_direction dir)
> > > > +{
> > > > + unsigned long i;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i) {
> > > > +         if (!dma_addr[i] || dma_mapping_error(dev, dma_addr[i]))
> > > > +                 continue;
> > > > +
> > > > +         dma_unmap_page(dev, dma_addr[i], PAGE_SIZE, dir);
> > > > + }
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_to_vram - Migrate GPU SVM range to VRAM
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + *                   failure of this function.
> > > > + * @vram_allocation: Driver-private pointer to the VRAM allocation=
. The caller
> > > > + *                   should hold a reference to the VRAM allocatio=
n, which
> > > > + *                   should be dropped via ops->vram_allocation or=
 upon the
> > > > + *                   failure of this function.
> > > > + * @ctx: GPU SVM context
> > > > + *
> > > > + * This function migrates the specified GPU SVM range to VRAM. It =
performs the
> > > > + * necessary setup and invokes the driver-specific operations for =
migration to
> > > > + * VRAM. Upon successful return, @vram_allocation can safely refer=
ence @range
> > > > + * until ops->vram_release is called which only upon successful re=
turn.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > > > +                        struct drm_gpusvm_range *range,
> > > > +                        void *vram_allocation,
> > > > +                        const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > + u64 start =3D range->va.start, end =3D range->va.end;
> > > > + struct migrate_vma migrate =3D {
> > > > +         .start          =3D start,
> > > > +         .end            =3D end,
> > > > +         .pgmap_owner    =3D gpusvm->device_private_page_owner,
> > > > +         .flags          =3D MIGRATE_VMA_SELECT_SYSTEM,
> > > > + };
> > > > + struct mm_struct *mm =3D gpusvm->mm;
> > > > + unsigned long i, npages =3D npages_in_range(start, end);
> > > > + struct vm_area_struct *vas;
> > > > + struct drm_gpusvm_zdd *zdd =3D NULL;
> > > > + struct page **pages;
> > > > + dma_addr_t *dma_addr;
> > > > + void *buf;
> > > > + int err;
> > > > +
> > > > + if (!range->flags.migrate_vram)
> > > > +         return -EINVAL;
> > > > +
> > > > + if (!gpusvm->ops->populate_vram_pfn || !gpusvm->ops->copy_to_vram=
 ||
> > > > +     !gpusvm->ops->copy_to_sram)
> > > > +         return -EOPNOTSUPP;
> > > > +
> > > > + if (!ctx->mmap_locked) {
> > > > +         if (!mmget_not_zero(mm)) {
> > > > +                 err =3D -EFAULT;
> > > > +                 goto err_out;
> > > > +         }
> > > > +         mmap_write_lock(mm);
> > > > + }
> > > > +
> > > > + mmap_assert_locked(mm);
> > > > +
> > > > + vas =3D vma_lookup(mm, start);
> > > > + if (!vas) {
> > > > +         err =3D -ENOENT;
> > > > +         goto err_mmunlock;
> > > > + }
> > > > +
> > > > + if (end > vas->vm_end || start < vas->vm_start) {
> > > > +         err =3D -EINVAL;
> > > > +         goto err_mmunlock;
> > > > + }
> > > > +
> > > > + if (!vma_is_anonymous(vas)) {
> > > > +         err =3D -EBUSY;
> > > > +         goto err_mmunlock;
> > > > + }
> > > > +
> > > > + buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_a=
ddr) +
> > > > +                sizeof(*pages), GFP_KERNEL);
> > > > + if (!buf) {
> > > > +         err =3D -ENOMEM;
> > > > +         goto err_mmunlock;
> > > > + }
> > > > + dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > > + pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * =
npages;
> > > > +
> > > > + zdd =3D drm_gpusvm_zdd_alloc(range);
> > > > + if (!zdd) {
> > > > +         err =3D -ENOMEM;
> > > > +         goto err_free;
> > > > + }
> > > > +
> > > > + migrate.vma =3D vas;
> > > > + migrate.src =3D buf;
> > > > + migrate.dst =3D migrate.src + npages;
> > > > +
> > > > + err =3D migrate_vma_setup(&migrate);
> > > > + if (err)
> > > > +         goto err_free;
> > > > +
> > > > + /*
> > > > +  * FIXME: Below cases, !migrate.cpages and migrate.cpages !=3D np=
ages, not
> > > > +  * always an error. Need to revisit possible cases and how to han=
dle. We
> > > > +  * could prefault on migrate.cpages !=3D npages via hmm_range_fau=
lt.
> > > > +  */
> > > > +
> > > > + if (!migrate.cpages) {
> > > > +         err =3D -EFAULT;
> > > > +         goto err_free;
> > > > + }
> > > > +
> > > > + if (migrate.cpages !=3D npages) {
> > > > +         err =3D -EBUSY;
> > > > +         goto err_finalize;
> > > > + }
> > > > +
> > > > + err =3D gpusvm->ops->populate_vram_pfn(gpusvm, vram_allocation, n=
pages,
> > > > +                                      migrate.dst);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > +                                    migrate.src, npages, DMA_TO_DE=
VICE);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i) {
> > > > +         struct page *page =3D pfn_to_page(migrate.dst[i]);
> > > > +
> > > > +         pages[i] =3D page;
> > > > +         migrate.dst[i] =3D migrate_pfn(migrate.dst[i]);
> > > > +         drm_gpusvm_get_vram_page(page, zdd);
> > > > + }
> > > > +
> > > > + err =3D gpusvm->ops->copy_to_vram(gpusvm, pages, dma_addr, npages=
);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + /* Upon success bind vram allocation to range and zdd */
> > > > + range->vram_allocation =3D vram_allocation;
> > > > + WRITE_ONCE(zdd->vram_allocation, vram_allocation);      /* Owns r=
ef */
> > > > +
> > > > +err_finalize:
> > > > + if (err)
> > > > +         drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > > > + migrate_vma_pages(&migrate);
> > > > + migrate_vma_finalize(&migrate);
> > > > + drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages=
,
> > > > +                                DMA_TO_DEVICE);
> > > > +err_free:
> > > > + if (zdd)
> > > > +         drm_gpusvm_zdd_put(zdd);
> > > > + kvfree(buf);
> > > > +err_mmunlock:
> > > > + if (!ctx->mmap_locked) {
> > > > +         mmap_write_unlock(mm);
> > > > +         mmput(mm);
> > > > + }
> > > > +err_out:
> > > > + return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_populate_sram_pfn - Populate SRAM PFNs for a=
 VM area
> > > > + * @vas: Pointer to the VM area structure, can be NULL
> > > > + * @npages: Number of pages to populate
> > > > + * @src_mpfn: Source array of migrate PFNs
> > > > + * @mpfn: Array of migrate PFNs to populate
> > > > + * @addr: Start address for PFN allocation
> > > > + *
> > > > + * This function populates the SRAM migrate page frame numbers (PF=
Ns) for the
> > > > + * specified VM area structure. It allocates and locks pages in th=
e VM area for
> > > > + * SRAM usage. If vas is non-NULL use alloc_page_vma for allocatio=
n, if NULL use
> > > > + * alloc_page for allocation.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int drm_gpusvm_migrate_populate_sram_pfn(struct vm_area_str=
uct *vas,
> > > > +                                         unsigned long npages,
> > > > +                                         unsigned long *src_mpfn,
> > > > +                                         unsigned long *mpfn, u64 =
addr)
> > > > +{
> > > > + unsigned long i;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i, addr +=3D PAGE_SIZE) {
> > > > +         struct page *page;
> > > > +
> > > > +         if (!(src_mpfn[i] & MIGRATE_PFN_MIGRATE))
> > > > +                 continue;
> > > > +
> > > > +         if (vas)
> > > > +                 page =3D alloc_page_vma(GFP_HIGHUSER, vas, addr);
> > > > +         else
> > > > +                 page =3D alloc_page(GFP_HIGHUSER);
> > > > +
> > > > +         if (!page)
> > > > +                 return -ENOMEM;
> > > > +
> > > > +         lock_page(page);
> > > > +         mpfn[i] =3D migrate_pfn(page_to_pfn(page));
> > > > + }
> > > > +
> > > > + return 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_evict_to_sram - Evict GPU SVM range to SRAM
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + *
> > > > + * Similar to __drm_gpusvm_migrate_to_sram but does not require mm=
ap lock and
> > > > + * migration done via migrate_device_* functions. Fallback path as=
 it is
> > > > + * preferred to issue migrations with mmap lock.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int drm_gpusvm_evict_to_sram(struct drm_gpusvm *gpusvm,
> > > > +                             struct drm_gpusvm_range *range)
> > > > +{
> > > > + unsigned long npages;
> > > > + struct page **pages;
> > > > + unsigned long *src, *dst;
> > > > + dma_addr_t *dma_addr;
> > > > + void *buf;
> > > > + int i, err =3D 0;
> > > > +
> > > > + npages =3D npages_in_range(range->va.start, range->va.end);
> > > > +
> > > > + buf =3D kvcalloc(npages, 2 * sizeof(*src) + sizeof(*dma_addr) +
> > > > +                sizeof(*pages), GFP_KERNEL);
> > > > + if (!buf) {
> > > > +         err =3D -ENOMEM;
> > > > +         goto err_out;
> > > > + }
> > > > + src =3D buf;
> > > > + dst =3D buf + (sizeof(*src) * npages);
> > > > + dma_addr =3D buf + (2 * sizeof(*src) * npages);
> > > > + pages =3D buf + (2 * sizeof(*src) + sizeof(*dma_addr)) * npages;
> > > > +
> > > > + err =3D gpusvm->ops->populate_vram_pfn(gpusvm, range->vram_alloca=
tion,
> > > > +                                      npages, src);
> > > > + if (err)
> > > > +         goto err_free;
> > > > +
> > > > + err =3D migrate_device_vma_range(gpusvm->mm,
> > > > +                                gpusvm->device_private_page_owner,=
 src,
> > > > +                                npages, range->va.start);
> > > > + if (err)
> > > > +         goto err_free;
> > > > +
> > > > + err =3D drm_gpusvm_migrate_populate_sram_pfn(NULL, npages, src, d=
st, 0);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > +                                    dst, npages, DMA_BIDIRECTIONAL=
);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i)
> > > > +         pages[i] =3D migrate_pfn_to_page(src[i]);
> > > > +
> > > > + err =3D gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages=
);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > +err_finalize:
> > > > + if (err)
> > > > +         drm_gpusvm_migration_put_pages(npages, dst);
> > > > + migrate_device_pages(src, dst, npages);
> > > > + migrate_device_finalize(src, dst, npages);
> > > > + drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages=
,
> > > > +                                DMA_BIDIRECTIONAL);
> > > > +err_free:
> > > > + kvfree(buf);
> > > > +err_out:
> > > > +
> > > > + return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * __drm_gpusvm_migrate_to_sram - Migrate GPU SVM range to SRAM (i=
nternal)
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @vas: Pointer to the VM area structure
> > > > + * @page: Pointer to the page for fault handling (can be NULL)
> > > > + * @start: Start address of the migration range
> > > > + * @end: End address of the migration range
> > > > + *
> > > > + * This internal function performs the migration of the specified =
GPU SVM range
> > > > + * to SRAM. It sets up the migration, populates + dma maps SRAM PF=
Ns, and
> > > > + * invokes the driver-specific operations for migration to SRAM.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +static int __drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +                                 struct vm_area_struct *vas,
> > > > +                                 struct page *page,
> > > > +                                 u64 start, u64 end)
> > > > +{
> > > > + struct migrate_vma migrate =3D {
> > > > +         .vma            =3D vas,
> > > > +         .pgmap_owner    =3D gpusvm->device_private_page_owner,
> > > > +         .flags          =3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > +         .fault_page     =3D page,
> > > > + };
> > > > + unsigned long npages;
> > > > + struct page **pages;
> > > > + dma_addr_t *dma_addr;
> > > > + void *buf;
> > > > + int i, err =3D 0;
> > > > +
> > > > + mmap_assert_locked(gpusvm->mm);
> > > > +
> > > > + /* Corner where VMA area struct has been partially unmapped */
> > > > + if (start < vas->vm_start)
> > > > +         start =3D vas->vm_start;
> > > > + if (end > vas->vm_end)
> > > > +         end =3D vas->vm_end;
> > > > +
> > > > + migrate.start =3D start;
> > > > + migrate.end =3D end;
> > > > + npages =3D npages_in_range(start, end);
> > > > +
> > > > + buf =3D kvcalloc(npages, 2 * sizeof(*migrate.src) + sizeof(*dma_a=
ddr) +
> > > > +                sizeof(*pages), GFP_KERNEL);
> > > > + if (!buf) {
> > > > +         err =3D -ENOMEM;
> > > > +         goto err_out;
> > > > + }
> > > > + dma_addr =3D buf + (2 * sizeof(*migrate.src) * npages);
> > > > + pages =3D buf + (2 * sizeof(*migrate.src) + sizeof(*dma_addr)) * =
npages;
> > > > +
> > > > + migrate.vma =3D vas;
> > > > + migrate.src =3D buf;
> > > > + migrate.dst =3D migrate.src + npages;
> > > > +
> > > > + err =3D migrate_vma_setup(&migrate);
> > > > + if (err)
> > > > +         goto err_free;
> > > > +
> > > > + /* Raced with another CPU fault, nothing to do */
> > > > + if (!migrate.cpages)
> > > > +         goto err_free;
> > > > +
> > > > + err =3D drm_gpusvm_migrate_populate_sram_pfn(vas, npages,
> > > > +                                            migrate.src, migrate.d=
st,
> > > > +                                            start);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + err =3D drm_gpusvm_migrate_map_pages(gpusvm->drm->dev, dma_addr,
> > > > +                                    migrate.dst, npages,
> > > > +                                    DMA_BIDIRECTIONAL);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > + for (i =3D 0; i < npages; ++i)
> > > > +         pages[i] =3D migrate_pfn_to_page(migrate.src[i]);
> > > > +
> > > > + err =3D gpusvm->ops->copy_to_sram(gpusvm, pages, dma_addr, npages=
);
> > > > + if (err)
> > > > +         goto err_finalize;
> > > > +
> > > > +err_finalize:
> > > > + if (err)
> > > > +         drm_gpusvm_migration_put_pages(npages, migrate.dst);
> > > > + migrate_vma_pages(&migrate);
> > > > + migrate_vma_finalize(&migrate);
> > > > + drm_gpusvm_migrate_unmap_pages(gpusvm->drm->dev, dma_addr, npages=
,
> > > > +                                DMA_BIDIRECTIONAL);
> > > > +err_free:
> > > > + kvfree(buf);
> > > > +err_out:
> > > > + mmap_assert_locked(gpusvm->mm);
> > > > +
> > > > + return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_to_sram - Migrate (evict) GPU SVM range to S=
RAM
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @range: Pointer to the GPU SVM range structure
> > > > + * @ctx: GPU SVM context
> > > > + *
> > > > + * This function initiates the migration of the specified GPU SVM =
range to
> > > > + * SRAM. It performs necessary checks and invokes the internal mig=
ration
> > > > + * function for actual migration.
> > > > + *
> > > > + * Returns:
> > > > + * 0 on success, negative error code on failure.
> > > > + */
> > > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +                        struct drm_gpusvm_range *range,
> > > > +                        const struct drm_gpusvm_ctx *ctx)
> > > > +{
> > > > + u64 start =3D range->va.start, end =3D range->va.end;
> > > > + struct mm_struct *mm =3D gpusvm->mm;
> > > > + struct vm_area_struct *vas;
> > > > + int err;
> > > > + bool retry =3D false;
> > > > +
> > > > + if (!ctx->mmap_locked) {
> > > > +         if (!mmget_not_zero(mm)) {
> > > > +                 err =3D -EFAULT;
> > > > +                 goto err_out;
> > > > +         }
> > > > +         if (ctx->trylock_mmap) {
> > > > +                 if (!mmap_read_trylock(mm))  {
> > > > +                         err =3D drm_gpusvm_evict_to_sram(gpusvm, =
range);
> > > > +                         goto err_mmput;
> > > > +                 }
> > > > +         } else {
> > > > +                 mmap_read_lock(mm);
> > > > +         }
> > > > + }
> > > > +
> > > > + mmap_assert_locked(mm);
> > > > +
> > > > + /*
> > > > +  * Loop required to find all VMA area structs for the corner case=
 when
> > > > +  * VRAM backing has been partially unmapped from MM's address spa=
ce.
> > > > +  */
> > > > +again:
> > > > + vas =3D find_vma(mm, start);
> > > > + if (!vas) {
> > > > +         if (!retry)
> > > > +                 err =3D -ENOENT;
> > > > +         goto err_mmunlock;
> > > > + }
> > > > +
> > > > + if (end <=3D vas->vm_start || start >=3D vas->vm_end) {
> > > > +         if (!retry)
> > > > +                 err =3D -EINVAL;
> > > > +         goto err_mmunlock;
> > > > + }
> > > > +
> > > > + err =3D __drm_gpusvm_migrate_to_sram(gpusvm, vas, NULL, start, en=
d);
> > > > + if (err)
> > > > +         goto err_mmunlock;
> > > > +
> > > > + if (vas->vm_end < end) {
> > > > +         retry =3D true;
> > > > +         start =3D vas->vm_end;
> > > > +         goto again;
> > > > + }
> > > > +
> > > > + if (!ctx->mmap_locked) {
> > > > +         mmap_read_unlock(mm);
> > > > +         /*
> > > > +          * Using mmput_async as this function can be called while
> > > > +          * holding a dma-resv lock, and a final put can grab the =
mmap
> > > > +          * lock, causing a lock inversion.
> > > > +          */
> > > > +         mmput_async(mm);
> > > > + }
> > > > +
> > > > + return 0;
> > > > +
> > > > +err_mmunlock:
> > > > + if (!ctx->mmap_locked)
> > > > +         mmap_read_unlock(mm);
> > > > +err_mmput:
> > > > + if (!ctx->mmap_locked)
> > > > +         mmput_async(mm);
> > > > +err_out:
> > > > + return err;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_page_free - Put GPU SVM zone device data associated =
with a page
> > > > + * @page: Pointer to the page
> > > > + *
> > > > + * This function is a callback used to put the GPU SVM zone device=
 data
> > > > + * associated with a page when it is being released.
> > > > + */
> > > > +static void drm_gpusvm_page_free(struct page *page)
> > > > +{
> > > > + drm_gpusvm_zdd_put(page->zone_device_data);
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_migrate_to_ram - Migrate GPU SVM range to RAM (page =
fault handler)
> > > > + * @vmf: Pointer to the fault information structure
> > > > + *
> > > > + * This function is a page fault handler used to migrate a GPU SVM=
 range to RAM.
> > > > + * It retrieves the GPU SVM range information from the faulting pa=
ge and invokes
> > > > + * the internal migration function to migrate the range back to RA=
M.
> > > > + *
> > > > + * Returns:
> > > > + * VM_FAULT_SIGBUS on failure, 0 on success.
> > > > + */
> > > > +static vm_fault_t drm_gpusvm_migrate_to_ram(struct vm_fault *vmf)
> > > > +{
> > > > + struct drm_gpusvm_zdd *zdd =3D vmf->page->zone_device_data;
> > > > + int err;
> > > > +
> > > > + err =3D __drm_gpusvm_migrate_to_sram(zdd->range->gpusvm,
> > > > +                                    vmf->vma, vmf->page,
> > > > +                                    zdd->range->va.start,
> > > > +                                    zdd->range->va.end);
> > > > +
> > > > + return err ? VM_FAULT_SIGBUS : 0;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_pagemap_ops - Device page map operations for GPU SVM
> > > > + */
> > > > +static const struct dev_pagemap_ops drm_gpusvm_pagemap_ops =3D {
> > > > + .page_free =3D drm_gpusvm_page_free,
> > > > + .migrate_to_ram =3D drm_gpusvm_migrate_to_ram,
> > > > +};
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_pagemap_ops_get - Retrieve GPU SVM device page map o=
perations
> > > > + *
> > > > + * Returns:
> > > > + * Pointer to the GPU SVM device page map operations structure.
> > > > + */
> > > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void)
> > > > +{
> > > > + return &drm_gpusvm_pagemap_ops;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_has_mapping - Check if GPU SVM has mapping for the g=
iven address range
> > > > + * @gpusvm: Pointer to the GPU SVM structure.
> > > > + * @start: Start address
> > > > + * @end: End address
> > > > + *
> > > > + * Returns:
> > > > + * True if GPU SVM has mapping, False otherwise
> > > > + */
> > > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, =
u64 end)
> > > > +{
> > > > + struct drm_gpusvm_notifier *notifier;
> > > > +
> > > > + drm_gpusvm_for_each_notifier(notifier, gpusvm, start, end) {
> > > > +         struct drm_gpusvm_range *range =3D NULL;
> > > > +
> > > > +         drm_gpusvm_for_each_range(range, notifier, start, end)
> > > > +                 return true;
> > > > + }
> > > > +
> > > > + return false;
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/drm_gpusvm.h b/drivers/gpu/drm/xe/d=
rm_gpusvm.h
> > > > new file mode 100644
> > > > index 000000000000..0ea70f8534a8
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/drm_gpusvm.h
> > > > @@ -0,0 +1,415 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright =C2=A9 2024 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef __DRM_GPUSVM_H__
> > > > +#define __DRM_GPUSVM_H__
> > > > +
> > > > +#include <linux/kref.h>
> > > > +#include <linux/mmu_notifier.h>
> > > > +#include <linux/workqueue.h>
> > > > +
> > > > +struct dev_pagemap_ops;
> > > > +struct drm_device;
> > > > +struct drm_gpusvm;
> > > > +struct drm_gpusvm_notifier;
> > > > +struct drm_gpusvm_ops;
> > > > +struct drm_gpusvm_range;
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_ops - Operations structure for GPU SVM
> > > > + *
> > > > + * This structure defines the operations for GPU Shared Virtual Me=
mory (SVM).
> > > > + * These operations are provided by the GPU driver to manage SVM r=
anges and
> > > > + * perform operations such as migration between VRAM and system RA=
M.
> > > > + */
> > > > +struct drm_gpusvm_ops {
> > > > + /**
> > > > +  * @notifier_alloc: Allocate a GPU SVM notifier (optional)
> > > > +  *
> > > > +  * This function shall allocate a GPU SVM notifier.
> > > > +  *
> > > > +  * Returns:
> > > > +  * Pointer to the allocated GPU SVM notifier on success, NULL on =
failure.
> > > > +  */
> > > > + struct drm_gpusvm_notifier *(*notifier_alloc)(void);
> > > > +
> > > > + /**
> > > > +  * @notifier_free: Free a GPU SVM notifier (optional)
> > > > +  * @notifier: Pointer to the GPU SVM notifier to be freed
> > > > +  *
> > > > +  * This function shall free a GPU SVM notifier.
> > > > +  */
> > > > + void (*notifier_free)(struct drm_gpusvm_notifier *notifier);
> > > > +
> > > > + /**
> > > > +  * @range_alloc: Allocate a GPU SVM range (optional)
> > > > +  * @gpusvm: Pointer to the GPU SVM
> > > > +  *
> > > > +  * This function shall allocate a GPU SVM range.
> > > > +  *
> > > > +  * Returns:
> > > > +  * Pointer to the allocated GPU SVM range on success, NULL on fai=
lure.
> > > > +  */
> > > > + struct drm_gpusvm_range *(*range_alloc)(struct drm_gpusvm *gpusvm=
);
> > > > +
> > > > + /**
> > > > +  * @range_free: Free a GPU SVM range (optional)
> > > > +  * @range: Pointer to the GPU SVM range to be freed
> > > > +  *
> > > > +  * This function shall free a GPU SVM range.
> > > > +  */
> > > > + void (*range_free)(struct drm_gpusvm_range *range);
> > > > +
> > > > + /**
> > > > +  * @vram_release: Release VRAM allocation (optional)
> > > > +  * @vram_allocation: Driver-private pointer to the VRAM allocatio=
n
> > > > +  *
> > > > +  * This function shall release VRAM allocation and expects to dro=
p a
> > > > +  * reference to VRAM allocation.
> > > > +  */
> > > > + void (*vram_release)(void *vram_allocation);
> > > > +
> > > > + /**
> > > > +  * @populate_vram_pfn: Populate VRAM PFN (required for migration)
> > > > +  * @gpusvm: Pointer to the GPU SVM
> > > > +  * @vram_allocation: Driver-private pointer to the VRAM allocatio=
n
> > > > +  * @npages: Number of pages to populate
> > > > +  * @pfn: Array of page frame numbers to populate
> > > > +  *
> > > > +  * This function shall populate VRAM page frame numbers (PFN).
> > > > +  *
> > > > +  * Returns:
> > > > +  * 0 on success, a negative error code on failure.
> > > > +  */
> > > > + int (*populate_vram_pfn)(struct drm_gpusvm *gpusvm,
> > > > +                          void *vram_allocation,
> > > > +                          unsigned long npages,
> > > > +                          unsigned long *pfn);
> > > > +
> > > > + /**
> > > > +  * @copy_to_vram: Copy to VRAM (required for migration)
> > > > +  * @gpusvm: Pointer to the GPU SVM
> > > > +  * @pages: Pointer to array of VRAM pages (destination)
> > > > +  * @dma_addr: Pointer to array of DMA addresses (source)
> > > > +  * @npages: Number of pages to copy
> > > > +  *
> > > > +  * This function shall copy pages to VRAM.
> > > > +  *
> > > > +  * Returns:
> > > > +  * 0 on success, a negative error code on failure.
> > > > +  */
> > > > + int (*copy_to_vram)(struct drm_gpusvm *gpusvm,
> > > > +                     struct page **pages,
> > > > +                     dma_addr_t *dma_addr,
> > > > +                     unsigned long npages);
> > > > +
> > > > + /**
> > > > +  * @copy_to_sram: Copy to system RAM (required for migration)
> > > > +  * @gpusvm: Pointer to the GPU SVM
> > > > +  * @pages: Pointer to array of VRAM pages (source)
> > > > +  * @dma_addr: Pointer to array of DMA addresses (destination)
> > > > +  * @npages: Number of pages to copy
> > > > +  *
> > > > +  * This function shall copy pages to system RAM.
> > > > +  *
> > > > +  * Returns:
> > > > +  * 0 on success, a negative error code on failure.
> > > > +  */
> > > > + int (*copy_to_sram)(struct drm_gpusvm *gpusvm,
> > > > +                     struct page **pages,
> > > > +                     dma_addr_t *dma_addr,
> > > > +                     unsigned long npages);
> > > > +
> > > > + /**
> > > > +  * @invalidate: Invalidate GPU SVM notifier (required)
> > > > +  * @gpusvm: Pointer to the GPU SVM
> > > > +  * @notifier: Pointer to the GPU SVM notifier
> > > > +  * @mmu_range: Pointer to the mmu_notifier_range structure
> > > > +  *
> > > > +  * This function shall invalidate the GPU page tables. It can saf=
ely
> > > > +  * walk the notifier range RB tree/list in this function. Called =
while
> > > > +  * holding the notifier lock.
> > > > +  */
> > > > + void (*invalidate)(struct drm_gpusvm *gpusvm,
> > > > +                    struct drm_gpusvm_notifier *notifier,
> > > > +                    const struct mmu_notifier_range *mmu_range);
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_notifier - Structure representing a GPU SVM n=
otifier
> > > > + *
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @notifier: MMU interval notifier
> > > > + * @interval: Interval for the notifier
> > > > + * @rb: Red-black tree node for the parent GPU SVM structure notif=
ier tree
> > > > + * @root: Cached root node of the RB tree containing ranges
> > > > + * @range_list: List head containing of ranges in the same order t=
hey appear in
> > > > + *              interval tree. This is useful to keep iterating ra=
nges while
> > > > + *              doing modifications to RB tree.
> > > > + * @flags.removed: Flag indicating whether the MMU interval notifi=
er has been
> > > > + *                 removed
> > > > + *
> > > > + * This structure represents a GPU SVM notifier.
> > > > + */
> > > > +struct drm_gpusvm_notifier {
> > > > + struct drm_gpusvm *gpusvm;
> > > > + struct mmu_interval_notifier notifier;
> > > > + struct {
> > > > +         u64 start;
> > > > +         u64 end;
> > > > + } interval;
> > > > + struct {
> > > > +         struct rb_node node;
> > > > +         struct list_head entry;
> > > > +         u64 __subtree_last;
> > > > + } rb;
> > > > + struct rb_root_cached root;
> > > > + struct list_head range_list;
> > > > + struct {
> > > > +         u32 removed : 1;
> > > > + } flags;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_range - Structure representing a GPU SVM rang=
e
> > > > + *
> > > > + * @gpusvm: Pointer to the GPU SVM structure
> > > > + * @notifier: Pointer to the GPU SVM notifier
> > > > + * @refcount: Reference count for the range
> > > > + * @rb: Red-black tree node for the parent GPU SVM notifier struct=
ure range tree
> > > > + * @va: Virtual address range
> > > > + * @notifier_seq: Notifier sequence number of the range's pages
> > > > + * @pages: Pointer to the array of pages (if backing store is in V=
RAM)
> > > > + * @dma_addr: DMA address array (if backing store is SRAM and DMA =
mapped)
> > > > + * @vram_allocation: Driver-private pointer to the VRAM allocation
> > > > + * @order: Order of dma mapping. i.e. PAGE_SIZE << order is mappin=
g size
> > > > + * @flags.migrate_vram: Flag indicating whether the range can be m=
igrated to VRAM
> > > > + * @flags.unmapped: Flag indicating if the range has been unmapped
> > > > + * @flags.partial_unmap: Flag indicating if the range has been par=
tially unmapped
> > > > + * @flags.has_vram_pages: Flag indicating if the range has vram pa=
ges
> > > > + * @flags.has_dma_mapping: Flag indicating if the range has a DMA =
mapping
> > > > + * @flags.kfree_mapping: Flag indicating @dma_addr is a compact al=
location based
> > > > + *                       on @order which releases via kfree
> > > > + *
> > > > + * This structure represents a GPU SVM range used for tracking mem=
ory ranges
> > > > + * mapped in a DRM device.
> > > > + */
> > > > +struct drm_gpusvm_range {
> > > > + struct drm_gpusvm *gpusvm;
> > > > + struct drm_gpusvm_notifier *notifier;
> > > > + struct kref refcount;
> > > > + struct {
> > > > +         struct rb_node node;
> > > > +         struct list_head entry;
> > > > +         u64 __subtree_last;
> > > > + } rb;
> > > > + struct {
> > > > +         u64 start;
> > > > +         u64 end;
> > > > + } va;
> > > > + unsigned long notifier_seq;
> > > > + union {
> > > > +         struct page **pages;
> > > > +         dma_addr_t *dma_addr;
> > > > + };
> > > > + void *vram_allocation;
> > > > + u16 order;
> > > > + struct {
> > > > +         /* All flags below must be set upon creation */
> > > > +         u16 migrate_vram : 1;
> > > > +         /* All flags below must be set / cleared under notifier l=
ock */
> > > > +         u16 unmapped : 1;
> > > > +         u16 partial_unmap : 1;
> > > > +         u16 has_vram_pages : 1;
> > > > +         u16 has_dma_mapping : 1;
> > > > +         u16 kfree_mapping : 1;
> > > > + } flags;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm - GPU SVM structure
> > > > + *
> > > > + * @name: Name of the GPU SVM
> > > > + * @drm: Pointer to the DRM device structure
> > > > + * @mm: Pointer to the mm_struct for the address space
> > > > + * @device_private_page_owner: Device private pages owner
> > > > + * @mm_start: Start address of GPU SVM
> > > > + * @mm_range: Range of the GPU SVM
> > > > + * @notifier_size: Size of individual notifiers
> > > > + * @ops: Pointer to the operations structure for GPU SVM
> > > > + * @chunk_sizes: Pointer to the array of chunk sizes used in range=
 allocation.
> > > > + *               Entries should be powers of 2 in descending order=
.
> > > > + * @num_chunks: Number of chunks
> > > > + * @notifier_lock: Read-write semaphore for protecting notifier op=
erations
> > > > + * @zdd_wq: Workqueue for deferred work on zdd destruction
> > > > + * @root: Cached root node of the Red-Black tree containing GPU SV=
M notifiers
> > > > + * @notifier_list: list head containing of notifiers in the same o=
rder they
> > > > + *                 appear in interval tree. This is useful to keep=
 iterating
> > > > + *                 notifiers while doing modifications to RB tree.
> > > > + *
> > > > + * This structure represents a GPU SVM (Shared Virtual Memory) use=
d for tracking
> > > > + * memory ranges mapped in a DRM (Direct Rendering Manager) device=
.
> > > > + *
> > > > + * No reference counting is provided, as this is expected to be em=
bedded in the
> > > > + * driver VM structure along with the struct drm_gpuvm, which hand=
les reference
> > > > + * counting.
> > > > + */
> > > > +struct drm_gpusvm {
> > > > + const char *name;
> > > > + struct drm_device *drm;
> > > > + struct mm_struct *mm;
> > > > + void *device_private_page_owner;
> > > > + u64 mm_start;
> > > > + u64 mm_range;
> > > > + u64 notifier_size;
> > > > + const struct drm_gpusvm_ops *ops;
> > > > + const u64 *chunk_sizes;
> > > > + int num_chunks;
> > > > + struct rw_semaphore notifier_lock;
> > > > + struct workqueue_struct *zdd_wq;
> > > > + struct rb_root_cached root;
> > > > + struct list_head notifier_list;
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_gpusvm_ctx - DRM GPU SVM context
> > > > + *
> > > > + * @mmap_locked: mmap lock is locked
> > > > + * @trylock_mmap: trylock mmap lock, used to avoid locking inversi=
ons
> > > > + *                (e.g.dma-revs -> mmap lock)
> > > > + * @in_notifier: entering from a MMU notifier
> > > > + * @read_only: operating on read-only memory
> > > > + * @vram_possible: possible to use VRAM
> > > > + * @prefault: prefault pages
> > > > + *
> > > > + * Context that is DRM GPUSVM is operating in (i.e. user arguments=
).
> > > > + */
> > > > +struct drm_gpusvm_ctx {
> > > > + u32 mmap_locked :1;
> > > > + u32 trylock_mmap :1;
> > > > + u32 in_notifier :1;
> > > > + u32 read_only :1;
> > > > + u32 vram_possible :1;
> > > > + u32 prefault :1;
> > > > +};
> > > > +
> > > > +int drm_gpusvm_init(struct drm_gpusvm *gpusvm,
> > > > +             const char *name, struct drm_device *drm,
> > > > +             struct mm_struct *mm, void *device_private_page_owner=
,
> > > > +             u64 mm_start, u64 mm_range, u64 notifier_size,
> > > > +             const struct drm_gpusvm_ops *ops,
> > > > +             const u64 *chunk_sizes, int num_chunks);
> > > > +void drm_gpusvm_fini(struct drm_gpusvm *gpusvm);
> > > > +void drm_gpusvm_free(struct drm_gpusvm *gpusvm);
> > > > +
> > > > +struct drm_gpusvm_range *
> > > > +drm_gpusvm_range_find_or_insert(struct drm_gpusvm *gpusvm, u64 fau=
lt_addr,
> > > > +                         u64 gpuva_start, u64 gpuva_end,
> > > > +                         const struct drm_gpusvm_ctx *ctx);
> > > > +void drm_gpusvm_range_remove(struct drm_gpusvm *gpusvm,
> > > > +                      struct drm_gpusvm_range *range);
> > > > +
> > > > +struct drm_gpusvm_range *
> > > > +drm_gpusvm_range_get(struct drm_gpusvm_range *range);
> > > > +void drm_gpusvm_range_put(struct drm_gpusvm_range *range);
> > > > +
> > > > +bool drm_gpusvm_range_pages_valid(struct drm_gpusvm *gpusvm,
> > > > +                           struct drm_gpusvm_range *range);
> > > > +
> > > > +int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
> > > > +                        struct drm_gpusvm_range *range,
> > > > +                        const struct drm_gpusvm_ctx *ctx);
> > > > +void drm_gpusvm_range_unmap_pages(struct drm_gpusvm *gpusvm,
> > > > +                           struct drm_gpusvm_range *range,
> > > > +                           const struct drm_gpusvm_ctx *ctx);
> > > > +
> > > > +int drm_gpusvm_migrate_to_vram(struct drm_gpusvm *gpusvm,
> > > > +                        struct drm_gpusvm_range *range,
> > > > +                        void *vram_allocation,
> > > > +                        const struct drm_gpusvm_ctx *ctx);
> > > > +int drm_gpusvm_migrate_to_sram(struct drm_gpusvm *gpusvm,
> > > > +                        struct drm_gpusvm_range *range,
> > > > +                        const struct drm_gpusvm_ctx *ctx);
> > > > +
> > > > +const struct dev_pagemap_ops *drm_gpusvm_pagemap_ops_get(void);
> > > > +
> > > > +bool drm_gpusvm_has_mapping(struct drm_gpusvm *gpusvm, u64 start, =
u64 end);
> > > > +
> > > > +struct drm_gpusvm_range *
> > > > +drm_gpusvm_range_find(struct drm_gpusvm_notifier *notifier, u64 st=
art, u64 end);
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_notifier_lock - Lock GPU SVM notifier
> > > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > > + *
> > > > + * Abstract client usage GPU SVM notifier lock, take lock
> > > > + */
> > > > +#define drm_gpusvm_notifier_lock(gpusvm__)       \
> > > > + down_read(&(gpusvm__)->notifier_lock)
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_notifier_unlock - Unlock GPU SVM notifier
> > > > + * @gpusvm__: Pointer to the GPU SVM structure.
> > > > + *
> > > > + * Abstract client usage GPU SVM notifier lock, drop lock
> > > > + */
> > > > +#define drm_gpusvm_notifier_unlock(gpusvm__)     \
> > > > + up_read(&(gpusvm__)->notifier_lock)
> > > > +
> > > > +/**
> > > > + * __drm_gpusvm_range_next - Get the next GPU SVM range in the lis=
t
> > > > + * @range: a pointer to the current GPU SVM range
> > > > + *
> > > > + * Return: A pointer to the next drm_gpusvm_range if available, or=
 NULL if the
> > > > + *         current range is the last one or if the input range is =
NULL.
> > > > + */
> > > > +static inline struct drm_gpusvm_range *
> > > > +__drm_gpusvm_range_next(struct drm_gpusvm_range *range)
> > > > +{
> > > > + if (range && !list_is_last(&range->rb.entry,
> > > > +                            &range->notifier->range_list))
> > > > +         return list_next_entry(range, rb.entry);
> > > > +
> > > > + return NULL;
> > > > +}
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_for_each_range - Iterate over GPU SVM ranges in a no=
tifier
> > > > + * @range__: Iterator variable for the ranges. If set, it indicate=
s the start of
> > > > + *            the iterator. If NULL, call drm_gpusvm_range_find() =
to get the range.
> > > > + * @notifier__: Pointer to the GPU SVM notifier
> > > > + * @start__: Start address of the range
> > > > + * @end__: End address of the range
> > > > + *
> > > > + * This macro is used to iterate over GPU SVM ranges in a notifier=
. It is safe
> > > > + * to use while holding the driver SVM lock or the notifier lock.
> > > > + */
> > > > +#define drm_gpusvm_for_each_range(range__, notifier__, start__, en=
d__)   \
> > > > + for ((range__) =3D (range__) ?:                                  =
 \
> > > > +      drm_gpusvm_range_find((notifier__), (start__), (end__));   \
> > > > +      (range__) && (range__->va.start < (end__));                \
> > > > +      (range__) =3D __drm_gpusvm_range_next(range__))
> > > > +
> > > > +/**
> > > > + * drm_gpusvm_range_set_unmapped - Mark a GPU SVM range as unmappe=
d
> > > > + * @range: Pointer to the GPU SVM range structure.
> > > > + * @mmu_range: Pointer to the MMU notifier range structure.
> > > > + *
> > > > + * This function marks a GPU SVM range as unmapped and sets the pa=
rtial_unmap flag
> > > > + * if the range partially falls within the provided MMU notifier r=
ange.
> > > > + */
> > > > +static inline void
> > > > +drm_gpusvm_range_set_unmapped(struct drm_gpusvm_range *range,
> > > > +                       const struct mmu_notifier_range *mmu_range)
> > > > +{
> > > > + lockdep_assert_held_write(&range->gpusvm->notifier_lock);
> > > > +
> > > > + range->flags.unmapped =3D true;
> > > > + if (range->va.start < mmu_range->start ||
> > > > +     range->va.end > mmu_range->end)
> > > > +         range->flags.partial_unmap =3D true;
> > > > +}
> > > > +
> > > > +#endif /* __DRM_GPUSVM_H__ */
> > > > --
> > > > 2.34.1
> > > >
> >
