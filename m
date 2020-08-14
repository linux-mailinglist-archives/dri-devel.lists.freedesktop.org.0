Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D2D244F03
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 21:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A26F6EC10;
	Fri, 14 Aug 2020 19:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C539D6EC0E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 19:57:34 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id v21so8489928otj.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=/HUkdNM84ljYVpfdQwsu/yQY6q4YRBxXm3BX9/rPigE=;
 b=GAvytVLoP1qHrSPjrY7AvPriL14EDS2LCXNorZdppdkMv6K/LZxo1h/EuzLi3SXVNi
 M6CS7DnFvAbtqX+J63O3C1V6T9+yKxrKLzx/qaF9zojFvtZ8gB2P5UK68H33Hph3w1cP
 dr0yOx7Q3ZzaJoXZYJrk8JcCCA9mJ1SGOKUITcQlZtslndFbmIqY5xDddbNqu0KwQmHn
 g7lYfVLtQMLwcrAPGlizolRKf6l8oAHACQ+K7IqCHagXujF9UeIYMDCY+YvAWGTADUPH
 YDzE5+swXhEtYXl2xOwaJ2MLIJ1aXEFutNfWQSZTIwGLAoDuMWsi8fyNc7BLEg2HknkV
 xG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=/HUkdNM84ljYVpfdQwsu/yQY6q4YRBxXm3BX9/rPigE=;
 b=egrL8+q8HAhaDZVUXKkis0OzOIRCpV6Xy3RuJjgR7E18Y0v56xQrdCdAo1rlnDk+JZ
 guNyEExRVZpeavz0fNypHNLRJmI8rntfsf2Y1xyr8BcrfAOfz/wcGcuwwaTkziv71CM0
 XgjutyninJiUv8k5NJfbichFV5h8mK8Q5LIDMollcgm4x3imlbWnrlVHePQeNbuADgWG
 7VbTkyLYn3tkqR5gbX9EBYxNP1KxDCtjyUKw5b32DEkg+mLpxlF+eigeK7FtQq0Y3oFz
 9eNRPPKuuIBHAW6JQbDR4HXHlqDnjeA4VHJU/CKwFzKfu9SuVK46gqjOYwUrioc1dO9s
 wq/Q==
X-Gm-Message-State: AOAM530/OKvzVQKb5HfkNIYHTqcG0Y9dkN4GlVgCwyFQ9Hb69bigEASq
 Aur0+fNt0/ptEQpsMdiEkldQK5yb75s6Mzi2iyLqlg==
X-Google-Smtp-Source: ABdhPJzaxdfMlB6Bm1WN+v5lpzzD5kVu7pW83mo4jMtukonjI/VP7GLaCaH0UsUwHhBd8Q1OWNYhXdAlBVPuN5eETs4=
X-Received: by 2002:a05:6830:3196:: with SMTP id
 p22mr3306479ots.102.1597435054060; 
 Fri, 14 Aug 2020 12:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200814062458.53049-1-john.stultz@linaro.org>
 <20200814062458.53049-2-john.stultz@linaro.org>
 <20200814091713.GO2352366@phenom.ffwll.local>
In-Reply-To: <20200814091713.GO2352366@phenom.ffwll.local>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 14 Aug 2020 12:57:22 -0700
Message-ID: <CALAqxLV6pRJRrZOZm0iMxNxCua2+_YQM9YC91UkQboRagRb98g@mail.gmail.com>
Subject: Re: [RFC][PATCH v2 2/2] dma-heap: Add a system-uncached heap
To: John Stultz <john.stultz@linaro.org>, lkml <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 Liam Mark <lmark@codeaurora.org>, 
 "Andrew F . Davis" <afd@ti.com>, Laura Abbott <labbott@kernel.org>,
 Hridya Valsaraju <hridya@google.com>, 
 Robin Murphy <robin.murphy@arm.com>, linux-media@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 14, 2020 at 2:17 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Aug 14, 2020 at 06:24:58AM +0000, John Stultz wrote:
> > This adds a heap that allocates non-contiguous buffers that are
> > marked as writecombined, so they are not cached by the CPU.
> >
> > This is useful, as most graphics buffers are usually not touched
> > by the CPU or only written into once by the CPU. So when mapping
> > the buffer over and over between devices, we can skip the CPU
> > syncing, which saves a lot of cache management overhead, greatly
> > improving performance.
> >
> > For folk using ION, there was a ION_FLAG_CACHED flag, which
> > signaled if the returned buffer should be CPU cacheable or not.
> > With DMA-BUF heaps, we have no such flag, and by default the
> > current heaps (system and cma) produce CPU cachable buffers.
> > So for folks transitioning from ION to DMA-BUF Heaps, this fills
> > in some of that missing functionality.
> >
> > This does have a few "ugly" bits that were required to get
> > the buffer properly flushed out initially which I'd like to
> > improve. So feedback would be very welcome!
> >
> > Many thanks to Liam Mark for his help to get this working.
> >
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Andrew F. Davis <afd@ti.com>
> > Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> > Cc: Liam Mark <lmark@codeaurora.org>
> > Cc: Laura Abbott <labbott@kernel.org>
> > Cc: Brian Starkey <Brian.Starkey@arm.com>
> > Cc: Hridya Valsaraju <hridya@google.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: linux-media@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> > v2:
> > * Fix build issue on sh reported-by: kernel test robot <lkp@intel.com>
> > * Rework to use for_each_sgtable_sg(), dma_map_sgtable(), and
> >   for_each_sg_page() along with numerous other cleanups suggested
> >   by Robin Murphy
>
> Mildly annoying me, but where's the userspace for this? Do we have a
> gralloc somewhere that works with open driver stacks and uses this?

So this is still early RFC, but I've added support to the HiKey960
gralloc, and have pending patches (following DRM rules) I pushed here:
  https://android-review.googlesource.com/c/device/linaro/hikey/+/1399519

And avoiding the cache syncing overhead improves performance nicely on
that board.

There is also work in progress to change the codec2 implementation in
AOSP (which uses ion directly), to move over to DMA BUF heaps and as
it used the !ION_FLAG_CACHED case there this heap would be useful to
match ION's functionality.

The latest patches for that are here:
https://android-review.googlesource.com/c/platform/frameworks/av/+/1360640
(though I'm expecting a deeper rework on those)

thanks
-john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
