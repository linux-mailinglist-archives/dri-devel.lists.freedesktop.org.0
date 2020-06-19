Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE42203035
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B380A6E580;
	Mon, 22 Jun 2020 07:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B29F6E94A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 19:55:40 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id c12so8099068qtq.11
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jun 2020 12:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iG/5poalED/7VvSow3wimfYmMiRP/QtWwEKtwUawqmQ=;
 b=amN9JafWL7REIgsG4g8OIqFlIlTlu1gJ4PcPJxw/L2LrqG+b/m+K9h46XOj035Kkef
 TsRqrMbDxejbLCKISjpgVIvIvH7KHxmqfLRppOe1JNXqfsUFcxa8bn0PHmGiIQh/MjLu
 UuMd6uihuWcp1/Cjglk/qvCxbaToMFKCgnOjW98TkQq1CnFA7XBucfvRktJqaYLyZbJL
 Qy2zeXt+RF9aZKE2Fh7cJ+gITSFerrfdPNhqoA8Ybh6njFwj+0WTTmZp0R2d3r4yQcc7
 0W0chyQB7bKAO0rPcYlw7T6gZe3V/Kuht69pjetjB2C5veX71/wW5Hb5ATTmGDza23KL
 22Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iG/5poalED/7VvSow3wimfYmMiRP/QtWwEKtwUawqmQ=;
 b=o6ZE+AtS7pQZrC0Z5LH+QzHF2SsDaGWzkeb9zJhTUzg4zwEMx3bVcpmEFaizx72P/w
 /lWAqrK5c544TXWy6RHek+Pu1q6N/xj+cS0mEYBE0fb2Dsw9fWp/haGbkegqlF6z/hBp
 ihM26PL8OB39oQBQFxNpdfk23dfqM9iAlDOTbVnTyNFjTxuv/xH6sjVpnExcWDuXW5Lv
 3skohLJ1kdYomc6zZYrusTjo1CJ03kvCf2O8OdPxNnNcIg6ilFEXFGnTbtaku4XlZ9+u
 XhQi8EeqFKclXL+pldfeuxubK/cW8eHazb25lRRjzbDWrKS/lUl9vABpej2ecn/BJEc+
 W55A==
X-Gm-Message-State: AOAM530DbDP34Om5OvfTe0gFAe0+WP+HQP6G0B1sMgLnograzvs+0tvK
 QXjlDOn9IGs9/daXreb3/hD5BA==
X-Google-Smtp-Source: ABdhPJyHrX1Mu0x40IEM5APsAGFiOIM0Ueh1NwUrby9aTJ1iJ4sadbDDvULedBTEjFxxXMxRl6BLIg==
X-Received: by 2002:ac8:4143:: with SMTP id e3mr5021341qtm.28.1592596538972;
 Fri, 19 Jun 2020 12:55:38 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id l127sm620014qkc.117.2020.06.19.12.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 12:55:38 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.93) (envelope-from <jgg@ziepe.ca>)
 id 1jmN6w-00B0jt-2Q; Fri, 19 Jun 2020 16:55:38 -0300
Date: Fri, 19 Jun 2020 16:55:38 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep annotations
Message-ID: <20200619195538.GT6578@ziepe.ca>
References: <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
 <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56008d64-772d-5757-6136-f20591ef71d2@amd.com>
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-rdma <linux-rdma@vger.kernel.org>,
 Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jerome Glisse <jglisse@redhat.com>,
 Thomas Hellstrom <thomas.hellstrom@intel.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 19, 2020 at 03:48:49PM -0400, Felix Kuehling wrote:
> Am 2020-06-19 um 2:18 p.m. schrieb Jason Gunthorpe:
> > On Fri, Jun 19, 2020 at 02:09:35PM -0400, Jerome Glisse wrote:
> >> On Fri, Jun 19, 2020 at 02:23:08PM -0300, Jason Gunthorpe wrote:
> >>> On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:
> >>>
> >>>> The madness is only that device B's mmu notifier might need to wait
> >>>> for fence_B so that the dma operation finishes. Which in turn has to
> >>>> wait for device A to finish first.
> >>> So, it sound, fundamentally you've got this graph of operations across
> >>> an unknown set of drivers and the kernel cannot insert itself in
> >>> dma_fence hand offs to re-validate any of the buffers involved?
> >>> Buffers which by definition cannot be touched by the hardware yet.
> >>>
> >>> That really is a pretty horrible place to end up..
> >>>
> >>> Pinning really is right answer for this kind of work flow. I think
> >>> converting pinning to notifers should not be done unless notifier
> >>> invalidation is relatively bounded. 
> >>>
> >>> I know people like notifiers because they give a bit nicer performance
> >>> in some happy cases, but this cripples all the bad cases..
> >>>
> >>> If pinning doesn't work for some reason maybe we should address that?
> >> Note that the dma fence is only true for user ptr buffer which predate
> >> any HMM work and thus were using mmu notifier already. You need the
> >> mmu notifier there because of fork and other corner cases.
> > I wonder if we should try to fix the fork case more directly - RDMA
> > has this same problem and added MADV_DONTFORK a long time ago as a
> > hacky way to deal with it.
> >
> > Some crazy page pin that resolved COW in a way that always kept the
> > physical memory with the mm that initiated the pin?
> >
> > (isn't this broken for O_DIRECT as well anyhow?)
> >
> > How does mmu_notifiers help the fork case anyhow? Block fork from
> > progressing?
> 
> How much the mmu_notifier blocks fork progress depends, on quickly we
> can preempt GPU jobs accessing affected memory. If we don't have
> fine-grained preemption capability (graphics), the best we can do is
> wait for the GPU jobs to complete. We can also delay submission of new
> GPU jobs to the same memory until the MMU notifier is done. Future jobs
> would use the new page addresses.
> 
> With fine-grained preemption (ROCm compute), we can preempt GPU work on
> the affected adders space to minimize the delay seen by fork.
> 
> With recoverable device page faults, we can invalidate GPU page table
> entries, so device access to the affected pages stops immediately.
> 
> In all cases, the end result is, that the device page table gets updated
> with the address of the copied pages before the GPU accesses the COW
> memory again.Without the MMU notifier, we'd end up with the GPU
> corrupting memory of the other process.

The model here in fork has been wrong for a long time, and I do wonder
how O_DIRECT manages to not be broken too.. I guess the time windows
there are too small to get unlucky.

If you have a write pin on a page then it should not be COW'd into the
fork'd process but copied with the originating page remaining with the
original mm. 

I wonder if there is some easy way to achive that - if that is the
main reason to use notifiers then it would be a better solution.

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
