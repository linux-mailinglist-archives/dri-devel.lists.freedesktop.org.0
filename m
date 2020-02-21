Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5416865D
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 19:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED966E045;
	Fri, 21 Feb 2020 18:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 917AA6E045
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 18:21:34 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z16so3326945iod.11
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 10:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h2/tY31KvdEHkqWAg2p+mm1CnUq0+3yLXkZ2NK3BWHQ=;
 b=C6eR1dr1FNmRvZk07yYEY0LpAexETOWR0Pim+YVF1x0vKNfG/Pfznhu3A0xpRlJMTn
 giHkoa89Yqn8z1AowYaU5bU0R9J2oqtb4YGPtTW7MHH3/jgkPx2FtS7lh9T1Ypt+y7ya
 iI8erWDs5IlY1LRZEcyc8Ob2LZKkqimYsy+huVLNJYmMP1PBHKxxCRBGB6vvPQCPtp83
 diZD+pgRizHtnYJ2p+0JetpmfmNkZppps1qndmEqbdLxzJ+8Aj9woYVsII4kQ30ezUCb
 NjzRtQj8mjqUto8317d+lMqFAj5xIwHLTTgET+LSL8Zm3dhP6kWEyMMXt0hJ+O6ZJAyG
 bt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h2/tY31KvdEHkqWAg2p+mm1CnUq0+3yLXkZ2NK3BWHQ=;
 b=YUZ++1xfYYtHkOfUJGp2eZwxvRA36Yw1qmPPZogKB6PTu4X6HkIbPCVtQ/1gOnu8qH
 CK7z+FP+oCrZLfkyikzzTEp0h0prSnNhro9p43pC/aVx/Sltq0V/HSg7Lx/+RW6ZbXjt
 6kU5uSBx6e36CvKVlFBmtC4zHfBOkTzXos9K8H0VxQKhbDitERQPMhik4gRDOvWVFV3s
 521aLWRUM9Rb5wgnOuo0XZ0EOrX/P11NjtzQnvi9jPgMIV8ZymHjjs2HlxUravaZW51a
 rIL8cYe1oktRJZnauBZ8YxpqFMcwhCG5SwozRtayYtVWtlP0D/UXftzKciEvJIPvuq4j
 KM8w==
X-Gm-Message-State: APjAAAUr+eK0LQAQ9sqOKnuu7jngneOn/wplhkWEF2iboWA1yLj2c7+Q
 eU17nX5A1W9sqWYFNzAagoOwnqaYrU2+HQcZrgk=
X-Google-Smtp-Source: APXvYqz3j7Me+R1emvTJUqws95Sea5km5mXkFq1WlPD7FhlxBiJK+mvIOOBTUkKOmG8oZSw965ixWRtARwmKGeEfSe0=
X-Received: by 2002:a02:a14f:: with SMTP id m15mr33224051jah.16.1582309293658; 
 Fri, 21 Feb 2020 10:21:33 -0800 (PST)
MIME-Version: 1.0
References: <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RyTbuTPf0Tp=0DAD80G-RySLrON8OQsHJzhAYDh7zHuA@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EE65@SHSMSX104.ccr.corp.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EF58@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RFY3nar9hmAdx6RYdZFPK3Cdg1O3cS+OvsEOT=yupyrQ@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D792415@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7RHu5rz1Dvkvp4SDrZ0fAYq37xwRqUsdAiOmRTOz2sFTw@mail.gmail.com>
 <CAPaKu7RaF3+amPwdVBLj6q1na7JWUYuuWDN5XPwNYFB8Hpqi+w@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D79359E@SHSMSX104.ccr.corp.intel.com>
 <20200221155939.GG12665@linux.intel.com>
In-Reply-To: <20200221155939.GG12665@linux.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 21 Feb 2020 10:21:22 -0800
Message-ID: <CAPaKu7Qjnur=ntTXmGn7L38UaCoNjf6avWBk7xTvO6eDkZbWFQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: Sean Christopherson <sean.j.christopherson@intel.com>
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Wanpeng Li <wanpengli@tencent.com>,
 kvm list <kvm@vger.kernel.org>, Joerg Roedel <joro@8bytes.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 7:59 AM Sean Christopherson
<sean.j.christopherson@intel.com> wrote:
>
> On Thu, Feb 20, 2020 at 09:39:05PM -0800, Tian, Kevin wrote:
> > > From: Chia-I Wu <olvaffe@gmail.com>
> > > Sent: Friday, February 21, 2020 12:51 PM
> > > If you think it is the best for KVM to inspect hva to determine the memory
> > > type with page granularity, that is reasonable and should work for us too.
> > > The userspace can do something (e.g., add a GPU driver dependency to the
> > > hypervisor such that the dma-buf is imported as a GPU memory and mapped
> > > using
> > > vkMapMemory) or I can work with dma-buf maintainers to see if dma-buf's
> > > semantics can be changed.
> >
> > I think you need consider the live migration requirement as Paolo pointed out.
> > The migration thread needs to read/write the region, then it must use the
> > same type as GPU process and guest to read/write the region. In such case,
> > the hva mapped by Qemu should have the desired type as the guest. However,
> > adding GPU driver dependency to Qemu might trigger some concern. I'm not
> > sure whether there is generic mechanism though, to share dmabuf fd between GPU
> > process and Qemu while allowing Qemu to follow the desired type w/o using
> > vkMapMemory...
>
> Alternatively, KVM could make KVM_MEM_DMA and KVM_MEM_LOG_DIRTY_PAGES
> mutually exclusive, i.e. force a transition to WB memtype for the guest
> (with appropriate zapping) when migration is activated.  I think that
> would work?
Hm, virtio-gpu does not allow live migration when the 3D function
(virgl=on) is enabled.  This is the relevant code in qemu:

    if (virtio_gpu_virgl_enabled(g->conf)) {
        error_setg(&g->migration_blocker, "virgl is not yet migratable");

Although we (virtio-gpu and virglrenderer projects) plan to make host
GPU buffers available to the guest via memslots, those buffers should
be considered a part of the "GPU state".  The migration thread should
work with virglrenderer and let virglrenderer save/restore them, if
live migration is to be supported.

QEMU depends on GPU drivers already when configured with
--enable-virglrenderer.  There is vhost-user-gpu that can move the
dependency to a GPU process.  But there are still going to be cases
(e.g., nVidia's proprietary driver does not support dma-buf) where
QEMU cannot avoid GPU driver dependency.




> > Note this is orthogonal to whether introducing a new uapi or implicitly checking
> > hva to favor guest memory type. It's purely about Qemu itself. Ideally anyone
> > with the desire to access a dma-buf object should follow the expected semantics.
> > It's interesting that dma-buf sub-system doesn't provide a centralized
> > synchronization about memory type between multiple mmap paths.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
