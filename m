Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F7B247D39
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 06:13:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53BE89D43;
	Tue, 18 Aug 2020 04:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A62489D43
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 04:13:41 +0000 (UTC)
Received: by mail-oo1-xc44.google.com with SMTP id j16so3877549ooc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 21:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7iAwBileJ0G1UKlW/P/oYgHIzA/MbhoX0L3kNhgr4Y=;
 b=MZpTMKJAOi/ZwTMoPnuu79VyaoQ8NV1AomrB5KcKmLuQqw4Gq8Hy5WYphdAqc0hYsY
 X/Ih8+44QRhGnnuXXocdyME33WJL68lqdQgLunmQlY6sUTRc9wXZRcKCodF9nLO163g/
 TEuFORBUW6T28dJimhs8o2E+Szdf26zKm1JQcnxPXArxqURVcJXbwsPRTnO892qcwncu
 totiDS0Yfwwdt4XCvI1vl5LBOFs0denGVEowudiJSbvvAApcIwxMoKm0JdqsXUYnPW0/
 hjOMgTyMcpgIwrxmwfrPDx0RPRn6UatANoSTArnwBxhuUECLqizhdbyZRmBnUh7bj3YM
 VQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7iAwBileJ0G1UKlW/P/oYgHIzA/MbhoX0L3kNhgr4Y=;
 b=ZR5bzYr5a74YF+5Pn2Q2XhK1xXGtV1596sDNydn1GVx2UTVYwIPEmMHf3eLNlID9uk
 ZzSD9YdyJjl/ULqGadDUHfzn16O2vc0tBx1HeFOXN7V23cwXOjMV+URMOiTNG45v0IZY
 YX9kzEb11yNwqweFsYgBfLCp+2sR5sy9dksHZoL6QUSJGW/QV4Uc48DZsCcL0SS5qB62
 ldrhFEWeKY63xyPY29WxlWoKmQXDFzuytlmRfA9Rn9txeyr3T56DaOqTGQ/BAQ1Lj4qN
 uSHWjZV99T4FyqzAQ3Tv86HtuzBNII9UbtmEEMyFnSFHAp24NCIfQ9ETeCN3/i60ppkY
 BBEA==
X-Gm-Message-State: AOAM53078uEwnFCNRizAb1O5Di8vRYG8HdcTwRr2HCyagNX4ikLXOOSi
 37AWKiccUojMG1Xd6ciuwXthbGeRfsYiJ2UCUq4M6A==
X-Google-Smtp-Source: ABdhPJxrYPAakE/ZtJfH+fAqlGcjEntL4sQ9RdVTLtPqOfEPQ9hnBci10bKEX7nrm5jsBFr2C2NAa4HidGM5i4m/hOU=
X-Received: by 2002:a4a:924b:: with SMTP id g11mr13689379ooh.9.1597724020264; 
 Mon, 17 Aug 2020 21:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200816172246.69146-1-ezequiel@collabora.com>
In-Reply-To: <20200816172246.69146-1-ezequiel@collabora.com>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 17 Aug 2020 21:13:28 -0700
Message-ID: <CALAqxLV2kOXUjATTn5Xg6-Rj-U7SVUO0t89MzpRzKFU4v8h5Lg@mail.gmail.com>
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
To: Ezequiel Garcia <ezequiel@collabora.com>
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
Cc: Robert Beckett <bob.beckett@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@st.com>, James Jones <jajones@nvidia.com>,
 Liam Mark <lmark@codeaurora.org>, "Andrew F . Davis" <afd@ti.com>,
 kernel@collabora.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Laura Abbott <labbott@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 16, 2020 at 10:23 AM Ezequiel Garcia <ezequiel@collabora.com> wrote:
>
> This heap is basically a wrapper around DMA-API dma_alloc_attrs,
> which will allocate memory suitable for the given device.
>
> The implementation is mostly a port of the Contiguous Videobuf2
> memory allocator (see videobuf2/videobuf2-dma-contig.c)
> over to the DMA-BUF Heap interface.
>
> The intention of this allocator is to provide applications
> with a more system-agnostic API: the only thing the application
> needs to know is which device to get the buffer for.
>
> Whether the buffer is backed by CMA, IOMMU or a DMA Pool
> is unknown to the application.

My hesitancy here is that the main reason we have DMA BUF Heaps, and
ION before it, was to expose different types of memory allocations to
userspace. The main premise that often these buffers are shared with
multiple devices, which have differing constraints and it is userspace
that best understands the path a buffer will take through a series of
devices. So userspace is best positioned to determine what type of
memory should be allocated to satisfy the various devices constraints
(there were some design attempts to allow DMA BUFs to use multiple
attach with deferred alloc at map time to handle this constraint
solving in-kernel, but it was never adopted in practice).

This however, requires some system specific policy - implemented in
the Android userspace by gralloc which maps "usage" types (device
pipeline flows) to heaps. I liken it to fstab, which helps map mount
points to partitions - it's not going to be the same on every system.

What you seem to be proposing seems a bit contrary to this premise -
Userland doesn't know what type of memory it needs, but given a device
can somehow find the heap it should allocate for? This seems to assume
the buffer is only to be used with a single device?

There was at some point a discussion where folks (maybe it was
DanielV? I can't remember...) suggested having something like a sysfs
device node link from a device to a dma-buf heap chardev. This seems
like it would add a similar behavior as what you're proposing, however
without adding possibly a ton of new device specific heaps to the
/dev/dma_heap/ dir. However, we would potentially need any missing
heap types added first.

> I'm not really expecting this patch to be correct or even
> a good idea, but just submitting it to start a discussion on DMA-BUF
> heap discovery and negotiation.
>
> Given Plumbers is just a couple weeks from now, I've submitted
> a BoF proposal to discuss this, as perhaps it would make
> sense to discuss this live?

I do think it's an interesting idea. I agree that having every driver
implement a dmabuf exporter is a bit silly, but I also think Brian's
point that maybe we need some drm helper functions that provide
similar functionality along with a more standardized device ioctl for
single device allocations might be better.

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
