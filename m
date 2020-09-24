Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29430277329
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 15:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652436E21C;
	Thu, 24 Sep 2020 13:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A046E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:55:02 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id r7so4563737ejs.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u0Wwg44LAJ97oDid02lb/yWA2qTwaA94VroM35bUtxs=;
 b=fz2dCKCM6gYh+e67Fsuthj+EMQFSxTJF23dMNMiOXOgepOQmYJQnfdSExcrz7soelL
 wuGYNZKdLFhitgSzfhEAbih8kf0GQohxFDDfvtCoarw/kIX6KKuAnhbIRVPrjZz+n6q9
 d7WXqr4o/GJuJBLuNSYV3w85Bvj/ZTcO5YksdZItI0/vlU79FujjL8YoTvCEIOFoJTd/
 6vh4w4rlArULZPlhTQxbI54J/EVnN66/GrClQeJzzzAKB5VTq/3tEC1NP2kze3HRI0t1
 MDhjq+kPKXdETW6F6AFWe4S+sh4xowCGkxzQBf/hmAJjVKqUnIt8HIYWV/Xq13aVAWO5
 zV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u0Wwg44LAJ97oDid02lb/yWA2qTwaA94VroM35bUtxs=;
 b=MYw0k2u7sGuJymWZBaOoUTizXB5KurWS5Tkha7El+zff1+KsOKpJQtZ96xaH8GO5f1
 YSrUoTAITR3/oM3iBBqbOAKp/J/k+BBaLSC19BPChIBt77oITZ1/qQWLS94qb3I80jzK
 5sgJXn/+N+UVd88JS3SvbKTuZ3UrrBRizNuvbLxm3UUeZ7tS+TSB1gxOtPLn+mX66QVa
 mleCIKeGKso9JDbkRtutMtHmGx/yRC9g75lwgAR20gTjWoR/18pm5tE5u1E50Z2oZgQq
 6KW61R2HitT5qRivrKS9AM+IinPPEfhiOJOlwZc1ufNJDGvBqJdu1b8mJumu46poFrOc
 IBQg==
X-Gm-Message-State: AOAM5306NZ5qgdik1qfOrwC1BGLI+lmZj0cK/1XF8N5LXQfURBDBpUm4
 OHfxTvMqax2pj/pUNuKAwh7nxv9sHA2jTXVrgvv3fg==
X-Google-Smtp-Source: ABdhPJy+gShDa4M5BCxb6FmTsKMUNxD9KbnGrAI9AWRrw57kRj5wOs7HEgWWpD+B+1/E1a7KpQVWWVvv5CfNF8IG2sw=
X-Received: by 2002:a17:906:8143:: with SMTP id
 z3mr1107180ejw.323.1600955701310; 
 Thu, 24 Sep 2020 06:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <159643094279.4062302.17779410714418721328.stgit@dwillia2-desk3.amr.corp.intel.com>
 <159643100485.4062302.976628339798536960.stgit@dwillia2-desk3.amr.corp.intel.com>
 <a3ad70a2-77a8-d50e-f372-731a8e27c03b@redhat.com>
 <17686fcc-202e-0982-d0de-54d5349cfb5d@oracle.com>
 <9acc6148-72eb-7016-dba9-46fa87ded5a5@redhat.com>
 <CAPcyv4h5GGV3F-0rFY_pyv9Bj8LAkrwXruxGE=K2y9=dA8oDHw@mail.gmail.com>
 <d160c05b-9caa-1ffb-9c01-5bb261c744b5@redhat.com>
