Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE991817B00
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F138810E3BC;
	Mon, 18 Dec 2023 19:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com
 [209.85.210.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A03110E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:27:39 +0000 (UTC)
Received: by mail-ot1-f74.google.com with SMTP id
 46e09a7af769-6da14f8be6aso4126931a34.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 11:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1702927659; x=1703532459;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=DFsibCzDQe/Rw1aQWfU7E5RwiUby8fkVdnpwwig3Neo=;
 b=RGH7tF1fFbYWCZiCDUaq3YODpIOMydj0QHXGegRwViZV8WD2hQ9tBYlm//ucvYhwOn
 rEIdjmYwoAjH7LMAGA28qWpPQ3Bg7uZJmNti3LL4ktOWBcWfU3GbFZntyuFOHetDv4u0
 n0dRYtWcEMAbNov8tue4lAjLxM0lpGJFU0vYMC+Qtx3yz/aE0ZAfEpAFGCLp0h/oHZhF
 4iDvVF4W0t3Cd8Edd8n4To4Q8G18jqhgp+WGIA0982yDGKocsMuiO5hc3Zb4vI7OpMjU
 t2re7c6gu5l6fYBr/J/OEZbV3OFyf3uT30PeBsbFBTkRNO3hjCyTNvIwim/80nFMCWwy
 5Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702927659; x=1703532459;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DFsibCzDQe/Rw1aQWfU7E5RwiUby8fkVdnpwwig3Neo=;
 b=qka/iIYL3rmQ7RTfQKtbRzurwg+QRe5dPHetuDHegKnIjiT8TvT04Pixn8TM/kI6hb
 1OCcrIG9wxmHhYvHuJzcqE4OZcrRSQJ3WbjZyzVTzhB7UiuWVszP4oli7alBZSlh+46V
 aOLm76j/Ng92mwtJ9vUQcc9EXNIVoHvL+X4iOtKnv26bme8v+fcHueu1O3h1TyWdfIuN
 nChql0XDJu9ugd/Ly8cX2ElwqKu45D54MhrZrUdfM29km9fJTIuEXEEn5JaaeQ4jxF3Q
 FkmktqnG7mfvy7+KX0DkZGPO9nrVudLm5tTDVo5/kgfZNnV5Tc6hKMrfDp0hgplJgTBh
 9xmA==
X-Gm-Message-State: AOJu0Yw5TX1aDrqxYfAuoKUW/Tq5iTpYtbRsy7rlgOnJTGe2iSFT6IVW
 GdSZSljeD13PXQgGF3ZsE187pRGrAvE=
X-Google-Smtp-Source: AGHT+IErN8oaxnfxd6s8AsjE60wGoecL/+mAArNG26vHfMWK2rkKF0GaAYihSK2tj6xiOJsmkfCGALdlXpo=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:cce:0:b0:dbc:b62a:98c4 with SMTP id
 e14-20020a5b0cce000000b00dbcb62a98c4mr207688ybr.7.1702912133436; Mon, 18 Dec
 2023 07:08:53 -0800 (PST)
Date: Mon, 18 Dec 2023 07:08:51 -0800
In-Reply-To: <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
Mime-Version: 1.0
References: <20231214103520.7198-1-yan.y.zhao@intel.com>
 <BN9PR11MB5276BE04CBB6D07039086D658C93A@BN9PR11MB5276.namprd11.prod.outlook.com>
Message-ID: <ZXzx1zXfZ6GV9TgI@google.com>
Subject: Re: [RFC PATCH] KVM: Introduce KVM VIRTIO device
From: Sean Christopherson <seanjc@google.com>
To: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, Yan Y Zhao <yan.y.zhao@intel.com>,
 Zhenyu Z Wang <zhenyu.z.wang@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Yiwei Zhang <zzyiwei@google.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "wanpengli@tencent.com" <wanpengli@tencent.com>,
 Yongwei Ma <yongwei.ma@intel.com>, Zhiyuan Lv <zhiyuan.lv@intel.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

+Yiwei

On Fri, Dec 15, 2023, Kevin Tian wrote:
> > From: Zhao, Yan Y <yan.y.zhao@intel.com>
> > Sent: Thursday, December 14, 2023 6:35 PM
> > 
> > - For host non-MMIO pages,
> >   * virtio guest frontend and host backend driver should be synced to use
> >     the same memory type to map a buffer. Otherwise, there will be
> >     potential problem for incorrect memory data. But this will only impact
> >     the buggy guest alone.
> >   * for live migration,
> >     as QEMU will read all guest memory during live migration, page aliasing
> >     could happen.
> >     Current thinking is to disable live migration if a virtio device has
> >     indicated its noncoherent state.
> >     As a follow-up, we can discuss other solutions. e.g.
> >     (a) switching back to coherent path before starting live migration.
> 
> both guest/host switching to coherent or host-only?
> 
> host-only certainly is problematic if guest is still using non-coherent.
> 
> on the other hand I'm not sure whether the host/guest gfx stack is
> capable of switching between coherent and non-coherent path in-fly
> when the buffer is right being rendered.
> 
> >     (b) read/write of guest memory with clflush during live migration.
> 
> write is irrelevant as it's only done in the resume path where the
> guest is not running.
> 
> > 
> > Implementation Consideration
> > ===
> > There is a previous series [1] from google to serve the same purpose to
> > let KVM be aware of virtio GPU's noncoherent DMA status. That series
> > requires a new memslot flag, and special memslots in user space.
> > 
> > We don't choose to use memslot flag to request honoring guest memory
> > type.
> 
> memslot flag has the potential to restrict the impact e.g. when using
> clflush-before-read in migration?

Yep, exactly.  E.g. if KVM needs to ensure coherency when freeing memory back to
the host kernel, then the memslot flag will allow for a much more targeted
operation.

> Of course the implication is to honor guest type only for the selected slot
> in KVM instead of applying to the entire guest memory as in previous series
> (which selects this way because vmx_get_mt_mask() is in perf-critical path
> hence not good to check memslot flag?)

Checking a memslot flag won't impact performance.  KVM already has the memslot
when creating SPTEs, e.g. the sole caller of vmx_get_mt_mask(), make_spte(), has
access to the memslot.

That isn't coincidental, KVM _must_ have the memslot to construct the SPTE, e.g.
to retrieve the associated PFN, update write-tracking for shadow pages, etc.

I added Yiwei, who I think is planning on posting another RFC for the memslot
idea (I actually completely forgot that the memslot idea had been thought of and
posted a few years back).

> > Instead we hope to make the honoring request to be explicit (not tied to a
> > memslot flag). This is because once guest memory type is honored, not only
> > memory used by guest virtio device, but all guest memory is facing page
> > aliasing issue potentially. KVM needs a generic solution to take care of
> > page aliasing issue rather than counting on memory type of a special
> > memslot being aligned in host and guest.
> > (we can discuss what a generic solution to handle page aliasing issue will
> > look like in later follow-up series).
> > 
> > On the other hand, we choose to introduce a KVM virtio device rather than
> > just provide an ioctl to wrap kvm_arch_[un]register_noncoherent_dma()
> > directly, which is based on considerations that
> 
> I wonder it's over-engineered for the purpose.
> 
> why not just introducing a KVM_CAP and allowing the VMM to enable?
> KVM doesn't need to know the exact source of requiring it...

Agreed.  If we end up needing to grant the whole VM access for some reason, just
give userspace a direct toggle.
