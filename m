Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70943635F8F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 14:28:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E3B10E556;
	Wed, 23 Nov 2022 13:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CD610E557
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 13:28:40 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id h7so11514017qvs.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 05:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7jP5JkUAzhr8sdoQa11afBC1SfNPGIbOYpHGrmxYRFs=;
 b=LpbFRrE4jG0rar+gE8VDxsymFPxcx5lFSbojrbcZCgN0qZUiNoRcvAbDA3lzqxg1Er
 IJ3aGdMgaygpFNdREcTLqDkL4i6QOFYKeuYSzxaPfOpGKSxXgqw/9eqJSJAFtR+09q90
 nj7HAbt1xob7s+rz8RHH5lUpt1d31g/oOesxxPIUT2Fo/pyhcFU6/2QEeY1GO1eajpX7
 Po2VxliqXqZYNBElUP9B0f8GSgFr1JLu6IcAHbprkLWIq54uYtNiOR7zjOeb7TorxUwv
 UK6pHtxz9kBK0YIdgwrmR4pad9ghjyutd+Trk6LRLcqnkS7wu6R6he2cvHIFnOtjhGnt
 PnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7jP5JkUAzhr8sdoQa11afBC1SfNPGIbOYpHGrmxYRFs=;
 b=4sPXVDboK5lKjxOl2FJJKMJydNxhbQ0KBpJJlWZzTudA34RsUTOyghHA6uZJ0u+gut
 X3dOwU4OLHEsqZz1iJCqC7AXWr47yCPfIocGQZQYcWeVmEzFG/bW2KnmYLuYSfBH1Ir3
 KYBoEB2Ep6BOk7UjZVjjaLBtOhKF1vf5hplKYxMD2D3GctG+TjGv4SwxVLxYzvaW6tci
 05VC5AfqBl3Fio9lzEbF39Njnm+xVbsmrLaDz7NX/JN2UGmPtRW7HWkWlPdiF6jUbHP0
 UhdDvmzJmmy6fRh+85NUoHkagetJwsGqii/w0hxPo078oHYVgWegEAAHsowcWh7ENrnm
 CraA==
X-Gm-Message-State: ANoB5pkfEE4+K9AS5fCLSpnJBcs/UaMgtbHCTjVf/CeV4sOAUeRZqDkH
 qzyPFcGb8oBN69BNTwcDOzYmrw==
X-Google-Smtp-Source: AA0mqf462TGanlMhxGWROZqgtGQB3JrB9BVj6FCWo4SuHXfM/T0EjluDwPz4UJ7NSsgeXNKFzrl93g==
X-Received: by 2002:a0c:ee64:0:b0:4bb:71ce:d936 with SMTP id
 n4-20020a0cee64000000b004bb71ced936mr14762064qvs.119.1669210119759; 
 Wed, 23 Nov 2022 05:28:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 c8-20020ac853c8000000b003972790deb9sm9796561qtq.84.2022.11.23.05.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 05:28:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxpnp-00AK8S-O1;
 Wed, 23 Nov 2022 09:28:37 -0400
Date: Wed, 23 Nov 2022 09:28:37 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y34gBUl0m+j1JdFk@ziepe.ca>
References: <Y30kK6dsssSLJVgp@ziepe.ca>
 <CAKMK7uFQQkG82PzuSTGQTnN3ZNps5N_4TjR5NRWo0LaJkEaNew@mail.gmail.com>
 <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 02:12:25PM +0100, Christian König wrote:
> Am 23.11.22 um 13:53 schrieb Jason Gunthorpe:
> > On Wed, Nov 23, 2022 at 01:49:41PM +0100, Christian König wrote:
> > > Am 23.11.22 um 13:46 schrieb Jason Gunthorpe:
> > > > On Wed, Nov 23, 2022 at 11:06:55AM +0100, Daniel Vetter wrote:
> > > > 
> > > > > > Maybe a GFP flag to set the page reference count to zero or something
> > > > > > like this?
> > > > > Hm yeah that might work. I'm not sure what it will all break though?
> > > > > And we'd need to make sure that underflowing the page refcount dies in
> > > > > a backtrace.
> > > > Mucking with the refcount like this to protect against crazy out of
> > > > tree drives seems horrible..
> > > Well not only out of tree drivers. The intree KVM got that horrible
> > > wrong as well, those where the latest guys complaining about it.
> > kvm was taking refs on special PTEs? That seems really unlikely?
> 
> Well then look at this code here:
> 
> commit add6a0cd1c5ba51b201e1361b05a5df817083618
> Author: Paolo Bonzini <pbonzini@redhat.com>
> Date:   Tue Jun 7 17:51:18 2016 +0200
> 
>     KVM: MMU: try to fix up page faults before giving up
> 
>     The vGPU folks would like to trap the first access to a BAR by setting
>     vm_ops on the VMAs produced by mmap-ing a VFIO device.  The fault
> handler
>     then can use remap_pfn_range to place some non-reserved pages in the
> VMA.
> 
>     This kind of VM_PFNMAP mapping is not handled by KVM, but follow_pfn
>     and fixup_user_fault together help supporting it.  The patch also
> supports
>     VM_MIXEDMAP vmas where the pfns are not reserved and thus subject to
>     reference counting.
> 
>     Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>
>     Cc: Andrea Arcangeli <aarcange@redhat.com>
>     Cc: Radim Krčmář <rkrcmar@redhat.com>
>     Tested-by: Neo Jia <cjia@nvidia.com>
>     Reported-by: Kirti Wankhede <kwankhede@nvidia.com>
>     Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

This patch is known to be broken in so many ways. It also has a major
security hole that it ignores the PTE flags making the page
RO. Ignoring the special bit is somehow not surprising :(

This probably doesn't work, but is the general idea of what KVM needs
to do:

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1376a47fedeedb..4161241fc3228c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2598,6 +2598,19 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
 			return r;
 	}
 
+	/*
+	 * Special PTEs are never convertible into a struct page, even if the
+	 * driver that owns them might have put a PFN with a struct page into
+	 * the PFNMAP. If the arch doesn't support special then we cannot
+	 * safely process these pages.
+	 */
+#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
+	if (pte_special(*ptep))
+		return -EINVAL;
+#else
+	return -EINVAL;
+#endif
+
 	if (write_fault && !pte_write(*ptep)) {
 		pfn = KVM_PFN_ERR_RO_FAULT;
 		goto out;

Jason
