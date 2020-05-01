Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 898EF1C0C36
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 04:38:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA386E200;
	Fri,  1 May 2020 02:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F17B6E200
 for <dri-devel@lists.freedesktop.org>; Fri,  1 May 2020 02:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588300706;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=iDuSKx6wUSQHiVhDo3SnlmiOzi51Bn9nmlQYnDXQfttTwFFQKD/Tzu+sRC57qfdxb4MmCf
 hdGbRQ05lg6QDGAC0/OhfXO8zQ3btV4bwwziVkV5YKATwtsFzxRfMJk+BDmV1WcAzGlQCE
 DO8DadEG1afNmalt6kzNJo94jOTRrxk=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-VEb0kuXJM5iPhGfacczs5w-1; Thu, 30 Apr 2020 22:38:22 -0400
X-MC-Unique: VEb0kuXJM5iPhGfacczs5w-1
Received: by mail-vk1-f197.google.com with SMTP id j206so4154371vke.11
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 19:38:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P8k2aTeCbIA0Pe5nqRNlnguJBbZob6iEKj+wNv40n6s=;
 b=VGTNIpH9v+6KqsfJFzMeBFzuaU5mpOoeT0hQAJUZq45ylAaAHzxd5i8cyExKbd4/p1
 FZmJz7re+SmElS+B752IPik0K3iSIVbf4qoML35iKfA//5e2RO2g3ajqcwTBn+yU75DD
 x7G8isdCfWz5/yFLVRa3gomg1CXr+Rc+/jjRg5mYeZerVt7+sfvcPhgPTUMD6m8goilR
 8qWpHC6bnBrGjk+Ce9LZezvHI1TACGxFNI9KYPz5ldRIHUrpUDBYV0zuhAs8QGox5YCp
 ov6IcKXhLFKmoR+KT+/m4cEC2btHdALPgzkKiRZphk7fV35tg0HBhZcxlXYUAG3xZglU
 ZMqw==
X-Gm-Message-State: AGi0PuZaRRKWA1f0lIkQ+8aBUlhNT6BYspk4DB+p2FzyyVAt1k1kKDk7
 6NdEL1leWavvmhj8y5VHKBX33iHcAyM/SR2s0JFX1YoK9RWK8z07bkiRIwKUHSEhNCFKpCsLmo/
 rCB8ti0pP2lrNl4nRt1vg+sC8qyf6cRHrjvLw5IvzhHo8
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr1848882vsp.198.1588300701704; 
 Thu, 30 Apr 2020 19:38:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKu6ClZ61atP80MD4lQJkn2FtP3gZkiC+YuTXU2rwKV21SshkG1nW93zQxISm3Y7jRVOl6JpuyIYF8Yu55j3FA=
X-Received: by 2002:a05:6102:4d:: with SMTP id
 k13mr1848869vsp.198.1588300701546; 
 Thu, 30 Apr 2020 19:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-22-hch@lst.de>
 <20200414151344.zgt2pnq7cjq2bgv6@debian>
 <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
In-Reply-To: <CAMeeMh8Q3Od76WaTasw+BpYVF58P-HQMaiFKHxXbZ_Q3tQPZ=A@mail.gmail.com>
From: John Dorminy <jdorminy@redhat.com>
Date: Thu, 30 Apr 2020 22:38:10 -0400
Message-ID: <CAMeeMh_9N0ORhPM8EmkGeeuiDoQY3+QoAPX5QBuK7=gsC5ONng@mail.gmail.com>
Subject: Re: [PATCH 21/29] mm: remove the pgprot argument to __vmalloc
To: Wei Liu <wei.liu@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Michael Kelley <mikelley@microsoft.com>,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Stephen Hemminger <sthemmin@microsoft.com>, x86@kernel.org,
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>,
 Gao Xiang <xiang@kernel.org>, Laura Abbott <labbott@redhat.com>,
 Nitin Gupta <ngupta@vflare.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>> On Tue, Apr 14, 2020 at 03:13:40PM +0200, Christoph Hellwig wrote:
>> > The pgprot argument to __vmalloc is always PROT_KERNEL now, so remove
>> > it.

Greetings;

I recently noticed this change via the linux-next tree.

It may not be possible to edit at this late date, but the change
description refers to PROT_KERNEL, which is a symbol which does not
appear to exist; perhaps PAGE_KERNEL was meant? The mismatch caused me
and a couple other folks some confusion briefly until we decided it
was supposed to be PAGE_KERNEL; if it's not too late, editing the
description to clarify so would be nice.

Many thanks.

John Dorminy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