In-Reply-To: <d160c05b-9caa-1ffb-9c01-5bb261c744b5@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 24 Sep 2020 06:54:49 -0700
Message-ID: <CAPcyv4jf9fK5oOcROMx=c-3q6aGFp89MNi-+GoZ-dy1gdNTrJw@mail.gmail.com>
Subject: Re: [PATCH v4 11/23] device-dax: Kill dax_kmem_res
To: David Hildenbrand <david@redhat.com>
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
Cc: Pavel Tatashin <pasha.tatashin@soleen.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>, Vishal Verma <vishal.l.verma@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Joao Martins <joao.m.martins@oracle.com>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 12:26 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 23.09.20 23:41, Dan Williams wrote:
> > On Wed, Sep 23, 2020 at 1:04 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 08.09.20 17:33, Joao Martins wrote:
> >>> [Sorry for the late response]
> >>>
> >>> On 8/21/20 11:06 AM, David Hildenbrand wrote:
> >>>> On 03.08.20 07:03, Dan Williams wrote:
> >>>>> @@ -37,109 +45,94 @@ int dev_dax_kmem_probe(struct device *dev)
> >>>>>      * could be mixed in a node with faster memory, causing
> >>>>>      * unavoidable performance issues.
> >>>>>      */
> >>>>> -   numa_node = dev_dax->target_node;
> >>>>>     if (numa_node < 0) {
> >>>>>             dev_warn(dev, "rejecting DAX region with invalid node: %d\n",
> >>>>>                             numa_node);
> >>>>>             return -EINVAL;
> >>>>>     }
> >>>>>
> >>>>> -   /* Hotplug starting at the beginning of the next block: */
> >>>>> -   kmem_start = ALIGN(range->start, memory_block_size_bytes());
> >>>>> -
> >>>>> -   kmem_size = range_len(range);
> >>>>> -   /* Adjust the size down to compensate for moving up kmem_start: */
> >>>>> -   kmem_size -= kmem_start - range->start;
> >>>>> -   /* Align the size down to cover only complete blocks: */
> >>>>> -   kmem_size &= ~(memory_block_size_bytes() - 1);
> >>>>> -   kmem_end = kmem_start + kmem_size;
> >>>>> -
> >>>>> -   new_res_name = kstrdup(dev_name(dev), GFP_KERNEL);
> >>>>> -   if (!new_res_name)
> >>>>> +   res_name = kstrdup(dev_name(dev), GFP_KERNEL);
> >>>>> +   if (!res_name)
> >>>>>             return -ENOMEM;
> >>>>>
> >>>>> -   /* Region is permanently reserved if hotremove fails. */
> >>>>> -   new_res = request_mem_region(kmem_start, kmem_size, new_res_name);
> >>>>> -   if (!new_res) {
> >>>>> -           dev_warn(dev, "could not reserve region [%pa-%pa]\n",
> >>>>> -                    &kmem_start, &kmem_end);
> >>>>> -           kfree(new_res_name);
> >>>>> +   res = request_mem_region(range.start, range_len(&range), res_name);
> >>>>
> >>>> I think our range could be empty after aligning. I assume
> >>>> request_mem_region() would check that, but maybe we could report a
> >>>> better error/warning in that case.
> >>>>
> >>> dax_kmem_range() already returns a memory-block-aligned @range but
> >>> IIUC request_mem_region() isn't checking for that. Having said that
> >>> the returned @res wouldn't be different from the passed range.start.
> >>>
> >>>>>     /*
> >>>>>      * Ensure that future kexec'd kernels will not treat this as RAM
> >>>>>      * automatically.
> >>>>>      */
> >>>>> -   rc = add_memory_driver_managed(numa_node, new_res->start,
> >>>>> -                                  resource_size(new_res), kmem_name);
> >>>>> +   rc = add_memory_driver_managed(numa_node, res->start,
> >>>>> +                                  resource_size(res), kmem_name);
> >>>>> +
> >>>>> +   res->flags |= IORESOURCE_BUSY;
> >>>>
> >>>> Hm, I don't think that's correct. Any specific reason why to mark the
> >>>> not-added, unaligned parts BUSY? E.g., walk_system_ram_range() could
> >>>> suddenly stumble over it - and e.g., similarly kexec code when trying to
> >>>> find memory for placing kexec images. I think we should leave this
> >>>> !BUSY, just as it is right now.
> >>>>
> >>> Agreed.
> >>>
> >>>>>     if (rc) {
> >>>>> -           release_resource(new_res);
> >>>>> -           kfree(new_res);
> >>>>> -           kfree(new_res_name);
> >>>>> +           release_mem_region(range.start, range_len(&range));
> >>>>> +           kfree(res_name);
> >>>>>             return rc;
> >>>>>     }
> >>>>> -   dev_dax->dax_kmem_res = new_res;
> >>>>> +
> >>>>> +   dev_set_drvdata(dev, res_name);
> >>>>>
> >>>>>     return 0;
> >>>>>  }
> >>>>>
> >>>>>  #ifdef CONFIG_MEMORY_HOTREMOVE
> >>>>> -static int dev_dax_kmem_remove(struct device *dev)
> >>>>> +static void dax_kmem_release(struct dev_dax *dev_dax)
> >>>>>  {
> >>>>> -   struct dev_dax *dev_dax = to_dev_dax(dev);
> >>>>> -   struct resource *res = dev_dax->dax_kmem_res;
> >>>>> -   resource_size_t kmem_start = res->start;
> >>>>> -   resource_size_t kmem_size = resource_size(res);
> >>>>> -   const char *res_name = res->name;
> >>>>>     int rc;
> >>>>> +   struct device *dev = &dev_dax->dev;
> >>>>> +   const char *res_name = dev_get_drvdata(dev);
> >>>>> +   struct range range = dax_kmem_range(dev_dax);
> >>>>>
> >>>>>     /*
> >>>>>      * We have one shot for removing memory, if some memory blocks were not
> >>>>>      * offline prior to calling this function remove_memory() will fail, and
> >>>>>      * there is no way to hotremove this memory until reboot because device
> >>>>> -    * unbind will succeed even if we return failure.
> >>>>> +    * unbind will proceed regardless of the remove_memory result.
> >>>>>      */
> >>>>> -   rc = remove_memory(dev_dax->target_node, kmem_start, kmem_size);
> >>>>> -   if (rc) {
> >>>>> -           any_hotremove_failed = true;
> >>>>> -           dev_err(dev,
> >>>>> -                   "DAX region %pR cannot be hotremoved until the next reboot\n",
> >>>>> -                   res);
> >>>>> -           return rc;
> >>>>> +   rc = remove_memory(dev_dax->target_node, range.start, range_len(&range));
> >>>>> +   if (rc == 0) {
> >>>>
> >>>> if (!rc) ?
> >>>>
> >>> Better off would be to keep the old order:
> >>>
> >>>       if (rc) {
> >>>               any_hotremove_failed = true;
> >>>               dev_err(dev, "%#llx-%#llx cannot be hotremoved until the next reboot\n",
> >>>                               range.start, range.end);
> >>>               return;
> >>>       }
> >>>
> >>>       release_mem_region(range.start, range_len(&range));
> >>>       dev_set_drvdata(dev, NULL);
> >>>       kfree(res_name);
> >>>       return;
> >>>
> >>>
> >>>>> +           release_mem_region(range.start, range_len(&range));
> >>>>
> >>>> remove_memory() does a release_mem_region_adjustable(). Don't you
> >>>> actually want to release the *unaligned* region you requested?
> >>>>
> >>> Isn't it what we're doing here?
> >>> (The release_mem_region_adjustable() is using the same
> >>> dax_kmem-aligned range and there's no split/adjust)
> >>>
> >>> Meaning right now (+ parent marked as !BUSY), and if I am understanding
> >>> this correctly:
> >>>
> >>> request_mem_region(range.start, range_len)
> >>>    __request_region(iomem_res, range.start, range_len) -> alloc @parent
> >>> add_memory_driver_managed(parent.start, resource_size(parent))
> >>>    __request_region(parent.start, resource_size(parent)) -> alloc @child
> >>>
> >>> [...]
> >>>
> >>> remove_memory(range.start, range_len)
> >>>  request_mem_region_adjustable(range.start, range_len)
> >>>   __release_region(range.start, range_len) -> remove @child
> >>>
> >>> release_mem_region(range.start, range_len)
> >>>   __release_region(range.start, range_len) -> doesn't remove @parent because !BUSY?
> >>>
> >>> The add/removal of this relies on !BUSY. But now I am wondering if the parent remaining
> >>> unreleased is deliberate even on CONFIG_MEMORY_HOTREMOVE=y.
> >>>
> >>>       Joao
> >>>
> >>
> >> Thinking about it, if we don't set the parent resource BUSY (which is
> >> what I think is the right way of doing things), and don't want to store
> >> the parent resource pointer, we could add something like
> >> lookup_resource() - e.g., lookup_mem_resource() - , however, searching
> >> properly in the whole hierarchy (instead of only the first level), and
> >> traversing down to the last hierarchy. Then it would be as simple as
> >>
> >> remove_memory(range.start, range_len)
> >> res = lookup_mem_resource(range.start);
> >> release_resource(res);
> >
> > Another thought... I notice that you've taught
> > register_memory_resource() a IORESOURCE_MEM_DRIVER_MANAGED special
> > case. Lets just make the assumption of add_memory_driver_managed()
> > that it is the driver's responsibility to mark the range busy before
> > calling, and the driver's responsibility to release the region. I.e.
> > validate (rather than request) that the range is busy in
> > register_memory_resource(), and teach release_memory_resource() to
> > skip releasing the region when the memory is marked driver managed.
> > That would let dax_kmem drop its manipulation of the 'busy' flag which
> > is a layering violation no matter how many comments we put around it.
>
> IIUC, that won't work for virtio-mem, whereby the parent resource spans
> multiple possible (future) add_memory_driver_managed() calls and is
> (just like for kmem) a pure indication to which device memory ranges belong.
>
> For example, when exposing 2GB via a virtio-mem device with max 4GB:
>
> (/proc/iomem)
> 240000000-33fffffff : virtio0
>   240000000-2bfffffff : System RAM (virtio_mem)
>
> And after hotplugging additional 2GB:
>
> 240000000-33fffffff : virtio0
>   240000000-33fffffff : System RAM (virtio_mem)
>
> So marking "virtio0" always BUSY (especially right from the start) would
> be wrong.

I'm not suggesting to busy the whole "virtio" range, just the portion
that's about to be passed to add_memory_driver_managed().

> The assumption is that anything that's IORESOURCE_SYSTEM_RAM
> and IORESOUCE_BUSY is currently added to the system as system RAM (e.g.,
> after add_memory() and friends, or during boot).
>
> I do agree that manually clearing the busy flag is ugly. What we most
> probably want is request_mem_region() that performs similar checks (no
> overlaps with existing BUSY resources), but doesn't set the region busy.
>

I can't see that working without some way to export and hold the
resource lock until some agent can atomically claim the range.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
