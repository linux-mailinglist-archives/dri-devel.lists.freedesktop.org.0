Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0BA3C6373
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:14:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C22889CAF;
	Mon, 12 Jul 2021 19:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C0889CAF
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 19:14:42 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q16so9153037lfa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 12:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/rM+aoSbmTqJDqFPwIB6NFP4YePrQAdzLRW/vT9PMLI=;
 b=R5bRUKi0sBMrWMFjTDrfEVpFQCedcMn2pFztQ0BTYyXRN1kiL63+eWT1lMJ9Vdg/Mi
 PfNutfK/HGWPYbqAx8LPAIFLPl+yTLxfqZ0NccuCqSljXZZ3T+iv0mpXMxfLkBKcKuxb
 uwplwVJ+fi/9Y3oHlYYo/pJ8JQZPRqdkmLln8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/rM+aoSbmTqJDqFPwIB6NFP4YePrQAdzLRW/vT9PMLI=;
 b=N4tKME9CKOjdKpjW8R/0+Ydth5GyRrjWkhwIQJNsDEdXBBfK3cbu79W5vowy6QR79u
 D1rQxI82OW7gQyhv4WAPbXx+BfDO7GW432CFILWWEYkspxazNFLHU4qC0pfx92/q0S2f
 OUZG8X9vCTs7QUkdlTqrsWIKS/huIBwFWZiO3xljbSrdMljyCC7/740+tGFLOG2qBRom
 wFoAnss4rJS4yMJLNkvwmMi2E4I+AhzR+DBWBzkzi4wJ6iuhk8C3zm+eZmUiQpuGsvRa
 cYxPEQBnnPjEg/aycUv9E81iZ+5L15rbWsySgWE4ZiZnatAdxJXwwOKxWjjCwxxp8kf3
 B8uw==
X-Gm-Message-State: AOAM533+T5/sNk9vhAHHgjcaMq3ZeMsskMDZU+t+Z60V/mvRJf6uYF2J
 Xm4H9Q5yBvHBWfwF+vsH6k6eP8pENJJ4uQn+
X-Google-Smtp-Source: ABdhPJytkhRj6nlV0f2mH6/DnC96nu1NggIsl4g/If+ZkjftkaFaY78Axg/7pbqrUmS3d6WdN9p5eA==
X-Received: by 2002:a05:6512:400c:: with SMTP id
 br12mr245111lfb.268.1626117280913; 
 Mon, 12 Jul 2021 12:14:40 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id q15sm1772909ljg.126.2021.07.12.12.14.40
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 12:14:40 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id a12so301406lfb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 12:14:40 -0700 (PDT)
X-Received: by 2002:ac2:42d6:: with SMTP id n22mr217501lfl.41.1626117280288;
 Mon, 12 Jul 2021 12:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wjB5XBk4obhMPfrU3mnOakV9VgHAYOo-ZGJnB2X0DnBWA@mail.gmail.com>
 <a9473821-1d53-0037-7590-aeaf8e85e72a@jonmasters.org>
In-Reply-To: <a9473821-1d53-0037-7590-aeaf8e85e72a@jonmasters.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 12 Jul 2021 12:14:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh0mRAyL9GNVjhw2ki7vRevvUnovCzawn2FO7e_dOfU-w@mail.gmail.com>
Message-ID: <CAHk-=wh0mRAyL9GNVjhw2ki7vRevvUnovCzawn2FO7e_dOfU-w@mail.gmail.com>
Subject: Re: Linux 5.14-rc1
To: Jon Masters <jcm@jonmasters.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 12:08 AM Jon Masters <jcm@jonmasters.org> wrote:
>
> I happened to be installing a Fedora 34 (x86) VM for something and did a
> test kernel compile that hung on boot. Setting up a serial console I get
> the below backtrace from ttm but I have not had chance to look at it.

It's a NULL pointer in qxl_bo_delete_mem_notify(), with the code
disassembling to

  16: 55                    push   %rbp
  17: 48 89 fd              mov    %rdi,%rbp
  1a: e8 a2 02 00 00        callq  0x2c1
  1f: 84 c0                test   %al,%al
  21: 74 0d                je     0x30
  23: 48 8b 85 68 01 00 00 mov    0x168(%rbp),%rax
  2a:* 83 78 10 03          cmpl   $0x3,0x10(%rax) <-- trapping instruction
  2e: 74 02                je     0x32
  30: 5d                    pop    %rbp
  31: c3                    retq

and that "cmpl $3" looks exactly like that

        if (bo->resource->mem_type == TTM_PL_PRIV

and the bug is almost certainly from commit d3116756a710 ("drm/ttm:
rename bo->mem and make it a pointer"), which did

-       if (bo->mem.mem_type == TTM_PL_PRIV ...
+       if (bo->resource->mem_type == TTM_PL_PRIV ...

and claimed "No functional change".

But clearly the "bo->resource" pointer is NULL.

Added guilty parties and dri-devel mailing list.

Christian? Full report at

   https://lore.kernel.org/lkml/a9473821-1d53-0037-7590-aeaf8e85e72a@jonmasters.org/

but there's not a whole lot else there that is interesting except for
the call trace:

  ttm_bo_cleanup_memtype_use+0x22/0x60 [ttm]
  ttm_bo_release+0x1a1/0x300 [ttm]
  ttm_bo_delayed_delete+0x1be/0x220 [ttm]
  ttm_device_delayed_workqueue+0x18/0x40 [ttm]
  process_one_work+0x1ec/0x390
  worker_thread+0x53/0x3e0

so it's presumably the cleanup phase and perhaps "bo->resource" has
been deallocated and cleared?

                  Linus
