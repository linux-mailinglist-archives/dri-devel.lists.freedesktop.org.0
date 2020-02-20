Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA79166AB3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 00:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF5F06E0CF;
	Thu, 20 Feb 2020 23:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87DD6E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 23:03:12 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id b15so124966iln.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 15:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JxVlzNJVkCyeMSQKW9npW1RB3SKjuELrNiHYWTlDZDg=;
 b=EsYReQDpvGun4xFsx5A4ahEFsbqsSHgQ5iFq0VbG41xAMq775UfN0JmHV3mEEMptIT
 yOmKqK3Y9aL6QnmrQpqGiOQINGg00W8V9+M74bBx1F4c94K+RHTaLpwBC4fN4M9RBwB9
 lLCtGUEvK/A3JqOLUsR7jNLpegvTu3lXlAF9Bg3jpwuTr2bJ98qv2RZqMTEUYGwXtB9a
 SFmQla2O//M8H7GGj90k1QD6eyKNxjbR20J0KQve5ySKe2zJgCGtxzF6OISytnNZskAj
 rAawV/UwJGm6+ocKOwsCGed+MsWGFrEYOPKfwdXmNxIFSEOEe3UMi0poSWl7y0O9+vh5
 u7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JxVlzNJVkCyeMSQKW9npW1RB3SKjuELrNiHYWTlDZDg=;
 b=YuWBLxmZym3msK7/XabqZC5mf6c8gVEnk6DmTdItzQNGmnX7TY+54csQE9cCxE6VHh
 Vam91N3DjQOmQDzTMy42NrXaf2jMgLoKoCQWbxmeUo88L752Mm/xPNlC0HFNopBcBndL
 EutipP/NC52mnUc8/ZVX2ZxzueqATBwhG2TLYuUC0auVnMv9FvEnXGeHVSzkxWMFsnCW
 QPtFRWyJhXLsFZBj8gSMHwZEcgFkrg1uoT5ZLqYwtxb3T0CJBXHQ3tbdaNpQYycV7pRw
 tFXmYosjWP0rMl0Mk8IitX/n+L0VLWs8E0tfZ/OregY9YpSgcFfBa2urQ9UDIbsoJjXZ
 xXrg==
X-Gm-Message-State: APjAAAVj1ya0fwZChJYVDl4OPSUNR7LLziTBoGpG96p+tlqAxZawiMVu
 JilAC8AVGscw1UExAes3QkgB6iXkt2qh9jWltqE=
X-Google-Smtp-Source: APXvYqzMPuAyNzktcWJra0GFFiZ/suQa3sAPE5wWwOYoVSw9+0TKoBSYPnfllb1LgSXfE2iL0PIQJT28OjARNfuHvQc=
X-Received: by 2002:a92:4a0a:: with SMTP id m10mr32718868ilf.84.1582239792221; 
 Thu, 20 Feb 2020 15:03:12 -0800 (PST)
MIME-Version: 1.0
References: <20200213213036.207625-1-olvaffe@gmail.com>
 <8fdb85ea-6441-9519-ae35-eaf91ffe8741@redhat.com>
 <CAPaKu7T8VYXTMc1_GOzJnwBaZSG214qNoqRr8c7Z4Lb3B7dtTg@mail.gmail.com>
 <b82cd76c-0690-c13b-cf2c-75d7911c5c61@redhat.com>
 <CAPaKu7TDtFwF5czdpke1v7NWKf61kw_jVp-E1qQPqs-qbZYnMw@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78D724@SHSMSX104.ccr.corp.intel.com>
 <CAPaKu7Qa6yzRxB10ufNxu+F5S3_GkwofKCm66aB9H4rdWj8fFQ@mail.gmail.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D78EEA2@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D78EEA2@SHSMSX104.ccr.corp.intel.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 20 Feb 2020 15:02:59 -0800
Message-ID: <CAPaKu7SMn22z0NPCt080fujt+OEt4n-fREyTud6584jySGOFpA@mail.gmail.com>
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
Cc: "wanpengli@tencent.com" <wanpengli@tencent.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, "Christopherson,
 Sean J" <sean.j.christopherson@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "jmattson@google.com" <jmattson@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2020 at 6:13 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> > > Curious... How is such slot exposed to the guest? A reserved memory
> > > region? Is it static or might be dynamically added?
> > The plan is for virtio-gpu device to reserve a huge memory region in
> > the guest.  Memslots may be added dynamically or statically to back
> > the region.
>
> so the region is marked as E820_RESERVED to prevent guest kernel
> from using it for other purpose and then virtio-gpu device will report
> virtio-gpu driver of the exact location of the region through its own
> interface?
The current plan is that the virtio-gpu device will have a bar for the
region, which is like the vram aperture on real GPUs.  The virtio-gpu
driver manages the region like managing vram.

When the guest userspace allocates from vram, the guest kernel
reserves an unused range from the region and tells the host the
offset.  The host allocates a real GPU buffer, maps the buffer, and
add a memslot with gpa==bar_base+offset (or mremap).  When the guest
userspace mmap, the guest kernel does a io_remap_pfn_range.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
