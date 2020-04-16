Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C7B1AD161
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 22:43:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE4F6EB69;
	Thu, 16 Apr 2020 20:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958C96EB69
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 20:43:18 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id w11so2186497pga.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 13:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uRgyzvRokr7ai+Xbzs2rruJuXsUX0gI+b1jlIGwtZfU=;
 b=Oyt/oE4Ouu2LsqJ33+344yy9kTnzp8/CWBPr7eZxkvWVB8IZf0+J46FH47n3dNy47b
 kice3lT1TD1ImxQCmYZXk7jvpWZg6z2mlPpY+Ys0QsgGXJZASv5HCmVZZlmcrHIT3Ph1
 RKXMfEG5U32cSw2YdADUYO/EfTtD9hhgBLJykOZsHZxahfZ5hvKGj73ZVuWHyjvAGPoR
 RHWgpNuleLC3zAE0hLLzQ7w33YGWM89r44CUTwO3o99AukFCQ236ORK+lQr8hmH9KMgP
 UlVILhg/WfSY98sw4aGVs5qRfCrdXOIUD0WC5/KQPrk9NkEuUE7EvhH2UBMwt4f/4YfC
 w6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=uRgyzvRokr7ai+Xbzs2rruJuXsUX0gI+b1jlIGwtZfU=;
 b=BbG/oM6UyPJo2EIzM57IXJBCZAYV06zxvhkLpSkUGhc5R39ygNEI3rEcSNbkIKUfWv
 9Ahn3Qy4GEdJDm3fnU4JhsMeKQN8ZjbHgBXuF4BS6MUolU8yuijaLuydJYEnbsIY6klf
 dIMY1kH4wbZiYhovQu1sDtCYqevhv55CFT3wnX3aWRud//rAbYTSEqQpaGJ/DLYHAila
 PUJOX9//uESHz503bOCIwg1odUZjXoMeCXacC5JDqCI7hVYnakBQafuWyPujrVdC0gKs
 GN2fGkqQmT/zHhqm1b2wCqTaRVtqpuMct1zJo+RGyPjTW+3moBsEe1hY/puL24YGrEhi
 CpLg==
X-Gm-Message-State: AGi0PuZSWfuSvhL4woEDGNH+sqhvi2lrh0GLc58t5T88NyuVwTqKxJq3
 0BsLCuGq4h3FeEaM0a7SAJk=
X-Google-Smtp-Source: APiQypIXiJO4KCjTGpKvDHmXGV5HxR6F5ChtTIbUrCsBU11gVwLi7psgN6LJANKPucmqiSohUc35Kg==
X-Received: by 2002:a65:611a:: with SMTP id z26mr3767121pgu.341.1587069797727; 
 Thu, 16 Apr 2020 13:43:17 -0700 (PDT)
Received: from google.com ([2601:647:4001:3000::50e3])
 by smtp.gmail.com with ESMTPSA id d8sm12215742pfd.159.2020.04.16.13.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 13:43:16 -0700 (PDT)
Date: Thu, 16 Apr 2020 13:43:14 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/29] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200416204314.GA59451@google.com>
References: <20200414131348.444715-1-hch@lst.de>
 <20200414131348.444715-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414131348.444715-12-hch@lst.de>
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
Cc: linux-hyperv@vger.kernel.org, sergey.senozhatsky.work@gmail.com,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, linaro-mm-sig@lists.linaro.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 14, 2020 at 03:13:30PM +0200, Christoph Hellwig wrote:
> This allows to unexport map_vm_area and unmap_kernel_range, which are
> rather deep internal and should not be available to modules, as they for
> example allow fine grained control of mapping permissions, and also
> allow splitting the setup of a vmalloc area and the actual mapping and
> thus expose vmalloc internals.
> 
> zsmalloc is typically built-in and continues to work (just like the
> percpu-vm code using a similar patter), while modular zsmalloc also
> continues to work, but must use copies.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Minchan Kim <minchan@kernel.org>

Thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
