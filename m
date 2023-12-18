Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE2C817989
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F36C10E147;
	Mon, 18 Dec 2023 18:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6600A10E293
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:21:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-40c3963f9fcso2535e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702923698; x=1703528498;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DPggsM3NCSPNHuDW6MYkybcIgkppTmiteb7qARs7Z58=;
 b=WdaebPxsrxcTM98/XAlbzivvUc/tZ4sQPZLrRcAPl5FsINKpvFbcNK4oSIw8390BLt
 fOCiHlf1CAVnEIaPwsQyQ0kc+0JJMSY6Ku9/FvuPW9zyrxHpysdHBNrc6LV+irT+r7Ni
 5kzosHA1vbFDclSjZ+aiyUNIG1OsNzOLxFC4MTEFsbUDJqipmfEhZUCcYUnWlFnS8X0G
 ubL8ZJ75aLMSMNByzZiB3bvUCK/TZjgnQlTCVbLK4njn7cJTD8mw4sFkgjemWCPUSZLN
 z0ZOjuuw2HAYc2x5TyKKktc42g0j9OZLunfVtQ8EO8Al6RvCUWrbv2wz1G75kZ0cUkof
 d2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702923698; x=1703528498;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPggsM3NCSPNHuDW6MYkybcIgkppTmiteb7qARs7Z58=;
 b=Iqt5R/6GsYZLWEqUgYKrxqbDnQ1YwGW3mmR1QGxU9RzvJDvCoI+R8DgXZHqjEznM0X
 DAiWyHFjdrHPfhH3hrdVc5Rn1W29oeaBudlpUccB1gzD4nR5G2FFxIDmpfeiIv08eJtS
 szJBNEhLEz2EObbSwkE8QMaIl1Rl8kkyQDz9T1pt1oSPtNJuzxS5PpTisDasymcDSKjG
 C7QA6lbNsDdopjFsq9qLeOxI3kgb0FKNGPs79HFwIsuIlX8cgG9Ga2GKDYHklqEM/5Lg
 oUlrUnZO8EkYjXHSMwU5d73UZFLxU8r1pwtq+mPKMInvDnUHESIBvqiJI7yeCuo8yLPC
 /6sg==
X-Gm-Message-State: AOJu0Ywc3doChAPfGz2aO3X0DCpTx6i+D09MWiA3j5o5WNQt2q/Ppv2E
 WpYWMjrTVmVkrqFGtZ9gFQi8cKDlHgFphaCD6A4jF1goJFfl+NXobjv06d+5
X-Google-Smtp-Source: AGHT+IEEzb76/Ah4Nlk8QgfziJRiEwlA6qkmZn/0hGHqfDBA43ntvwLYD5q36eVD4juH+vKRnm9fEY94vwSvJAHuo1g=
X-Received: by 2002:a50:9e49:0:b0:553:62b4:5063 with SMTP id
 z67-20020a509e49000000b0055362b45063mr16629ede.4.1702923263119; Mon, 18 Dec
 2023 10:14:23 -0800 (PST)
MIME-Version: 1.0
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
 <ZXzx1zXfZ6GV9TgI@google.com>
In-Reply-To: <ZXzx1zXfZ6GV9TgI@google.com>
From: Yiwei Zhang <zzyiwei@google.com>
Date: Mon, 18 Dec 2023 10:14:09 -0800
Message-ID: <CAKT=dDnMaX=sxU5i=tdPDB5Wpw6TQUVrUL-JJYD3xrgxEE=acw@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
To: Sean Christopherson <seanjc@google.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Yan Y Zhao <yan.y.zhao@intel.com>,
 Zhenyu Z Wang <zhenyu.z.wang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 Yongwei Ma <yongwei.ma@intel.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +Yiwei
>
> On Fri, Dec 15, 2023, Kevin Tian wrote:
> > > From: Zhao, Yan Y <yan.y.zhao@intel.com>
> > > Sent: Thursday, December 14, 2023 6:35 PM
> > >
> > > - For host non-MMIO pages,
> > >   * virtio guest frontend and host backend driver should be synced to use
> > >     the same memory type to map a buffer. Otherwise, there will be
> > >     potential problem for incorrect memory data. But this will only impact
> > >     the buggy guest alone.
> > >   * for live migration,
> > >     as QEMU will read all guest memory during live migration, page aliasing
> > >     could happen.
> > >     Current thinking is to disable live migration if a virtio device has
> > >     indicated its noncoherent state.
> > >     As a follow-up, we can discuss other solutions. e.g.
> > >     (a) switching back to coherent path before starting live migration.
> >
> > both guest/host switching to coherent or host-only?
> >
> > host-only certainly is problematic if guest is still using non-coherent.
> >
> > on the other hand I'm not sure whether the host/guest gfx stack is
> > capable of switching between coherent and non-coherent path in-fly
> > when the buffer is right being rendered.
> >
> > >     (b) read/write of guest memory with clflush during live migration.
> >
> > write is irrelevant as it's only done in the resume path where the
> > guest is not running.
> >
> > >
> > > Implementation Consideration
> > > ===
> > > There is a previous series [1] from google to serve the same purpose to
> > > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > > requires a new memslot flag, and special memslots in user space.
> > >
> > > We don't choose to use memslot flag to request honoring guest memory
> > > type.
> >
> > memslot flag has the potential to restrict the impact e.g. when using
> > clflush-before-read in migration?
>
> Yep, exactly.  E.g. if KVM needs to ensure coherency when freeing memory back to
> the host kernel, then the memslot flag will allow for a much more targeted
> operation.
>
> > Of course the implication is to honor guest type only for the selected slot
> > in KVM instead of applying to the entire guest memory as in previous series
> > (which selects this way because vmx_get_mt_mask() is in perf-critical path
> > hence not good to check memslot flag?)
>
> Checking a memslot flag won't impact performance.  KVM already has the memslot
> when creating SPTEs, e.g. the sole caller of vmx_get_mt_mask(), make_spte(), has
> access to the memslot.
>
> That isn't coincidental, KVM _must_ have the memslot to construct the SPTE, e.g.
> to retrieve the associated PFN, update write-tracking for shadow pages, etc.
>
> I added Yiwei, who I think is planning on posting another RFC for the memslot
> idea (I actually completely forgot that the memslot idea had been thought of and
> posted a few years back).

We've deferred to Yan (Intel side) to drive the userspace opt-in. So
it's up to Yan to
revise the series to be memslot flag based. I'm okay with what
upstream folks think
to be safer for the opt-in. Thanks!

> > > Instead we hope to make the honoring request to be explicit (not tied to a
> > > memslot flag). This is because once guest memory type is honored, not only
> > > memory used by guest virtio device, but all guest memory is facing page
> > > aliasing issue potentially. KVM needs a generic solution to take care of
> > > page aliasing issue rather than counting on memory type of a special
> > > memslot being aligned in host and guest.
> > > (we can discuss what a generic solution to handle page aliasing issue will
> > > look like in later follow-up series).
> > >
> > > On the other hand, we choose to introduce a KVM virtio device rather than
> > > just provide an ioctl to wrap kvm_arch_[un]register_noncoherent_dma()
> > > directly, which is based on considerations that
> >
> > I wonder it's over-engineered for the purpose.
> >
> > why not just introducing a KVM_CAP and allowing the VMM to enable?
> > KVM doesn't need to know the exact source of requiring it...
>
> Agreed.  If we end up needing to grant the whole VM access for some reason, just
> give userspace a direct toggle.
