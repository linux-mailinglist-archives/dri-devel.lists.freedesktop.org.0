Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EBB164F00
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 20:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80F496EC8D;
	Wed, 19 Feb 2020 19:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2AA6EC8D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 19:36:53 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id c16so1883038ioh.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 11:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wq9tupoisv9mbZ6pEYhyTpZEcWy//yLq2ZAN2dQ2ijM=;
 b=Meky6vvd4oYZY09DvdwQQjgU6CkwFRob0EaEEI3q3ohpna9S8w1bGmm49w8GXdZEPS
 BWkJ3ful0jrtpclZbopK6ot0O4fKjR+YJ2svxRypf66vJssxvAQEe9KVgdEcDKVhOdLR
 8fjIrEuZM4jUbI/3Qlo12kCnnkkBbNtk31ODn4uOGkC9YIAbLvVl88LhmUKZp8uOF9fY
 qDg152BEeokBxQIZPPMl1W+ARMETekjJcBcd+MZbQtVjTKv8lHdfn1IU3DbjgFIYdFhY
 pn/aJmLVKQoJko92zqTBG/YiZjIULXTXBSWHFnZVJoMnWx0ROzeEOunVwcwdoUaCsKlV
 50Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wq9tupoisv9mbZ6pEYhyTpZEcWy//yLq2ZAN2dQ2ijM=;
 b=kgk+p15t2S7iCGGjd2QvuflEFgq0JCiOr4za+zrW1GLB06TSYgxEjBnA/MT7xD1deI
 kMZX3SszMH21Waab7fvBdBZmNVAXTXgEomq8hJazC1DNg2rVMuR+v4zFf20tNxxRg7Uo
 DzDTaD7TR7n5nEfLT7mZKY+0B39aIpAClk+UfORCRpaNP6V618Uev9qS6myeF4M2Pnd0
 gRgb9Srs6Op5qlXCLQOHm6H/DTEwI4o5tGO61d6a/aibzN0mPrmLWYU1/403MNR4vwoo
 i5HBWqgO1qvrQXDYlULYXeCCTDQTQd5qjJgmD3mC6fRthN2qHQdHjjAOiAzSbC2bYymm
 4xww==
X-Gm-Message-State: APjAAAXl7kXzOi4ZOqP9CVdKcvrU3IU71vCQAGNy6yygPtPUT2u/gjeV
 2xD0GmkkE4WymDdD11v0RdKTgKRAdLHWIZyBdyQ=
X-Google-Smtp-Source: APXvYqy/85QpbQO1vmm8lX5sDGs69JYATpUdh7+nbK7268D9rYqQJTFsAsNfHXTM3YHdY8zlXEy1t1MXwbsdu7ZkRyA=
X-Received: by 2002:a5d:8555:: with SMTP id b21mr21048220ios.200.1582141012922; 
 Wed, 19 Feb 2020 11:36:52 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <20200214195229.GF20690@linux.intel.com>
 <CAPaKu7Q4gehyhEgG_Nw=tiZiTh+7A8-uuXq1w4he6knp6NWErQ@mail.gmail.com>
 <CALMp9eRwTxdqxAcobZ7sYbD=F8Kga=jR3kaz-OEYdA9fV0AoKQ@mail.gmail.com>
 <20200214220341.GJ20690@linux.intel.com>
 <d3a6fac6-3831-3b8e-09b6-bfff4592f235@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D78D6F4@SHSMSX104.ccr.corp.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 19 Feb 2020 11:36:42 -0800
Message-ID: <CAPaKu7RyTbuTPf0Tp=0DAD80G-RySLrON8OQsHJzhAYDh7zHuA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] KVM: x86: honor guest memory type
To: "Tian, Kevin" <kevin.tian@intel.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, kvm list <kvm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 1:52 AM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Paolo Bonzini
> > Sent: Wednesday, February 19, 2020 12:29 AM
> >
> > On 14/02/20 23:03, Sean Christopherson wrote:
> > >> On Fri, Feb 14, 2020 at 1:47 PM Chia-I Wu <olvaffe@gmail.com> wrote:
> > >>> AFAICT, it is currently allowed on ARM (verified) and AMD (not
> > >>> verified, but svm_get_mt_mask returns 0 which supposedly means the
> > NPT
> > >>> does not restrict what the guest PAT can do).  This diff would do the
> > >>> trick for Intel without needing any uapi change:
> > >> I would be concerned about Intel CPU errata such as SKX40 and SKX59.
> > > The part KVM cares about, #MC, is already addressed by forcing UC for
> > MMIO.
> > > The data corruption issue is on the guest kernel to correctly use WC
> > > and/or non-temporal writes.
> >
> > What about coherency across live migration?  The userspace process would
> > use cached accesses, and also a WBINVD could potentially corrupt guest
> > memory.
> >
>
> In such case the userspace process possibly should conservatively use
> UC mapping, as if for MMIO regions on a passthrough device. However
> there remains a problem. the definition of KVM_MEM_DMA implies
> favoring guest setting, which could be whatever type in concept. Then
> assuming UC is also problematic. I'm not sure whether inventing another
> interface to query effective memory type from KVM is a good idea. There
> is no guarantee that the guest will use same type for every page in the
> same slot, then such interface might be messy. Alternatively, maybe
> we could just have an interface for KVM userspace to force memory type
> for a given slot, if it is mainly used in para-virtualized scenarios (e.g.
> virtio-gpu) where the guest is enlightened to use a forced type (e.g. WC)?
KVM forcing the memory type for a given slot should work too.  But the
ignore-guest-pat bit seems to be Intel-specific.  We will need to
define how the second-level page attributes combine with the guest
page attributes somehow.

KVM should in theory be able to tell that the userspace region is
mapped with a certain memory type and can force the same memory type
onto the guest.  The userspace does not need to be involved.  But that
sounds very slow?  This may be a dumb question, but would it help to
add KVM_SET_DMA_BUF and let KVM negotiate the memory type with the
in-kernel GPU drivers?


>
> Thanks
> Kevin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
